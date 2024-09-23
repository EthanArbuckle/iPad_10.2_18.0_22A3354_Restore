@implementation RCWelcomeUtilities

+ (int64_t)reasonToShow
{
  void *v2;
  unsigned __int8 v3;
  int64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t MajorComponent;
  _OWORD v14[2];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("RCDebugShowWelcome"));

  if ((v3 & 1) != 0)
    return 3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v6 = objc_msgSend(v5, "isMultiUser");

  if ((v6 & 1) != 0)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForKey:", CFSTR("voicememos.welcome.last_completed")));

  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    _LSVersionNumberMakeWithString(&v18, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "infoDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleShortVersionString")));

    v16 = 0u;
    v17 = 0u;
    _LSVersionNumberMakeWithString(&v16, v11);
    v15[0] = v16;
    v15[1] = v17;
    MajorComponent = _LSVersionNumberGetMajorComponent(v15);
    v14[0] = v18;
    v14[1] = v19;
    LODWORD(MajorComponent) = MajorComponent > _LSVersionNumberGetMajorComponent(v14);

    v4 = 2 * MajorComponent;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (void)finishShowingWelcomeScreen
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infoDictionary"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleShortVersionString")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("voicememos.welcome.last_completed"));

}

@end
