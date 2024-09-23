@implementation PKACHBankCredentialPickerViewController

- (PKACHBankCredentialPickerViewController)initWithCurrentBankInformation:(id)a3 selectAction:(id)a4 cancelAction:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  PKACHBankCredentialPickerViewController *v12;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  v12 = (PKACHBankCredentialPickerViewController *)sub_19D612AD8(a3, (uint64_t)sub_19D22E97C, v9, (uint64_t)sub_19D266A30, v10);

  swift_release();
  swift_release();
  return v12;
}

- (PKACHBankCredentialPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s9PassKitUI37ACHBankCredentialPickerViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  PKACHBankCredentialPickerViewController *v2;

  v2 = self;
  sub_19D60C764();

}

- (void)viewWillLayoutSubviews
{
  PKACHBankCredentialPickerViewController *v2;

  v2 = self;
  sub_19D60CD40();

}

- (void)viewWillAppear:(BOOL)a3
{
  PKACHBankCredentialPickerViewController *v4;

  v4 = self;
  sub_19D60CE54(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ACHBankCredentialPickerViewController();
  v4 = (char *)v7.receiver;
  -[PKACHBankCredentialPickerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  v5 = &v4[OBJC_IVAR___PKACHBankCredentialPickerViewController_cancellables];
  swift_beginAccess();
  v6 = sub_19DE82F08();
  sub_19D60C1C0(v6);
  swift_bridgeObjectRelease();
  *(_QWORD *)v5 = MEMORY[0x1E0DEE9E8];

  swift_bridgeObjectRelease();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  char *v6;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ACHBankCredentialPickerViewController();
  v6 = (char *)v7.receiver;
  -[PKACHBankCredentialPickerViewController setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
  if (*(_QWORD *)&v6[OBJC_IVAR___PKACHBankCredentialPickerViewController_pickerViewState])
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_19DE82CB0();
    sub_19DE85260();
  }

}

- (PKACHBankCredentialPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKACHBankCredentialPickerViewController_hostingVC));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKACHBankCredentialPickerViewController_addCredentialHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKACHBankCredentialPickerViewController_editCredentialHandler));
  swift_bridgeObjectRelease();
}

@end
