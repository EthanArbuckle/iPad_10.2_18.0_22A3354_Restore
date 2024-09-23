@implementation ProvisioningDeviceFullFlowItem

- (_TtC9PassKitUI30ProvisioningDeviceFullFlowItem)init
{
  _TtC9PassKitUI30ProvisioningDeviceFullFlowItem *result;

  result = (_TtC9PassKitUI30ProvisioningDeviceFullFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningDeviceFullFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)selectPassesViewController:(id)a3 didSelectPasses:(id)a4 completion:(id)a5
{
  void (*v8)(_QWORD);
  uint64_t v9;
  id v10;
  _TtC9PassKitUI30ProvisioningDeviceFullFlowItem *v11;

  v8 = (void (*)(_QWORD))_Block_copy(a5);
  if (a4)
  {
    sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4B89F0);
    a4 = (id)sub_19DE87E10();
  }
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (void (*)(_QWORD))sub_19D266A30;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_19D7AFDB8((unint64_t)a4, v8, v9);
  sub_19D1A9F60((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)selectPassesViewControllerDidTapBackButton:(id)a3
{
  id v4;
  _TtC9PassKitUI30ProvisioningDeviceFullFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D7B0228();

}

@end
