@implementation FlowcaseViewCell

- (void)vui_prepareForReuse
{
  _TtC8VideosUI16FlowcaseViewCell *v2;

  v2 = self;
  sub_1D9E4C3E4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI16FlowcaseViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = self;
  OUTLINED_FUNCTION_21_4();
  sub_1D9E4C534(a4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)onImageDidLoad:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI16FlowcaseViewCell *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9E4C82C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8VideosUI16FlowcaseViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI16FlowcaseViewCell *result;

  sub_1D9E4DCC0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI16FlowcaseViewCell)initWithCoder:(id)a3
{
  _TtC8VideosUI16FlowcaseViewCell *result;

  sub_1D9E4DD4C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16FlowcaseViewCell_backgroundMediaController));
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_14_133((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI16FlowcaseViewCell_imageViewContext));
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_32_92();
}

- (void)vui_cellWillBeDisplayed
{
  _TtC8VideosUI16FlowcaseViewCell *v2;

  v2 = self;
  sub_1D9E4E324();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_cellDidEndDisplaying
{
  _TtC8VideosUI16FlowcaseViewCell *v2;

  v2 = self;
  sub_1D9E4E4C0();
  OUTLINED_FUNCTION_5_8(v2);
}

@end
