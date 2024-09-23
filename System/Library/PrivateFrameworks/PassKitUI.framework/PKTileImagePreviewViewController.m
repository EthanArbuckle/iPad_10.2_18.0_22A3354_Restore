@implementation PKTileImagePreviewViewController

- (PKTileImagePreviewViewController)initWithCoder:(id)a3
{
  id v4;
  PKTileImagePreviewViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTileImagePreviewViewController_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTileImagePreviewViewController_scrollView) = 0;
  v4 = a3;

  result = (PKTileImagePreviewViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

+ (void)presentWithImageView:(id)a3 title:(id)a4 presenting:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v7 = sub_19DE87BF4();
  v9 = v8;
  v10 = a3;
  v11 = a5;
  _s9PassKitUI30TileImagePreviewViewControllerC7present05imageG05title10presentingySo07UIImageG0C_SSSo06UIViewH0CtFZ_0(v10, v7, v9, v11);

  swift_bridgeObjectRelease();
}

- (void)loadView
{
  PKTileImagePreviewViewController *v2;

  v2 = self;
  TileImagePreviewViewController.loadView()();

}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (void)tapped:(id)a3
{
  PKTileImagePreviewViewController *v4;
  PKTileImagePreviewViewController *v5;
  PKTileImagePreviewViewController *v6;
  PKTileImagePreviewViewController *v7;

  v4 = (PKTileImagePreviewViewController *)a3;
  v7 = self;
  v5 = (PKTileImagePreviewViewController *)-[PKTileImagePreviewViewController navigationController](v7, sel_navigationController);
  if (v5)
  {
    v6 = v5;
    -[PKTileImagePreviewViewController setNavigationBarHidden:animated:](v5, sel_setNavigationBarHidden_animated_, -[PKTileImagePreviewViewController isNavigationBarHidden](v5, sel_isNavigationBarHidden) ^ 1, 1);

    v4 = v7;
    v7 = v6;
  }

}

- (void)swiped:(id)a3
{
  id v4;
  PKTileImagePreviewViewController *v5;

  v4 = a3;
  v5 = self;
  sub_19D408CC8();

}

- (void)close
{
  PKTileImagePreviewViewController *v2;

  v2 = self;
  sub_19D408CC8();

}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4;
  PKTileImagePreviewViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = _s9PassKitUI30TileImagePreviewViewControllerC14viewForZooming2inSo6UIViewCSgSo08UIScrollG0C_tF_0();

  return v6;
}

- (void)scrollViewDidZoom:(id)a3
{
  UIScrollView *v4;
  PKTileImagePreviewViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  TileImagePreviewViewController.scrollViewDidZoom(_:)(v4);

}

- (PKTileImagePreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PKTileImagePreviewViewController *result;

  v4 = a4;
  result = (PKTileImagePreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
