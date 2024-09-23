@implementation UGCThirdPartyPhotoSharingPreferencesManager

+ (id)sharedManager
{
  if (qword_1014D2AE0 != -1)
    dispatch_once(&qword_1014D2AE0, &stru_1011BDBF8);
  return (id)qword_1014D2AD8;
}

- (UGCThirdPartyPhotoSharingPreferencesManager)init
{
  UGCThirdPartyPhotoSharingPreferencesManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UGCThirdPartyPhotoSharingPreferencesManager;
  v2 = -[UGCThirdPartyPhotoSharingPreferencesManager init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.Maps.UGCThirdPartyPhotoSharingPreferencesManagerQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (BOOL)hasDeviceReadServerSettings
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UGCThirdPartyPhotoSharingDeviceHasReadServerSetting"));

  return v3;
}

- (void)fetchThirdPartyPhotoSharingPreferencesWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005FA74C;
  v7[3] = &unk_1011AE240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)updateThirdPartyPhotoSharingPreferences:(BOOL)a3 versionID:(id)a4 completion:(id)a5
{
  -[UGCThirdPartyPhotoSharingPreferencesManager _updateThirdPartyPhotoSharingPreferences:versionID:eraseServerSavedSetting:completion:](self, "_updateThirdPartyPhotoSharingPreferences:versionID:eraseServerSavedSetting:completion:", a3, a4, 0, a5);
}

- (void)debugEraseServerSavedThirdPartyPhotoSharingPreference
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005FAC64;
  v3[3] = &unk_1011BDC88;
  objc_copyWeak(&v4, &location);
  -[UGCThirdPartyPhotoSharingPreferencesManager fetchThirdPartyPhotoSharingPreferencesWithCompletion:](self, "fetchThirdPartyPhotoSharingPreferencesWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateThirdPartyPhotoSharingPreferences:(BOOL)a3 versionID:(id)a4 eraseServerSavedSetting:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *workQueue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  UGCThirdPartyPhotoSharingPreferencesManager *v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v10 = a4;
  v11 = a6;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005FAD98;
  v15[3] = &unk_1011BDCB0;
  v19 = a5;
  v20 = a3;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(workQueue, v15);

}

- (void)_setDefaultsKeyForPreferences:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  v4 = sub_1005FA9A4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating defaults with newest preferences", v8, 2u);
  }

  v6 = objc_msgSend(v3, "hasOptIn");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setBool:forKey:", v6, CFSTR("UGCThirdPartyPhotoSharingDeviceHasReadServerSetting"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
