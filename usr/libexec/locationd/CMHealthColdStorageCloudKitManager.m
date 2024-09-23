@implementation CMHealthColdStorageCloudKitManager

- (CMHealthColdStorageCloudKitManager)initWithColdStorageManager:(void *)a3
{
  CMHealthColdStorageCloudKitManager *v4;
  CMHealthColdStorageCloudKitManager *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  unsigned __int8 v10;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMHealthColdStorageCloudKitManager;
  v4 = -[CMHealthColdStorageCloudKitManager init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    v4->_coldStorageManager = a3;
    v10 = 0;
    sub_100522B00(&v10, &v11);
    sub_1002B7674((uint64_t)&v5->_metadataDb, &v11);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
    if (*((_QWORD *)&v11 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v5->_deviceUnlocked = 0;
    v5->_zoneIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5->_container = (CKContainer *)objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:", objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", CFSTR("com.apple.coremotion.coldstorage"), 1));
  }
  return v5;
}

- (void)dealloc
{
  NSMutableDictionary *zoneIDs;
  CKContainer *container;
  CKSyncEngine *syncEngine;
  objc_super v6;

  zoneIDs = self->_zoneIDs;
  if (zoneIDs)
  {

    self->_zoneIDs = 0;
  }
  container = self->_container;
  if (container)
  {

    self->_container = 0;
  }
  syncEngine = self->_syncEngine;
  if (syncEngine)
  {

    self->_syncEngine = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CMHealthColdStorageCloudKitManager;
  -[CMHealthColdStorageCloudKitManager dealloc](&v6, "dealloc");
}

- (BOOL)addPendingRecordChanges:(id)a3 forZoneName:(id)a4
{
  NSObject *v7;
  CKSyncEngine *syncEngine;
  id v9;
  NSMutableArray *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v17;
  _QWORD v18[7];
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v7 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v24 = a4;
    v25 = 2112;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[CloudKit] addPendingRecordChanges - zoneName: %@, recordNames: %@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v19 = 138412546;
    v20 = a4;
    v21 = 2112;
    v22 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] addPendingRecordChanges - zoneName: %@, recordNames: %@", &v19, 22);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager addPendingRecordChanges:forZoneName:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    -[CMHealthColdStorageCloudKitManager initializeSyncEngine](self, "initializeSyncEngine");
    syncEngine = self->_syncEngine;
  }
  LOBYTE(v9) = 0;
  if (a4)
  {
    if (a3)
    {
      if (syncEngine)
      {
        v9 = objc_msgSend(a3, "count");
        if (v9)
        {
          v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count"));
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10051D500;
          v18[3] = &unk_102141670;
          v18[4] = self;
          v18[5] = a4;
          v18[6] = v10;
          objc_msgSend(a3, "enumerateObjectsUsingBlock:", v18);
          -[CKSyncEngineState addPendingRecordZoneChanges:](-[CKSyncEngine state](self->_syncEngine, "state"), "addPendingRecordZoneChanges:", v10);
          if (qword_10229FFA0 != -1)
            dispatch_once(&qword_10229FFA0, &stru_102141840);
          v11 = qword_10229FFA8;
          if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CloudKit] Added pending changes", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FFA0 != -1)
              dispatch_once(&qword_10229FFA0, &stru_102141840);
            LOWORD(v19) = 0;
            LODWORD(v17) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] Added pending changes", &v19, v17);
            v15 = (uint8_t *)v14;
            sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager addPendingRecordChanges:forZoneName:]", "%s\n", v14);
            if (v15 != buf)
              free(v15);
          }
          LOBYTE(v9) = 1;
        }
      }
    }
  }
  return (char)v9;
}

- (void)updateDeviceUnlockedState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *coldStorageManager;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  _WORD v13[8];
  uint8_t buf[1640];

  v3 = a3;
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v5 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] updateDeviceUnlockedState", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v13[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] updateDeviceUnlockedState", v13, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager updateDeviceUnlockedState:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (!self->_syncEngine && !self->_deviceUnlocked && v3)
  {
    coldStorageManager = self->_coldStorageManager;
    if (coldStorageManager)
    {
      if (sub_100F66310((uint64_t)coldStorageManager))
      {
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        v7 = qword_10229FFA8;
        if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CloudKit] Device has been unlocked. Will now initialize the sync engine.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FFA0 != -1)
            dispatch_once(&qword_10229FFA0, &stru_102141840);
          v13[0] = 0;
          LODWORD(v12) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] Device has been unlocked. Will now initialize the sync engine.", v13, v12);
          v11 = (uint8_t *)v10;
          sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager updateDeviceUnlockedState:]", "%s\n", v10);
          if (v11 != buf)
            free(v11);
        }
        -[CMHealthColdStorageCloudKitManager initializeSyncEngine](self, "initializeSyncEngine");
      }
    }
  }
  self->_deviceUnlocked = v3;
}

- (id)zoneIDForZoneName:(id)a3
{
  if (!-[NSMutableDictionary objectForKey:](self->_zoneIDs, "objectForKey:"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_zoneIDs, "setObject:forKeyedSubscript:", objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", a3, CKCurrentUserDefaultName), a3);
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_zoneIDs, "objectForKeyedSubscript:", a3);
}

- (void)initializeSyncEngine
{
  id v3;
  xpc_object_t v4;
  id v5;

  v3 = -[CMHealthColdStorageCloudKitManager getSyncEngineMetadata](self, "getSyncEngineMetadata");
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  v5 = objc_msgSend(objc_alloc((Class)CKSyncEngineConfiguration), "initWithDatabase:stateSerialization:delegate:", -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"), v3, self);
  objc_msgSend(v5, "setApsMachServiceName:", CFSTR("com.apple.aps.locationd.coldstorage.cloudkit"));
  objc_msgSend(v5, "setPriority:", 2);
  objc_msgSend(v5, "setXpcActivityCriteriaOverrides:", v4);
  self->_syncEngine = (CKSyncEngine *)objc_msgSend(objc_alloc((Class)CKSyncEngine), "initWithConfiguration:", v5);
  xpc_release(v4);
}

- (id)getSyncEngineMetadata
{
  uint64_t v2;
  _BOOL4 v3;
  id result;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;

  v11 = 0;
  v12 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v13 = 0;
  v3 = sub_10051DBC4(self->_metadataDb.__ptr_, (uint64_t)&v11);
  result = 0;
  if (v3 && v13 != 0)
  {
    v10 = 0;
    v6 = objc_opt_class(CKSyncEngineStateSerialization, v2);
    result = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v6, v13, &v10);
    if (v10)
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v7 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] CloudKit manager failed to read metadata. Error:%@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        v14 = 138412290;
        v15 = v10;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] CloudKit manager failed to read metadata. Error:%@", &v14, 12);
        v9 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager getSyncEngineMetadata]", "%s\n", v8);
        if (v9 != buf)
          free(v9);
      }
      return 0;
    }
  }
  return result;
}

- (void)persistSyncEngineMetadata:(id)a3
{
  CFAbsoluteTime Current;
  NSData *v6;
  NSObject *v7;
  const char *v8;
  char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int128 buf;
  CFAbsoluteTime v14;
  NSData *v15;

  Current = CFAbsoluteTimeGetCurrent();
  v10 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v10);
  if (v10)
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] CloudKit manager failed to write metadata. Error:%{public}@", (uint8_t *)&buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v11 = 138543362;
      v12 = v10;
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] CloudKit manager failed to write metadata. Error:%{public}@", &v11, 12);
      v9 = (char *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager persistSyncEngineMetadata:]", "%s\n", v8);
      if (v9 != (char *)&buf)
        free(v9);
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((CFAbsoluteTime *)&buf + 1) = Current;
    v14 = Current;
    v15 = v6;
    sub_100E2F490(self->_metadataDb.__ptr_, (uint64_t)&buf);
  }
}

- (void)deleteSyncEngineMetadata
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] Deleting all sync engine metadata", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] Deleting all sync engine metadata", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_101139070((_QWORD *)self->_metadataDb.__ptr_ + 9);
}

- (void)deleteZone:(id)a3
{
  id v4;
  CKSyncEngineState *v5;
  id v6;

  if (a3)
  {
    if (self->_syncEngine)
    {
      v4 = objc_msgSend(objc_alloc((Class)CKSyncEnginePendingZoneDelete), "initWithZoneID:", a3);
      v5 = -[CKSyncEngine state](self->_syncEngine, "state");
      v6 = v4;
      -[CKSyncEngineState addPendingDatabaseChanges:](v5, "addPendingDatabaseChanges:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

    }
  }
}

- (void)createZone:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  CKSyncEngineState *v8;
  const char *v9;
  uint8_t *v10;
  id v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  if (a3 && self->_syncEngine)
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v5 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] Creating new zone with ZoneID: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v12 = 138412290;
      v13 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] Creating new zone with ZoneID: %@", &v12, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager createZone:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    v6 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", a3);
    v7 = objc_msgSend(objc_alloc((Class)CKSyncEnginePendingZoneSave), "initWithZone:", v6);
    v8 = -[CKSyncEngine state](self->_syncEngine, "state");
    v11 = v7;
    -[CKSyncEngineState addPendingDatabaseChanges:](v8, "addPendingDatabaseChanges:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  }
}

- (void)handleZoneDeleted:(id)a3
{
  void *coldStorageManager;

  -[CMHealthColdStorageCloudKitManager createZone:](self, "createZone:");
  coldStorageManager = self->_coldStorageManager;
  if (coldStorageManager)
    sub_100F66148((uint64_t)coldStorageManager, objc_msgSend(a3, "zoneName"));
}

- (void)handleServerRecordChanged:(id)a3
{
  void *coldStorageManager;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint8_t *v7;
  _QWORD v8[2];
  uint8_t buf[1640];

  if (a3)
  {
    if (self->_syncEngine)
    {
      coldStorageManager = self->_coldStorageManager;
      if (coldStorageManager)
      {
        if ((sub_100F65FA0((uint64_t)coldStorageManager, objc_msgSend(a3, "recordID"), +[CMHealthColdStorageUtils getSystemFieldsFromCKRecord:](CMHealthColdStorageUtils, "getSystemFieldsFromCKRecord:", a3)) & 1) == 0)
        {
          if (qword_10229FFA0 != -1)
            dispatch_once(&qword_10229FFA0, &stru_102141840);
          v4 = qword_10229FFA8;
          if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CloudKit] ServerRecordChanged: Failed to update local system fields", buf, 2u);
          }
          if (sub_1001BFF7C(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FFA0 != -1)
              dispatch_once(&qword_10229FFA0, &stru_102141840);
            LOWORD(v8[0]) = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] ServerRecordChanged: Failed to update local system fields", v8, 2, v8[0]);
LABEL_22:
            v7 = (uint8_t *)v5;
            sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleServerRecordChanged:]", "%s\n", v5);
            if (v7 != buf)
              free(v7);
          }
        }
      }
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] Cannot handle server record change, invalid record", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      LOWORD(v8[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Cannot handle server record change, invalid record", v8, 2, v8[0]);
      goto LABEL_22;
    }
  }
}

- (void)handleUnknownItem:(id)a3
{
  void *coldStorageManager;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  CKSyncEngineState *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v13;
  id v14;
  uint8_t buf[1640];

  if (a3 && self->_syncEngine)
  {
    coldStorageManager = self->_coldStorageManager;
    if (coldStorageManager && (sub_100F65FA0((uint64_t)coldStorageManager, objc_msgSend(a3, "recordID"), 0) & 1) == 0)
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v6 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] UnknownItem: Failed to update local system fields", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        v13 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] UnknownItem: Failed to update local system fields", &v13, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleUnknownItem:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
    }
    v7 = objc_alloc((Class)CKSyncEnginePendingRecordZoneChange);
    v8 = objc_msgSend(a3, "recordID");
    v9 = objc_msgSend(v7, "initWithRecordID:type:", v8, CKSyncEnginePendingRecordZoneChangeTypeSave);
    v10 = -[CKSyncEngine state](self->_syncEngine, "state");
    v14 = v9;
    -[CKSyncEngineState addPendingRecordZoneChanges:](v10, "addPendingRecordZoneChanges:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  }
}

- (void)handleZoneNotFound:(id)a3
{
  id v5;
  id v6;
  id v7;
  CKSyncEngineState *v8;
  id v9;

  if (a3)
  {
    if (self->_syncEngine)
    {
      -[CMHealthColdStorageCloudKitManager createZone:](self, "createZone:", objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"));
      v5 = objc_alloc((Class)CKSyncEnginePendingRecordZoneChange);
      v6 = objc_msgSend(a3, "recordID");
      v7 = objc_msgSend(v5, "initWithRecordID:type:", v6, CKSyncEnginePendingRecordZoneChangeTypeSave);
      v8 = -[CKSyncEngine state](self->_syncEngine, "state");
      v9 = v7;
      -[CKSyncEngineState addPendingRecordZoneChanges:](v8, "addPendingRecordZoneChanges:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

    }
  }
}

- (void)setUserRecordIDName:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v4 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CloudKit] Setting userRecordIDName to %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v9 = 138477827;
    v10 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] Setting userRecordIDName to %{private}@", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager setUserRecordIDName:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  v5 = sub_1001FD94C();
  sub_10052861C(v5, CFSTR("kColdStorageCloudKitUserID"), (char *)objc_msgSend(a3, "UTF8String"));
  v6 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 944))(v6);
}

- (id)getUserRecordIDName
{
  uint64_t v2;
  std::string::size_type size;
  id v4;
  std::string *p_p;
  id v6;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  v2 = sub_1001FD94C();
  sub_1000BD5F0(v2, (uint64_t)CFSTR("kColdStorageCloudKitUserID"), &__p);
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (!size)
  {
    v6 = 0;
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      return v6;
    goto LABEL_8;
  }
  v4 = objc_alloc((Class)NSString);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v6 = objc_msgSend(v4, "initWithUTF8String:", p_p);
  if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_8:
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint8_t *v10;
  __int128 v11;
  uint8_t buf[4];
  id v13;

  if (a4)
  {
    if (self->_syncEngine == a3)
    {
      switch((unint64_t)objc_msgSend(a4, "type"))
      {
        case 0uLL:
          -[CMHealthColdStorageCloudKitManager handleStateUpdate:](self, "handleStateUpdate:", a4);
          break;
        case 1uLL:
          -[CMHealthColdStorageCloudKitManager handleAccountChange:](self, "handleAccountChange:", a4);
          break;
        case 2uLL:
          -[CMHealthColdStorageCloudKitManager handleFetchedDatabaseChanges:](self, "handleFetchedDatabaseChanges:", a4);
          break;
        case 3uLL:
          -[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:](self, "handleFetchedRecordZoneChanges:", a4);
          break;
        case 4uLL:
          -[CMHealthColdStorageCloudKitManager handleSentDatabaseChanges:](self, "handleSentDatabaseChanges:", a4);
          break;
        case 5uLL:
          -[CMHealthColdStorageCloudKitManager handleSentRecordZoneChanges:](self, "handleSentRecordZoneChanges:", a4);
          break;
        case 6uLL:
          -[CMHealthColdStorageCloudKitManager handleWillFetchChanges:](self, "handleWillFetchChanges:", a4);
          break;
        case 7uLL:
          -[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:](self, "handleWillFetchRecordZoneChanges:", a4);
          break;
        case 8uLL:
          -[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:](self, "handleDidFetchRecordZoneChanges:", a4);
          break;
        case 9uLL:
          -[CMHealthColdStorageCloudKitManager handleDidFetchChanges:](self, "handleDidFetchChanges:", a4);
          break;
        case 0xAuLL:
          -[CMHealthColdStorageCloudKitManager handleWillSendChanges:](self, "handleWillSendChanges:", a4);
          break;
        case 0xBuLL:
          -[CMHealthColdStorageCloudKitManager handleDidSendChanges:](self, "handleDidSendChanges:", a4);
          break;
        default:
          return;
      }
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v6 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] Sync engine (%@) doesn't match internal reference.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        LODWORD(v11) = 138412290;
        *(_QWORD *)((char *)&v11 + 4) = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Sync engine (%@) doesn't match internal reference.", &v11, 12, v11);
LABEL_33:
        v10 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager syncEngine:handleEvent:]", "%s\n", v7);
        if (v10 != buf)
          free(v10);
      }
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v8 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] Sync engine (%@) called back for invalid event", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      LODWORD(v11) = 138412290;
      *(_QWORD *)((char *)&v11 + 4) = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Sync engine (%@) called back for invalid event", &v11, 12, v11);
      goto LABEL_33;
    }
  }
}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (self->_syncEngine != a3)
    return 0;
  v6 = objc_msgSend(objc_msgSend(a4, "options"), "zoneIDs");
  v7 = -[CKSyncEngineState pendingRecordZoneChanges](-[CKSyncEngine state](self->_syncEngine, "state"), "pendingRecordZoneChanges");
  if (v6)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v6, "containsObject:", objc_msgSend(objc_msgSend(v13, "recordID"), "zoneID")))
            objc_msgSend(v8, "addObject:", v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    v7 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8);

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10051F2B8;
  v14[3] = &unk_102141698;
  v14[4] = self;
  return objc_msgSend(objc_alloc((Class)CKSyncEngineRecordZoneChangeBatch), "initWithPendingChanges:recordProvider:", v7, v14);
}

- (void)handleStateUpdate:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v5 = objc_msgSend(a3, "stateUpdateEvent");
  if (v5)
  {
    -[CMHealthColdStorageCloudKitManager persistSyncEngineMetadata:](self, "persistSyncEngineMetadata:", objc_msgSend(v5, "stateSerialization"));
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineStateUpdateEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v9 = 138412290;
      v10 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineStateUpdateEvent (%@)", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleStateUpdate:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)handleAccountChange:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  unsigned int v9;
  void **p_coldStorageManager;
  NSObject *v11;
  NSObject *v12;
  double v13;
  uint8_t *v14;
  uint8_t *v15;
  NSObject *v16;
  CFAbsoluteTime *coldStorageManager;
  NSObject *v18;
  uint8_t *v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  uint64_t v29;
  _BYTE v30[12];
  uint8_t buf[4];
  id v32;

  v5 = objc_msgSend(a3, "accountChangeEvent");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "changeType");
    if (v7 == (id)2)
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v16 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud switched accounts. Deleting all records and sync engine metadata.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        *(_WORD *)v30 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] iCloud switched accounts. Deleting all records and sync engine metadata.", v30, 2);
        v24 = (uint8_t *)v23;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v23);
        if (v24 != buf)
          free(v24);
      }
      coldStorageManager = (CFAbsoluteTime *)self->_coldStorageManager;
      if (coldStorageManager)
        sub_100F660B4(coldStorageManager);
      -[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
    }
    else
    {
      if (v7 != (id)1)
      {
        if (v7)
          return;
        v8 = -[CMHealthColdStorageCloudKitManager getUserRecordIDName](self, "getUserRecordIDName");
        if (v8)
        {
          v9 = objc_msgSend(v8, "isEqualToString:", objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName"));
          -[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
          p_coldStorageManager = &self->_coldStorageManager;
          if (self->_coldStorageManager)
          {
            if (!v9)
            {
              if (qword_10229FFA0 != -1)
                dispatch_once(&qword_10229FFA0, &stru_102141840);
              v11 = qword_10229FFA8;
              if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User switched account", buf, 2u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FFA0 != -1)
                  dispatch_once(&qword_10229FFA0, &stru_102141840);
                *(_WORD *)v30 = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] iCloud account change. User switched account", v30, 2);
                v28 = (uint8_t *)v27;
                sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v27);
                if (v28 != buf)
                  free(v28);
              }
              sub_100F660B4((CFAbsoluteTime *)*p_coldStorageManager);
              goto LABEL_45;
            }
LABEL_39:
            if (qword_10229FFA0 != -1)
              dispatch_once(&qword_10229FFA0, &stru_102141840);
            v21 = qword_10229FFA8;
            if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User signed in with same account", buf, 2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FFA0 != -1)
                dispatch_once(&qword_10229FFA0, &stru_102141840);
              *(_WORD *)v30 = 0;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] iCloud account change. User signed in with same account", v30, 2);
              v26 = (uint8_t *)v25;
              sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v25);
              if (v26 != buf)
                free(v26);
            }
            sub_100F66118((uint64_t)*p_coldStorageManager);
          }
        }
        else
        {
          -[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
          p_coldStorageManager = &self->_coldStorageManager;
          if (self->_coldStorageManager)
            goto LABEL_39;
        }
LABEL_45:
        -[CMHealthColdStorageCloudKitManager setUserRecordIDName:](self, "setUserRecordIDName:", objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName"));
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        v22 = qword_10229FFA8;
        if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User signed in.", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          return;
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        *(_WORD *)v30 = 0;
        LODWORD(v29) = 2;
        v20 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] iCloud account change. User signed in.", v30, v29, *(_QWORD *)v30);
        goto LABEL_58;
      }
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v18 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[CloudKit] iCloud account change. User signed out.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102141840);
        *(_WORD *)v30 = 0;
        v20 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] iCloud account change. User signed out.", v30, 2, *(_QWORD *)v30);
LABEL_58:
        v15 = v19;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v20);
LABEL_59:
        if (v15 != buf)
          free(v15);
      }
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v12 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineAccountChangeEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      *(_DWORD *)v30 = 138412290;
      *(_QWORD *)&v30[4] = a3;
      v13 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineAccountChangeEvent (%@)", v30, 12);
      v15 = v14;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v13);
      goto LABEL_59;
    }
  }
}

- (void)handleFetchedDatabaseChanges:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CloudKit] Fetched database changes event", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] Fetched database changes event", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleFetchedDatabaseChanges:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v5;
  NSObject *v6;
  double v7;
  uint8_t *v8;
  uint8_t *v9;
  NSObject *v10;
  double v11;
  uint8_t *v12;
  _QWORD v13[5];
  int v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v5 = objc_msgSend(a3, "fetchedRecordZoneChangesEvent");
  if (v5)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100520134;
    v13[3] = &unk_1021416C0;
    v13[4] = self;
    objc_msgSend(objc_msgSend(v5, "modifications"), "enumerateObjectsUsingBlock:", v13);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CloudKit] Fetched record zone event", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      LOWORD(v14) = 0;
      v7 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[CloudKit] Fetched record zone event", &v14, 2);
      v9 = v8;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]", "%s\n", v7);
LABEL_19:
      if (v9 != buf)
        free(v9);
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v10 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v14 = 138412290;
      v15 = a3;
      v11 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent (%@)", &v14, 12);
      v9 = v12;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]", "%s\n", v11);
      goto LABEL_19;
    }
  }
}

- (void)handleSentDatabaseChanges:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v5 = objc_msgSend(a3, "sentDatabaseChangesEvent");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(objc_msgSend(v5, "savedZones"), "enumerateObjectsUsingBlock:", &stru_102141700);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100520594;
    v11[3] = &unk_102141728;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedZoneIDs"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100520760;
    v10[3] = &unk_102141750;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedZoneSaves"), "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(objc_msgSend(v6, "failedZoneDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_102141790);
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineSentDatabaseChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v12 = 138412290;
      v13 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineSentDatabaseChangesEvent (%@)", &v12, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleSentDatabaseChanges:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)handleSentRecordZoneChanges:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  int v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v5 = objc_msgSend(a3, "sentRecordZoneChangesEvent");
  if (v5)
  {
    v6 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100520E14;
    v12[3] = &unk_1021416C0;
    v12[4] = self;
    objc_msgSend(objc_msgSend(v5, "savedRecords"), "enumerateObjectsUsingBlock:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100521140;
    v11[3] = &unk_1021417B8;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedRecordIDs"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100521438;
    v10[3] = &unk_1021417E0;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedRecordSaves"), "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(objc_msgSend(v6, "failedRecordDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_102141820);
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineSentRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v13 = 138412290;
      v14 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineSentRecordZoneChangesEvent (%@)", &v13, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleSentRecordZoneChanges:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)handleWillFetchChanges:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine is about to fetch changes", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] Sync engine is about to fetch changes", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleWillFetchChanges:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)handleWillFetchRecordZoneChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  uint8_t *v9;
  uint8_t *v10;
  NSObject *v11;
  double v12;
  uint8_t *v13;
  int v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = objc_msgSend(a3, "willFetchRecordZoneChangesEvent");
  if (v4)
  {
    v5 = v4;
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v17 = objc_msgSend(v5, "zoneID");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine is about to fetch zone changes for zoneID %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v7 = qword_10229FFA8;
      v14 = 138543362;
      v15 = objc_msgSend(v5, "zoneID");
      v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "[CloudKit] Sync engine is about to fetch zone changes for zoneID %{public}@", &v14, 12);
      v10 = v9;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]", "%s\n", v8);
LABEL_19:
      if (v10 != buf)
        free(v10);
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v11 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v14 = 138412290;
      v15 = a3;
      v12 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent (%@)", &v14, 12);
      v10 = v13;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]", "%s\n", v12);
      goto LABEL_19;
    }
  }
}

- (void)handleDidFetchRecordZoneChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  uint8_t *v9;
  uint8_t *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  double v15;
  uint8_t *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v4 = objc_msgSend(a3, "didFetchRecordZoneChangesEvent");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "error"))
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v6 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = objc_msgSend(v5, "zoneID");
        v23 = 2114;
        v24 = objc_msgSend(v5, "error");
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] Error fetching record zone changes for %{public}@. Error: %{public}@", buf, 0x16u);
      }
      if (!sub_1001BFF7C(115, 0))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v7 = qword_10229FFA8;
      v17 = 138543618;
      v18 = objc_msgSend(v5, "zoneID");
      v19 = 2114;
      v20 = objc_msgSend(v5, "error");
      v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 16, "[CloudKit] Error fetching record zone changes for %{public}@. Error: %{public}@", &v17, 22);
      v10 = v9;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]", "%s\n", v8);
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v13 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v22 = objc_msgSend(v5, "zoneID");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine successfully fetched zone changes for zoneID %{public}@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v14 = qword_10229FFA8;
      v17 = 138543362;
      v18 = objc_msgSend(v5, "zoneID");
      v15 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 2, "[CloudKit] Sync engine successfully fetched zone changes for zoneID %{public}@", &v17, 12);
      v10 = v16;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]", "%s\n", v15);
    }
    if (v10 != buf)
LABEL_30:
      free(v10);
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v11 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102141840);
      v17 = 138412290;
      v18 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent (%@)", &v17, 12);
      v10 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]", "%s\n", v12);
      if (v10 != buf)
        goto LABEL_30;
    }
  }
}

- (void)handleDidFetchChanges:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine did fetch changes", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[CloudKit] Sync engine did fetch changes", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleDidFetchChanges:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)handleWillSendChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v4 = objc_msgSend(a3, "willSendChangesEvent");
  if (v4)
  {
    v5 = v4;
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine will send changes. Reason: %d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v7 = qword_10229FFA8;
    v12 = 67109120;
    LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "[CloudKit] Sync engine will send changes. Reason: %d", &v12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleWillSendChanges:]", "%s\n", v8);
    if (v9 == buf)
      return;
LABEL_20:
    free(v9);
    return;
  }
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v10 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineWillSendChangesEvent (%@)", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v12 = 138412290;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineWillSendChangesEvent (%@)", &v12, 12);
    v9 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleWillSendChanges:]", "%s\n", v11);
    if (v9 != buf)
      goto LABEL_20;
  }
}

- (void)handleDidSendChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v4 = objc_msgSend(a3, "didSendChangesEvent");
  if (v4)
  {
    v5 = v4;
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v6 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] Sync engine did send changes. Reason: %d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v7 = qword_10229FFA8;
    v12 = 67109120;
    LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "[CloudKit] Sync engine did send changes. Reason: %d", &v12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageCloudKitManager handleDidSendChanges:]", "%s\n", v8);
    if (v9 == buf)
      return;
LABEL_20:
    free(v9);
    return;
  }
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102141840);
  v10 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] Called back for invalid CKSyncEngineDidSendChangesEvent (%@)", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102141840);
    v12 = 138412290;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[CloudKit] Called back for invalid CKSyncEngineDidSendChangesEvent (%@)", &v12, 12);
    v9 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageCloudKitManager handleDidSendChanges:]", "%s\n", v11);
    if (v9 != buf)
      goto LABEL_20;
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (void).cxx_destruct
{
  sub_100261F44((uint64_t)&self->_metadataDb);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
