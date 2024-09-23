@implementation CUUserNotificationSession

+ (id)cad_sessionWithContent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  objc_msgSend(v5, "setBundleID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "categoryIdentifier"));
  objc_msgSend(v5, "setCategoryID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "setFlags:", objc_msgSend(v4, "flags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconSystemName"));
  objc_msgSend(v5, "setIconSystemName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconName"));
  objc_msgSend(v5, "setIconName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleKey"));
  objc_msgSend(v5, "setTitleKey:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleArguments"));
  objc_msgSend(v5, "setTitleArguments:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bodyKey"));
  objc_msgSend(v5, "setBodyKey:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bodyArguments"));
  objc_msgSend(v5, "setBodyArguments:", v14);

  return v5;
}

@end
