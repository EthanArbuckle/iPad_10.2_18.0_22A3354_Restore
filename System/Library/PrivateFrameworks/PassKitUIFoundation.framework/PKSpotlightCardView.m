@implementation PKSpotlightCardView

- (PKSpotlightCardView)initWithDiffuse:(CGImage *)a3 contentInsets:(PKEdgeInsets)a4 averageColor:(CGColor *)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double v11;
  BOOL v12;
  float32x4_t *v13;
  float32x4_t *v14;
  _QWORD v16[9];
  BOOL v17;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  if (a5)
  {
    PKColorGetRelativeLuminance();
    v12 = v11 > 0.8;
  }
  else
  {
    v12 = 1;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__PKSpotlightCardView_initWithDiffuse_contentInsets_averageColor___block_invoke;
  v16[3] = &__block_descriptor_73_e51___PKTexturedCardRenderer_16__0__PKMetalRenderLoop_8l;
  v17 = v12;
  v16[4] = a3;
  *(double *)&v16[5] = top;
  *(double *)&v16[6] = left;
  *(double *)&v16[7] = bottom;
  *(double *)&v16[8] = right;
  v13 = (float32x4_t *)-[PKTexturedCardView _initWithPixelFormat:renderer:]((id *)&self->super.super.super.super.isa, 80, v16);
  v14 = v13;
  if (v13)
  {
    v13[29].i8[0] = 1;
    -[PKTexturedCardView _setDeviceAttitude:]((uint64_t)v13, v13[27]);
    v14[29].i8[3] = v12;
  }
  return (PKSpotlightCardView *)v14;
}

id *__66__PKSpotlightCardView_initWithDiffuse_contentInsets_averageColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKTexturedCardRenderer *v4;
  unint64_t v5;
  id *v6;

  v3 = a2;
  objc_msgSend(v3, "setColorSpace:", PKColorSpaceStandardRGB());
  v4 = [PKTexturedCardRenderer alloc];
  if (*(_BYTE *)(a1 + 72))
    v5 = 3;
  else
    v5 = 4;
  v6 = -[PKTexturedCardRenderer initWithStyle:renderLoop:diffuse:insets:]((id *)&v4->super.isa, v5, v3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  return v6;
}

- (BOOL)isLight
{
  return *(&self->super._motionEnabled + 1);
}

@end
