@implementation HistoryFilterUIViewController

- (_TtC10FitnessApp29HistoryFilterUIViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001F3364();
}

- (_TtC10FitnessApp29HistoryFilterUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp29HistoryFilterUIViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp29HistoryFilterUIViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.HistoryFilterUIViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->action[OBJC_IVAR____TtC10FitnessApp29HistoryFilterUIViewController_action]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp29HistoryFilterUIViewController_historyTypes));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29HistoryFilterUIViewController_filterViewController));
}

@end
