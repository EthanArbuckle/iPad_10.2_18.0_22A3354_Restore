@implementation STUAskOperation_iOS

- (id)joinClassPromptOptions
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[6];

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Join %@?"), &stru_1000CDD50, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enrollmentRecord"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8));

  v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Join"), &stru_1000CDD50, 0));

  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Not Now"), &stru_1000CDD50, 0));

  v18[0] = kCFUserNotificationAlertHeaderKey;
  v18[1] = kCFUserNotificationDefaultButtonTitleKey;
  v19[0] = v9;
  v19[1] = v12;
  v18[2] = kCFUserNotificationAlternateButtonTitleKey;
  v18[3] = kCFUserNotificationAlertTopMostKey;
  v19[2] = v15;
  v19[3] = &__kCFBooleanTrue;
  v18[4] = SBUserNotificationDismissOnLock;
  v18[5] = SBUserNotificationDontDismissOnUnlock;
  v19[4] = &__kCFBooleanFalse;
  v19[5] = &__kCFBooleanTrue;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 6));

  return v16;
}

- (unint64_t)joinClassPromptFlags
{
  return 3;
}

- (BOOL)handleJoinClassPromptResponse:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[STUAskOperation denyJoinPrompt](self, "denyJoinPrompt");
    return 1;
  }
  if (!a3)
  {
    -[STUAskOperation acceptJoinPrompt](self, "acceptJoinPrompt");
    return 1;
  }
  return 0;
}

- (id)askPermissionPromptOptions
{
  NSBundle *v3;
  void *v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Don’t Allow"), &stru_1000CDD50, 0));

  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Allow"), &stru_1000CDD50, 0));

  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CRKDevice));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Always Allow"), &stru_1000CDD50, 0));

  v12 = objc_alloc((Class)NSMutableDictionary);
  v17[0] = kCFUserNotificationDefaultButtonTitleKey;
  v17[1] = kCFUserNotificationAlternateButtonTitleKey;
  v17[2] = kCFUserNotificationAlertTopMostKey;
  v17[3] = SBUserNotificationDismissOnLock;
  v18[2] = &__kCFBooleanTrue;
  v18[3] = &__kCFBooleanFalse;
  v18[0] = v5;
  v18[1] = v8;
  v17[4] = SBUserNotificationDontDismissOnUnlock;
  v18[4] = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 5));
  v14 = objc_msgSend(v12, "initWithDictionary:", v13);

  if (-[STUAskOperation supportsAlwaysAllow](self, "supportsAlwaysAllow"))
    objc_msgSend(v14, "setObject:forKey:", v11, kCFUserNotificationOtherButtonTitleKey);
  v15 = objc_msgSend(v14, "copy");

  return v15;
}

- (unint64_t)askPermissionPromptFlags
{
  return 3;
}

- (BOOL)handleAskPermissionPromptResponse:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      -[STUAskOperation alwaysAllowPermissionPrompt](self, "alwaysAllowPermissionPrompt");
      return 1;
    case 1uLL:
      -[STUAskOperation acceptPermissionPrompt](self, "acceptPermissionPrompt");
      return 1;
    case 0uLL:
      -[STUAskOperation denyPermissionPrompt](self, "denyPermissionPrompt");
      return 1;
  }
  return 0;
}

@end
