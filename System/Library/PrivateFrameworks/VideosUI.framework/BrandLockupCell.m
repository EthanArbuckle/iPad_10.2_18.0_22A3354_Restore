@implementation BrandLockupCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  _TtC8VideosUI15BrandLockupCell *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9E5B018(a4, width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _TtC8VideosUI15BrandLockupCell *v4;

  v4 = self;
  sub_1D9E5B148(a3);

}

- (_TtC8VideosUI15BrandLockupCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15BrandLockupCell *result;

  sub_1D9E5B1F0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15BrandLockupCell)initWithCoder:(id)a3
{
  _TtC8VideosUI15BrandLockupCell *result;

  sub_1D9E5B25C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15BrandLockupCell_brandImageView));
  swift_release();
}

- (id)zoomSourceView
{
  id v2;

  sub_1D9E5B3D8();
  return v2;
}

@end
