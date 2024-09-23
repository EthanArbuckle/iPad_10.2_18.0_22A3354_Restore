@implementation CLWifiAssociatedApCentroidSyncedDataStore

- (BOOL)isValid
{
  _BOOL4 v3;

  v3 = -[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid](self, "areCentroidDbAndMetadataDbValid");
  if (v3)
    LOBYTE(v3) = self->_syncEngine != 0;
  return v3;
}

- (basic_string<char,)getBasicInfo
{
  _QWORD *v1;
  _QWORD *v2;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  v2 = v1;
  if ((objc_msgSend(v1, "isCentroidDatabaseValid") & 1) == 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1015A2E04(retstr, "invalid database");
  sub_1000A1130(v2[2], retstr);
  return result;
}

- (id)fetchRecord:(id)a3
{
  CLWifiAssociatedApCentroidDO *v5;
  void *__p[2];
  char v8;
  void *v9;
  char v10;
  char v11;
  void ***v12;

  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    return 0;
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v12 = (void ***)sub_1000CC740((uint64_t)__p);
  if (v8 < 0)
    operator delete(__p[0]);
  sub_1000A0A10((uint64_t)self->_centroidDb.__ptr_.__value_, &v12, __p);
  if (!v11)
    return 0;
  v5 = -[CLWifiAssociatedApCentroidDO initWithNSDictionary:]([CLWifiAssociatedApCentroidDO alloc], "initWithNSDictionary:", sub_1008BAFAC((uint64_t)__p));
  if (v11 && v10 < 0)
    operator delete(v9);
  return v5;
}

- (BOOL)purgeOlderRecords
{
  uint64_t *v3;
  CLWifiAssociatedApCentroidDatabase *value;
  _QWORD *v5;
  _QWORD *v6;
  int i;
  NSObject *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  char *v14;
  uint64_t v16;
  CFAbsoluteTime Current;
  _QWORD *v18;
  _QWORD *v19;
  double v20;
  _BYTE v21[12];
  __int16 v22;
  double v23;
  _BYTE buf[12];
  __int16 v25;
  double v26;

  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    v3 = sub_1000A3224();
    v20 = sub_1000A14F8(v3);
    value = self->_centroidDb.__ptr_.__value_;
    *(_QWORD *)buf = CFAbsoluteTimeGetCurrent();
    sub_1000A0FD0((uint64_t)value, &v20, (double *)buf, (uint64_t *)&v18);
    v5 = v18;
    v6 = v19;
    for (i = 1; v5 != v6; v5 += 14)
    {
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v8 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v20;
        *(_QWORD *)v21 = CFAbsoluteTimeGetCurrent();
        v10 = sub_1008BB1C4((uint64_t)v5, (double *)v21);
        *(_DWORD *)buf = 134283777;
        *(double *)&buf[4] = v9;
        v25 = 2049;
        v26 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, purging records older than %{private}.1f, age, %{private}.1f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        v11 = qword_1022A0048;
        v12 = v20;
        Current = CFAbsoluteTimeGetCurrent();
        v13 = sub_1008BB1C4((uint64_t)v5, &Current);
        *(_DWORD *)v21 = 134283777;
        *(double *)&v21[4] = v12;
        v22 = 2049;
        v23 = v13;
        LODWORD(v16) = 22;
        v14 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "[CloudKit] WifiAssociatedApCentroidStore, purging records older than %{private}.1f, age, %{private}.1f", v21, v16);
        sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore purgeOlderRecords]", "%s\n", v14);
        if (v14 != buf)
          free(v14);
      }
      i &= -[CLWifiAssociatedApCentroidSyncedDataStore deleteRecordByMac:](self, "deleteRecordByMac:", *v5);
    }
    *(_QWORD *)buf = &v18;
    sub_100B04710((void ***)buf);
  }
  else
  {
    LOBYTE(i) = 0;
  }
  return i;
}

- (BOOL)isCentroidDatabaseValid
{
  CLWifiAssociatedApCentroidDatabase *value;

  value = self->_centroidDb.__ptr_.__value_;
  if (value)
    LOBYTE(value) = sub_1000CC504((uint64_t)value);
  return (char)value;
}

- (BOOL)areCentroidDbAndMetadataDbValid
{
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  char *v7;
  _DWORD v8[2];
  __int16 v9;
  unsigned int v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  unsigned int v14;

  v3 = -[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid");
  v4 = -[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid");
  if (v3 != v4)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v5 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240448;
      v12 = v3;
      v13 = 1026;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "[CloudKit] WifiAssociatedApCentroidStore, centroid DB and metadata DB are in different states: %{public}d vs %{public}d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v8[0] = 67240448;
      v8[1] = v3;
      v9 = 1026;
      v10 = v4;
      v7 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 17, "[CloudKit] WifiAssociatedApCentroidStore, centroid DB and metadata DB are in different states: %{public}d vs %{public}d", v8, 14);
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid]", "%s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
  return v3 & v4;
}

- (BOOL)isMetadataDatabaseValid
{
  CLCloudKitMetadataDatabase *value;

  value = self->_metadataDb.__ptr_.__value_;
  if (value)
    LOBYTE(value) = sub_1000A1914((uint64_t)value);
  return (char)value;
}

- (CLWifiAssociatedApCentroidSyncedDataStore)init
{
  CLWifiAssociatedApCentroidSyncedDataStore *v2;
  CLWifiAssociatedApCentroidSyncedDataStore *v3;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  objc_super v9;
  uint8_t buf[1640];

  v9.receiver = self;
  v9.super_class = (Class)CLWifiAssociatedApCentroidSyncedDataStore;
  v2 = -[CLWifiAssociatedApCentroidSyncedDataStore init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    -[CLWifiAssociatedApCentroidSyncedDataStore initCentroidDbAndMetadataDb](v2, "initCentroidDbAndMetadataDb");
    v3->_container = (CKContainer *)objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:", objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", CFSTR("com.apple.locationd.clx"), 1));
    -[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine](v3, "initializeSyncEngine");
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v4 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, init", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, init", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore init]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  return v3;
}

- (void)dealloc
{
  CKContainer *container;
  CKSyncEngine *syncEngine;
  objc_super v5;

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
  v5.receiver = self;
  v5.super_class = (Class)CLWifiAssociatedApCentroidSyncedDataStore;
  -[CLWifiAssociatedApCentroidSyncedDataStore dealloc](&v5, "dealloc");
}

- (void)initCentroidDatabase
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    operator new();
}

- (void)initMetadataDatabase
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
    operator new();
}

- (void)initCentroidDbAndMetadataDb
{
  -[CLWifiAssociatedApCentroidSyncedDataStore initCentroidDatabase](self, "initCentroidDatabase");
  -[CLWifiAssociatedApCentroidSyncedDataStore initMetadataDatabase](self, "initMetadataDatabase");
}

- (BOOL)addRecord:(id)a3
{
  NSMutableArray *v5;
  char v6;
  void **v7;
  NSObject *v8;
  void **v9;
  NSObject *v10;
  void **v11;
  uint64_t v13;
  _BYTE *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  _BYTE *v18;
  char *v19;
  char *v20;
  _BYTE v21[80];
  __int128 v22;
  uint64_t v23;
  _BYTE buf[12];
  char v25;
  int v26;
  _BYTE *v27;
  void *__p[2];
  uint64_t v29;

  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    return 0;
  sub_1008BAAB8((uint64_t)v21, objc_msgSend(a3, "toNSDictionary"));
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1);
  if (SHIBYTE(v23) < 0)
  {
    sub_100115CE4(__p, (void *)v22, *((unint64_t *)&v22 + 1));
  }
  else
  {
    *(_OWORD *)__p = v22;
    v29 = v23;
  }
  if (v29 >= 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  -[NSMutableArray addObject:](v5, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  if (SHIBYTE(v29) < 0)
    operator delete(__p[0]);
  if (-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordSaveChanges:](self, "addPendingRecordSaveChanges:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5)))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v8 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      sub_1008BB1F0((uint64_t)v21, __p);
      v9 = v29 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136380675;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, success, entry: %{private}s", buf, 0xCu);
      if (SHIBYTE(v29) < 0)
        operator delete(__p[0]);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v13 = qword_1022A0048;
      sub_1008BB1F0((uint64_t)v21, buf);
      if (v25 >= 0)
        v14 = buf;
      else
        v14 = *(_BYTE **)buf;
      v26 = 136380675;
      v27 = v14;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v13, 0, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, success, entry: %{private}s", &v26, 12);
      v16 = v15;
      if (v25 < 0)
        operator delete(*(void **)buf);
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addRecord:]", "%s\n", v16);
      if (v16 != (char *)__p)
        free(v16);
    }
    v6 = sub_100D45B34((uint64_t)self->_centroidDb.__ptr_.__value_);
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v10 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      sub_1008BB1F0((uint64_t)v21, __p);
      v11 = v29 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136380675;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, warning, could not add to sync engine: %{private}s", buf, 0xCu);
      if (SHIBYTE(v29) < 0)
        operator delete(__p[0]);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v17 = qword_1022A0048;
      sub_1008BB1F0((uint64_t)v21, buf);
      if (v25 >= 0)
        v18 = buf;
      else
        v18 = *(_BYTE **)buf;
      v26 = 136380675;
      v27 = v18;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v17, 16, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, warning, could not add to sync engine: %{private}s", &v26, 12);
      v20 = v19;
      if (v25 < 0)
        operator delete(*(void **)buf);
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore addRecord:]", "%s\n", v20);
      if (v20 != (char *)__p)
        free(v20);
    }
    v6 = 0;
  }
  if (SHIBYTE(v23) < 0)
    operator delete((void *)v22);
  return v6;
}

- (BOOL)deleteAllRecords
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t i;
  __int128 v6;
  void **v7;
  BOOL v8;
  void *__p[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    return 0;
  sub_1000A11BC((uint64_t)self->_centroidDb.__ptr_.__value_, &v12);
  if ((sub_100D47064((uint64_t)self->_centroidDb.__ptr_.__value_) & 1) != 0)
  {
    v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v13 - v12) >> 4));
    v4 = v12;
    for (i = v13; v4 != i; v4 += 112)
    {
      if (*(char *)(v4 + 103) < 0)
      {
        sub_100115CE4(__p, *(void **)(v4 + 80), *(_QWORD *)(v4 + 88));
      }
      else
      {
        v6 = *(_OWORD *)(v4 + 80);
        v11 = *(_QWORD *)(v4 + 96);
        *(_OWORD *)__p = v6;
      }
      if (v11 >= 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      -[NSMutableArray addObject:](v3, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7, __p[0], __p[1], v11));
      if (SHIBYTE(v11) < 0)
        operator delete(__p[0]);
    }
    v8 = -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordDeleteChanges:](self, "addPendingRecordDeleteChanges:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));
  }
  else
  {
    v8 = 0;
  }
  __p[0] = &v12;
  sub_100B04710((void ***)__p);
  return v8;
}

- (BOOL)deleteRecordByMacString:(id)a3
{
  uint64_t v4;
  void *__p[2];
  char v7;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v4 = sub_1000CC740((uint64_t)__p);
  if (v7 < 0)
    operator delete(__p[0]);
  return -[CLWifiAssociatedApCentroidSyncedDataStore deleteRecordByMac:](self, "deleteRecordByMac:", v4);
}

- (BOOL)deleteRecordByMac:(CLMacAddress)a3
{
  NSMutableArray *v4;
  BOOL v5;
  void **v7;
  void *__p[2];
  uint64_t v9;
  _BYTE v10[80];
  __int128 v11;
  uint64_t v12;
  char v13;
  void ***var0;

  var0 = (void ***)a3.var0;
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    return 0;
  sub_1000A0A10((uint64_t)self->_centroidDb.__ptr_.__value_, &var0, v10);
  if (!v13)
    return 0;
  if ((sub_100D46900((uint64_t)self->_centroidDb.__ptr_.__value_) & 1) != 0)
  {
    v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1);
    if (SHIBYTE(v12) < 0)
    {
      sub_100115CE4(__p, (void *)v11, *((unint64_t *)&v11 + 1));
    }
    else
    {
      *(_OWORD *)__p = v11;
      v9 = v12;
    }
    if (v9 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    -[NSMutableArray addObject:](v4, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7, __p[0], __p[1], v9));
    if (SHIBYTE(v9) < 0)
      operator delete(__p[0]);
    v5 = -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordDeleteChanges:](self, "addPendingRecordDeleteChanges:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
  }
  else
  {
    v5 = 0;
  }
  if (v13 && SHIBYTE(v12) < 0)
    operator delete((void *)v11);
  return v5;
}

- (int)count
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    return sub_100D47830((uint64_t)self->_centroidDb.__ptr_.__value_);
  else
    return -1;
}

- (void)submitMetricsIfPossible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
    sub_100D47C9C((uint64_t)self->_centroidDb.__ptr_.__value_, v3);
}

- (void)reInitializeDatabasesAndSyncEngineIfNeeded
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, re-initialize databases and sync engine if needed", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, re-initialize databases and sync engine if needed", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore reInitializeDatabasesAndSyncEngineIfNeeded]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLWifiAssociatedApCentroidSyncedDataStore initCentroidDbAndMetadataDb](self, "initCentroidDbAndMetadataDb");
  -[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine](self, "initializeSyncEngine");
}

- (void)initializeSyncEngine
{
  id v3;
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  uint8_t *v9;
  __int128 v10;
  uint8_t buf[4];
  const char *v12;

  if (-[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid](self, "areCentroidDbAndMetadataDbValid"))
  {
    if (!self->_syncEngine)
    {
      v3 = -[CLWifiAssociatedApCentroidSyncedDataStore getSyncEngineMetadata](self, "getSyncEngineMetadata");
      v4 = objc_msgSend(objc_alloc((Class)CKSyncEngineConfiguration), "initWithDatabase:stateSerialization:delegate:", -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"), v3, self);
      objc_msgSend(v4, "setApsMachServiceName:", CFSTR("com.apple.aps.locationd"));
      objc_msgSend(v4, "setPriority:", 2);
      self->_syncEngine = (CKSyncEngine *)objc_msgSend(objc_alloc((Class)CKSyncEngine), "initWithConfiguration:", v4);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v5 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
      {
        v6 = "yes";
        if (!v3)
          v6 = "no";
        *(_DWORD *)buf = 136315138;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, initializeSyncEngine with metadata? %s", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, initializeSyncEngine with metadata? %s", &v10);
LABEL_22:
        v9 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine]", "%s\n", v7);
        if (v9 != buf)
          free(v9);
      }
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v8 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, not initializing sync engine due to invalid databases. Most likely device is locked.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, not initializing sync engine due to invalid databases. Most likely device is locked.");
      goto LABEL_22;
    }
  }
}

- (id)getSyncEngineMetadata
{
  uint64_t v3;
  id result;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;

  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v7 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not get sync engine metadata due to invalid database. Most likely device is locked.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    LOWORD(v10) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, could not get sync engine metadata due to invalid database. Most likely device is locked.", &v10, 2);
    goto LABEL_22;
  }
  sub_100F0152C((uint64_t)self->_metadataDb.__ptr_.__value_);
  if (v3)
  {
    v9 = 0;
    result = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CKSyncEngineStateSerialization, v3), v3, &v9);
    if (!v9)
      return result;
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v5 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, failed to read metadata. Error: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v10 = 138412290;
      v11 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, failed to read metadata. Error: %@", &v10, 12);
LABEL_22:
      v8 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore getSyncEngineMetadata]", "%s\n", v6);
      if (v8 != buf)
        free(v8);
    }
  }
  return 0;
}

- (void)persistSyncEngineMetadata:(id)a3
{
  NSData *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  char *v9;
  NSData *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _OWORD buf[102];

  if (-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    v11 = 0;
    v5 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v11);
    if (!v11)
    {
      v10 = v5;
      *(_QWORD *)&buf[0] = CFAbsoluteTimeGetCurrent();
      *((_QWORD *)&buf[0] + 1) = v10;
      sub_100F00ED4((uint64_t)self->_metadataDb.__ptr_.__value_);
      return;
    }
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138543362;
      *(_QWORD *)((char *)buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, failed to write metadata. Error: %{public}@", (uint8_t *)buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v12 = 138543362;
      v13 = v11;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, failed to write metadata. Error: %{public}@", &v12, 12);
LABEL_19:
      v9 = (char *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore persistSyncEngineMetadata:]", "%s\n", v7);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v8 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not persist sync engine metadata due to invalid database. Most likely device is locked.", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      LOWORD(v12) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, could not persist sync engine metadata due to invalid database. Most likely device is locked.", &v12, 2);
      goto LABEL_19;
    }
  }
}

- (void)deleteSyncEngineMetadata
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v3 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Deleting sync engine metadata", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "[CloudKit] WifiAssociatedApCentroidStore, Deleting sync engine metadata", v9, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    sub_100F01920((uint64_t)self->_metadataDb.__ptr_.__value_);
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v4 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not delete sync engine metadata due to invalid database. Most likely device is locked.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, could not delete sync engine metadata due to invalid database. Most likely device is locked.", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (BOOL)addPendingRecordChanges:(id)a3 pendingRecordZoneChangeType:(int64_t)a4
{
  NSObject *v7;
  CKSyncEngine *syncEngine;
  NSMutableArray *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v20;
  _QWORD v21[7];
  int v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int64_t v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int64_t v33;

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v7 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v29 = CFSTR("com.apple.clx.cloudkit.zone");
    v30 = 2112;
    v31 = a3;
    v32 = 2048;
    v33 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordChanges - zoneName: %@, recordNames: %@, type: %ld", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v22 = 138412802;
    v23 = CFSTR("com.apple.clx.cloudkit.zone");
    v24 = 2112;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordChanges - zoneName: %@, recordNames: %@, type: %ld", &v22, 32);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  syncEngine = self->_syncEngine;
  if (syncEngine)
  {
    if (!a3)
      goto LABEL_18;
  }
  else
  {
    -[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine](self, "initializeSyncEngine");
    syncEngine = self->_syncEngine;
    if (!a3)
    {
LABEL_18:
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v12 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, could not add pending changes", buf, 2u);
      }
      v11 = sub_1001BFF7C(115, 2);
      if (v11)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        LOWORD(v22) = 0;
        LODWORD(v20) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, warning, could not add pending changes", &v22, v20);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
        LOBYTE(v11) = 0;
      }
      return v11;
    }
  }
  if (!syncEngine || !objc_msgSend(a3, "count"))
    goto LABEL_18;
  v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100AFDC70;
  v21[3] = &unk_102170738;
  v21[5] = v9;
  v21[6] = a4;
  v21[4] = CFSTR("com.apple.clx.cloudkit.zone");
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v21);
  -[CKSyncEngineState addPendingRecordZoneChanges:](-[CKSyncEngine state](self->_syncEngine, "state"), "addPendingRecordZoneChanges:", v9);
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v10 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, successfully added pending changes", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    LOWORD(v22) = 0;
    LODWORD(v20) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, successfully added pending changes", &v22, v20);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)addPendingRecordSaveChanges:(id)a3
{
  return -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:](self, "addPendingRecordChanges:pendingRecordZoneChangeType:", a3, CKSyncEnginePendingRecordZoneChangeTypeSave);
}

- (BOOL)addPendingRecordDeleteChanges:(id)a3
{
  return -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:](self, "addPendingRecordChanges:pendingRecordZoneChangeType:", a3, CKSyncEnginePendingRecordZoneChangeTypeDelete);
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
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v5 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Creating new zone with ZoneID: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v12 = 138412290;
      v13 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "[CloudKit] WifiAssociatedApCentroidStore, Creating new zone with ZoneID: %@", &v12, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore createZone:]", "%s\n", v9);
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

- (void)handleZoneDeleted:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, handleZoneDeleted. Do we need to do anything here?", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, handleZoneDeleted. Do we need to do anything here?", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleZoneDeleted:]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)handleServerRecordChanged:(id)a3
{
  NSObject *v5;
  CLWifiAssociatedApCentroidDatabase *value;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint8_t buf[1640];

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v5 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, handle ServerRecordChanged", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    LOWORD(v14[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, handle ServerRecordChanged", v14, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleServerRecordChanged:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  if (a3)
  {
    if (self->_syncEngine)
    {
      value = self->_centroidDb.__ptr_.__value_;
      if (value)
      {
        if ((sub_100D47784((uint64_t)value, objc_msgSend(a3, "recordID"), (uint64_t)+[CMHealthColdStorageUtils getSystemFieldsFromCKRecord:](CMHealthColdStorageUtils, "getSystemFieldsFromCKRecord:", a3)) & 1) == 0)
        {
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v7 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, ServerRecordChanged: Failed to update local system fields", buf, 2u);
          }
          if (sub_1001BFF7C(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            LOWORD(v14[0]) = 0;
            LODWORD(v13) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, ServerRecordChanged: Failed to update local system fields", v14, v13, v14[0]);
LABEL_31:
            v12 = (uint8_t *)v8;
            sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleServerRecordChanged:]", "%s\n", v8);
            if (v12 != buf)
              free(v12);
          }
        }
      }
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v9 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, could not handle server record change, invalid server record", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      LOWORD(v14[0]) = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, could not handle server record change, invalid server record", v14, v13, v14[0]);
      goto LABEL_31;
    }
  }
}

- (void)handleUnknownItem:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  CKSyncEngineState *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  id v13;
  uint8_t buf[1640];

  if (a3 && self->_syncEngine)
  {
    if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")
      && (sub_100D47784((uint64_t)self->_centroidDb.__ptr_.__value_, objc_msgSend(a3, "recordID"), 0) & 1) == 0)
    {
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v5 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, UnknownItem: Failed to update local system fields", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        v12 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, UnknownItem: Failed to update local system fields", &v12, 2);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleUnknownItem:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
    v6 = objc_alloc((Class)CKSyncEnginePendingRecordZoneChange);
    v7 = objc_msgSend(a3, "recordID");
    v8 = objc_msgSend(v6, "initWithRecordID:type:", v7, CKSyncEnginePendingRecordZoneChangeTypeSave);
    v9 = -[CKSyncEngine state](self->_syncEngine, "state");
    v13 = v8;
    -[CKSyncEngineState addPendingRecordZoneChanges:](v9, "addPendingRecordZoneChanges:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

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
      -[CLWifiAssociatedApCentroidSyncedDataStore createZone:](self, "createZone:", objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"));
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

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v4 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, Setting userRecordIDName to %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v9 = 138477827;
    v10 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, Setting userRecordIDName to %{private}@", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore setUserRecordIDName:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  v5 = sub_1001FD94C();
  sub_10052861C(v5, CFSTR("kWifiAssociatedApCentroidCloudKitUserID"), (char *)objc_msgSend(a3, "UTF8String"));
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
  sub_1000BD5F0(v2, (uint64_t)CFSTR("kWifiAssociatedApCentroidCloudKitUserID"), &__p);
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

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  void *v4;
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  id v33;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  int v51;
  uint64_t v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];

  if (self->_syncEngine != a3)
    return 0;
  v6 = objc_msgSend(objc_msgSend(a4, "options"), "zoneIDs");
  v7 = -[CKSyncEngineState pendingRecordZoneChanges](-[CKSyncEngine state](self->_syncEngine, "state"), "pendingRecordZoneChanges");
  if (v6)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v6, "containsObject:", objc_msgSend(objc_msgSend(v13, "recordID"), "zoneID")))
            objc_msgSend(v8, "addObject:", v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v10);
    }
    v7 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8);

  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100AFF088;
  v45[3] = &unk_102141698;
  v45[4] = self;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = objc_msgSend(objc_alloc((Class)CKSyncEngineRecordZoneChangeBatch), "initWithPendingChanges:recordProvider:", v7, v45);
  v14 = objc_msgSend(v36, "recordsToSave");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v18);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        v20 = qword_1022A0048;
        if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v54 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to save: %{private}@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v51 = 138477827;
          v52 = v19;
          LODWORD(v35) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to save: %{private}@", &v51, v35);
          v22 = (uint8_t *)v21;
          sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:nextRecordZoneChangeBatchForContext:]", "%s\n", v21);
          if (v22 != buf)
            free(v22);
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v23 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      v16 = v23;
    }
    while (v23);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = v36;
  v24 = objc_msgSend(v36, "recordIDsToDelete");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v28);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        v30 = qword_1022A0048;
        if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v54 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to delete: %{private}@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v51 = 138477827;
          v52 = v29;
          LODWORD(v35) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to delete: %{private}@", &v51, v35);
          v32 = (uint8_t *)v31;
          sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:nextRecordZoneChangeBatchForContext:]", "%s\n", v31);
          if (v32 != buf)
            free(v32);
        }
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      v26 = v33;
    }
    while (v33);
    return v36;
  }
  return v4;
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
          -[CLWifiAssociatedApCentroidSyncedDataStore handleStateUpdate:](self, "handleStateUpdate:", a4);
          break;
        case 1uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:](self, "handleAccountChange:", a4);
          break;
        case 2uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:](self, "handleFetchedDatabaseChanges:", a4);
          break;
        case 3uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:](self, "handleFetchedRecordZoneChanges:", a4);
          break;
        case 4uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleSentDatabaseChanges:](self, "handleSentDatabaseChanges:", a4);
          break;
        case 5uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleSentRecordZoneChanges:](self, "handleSentRecordZoneChanges:", a4);
          break;
        case 6uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchChanges:](self, "handleWillFetchChanges:", a4);
          break;
        case 7uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:](self, "handleWillFetchRecordZoneChanges:", a4);
          break;
        case 8uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:](self, "handleDidFetchRecordZoneChanges:", a4);
          break;
        case 9uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchChanges:](self, "handleDidFetchChanges:", a4);
          break;
        case 0xAuLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:](self, "handleWillSendChanges:", a4);
          break;
        case 0xBuLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:](self, "handleDidSendChanges:", a4);
          break;
        default:
          return;
      }
    }
    else
    {
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v6 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ doesn't match internal reference.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        LODWORD(v11) = 138477827;
        *(_QWORD *)((char *)&v11 + 4) = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ doesn't match internal reference.", &v11, 12, v11);
LABEL_33:
        v10 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:handleEvent:]", "%s\n", v7);
        if (v10 != buf)
          free(v10);
      }
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v8 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ called back for invalid event", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      LODWORD(v11) = 138477827;
      *(_QWORD *)((char *)&v11 + 4) = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ called back for invalid event", &v11, 12, v11);
      goto LABEL_33;
    }
  }
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
    -[CLWifiAssociatedApCentroidSyncedDataStore persistSyncEngineMetadata:](self, "persistSyncEngineMetadata:", objc_msgSend(v5, "stateSerialization"));
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineStateUpdateEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v9 = 138412290;
      v10 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineStateUpdateEvent (%@)", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleStateUpdate:]", "%s\n", v7);
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
  NSObject *v9;
  NSObject *v10;
  double v11;
  uint8_t *v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t *v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  const char *v22;
  uint8_t *v23;
  const char *v24;
  uint8_t *v25;
  uint64_t v26;
  _BYTE v27[12];
  uint8_t buf[4];
  id v29;

  v5 = objc_msgSend(a3, "accountChangeEvent");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "changeType");
    if (v7 == (id)2)
    {
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v14 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud switched accounts. Deleting all records and sync engine metadata.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        *(_WORD *)v27 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, iCloud switched accounts. Deleting all records and sync engine metadata.", v27, 2);
        v21 = (uint8_t *)v20;
        sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v20);
        if (v21 != buf)
          free(v21);
      }
      if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
        sub_100D47064((uint64_t)self->_centroidDb.__ptr_.__value_);
      -[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
    }
    else
    {
      if (v7 != (id)1)
      {
        if (v7)
          return;
        v8 = -[CLWifiAssociatedApCentroidSyncedDataStore getUserRecordIDName](self, "getUserRecordIDName");
        if (v8)
          LOBYTE(v8) = objc_msgSend(v8, "isEqualToString:", objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName")) ^ 1;
        -[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
        if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
        {
          if ((v8 & 1) != 0)
          {
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            v9 = qword_1022A0048;
            if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User switched account", buf, 2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0040 != -1)
                dispatch_once(&qword_1022A0040, &stru_1021707B8);
              *(_WORD *)v27 = 0;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User switched account", v27, 2);
              v23 = (uint8_t *)v22;
              sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v22);
              if (v23 != buf)
                free(v23);
            }
            sub_100D47064((uint64_t)self->_centroidDb.__ptr_.__value_);
          }
          else
          {
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            v18 = qword_1022A0048;
            if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in with same account", buf, 2u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0040 != -1)
                dispatch_once(&qword_1022A0040, &stru_1021707B8);
              *(_WORD *)v27 = 0;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in with same account", v27, 2);
              v25 = (uint8_t *)v24;
              sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v24);
              if (v25 != buf)
                free(v25);
            }
          }
        }
        -[CLWifiAssociatedApCentroidSyncedDataStore setUserRecordIDName:](self, "setUserRecordIDName:", objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName"));
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        v19 = qword_1022A0048;
        if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in.", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          return;
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        *(_WORD *)v27 = 0;
        LODWORD(v26) = 2;
        v17 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in.", v27, v26, *(_QWORD *)v27);
        goto LABEL_57;
      }
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v15 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed out.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021707B8);
        *(_WORD *)v27 = 0;
        v17 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed out.", v27, 2, *(_QWORD *)v27);
LABEL_57:
        v13 = v16;
        sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v17);
LABEL_58:
        if (v13 != buf)
          free(v13);
      }
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v10 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineAccountChangeEvent (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      *(_DWORD *)v27 = 138412290;
      *(_QWORD *)&v27[4] = a3;
      v11 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineAccountChangeEvent (%@)", v27, 12);
      v13 = v12;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]", "%s\n", v11);
      goto LABEL_58;
    }
  }
}

- (void)handleFetchedDatabaseChanges:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  id v24;
  NSObject *v25;
  double v26;
  uint8_t *v27;
  uint8_t *v28;
  NSObject *v29;
  double v30;
  uint8_t *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  int v44;
  id v45;
  uint8_t buf[4];
  id v47;

  v4 = objc_msgSend(a3, "fetchedDatabaseChangesEvent");
  if (v4)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v33 = v4;
    v5 = objc_msgSend(v4, "modifications");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v9);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v11 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v47 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone modification %{private}@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            v44 = 138477827;
            v45 = v10;
            LODWORD(v32) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone modification %{private}@", &v44, v32);
            v13 = (uint8_t *)v12;
            sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n", v12);
            if (v13 != buf)
              free(v13);
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        v7 = v14;
      }
      while (v14);
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = objc_msgSend(v33, "deletions");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v19);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v21 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v47 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone deletion %{private}@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            v44 = 138477827;
            v45 = v20;
            LODWORD(v32) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone deletion %{private}@", &v44, v32);
            v23 = (uint8_t *)v22;
            sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n", v22);
            if (v23 != buf)
              free(v23);
          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        v17 = v24;
      }
      while (v24);
    }
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v25 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, Fetched database changes event", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      LOWORD(v44) = 0;
      LODWORD(v32) = 2;
      v26 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, Fetched database changes event", &v44, v32);
      v28 = v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n", v26);
LABEL_53:
      if (v28 != buf)
        free(v28);
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v29 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v47 = a3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedDatabaseChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v44 = 138477827;
      v45 = a3;
      v30 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedDatabaseChangesEvent: %{private}@", &v44, 12);
      v28 = v31;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]", "%s\n", v30);
      goto LABEL_53;
    }
  }
}

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  id v25;
  NSObject *v26;
  double v27;
  uint8_t *v28;
  uint8_t *v29;
  NSObject *v30;
  double v31;
  uint8_t *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  int v45;
  id v46;
  uint8_t buf[4];
  id v48;

  v5 = objc_msgSend(a3, "fetchedRecordZoneChangesEvent");
  if (v5)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v5;
    v6 = objc_msgSend(v5, "modifications");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v40;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v10);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v12 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v48 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecord modification: %{private}@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            v45 = 138477827;
            v46 = v11;
            LODWORD(v33) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, CKRecord modification: %{private}@", &v45, v33);
            v14 = (uint8_t *)v13;
            sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n", v13);
            if (v14 != buf)
              free(v14);
          }
          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:](self, "handleFetchedRecordModification:", v11);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        v8 = v15;
      }
      while (v15);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = objc_msgSend(v34, "deletions");
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v20);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021707B8);
          v22 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v48 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, CKRecord deletion: %{private}@", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021707B8);
            v45 = 138477827;
            v46 = v21;
            LODWORD(v33) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, CKRecord deletion: %{private}@", &v45, v33);
            v24 = (uint8_t *)v23;
            sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n", v23);
            if (v24 != buf)
              free(v24);
          }
          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:](self, "handleFetchedRecordDeletion:", v21);
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        v18 = v25;
      }
      while (v25);
    }
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v26 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, Fetched record zone event", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      LOWORD(v45) = 0;
      LODWORD(v33) = 2;
      v27 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, Fetched record zone event", &v45, v33);
      v29 = v28;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n", v27);
LABEL_53:
      if (v29 != buf)
        free(v29);
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v30 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v48 = a3;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v45 = 138477827;
      v46 = a3;
      v31 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent: %{private}@", &v45, 12);
      v29 = v32;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]", "%s\n", v31);
      goto LABEL_53;
    }
  }
}

- (void)handleFetchedRecordModification:(id)a3
{
  id v5;
  NSObject *v6;
  CLWifiAssociatedApCentroidDatabase *value;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  int v18;
  id v19;
  uint8_t buf[4];
  id v21;
  void *__p;
  char v23;

  if (!a3)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v12 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordModification", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordModification", &v18, 2);
    v11 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v13);
    goto LABEL_42;
  }
  v5 = objc_msgSend(a3, "recordType");
  if (!v5 || (objc_msgSend(v5, "isEqualToString:", CFSTR("WifiAssociatedApCentroid")) & 1) == 0)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v8 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v21 = objc_msgSend(a3, "recordType");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v9 = qword_1022A0048;
    v18 = 138477827;
    v19 = objc_msgSend(a3, "recordType");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@", &v18, 12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v10);
    if (v11 == buf)
      return;
LABEL_43:
    free(v11);
    return;
  }
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, inserting record %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v18 = 138477827;
      v19 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, inserting record %{private}@", &v18, 12);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    value = self->_centroidDb.__ptr_.__value_;
    sub_1008BA588((uint64_t)buf, a3);
    sub_100D45B34((uint64_t)value);
    if (v23 < 0)
      operator delete(__p);
    return;
  }
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v14 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordModification", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordModification", &v18, 2);
    v11 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]", "%s\n", v17);
LABEL_42:
    if (v11 == buf)
      return;
    goto LABEL_43;
  }
}

- (void)handleFetchedRecordDeletion:(id)a3
{
  id v5;
  NSObject *v6;
  CLWifiAssociatedApCentroidDatabase *value;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  _BYTE v17[12];
  uint8_t buf[4];
  id v19;

  if (!a3)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v12 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordDeletion", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    *(_WORD *)v17 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordDeletion", v17, 2, *(_QWORD *)v17);
    goto LABEL_41;
  }
  v5 = objc_msgSend(a3, "recordType");
  if (!v5 || (objc_msgSend(v5, "isEqualToString:", CFSTR("WifiAssociatedApCentroid")) & 1) == 0)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v8 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v19 = objc_msgSend(a3, "recordType");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v9 = qword_1022A0048;
    *(_DWORD *)v17 = 138477827;
    *(_QWORD *)&v17[4] = objc_msgSend(a3, "recordType");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@", v17, 12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]", "%s\n", v10);
    if (v11 == buf)
      return;
LABEL_42:
    free(v11);
    return;
  }
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, deleting record %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      *(_DWORD *)v17 = 138477827;
      *(_QWORD *)&v17[4] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, deleting record %{private}@", v17, 12);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    value = self->_centroidDb.__ptr_.__value_;
    objc_msgSend(a3, "recordID");
    sub_100D46C98((uint64_t)value);
    return;
  }
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v14 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordDeletion", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    *(_WORD *)v17 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordDeletion", v17, 2, *(_QWORD *)v17);
LABEL_41:
    v11 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]", "%s\n", v13);
    if (v11 == buf)
      return;
    goto LABEL_42;
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
    objc_msgSend(objc_msgSend(v5, "savedZones"), "enumerateObjectsUsingBlock:", &stru_102170758);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B01C84;
    v11[3] = &unk_102141728;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedZoneIDs"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B01E50;
    v10[3] = &unk_102141750;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedZoneSaves"), "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(objc_msgSend(v6, "failedZoneDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_102170778);
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v7 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentDatabaseChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v12 = 138477827;
      v13 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentDatabaseChangesEvent: %{private}@", &v12, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleSentDatabaseChanges:]", "%s\n", v8);
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
    v12[2] = sub_100B02504;
    v12[3] = &unk_1021416C0;
    v12[4] = self;
    objc_msgSend(objc_msgSend(v5, "savedRecords"), "enumerateObjectsUsingBlock:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B02824;
    v11[3] = &unk_1021417B8;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedRecordIDs"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B02B24;
    v10[3] = &unk_1021417E0;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedRecordSaves"), "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(objc_msgSend(v6, "failedRecordDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_102170798);
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v7 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v13 = 138477827;
      v14 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentRecordZoneChangesEvent: %{private}@", &v13, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleSentRecordZoneChanges:]", "%s\n", v8);
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

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch changes", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch changes", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchChanges:]", "%s\n", v4);
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
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v17 = objc_msgSend(v5, "zoneID");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch zone changes for zoneID %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v7 = qword_1022A0048;
      v14 = 138543362;
      v15 = objc_msgSend(v5, "zoneID");
      v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch zone changes for zoneID %{public}@", &v14, 12);
      v10 = v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]", "%s\n", v8);
LABEL_19:
      if (v10 != buf)
        free(v10);
    }
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v11 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v14 = 138477827;
      v15 = a3;
      v12 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent: %{private}@", &v14, 12);
      v10 = v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]", "%s\n", v12);
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
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v6 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = objc_msgSend(v5, "zoneID");
        v23 = 2114;
        v24 = objc_msgSend(v5, "error");
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Error fetching record zone changes for %{public}@. Error: %{public}@", buf, 0x16u);
      }
      if (!sub_1001BFF7C(115, 0))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v7 = qword_1022A0048;
      v17 = 138543618;
      v18 = objc_msgSend(v5, "zoneID");
      v19 = 2114;
      v20 = objc_msgSend(v5, "error");
      v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 16, "[CloudKit] WifiAssociatedApCentroidStore, Error fetching record zone changes for %{public}@. Error: %{public}@", &v17, 22);
      v10 = v9;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]", "%s\n", v8);
    }
    else
    {
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v13 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v22 = objc_msgSend(v5, "zoneID");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine successfully fetched zone changes for zoneID %{public}@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v14 = qword_1022A0048;
      v17 = 138543362;
      v18 = objc_msgSend(v5, "zoneID");
      v15 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 2, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine successfully fetched zone changes for zoneID %{public}@", &v17, 12);
      v10 = v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]", "%s\n", v15);
    }
    if (v10 != buf)
LABEL_30:
      free(v10);
  }
  else
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v11 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent: %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021707B8);
      v17 = 138477827;
      v18 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent: %{private}@", &v17, 12);
      v10 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]", "%s\n", v12);
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

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did fetch changes", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did fetch changes", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchChanges:]", "%s\n", v4);
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
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine will send changes. Reason: %d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v7 = qword_1022A0048;
    v12 = 67109120;
    LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine will send changes. Reason: %d", &v12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:]", "%s\n", v8);
    if (v9 == buf)
      return;
LABEL_20:
    free(v9);
    return;
  }
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v10 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillSendChangesEvent: %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v12 = 138477827;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillSendChangesEvent: %{private}@", &v12, 12);
    v9 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:]", "%s\n", v11);
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
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v6 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did send changes. Reason: %d", buf, 8u);
    }
    if (!sub_1001BFF7C(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v7 = qword_1022A0048;
    v12 = 67109120;
    LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 2, "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did send changes. Reason: %d", &v12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:]", "%s\n", v8);
    if (v9 == buf)
      return;
LABEL_20:
    free(v9);
    return;
  }
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021707B8);
  v10 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidSendChangesEvent: %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021707B8);
    v12 = 138477827;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidSendChangesEvent: %{private}@", &v12, 12);
    v9 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 0, "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:]", "%s\n", v11);
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
  CLWifiAssociatedApCentroidDatabase *value;
  uint64_t v4;
  unique_ptr<CLCloudKitMetadataDatabase, std::default_delete<CLCloudKitMetadataDatabase>> *p_metadataDb;
  CLCloudKitMetadataDatabase *v6;

  value = self->_centroidDb.__ptr_.__value_;
  self->_centroidDb.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CLWifiAssociatedApCentroidDatabase *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v6 = self->_metadataDb.__ptr_.__value_;
  p_metadataDb = &self->_metadataDb;
  v4 = (uint64_t)v6;
  p_metadataDb->__ptr_.__value_ = 0;
  if (v6)
    sub_100B046B0((uint64_t)p_metadataDb, v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
