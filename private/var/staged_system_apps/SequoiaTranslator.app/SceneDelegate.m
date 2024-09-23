@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC17SequoiaTranslator13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100155DBC(v8, v10);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100157004();

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100157190();

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator13SceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1001572AC();

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC17SequoiaTranslator13SceneDelegate *v11;

  v7 = sub_10000A05C(0, &qword_100295430, UIOpenURLContext_ptr);
  v8 = sub_100065E60((unint64_t *)&unk_100295438, &qword_100295430, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_1001573E4(v9);

  swift_bridgeObjectRelease();
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v9;
  id v10;
  _TtC17SequoiaTranslator13SceneDelegate *v11;

  v9 = a3;
  swift_unknownObjectRetain(a4);
  v10 = a6;
  v11 = self;
  sub_100157604(v9);

  swift_unknownObjectRelease(a4);
}

- (_TtC17SequoiaTranslator13SceneDelegate)init
{
  return (_TtC17SequoiaTranslator13SceneDelegate *)sub_10014EB54();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_context));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_sceneContext));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_sharedTranslationOptions));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate_store));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate____lazy_storage___translationSession));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate____lazy_storage___favoritesImporter));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator13SceneDelegate____lazy_storage___sessionManager));
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC17SequoiaTranslator13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100150CBC(v6, v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC17SequoiaTranslator13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001576C4(v6);

}

- (void)sceneDidDisconnect:
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v1 = objc_msgSend(v0, "delegate");

  if (v1)
  {
    v2 = type metadata accessor for AppDelegate();
    v3 = swift_dynamicCastClass(v1, v2);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_interruptionController);
      swift_retain(v4);
      swift_unknownObjectRelease(v1);
      if (v4)
      {
        *(_QWORD *)(v4 + 24) = 0;
        swift_unknownObjectWeakAssign(v4 + 16, 0);
        swift_release(v4);
      }
    }
    else
    {
      swift_unknownObjectRelease(v1);
    }
  }
}

@end
