@implementation CRVehicleStoreAvailability

+ (BOOL)isVehicleStoreAvailable
{
  if ((byte_1000DB800 & 1) != 0)
    return 1;
  objc_msgSend(a1, "_updateUnlockedSinceBoot");
  return byte_1000DB800;
}

+ (void)_updateUnlockedSinceBoot
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = MKBDeviceUnlockedSinceBoot(a1, a2);
  v3 = v2;
  if (!(_DWORD)v2)
  {
    v6 = CarGeneralLogging(v2);
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "before first unlock", v8, 2u);
LABEL_9:
    LOBYTE(v3) = 0;
    goto LABEL_10;
  }
  if ((_DWORD)v2 != 1)
  {
    v7 = CarGeneralLogging(v2);
    v5 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100068E30(v3, v5);
    goto LABEL_9;
  }
  v4 = CarGeneralLogging(v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    LOBYTE(v3) = 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "completed first unlock", buf, 2u);
  }
LABEL_10:

  byte_1000DB800 = v3;
}

+ (void)registerForAvailabilityEvent
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  xpc_object_t v6;
  uint8_t v7[16];

  v3 = CarGeneralLogging(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "waiting for first unlock", v7, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)sub_10000AF44, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "Notification", "com.apple.mobile.keybagd.first_unlock");
  xpc_set_event("com.apple.notifyd.matching", "com.apple.mobile.keybagd.first_unlock", v6);

}

+ (void)handleAvailabilityEvent
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(a1, "_updateUnlockedSinceBoot");
  v3 = objc_msgSend(a1, "isVehicleStoreAvailable");
  if ((_DWORD)v3)
  {
    v4 = CarGeneralLogging(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "completed first unlock", v8, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0);
    xpc_set_event("com.apple.notifyd.matching", "com.apple.mobile.keybagd.first_unlock", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:", CRVehicleStoreAvailabilityDidChangeNotification, 0);

  }
}

+ (id)notifydEventName
{
  return CFSTR("com.apple.mobile.keybagd.first_unlock");
}

@end
