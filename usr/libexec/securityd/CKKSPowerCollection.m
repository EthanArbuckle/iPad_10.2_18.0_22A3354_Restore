@implementation CKKSPowerCollection

- (CKKSPowerCollection)init
{
  CKKSPowerCollection *v2;
  uint64_t v3;
  NSMutableDictionary *store;
  uint64_t v5;
  NSMutableDictionary *delete;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKKSPowerCollection;
  v2 = -[CKKSPowerCollection init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    delete = v2->_delete;
    v2->_delete = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)addToStatsDictionary:(id)a3 key:(id)a4
{
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v5 = (const __CFString *)a4;
  if (!v5)
    v5 = CFSTR("access-group-missing");
  v9 = (__CFString *)v5;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v9));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)objc_msgSend(v7, "longValue") + 1));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)storedOQE:(id)a3
{
  NSMutableDictionary *store;
  id v5;

  store = self->_store;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessgroup"));
  -[CKKSPowerCollection addToStatsDictionary:key:](self, "addToStatsDictionary:key:", store, v5);

}

- (void)deletedOQE:(id)a3
{
  NSMutableDictionary *delete;
  id v5;

  delete = self->_delete;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessgroup"));
  -[CKKSPowerCollection addToStatsDictionary:key:](self, "addToStatsDictionary:key:", delete, v5);

}

- (void)summary:(id)a3 stats:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v18[0] = CFSTR("operation");
        v18[1] = CFSTR("accessgroup");
        v19[0] = v5;
        v19[1] = v11;
        v18[2] = CFSTR("items");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:"));
        v19[2] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
        sub_10001CD10(CFSTR("CKKSSyncing"), v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)commit
{
  -[CKKSPowerCollection summary:stats:](self, "summary:stats:", CFSTR("store"), self->_store);
  -[CKKSPowerCollection summary:stats:](self, "summary:stats:", CFSTR("delete"), self->_delete);
}

- (NSMutableDictionary)store
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)delete
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delete, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("operation");
  v8[1] = CFSTR("zone");
  v9[0] = a3;
  v9[1] = a4;
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  sub_10001CD10(CFSTR("CKKSSyncing"), v7);
}

+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4 count:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v11[0] = CFSTR("operation");
  v11[1] = CFSTR("zone");
  v12[0] = a3;
  v12[1] = a4;
  v11[2] = CFSTR("count");
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v12[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  sub_10001CD10(CFSTR("CKKSSyncing"), v10);
}

+ (void)CKKSPowerEvent:(id)a3 count:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("operation");
  v8[1] = CFSTR("count");
  v9[0] = a3;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  sub_10001CD10(CFSTR("CKKSSyncing"), v7);
}

+ (void)OTPowerEvent:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v5 = CFSTR("operation");
  v6 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  sub_10001CD10(CFSTR("OctagonTrust"), v4);
}

@end
