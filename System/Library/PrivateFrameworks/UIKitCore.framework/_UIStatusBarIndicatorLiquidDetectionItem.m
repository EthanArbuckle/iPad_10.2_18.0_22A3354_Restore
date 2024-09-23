@implementation _UIStatusBarIndicatorLiquidDetectionItem

- (id)indicatorEntryKey
{
  return CFSTR("liquidDetectionEntry");
}

- (BOOL)isTemplateImage
{
  return !-[_UIStatusBarIndicatorLiquidDetectionItem useFullColorIndicator](self, "useFullColorIndicator");
}

- (id)systemImageNameForUpdate:(id)a3
{
  if (-[_UIStatusBarIndicatorLiquidDetectionItem useFullColorIndicator](self, "useFullColorIndicator", a3))
    return 0;
  else
    return CFSTR("drop.triangle.fill");
}

- (id)imageNameForUpdate:(id)a3
{
  return CFSTR("LiquidDetection");
}

- (BOOL)useFullColorIndicator
{
  return self->_useFullColorIndicator;
}

- (void)setUseFullColorIndicator:(BOOL)a3
{
  self->_useFullColorIndicator = a3;
}

@end
