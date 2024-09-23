@implementation AddToSiriSwiftHostingViewController

- (_TtP10WorkflowUI43AddToSiriSwiftHostingViewControllerDelegate_)delegate
{
  return (_TtP10WorkflowUI43AddToSiriSwiftHostingViewControllerDelegate_ *)(id)sub_22026FB18();
}

- (void)setDelegate:(id)a3
{
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22026FB74((uint64_t)a3);

}

- (WFWorkflow)workflow
{
  id v2;

  sub_22026FBAC();
  return (WFWorkflow *)v2;
}

- (void)setWorkflow:(id)a3
{
  id v5;
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22026FC1C((uint64_t)a3);

}

- (WFDatabase)database
{
  id v2;

  sub_22026FC48();
  return (WFDatabase *)v2;
}

- (void)setDatabase:(id)a3
{
  id v5;
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_22026FCB8((uint64_t)a3);

}

- (void)viewDidLoad
{
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *v2;

  v2 = self;
  sub_22026FCEC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *v4;

  v4 = self;
  sub_22027052C(a3);

}

- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *result;

  if (a3)
  {
    v5 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_2202706CC(v5, v7, a4);
  return result;
}

- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController *)sub_2202707DC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_hostingController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_workflow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_database));
  sub_22027A00C(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_currentStatus), *((_BYTE *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUI35AddToSiriSwiftHostingViewController_currentStatus));
}

@end
