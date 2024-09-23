@implementation BEDocumentExternalLoadApprovalCache

+ (BEDocumentExternalLoadApprovalCache)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11B74;
  block[3] = &unk_377C50;
  block[4] = a1;
  if (qword_3C1A50 != -1)
    dispatch_once(&qword_3C1A50, block);
  return (BEDocumentExternalLoadApprovalCache *)(id)qword_3C1A48;
}

- (BEDocumentExternalLoadApprovalCache)init
{
  BEDocumentExternalLoadApprovalCache *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BEDocumentExternalLoadApprovalCache;
  result = -[BEDocumentExternalLoadApprovalCache init](&v3, "init");
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)hasCachedLoadExternalContentApprovalForBookID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentExternalLoadApprovalCache cachedApprovalForBookID:](self, "cachedApprovalForBookID:", v4));
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)didApproveLoadingExternalContentForBookID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEDocumentExternalLoadApprovalCache cachedApprovalForBookID:](self, "cachedApprovalForBookID:", v4));
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cachedApprovalForBookID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_11DC8;
  v17 = sub_11DD8;
  v18 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[BEDocumentExternalLoadApprovalCache _ensureCacheLoaded](self, "_ensureCacheLoaded");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_11DE0;
    v10[3] = &unk_377790;
    v12 = &v13;
    v10[4] = self;
    v11 = v4;
    -[BEDocumentExternalLoadApprovalCache _accessCacheIvar:](self, "_accessCacheIvar:", v10);
    v5 = v14[5];
    v6 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {
      v7 = (void *)v14[5];
      v14[5] = 0;

    }
  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)cachedApproval:(BOOL)a3 forBookID:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[BEDocumentExternalLoadApprovalCache _ensureCacheLoaded](self, "_ensureCacheLoaded");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_11EB4;
    v7[3] = &unk_377C78;
    v7[4] = self;
    v9 = a3;
    v8 = v6;
    -[BEDocumentExternalLoadApprovalCache _accessCacheIvar:](self, "_accessCacheIvar:", v7);

  }
}

- (void)removeCachedDisapprovalForBookID:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[BEDocumentExternalLoadApprovalCache _ensureCacheLoaded](self, "_ensureCacheLoaded");
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_11FD0;
    v5[3] = &unk_377928;
    v5[4] = self;
    v6 = v4;
    -[BEDocumentExternalLoadApprovalCache _accessCacheIvar:](self, "_accessCacheIvar:", v5);

  }
}

- (void)_ensureCacheLoaded
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_120B0;
  v2[3] = &unk_377CA0;
  v2[4] = self;
  -[BEDocumentExternalLoadApprovalCache _accessCacheIvar:](self, "_accessCacheIvar:", v2);
}

- (void)_accessCacheIvar:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  if (a3)
  {
    p_lock = &self->_lock;
    v4 = (void (**)(_QWORD))a3;
    os_unfair_lock_lock(p_lock);
    v4[2](v4);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
