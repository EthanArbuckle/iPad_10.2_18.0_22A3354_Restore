@implementation PRPosterContentVibrantMonochromeStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentVibrantMonochromeStyle)init
{
  return -[PRPosterContentVibrantMonochromeStyle initWithBackgroundType:](self, "initWithBackgroundType:", 1);
}

- (PRPosterContentVibrantMonochromeStyle)initWithBackgroundType:(unint64_t)a3
{
  PRPosterContentVibrantMonochromeStyle *v4;
  PRPosterContentVibrantMonochromeStyle *v5;
  uint64_t v6;
  UIColor *effectiveColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRPosterContentVibrantMonochromeStyle;
  v4 = -[PRPosterContentVibrantMonochromeStyle init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_backgroundType = a3;
    if (a3 == 1)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_claimAutoreleasedReturnValue();
    effectiveColor = v5->_effectiveColor;
    v5->_effectiveColor = (UIColor *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterContentVibrantMonochromeStyle *v4;
  BOOL v5;

  v4 = (PRPosterContentVibrantMonochromeStyle *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_backgroundType == v4->_backgroundType;
  }

  return v5;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_backgroundType);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)nonVariatedIdentifier
{
  return (NSString *)_PRPosterContentStyleStringForType(-[PRPosterContentVibrantMonochromeStyle type](self, "type"));
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_effectiveColor;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "renderVibrantMonochromeStyle:", self);

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
