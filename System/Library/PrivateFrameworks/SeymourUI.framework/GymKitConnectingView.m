@implementation GymKitConnectingView

- (_TtC9SeymourUI20GymKitConnectingView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20GymKitConnectingView *)sub_22B1B5E34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20GymKitConnectingView)initWithCoder:(id)a3
{
  _TtC9SeymourUI20GymKitConnectingView *result;

  result = (_TtC9SeymourUI20GymKitConnectingView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI20GymKitConnectingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20GymKitConnectingView_spriteView);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{

}

@end
