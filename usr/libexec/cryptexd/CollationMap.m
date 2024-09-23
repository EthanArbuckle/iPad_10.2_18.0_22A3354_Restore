@implementation CollationMap

- (CollationMap)init
{
  CollationMap *v2;
  os_log_t v3;
  id v4;
  void *v5;
  dispatch_queue_t v6;
  uint64_t v8;
  objc_super v9;
  _OWORD v10[5];

  v9.receiver = self;
  v9.super_class = (Class)CollationMap;
  v2 = -[CollationMap init](&v9, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.libcryptex", "collations");
    -[CollationMap setLog:](v2, "setLog:", v3);

    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[CollationMap setColl_map:](v2, "setColl_map:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollationMap coll_map](v2, "coll_map"));
    if (!v5)
      sub_10003F634(&v8, v10);
    v6 = dispatch_queue_create("com.apple.security.cryptexd.CollationMap", 0);
    -[CollationMap setDq:](v2, "setDq:", v6);

  }
  return v2;
}

+ (id)getMap
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E584;
  block[3] = &unk_100056298;
  block[4] = a1;
  if (qword_10005A848 != -1)
    dispatch_once(&qword_10005A848, block);
  return (id)qword_10005A850;
}

+ (void)createCollationForUser:(unsigned int)a3
{
  void *v4;
  _QWORD *v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  _QWORD block[4];
  id v10;
  id v11;
  unsigned int v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[CollationMap getMap](CollationMap, "getMap"));
  v6 = v5[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E6BC;
  block[3] = &unk_1000562E8;
  v10 = v5;
  v11 = v4;
  v12 = a3;
  v7 = v4;
  v8 = v5;
  dispatch_sync(v6, block);

}

+ (int)addEntryForUser:(unsigned int)a3 fromQuire:(id)a4
{
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD *v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  unsigned int v14;

  v5 = a4;
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[CollationMap getMap](CollationMap, "getMap"));
  v7 = v6[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E8A0;
  block[3] = &unk_1000562E8;
  v14 = a3;
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, block);

  return 0;
}

+ (int)removeEntryForUser:(unsigned int)a3 withValue:(char *)a4
{
  _QWORD *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD block[4];
  id v11;
  char *v12;
  unsigned int v13;

  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[CollationMap getMap](CollationMap, "getMap"));
  v7 = v6[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ECE0;
  block[3] = &unk_100056310;
  v13 = a3;
  v11 = v6;
  v12 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

  return 0;
}

+ (BOOL)lookupEntryForUser:(unsigned int)a3 withBundleID:(const char *)a4 minVersion:(_cryptex_version *)a5
{
  _QWORD *v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  const char *v15;
  _cryptex_version *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[CollationMap getMap](CollationMap, "getMap"));
  v9 = v8[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EF24;
  block[3] = &unk_100056360;
  v17 = a3;
  v13 = v8;
  v14 = &v18;
  v15 = a4;
  v16 = a5;
  v10 = v8;
  dispatch_sync(v9, block);
  LOBYTE(a4) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)a4;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)coll_map
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setColl_map:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
  objc_storeStrong((id *)&self->_dq, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_coll_map, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
