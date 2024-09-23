@implementation STUIStatusBarIndicatorLiquidDetectionItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0CE8];
}

- (id)systemImageNameForUpdate:(id)a3
{
  if (-[STUIStatusBarIndicatorLiquidDetectionItem useFullColorIndicator](self, "useFullColorIndicator", a3))
    return 0;
  else
    return CFSTR("drop.triangle.fill");
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
