@implementation CanonicalInfoCardView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI21CanonicalInfoCardView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9CAE408(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI21CanonicalInfoCardView *v2;

  v2 = self;
  sub_1D9CAF58C();

}

- (VUILabel)accessibilityTitleLabel
{
  id v2;

  sub_1D9CAE290();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (VUILabel)accessibilitySubtitleLabel
{
  id v2;

  sub_1D9CAE2D4();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (FocusableTextView)accessibilityDescriptionLabel
{
  id v2;

  sub_1D9CAE318();
  return (FocusableTextView *)OUTLINED_FUNCTION_111(v2);
}

- (VUIImageView)accessibilityImageView
{
  id v2;

  sub_1D9CAF730();
  return (VUIImageView *)OUTLINED_FUNCTION_111(v2);
}

- (_TtC8VideosUI20TomatometerTableView)accessibilityTableView
{
  id v2;

  sub_1D9CAF784();
  return (_TtC8VideosUI20TomatometerTableView *)OUTLINED_FUNCTION_111(v2);
}

- (_TtC8VideosUI21CanonicalInfoCardView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI21CanonicalInfoCardView *result;

  sub_1D9CAF7BC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI21CanonicalInfoCardView)initWithCoder:(id)a3
{
  _TtC8VideosUI21CanonicalInfoCardView *result;

  sub_1D9CAF868(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_subtitleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_descriptionLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_imageView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardView_tableView));
}

@end
