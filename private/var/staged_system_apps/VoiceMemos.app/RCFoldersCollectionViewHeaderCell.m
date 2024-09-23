@implementation RCFoldersCollectionViewHeaderCell

- (void)updateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCFoldersCollectionViewHeaderCell;
  -[RCFoldersCollectionViewHeaderCell updateConfigurationUsingState:](&v7, "updateConfigurationUsingState:", a3);
  if (-[RCFoldersCollectionViewHeaderCell _shouldUseAccompaniedSidebarStyle](self, "_shouldUseAccompaniedSidebarStyle"))
    v4 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration sidebarHeaderConfiguration](UIListContentConfiguration, "sidebarHeaderConfiguration"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewHeaderCell _headingText](self, "_headingText"));
  objc_msgSend(v5, "setText:", v6);

  -[RCFoldersCollectionViewHeaderCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (void)restyle
{
  -[RCFoldersCollectionViewHeaderCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (BOOL)_shouldUseAccompaniedSidebarStyle
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "sidebarCollectionViewHeaderCellUsesAccompaniedSidebarStyle");

  return v3;
}

- (id)_headingText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MY_FOLDERS"), &stru_1001B2BC0, 0));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewHeaderCell _headingText](self, "_headingText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));

  return v3;
}

@end
