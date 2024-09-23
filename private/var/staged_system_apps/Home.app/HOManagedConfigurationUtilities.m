@implementation HOManagedConfigurationUtilities

+ (BOOL)isProfileInstallationUIAllowed
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  const char *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isProfileUIInstallationAllowed");

  if ((v3 & 1) == 0)
  {
    v4 = HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "+[HOManagedConfigurationUtilities isProfileInstallationUIAllowed]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) profile UI Installation is not allowed", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

+ (id)popProfileDataFromHeadOfInstallationQueue
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "popProfileDataFromHeadOfInstallationQueue"));

  if (!v3)
  {
    v4 = HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10007874C(v5);

  }
  return v3;
}

@end
