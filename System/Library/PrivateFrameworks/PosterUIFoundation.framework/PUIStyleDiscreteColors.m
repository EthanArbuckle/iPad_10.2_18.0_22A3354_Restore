@implementation PUIStyleDiscreteColors

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleDiscreteColors)initWithOpaqueColors:(id)a3
{
  return -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 0, 0, 0.0);
}

- (PUIStyleDiscreteColors)initWithOpaqueColors:(id)a3 variation:(double)a4
{
  return -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 0, 1, a4);
}

- (PUIStyleDiscreteColors)initWithVibrantColors:(id)a3
{
  return -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 1, 0, 0.0);
}

- (PUIStyleDiscreteColors)initWithVibrantColors:(id)a3 variation:(double)a4
{
  return -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:](self, "initWithColors:vibrant:supportsVariation:variationValue:", a3, 1, 1, a4);
}

- (PUIStyleDiscreteColors)initWithColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variationValue:(double)a6
{
  _BOOL4 v7;
  id v10;
  PUIStyleDiscreteColors *v11;
  uint64_t v12;
  NSArray *colors;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUIStyleDiscreteColors;
  v11 = -[PUIStyleDiscreteColors init](&v15, sel_init);
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
  return -[PUIStyleDiscreteColors isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 0);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIStyleDiscreteColors isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 0);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL8 v4;
  PUIStyleDiscreteColors *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIStyleDiscreteColors *)a3;
  if (v6 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStyleDiscreteColors isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", v6, v4);
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIStyleDiscreteColors *v6;
  unsigned __int8 *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;

  v4 = a4;
  v6 = (PUIStyleDiscreteColors *)a3;
  v7 = (unsigned __int8 *)v6;
  if (v6 == self)
    goto LABEL_10;
  if (!v6)
    goto LABEL_11;
  if (!_PUIStyleCompareUsingIdentifiers(self, v6, v4))
    goto LABEL_11;
  -[PUIStyleDiscreteColors colors](self, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToArray:", v9);

  if (!v10)
    goto LABEL_11;
  v11 = -[PUIStyleDiscreteColors isVibrant](self, "isVibrant");
  if (v11 == objc_msgSend(v7, "isVibrant")
    && self->_supportsVariation == v7[8]
    && (!self->_supportsVariation || v4 || BSFloatEqualToFloat()))
  {
LABEL_10:
    v12 = 1;
  }
  else
  {
LABEL_11:
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

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
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

  NSStringFromPUIStyleType(-[PUIStyleDiscreteColors type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStyleDiscreteColors colors](self, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

uint64_t __47__PUIStyleDiscreteColors_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

- (NSString)identifier
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[PUIStyleDiscreteColors allowsVariation](self, "allowsVariation");
  -[PUIStyleDiscreteColors nonVariatedIdentifier](self, "nonVariatedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_variation);
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

- (NSArray)variationAppliedColors
{
  NSArray *colors;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t, void *);
  void *v9;
  PUIStyleDiscreteColors *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  PUIStyleDiscreteColors *v15;

  if (!self->_supportsVariation)
    return self->_colors;
  colors = self->_colors;
  if (self->_vibrant)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke;
    v14 = &unk_25154BA70;
    v15 = self;
    v4 = &v11;
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke_2;
    v9 = &unk_25154BA70;
    v10 = self;
    v4 = &v6;
  }
  -[NSArray bs_map:](colors, "bs_map:", v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "colorWithAlphaComponent:", (*(double *)(*(_QWORD *)(a1 + 32) + 16) + 1.0) * 0.5 + 0.0);
}

id __48__PUIStyleDiscreteColors_variationAppliedColors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PUIColorValues *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;

  v3 = a2;
  v4 = -[PUIColorValues initWithColor:]([PUIColorValues alloc], "initWithColor:", v3);

  v5 = *(double *)(*(_QWORD *)(a1 + 32) + 16) * -0.25;
  -[PUIColorValues hslValues](v4, "hslValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "luminance");
  v8 = v7;

  v9 = fmax(v8 + v5, 0.0);
  if (v9 > 1.0)
    v9 = 1.0;
  v10 = -[PUIColorValues copyWithLuminance:](v4, "copyWithLuminance:", v9);
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

  if (-[PUIStyleDiscreteColors allowsVariation](self, "allowsVariation"))
  {
    -[PUIStyleDiscreteColors variationAppliedColors](self, "variationAppliedColors");
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

- (PUIStyleDiscreteColors)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  PUIStyleDiscreteColors *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("colors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("vibrant"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsVariation"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("variation"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsToResolveVariation"));

  v11 = -[PUIStyleDiscreteColors initWithColors:vibrant:supportsVariation:variationValue:]([PUIStyleDiscreteColors alloc], "initWithColors:vibrant:supportsVariation:variationValue:", v5, v6, v7, v9);
  -[PUIStyleDiscreteColors setNeedsToResolveVariationFromColorStore:](v11, "setNeedsToResolveVariationFromColorStore:", v10);

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
