@implementation OfferSelectionFooterSupplementaryView

- (_TtC8VideosUI37OfferSelectionFooterSupplementaryView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI37OfferSelectionFooterSupplementaryView *result;

  sub_1D9C98ECC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI37OfferSelectionFooterSupplementaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C98F90();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  _TtC8VideosUI37OfferSelectionFooterSupplementaryView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9C99030(v4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI37OfferSelectionFooterSupplementaryView____lazy_storage___separatorView));
  swift_bridgeObjectRelease();
  swift_release();
}

@end
