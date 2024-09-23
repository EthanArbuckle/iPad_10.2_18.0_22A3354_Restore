@implementation SleepOnboardingFlowTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13SleepHealthUI38SleepOnboardingFlowTableViewController *v4;

  v4 = self;
  sub_1A9C58D8C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC13SleepHealthUI38SleepOnboardingFlowTableViewController *v4;

  v4 = self;
  sub_1A9C59080(a3);

}

- (int64_t)hksp_presentationStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_presentationStyle);
}

- (void)viewDidLayoutSubviews
{
  _TtC13SleepHealthUI38SleepOnboardingFlowTableViewController *v2;

  v2 = self;
  sub_1A9C59360();

}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI38SleepOnboardingFlowTableViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = SleepOnboardingFlowTableViewController.tableView(_:heightForHeaderInSection:)(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC13SleepHealthUI38SleepOnboardingFlowTableViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = SleepOnboardingFlowTableViewController.tableView(_:heightForFooterInSection:)(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13SleepHealthUI38SleepOnboardingFlowTableViewController *v12;
  uint64_t v13;

  v6 = sub_1A9CE64E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE64BC();
  v11 = a3;
  v12 = self;
  SleepOnboardingFlowTableViewController.tableView(_:didSelectRowAt:)(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end
