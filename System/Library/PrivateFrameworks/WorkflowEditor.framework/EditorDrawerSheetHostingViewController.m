@implementation EditorDrawerSheetHostingViewController

- (_TtC14WorkflowEditor38EditorDrawerSheetHostingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_226795288();
}

- (void)loadView
{
  _TtC14WorkflowEditor38EditorDrawerSheetHostingViewController *v2;

  v2 = self;
  sub_226795320();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14WorkflowEditor38EditorDrawerSheetHostingViewController *v4;

  v4 = self;
  sub_2267955AC(a3);

}

- (void)activeScrollViewDidChange
{
  _TtC14WorkflowEditor38EditorDrawerSheetHostingViewController *v2;

  v2 = self;
  sub_2267958A8();

}

- (_TtC14WorkflowEditor38EditorDrawerSheetHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_22688E220();
  v5 = a4;
  sub_226795B4C();
}

- (void).cxx_destruct
{
  swift_release();
  sub_226795D7C((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor38EditorDrawerSheetHostingViewController_test);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor38EditorDrawerSheetHostingViewController_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor38EditorDrawerSheetHostingViewController_scrollViewDelegate));
}

@end
