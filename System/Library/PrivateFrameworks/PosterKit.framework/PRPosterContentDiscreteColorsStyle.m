@implementation PRPosterContentDiscreteColorsStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentDiscreteColorsStyle)initWithOpaqueColors:(id)a3
{
  return -[PRPosterContentDiscreteColorsStyle initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 0, 0, 0.0);
}

- (PRPosterContentDiscreteColorsStyle)initWithOpaqueColors:(id)a3 variation:(double)a4
{
  return -[PRPosterContentDiscreteColorsStyle initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 0, 1, a4);
}

- (PRPosterContentDiscreteColorsStyle)initWithVibrantColors:(id)a3
{
  return -[PRPosterContentDiscreteColorsStyle initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 1, 0, 0.0);
}

- (PRPosterContentDiscreteColorsStyle)initWithVibrantColors:(id)a3 variation:(double)a4
{
  return -[PRPosterContentDiscreteColorsStyle initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 1, 1, a4);
}

- (PRPosterContentDiscreteColorsStyle)initWithColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variationValue:(double)a6
{
  _BOOL4 v7;
  id v10;
  PRPosterContentDiscreteColorsStyle *v11;
  uint64_t v12;
  NSArray *colors;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRPosterContentDiscreteColorsStyle;
  v11 = -[PRPosterContentDiscreteColorsStyle init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    colors = v11->_colors;
    v11->_colors = (NSArray *)v12;

    v11->_vibrant = a4;
    v11->_supportsVariation = v7;
    if (v7)
      v11->_variation = a6;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self
      || -[PRPosterContentDiscreteColorsStyle isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 0);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  id v6;
  unsigned __int8 *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (unsigned __int8 *)v6;
    -[PRPosterContentDiscreteColorsStyle colors](self, "colors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToArray:", v9);

    v12 = 0;
    if (v10)
    {
      v11 = -[PRPosterContentDiscreteColorsStyle isVibrant](self, "isVibrant");
      if (v11 == objc_msgSend(v7, "isVibrant")
        && self->_supportsVariation == v7[8]
        && (!self->_supportsVariation || a4 || BSFloatEqualToFloat()))
      {
        v12 = 1;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_colors);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_vibrant);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_supportsVariation);
  if (self->_supportsVariation)
    v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_variation);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (NSString)nonVariatedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _PRPosterContentStyleStringForType(-[PRPosterContentDiscreteColorsStyle type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterContentDiscreteColorsStyle colors](self, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

uint64_t __59__PRPosterContentDiscreteColorsStyle_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

- (NSString)identifier
{
  _BOOL4 supportsVariation;
  void *v4;
  void *v5;
  uint64_t v6;

  supportsVariation = self->_supportsVariation;
  -[PRPosterContentDiscreteColorsStyle nonVariatedIdentifier](self, "nonVariatedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (supportsVariation)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_variation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(":%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)localizedName
{
  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "renderDiscreteColorStyle:", self);

}

- (NSArray)variationAppliedColors
{
  NSArray *colors;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t, void *);
  void *v9;
  PRPosterContentDiscreteColorsStyle *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  PRPosterContentDiscreteColorsStyle *v15;

  if (!self->_supportsVariation)
    return self->_colors;
  colors = self->_colors;
  if (self->_vibrant)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __60__PRPosterContentDiscreteColorsStyle_variationAppliedColors__block_invoke;
    v14 = &unk_1E2183F28;
    v15 = self;
    v4 = &v11;
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __60__PRPosterContentDiscreteColorsStyle_variationAppliedColors__block_invoke_2;
    v9 = &unk_1E2183F28;
    v10 = self;
    v4 = &v6;
  }
  -[NSArray bs_map:](colors, "bs_map:", v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __60__PRPosterContentDiscreteColorsStyle_variationAppliedColors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorWithAlphaComponent:", (*(double *)(*(_QWORD *)(a1 + 32) + 16) + 1.0) * 0.5 + 0.0);
}

id __60__PRPosterContentDiscreteColorsStyle_variationAppliedColors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PRPosterColorValues *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;

  v3 = a2;
  v4 = -[PRPosterColorValues initWithColor:]([PRPosterColorValues alloc], "initWithColor:", v3);

  v5 = *(double *)(*(_QWORD *)(a1 + 32) + 16) * -0.25;
  -[PRPosterColorValues hslValues](v4, "hslValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "luminance");
  v8 = v7;

  v9 = fmax(v8 + v5, 0.0);
  if (v9 > 1.0)
    v9 = 1.0;
  v10 = -[PRPosterColorValues copyWithLuminance:](v4, "copyWithLuminance:", v9);
  objc_msgSend(v10, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)allowsVariation
{
  return self->_supportsVariation;
}

- (double)maxVariation
{
  return 1.0;
}

- (double)minVariation
{
  return -1.0;
}

- (double)variation
{
  return self->_variation;
}

- (id)copyWithVariation:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColors:vibrant:supportsVariation:variationValue:", self->_colors, self->_vibrant, self->_supportsVariation, a3);
}

- (BOOL)isSupportedSystemStyle
{
  return 1;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 1;
}

- (BOOL)desiresVibrancyEffectView
{
  return self->_vibrant;
}

- (int64_t)vibrancyEffectType
{
  return 1;
}

- (UIColor)vibrancyEffectColor
{
  void *v3;
  void *v4;

  if (-[PRPosterContentDiscreteColorsStyle allowsVariation](self, "allowsVariation"))
  {
    -[PRPosterContentDiscreteColorsStyle variationAppliedColors](self, "variationAppliedColors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray firstObject](self->_colors, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v4;
}

- (NSString)lutIdentifier
{
  return 0;
}

- (PRPosterContentDiscreteColorsStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  PRPosterContentDiscreteColorsStyle *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("colors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("vibrant"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsVariation"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("variation"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsToResolveVariation"));

  v11 = -[PRPosterContentDiscreteColorsStyle initWithColors:vibrant:supportsVariation:variationValue:]([PRPosterContentDiscreteColorsStyle alloc], "initWithColors:vibrant:supportsVariation:variationValue:", v5, v6, v7, v9);
  -[PRPosterContentDiscreteColorsStyle setNeedsToResolveVariationFromColorStore:](v11, "setNeedsToResolveVariationFromColorStore:", v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *colors;
  id v5;

  colors = self->_colors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", colors, CFSTR("colors"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_vibrant, CFSTR("vibrant"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsVariation, CFSTR("supportsVariation"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("variation"), self->_variation);
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsToResolveVariationFromColorStore, CFSTR("needsToResolveVariation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColors:vibrant:supportsVariation:variationValue:", self->_colors, self->_vibrant, self->_supportsVariation, self->_variation);
  objc_msgSend(v4, "setNeedsToResolveVariationFromColorStore:", self->_needsToResolveVariationFromColorStore);
  return v4;
}

- (BOOL)needsToResolveVariationFromColorStore
{
  return self->_needsToResolveVariationFromColorStore;
}

- (void)setNeedsToResolveVariationFromColorStore:(BOOL)a3
{
  self->_needsToResolveVariationFromColorStore = a3;
}

- (BOOL)isVibrant
{
  return self->_vibrant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
