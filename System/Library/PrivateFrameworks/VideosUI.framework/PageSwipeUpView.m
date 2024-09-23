@implementation PageSwipeUpView

- (_TtC8VideosUI15PageSwipeUpView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA07D888();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8VideosUI15PageSwipeUpView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1DA07D9BC(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI15PageSwipeUpView *v2;

  v2 = self;
  sub_1DA07DC18();
  OUTLINED_FUNCTION_14_12(v2);
}

- (_TtC8VideosUI15PageSwipeUpView)initWithFrame:(CGRect)a3
{
  sub_1DA07DEE4();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15PageSwipeUpView____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15PageSwipeUpView____lazy_storage___swipeUpLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15PageSwipeUpView____lazy_storage___chevronView));
}

@end
