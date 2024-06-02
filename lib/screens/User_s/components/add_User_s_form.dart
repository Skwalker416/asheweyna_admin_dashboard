import '../../../models/User_s.dart';
import '../provider/sub_category_provider.dart';
import '../../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../models/category.dart';
import '../../../utility/constants.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_field.dart';

class UsersSubmitForm extends StatelessWidget {
  final Users? users;

  const UsersSubmitForm({super.key, this.users});

  @override
  Widget build(BuildContext context) {
    context.usersProvider.setDataForUpdateCategory(users);
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: context.usersProvider.addUsersFormKey,
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: Consumer<UsersProvider>(
                      builder: (context, subCatProvider, child) {
                        return CustomDropdown(
                          initialValue: subCatProvider.selectedCategory,
                          hintText: subCatProvider.selectedCategory?.name ??
                              'Select category',
                          items: context.dataProvider.categories,
                          displayItem: (Category? category) =>
                              category?.name ?? '',
                          onChanged: (newValue) {
                            if (newValue != null) {
                              subCatProvider.selectedCategory = newValue;
                              subCatProvider.updateUi();
                            }
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a category';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: context.usersProvider.usersNameCtrl,
                      labelText: 'Users Name',
                      onSave: (val) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a sub category name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Gap(defaultPadding * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: secondaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                    child: Text('Cancel'),
                  ),
                  Gap(defaultPadding),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      // Validate and save the form
                      if (context.usersProvider.addUsersFormKey.currentState!
                          .validate()) {
                        context.usersProvider.addUsersFormKey.currentState!
                            .save();
                        //TODO: should complete call submitUsers
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// How to show the category popup
void showAddUsersForm(BuildContext context, Users? users) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Add Users'.toUpperCase(),
                style: TextStyle(color: primaryColor))),
        content: UsersSubmitForm(users: users),
      );
    },
  );
}
