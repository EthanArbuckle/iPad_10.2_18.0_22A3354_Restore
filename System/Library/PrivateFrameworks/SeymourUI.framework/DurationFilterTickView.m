@implementation DurationFilterTickView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_layout);
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC9SeymourUI22DurationFilterTickView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_22B82C124(x, y, width, height);

}

- (_TtC9SeymourUI22DurationFilterTickView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC9SeymourUI22DurationFilterTickView *v8;
  __int128 v9;
  objc_super v11;
  _OWORD v12[2];
  uint64_t v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_layout;
  v8 = self;
  sub_22B82CA9C((double *)v12);
  v9 = v12[1];
  *(_OWORD *)v7 = v12[0];
  *((_OWORD *)v7 + 1) = v9;
  *((_QWORD *)v7 + 4) = v13;
  *((_BYTE *)&v8->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_state) = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for DurationFilterTickView();
  return -[DurationFilterTickView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI22DurationFilterTickView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC9SeymourUI22DurationFilterTickView *v6;
  __int128 v7;
  _TtC9SeymourUI22DurationFilterTickView *v8;
  objc_super v10;
  _OWORD v11[2];
  uint64_t v12;

  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_layout;
  v5 = a3;
  v6 = self;
  sub_22B82CA9C((double *)v11);
  v7 = v11[1];
  *(_OWORD *)v4 = v11[0];
  *((_OWORD *)v4 + 1) = v7;
  *((_QWORD *)v4 + 4) = v12;
  *((_BYTE *)&v6->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_state) = 0;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for DurationFilterTickView();
  v8 = -[DurationFilterTickView initWithCoder:](&v10, sel_initWithCoder_, v5);

  return v8;
}

@end
