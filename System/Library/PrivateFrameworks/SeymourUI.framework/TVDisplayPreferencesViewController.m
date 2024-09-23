@implementation TVDisplayPreferencesViewController

- (_TtC9SeymourUI34TVDisplayPreferencesViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _TtC9SeymourUI34TVDisplayPreferencesViewController *result;

  v4 = MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_currentSections) = (Class)MEMORY[0x24BEE4AF8];
  v5 = OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_currentActions;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_22BA0C1FC(v4);
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_onSettingsDismissed);
  *v7 = 0;
  v7[1] = 0;

  result = (_TtC9SeymourUI34TVDisplayPreferencesViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for TVDisplayPreferencesViewController();
  -[TVDisplayPreferencesViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (_TtC9SeymourUI34TVDisplayPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI34TVDisplayPreferencesViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI34TVDisplayPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI34TVDisplayPreferencesViewController_onSettingsDismissed));
}

@end
