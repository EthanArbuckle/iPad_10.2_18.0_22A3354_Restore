@implementation UberNavigationBarTitleView

- (BOOL)allowsUberTinting
{
  char v2;

  sub_1D9BB5B88();
  return v2 & 1;
}

- (void)setAllowsUberTinting:(BOOL)a3
{
  sub_1D9BB5BDC(a3);
}

- (_TtC8VideosUI26UberNavigationBarTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9BB69E4();
}

- (void)layoutSubviews
{
  _TtC8VideosUI26UberNavigationBarTitleView *v2;

  v2 = self;
  sub_1D9BB6B28();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)contentDidChange
{
  _TtC8VideosUI26UberNavigationBarTitleView *v2;

  v2 = self;
  sub_1D9BB70A4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8VideosUI26UberNavigationBarTitleView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1D9BB7110((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8VideosUI26UberNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  sub_1D9BB7478();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UberNavigationBarTitleView_customBackButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UberNavigationBarTitleView_titleView));
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI26UberNavigationBarTitleView_backButtonFrameChangeHandler));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (void)setScrolledNonUberPercentage:(double)a3
{
  _TtC8VideosUI26UberNavigationBarTitleView *v4;

  v4 = self;
  sub_1D9BB754C(a3);

}

@end
