@implementation QuickScheduleManagementViewRepresentation.Coordinator

- (void)quickScheduleManagementViewControllerWillSave:(id)a3
{
  id v4;
  _TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1A9CA587C("[%{public}s] Will save schedule.");

}

- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4
{
  id v6;
  id v7;
  _TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9CA5660(a4);

}

- (void)quickScheduleManagementViewControllerDidCancel:(id)a3
{
  id v4;
  _TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1A9CA587C("[%{public}s] Did cancel.");

}

- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4
{
  id v6;
  id v7;
  _TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9CA5A50(v7);

}

- (_TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator)init
{
  _TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *result;

  result = (_TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;
  void *v3;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent);
  v3 = *(void **)&self->parent[OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent];
  swift_release();

  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end
