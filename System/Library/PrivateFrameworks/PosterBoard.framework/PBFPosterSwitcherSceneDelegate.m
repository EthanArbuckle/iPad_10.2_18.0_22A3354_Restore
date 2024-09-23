@implementation PBFPosterSwitcherSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (PBFPosterRackCollectionViewController)posterRackViewController
{
  void *v2;
  PBFPosterSwitcherSceneDelegate *v3;
  PBFPosterSwitcherSceneDelegate *v4;
  PBFPosterSwitcherSceneDelegate *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_window);
  if (!v2)
    goto LABEL_5;
  v3 = self;
  v4 = (PBFPosterSwitcherSceneDelegate *)objc_msgSend(v2, sel_rootViewController);
  if (!v4
    || (v5 = v4,
        type metadata accessor for PosterRackCollectionViewController(),
        v6 = (void *)swift_dynamicCastClass(),
        v3,
        v3 = v5,
        !v6))
  {

LABEL_5:
    v6 = 0;
  }
  return (PBFPosterRackCollectionViewController *)v6;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  PBFPosterSwitcherSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1CBAF0C00(v8);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  PBFPosterSwitcherSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1CBAF0EB4();

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  PBFPosterSwitcherSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1CBAF1000();

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  PBFPosterSwitcherSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1CBAEF824();

}

- (void)sceneWillResignActive:(id)a3
{
  uint64_t v3;
  void *v4;
  id v6;
  PBFPosterSwitcherSceneDelegate *v7;

  v3 = OBJC_IVAR___PBFPosterSwitcherSceneDelegate_switcherInUseAssertion;
  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_switcherInUseAssertion);
  if (v4)
  {
    v6 = a3;
    v7 = self;
    objc_msgSend(v4, sel_invalidate);
    *(Class *)((char *)&self->super.super.isa + v3) = 0;

    swift_unknownObjectRelease();
  }
}

- (PBFPosterSwitcherSceneDelegate)init
{
  return (PBFPosterSwitcherSceneDelegate *)sub_1CBAEEE84();
}

- (PBFPosterSwitcherSceneDelegate)initWithScene:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBAF10F0();
}

- (UIScene)_scene
{
  return (UIScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR___PBFPosterSwitcherSceneDelegate__scene));
}

- (void)_setScene:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate__scene);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PBFPosterSwitcherSceneDelegate__scene) = (Class)a3;
  v3 = a3;

}

- (id)_settingsDiffActionsForScene:(id)a3
{
  return sub_1CBAEF038(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED89A4F0);
}

- (id)_actionHandlersForScene:(id)a3
{
  return sub_1CBAEF038(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED89A4E8);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PBFPosterSwitcherSceneDelegate *v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  sub_1CBAF120C(a4, (unint64_t)a5, (uint64_t)a6, a7);

}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  PBFPosterSwitcherSceneDelegate *v14;
  void *v15;

  sub_1CBAEE3F0(0, &qword_1ED89A590);
  sub_1CBAF2060(&qword_1ED89A598, &qword_1ED89A590);
  v10 = sub_1CBB82640();
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_1CBAF1C9C(v10);

  swift_bridgeObjectRelease();
  v15 = (void *)sub_1CBB82634();
  swift_bridgeObjectRelease();
  return v15;
}

- (void)windowDidAttachContext:(id)a3
{
  sub_1CBAEF5E0(self, (uint64_t)a2, (uint64_t)a3, sub_1CBAEF278);
}

- (void)windowDidDetachContext:(id)a3
{
  sub_1CBAEF5E0(self, (uint64_t)a2, (uint64_t)a3, sub_1CBAEF42C);
}

- (void)dataStoreDidTearDown
{
  uint64_t v3;
  void *v4;
  PBFPosterSwitcherSceneDelegate *v5;
  _QWORD v6[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v6[4] = sub_1CBAEFFEC;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1CBB0CA34;
  v6[3] = &block_descriptor_32;
  v4 = _Block_copy(v6);
  v5 = self;
  swift_release();
  BSDispatchMain();
  _Block_release(v4);

}

- (PBFExtensionTestingViewController)posterExtensionTestingViewController
{
  PBFPosterSwitcherSceneDelegate *v2;
  void *v3;

  v2 = self;
  v3 = sub_1CBAEFAA4();

  return (PBFExtensionTestingViewController *)v3;
}

- (void)setPosterExtensionTestingViewController:(id)a3
{
  void *v3;
  id v4;

  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___posterExtensionTestingViewController);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___posterExtensionTestingViewController) = (Class)a3;
  v4 = a3;
  sub_1CBAEFF18(v3);
}

- (void)debugGestureWasTriggered
{
  PBFPosterSwitcherSceneDelegate *v2;

  v2 = self;
  sub_1CBAEFCD8();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___sceneSettingsDiffInspector));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PBFPosterSwitcherSceneDelegate_extensionTestingViewController));
  sub_1CBAEFF18(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR___PBFPosterSwitcherSceneDelegate____lazy_storage___posterExtensionTestingViewController));
}

@end
