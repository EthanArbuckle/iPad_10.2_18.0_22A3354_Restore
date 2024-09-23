@implementation ContextMenuPreviewItemView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8VideosUI26ContextMenuPreviewItemView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1D9F1AA6C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI26ContextMenuPreviewItemView *v2;

  v2 = self;
  sub_1D9F1B2CC();

}

- (_TtC8VideosUI26ContextMenuPreviewItemView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI26ContextMenuPreviewItemView *result;

  sub_1D9F1B34C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26ContextMenuPreviewItemView)initWithCoder:(id)a3
{
  _TtC8VideosUI26ContextMenuPreviewItemView *result;

  sub_1D9F1B3E4(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  sub_1D9F1A728(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_imageViewComponent));
  OUTLINED_FUNCTION_34_94(OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_titleViewComponent);
  OUTLINED_FUNCTION_34_94(OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_subtitleViewComponent);
  sub_1D9F1A728(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8VideosUI26ContextMenuPreviewItemView_eyeBrowViewComponent));
}

@end
