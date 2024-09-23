@implementation MTRestrictionsLaunchUtil

+ (void)presentExplicitRestrictionLaunchAlertIfNeeded
{
  if (objc_msgSend(a1, "shouldDisplayExplicitRestrictionAlert"))
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1004AADF8);
}

+ (BOOL)shouldDisplayExplicitRestrictionAlert
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  if ((+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed") & 1) != 0|| (objc_msgSend(a1, "_isExplicitContentDisallowedInCurrentStoreFront") & 1) != 0)
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_userDefaultsKeyForExplicitRestrictionAlert"));
  if (v5 && (uint64_t)objc_msgSend(v4, "integerForKey:", v5) <= 0)
    v3 = objc_msgSend(a1, "_isExplicitContentRestrictedByDefaultInCurrentStoreFront");
  else
    v3 = 0;

  return v3;
}

+ (void)didDisplayExplicitRestrictionAlert
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_userDefaultsKeyForExplicitRestrictionAlert"));
  if (v3)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "setInteger:forKey:", (char *)objc_msgSend(v2, "integerForKey:", v3) + 1, v3);

  }
}

+ (BOOL)_isExplicitContentRestrictedByDefaultInCurrentStoreFront
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "BOOLForKey:", CFSTR("ExplicitOffAndPreferencesEnabled")));
  if (objc_msgSend(v3, "isLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueWithError:", 0));
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_isExplicitContentDisallowedInCurrentStoreFront
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "BOOLForKey:", CFSTR("ExplicitOffAndPreferencesDisabled")));
  if (objc_msgSend(v3, "isLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueWithError:", 0));
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_userDefaultsKeyForExplicitRestrictionAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_altDSID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("SSRestrictionsExplicitRestrictionAlertTypeOnLaunchCount"), "stringByAppendingString:", CFSTR(".")));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v4));

  }
  else
  {
    v6 = CFSTR("SSRestrictionsExplicitRestrictionAlertTypeOnLaunchCount");
  }

  return v6;
}

@end
