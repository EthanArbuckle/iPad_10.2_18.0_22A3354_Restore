@implementation CKKSMemoryKeyCache

- (CKKSMemoryKeyCache)init
{
  CKKSMemoryKeyCache *v2;
  uint64_t v3;
  NSMutableDictionary *keyCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKKSMemoryKeyCache;
  v2 = -[CKKSMemoryKeyCache init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    keyCache = v2->_keyCache;
    v2->_keyCache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)loadKeyForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache keyCache](self, "keyCache"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));

  if (!v14)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey loadKeyWithUUID:contextID:zoneID:error:](CKKSKey, "loadKeyWithUUID:contextID:zoneID:error:", v10, v11, v12, a6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache keyCache](self, "keyCache"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v10);

  }
  v16 = v14;

  return v16;
}

- (id)loadKeyForItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentKeyUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache loadKeyForUUID:contextID:zoneID:error:](self, "loadKeyForUUID:contextID:zoneID:error:", v7, v8, v9, a4));
  return v10;
}

- (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer fromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "fromDatabase:contextID:zoneID:error:", a3, v10, v11, a6));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentKeyUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache loadKeyForUUID:contextID:zoneID:error:](self, "loadKeyForUUID:contextID:zoneID:error:", v14, v10, v11, a6));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)addKeyToCache:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CKKSMemoryKeyCache keyCache](self, "keyCache"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (NSMutableDictionary)keyCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeyCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCache, 0);
}

@end
