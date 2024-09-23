@implementation RideBookingAccessProxy

+ (id)coordinator
{
  id v3;
  void *v4;
  RideBookingDataCoordinator *v5;
  void *v6;
  id v7;

  if (sub_10048286C())
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = (void *)qword_1014D2FA8;
    if (!qword_1014D2FA8)
    {
      v5 = objc_alloc_init(RideBookingDataCoordinator);
      v6 = (void *)qword_1014D2FA8;
      qword_1014D2FA8 = (uint64_t)v5;

      v4 = (void *)qword_1014D2FA8;
    }
    v7 = v4;
    objc_sync_exit(v3);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)imageCache
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (sub_10048286C())
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = (void *)qword_1014D2FB0;
    if (!qword_1014D2FB0)
    {
      v5 = objc_claimAutoreleasedReturnValue(+[RideBookingImageCache sharedCache](RideBookingImageCache, "sharedCache"));
      v6 = (void *)qword_1014D2FB0;
      qword_1014D2FB0 = v5;

      v4 = (void *)qword_1014D2FB0;
    }
    v7 = v4;
    objc_sync_exit(v3);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)rideBookingCurrentRideBookingSessionCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  unsigned int v6;
  void *v7;
  RidesharingAnalyticsBookingSession *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (sub_10048286C())
  {
    v5 = a1;
    objc_sync_enter(v5);
    v6 = objc_msgSend((id)qword_1014D2FB8, "sessionEnded");
    v7 = (void *)qword_1014D2FB8;
    if (!qword_1014D2FB8 || (v6 & v3) != 0)
    {
      v8 = objc_alloc_init(RidesharingAnalyticsBookingSession);
      v9 = (void *)qword_1014D2FB8;
      qword_1014D2FB8 = (uint64_t)v8;

      v7 = (void *)qword_1014D2FB8;
    }
    v10 = v7;
    objc_sync_exit(v5);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)rideBookingCurrentBookedSessionForAppIdentifier:(id)a3 rideIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  RidesharingAnalyticsBookedSession *v11;
  void *v12;
  RidesharingAnalyticsBookedSession *v13;
  RidesharingAnalyticsBookedSession *v14;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (sub_10048286C())
  {
    v8 = a1;
    objc_sync_enter(v8);
    if (!qword_1014D2FC0)
    {
      v9 = objc_opt_new(NSMutableDictionary);
      v10 = (void *)qword_1014D2FC0;
      qword_1014D2FC0 = (uint64_t)v9;

    }
    v11 = 0;
    if (v6 && v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", v7));
      v13 = (RidesharingAnalyticsBookedSession *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2FC0, "objectForKey:", v12));
      v14 = v13;
      if (v13 && !-[RidesharingAnalyticsBookedSession sessionEnded](v13, "sessionEnded"))
      {
        v11 = v14;
      }
      else
      {
        v11 = objc_alloc_init(RidesharingAnalyticsBookedSession);

        v15 = objc_msgSend(v6, "copy");
        -[RidesharingAnalyticsBookedSession setAppIdentifier:](v11, "setAppIdentifier:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sha1Hash"));
        -[RidesharingAnalyticsBookedSession setSessionId:](v11, "setSessionId:", v16);

        objc_msgSend((id)qword_1014D2FC0, "setObject:forKey:", v11, v12);
      }

    }
    objc_sync_exit(v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
