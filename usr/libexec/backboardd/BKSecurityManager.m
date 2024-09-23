@implementation BKSecurityManager

+ (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSecurityManager sharedInstance](BKSecurityManager, "sharedInstance"));
  LOBYTE(a4) = objc_msgSend(v6, "hasEntitlement:forAuditToken:", v5, a4);

  return (char)a4;
}

- (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(a4) = -[BKSecurityManager _lock_hasEntitlement:usingCacheForAuditToken:](self, "_lock_hasEntitlement:usingCacheForAuditToken:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)_lock_hasEntitlement:(id)a3 usingCacheForAuditToken:(id *)a4
{
  id v6;
  __int128 v7;
  void *v8;
  id v9;
  NSMutableDictionary *lock_vpidToCacheEntry;
  void *v11;
  BKEntitlementCachePerProcessEntry *v12;
  id v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[6];
  _OWORD v23[2];

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = *(_OWORD *)&a4->var0[4];
  v23[0] = *(_OWORD *)a4->var0;
  v23[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromAuditToken:](BSAuditToken, "tokenFromAuditToken:", v23));
  v9 = objc_msgSend(v8, "versionedPID");
  lock_vpidToCacheEntry = self->_lock_vpidToCacheEntry;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
  v12 = (BKEntitlementCachePerProcessEntry *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_vpidToCacheEntry, "objectForKey:", v11));

  if (!v12)
  {
    v12 = objc_opt_new(BKEntitlementCachePerProcessEntry);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004543C;
    v22[3] = &unk_1000ECB60;
    v22[4] = self;
    v22[5] = v9;
    v13 = objc_msgSend(objc_alloc((Class)BSProcessDeathWatcher), "initWithPID:queue:deathHandler:", objc_msgSend(v8, "pid"), &_dispatch_main_q, v22);
    -[BKEntitlementCachePerProcessEntry setDeathWatcher:](v12, "setDeathWatcher:", v13);

    v14 = self->_lock_vpidToCacheEntry;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v12, v15);

  }
  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[BKEntitlementCachePerProcessEntry entitlementCache](v12, "entitlementCache"));
  if (!v16)
  {
    v16 = objc_opt_new(NSMutableDictionary);
    -[BKEntitlementCachePerProcessEntry setEntitlementCache:](v12, "setEntitlementCache:", v16);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v6));
  v18 = v17;
  if (v17)
  {
    LOBYTE(v19) = objc_msgSend(v17, "BOOLValue");
  }
  else
  {
    v19 = objc_msgSend(v8, "hasEntitlement:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19));
    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v20, v6);

  }
  return (char)v19;
}

+ (id)sharedInstance
{
  if (qword_100117330 != -1)
    dispatch_once(&qword_100117330, &stru_1000EAB40);
  return (id)qword_100117328;
}

- (BKSecurityManager)init
{
  BKSecurityManager *v2;
  BKSecurityManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lock_vpidToCacheEntry;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSecurityManager;
  v2 = -[BKSecurityManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lock_vpidToCacheEntry = v3->_lock_vpidToCacheEntry;
    v3->_lock_vpidToCacheEntry = v4;

  }
  return v3;
}

- (void)_processDidTerminate:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_vpidToCacheEntry;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  lock_vpidToCacheEntry = self->_lock_vpidToCacheEntry;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lock_vpidToCacheEntry, "objectForKey:", v7));

  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deathWatcher"));
    objc_msgSend(v8, "invalidate");

    v9 = self->_lock_vpidToCacheEntry;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_vpidToCacheEntry, 0);
}

+ (BOOL)hasEntitlement:(id)a3 forConnection:(id)a4
{
  id v6;
  _OWORD v8[2];

  memset(v8, 0, sizeof(v8));
  v6 = a3;
  xpc_connection_get_audit_token(a4, v8);
  LOBYTE(a4) = objc_msgSend(a1, "hasEntitlement:forAuditToken:", v6, v8);

  return (char)a4;
}

@end
