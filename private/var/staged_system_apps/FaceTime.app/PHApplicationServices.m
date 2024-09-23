@implementation PHApplicationServices

- (void)setInitializationBlockQueued:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_accessorLock;

  v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_initializationBlockQueued != v3)
    self->_initializationBlockQueued = v3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setMetadataCache:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  TUMetadataCache **p_metadataCache;
  TUMetadataCache *metadataCache;
  TUMetadataCache *v8;

  v8 = (TUMetadataCache *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  metadataCache = self->_metadataCache;
  p_metadataCache = &self->_metadataCache;
  if (metadataCache != v8)
    objc_storeStrong((id *)p_metadataCache, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (void)setContactStore:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  CNContactStore **p_contactStore;
  CNContactStore *contactStore;
  CNContactStore *v8;

  v8 = (CNContactStore *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactStore = self->_contactStore;
  p_contactStore = &self->_contactStore;
  if (contactStore != v8)
    objc_storeStrong((id *)p_contactStore, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (void)setSuggestedContactStore:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  CNContactStore **p_suggestedContactStore;
  CNContactStore *suggestedContactStore;
  CNContactStore *v8;

  v8 = (CNContactStore *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  suggestedContactStore = self->_suggestedContactStore;
  p_suggestedContactStore = &self->_suggestedContactStore;
  if (suggestedContactStore != v8)
    objc_storeStrong((id *)p_suggestedContactStore, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (void)setCallProviderManager:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  TUCallProviderManager **p_callProviderManager;
  TUCallProviderManager *callProviderManager;
  TUCallProviderManager *v8;

  v8 = (TUCallProviderManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  callProviderManager = self->_callProviderManager;
  p_callProviderManager = &self->_callProviderManager;
  if (callProviderManager != v8)
    objc_storeStrong((id *)p_callProviderManager, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (TUMetadataCache)metadataCache
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000064D8;
  v18[3] = &unk_10008A100;
  v18[4] = self;
  v3 = objc_retainBlock(v18);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000319E0;
  v16 = sub_1000319F0;
  v4 = ((uint64_t (*)(void))v3[2])();
  v17 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)v13[5];
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[PHApplicationServices dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031B80;
    block[3] = &unk_100089EB8;
    v11 = &v12;
    v10 = v3;
    dispatch_sync(v6, block);

    v5 = (void *)v13[5];
  }
  v7 = v5;
  _Block_object_dispose(&v12, 8);

  return (TUMetadataCache *)v7;
}

- (CNContactStore)suggestedContactStore
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000067AC;
  v17[3] = &unk_10008A0D8;
  v17[4] = self;
  v3 = objc_retainBlock(v17);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000319E0;
  v15 = sub_1000319F0;
  v4 = ((uint64_t (*)(void))v3[2])();
  v16 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (!v12[5] && -[PHApplicationServices isInitializationBlockQueued](self, "isInitializationBlockQueued"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PHApplicationServices dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031B44;
    block[3] = &unk_100089EB8;
    v10 = &v11;
    v9 = v3;
    dispatch_sync(v5, block);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CNContactStore *)v6;
}

- (CNContactStore)contactStore
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100005CFC;
  v21[3] = &unk_10008A0D8;
  v21[4] = self;
  v3 = objc_retainBlock(v21);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000319E0;
  v19 = sub_1000319F0;
  v4 = ((uint64_t (*)(void))v3[2])();
  v20 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (!v16[5] && -[PHApplicationServices isInitializationBlockQueued](self, "isInitializationBlockQueued"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PHApplicationServices dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031B08;
    block[3] = &unk_100089EB8;
    v14 = &v15;
    v6 = v3;
    v13 = v6;
    dispatch_sync(v5, block);

    v7 = ((uint64_t (*)(id))v3[2])(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v16[5];
    v16[5] = v8;

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (CNContactStore *)v10;
}

- (TUCallProviderManager)callProviderManager
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006018;
  v18[3] = &unk_10008A0B0;
  v18[4] = self;
  v3 = objc_retainBlock(v18);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1000319E0;
  v16 = sub_1000319F0;
  v4 = ((uint64_t (*)(void))v3[2])();
  v17 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)v13[5];
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[PHApplicationServices dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000319F8;
    block[3] = &unk_100089EB8;
    v11 = &v12;
    v10 = v3;
    dispatch_sync(v6, block);

    v5 = (void *)v13[5];
  }
  v7 = v5;
  _Block_object_dispose(&v12, 8);

  return (TUCallProviderManager *)v7;
}

- (PHApplicationServices)init
{
  PHApplicationServices *v2;
  PHApplicationServices *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v8;
  _QWORD block[4];
  PHApplicationServices *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHApplicationServices;
  v2 = -[PHApplicationServices init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("PHApplicationServices.serialQueue", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    -[PHApplicationServices setInitializationBlockQueued:](v3, "setInitializationBlockQueued:", 1);
    v8 = objc_claimAutoreleasedReturnValue(-[PHApplicationServices dispatchQueue](v3, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B930;
    block[3] = &unk_1000898B8;
    v11 = v3;
    dispatch_async(v8, block);

  }
  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031984;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3930 != -1)
    dispatch_once(&qword_1000A3930, block);
  return (id)qword_1000A3928;
}

- (BOOL)isInitializationBlockQueued
{
  PHApplicationServices *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (CNGeminiManager)contactGeminiManager
{
  os_unfair_lock_s *p_accessorLock;
  CNGeminiManager *contactGeminiManager;
  CNGeminiManager *v5;
  CNGeminiManager *v6;
  CNGeminiManager *v7;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactGeminiManager = self->_contactGeminiManager;
  if (!contactGeminiManager)
  {
    v5 = (CNGeminiManager *)objc_msgSend(objc_alloc((Class)CNGeminiManager), "initWithCallProviderManager:", self->_callProviderManager);
    v6 = self->_contactGeminiManager;
    self->_contactGeminiManager = v5;

    contactGeminiManager = self->_contactGeminiManager;
  }
  v7 = contactGeminiManager;
  os_unfair_lock_unlock(p_accessorLock);
  return v7;
}

- (void)setContactGeminiManager:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  CNGeminiManager **p_contactGeminiManager;
  CNGeminiManager *contactGeminiManager;
  CNGeminiManager *v8;

  v8 = (CNGeminiManager *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  contactGeminiManager = self->_contactGeminiManager;
  p_contactGeminiManager = &self->_contactGeminiManager;
  if (contactGeminiManager != v8)
    objc_storeStrong((id *)p_contactGeminiManager, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (VMVoicemailManager)accountManager
{
  return self->_accountManager;
}

- (MPVoicemailManagerProtocol)voicemailManager
{
  return self->_voicemailManager;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_contactGeminiManager, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

@end
