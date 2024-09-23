@implementation PVMultiBlendLayerParams

- (PVMultiBlendLayerParams)initWithCoder:(id)a3
{
  id v4;
  PVMultiBlendLayerParams *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVMultiBlendLayerParams;
  v5 = -[PVMultiBlendLayerParams init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("opacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    LODWORD(v11) = v8;
    -[PVMultiBlendLayerParams _sharedInitWithOpacity:mode:](v5, "_sharedInitWithOpacity:mode:", v10, v11);
  }

  return v5;
}

- (PVMultiBlendLayerParams)init
{
  PVMultiBlendLayerParams *v2;
  double v3;
  PVMultiBlendLayerParams *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVMultiBlendLayerParams;
  v2 = -[PVMultiBlendLayerParams init](&v6, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1.0;
    -[PVMultiBlendLayerParams _sharedInitWithOpacity:mode:](v2, "_sharedInitWithOpacity:mode:", 0, v3);
  }
  return v4;
}

- (PVMultiBlendLayerParams)initWithOpacity:(float)a3 mode:(int)a4
{
  uint64_t v4;
  PVMultiBlendLayerParams *v6;
  double v7;
  PVMultiBlendLayerParams *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v10.receiver = self;
  v10.super_class = (Class)PVMultiBlendLayerParams;
  v6 = -[PVMultiBlendLayerParams init](&v10, sel_init);
  v8 = v6;
  if (v6)
  {
    *(float *)&v7 = a3;
    -[PVMultiBlendLayerParams _sharedInitWithOpacity:mode:](v6, "_sharedInitWithOpacity:mode:", v4, v7);
  }
  return v8;
}

- (void)_sharedInitWithOpacity:(float)a3 mode:(int)a4
{
  self->_opacity = a3;
  self->_mode = a4;
}

- (id)blendModeName
{
  return -[PVMultiBlendLayerParams blendModeName]::s_nameMap[self->_mode];
}

- (int)hgBlendMode
{
  return -[PVMultiBlendLayerParams hgBlendMode]::s_pvToHGBlendMap[self->_mode];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("mode"));

  *(float *)&v5 = self->_opacity;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("opacity"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->_opacity;
  return (id)objc_msgSend(v4, "initWithOpacity:mode:", self->_mode, v5);
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

@end
