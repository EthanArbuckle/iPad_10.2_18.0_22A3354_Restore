@implementation BannerViewCellController

- (_TtC8VideosUI24BannerViewCellController)init
{
  return (_TtC8VideosUI24BannerViewCellController *)sub_1D9B619C4();
}

- (void)vui_loadView
{
  _TtC8VideosUI24BannerViewCellController *v2;

  v2 = self;
  sub_1D9B61A44();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI24BannerViewCellController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B61AEC();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI24BannerViewCellController *v4;

  v4 = self;
  sub_1D9B61B88(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (_TtC8VideosUI24BannerViewCellController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B61C00();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24BannerViewCellController_bannerViewCell));
  swift_release();
}

@end
