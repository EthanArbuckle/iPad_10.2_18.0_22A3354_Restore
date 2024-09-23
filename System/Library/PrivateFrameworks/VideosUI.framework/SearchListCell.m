@implementation SearchListCell

- (VUILabel)resultsContextLabel
{
  id v2;

  sub_1DA07A7D8();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (void)setResultsContextLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1DA07A83C();
  OUTLINED_FUNCTION_5_8(v5);
}

- (VUILabel)titleLabel
{
  id v2;

  sub_1DA07A974();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (void)setTitleLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1DA07A9D8();
  OUTLINED_FUNCTION_5_8(v5);
}

- (VUILabel)subtitleLabel
{
  id v2;

  sub_1DA07AA58();
  return (VUILabel *)OUTLINED_FUNCTION_111(v2);
}

- (void)setSubtitleLabel:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1DA07AABC();
  OUTLINED_FUNCTION_5_8(v5);
}

- (VUIButton)buttonView
{
  id v2;

  sub_1DA07B094();
  return (VUIButton *)OUTLINED_FUNCTION_111(v2);
}

- (void)setButtonView:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_36_5();
  sub_1DA07B0F8();
  OUTLINED_FUNCTION_5_8(v5);
}

- (_TtC8VideosUI14SearchListCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI14SearchListCell *result;

  sub_1DA07B438();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI14SearchListCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1DA07B534(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI14SearchListCell *v2;

  v2 = self;
  sub_1DA07C5EC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI14SearchListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA07C660();
}

- (void)prepareForReuse
{
  _TtC8VideosUI14SearchListCell *v2;

  v2 = self;
  sub_1DA07C74C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC8VideosUI14SearchListCell *v4;

  v4 = self;
  sub_1DA07C7F0(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _TtC8VideosUI14SearchListCell *v6;

  v6 = self;
  sub_1DA07C92C(a3, a4);
  OUTLINED_FUNCTION_5_8(v6);
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_resultsContextLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_subtitleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_cellImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_monogramView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_accessoryImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_buttonView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI14SearchListCell_badgeView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14SearchListCell____lazy_storage___bottomSeparatorView));
}

- (id)zoomSourceView
{
  _TtC8VideosUI14SearchListCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1DA07CDE4();
  v4 = v3;

  return OUTLINED_FUNCTION_111(v4);
}

@end
