@implementation ProvisioningManualEntryViewController

- (_TtC9PassKitUI37ProvisioningManualEntryViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_coordinator) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_showTapToProvisionButton) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_showCameraCaptureButton) = 0;
  v4 = a3;

  result = (_TtC9PassKitUI37ProvisioningManualEntryViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v2;

  v2 = self;
  sub_19D637534();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  -[PKPaymentSetupFieldsViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_reporter];
  if (!v5)
    goto LABEL_4;
  v6 = PKSecureElementPassProductTypeAnalyticsDescriptor();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, sel_setProductType_subtype_, v6, 0, v8.receiver, v8.super_class);

LABEL_4:
    objc_msgSend(v5, sel_reportViewAppeared, v8.receiver, v8.super_class);

    return;
  }
  __break(1u);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[ProvisioningManualEntryViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingFromParentViewController, v6.receiver, v6.super_class))
  {
    v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_reporter];
    if (v5)
      objc_msgSend(v5, sel_resetProductTypes);
  }

}

- (void)_skipCardButtonPressed
{
  void *v2;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_coordinator);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    sub_19D75A530();

  }
}

- (void)_tapToProvisionButtonPressed
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v7;

  Strong = swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    v4 = Strong;
    v5 = MEMORY[0x1A1AE6A68](Strong + OBJC_IVAR____TtC9PassKitUI31ProvisioningManualEntryFlowItem_managingSection);
    if (v5)
    {
      v6 = v5;
      v7 = self;
      sub_19D639724(v4, 2u, v6);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC9PassKitUI37ProvisioningManualEntryViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7;
  id v8;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *result;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a6;
  result = (_TtC9PassKitUI37ProvisioningManualEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_19D2E7A50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_reporter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_coordinator));
}

- (id)visibleFieldIdentifiers
{
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = sub_19D637B50();

  if (v3)
  {
    v4 = (void *)sub_19DE87DF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)handleNextButtonTapped:(id)a3
{
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v4;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19DE8868C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_19D637E5C();

  sub_19D2BAA1C((uint64_t)v6);
}

- (id)defaultHeaderViewTitle
{
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v2;
  void *v3;

  v2 = self;
  sub_19D637F60();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_19DE87BD0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_19D637F60();
  v4 = v3;

  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = (void *)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)defaultFields
{
  void *v3;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultPaymentSetupProvisioningFields);
  if (v5)
  {
    v6 = v5;
    sub_19DE87E10();

    v7 = (void *)sub_19DE87DF8();
    swift_bridgeObjectRelease();
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

- (void)fieldCellEditableTextFieldValueDidChange:(id)a3
{
  id v5;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_19D63837C(a3);

}

- (BOOL)fieldCell:(id)a3 supportsKeyboardAccessory:(unint64_t)a4
{
  if (a4 == 1)
    return *((_BYTE *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI37ProvisioningManualEntryViewController_showCameraCaptureButton);
  else
    return 0;
}

- (void)fieldCell:(id)a3 didTapKeyboardAccessory:(unint64_t)a4
{
  id v5;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = self;
    sub_19D63854C();

  }
}

- (void)cameraCaptureViewController:(id)a3 didRecognizeObjects:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9PassKitUI37ProvisioningManualEntryViewController *v8;

  if (a4)
    v6 = sub_19DE87E10();
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_19D639408(a3, v6);

  swift_bridgeObjectRelease();
}

- (id)cameraCaptureViewControllerDidFail:(id)a3
{
  id result;

  if (a3)
    return objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
  __break(1u);
  return result;
}

- (void)cameraCaptureViewControllerDidSelectManualEntry:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)cameraCaptureViewControllerDidSelectTapToProvision:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

@end
