@implementation STSummaryCellViewController

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *v5;
  objc_super v7;

  if (a3)
    sub_219B99CF4();
  sub_219B99550();
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&v5->super.super.super.isa
           + OBJC_IVAR____TtC20ScreenTimeSettingsUI27STSummaryCellViewController_bridge) = (Class)sub_219B99538();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for STSummaryCellViewController();
  return -[STSummaryCellViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithCoder:(id)a3
{
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *result;

  result = (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController *)sub_219B99F94();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *v2;

  v2 = self;
  sub_219B7C648();

}

- (void)updateWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *v6;

  if (!a3)
  {
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_219B99CF4();
  if (a4)
LABEL_3:
    sub_219B99CF4();
LABEL_4:
  swift_bridgeObjectRetain();
  v6 = self;
  sub_219B99544();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *result;

  v4 = a4;
  result = (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
