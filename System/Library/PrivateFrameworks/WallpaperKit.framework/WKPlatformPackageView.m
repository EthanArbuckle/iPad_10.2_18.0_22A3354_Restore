@implementation WKPlatformPackageView

- (_TtC12WallpaperKit21WKPlatformPackageView)initWithFrame:(CGRect)a3
{
  _QWORD *v3;
  _TtC12WallpaperKit21WKPlatformPackageView *result;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_originalSize);
  *v3 = 0;
  v3[1] = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_currentScaleEffect) = _Q0;

  result = (_TtC12WallpaperKit21WKPlatformPackageView *)sub_1B8CE17D0();
  __break(1u);
  return result;
}

- (_TtC12WallpaperKit21WKPlatformPackageView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v10;
  _TtC12WallpaperKit21WKPlatformPackageView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_originalSize);
  *v4 = 0;
  v4[1] = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_currentScaleEffect) = _Q0;
  v10 = a3;

  result = (_TtC12WallpaperKit21WKPlatformPackageView *)sub_1B8CE17D0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float64x2_t v3;
  double v4;
  CGSize result;

  v3 = vmulq_f64(*(float64x2_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_originalSize), *(float64x2_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_currentScaleEffect));
  v4 = v3.f64[1];
  result.width = v3.f64[0];
  result.height = v4;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12WallpaperKit21WKPlatformPackageView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1B8CBB1EC(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC12WallpaperKit21WKPlatformPackageView *v2;

  v2 = self;
  sub_1B8CBC030();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12WallpaperKit21WKPlatformPackageView_package));
}

@end
