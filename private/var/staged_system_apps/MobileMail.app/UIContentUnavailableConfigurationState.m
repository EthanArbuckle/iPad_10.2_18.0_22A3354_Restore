@implementation UIContentUnavailableConfigurationState

- (void)setShowNoMessageSelectedView:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[UIContentUnavailableConfigurationState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:");

}

- (BOOL)showNoMessageSelectedView
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIContentUnavailableConfigurationState objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("com.apple.mobilemail.showNoMessageSelectedView")));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
