@implementation VUIPlayerTabsConfig

- (BOOL)infoTabMustHaveImageToDisplay
{
  return self->_infoTabMustHaveImageToDisplay;
}

- (void)setInfoTabMustHaveImageToDisplay:(BOOL)a3
{
  self->_infoTabMustHaveImageToDisplay = a3;
}

- (VUIPlayerTabsConfig)init
{
  VUIPlayerTabsConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIPlayerTabsConfig;
  result = -[VUIPlayerTabsConfig init](&v3, sel_init);
  if (result)
    result->_infoTabMustHaveImageToDisplay = 0;
  return result;
}

@end
