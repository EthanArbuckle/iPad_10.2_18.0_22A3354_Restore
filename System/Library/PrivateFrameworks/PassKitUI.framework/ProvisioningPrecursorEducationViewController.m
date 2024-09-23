@implementation ProvisioningPrecursorEducationViewController

- (void)loadView
{
  _TtC9PassKitUI44ProvisioningPrecursorEducationViewController *v2;

  v2 = self;
  sub_19D3195B4();

}

- (_TtC9PassKitUI44ProvisioningPrecursorEducationViewController)initWithContext:(int64_t)a3
{
  _TtC9PassKitUI44ProvisioningPrecursorEducationViewController *result;

  result = (_TtC9PassKitUI44ProvisioningPrecursorEducationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_precursorRequest));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_delegate);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  id v10;
  _TtC9PassKitUI44ProvisioningPrecursorEducationViewController *v11;

  v5 = MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI44ProvisioningPrecursorEducationViewController_delegate, a2);
  if (v5)
  {
    v6 = v5;
    v7 = v5 + OBJC_IVAR____TtC9PassKitUI38ProvisioningPrecursorEducationFlowItem_delegate;
    if (MEMORY[0x1A1AE6A68](v5 + OBJC_IVAR____TtC9PassKitUI38ProvisioningPrecursorEducationFlowItem_delegate))
    {
      v8 = *(_QWORD *)(v7 + 8);
      ObjectType = swift_getObjectType();
      v10 = a3;
      v11 = self;
      sub_19D789E94(v6, (uint64_t)&off_1E3E501B0, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  id v4;
  void *v5;
  _TtC9PassKitUI44ProvisioningPrecursorEducationViewController *v6;

  v6 = self;
  v4 = -[ProvisioningPrecursorEducationViewController view](v6, sel_view);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);

    -[PKExplanationViewController showSpinner:](v6, sel_showSpinner_, 1);
  }
  else
  {
    __break(1u);
  }
}

@end
