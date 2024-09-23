@implementation CLWifiAssociatedApCentroidKVStore

- (id)initKVStore
{
  CLWifiAssociatedApCentroidKVStore *v2;
  NSObject *v3;
  NSUbiquitousKeyValueStore *v4;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  objc_super v9;
  uint8_t buf[8];

  v9.receiver = self;
  v9.super_class = (Class)CLWifiAssociatedApCentroidKVStore;
  v2 = -[CLWifiAssociatedApCentroidKVStore init](&v9, "init");
  if (v2)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021954B0);
    v3 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, init", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021954B0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "WifiAssociatedApCentroidStore, init", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidKVStore initKVStore]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    v4 = (NSUbiquitousKeyValueStore *)objc_msgSend(objc_alloc((Class)NSUbiquitousKeyValueStore), "initWithStoreIdentifier:type:", CFSTR("com.apple.locationd.clx"), 2);
    v2->_kvStore = v4;
    -[NSUbiquitousKeyValueStore synchronize](v4, "synchronize");
    *(_QWORD *)buf = -[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](v2, "getKVStoreDictionary");
    sub_100D7C140((id *)buf);
  }
  return v2;
}

- (CLWifiAssociatedApCentroidKVStoreDictionary)getKVStoreDictionary
{
  CLWifiAssociatedApCentroidKVStoreDictionary v3;

  sub_100308BCC(&v3, (uint64_t)-[NSUbiquitousKeyValueStore dictionaryRepresentation](self->_kvStore, "dictionaryRepresentation"));
  return v3;
}

- (void)addRecord:(id)a3
{
  -[NSUbiquitousKeyValueStore setObject:forKey:](self->_kvStore, "setObject:forKey:", objc_msgSend(a3, "toNSDictionary"), objc_msgSend(a3, "mac"));
}

- (BOOL)deleteAllRecords
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[NSDictionary allKeys](-[NSUbiquitousKeyValueStore dictionaryRepresentation](-[CLWifiAssociatedApCentroidKVStore kvStore](self, "kvStore"), "dictionaryRepresentation"), "allKeys", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_kvStore, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return 1;
}

- (void)deleteRecordsByMac:(id)a3
{
  if (-[NSDictionary objectForKey:](-[NSUbiquitousKeyValueStore dictionaryRepresentation](-[CLWifiAssociatedApCentroidKVStore kvStore](self, "kvStore"), "dictionaryRepresentation"), "objectForKey:", a3))
  {
    -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_kvStore, "removeObjectForKey:", a3);
  }
}

- (BOOL)deleteRecordsOlderThan:(double)a3
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  char *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  double v14;
  int v15;
  uint64_t v16;
  _BYTE buf[1632];

  v14 = a3;
  *(_QWORD *)buf = -[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  sub_100D7BA04((id *)buf, &v14, (void **)&v12);
  v4 = v12;
  v5 = v13;
  if (v12 != v13)
  {
    do
    {
      v6 = *v4;
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_1021954B0);
      v7 = qword_1022A0048;
      if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, deleting %{private}@ from key-value store", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0040 != -1)
          dispatch_once(&qword_1022A0040, &stru_1021954B0);
        v15 = 138477827;
        v16 = v6;
        LODWORD(v11) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "WifiAssociatedApCentroidStore, deleting %{private}@ from key-value store", &v15, v11);
        v9 = (char *)v8;
        sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidKVStore deleteRecordsOlderThan:]", "%s\n", v8);
        if (v9 != buf)
          free(v9);
      }
      -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_kvStore, "removeObjectForKey:", v6);
      ++v4;
    }
    while (v4 != v5);
    v4 = v12;
  }
  if (v4)
  {
    v13 = v4;
    operator delete(v4);
  }
  return 1;
}

- (BOOL)purgeOlderRecords
{
  double v3;
  uint64_t *v4;
  double v5;
  double v7;
  NSObject *v8;
  const char *v9;
  char *v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  _BYTE buf[12];
  __int16 v16;
  double v17;

  *(_QWORD *)buf = -[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  v3 = sub_100D7BDF4((id *)buf);
  v4 = sub_1000A3224();
  v5 = sub_1000A14F8(v4);
  if (v3 < v5)
    return 1;
  v7 = v5;
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021954B0);
  v8 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    *(double *)&buf[4] = v7;
    v16 = 2049;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, purging records older than %{private}.1f, oldest age, %{private}.1f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021954B0);
    v11 = 134283777;
    v12 = v7;
    v13 = 2049;
    v14 = v3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "WifiAssociatedApCentroidStore, purging records older than %{private}.1f, oldest age, %{private}.1f", &v11, 22);
    v10 = (char *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidKVStore purgeOlderRecords]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  return -[CLWifiAssociatedApCentroidKVStore deleteRecordsOlderThan:](self, "deleteRecordsOlderThan:", v7);
}

- (id)fetchRecord:(id)a3
{
  CLWifiAssociatedApCentroidDO *v4;
  CLWifiAssociatedApCentroidDO *v5;
  CLWifiAssociatedApCentroidKVStoreDictionary v7;
  _QWORD v8[15];
  char v9;

  v7.var0 = (id)-[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  sub_100D7BC30(&v7.var0, (uint64_t)a3, (uint64_t)v8);
  if (v9)
  {
    v4 = [CLWifiAssociatedApCentroidDO alloc];
    v5 = -[CLWifiAssociatedApCentroidDO initWithNSDictionary:](v4, "initWithNSDictionary:", v8[0]);
  }
  else
  {
    v5 = 0;
  }
  sub_100D7C59C((uint64_t)v8);
  return v5;
}

- (int)count
{
  CLWifiAssociatedApCentroidKVStoreDictionary v3;

  v3.var0 = (id)-[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  return sub_100D7B9EC(&v3.var0);
}

- (BOOL)isEmpty
{
  return -[CLWifiAssociatedApCentroidKVStore count](self, "count") == 0;
}

- (id)getSampleMacs:(int)a3
{
  CLWifiAssociatedApCentroidKVStoreDictionary v5;

  v5.var0 = (id)-[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  return (id)sub_100D7BDC8(&v5.var0, a3);
}

- (basic_string<char,)getBasicInfo
{
  void *v1;
  id v4;

  v4 = objc_msgSend(v1, "getKVStoreDictionary");
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100D7BF30(&v4, retstr);
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

@end
