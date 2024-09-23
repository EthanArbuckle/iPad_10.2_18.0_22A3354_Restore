@implementation CRLUSDRendererExtensionShared.AsyncRendererReceiverProxy

- (void)getUUID:(id)a3
{
  void *v4;
  _TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1006DBBA8((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)loadScene:(id)a3 response:(id)a4
{
  sub_1006D6E74(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1006DBE58);
}

- (void)updateScene:(id)a3 response:(id)a4
{
  sub_1006D6E74(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1006DC068);
}

- (void)performActions:(id)a3 response:(id)a4
{
  sub_1006D6E74(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1006DC278);
}

- (void)takeSnapshotAt:(float)a3 response:(id)a4
{
  void *v6;
  _TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1006DC488((uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v6, a3);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy)init
{
  _TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *result;

  result = (_TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy *)_swift_stdlib_reportUnimplementedInitializer("Freeform.AsyncRendererReceiverProxy", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtCO8Freeform29CRLUSDRendererExtensionShared26AsyncRendererReceiverProxy_renderer);
}

@end
