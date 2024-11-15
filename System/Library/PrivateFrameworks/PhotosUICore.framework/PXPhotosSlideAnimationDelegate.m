@implementation PXPhotosSlideAnimationDelegate

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  objc_super v8;

  y = a5.y;
  x = a5.x;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosSlideAnimationDelegate;
  -[PXGDefaultAnimationDelegate animation:prepareWithRootLayout:viewportShift:](&v8, sel_animation_prepareWithRootLayout_viewportShift_, a3, a4);
  self->_viewportShift.x = x;
  self->_viewportShift.y = y;
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;
  double y;
  double *p_var1;
  objc_super v12;

  length = a7.length;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosSlideAnimationDelegate;
  -[PXGDefaultAnimationDelegate animation:adjustGeometries:styles:infos:forSpriteAppearingIntoRootIndexRange:](&v12, sel_animation_adjustGeometries_styles_infos_forSpriteAppearingIntoRootIndexRange_, a3, a4, a5, a6);
  if (length)
  {
    y = self->_viewportShift.y;
    p_var1 = &a4->var0.var1;
    do
    {
      *p_var1 = y + *p_var1;
      p_var1 += 4;
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;
  double y;
  double *p_var1;
  objc_super v12;

  length = a7.length;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosSlideAnimationDelegate;
  -[PXGDefaultAnimationDelegate animation:adjustGeometries:styles:infos:forSpriteDisappearingFromRootIndexRange:](&v12, sel_animation_adjustGeometries_styles_infos_forSpriteDisappearingFromRootIndexRange_, a3, a4, a5, a6);
  if (length)
  {
    y = self->_viewportShift.y;
    p_var1 = &a4->var0.var1;
    do
    {
      *p_var1 = *p_var1 - y;
      p_var1 += 4;
      --length;
    }
    while (length);
  }
}

@end
