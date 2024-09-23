@implementation GKLocalPlayerInternal

+ (id)_profileArchiveURLEnsuringDirectory:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[GKClientProxy cacheDirectoryForBundleID:](GKClientProxy, "cacheDirectoryForBundleID:", 0));
  v5 = (void *)v4;
  if (v3)
    v6 = (id)gkEnsureDirectory(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("GKLocalPlayer.offline")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  return v8;
}

+ (void)archiveProfile:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_profileArchiveURLEnsuringDirectory:", 1));
  v10 = 0;
  v6 = objc_msgSend(v4, "writeToURL:options:error:", v5, 1, &v10);
  v7 = v10;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100027A94();
  }

}

+ (id)archivedProfile
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_profileArchiveURLEnsuringDirectory:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v2));

  if (v3)
  {
    v11 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GKPlayerInternal, v4), v3, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = v11;
    v8 = v7;
    if (v7)
    {
      if (!os_log_GKGeneral)
        v9 = (id)GKOSLoggers(v7);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100027AFC();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateWithCacheObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKLocalPlayerInternal;
  v4 = a3;
  -[GKLocalPlayerInternal updateWithCacheObject:](&v9, "updateWithCacheObject:", v4);
  -[GKLocalPlayerInternal setUnderage:](self, "setUnderage:", objc_msgSend(v4, "isUnderage", v9.receiver, v9.super_class));
  -[GKLocalPlayerInternal setPurpleBuddyAccount:](self, "setPurpleBuddyAccount:", objc_msgSend(v4, "purpleBuddyAccount"));
  -[GKLocalPlayerInternal setDefaultNickname:](self, "setDefaultNickname:", objc_msgSend(v4, "defaultNickname"));
  -[GKLocalPlayerInternal setDefaultPrivacyVisibility:](self, "setDefaultPrivacyVisibility:", objc_msgSend(v4, "defaultPrivacyVisibility"));
  -[GKLocalPlayerInternal setDefaultContactsIntegrationConsent:](self, "setDefaultContactsIntegrationConsent:", objc_msgSend(v4, "defaultContactsIntegrationConsent"));
  -[GKLocalPlayerInternal setFindable:](self, "setFindable:", objc_msgSend(v4, "isFindable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendRequestList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entries"));
  -[GKLocalPlayerInternal setNumberOfRequests:](self, "setNumberOfRequests:", (unsigned __int16)objc_msgSend(v6, "count"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "challengeList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entries"));
  -[GKLocalPlayerInternal setNumberOfChallenges:](self, "setNumberOfChallenges:", (unsigned __int16)objc_msgSend(v8, "count"));

  LOWORD(v7) = (unsigned __int16)objc_msgSend(v4, "numberOfTurns");
  -[GKLocalPlayerInternal setNumberOfTurns:](self, "setNumberOfTurns:", (unsigned __int16)v7);
}

@end
