@implementation MonogramLockupCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _TtC8VideosUI18MonogramLockupCell *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9E3A244(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat width;
  _TtC8VideosUI18MonogramLockupCell *v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9E3AA8C(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _TtC8VideosUI18MonogramLockupCell *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9E3B4F4(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (_TtC8VideosUI18MonogramLockupCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI18MonogramLockupCell *result;

  sub_1D9E3B598();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI18MonogramLockupCell)initWithCoder:(id)a3
{
  _TtC8VideosUI18MonogramLockupCell *result;

  sub_1D9E3B638(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_monogramView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_subtitleLabel);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_separatorView));
}

- (id)zoomSourceView
{
  _TtC8VideosUI18MonogramLockupCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D9E3BBB4();
  v4 = v3;

  return v4;
}

@end
