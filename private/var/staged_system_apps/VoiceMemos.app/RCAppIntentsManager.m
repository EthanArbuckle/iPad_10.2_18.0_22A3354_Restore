@implementation RCAppIntentsManager

+ (void)setupIntentSceneConfiguratorWithWindowScene:(id)a3
{
  id v4;
  _QWORD v5[5];

  type metadata accessor for AppManager(0, a2);
  v5[3] = &type metadata for RCIntentSceneConfigurator;
  v5[4] = sub_10001BCA8();
  v5[0] = a3;
  v4 = a3;
  static AppManager.sceneConfigurator.setter(v5);
}

+ (void)registerDependencies
{
  uint64_t v2;
  _QWORD v3[2];
  _BYTE v4[40];

  type metadata accessor for AppDependencyManager(0, a2);
  v2 = static AppDependencyManager.shared.getter();
  v3[0] = 0xD00000000000002FLL;
  v3[1] = 0x8000000100184500;
  AnyHashable.init<A>(_:)(v3, &type metadata for String, &protocol witness table for String);
  AppDependencyManager.add<A>(key:dependency:)(v4, &unk_1001EB270, 0, &type metadata for RCControlCenterToggleRecordingIntentPerformer);
  swift_release(v2);
  sub_1000CED5C((uint64_t)v4);
}

- (_TtC10VoiceMemos19RCAppIntentsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RCAppIntentsManager();
  return -[RCAppIntentsManager init](&v3, "init");
}

@end
