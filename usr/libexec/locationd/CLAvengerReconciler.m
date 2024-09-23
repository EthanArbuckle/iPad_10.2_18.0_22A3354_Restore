@implementation CLAvengerReconciler

- (id)attemptReconciliationWithAddress:(id)a3 advertisementData:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary *nonownerAddressToUUIDMap;
  NSObject *v12;
  NSObject *v13;
  CLAvengerScannerReconciledInformation *v14;
  CLAvengerScannerReconciledInformation *v15;
  NSObject *v16;
  CLAvengerScannerReconciledInformation *v17;
  CLAvengerScannerReconciledInformation *v18;
  NSObject *v19;
  id v20;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSMutableDictionary *v36;

  if (a3)
  {
    v7 = objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v7, "appendData:", a4);
    v24 = 0;
    v23 = -1;
    v22 = 0;
    v8 = -[SPKeyReconciler reconcileKey:matchedIndex:sequence:error:](self->_keyReconciler, "reconcileKey:matchedIndex:sequence:error:", v7, &v24, &v23, &v22);
    v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nonownerAddressToUUIDMap, "objectForKeyedSubscript:", a3);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021BC710);
    v10 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      nonownerAddressToUUIDMap = self->_nonownerAddressToUUIDMap;
      *(_DWORD *)buf = 68290051;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2113;
      v30 = v8;
      v31 = 2113;
      v32 = v9;
      v33 = 2113;
      v34 = a3;
      v35 = 2113;
      v36 = nonownerAddressToUUIDMap;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerReconciler advertisement reconciled: \", \"ownerUUID\":%{private, location:escape_only}@, \"nonownerUUID\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"uuidMap\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    if (v8)
    {
      if (v9)
      {
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021BC710);
        v12 = qword_1022A0208;
        if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2113;
          v30 = v8;
          v31 = 2113;
          v32 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#CLAvengerReconciler advertisement reconciled to both owner and nonowner\", \"ownerUUID\":%{private, location:escape_only}@, \"nonownerUUID\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_1022A0200 != -1)
            dispatch_once(&qword_1022A0200, &stru_1021BC710);
        }
        v13 = qword_1022A0208;
        if (os_signpost_enabled((os_log_t)qword_1022A0208))
        {
          *(_DWORD *)buf = 68289539;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2113;
          v30 = v8;
          v31 = 2113;
          v32 = v9;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLAvengerReconciler advertisement reconciled to both owner and nonowner", "{\"msg%{public}.0s\":\"#CLAvengerReconciler advertisement reconciled to both owner and nonowner\", \"ownerUUID\":%{private, location:escape_only}@, \"nonownerUUID\":%{private, location:escape_only}@}", buf, 0x26u);
        }
      }
      v14 = [CLAvengerScannerReconciledInformation alloc];
      v15 = -[CLAvengerScannerReconciledInformation initWithOwnerInformation:matchedIndex:sequence:error:](v14, "initWithOwnerInformation:matchedIndex:sequence:error:", v8, v24, v23, v22);
    }
    else
    {
      v18 = [CLAvengerScannerReconciledInformation alloc];
      if (v9)
        v15 = -[CLAvengerScannerReconciledInformation initWithNonOwnerInformation:](v18, "initWithNonOwnerInformation:", v9);
      else
        v15 = -[CLAvengerScannerReconciledInformation initUnknown](v18, "initUnknown");
    }
    v17 = v15;
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021BC710);
    v19 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v20 = -[CLAvengerScannerReconciledInformation description](v17, "description");
      *(_DWORD *)buf = 68289283;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2113;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerReconciler: creating CLAvengerScannerReconciledInformation\", \"reconciledInformation.description\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A0210 != -1)
      dispatch_once(&qword_1022A0210, &stru_1021BC6F0);
    v16 = qword_1022A0218;
    if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerReconciler: onAvengerAdvertisement - no address\"}", buf, 0x12u);
    }
    return 0;
  }
  return v17;
}

- (CLAvengerReconciler)initWithQueue:(id)a3
{
  CLAvengerReconciler *v5;
  CLAvengerReconciler *v6;
  objc_super v8;

  if ((os_variant_is_darwinos("com.apple.locationd", a2) & 1) != 0)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)CLAvengerReconciler;
  v6 = -[CLAvengerReconciler init](&v8, "init");
  v5 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    -[CLAvengerReconciler initKeyReconciler](v6, "initKeyReconciler");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CLAvengerReconciler tearDownKeyReconciler](self, "tearDownKeyReconciler");
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerReconciler;
  -[CLAvengerReconciler dealloc](&v3, "dealloc");
}

- (void)initKeyReconciler
{
  NSObject *queue;
  NSObject *v4;
  SPBeaconManager *v5;
  NSObject *v6;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  _QWORD handler[4];
  id v16;
  id location;
  char buffer[256];

  objc_initWeak(&location, self);
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_101519AB8;
  handler[3] = &unk_10213EAC8;
  objc_copyWeak(&v16, &location);
  notify_register_dispatch("SPKeyReconcilerFilesUpdatedNotification", &self->_keyReconcilerFilesUpdateNotificationToken, queue, handler);
  v4 = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_101519AD0;
  v13[3] = &unk_10213EAC8;
  objc_copyWeak(&v14, &location);
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockNotificationToken, v4, v13);
  v5 = (SPBeaconManager *)objc_alloc_init((Class)SPBeaconManager);
  self->_beaconManager = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_101519CA0;
  v12[3] = &unk_1021BC640;
  v12[4] = self;
  -[SPBeaconManager createKeyReconcilerWithCompletion:](v5, "createKeyReconcilerWithCompletion:", v12);
  self->_ownerSession = objc_opt_new(SPOwnerSession);
  self->_nonownerAddressToUUIDMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFStringGetCString(SPUnknownBeaconsSetChangedNotification, buffer, 256, 0x8000100u);
  v6 = self->_queue;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_101519DFC;
  v10 = &unk_10213EAC8;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(buffer, &self->_unknownBeaconsSetChangedNotificationToken, v6, &v7);
  -[CLAvengerReconciler fetchAllUnknownBeaconsWithCompletion:](self, "fetchAllUnknownBeaconsWithCompletion:", &stru_1021BC680, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)recreateKeyReconciler
{
  NSObject *v3;
  SPBeaconManager *beaconManager;
  _QWORD v5[5];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BC6F0);
  v3 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v7 = 0;
    v8 = 2082;
    v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerReconciler: recreating reconciler\"}", buf, 0x12u);
  }
  beaconManager = self->_beaconManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_101519F38;
  v5[3] = &unk_1021BC640;
  v5[4] = self;
  -[SPBeaconManager createKeyReconcilerWithCompletion:](beaconManager, "createKeyReconcilerWithCompletion:", v5);
}

- (void)tearDownKeyReconciler
{
  if (notify_is_valid_token(self->_keyReconcilerFilesUpdateNotificationToken))
  {
    notify_cancel(self->_keyReconcilerFilesUpdateNotificationToken);
    self->_keyReconcilerFilesUpdateNotificationToken = -1;
  }
  if (notify_is_valid_token(self->_firstUnlockNotificationToken))
  {
    notify_cancel(self->_firstUnlockNotificationToken);
    self->_firstUnlockNotificationToken = -1;
  }

  self->_beaconManager = 0;
  self->_keyReconciler = 0;
  if (notify_is_valid_token(self->_unknownBeaconsSetChangedNotificationToken))
  {
    notify_cancel(self->_unknownBeaconsSetChangedNotificationToken);
    self->_unknownBeaconsSetChangedNotificationToken = -1;
  }

  self->_ownerSession = 0;
  self->_nonownerAddressToUUIDMap = 0;
}

- (void)fetchAllUnknownBeaconsWithCompletion:(id)a3
{
  NSObject *v5;
  SPOwnerSession *ownerSession;
  _QWORD v7[6];
  id v8;
  id buf;
  __int16 v10;
  const char *v11;

  if (qword_1022A0210 != -1)
    dispatch_once(&qword_1022A0210, &stru_1021BC6F0);
  v5 = qword_1022A0218;
  if (os_log_type_enabled((os_log_t)qword_1022A0218, OS_LOG_TYPE_DEFAULT))
  {
    buf = (id)68289026;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerReconciler fetching unknown beacons\"}", (uint8_t *)&buf, 0x12u);
  }
  objc_initWeak(&buf, self);
  ownerSession = self->_ownerSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10151A2C4;
  v7[3] = &unk_1021BC6D0;
  v7[4] = self;
  objc_copyWeak(&v8, &buf);
  v7[5] = a3;
  -[SPOwnerSession unknownBeaconsForUUIDs:completion:](ownerSession, "unknownBeaconsForUUIDs:completion:", &__NSArray0__struct, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&buf);
}

- (void)didFetchUnknownBeacons:(id)a3
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  -[NSMutableDictionary removeAllObjects](self->_nonownerAddressToUUIDMap, "removeAllObjects");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = a3;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 68289539;
    v15 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_1021BC710);
        v12 = qword_1022A0208;
        if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
        {
          v13 = objc_msgSend(objc_msgSend(v11, "identifier"), "UUIDString");
          v14 = objc_msgSend(objc_msgSend(v11, "identifier"), "UUIDString");
          *(_DWORD *)buf = v15;
          v21 = 0;
          v22 = 2082;
          v23 = "";
          v24 = 2113;
          v25 = v13;
          v26 = 2113;
          v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerReconciler got unknown beacon\", \"beacon.uuid\":%{private, location:escape_only}@, \"beacon.identifier\":%{private, location:escape_only}@}", buf, 0x26u);
        }
        -[NSMutableDictionary setObject:forKey:](self->_nonownerAddressToUUIDMap, "setObject:forKey:", objc_msgSend(v11, "identifier", v15), objc_msgSend(v11, "advertisement"));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
    }
    while (v8);
  }
}

@end
