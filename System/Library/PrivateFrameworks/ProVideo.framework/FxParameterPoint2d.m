@implementation FxParameterPoint2d

- (FxParameterPoint2d)init
{
  FxParameterPoint2d *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterPoint2d;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
  {
    v2->_point2dPriv = (FxParameterPoint2dPriv *)malloc_type_calloc(1uLL, 2uLL, 0x1000040BDFB0063uLL);
    -[FxPin setValueClass:](v2, "setValueClass:", objc_opt_class());
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  FxDebugAssert(self->_point2dPriv != 0, CFSTR("_point2dPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_point2dPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterPoint2d;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

- (BOOL)isCanvasRelative
{
  return self->_point2dPriv->var0;
}

- (void)setIsCanvasRelative:(BOOL)a3
{
  self->_point2dPriv->var0 = a3;
}

- (BOOL)isTranslation
{
  return self->_point2dPriv->var1;
}

- (void)setIsTranslation:(BOOL)a3
{
  self->_point2dPriv->var1 = a3;
}

@end
