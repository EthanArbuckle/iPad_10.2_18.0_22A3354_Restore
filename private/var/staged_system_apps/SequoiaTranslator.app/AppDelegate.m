@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC17SequoiaTranslator11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10000A518();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10000A440();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v6;
  _TtC17SequoiaTranslator11AppDelegate *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;

  v6 = a3;
  v7 = self;
  if (!a4)
    goto LABEL_7;
  v8 = a4;
  v9 = objc_msgSend(v8, "rootViewController");
  if (!v9)
    goto LABEL_7;
  v10 = v9;
  v11 = objc_opt_self(UITabBarController);
  v12 = (void *)swift_dynamicCastObjCClass(v10, v11);
  if (!v12)
  {

    goto LABEL_7;
  }
  v13 = objc_msgSend(v12, "selectedIndex");

  if (v13 != (id)1)
  {
LABEL_7:
    v14 = *(unint64_t *)((char *)&v7->super.super.isa
                              + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_orientationLock);
    goto LABEL_8;
  }
  v14 = 26;
  a4 = v8;
LABEL_8:

  return v14;
}

- (_TtC17SequoiaTranslator11AppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_interruptionController) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_orientationLock) = (Class)26;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator11AppDelegate_interruptionController));
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  _TtC17SequoiaTranslator11AppDelegate *v13;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = a3;
  v13 = self;
  LOBYTE(v8) = sub_10000F15C(v12, v8, v10, v11);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v11);
  return v8 & 1;
}

@end
