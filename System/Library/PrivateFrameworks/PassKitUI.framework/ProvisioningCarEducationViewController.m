@implementation ProvisioningCarEducationViewController

- (void)loadView
{
  _TtC9PassKitUI38ProvisioningCarEducationViewController *v2;

  v2 = self;
  sub_19D63A0B0();

}

- (_TtC9PassKitUI38ProvisioningCarEducationViewController)initWithContext:(int64_t)a3
{
  _TtC9PassKitUI38ProvisioningCarEducationViewController *result;

  result = (_TtC9PassKitUI38ProvisioningCarEducationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningCarEducationViewController_provisionedPasses));
  sub_19D2E7A50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningCarEducationViewController_delegate);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI38ProvisioningCarEducationViewController *v9;
  id v10;

  Strong = swift_unknownObjectUnownedLoadStrong();
  v5 = Strong + OBJC_IVAR____TtC9PassKitUI32ProvisioningCarEducationFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68](Strong + OBJC_IVAR____TtC9PassKitUI32ProvisioningCarEducationFlowItem_delegate))
  {
    v6 = *(_QWORD *)(v5 + 8);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94(Strong, (uint64_t)&off_1E3E31040, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
    v10 = a3;
  }
  swift_unknownObjectRelease();

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  _TtC9PassKitUI38ProvisioningCarEducationViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = -[ProvisioningCarEducationViewController view](v7, sel_view);
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
