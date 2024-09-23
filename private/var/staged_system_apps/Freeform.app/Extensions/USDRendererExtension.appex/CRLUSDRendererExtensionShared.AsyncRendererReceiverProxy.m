@implementation CRLUSDRendererExtensionShared.AsyncRendererReceiverProxy

- (void)getUUID:(id)a3
{
  void *v4;
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100013EF8((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)loadScene:(id)a3 response:(id)a4
{
  sub_10000F784(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_100014198);
}

- (void)updateScene:(id)a3 response:(id)a4
{
  sub_10000F784(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1000143A8);
}

- (void)performActions:(id)a3 response:(id)a4
{
  sub_10000F784(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1000145B8);
}

- (void)takeSnapshotAt:(float)a3 response:(id)a4
{
  void *v6;
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1000147C8((uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v6, a3);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy)init
{
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *result;

  result = (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *)_swift_stdlib_reportUnimplementedInitializer("USDRendererExtension.AsyncRendererReceiverProxy", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100015698((uint64_t)self+ OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer);
}

@end
