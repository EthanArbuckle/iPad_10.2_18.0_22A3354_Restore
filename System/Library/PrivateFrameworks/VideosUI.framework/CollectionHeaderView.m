@implementation CollectionHeaderView

- (_TtC8VideosUI20CollectionHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI20CollectionHeaderView *result;

  sub_1D97E2D54();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)tintColorDidChange
{
  _TtC8VideosUI20CollectionHeaderView *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D97E2ED0();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)layoutSubviews
{
  _TtC8VideosUI20CollectionHeaderView *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D97E3030();
  OUTLINED_FUNCTION_5_8(v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  OUTLINED_FUNCTION_21_4();
  sub_1D97E3EEC();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC8VideosUI20CollectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F041F4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  _BOOL8 v6;
  double v7;
  double v8;
  CGSize result;

  v6 = a4;
  OUTLINED_FUNCTION_14_27(self);
  sub_1D9F04328((void (*)(_QWORD *__return_ptr, uint64_t))v6, v5, v4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)prepareForReuse
{
  _TtC8VideosUI20CollectionHeaderView *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9F043CC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (UIView)accessibilityTitleView
{
  id v2;

  sub_1D9F045F4();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

- (UIView)accessibilitySubtitleView
{
  id v2;

  sub_1D9F04648();
  return (UIView *)OUTLINED_FUNCTION_111(v2);
}

- (VUIButton)accessibilityButtonView
{
  id v2;

  sub_1D9F0469C();
  return (VUIButton *)OUTLINED_FUNCTION_111(v2);
}

- (VUIImageView)accessibilityImageView
{
  id v2;

  sub_1D9F046F0();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_titleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_subtitleView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_imageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_accessoryView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_buttonView);
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_supplementaryViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_containerView));
}

- (void)headerTapped
{
  _TtC8VideosUI20CollectionHeaderView *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9F04A30();
  OUTLINED_FUNCTION_5_8(v3);
}

@end
