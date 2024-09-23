@implementation ContactPickerController.Coordinator

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  sub_19D6A19DC(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id))sub_19D6A1AA8);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  sub_19D6A19DC(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id))sub_19D6A1D50);
}

- (void)contactPickerDidCancel:(id)a3
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtCV9PassKitUI23ContactPickerController11Coordinator)init
{
  _TtCV9PassKitUI23ContactPickerController11Coordinator *result;

  result = (_TtCV9PassKitUI23ContactPickerController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
