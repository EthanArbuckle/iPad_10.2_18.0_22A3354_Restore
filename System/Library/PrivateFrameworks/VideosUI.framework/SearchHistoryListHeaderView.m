@implementation SearchHistoryListHeaderView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI27SearchHistoryListHeaderView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9DB9720(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI27SearchHistoryListHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI27SearchHistoryListHeaderView *result;

  sub_1D9DB9B8C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI27SearchHistoryListHeaderView)initWithCoder:(id)a3
{
  _TtC8VideosUI27SearchHistoryListHeaderView *result;

  sub_1D9DB9C20(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchHistoryListHeaderView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchHistoryListHeaderView_clearButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27SearchHistoryListHeaderView____lazy_storage___bottomSeparatorView));
}

@end
