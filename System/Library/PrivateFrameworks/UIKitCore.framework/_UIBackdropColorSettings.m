@implementation _UIBackdropColorSettings

- (double)averageBrightness
{
  return 0.5;
}

- (double)contrast
{
  return 0.0;
}

- (double)averageSaturation
{
  return 0.0;
}

- (void)setParentSettings:(id)a3
{
  self->_parentSettings = (_UIBackdropViewSettings *)a3;
}

- (void)setDefaultValues
{
  self->_hasObservedValues = 0;
}

- (double)averageHue
{
  return 0.0;
}

- (BOOL)applyCABackdropLayerStatistics:(id)a3
{
  return 0;
}

- (UIColor)color
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 1.0);
}

- (_UIBackdropViewSettings)parentSettings
{
  return self->_parentSettings;
}

- (BOOL)hasObservedValues
{
  return self->_hasObservedValues;
}

- (void)setHasObservedValues:(BOOL)a3
{
  self->_hasObservedValues = a3;
}

@end
