@implementation SegmentedViewController

- (_TtC5TeaUI23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    sub_1B16B9860();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC5TeaUI23SegmentedViewController *)SegmentedViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC5TeaUI23SegmentedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SegmentedViewController.init(coder:)();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI23SegmentedViewController *v4;

  v4 = self;
  sub_1B1677EE8(a3);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI23SegmentedViewController_segmentedControl));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC5TeaUI23SegmentedViewController_preservedSearchText;
  sub_1B16788F4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)doSegmentChange
{
  _TtC5TeaUI23SegmentedViewController *v2;

  v2 = self;
  sub_1B1678074();

}

@end
