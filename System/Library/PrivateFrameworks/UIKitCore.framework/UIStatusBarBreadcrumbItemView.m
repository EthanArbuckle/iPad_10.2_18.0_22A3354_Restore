@implementation UIStatusBarBreadcrumbItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = objc_msgSend(v5, "rawData");
  if (*(_BYTE *)(v6 + 2537))
  {
    v7 = v6 + 2537;
    -[UIStatusBarBreadcrumbItemView setSystemNavigationAction:](self, "setSystemNavigationAction:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "systemNavigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarBreadcrumbItemView setSystemNavigationAction:](self, "setSystemNavigationAction:", v9);

    -[UIStatusBarBreadcrumbItemView systemNavigationAction](self, "systemNavigationAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleForDestination:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIStatusBarBreadcrumbItemView destinationText](self, "destinationText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v8);

  if ((v12 & 1) == 0)
  {
    -[UIStatusBarBreadcrumbItemView setDestinationText:](self, "setDestinationText:", v8);
    -[UIStatusBarSystemNavigationItemView setCurrentLabelCompressionLevel:](self, "setCurrentLabelCompressionLevel:", 0);
  }
  -[UIStatusBarBreadcrumbItemView shortenedTitleWithCompressionLevel:](self, "shortenedTitleWithCompressionLevel:", -[UIStatusBarSystemNavigationItemView currentLabelCompressionLevel](self, "currentLabelCompressionLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("breadcrumb"));
  -[UIStatusBarSystemNavigationItemView title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v13);

  if ((v15 & 1) == 0)
    -[UIStatusBarSystemNavigationItemView setTitle:](self, "setTitle:", v13);

  return v15 ^ 1;
}

- (int64_t)labelLineBreakMode
{
  return 4;
}

- (void)userDidActivateButton:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[UIStatusBarBreadcrumbItemView systemNavigationAction](self, "systemNavigationAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSendResponse");

  if (v5)
  {
    -[UIStatusBarBreadcrumbItemView systemNavigationAction](self, "systemNavigationAction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendResponseForDestination:", 0);

  }
}

- (id)shortenedTitleWithCompressionLevel:(int)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    _UILocalizedStringInSystemLanguage(CFSTR("StatusBar: BackBreadcrumb"), CFSTR("%@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarBreadcrumbItemView destinationText](self, "destinationText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (double)extraRightPadding
{
  double v2;

  -[UIStatusBarItemView standardPadding](self, "standardPadding");
  return 7.0 - v2;
}

- (UISystemNavigationAction)systemNavigationAction
{
  return self->_systemNavigationAction;
}

- (void)setSystemNavigationAction:(id)a3
{
  objc_storeStrong((id *)&self->_systemNavigationAction, a3);
}

- (NSString)destinationText
{
  return self->_destinationText;
}

- (void)setDestinationText:(id)a3
{
  objc_storeStrong((id *)&self->_destinationText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationText, 0);
  objc_storeStrong((id *)&self->_systemNavigationAction, 0);
}

@end
