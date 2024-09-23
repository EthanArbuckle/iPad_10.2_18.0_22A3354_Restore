@implementation MTPrivacyUtil

+ (NSNumber)deviceAgreedTermsVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MTDeviceAgreedTermsVersion")));

  return (NSNumber *)v3;
}

+ (BOOL)allowReporting
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceAgreedTermsVersion"));
  v3 = (uint64_t)objc_msgSend(v2, "integerValue") > 1;

  return v3;
}

+ (NSString)cloudSyncVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MTAgreedTermsCloudSyncVersion")));

  return (NSString *)v3;
}

+ (BOOL)shouldShowPodcastsTermsScreen
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceAgreedTermsVersion"));
  v3 = (uint64_t)objc_msgSend(v2, "integerValue") < 2;

  return v3;
}

+ (BOOL)privacyAcknowledgementNeeded
{
  if ((objc_msgSend(a1, "shouldShowPodcastsTermsScreen") & 1) != 0)
    return 1;
  else
    return +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:", kMTPodcastsPrivacyIdentifier);
}

+ (void)markAsAgreedToLatestTerms
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceAgreedTermsVersion"));
  v4 = (uint64_t)objc_msgSend(v3, "integerValue");

  if (v4 <= 1)
  {
    objc_msgSend(a1, "setDeviceAgreedTermsVersion:", &off_1004D60A0);
    objc_msgSend(a1, "setCloudSyncIsDirty:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
    objc_msgSend(v5, "syncTermsVersion");

  }
}

+ (void)resetToInitialState
{
  objc_msgSend(a1, "setDeviceAgreedTermsVersion:", 0);
  objc_msgSend(a1, "setAccountAgreedTermsVersion:", 0);
  objc_msgSend(a1, "setCloudSyncVersion:", 0);
  objc_msgSend(a1, "setCloudSyncIsDirty:", 0);
}

+ (void)setDeviceAgreedTermsVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("MTDeviceAgreedTermsVersion"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("MTDeviceAgreedTermsVersion"));

}

+ (NSNumber)accountAgreedTermsVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MTAccountAgreedTermsVersion")));

  return (NSNumber *)v3;
}

+ (void)setAccountAgreedTermsVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("MTAccountAgreedTermsVersion"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("MTAccountAgreedTermsVersion"));

}

+ (BOOL)cloudSyncIsDirty
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MTAgreedTermsCloudSyncIsDirty"));

  return v3;
}

+ (void)setCloudSyncIsDirty:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("MTAgreedTermsCloudSyncIsDirty"));

}

+ (void)setCloudSyncVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("MTAgreedTermsCloudSyncVersion"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("MTAgreedTermsCloudSyncVersion"));

}

@end
