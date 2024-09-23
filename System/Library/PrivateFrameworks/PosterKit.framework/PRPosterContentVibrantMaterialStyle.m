@implementation PRPosterContentVibrantMaterialStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)nonVariatedIdentifier
{
  return (NSString *)_PRPosterContentStyleStringForType(-[PRPosterContentVibrantMaterialStyle type](self, "type"));
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "renderVibrantMaterialStyle:", self);

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

@end
