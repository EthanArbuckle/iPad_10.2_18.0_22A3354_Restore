@implementation AEBookProtocolCacheItemProvider

+ (AEBookProtocolCacheItemProvider)sharedInstance
{
  id WeakRetained;
  AEBookProtocolCacheItemProvider *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_20F578);
  WeakRetained = objc_loadWeakRetained(&qword_20F580);

  if (WeakRetained)
  {
    v3 = (AEBookProtocolCacheItemProvider *)objc_loadWeakRetained(&qword_20F580);
  }
  else
  {
    v3 = objc_alloc_init(AEBookProtocolCacheItemProvider);
    objc_storeWeak(&qword_20F580, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_20F578);
  return v3;
}

- (AEBookProtocolCacheItemProvider)init
{
  AEBookProtocolCacheItemProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *bookCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEBookProtocolCacheItemProvider;
  v2 = -[AEBookProtocolCacheItemProvider init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bookCache = v2->_bookCache;
    v2->_bookCache = v3;

    v2->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)clearCache
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_895AC;
  v2[3] = &unk_1BEA38;
  v2[4] = self;
  -[AEBookProtocolCacheItemProvider _performWithLock:](self, "_performWithLock:", v2);
}

- (void)clearCacheForDatabaseKey:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_8963C;
    v5[3] = &unk_1BFDB8;
    v5[4] = self;
    v6 = v4;
    -[AEBookProtocolCacheItemProvider _performWithLock:](self, "_performWithLock:", v5);

  }
}

- (void)clearCacheForDatabaseKeys:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_896CC;
    v5[3] = &unk_1BFDB8;
    v5[4] = self;
    v6 = v4;
    -[AEBookProtocolCacheItemProvider _performWithLock:](self, "_performWithLock:", v5);

  }
}

- (id)cacheItemForDatabaseKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = sub_897F8;
    v14 = sub_89808;
    v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_89810;
    v7[3] = &unk_1C0CE8;
    v9 = &v10;
    v7[4] = self;
    v8 = v4;
    -[AEBookProtocolCacheItemProvider _performWithLock:](self, "_performWithLock:", v7);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/AlderModels/AEBookProtocolCacheItemProvider.m", 83, "-[AEBookProtocolCacheItemProvider cacheItemForDatabaseKey:]", "databaseKey.length", 0);
    v5 = 0;
  }

  return v5;
}

- (void)_performWithLock:(id)a3
{
  os_unfair_lock_s *p_unfairLock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_unfairLock = &self->_unfairLock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_unfairLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_unfairLock);
  }
}

- (NSMutableDictionary)bookCache
{
  return self->_bookCache;
}

- (void)setBookCache:(id)a3
{
  objc_storeStrong((id *)&self->_bookCache, a3);
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookCache, 0);
}

@end
