@implementation PBUIWallpaperEffectConfiguration

- (_QWORD)uniqueIdentifier
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;

  v1 = a1;
  if (a1)
  {
    if (*((_QWORD *)a1 + 11))
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      PBUIWallpaperStyleDescription(*((_QWORD *)a1 + 2));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v3;
      v5 = v1[3];
      v6 = CFSTR("Unspecified");
      if (v5 == 2)
        v6 = CFSTR("Dark");
      if (v5 == 1)
        v7 = CFSTR("Light");
      else
        v7 = v6;
      objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), v3, v7);
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LODWORD(v8) = *((_DWORD *)a1 + 10);
      LODWORD(v9) = *((_DWORD *)a1 + 12);
      v10 = a1[7];
      v11 = a1[8];
      v12 = a1[9];
      v13 = a1[10];
      if (v10 == 1.79769313e308)
        v10 = 0.0;
      if (v11 == 1.79769313e308)
        v11 = 0.0;
      if (v12 == 1.79769313e308)
        v12 = 0.0;
      if (v13 == 1.79769313e308)
        v13 = 0.0;
      if (*((_BYTE *)a1 + 8))
        v8 = v8;
      else
        v8 = 0;
      if (*((_BYTE *)a1 + 8))
        v9 = v9;
      else
        v9 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d:%d:%d:%1.1f:%d:%1.1f:%1.1f"), *((_QWORD *)a1 + 4), v8, v9, *(_QWORD *)&v11, (int)v10, *(_QWORD *)&v12, *(_QWORD *)&v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      PBUIWallpaperStyleDescription(v1[2]);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (*((_BYTE *)v1 + 8))
        v17 = CFSTR("tinted");
      else
        v17 = CFSTR("untinted");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@"), v15, v17, v4);
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (id)initWithStyle:(void *)a3 contentColor:(uint64_t)a4 userInterfaceStyle:
{
  id v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _OWORD v14[4];
  objc_super v15;

  v7 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PBUIWallpaperEffectConfiguration;
    v8 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v8;
    if (v8)
    {
      v8[2] = a2;
      _WallpaperBackdropParametersForStyleAndAverageColor(a2, v7, (uint64_t)v14);
      v10 = v14[2];
      v9 = v14[3];
      v11 = v14[1];
      *((_OWORD *)a1 + 2) = v14[0];
      *((_OWORD *)a1 + 3) = v11;
      *((_OWORD *)a1 + 4) = v10;
      *((_OWORD *)a1 + 5) = v9;
      *((_BYTE *)a1 + 8) = _WallpaperStyleHasTint(a2);
      if (_WallpaperStyleUpdatesWithUserInterfaceStyle(a2))
        v12 = a4;
      else
        v12 = 0;
      *((_QWORD *)a1 + 3) = v12;
    }
  }

  return a1;
}

+ (id)normal
{
  PBUIWallpaperEffectConfiguration *v0;
  void *v1;
  id v2;

  objc_opt_self();
  v0 = [PBUIWallpaperEffectConfiguration alloc];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:](v0, 0, v1, 0);

  return v2;
}

- (BOOL)affectedByContentColorChanges
{
  if (result)
    return *(_QWORD *)(result + 88) == 0;
  return result;
}

- (BOOL)requiresMaterialKitRendering
{
  if (result)
    return *(_QWORD *)(result + 88) != 0;
  return result;
}

- (BOOL)affectedByUserInterfaceStyleChanges
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (_QWORD)configurationWithUserInterfaceStyle:(_QWORD *)a1
{
  _QWORD *v3;

  if (a1)
  {
    v3 = a1;
    a1 = (_QWORD *)objc_msgSend(a1, "copy");
    if (v3[3])
      a1[3] = a2;
  }
  return a1;
}

- (_QWORD)configurationByRemovingTint
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  PBUIWallpaperEffectConfiguration *v5;
  void *v6;

  if (a1)
  {
    v2 = _WallpaperStyleByRemovingTintFromStyle(a1[2]);
    if (v2 == a1[2])
    {
      v3 = (_QWORD *)objc_msgSend(a1, "copy");
    }
    else
    {
      v4 = v2;
      v5 = [PBUIWallpaperEffectConfiguration alloc];
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:](v5, v4, v6, a1[3]);

      v3[6] = a1[6];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBUIWallpaperEffectConfiguration *v4;
  PBUIWallpaperEffectConfiguration *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  PBUIWallpaperEffectConfiguration *v9;

  v4 = objc_alloc_init(PBUIWallpaperEffectConfiguration);
  v5 = v4;
  if (v4)
  {
    v4->_style = self->_style;
    v6 = *(_OWORD *)&self->_backdropParameters.backdropStyle;
    v7 = *(_OWORD *)&self->_backdropParameters.renderingHint;
    v8 = *(_OWORD *)&self->_backdropParameters.grayscaleTintAlpha;
    *(_OWORD *)&v4->_backdropParameters.saturationDeltaFactor = *(_OWORD *)&self->_backdropParameters.saturationDeltaFactor;
    *(_OWORD *)&v4->_backdropParameters.grayscaleTintAlpha = v8;
    *(_OWORD *)&v4->_backdropParameters.backdropStyle = v6;
    *(_OWORD *)&v4->_backdropParameters.renderingHint = v7;
    v4->_includeTint = self->_includeTint;
    v4->_userInterfaceStyle = self->_userInterfaceStyle;
    v9 = v4;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PBUIWallpaperEffectConfiguration *v4;
  uint64_t v5;
  PBUIWallpaperEffectConfiguration *v6;
  PBUIWallpaperEffectConfiguration *v7;
  BOOL v8;
  PBUIWallpaperEffectConfiguration *v9;
  uint64_t v10;

  v4 = (PBUIWallpaperEffectConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && v9->_style == self->_style)
    {
      v10 = 24;
      if (!v9->_backdropParameters.materialStyle)
        v10 = 48;
      v8 = *(Class *)((char *)&v9->super.isa + v10) == *(Class *)((char *)&self->super.isa + v10);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (double)backdropParameters
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  if (a1)
  {
    v2 = a1[3];
    *a2 = a1[2];
    a2[1] = v2;
    v3 = a1[4];
    v4 = a1[5];
    a2[2] = v3;
    a2[3] = v4;
  }
  else
  {
    *(_QWORD *)&v3 = 0;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v3;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_style);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_includeTint);
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_backdropParameters.renderingHint);
  v7 = (id)objc_msgSend(v3, "appendInteger:", self->_userInterfaceStyle);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperEffectConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperEffectConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  int64_t userInterfaceStyle;
  const __CFString *v9;
  const __CFString *v10;
  int64_t materialStyle;
  void *v12;
  const __CFString *v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[4];

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIWallpaperStyleDescription(self->_style);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("style"));

  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_includeTint, CFSTR("includeTint"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_userInterfaceStyle != 0, CFSTR("affectedByUserInterfaceStyleChanges"));
  userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle)
  {
    v9 = CFSTR("Unspecified");
    if (userInterfaceStyle == 2)
      v9 = CFSTR("Dark");
    if (userInterfaceStyle == 1)
      v10 = CFSTR("Light");
    else
      v10 = v9;
    objc_msgSend(v4, "appendString:withName:", v10, CFSTR("userInterfaceStyle"));
  }
  materialStyle = self->_backdropParameters.materialStyle;
  if (materialStyle)
  {
    PBUIStringForWallpaperMaterialStyle(materialStyle);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("materialStyle");
  }
  else
  {
    v14 = *(_OWORD *)&self->_backdropParameters.renderingHint;
    v17[0] = *(_OWORD *)&self->_backdropParameters.backdropStyle;
    v17[1] = v14;
    v15 = *(_OWORD *)&self->_backdropParameters.grayscaleTintAlpha;
    v17[2] = *(_OWORD *)&self->_backdropParameters.saturationDeltaFactor;
    v17[3] = v15;
    PBUIStringForWallpaperBackdropParameters((double *)v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("backdropParameters");
  }
  objc_msgSend(v4, "appendString:withName:", v12, v13);

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperEffectConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  PBUIWallpaperEffectConfiguration *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PBUIWallpaperEffectConfiguration_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E6B94BC8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

void __62__PBUIWallpaperEffectConfiguration_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  PBUIWallpaperStyleDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, 0);

}

- (BOOL)includeTint
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

@end
