import '../../../models/User_s.dart';
import '../provider/Vendor_s_provider.dart';
import '../../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../models/vendor.dart';
import '../../../utility/constants.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_field.dart';

class VendorSubmitForm extends StatelessWidget {
  final Vendor? vendor;

  const VendorSubmitForm({super.key, this.vendor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    context.vendorProvider.setDataForUpdateVendor(vendor);
    return SingleChildScrollView(
      child: Form(
        key: context.vendorProvider.addVendorFormKey,
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
                    child: Consumer<VendorProvider>(
                      builder: (context, vendorProvider, child) {
                        return CustomDropdown(
                          initialValue: vendorProvider.selectedUsers,
                          items: context.dataProvider.subCategories,
                          hintText: vendorProvider.selectedUsers?.name ??
                              'Select Users',
                          displayItem: (Users? users) => users?.name ?? '',
                          onChanged: (newValue) {
                            vendorProvider.selectedUsers = newValue;
                            vendorProvider.updateUI();
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a Users';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: context.vendorProvider.vendorNameCtrl,
                      labelText: 'Vendor Name',
                      onSave: (val) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a vendor name';
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
                  SizedBox(width: defaultPadding),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      // Validate and save the form
                      if (context.vendorProvider.addVendorFormKey.currentState!
                          .validate()) {
                        context.vendorProvider.addVendorFormKey.currentState!
                            .save();
                        //TODO: should complete call submitVendor
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
void showVendorForm(BuildContext context, Vendor? vendor) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Add Vendor'.toUpperCase(),
                style: TextStyle(color: primaryColor))),
        content: VendorSubmitForm(
          vendor: vendor,
        ),
      );
    },
  );
}
