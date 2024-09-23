@implementation CRLiOSAppDelegate

+ (_TtC8Freeform17CRLiOSAppDelegate)shared
{
  id v2;
  id v3;
  _TtC8Freeform17CRLiOSAppDelegate *result;
  uint64_t v5;

  v2 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v3 = objc_msgSend(v2, "delegate");

  if (v3)
  {
    v5 = type metadata accessor for CRLiOSAppDelegate();
    return (_TtC8Freeform17CRLiOSAppDelegate *)(id)swift_dynamicCastClassUnconditional(v3, v5, 0, 0, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  return sub_1006085A0(self, (uint64_t)a2, a3, (uint64_t)a4, sub_10060AA6C);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return sub_1006085A0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_10060AF24);
}

- (void)applicationDidEnterBackground
{
  _TtC8Freeform17CRLiOSAppDelegate *v2;

  v2 = self;
  sub_100608650();

}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  _TtC8Freeform17CRLiOSAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10060BFD0();

}

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC8Freeform17CRLiOSAppDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100608CD8(a3);
  swift_unknownObjectRelease(a3);

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8Freeform17CRLiOSAppDelegate *v11;
  id v12;
  id v13;
  NSString v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, "role");
  v13 = objc_allocWithZone((Class)UISceneConfiguration);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithName:sessionRole:", v14, v12);

  return v15;
}

- (_TtC8Freeform17CRLiOSAppDelegate)init
{
  return (_TtC8Freeform17CRLiOSAppDelegate *)sub_10060A3A8();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_boardLibraryCommandController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_boardPreviewImageCache));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_stencilLibrary));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_applicationCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_iCloudStatus));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_sharedBoardThumbnailManager));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_spotlightManager));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_syncDriver));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_sharingExtensionImporter));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSAppDelegate_autoFillMenuIdentifier));
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8Freeform17CRLiOSAppDelegate *v12;
  char v13;
  char v14;

  v5 = a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a3;
  v12 = self;
  sub_1008B6F88(a3, v8, v10, (uint64_t)v5);
  v14 = v13;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14 & 1;
}

@end
