@implementation STUAskAlertTextProvider_iOS

- (NSString)openAppTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your teacher wants to open an app on your iPad"), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (NSString)openAppMessage
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("“Always Allow” will allow any of your teachers to open apps on your iPad. This can be configured in Settings."), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (id)openAppTitleWithInstructorName:(id)a3
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ wants to open an app on your iPad"), &stru_1000CDD50, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  return v7;
}

- (NSString)openURLTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your teacher wants to open a link on your iPad"), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (NSString)openURLMessage
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("“Always Allow” will allow any of your teachers to open links on your iPad. This can be configured in Settings."), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (id)openURLTitleWithInstructorName:(id)a3
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ wants to open a link on your iPad"), &stru_1000CDD50, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  return v7;
}

- (NSString)lockDeviceTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your teacher wants to lock your iPad"), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (NSString)lockDeviceMessage
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("“Always Allow” will allow any of your teachers to lock your iPad. This can be configured in Settings."), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (id)lockDeviceTitleWithInstructorName:(id)a3
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ wants to lock your iPad"), &stru_1000CDD50, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  return v7;
}

- (NSString)screenObserveTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your teacher wants to view your screen"), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (NSString)screenObserveMessageLocal
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("“Always Allow” will allow any of your teachers to view your screen or AirPlay your iPad. This can be configured in Settings."), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (NSString)screenObserveMessageRemote
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("“Allow” will allow any of your teachers to view the screen of your iPad for this session only. This can be configured in Settings."), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (id)screenObserveTitleWithInstructorName:(id)a3
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ wants to view your screen"), &stru_1000CDD50, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  return v7;
}

- (NSString)airPlayTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Your teacher wants to AirPlay your iPad"), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (NSString)airPlayMessage
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("“Always Allow” will allow any of your teachers to AirPlay your iPad or view your screen. This can be configured in Settings."), &stru_1000CDD50, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));

  return (NSString *)v5;
}

- (id)airPlayTitleWithInstructorName:(id)a3
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@ wants to AirPlay your iPad"), &stru_1000CDD50, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3));

  return v7;
}

@end
