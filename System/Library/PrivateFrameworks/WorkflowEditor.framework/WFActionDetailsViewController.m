@implementation WFActionDetailsViewController

- (_TtC14WorkflowEditor29WFActionDetailsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2267BAD20();
}

- (void)viewWillLayoutSubviews
{
  _TtC14WorkflowEditor29WFActionDetailsViewController *v2;

  v2 = self;
  sub_2267BAEFC();

}

- (_TtC14WorkflowEditor29WFActionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_22688E220();
  v5 = a4;
  WFActionDetailsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_action;
  v4 = OUTLINED_FUNCTION_33_13();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_iconView);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_titleLabel);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_descriptionTextView);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_closeButton);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_topSeparator);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_bottomSeparator);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_addButton);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_pinButton);
  sub_22666DCBC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14WorkflowEditor29WFActionDetailsViewController_dismissalHandler));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC14WorkflowEditor29WFActionDetailsViewController *v5;

  v4 = a3;
  v5 = self;
  WFActionDetailsViewController.scrollViewDidScroll(_:)((UIScrollView *)v5);

}

@end
