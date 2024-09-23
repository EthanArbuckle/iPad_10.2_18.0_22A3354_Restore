@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC7Measure11AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure11AppDelegate)init
{
  return (_TtC7Measure11AppDelegate *)sub_100022884();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate__appState));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure11AppDelegate_coordinator));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7Measure11AppDelegate____lazy_storage___perfTestRunner));
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC7Measure11AppDelegate *v11;
  char v12;
  char v13;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100023F08();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  sub_100023828(v10);
  v13 = v12;

  swift_bridgeObjectRelease(v4);
  return v13 & 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC7Measure11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100023B68();

}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  _TtC7Measure11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100023C9C();

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  _TtC7Measure11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100023D98();

}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v4;
  id v5;
  Swift::String v6;
  _TtC7Measure11AppDelegate *v7;

  v4 = qword_10047AA70;
  v5 = a3;
  v7 = self;
  if (v4 != -1)
    swift_once(&qword_10047AA70, sub_1000E13E4);
  v6._object = (void *)0x80000001003D8990;
  v6._countAndFlagsBits = 0xD000000000000019;
  Log.default(_:isPrivate:)(v6, 0);

}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC7Measure11AppDelegate *v6;
  Swift::String v7;
  uint64_t (*v8)(__n128);
  __n128 v9;
  uint64_t v10;
  __n128 v11;

  v4 = qword_10047AA70;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_10047AA70, sub_1000E13E4);
  v7._object = (void *)0x80000001003D8970;
  v7._countAndFlagsBits = 0xD000000000000012;
  Log.default(_:isPrivate:)(v7, 0);
  v8 = *(uint64_t (**)(__n128))(**(_QWORD **)((char *)&v6->super.super.isa
                                                      + OBJC_IVAR____TtC7Measure11AppDelegate__appState)
                                        + 200);
  v9 = swift_retain();
  v10 = v8(v9);
  v11 = swift_release();
  (*(void (**)(_BYTE *(*)(_BYTE *), _QWORD, __n128))(*(_QWORD *)v10 + 280))(sub_100022CEC, 0, v11);

  swift_release();
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void (**v8)(void *, _QWORD);
  id v9;
  id v10;
  char v11;
  _TtC7Measure11AppDelegate *v12;

  v8 = (void (**)(void *, _QWORD))_Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v12 = self;
  sub_100022DD8(v10);
  v8[2](v8, v11 & 1);
  _Block_release(v8);

}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  uint64_t v8;
  void *v9;
  void *v10;
  _TtC7Measure11AppDelegate *v11;
  id v12;
  BOOL result;
  Swift::String v14;
  Swift::Int v15;
  char v16;

  v5 = a5;
  if (a4)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = v9;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = 0;
  v10 = 0;
  if (a5)
LABEL_3:
    v5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = self;
  v12 = a3;
  result = sub_1000227FC();
  if (!v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (!v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v12)
  {
    swift_bridgeObjectRetain(v10);
    v14._countAndFlagsBits = v8;
    v14._object = v10;
    v15 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10043BCC0, v14);
    swift_bridgeObjectRelease(v10);
    v16 = 0;
    if (v15)
    {
      if (v15 != 1)
      {
LABEL_11:

        swift_bridgeObjectRelease(v10);
        swift_release();
        swift_bridgeObjectRelease(v5);
        return v16;
      }
      v16 = 1;
    }
    sub_10012C89C(v16, v12);
    v16 = 1;
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  return result;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v7;
  id v8;
  _TtC7Measure11AppDelegate *v9;
  unsigned __int8 v10;

  sub_100018148(0, (unint64_t *)&qword_10047E560, UIDevice_ptr);
  v7 = a3;
  v8 = a4;
  v9 = self;
  if ((static UIDevice.isIPhone()(v9) & 1) != 0)
  {
    v10 = objc_msgSend((id)objc_opt_self(UIDevice), "_hasHomeButton");

    if ((v10 & 1) == 0)
      return 2;
  }
  else
  {

  }
  return 30;
}

@end
