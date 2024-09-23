@implementation CHMoveModeSettingsViewController

- (CHMoveModeSettingsViewController)initWithHealthStore:(id)a3 formattingManager:(id)a4 isAppleMoveTime:(BOOL)a5
{
  return (CHMoveModeSettingsViewController *)sub_10038D0AC(a3, a4, a5);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return UITableViewAutomaticDimension;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (CHMoveModeSettingsViewController)initWithCoder:(id)a3
{
  id v4;
  CHMoveModeSettingsViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHMoveModeSettingsViewController_dataSource) = 0;
  v4 = a3;

  result = (CHMoveModeSettingsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/MoveModeSettingsViewController.swift", 47, 2, 90, 0);
  __break(1u);
  return result;
}

- (CHMoveModeSettingsViewController)initWithStyle:(int64_t)a3
{
  CHMoveModeSettingsViewController *result;

  result = (CHMoveModeSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MoveModeSettingsViewController", 41, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (CHMoveModeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CHMoveModeSettingsViewController *result;

  v4 = a4;
  result = (CHMoveModeSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MoveModeSettingsViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMoveModeSettingsViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMoveModeSettingsViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMoveModeSettingsViewController_dataSource));
}

@end
