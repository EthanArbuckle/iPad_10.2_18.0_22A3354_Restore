@implementation RootSideBarController.RootSideBarCollectionView

- (CGSize)contentSize
{
  _TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1D9C7CD18();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  _TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1D9C7CD94(width, height);

}

- (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  _TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView *result;

  v4 = a4;
  v5 = OUTLINED_FUNCTION_11();
  sub_1D9C7CEC0(v6, v5, v7, v8, v9);
  OUTLINED_FUNCTION_6_20();
  return result;
}

- (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView *)sub_1D9C7CF84((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView_contentSizeDidChangeHandler));
}

@end
