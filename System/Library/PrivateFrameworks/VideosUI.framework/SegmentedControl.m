@implementation SegmentedControl

- (_TtC8VideosUI16SegmentedControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9EB3174();
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI16SegmentedControl *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1D9EB3220(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)segmentSelectionChanged
{
  _TtC8VideosUI16SegmentedControl *v2;

  v2 = self;
  sub_1D9EB32D0();

}

- (_TtC8VideosUI16SegmentedControl)initWithFrame:(CGRect)a3
{
  sub_1D9EB33DC();
}

- (_TtC8VideosUI16SegmentedControl)initWithItems:(id)a3
{
  if (a3)
    sub_1DA1440FC();
  sub_1D9EB3408();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI16SegmentedControl_delegate);
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI16SegmentedControl_handleActionForHostedView));
}

@end
