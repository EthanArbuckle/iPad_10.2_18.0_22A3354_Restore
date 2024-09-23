@implementation SSKSceneHostingDisplayControllerAdapter

- (CADisplay)caDisplay
{
  return (CADisplay *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplay));
}

- (SSKSceneHostingDisplayControllerAdapter)initWithConfiguration:(id)a3 displayIdentity:(id)a4 displayConfiguration:(id)a5 updateTransformsAdapter:(id)a6
{
  return (SSKSceneHostingDisplayControllerAdapter *)SceneHostingDisplayControllerAdapter.init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(a3, a4, a5, a6);
}

- (SSKSceneHostingDisplayControllerAdapter)init
{
  SSKSceneHostingDisplayControllerAdapter *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation) = 0;

  result = (SSKSceneHostingDisplayControllerAdapter *)sub_246018070();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_updateTransformsAdapter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation));
  swift_release();
  swift_release();
  swift_release();
}

- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  void (**v9)(void *, _QWORD, void *);
  void *v10;
  id v11;
  id v12;
  void *v13;
  SSKSceneHostingDisplayControllerAdapter *v14;

  v9 = (void (**)(void *, _QWORD, void *))_Block_copy(a6);
  sub_246014A68();
  v10 = (void *)swift_allocError();
  v11 = a3;
  v12 = a4;
  swift_unknownObjectRetain();
  v14 = self;
  v13 = (void *)sub_246017C74();
  v9[2](v9, 0, v13);

  _Block_release(v9);
  swift_unknownObjectRelease();

}

- (void)workspace:(id)a3 didReceiveScene:(id)a4 withContext:(id)a5 fromProcess:(id)a6
{
  id v10;
  id v11;
  id v12;
  SSKSceneHostingDisplayControllerAdapter *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  swift_unknownObjectRetain();
  v13 = self;
  sub_246014AAC(v11, (uint64_t)a6);

  swift_unknownObjectRelease();
}

- (void)displayDisconnected:(id)a3
{
  id v4;
  SSKSceneHostingDisplayControllerAdapter *v5;

  v4 = a3;
  v5 = self;
  _s13ShellSceneKit0B31HostingDisplayControllerAdapterC19displayDisconnectedyySo18FBSDisplayIdentityCF_0();

}

- (void)gainedControl
{
  SSKSceneHostingDisplayControllerAdapter *v2;

  v2 = self;
  SceneHostingDisplayControllerAdapter.gainedControl()();

}

- (void)lostControl
{
  SSKSceneHostingDisplayControllerAdapter *v2;

  v2 = self;
  SceneHostingDisplayControllerAdapter.lostControl()();

}

@end
