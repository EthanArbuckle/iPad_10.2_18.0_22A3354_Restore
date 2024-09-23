@implementation WorkflowConflictViewController

- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithConflict:(id)a3
{
  return (_TtC10WorkflowUI30WorkflowConflictViewController *)WorkflowConflictViewController.init(conflict:)((uint64_t)a3);
}

- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2200D0E94();
}

- (void)loadView
{
  _TtC10WorkflowUI30WorkflowConflictViewController *v2;

  v2 = self;
  sub_2200D0F24();

}

- (void)viewDidLoad
{
  _TtC10WorkflowUI30WorkflowConflictViewController *v2;

  v2 = self;
  sub_2200D1170();

}

- (_TtC10WorkflowUI30WorkflowConflictViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  WorkflowConflictViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI30WorkflowConflictViewController_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI30WorkflowConflictViewController_conflict));
  swift_unknownObjectRelease();
}

@end
