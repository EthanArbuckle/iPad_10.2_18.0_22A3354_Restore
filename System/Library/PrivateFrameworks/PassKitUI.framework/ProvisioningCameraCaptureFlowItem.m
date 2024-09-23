@implementation ProvisioningCameraCaptureFlowItem

- (_TtC9PassKitUI33ProvisioningCameraCaptureFlowItem)init
{
  _TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *result;

  result = (_TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection);
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)cameraCaptureViewController:(id)a3 didRecognizeObjects:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *v8;
  id v9;

  if (a4)
    v6 = sub_19DE87E10();
  else
    v6 = 0;
  v7 = MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection);
  v9 = a3;
  if (v7)
  {
    v8 = self;
    sub_19D504D68((uint64_t)v8, v6, v7);

    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();

}

- (void)cameraCaptureViewControllerDidSelectManualEntry:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *v8;

  v5 = MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection, a2);
  if (v5)
  {
    v6 = v5;
    v7 = a3;
    v8 = self;
    sub_19D504D68((uint64_t)v8, 0, v6);

    swift_unknownObjectRelease();
  }
}

- (void)cameraCaptureViewControllerDidSelectSetupLater:(id)a3
{
  id v4;
  _TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D504E94();

}

- (void)cameraCaptureViewControllerDidSelectTapToProvision:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *v8;

  v5 = MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection, a2);
  if (v5)
  {
    v6 = v5;
    v7 = a3;
    v8 = self;
    sub_19D639638((uint64_t)v8, 2u, v6);

    swift_unknownObjectRelease();
  }
}

@end
