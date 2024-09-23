@implementation SESMobileAssetClient

- (SESMobileAssetClient)initWithManager:(id)a3
{
  id v4;
  SESMobileAssetClient *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  id v11;
  _BOOL8 v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OS_dispatch_queue *queue;
  SESMobileAssetClient *v23;
  NSObject *v24;
  _QWORD v26[4];
  SESMobileAssetClient *v27;
  _QWORD v28[4];
  NSObject *p_super;
  uint8_t buf[16];
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SESMobileAssetClient;
  v5 = -[SESMobileAssetClient init](&v31, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v10 = dispatch_queue_create("com.apple.seserviced.mobileassetclient", v9);
    -[SESMobileAssetClient setQueue:](v5, "setQueue:", v10);

    v11 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
    -[SESMobileAssetClient setUserDefaults:](v5, "setUserDefaults:", v11);

    -[SESMobileAssetClient setMobileAssetManager:](v5, "setMobileAssetManager:", v4);
    -[SESMobileAssetClient setMetadataQueryInterval:](v5, "setMetadataQueryInterval:", 172800.0);
    -[SESMobileAssetClient setRetryInProgress:](v5, "setRetryInProgress:", 0);
    v5->_errorCount = -[NSUserDefaults integerForKey:](v5->_userDefaults, "integerForKey:", CFSTR("downloadErrorCount"));
    -[SESMobileAssetClient setCurrentCompatibilityVersion:](v5, "setCurrentCompatibilityVersion:", objc_msgSend(v4, "currentCompatibilityVersion"));
    -[SESMobileAssetClient setDownloadTimeoutInterval:](v5, "setDownloadTimeoutInterval:", 0);
    v12 = -[NSUserDefaults BOOLForKey:](v5->_userDefaults, "BOOLForKey:", CFSTR("mobileasset.isUserInitiated"));
    v5->_userInitiated = v12;
    if (SESInternalVariant(v12))
    {
      v13 = -[NSUserDefaults BOOLForKey:](v5->_userDefaults, "BOOLForKey:", CFSTR("debug.mobileasset.disable"));
      if (v13)
      {
        v15 = SESDefaultLogObject(v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "MobileAsset disabled by internal preference", buf, 2u);
        }
        goto LABEL_10;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](v5, "userDefaults"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("debug.mobileasset.metadataQueryInterval")));

      if (v18)
      {
        objc_msgSend(v18, "doubleValue");
        -[SESMobileAssetClient setMetadataQueryInterval:](v5, "setMetadataQueryInterval:");
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](v5, "userDefaults"));
      -[SESMobileAssetClient setDownloadTimeoutInterval:](v5, "setDownloadTimeoutInterval:", objc_msgSend(v19, "integerForKey:", CFSTR("debug.mobileasset.downloadTimeoutInterval")));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](v5, "userDefaults"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[SESMobileAssetClient currentCompatibilityVersion](v5, "currentCompatibilityVersion")));
      objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("debug.mobileasset.currentCompatibilityVersion"));

    }
    queue = v5->_queue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10004D74C;
    v28[3] = &unk_100302AC8;
    v23 = v5;
    p_super = &v23->super;
    os_state_add_handler(queue, v28);
    v24 = v5->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004D754;
    v26[3] = &unk_100302AA0;
    v27 = v23;
    dispatch_async(v24, v26);

    v16 = p_super;
LABEL_10:

  }
  return v5;
}

- (void)onAlarm:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SESMobileAssetClient *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D850;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)onDarwinNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SESMobileAssetClient *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D9AC;
  v7[3] = &unk_100304370;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (os_state_data_s)dumpState
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  os_state_data_s *v10;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_retryInProgress));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("retryInProgress"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorCount));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCount"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_userInitiated));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("userInitiated"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("nextMetadataCheck")));
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("nextMetadataCheck"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("catalogDownloadStartedOn")));
  if (v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("catalogDownloadStartedOn"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("assetDownloadStartedOn")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetDownloadStartedOn"));
  v10 = (os_state_data_s *)sub_100015734((uint64_t)"seserviced.mobileassetclient", (uint64_t)v3);

  return v10;
}

- (void)maybeQueryMetadata
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;

  v3 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  +[SESAlarm clearAlarm:](SESAlarm, "clearAlarm:", CFSTR("com.apple.seserviced.download.catalog"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](self, "userDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("nextMetadataCheck")));

  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;
  }
  else
  {
    v7 = -1.0;
  }
  v8 = -[SESMobileAssetClient metadataQueryInterval](self, "metadataQueryInterval");
  if (v7 <= v10)
  {
    v11 = v5;
  }
  else
  {
    -[SESMobileAssetClient metadataQueryInterval](self, "metadataQueryInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](self, "userDefaults"));
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("nextMetadataCheck"));

    v15 = SESDefaultLogObject(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v20 = 134218242;
      v21 = v7;
      v22 = 2112;
      v23 = *(double *)&v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Clamping ttnc %.0f to interval, next check %@", (uint8_t *)&v20, 0x16u);
    }

    v8 = -[SESMobileAssetClient metadataQueryInterval](self, "metadataQueryInterval");
    v7 = v17;
  }
  v18 = SESDefaultLogObject(v8, v9);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = 138412546;
    v21 = *(double *)&v11;
    v22 = 2048;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "nextCheck %@ ttNC %.0f", (uint8_t *)&v20, 0x16u);
  }

  if (v7 <= 0.0)
    -[SESMobileAssetClient queryMetadata](self, "queryMetadata");
  else
    +[SESAlarm setAlarm:secondsFromNow:](SESAlarm, "setAlarm:secondsFromNow:", CFSTR("com.apple.seserviced.download.catalog"), v7);

}

- (void)queryMetadata
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](self, "userDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("catalogDownloadStartedOn")));

  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = fabs(v6);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](self, "userDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("catalogDownloadStartedOn"));

    v7 = 0.0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient optionsForInterval:](self, "optionsForInterval:", v7));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004DF0C;
  v11[3] = &unk_100304AF8;
  v11[4] = self;
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.SecureElementServiceAssets"), v10, v11);

}

- (void)queryMA
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v6 = SESDefaultLogObject(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Querying MA", buf, 2u);
  }

  v8 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.SecureElementServiceAssets"));
  objc_msgSend(v8, "setDoNotBlockBeforeFirstUnlock:", 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004E280;
  v10[3] = &unk_100304B48;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "queryMetaData:", v10);

}

- (void)handleQueryResult:(int64_t)a3 query:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = +[SESAlarm clearAlarm:](SESAlarm, "clearAlarm:", CFSTR("com.apple.seserviced.download.asset"));
  switch(a3)
  {
    case 0:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
      -[SESMobileAssetClient handleQuerySuccess:](self, "handleQuerySuccess:", v14);

      break;
    case 1:
    case 3:
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      v10 = SESDefaultLogObject(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Asset transient error, retrying", v15, 2u);
      }

      -[SESMobileAssetClient retryWithBackoff:](self, "retryWithBackoff:", CFSTR("com.apple.seserviced.download.asset"));
      break;
    case 2:
      -[SESMobileAssetClient queryMetadata](self, "queryMetadata");
      break;
    case 5:
    case 7:
      v12 = SESDefaultLogObject(v8, v9);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Asset fatal error, not retrying", buf, 2u);
      }

      break;
    default:
      break;
  }

}

- (void)handleQuerySuccess:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  Block_layout *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (!v7)
  {

LABEL_26:
    v25 = SESDefaultLogObject(v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Got query success w/ no eligible assets, clearing user initiated flag", buf, 2u);
    }

    -[SESMobileAssetClient setUserInitiated:](self, "setUserInitiated:", 0);
    goto LABEL_29;
  }
  v9 = v7;
  v27 = 0;
  v10 = *(_QWORD *)v29;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v11);
      v13 = SESDefaultLogObject(v7, v8);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetId"));
        v16 = objc_msgSend(v12, "state");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributes"));
        *(_DWORD *)buf = 138412802;
        v33 = v15;
        v34 = 2048;
        v35 = v16;
        v36 = 2112;
        v37 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got asset id %@ state %ld attributes %@", buf, 0x20u);

      }
      v18 = -[SESMobileAssetClient isEligibleAsset:](self, "isEligibleAsset:", v12);
      v7 = objc_msgSend(v12, "state");
      if ((v18 & 1) != 0)
      {
        switch((unint64_t)v7)
        {
          case 0uLL:
            v7 = -[SESMobileAssetClient retryWithBackoff:](self, "retryWithBackoff:", CFSTR("com.apple.seserviced.download.asset"));
            break;
          case 1uLL:
          case 4uLL:
            v7 = -[SESMobileAssetClient downloadAsset:](self, "downloadAsset:", v12);
            v27 = 1;
            break;
          case 2uLL:
          case 5uLL:
          case 6uLL:
            v7 = -[SESMobileAssetClient handleAvailableAsset:](self, "handleAvailableAsset:", v12);
            break;
          case 3uLL:
            v21 = v12;
            v22 = &stru_100304BA8;
            goto LABEL_16;
          default:
            break;
        }
      }
      else if (v7 == (id)2 || (v7 = objc_msgSend(v12, "state"), v7 == (id)3))
      {
        v19 = SESDefaultLogObject(v7, v8);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Purging ineligible asset in installed state", buf, 2u);
        }

        v21 = v12;
        v22 = &stru_100304B88;
LABEL_16:
        v7 = objc_msgSend(v21, "purge:", v22);
      }
      v11 = (char *)v11 + 1;
    }
    while (v9 != v11);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    v9 = v7;
  }
  while (v7);

  if ((v27 & 1) == 0)
    goto LABEL_26;
LABEL_29:

}

- (void)downloadAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](self, "userDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("assetDownloadStartedOn")));

  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = fabs(v8);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient userDefaults](self, "userDefaults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("assetDownloadStartedOn"));

    v9 = 0.0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient optionsForInterval:](self, "optionsForInterval:", v9));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004E8D8;
  v14[3] = &unk_100304B48;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v13, "startDownload:then:", v12, v14);

}

- (void)handleAvailableAsset:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[SESMobileAssetClient isEligibleAsset:](self, "isEligibleAsset:", v4);
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getLocalFileUrl"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient mobileAssetManager](self, "mobileAssetManager"));
      objc_msgSend(v9, "handleDownloadedAsset:", v8);

      v12 = SESDefaultLogObject(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Set downloaded asset successfully", v18, 2u);
      }

      objc_msgSend(v4, "purge:", &stru_100304BE8);
      -[SESMobileAssetClient setErrorCount:](self, "setErrorCount:", 0);
      -[SESMobileAssetClient setUserInitiated:](self, "setUserInitiated:", 0);
    }
    else
    {
      v16 = SESDefaultLogObject(0, v7);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Valid asset w/ no URL?", v19, 2u);
      }

      -[SESMobileAssetClient retryWithBackoff:](self, "retryWithBackoff:", CFSTR("com.apple.seserviced.download.asset"));
    }

  }
  else
  {
    v14 = SESDefaultLogObject(v5, v6);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Purging ineligible asset", buf, 2u);
    }

    objc_msgSend(v4, "purge:", &stru_100304BC8);
  }

}

- (void)retryWithBackoff:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = +[SESAlarm isAlarmSet:](SESAlarm, "isAlarmSet:", v4);
  if ((_DWORD)v6)
  {
    v8 = SESDefaultLogObject(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Already have alarm for %@ ...", (uint8_t *)&v17, 0xCu);
    }

  }
  else
  {
    v10 = -[SESMobileAssetClient errorCount](self, "errorCount");
    if (v10 >= 6)
      v11 = 6;
    else
      v11 = v10;
    v12 = dword_100287DB8[v11];
    v13 = -[SESMobileAssetClient setErrorCount:](self, "setErrorCount:", -[SESMobileAssetClient errorCount](self, "errorCount") + 1);
    v15 = SESDefaultLogObject(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v4;
      v19 = 2048;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Scheduling retry of %@ for %lu seconds from now", (uint8_t *)&v17, 0x16u);
    }

    +[SESAlarm setAlarm:secondsFromNow:](SESAlarm, "setAlarm:secondsFromNow:", v4, (double)v12);
  }

}

- (BOOL)isEligibleAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v21;
  _BYTE v22[18];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = -[SESMobileAssetClient currentCompatibilityVersion](self, "currentCompatibilityVersion");
  if (v8 != v7)
  {
    v19 = SESDefaultLogObject(v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v21 = 67109376;
      *(_DWORD *)v22 = v7;
      *(_WORD *)&v22[4] = 2048;
      *(_QWORD *)&v22[6] = -[SESMobileAssetClient currentCompatibilityVersion](self, "currentCompatibilityVersion");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Asset ineligible, asset compatVersion %d mine %lu", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SESMobileAssetClient mobileAssetManager](self, "mobileAssetManager"));
  v11 = objc_msgSend(v10, "currentContentVersion");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_ContentVersion")));

  v14 = -[NSObject unsignedIntValue](v13, "unsignedIntValue");
  v16 = (unint64_t)v11 < v14;
  if ((unint64_t)v11 >= v14)
  {
    v17 = SESDefaultLogObject(v14, v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v21 = 138412546;
      *(_QWORD *)v22 = v13;
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Asset CV %@ <= currentCV %lu", (uint8_t *)&v21, 0x16u);
    }

LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (id)optionsForInterval:(double)a3
{
  void *v5;
  void *v6;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;

  v5 = (void *)objc_opt_new(MADownloadOptions);
  v6 = v5;
  v8 = a3 < 259200.0 && !self->_userInitiated;
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", v8);
  v9 = !self->_userInitiated && a3 < 518400.0;
  objc_msgSend(v6, "setDiscretionary:", v9);
  v10 = self->_userInitiated || a3 > 518400.0;
  objc_msgSend(v6, "setAllowsCellularAccess:", v10);
  v12 = a3 > 777600.0 || self->_userInitiated;
  if (SESInternalVariant(objc_msgSend(v6, "setAllowsExpensiveAccess:", v12))
    && -[SESMobileAssetClient downloadTimeoutInterval](self, "downloadTimeoutInterval"))
  {
    objc_msgSend(v6, "setTimeoutIntervalForResource:", -[SESMobileAssetClient downloadTimeoutInterval](self, "downloadTimeoutInterval"));
  }
  objc_msgSend(v6, "logOptions");
  return v6;
}

- (void)setErrorCount:(unsigned int)a3
{
  self->_errorCount = a3;
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:");
}

- (void)triggerUserInitiatedSync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F0B8;
  block[3] = &unk_100302AA0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setUserInitiated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_userInitiated = v3;
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", v3, CFSTR("mobileasset.isUserInitiated"));
}

+ (unint64_t)getWeeksTryingToDownload
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.seserviced"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("catalogDownloadStartedOn")));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = fabs(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("assetDownloadStartedOn")));
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = fabs(v7);

  return (unint64_t)(fmax(v5, v8) / 604800.0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (double)metadataQueryInterval
{
  return self->_metadataQueryInterval;
}

- (void)setMetadataQueryInterval:(double)a3
{
  self->_metadataQueryInterval = a3;
}

- (int64_t)downloadTimeoutInterval
{
  return self->_downloadTimeoutInterval;
}

- (void)setDownloadTimeoutInterval:(int64_t)a3
{
  self->_downloadTimeoutInterval = a3;
}

- (BOOL)retryInProgress
{
  return self->_retryInProgress;
}

- (void)setRetryInProgress:(BOOL)a3
{
  self->_retryInProgress = a3;
}

- (unsigned)errorCount
{
  return self->_errorCount;
}

- (unint64_t)currentCompatibilityVersion
{
  return self->_currentCompatibilityVersion;
}

- (void)setCurrentCompatibilityVersion:(unint64_t)a3
{
  self->_currentCompatibilityVersion = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (SESMobileAssetManager)mobileAssetManager
{
  return self->_mobileAssetManager;
}

- (void)setMobileAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetManager, a3);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
