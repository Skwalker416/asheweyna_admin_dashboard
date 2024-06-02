import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/category.dart';
import '../../../models/User_s.dart';
import '../../../services/http_services.dart';

class UsersProvider extends ChangeNotifier {
  HttpService service = HttpService();
  final DataProvider _dataProvider;

  final addUsersFormKey = GlobalKey<FormState>();
  TextEditingController usersNameCtrl = TextEditingController();
  Category? selectedCategory;
  Users? usersForUpdate;

  UsersProvider(this._dataProvider);

  //TODO: should complete addUsers

  //TODO: should complete updateUsers

  //TODO: should complete submitUsers

  //TODO: should complete deleteUsers

  setDataForUpdateCategory(Users? users) {
    if (users != null) {
      usersForUpdate = users;
      usersNameCtrl.text = users.name ?? '';
      selectedCategory = _dataProvider.categories
          .firstWhereOrNull((element) => element.sId == users.categoryId?.sId);
    } else {
      clearFields();
    }
  }

  clearFields() {
    usersNameCtrl.clear();
    selectedCategory = null;
    usersForUpdate = null;
  }

  updateUi() {
    notifyListeners();
  }
}
