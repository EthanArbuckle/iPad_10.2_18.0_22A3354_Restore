@implementation FxParameterColor

- (FxParameterColor)init
{
  FxParameterColor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterColor;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
  {
    v2->_colorPriv = (FxParameterColorPriv *)malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
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

  FxDebugAssert(self->_colorPriv != 0, CFSTR("_colorPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_colorPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterColor;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

- (BOOL)hasAlpha
{
  return self->_colorPriv->var0;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_colorPriv->var0 = a3;
}

@end
