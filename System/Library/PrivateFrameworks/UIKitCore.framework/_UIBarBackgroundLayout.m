@implementation _UIBarBackgroundLayout

- (void)setBackgroundTransitionProgress:(double)a3
{
  self->_backgroundTransitionProgress = a3;
}

- (void)setUseExplicitGeometry:(BOOL)a3
{
  self->_useExplicitGeometry = a3;
}

- (void)setBackgroundHeight2:(double)a3
{
  self->_backgroundHeight2 = a3;
}

- (void)setBackgroundHeight1:(double)a3
{
  self->_backgroundHeight1 = a3;
}

- (BOOL)bg2Enabled
{
  return 0;
}

- (UIColor)bg1ShadowTint
{
  return 0;
}

- (int64_t)bg1ImageMode
{
  return 0;
}

- (double)bg1ImageAlpha
{
  return 1.0;
}

- (void)setBackgroundAlpha:(double)a3
{
  double v3;

  v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_backgroundAlpha)
    self->_backgroundAlpha = v3;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (void)setInterfaceIdiom:(int64_t)a3
{
  self->_interfaceIdiom = a3;
}

- (void)setDisableTinting:(BOOL)a3
{
  self->_disableTinting = a3;
}

- (_UIBarBackgroundLayout)initWithLayout:(id)a3
{
  _QWORD *v4;
  char *v5;
  _UIBarBackgroundLayout *v6;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIBarBackgroundLayout;
  v5 = -[_UIBarBackgroundLayout init](&v13, sel_init);
  v6 = (_UIBarBackgroundLayout *)v5;
  if (v5)
  {
    if (v4)
    {
      *((_QWORD *)v5 + 1) = v4[1];
      *((_QWORD *)v5 + 2) = v4[2];
      *((_QWORD *)v5 + 3) = v4[3];
      *((_QWORD *)v5 + 4) = v4[4];
      *((_QWORD *)v5 + 5) = v4[5];
      *((_QWORD *)v5 + 6) = v4[6];
      *((_QWORD *)v5 + 7) = v4[7];
      v5[64] = *((_BYTE *)v4 + 64);
      v5[65] = *((_BYTE *)v4 + 65);
      v5[66] = *((_BYTE *)v4 + 66);
    }
    else
    {
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(v5 + 8) = _Q0;
    }
  }

  return v6;
}

- (double)topInset
{
  return 0.0;
}

- (void)setShadowAlpha:(double)a3
{
  double v3;

  v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_shadowAlpha)
    self->_shadowAlpha = v3;
}

- (_UIBarBackgroundLayout)init
{
  return -[_UIBarBackgroundLayout initWithLayout:](self, "initWithLayout:", 0);
}

- (BOOL)bg2HasShadow
{
  return 0;
}

- (double)bgInset
{
  return 0.0;
}

- (double)backgroundHeight2
{
  return self->_backgroundHeight2;
}

- (double)backgroundHeight1
{
  return self->_backgroundHeight1;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bg2ShadowEffect, 0);
  objc_storeStrong((id *)&self->_bg1ShadowEffect, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLayout:", self);
}

- (BOOL)shouldUseExplicitGeometry
{
  return self->_useExplicitGeometry;
}

- (double)bg1Alpha
{
  return 1.0;
}

- (NSArray)bg1Effects
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (UIColor)bg1Color
{
  return 0;
}

- (UIImage)bg1Image
{
  return 0;
}

- (BOOL)bg1HasShadow
{
  return 0;
}

- (UIColor)bg1ShadowColor
{
  return 0;
}

- (UIImage)bg1ShadowImage
{
  return 0;
}

- (double)bg1ShadowAlpha
{
  return 1.0;
}

- (BOOL)bg2HasHeight
{
  return 0;
}

- (double)bg2Alpha
{
  return 1.0;
}

- (NSArray)bg2Effects
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (UIColor)bg2Color
{
  return 0;
}

- (UIImage)bg2Image
{
  return 0;
}

- (int64_t)bg2ImageMode
{
  return 0;
}

- (UIColor)bg2ShadowColor
{
  return 0;
}

- (UIImage)bg2ShadowImage
{
  return 0;
}

- (UIColor)bg2ShadowTint
{
  return 0;
}

- (double)bg2ShadowAlpha
{
  return 1.0;
}

- (void)describeInto:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendFormat:", CFSTR(" idiom=%li style=%li backgroundAlpha=%f shadowAlpha=%f"), self->_interfaceIdiom, self->_interfaceStyle, *(_QWORD *)&self->_backgroundAlpha, *(_QWORD *)&self->_shadowAlpha);
  if (self->_shadowHidden)
    objc_msgSend(v4, "appendString:", CFSTR(" shadowHidden"));
  if (self->_useExplicitGeometry)
    objc_msgSend(v4, "appendFormat:", CFSTR(" height1=%f height2=%f"), *(_QWORD *)&self->_backgroundHeight1, *(_QWORD *)&self->_backgroundHeight2);
  else
    objc_msgSend(v4, "appendString:", CFSTR(" fullHeight"));
  objc_msgSend(v4, "appendFormat:", CFSTR(" transitionProgress=%f"), *(_QWORD *)&self->_backgroundTransitionProgress);

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarBackgroundLayout;
  -[_UIBarBackgroundLayout description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIBarBackgroundLayout describeInto:](self, "describeInto:", v4);
  return v4;
}

- (int64_t)interfaceIdiom
{
  return self->_interfaceIdiom;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (BOOL)shadowHidden
{
  return self->_shadowHidden;
}

- (void)setShadowHidden:(BOOL)a3
{
  self->_shadowHidden = a3;
}

- (BOOL)useExplicitGeometry
{
  return self->_useExplicitGeometry;
}

- (double)backgroundTransitionProgress
{
  return self->_backgroundTransitionProgress;
}

- (BOOL)disableTinting
{
  return self->_disableTinting;
}

- (UIVibrancyEffect)bg1ShadowEffect
{
  return self->_bg1ShadowEffect;
}

- (UIVibrancyEffect)bg2ShadowEffect
{
  return self->_bg2ShadowEffect;
}

@end
