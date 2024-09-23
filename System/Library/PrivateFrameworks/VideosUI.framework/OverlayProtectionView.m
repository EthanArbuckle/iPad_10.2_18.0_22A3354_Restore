@implementation OverlayProtectionView

- (_TtC8VideosUI21OverlayProtectionView)init
{
  return (_TtC8VideosUI21OverlayProtectionView *)sub_1D9FF918C();
}

- (_TtC8VideosUI21OverlayProtectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9FF92E0();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI21OverlayProtectionView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9FF9394(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUI21OverlayProtectionView *v10;
  id v11;

  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11 = sub_1D9FF9578(v9, v6, v8);

  OUTLINED_FUNCTION_22();
  return v11;
}

- (_TtC8VideosUI21OverlayProtectionView)initWithFrame:(CGRect)a3
{
  sub_1D9FF9A14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_legibilityGradientLayer));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_legibilityBlurView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_legibilityBlurMaskLayer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_cornerBlurView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21OverlayProtectionView_cornerBlurMaskLayer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21OverlayProtectionView____lazy_storage___legibilityGradientLayerDelegate);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI21OverlayProtectionView____lazy_storage___legibilityBlurMaskLayerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21OverlayProtectionView____lazy_storage___cornerBlurMaskLayerDelegate));
}

@end
