@implementation MFMailIntelligenceLightSettingsViewController

+ (NSString)title
{
  uint64_t v2;
  uint64_t v5;
  id v6;

  swift_getObjCClassMetadata(a1);
  swift_getObjCClassMetadata(a1);
  static MailIntelligenceLightSettingsViewController.title.getter();
  v5 = v2;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (void)viewDidLoad
{
  MFMailIntelligenceLightSettingsViewController *v2;

  v2 = self;
  MailIntelligenceLightSettingsViewController.viewDidLoad()();

}

- (MFMailIntelligenceLightSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = a4;
  if (a3)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v6;

    v10 = v8;
    v11 = v9;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  return (MFMailIntelligenceLightSettingsViewController *)MailIntelligenceLightSettingsViewController.init(nibName:bundle:)(v10, v11, a4);
}

- (MFMailIntelligenceLightSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (MFMailIntelligenceLightSettingsViewController *)MailIntelligenceLightSettingsViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1001F20D8((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MFMailIntelligenceLightSettingsViewController_contentHost));
}

@end
