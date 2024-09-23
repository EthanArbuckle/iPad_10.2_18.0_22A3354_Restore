@implementation FxParameterPoint3d

- (FxParameterPoint3d)init
{
  FxParameterPoint3d *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterPoint3d;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
  {
    v2->_point3dPriv = (FxParameterPoint3dPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
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

  FxDebugAssert(self->_point3dPriv != 0, CFSTR("_point3dPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_point3dPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterPoint3d;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

@end
