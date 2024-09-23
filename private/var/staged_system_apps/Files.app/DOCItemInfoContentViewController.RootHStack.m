@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack)init
{
  return (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack *)sub_100225ED0();
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemInfoContentViewController.RootHStack();
  -[DOCItemInfoContentViewController.RootHStack layoutMargins](&v6, "layoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  char *v7;
  void *v8;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCItemInfoContentViewController.RootHStack();
  v7 = (char *)v9.receiver;
  -[DOCItemInfoContentViewController.RootHStack setLayoutMargins:](&v9, "setLayoutMargins:", top, left, bottom, right);
  v8 = *(void **)&v7[OBJC_IVAR____TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack_stackView];
  objc_msgSend(v7, "layoutMargins", v9.receiver, v9.super_class);
  objc_msgSend(v8, "setLayoutMargins:");
  sub_100226A58(0);

}

- (_TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.RootHStack", 16);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack_stackView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtCC5Files32DOCItemInfoContentViewControllerP33_5854F2584B6BB42CC0BFB2F44FFF0F2910RootHStack_arrangedStackElementViews));
}

@end
