@implementation PUIStyleVibrantMaterial

- (BOOL)isEqual:(id)a3
{
  return -[PUIStyleVibrantMaterial isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 1);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIStyleVibrantMaterial isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 1);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL8 v4;
  PUIStyleVibrantMaterial *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIStyleVibrantMaterial *)a3;
  if (self == v6)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStyleVibrantMaterial isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", v6, v4);
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIStyleVibrantMaterial *v6;
  PUIStyleVibrantMaterial *v7;
  char v8;

  v4 = a4;
  v6 = (PUIStyleVibrantMaterial *)a3;
  v7 = v6;
  if (self == v6)
  {
    v8 = 1;
  }
  else if (v6)
  {
    v8 = _PUIStyleCompareUsingIdentifiers(self, v6, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)nonVariatedIdentifier
{
  return (NSString *)NSStringFromPUIStyleType(-[PUIStyleVibrantMaterial type](self, "type"));
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)allowsVariation
{
  return 0;
}

- (BOOL)isSupportedSystemStyle
{
  return 1;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 0;
}

- (BOOL)desiresVibrancyEffectView
{
  return 1;
}

- (int64_t)vibrancyEffectType
{
  return 0;
}

- (UIColor)vibrancyEffectColor
{
  return 0;
}

- (NSString)lutIdentifier
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
