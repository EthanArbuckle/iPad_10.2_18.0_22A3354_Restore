@implementation UIPointerEffect

+ (UIPointerEffect)effectWithPreview:(UITargetedPreview *)preview
{
  UITargetedPreview *v3;
  void *v4;

  v3 = preview;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPreview:", v3);

  return (UIPointerEffect *)v4;
}

- (unint64_t)options
{
  return 256;
}

- (id)settings
{
  void *v2;
  void *v3;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightEffectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)constrainedAxes
{
  return 3;
}

- (NSValue)overrideSlipPoints
{
  return 0;
}

- (CGPoint)slipFactor
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[UIPointerEffect settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slipFactorX");
  v5 = v4;
  -[UIPointerEffect settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "slipFactorY");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)maxSlip
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxSlipPoints");
  v4 = v3;

  return v4;
}

- (double)parallaxAmount
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parallaxAmount");
  v4 = v3;

  return v4;
}

- (double)scaleUpPoints
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaleUpPoints");
  v4 = v3;

  return v4;
}

- (double)defaultPointerCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPointerCornerRadius");
  v4 = v3;

  return v4;
}

- (double)scaleUpAnimationResponse
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaleUpAnimationResponse");
  v4 = v3;

  return v4;
}

- (double)scaleUpAnimationDampingRatio
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaleUpAnimationDampingRatio");
  v4 = v3;

  return v4;
}

- (double)dampedAnimationResponse
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dampedAnimationResponse");
  v4 = v3;

  return v4;
}

- (double)dampedAnimationDampingRatio
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dampedAnimationDampingRatio");
  v4 = v3;

  return v4;
}

- (double)liftProgressFloor
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftForceFloor");
  v4 = v3;

  return v4;
}

- (double)liftForceExponent
{
  void *v2;
  double v3;
  double v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftForceExponent");
  v4 = v3;

  return v4;
}

- (UIViewSpringAnimationBehavior)liftProgressSpring
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPointerEffect settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springAnimationBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewSpringAnimationBehavior *)v4;
}

- (BOOL)useSoftShadow
{
  return 1;
}

- (BOOL)allowsSanitization
{
  return 1;
}

- (id)tintColorMatrixProvider
{
  __int16 v2;
  _QWORD aBlock[4];
  BOOL v5;

  v2 = -[UIPointerEffect options](self, "options");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIPointerEffect_tintColorMatrixProvider__block_invoke;
  aBlock[3] = &__block_descriptor_33_e17___NSValue_16__0Q8l;
  v5 = (v2 & 0x4000) != 0;
  return _Block_copy(aBlock);
}

id __42__UIPointerEffect_tintColorMatrixProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v9[15];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  PSContentOverlayVibrantColorMatrixForLuminance();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 == 2 && *(_BYTE *)(a1 + 32))
  {
    v6 = 0uLL;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    if (v4)
    {
      objc_msgSend(v4, "CAColorMatrixValue");
      v6 = 0uLL;
    }
    v18 = v6;
    v19 = v6;
    v16 = v6;
    v17 = v6;
    v15 = v6;
    CAColorMatrixMakeBrightness();
    v9[12] = v22;
    v9[13] = v23;
    v9[14] = v24;
    v9[10] = v20;
    v9[11] = v21;
    v9[7] = v17;
    v9[8] = v18;
    v9[9] = v19;
    v9[5] = v15;
    v9[6] = v16;
    CAColorMatrixConcat();
    v23 = v13;
    v24 = v14;
    v21 = v11;
    v22 = v12;
    v20 = v10;
    v9[3] = v13;
    v9[4] = v14;
    v9[1] = v11;
    v9[2] = v12;
    v9[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{CAColorMatrix=ffffffffffffffffffff}");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIPointerEffect preview](self, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreview:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UIPointerEffect *v4;
  UIPointerEffect *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = (UIPointerEffect *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIPointerEffect preview](self, "preview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerEffect preview](v5, "preview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v11 = 1;
      }
      else
      {
        v11 = 0;
        if (v8 && v9)
          v11 = objc_msgSend(v8, "isEqual:", v9);
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UIPointerEffect preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
}

@end
