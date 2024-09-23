@implementation FxParameterImage

- (FxParameterImage)init
{
  FxParameterImage *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterImage;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
    -[FxPin setValueClass:](v2, "setValueClass:", objc_opt_class());
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

  FxDebugAssert(self->_imagePriv != 0, CFSTR("_imagePriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_imagePriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterImage;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

@end
