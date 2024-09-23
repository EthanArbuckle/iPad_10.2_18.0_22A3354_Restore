@implementation ProvisioningCarPairingPinCodeViewController

- (void)viewDidLoad
{
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v2;

  v2 = self;
  sub_19D54428C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[ProvisioningCarPairingPinCodeViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_pinCodeView];
  if (v5)
    objc_msgSend(v5, sel_becomeFirstResponder, v6.receiver, v6.super_class);

}

- (void)loadView
{
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v2;

  v2 = self;
  sub_19D54455C();

}

- (void)viewWillLayoutSubviews
{
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v2;

  v2 = self;
  sub_19D544CB4();

}

- (void)doneButtonPressed
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v7;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_delegate;
  swift_unknownObjectUnownedLoadStrong();
  v4 = *((_QWORD *)v3 + 1);
  ObjectType = swift_getObjectType();
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v7 = self;
  v6(ObjectType, v4);

  swift_unknownObjectRelease();
}

- (void)keyboardDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v4 = sub_19DE833D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE833B8();
  v9 = self;
  v10 = -[ProvisioningCarPairingPinCodeViewController view](v9, sel_view);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_setNeedsLayout);

    v12 = -[ProvisioningCarPairingPinCodeViewController view](v9, sel_view);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, sel_layoutIfNeeded);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController)initWithContext:(int64_t)a3
{
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *result;

  result = (_TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_credential));
  sub_19D2E7A50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_pinCodeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_helpLabel));
}

- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4
{
  id v7;
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v8;

  v7 = a3;
  v8 = self;
  sub_19D5450A8(a3, a4);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (uint64_t)explanationViewControllerDidSelectCancel:(void *)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  char *v10;

  v5 = &a1[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController_delegate];
  swift_unknownObjectUnownedLoadStrong();
  v6 = *((_QWORD *)v5 + 1);
  ObjectType = swift_getObjectType();
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v9 = a3;
  v10 = a1;
  v8(ObjectType, v6);

  return swift_unknownObjectRelease();
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  _TtC9PassKitUI43ProvisioningCarPairingPinCodeViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = -[ProvisioningCarPairingPinCodeViewController view](v7, sel_view);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setUserInteractionEnabled_, v4 ^ 1);

    -[PKExplanationViewController showSpinner:](v7, sel_showSpinner_, v4);
  }
  else
  {
    __break(1u);
  }
}

@end
