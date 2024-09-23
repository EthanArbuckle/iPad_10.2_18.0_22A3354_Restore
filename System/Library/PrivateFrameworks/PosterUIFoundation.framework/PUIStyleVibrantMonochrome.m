@implementation PUIStyleVibrantMonochrome

- (PUIStyleVibrantMonochrome)init
{
  return -[PUIStyleVibrantMonochrome initWithBackgroundType:](self, "initWithBackgroundType:", 1);
}

- (PUIStyleVibrantMonochrome)initWithBackgroundType:(unint64_t)a3
{
  PUIStyleVibrantMonochrome *v4;
  PUIStyleVibrantMonochrome *v5;
  uint64_t v6;
  UIColor *effectiveColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUIStyleVibrantMonochrome;
  v4 = -[PUIStyleVibrantMonochrome init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_backgroundType = a3;
    if (a3 == 1)
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v6 = objc_claimAutoreleasedReturnValue();
    effectiveColor = v5->_effectiveColor;
    v5->_effectiveColor = (UIColor *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return -[PUIStyleVibrantMonochrome isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 1);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIStyleVibrantMonochrome isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 1);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  PUIStyleVibrantMonochrome *v5;
  BOOL v6;

  v5 = (PUIStyleVibrantMonochrome *)a3;
  if (v5 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStyleVibrantMonochrome isEqualToStyle:](self, "isEqualToStyle:", v5);
  }

  return v6;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIStyleVibrantMonochrome *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIStyleVibrantMonochrome *)a3;
  if (v6 == self)
  {
    v7 = 1;
  }
  else if (_PUIStyleCompareUsingIdentifiers(self, v6, v4))
  {
    v7 = self->_backgroundType == v6->_backgroundType;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_backgroundType);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  return (NSString *)NSStringFromPUIStyleType(-[PUIStyleVibrantMonochrome type](self, "type"));
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_effectiveColor;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)type
{
  return 3;
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
  return 2;
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

- (PUIStyleVibrantMonochrome)initWithCoder:(id)a3
{
  return -[PUIStyleVibrantMonochrome initWithBackgroundType:](self, "initWithBackgroundType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_backgroundType")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_backgroundType, CFSTR("_backgroundType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBackgroundType:", self->_backgroundType);
}

- (unint64_t)backgroundType
{
  return self->_backgroundType;
}

- (UIColor)effectiveColor
{
  return self->_effectiveColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveColor, 0);
}

@end
