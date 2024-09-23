@implementation RCTrimButton

- (id)_title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_TRIM_BUTTON_TITLE"), &stru_1001B2BC0, 0));

  return v3;
}

- (id)_accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_TRIM_BUTTON_TITLE"), &stru_1001B2BC0, 0));

  return v3;
}

- (id)_accessibilityIdentifier
{
  return CFSTR("Trim to selection button");
}

- (id)_largeContentTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_TRIM_BUTTON_TITLE"), &stru_1001B2BC0, 0));

  return v3;
}

@end
