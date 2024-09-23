@implementation ACHBankCredentialPickerViewController.EditCredentialHandler

- (void)bankAccountInformationViewControllerChangedBankAccountInformation:(id)a3
{
  id v4;
  _TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler *v5;

  v4 = a3;
  v5 = self;
  sub_19D6144D0(&OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_info, &OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_isUpdatingCredential, (uint64_t)&unk_1E3E47A60, (uint64_t)&unk_1EE4AD790);

}

- (_TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler)init
{
  _TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler *result;

  result = (_TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_info));
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCC9PassKitUI37ACHBankCredentialPickerViewControllerP33_99E507972D4AF6430472792CEB91E7A221EditCredentialHandler_ach;
  v4 = sub_19DE83154();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
}

@end
