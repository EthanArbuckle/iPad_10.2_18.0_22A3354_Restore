@implementation VUIAccountConfig

- (void)setShowAccountSettingOnSidebar:(BOOL)a3
{
  self->_showAccountSettingOnSidebar = a3;
}

- (void)setShowAccountSettingButtonOnLibraryTab:(BOOL)a3
{
  self->_showAccountSettingButtonOnLibraryTab = a3;
}

- (VUIAccountConfig)init
{
  VUIAccountConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIAccountConfig;
  result = -[VUIAccountConfig init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_showAccountSettingButtonOnLibraryTab = 257;
  return result;
}

- (BOOL)showAccountSettingButtonOnLibraryTab
{
  return self->_showAccountSettingButtonOnLibraryTab;
}

- (BOOL)showAccountSettingOnSidebar
{
  return self->_showAccountSettingOnSidebar;
}

@end
