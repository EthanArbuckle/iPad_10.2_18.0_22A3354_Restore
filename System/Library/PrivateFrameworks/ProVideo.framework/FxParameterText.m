@implementation FxParameterText

- (FxParameterText)init
{
  FxParameterText *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterText;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
  {
    v2->_textPriv = (FxParameterTextPriv *)malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
    -[FxPin setValueClass:](v2, "setValueClass:", objc_opt_class());
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_textPriv);
  v3.receiver = self;
  v3.super_class = (Class)FxParameterText;
  -[FxPinParameter dealloc](&v3, sel_dealloc);
}

- (BOOL)allowsReturns
{
  return self->_textPriv->var0;
}

- (void)setAllowsReturns:(BOOL)a3
{
  self->_textPriv->var0 = a3;
}

@end
