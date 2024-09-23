@implementation SDShareSheetLoadingConfiguration

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (NSLocale)hostLocale
{
  return self->_hostLocale;
}

- (void)setHostLocale:(id)a3
{
  objc_storeStrong((id *)&self->_hostLocale, a3);
}

- (SDXPCHelperConnection)helperConnection
{
  return self->_helperConnection;
}

- (void)setHelperConnection:(id)a3
{
  objc_storeStrong((id *)&self->_helperConnection, a3);
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (UISUIActivityViewControllerConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (void)setHostConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_hostConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_hostLocale, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
