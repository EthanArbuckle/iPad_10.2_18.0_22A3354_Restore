@implementation CloudSyncWelcomeViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  NSString v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CloudSyncWelcomeViewController();
  v2 = v6.receiver;
  -[CloudSyncWelcomeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "setAccessibilityIdentifier:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)didTapEnableCloudSync:(id)a3
{
  sub_100081808(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100081424);
}

- (void)didTapDisableCloudSync:(id)a3
{
  sub_100081808(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100081518);
}

- (_TtC6Health30CloudSyncWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC6Health30CloudSyncWelcomeViewController *result;

  result = (_TtC6Health30CloudSyncWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("Health.CloudSyncWelcomeViewController", 37, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC6Health30CloudSyncWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC6Health30CloudSyncWelcomeViewController *result;

  v6 = a5;
  result = (_TtC6Health30CloudSyncWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("Health.CloudSyncWelcomeViewController", 37, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100061088((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health30CloudSyncWelcomeViewController_delegate]);

}

@end
