@implementation RootSideBarProfileView

- (_TtC8VideosUI22RootSideBarProfileView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI22RootSideBarProfileView *)sub_1D9ACB21C();
}

- (_TtC8VideosUI22RootSideBarProfileView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9ACB9FC();
}

- (void)dealloc
{
  _TtC8VideosUI22RootSideBarProfileView *v2;

  v2 = self;
  sub_1D9ACBA98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView____lazy_storage___titleLabel));
  OUTLINED_FUNCTION_15_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView____lazy_storage___subtitleLabel));
  OUTLINED_FUNCTION_15_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView_imageView));
  OUTLINED_FUNCTION_15_2();
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI22RootSideBarProfileView_contentChangeHandler));
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  swift_bridgeObjectRelease();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI22RootSideBarProfileView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v6 = self;
  sub_1D9ACBB7C(a4, width);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC8VideosUI22RootSideBarProfileView *v5;

  v4 = a3;
  v5 = self;
  sub_1D9ACBF8C();

}

- (void)accountStoreDidChange:(id)a3
{
  id v4;
  _TtC8VideosUI22RootSideBarProfileView *v5;

  v4 = a3;
  v5 = self;
  sub_1D9ACC12C();

  OUTLINED_FUNCTION_4_3(v5);
}

@end
