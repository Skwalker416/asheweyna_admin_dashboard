import '../../../models/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/User_s.dart';
import '../../../services/http_services.dart';

class VendorProvider extends ChangeNotifier {
  HttpService service = HttpService();
  final DataProvider _dataProvider;

  final addVendorFormKey = GlobalKey<FormState>();
  TextEditingController vendorNameCtrl = TextEditingController();
  Users? selectedUsers;
  Vendor? vendorForUpdate;

  VendorProvider(this._dataProvider);

  //TODO: should complete addVendor

  //TODO: should complete updateVendor

  //TODO: should complete submitVendor

  //TODO: should complete deleteVendor

  //? set data for update on editing
  setDataForUpdateVendor(Vendor? vendor) {
    if (vendor != null) {
      vendorForUpdate = vendor;
      vendorNameCtrl.text = vendor.name ?? '';
      selectedUsers = _dataProvider.subCategories
          .firstWhereOrNull((element) => element.sId == vendor.userId?.sId);
    } else {
      clearFields();
    }
  }

  //? to clear text field and images after adding or update vendor
  clearFields() {
    vendorNameCtrl.clear();
    selectedUsers = null;
    vendorForUpdate = null;
  }

  updateUI() {
    notifyListeners();
  }
}
