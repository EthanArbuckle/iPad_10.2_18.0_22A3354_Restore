@implementation VKIconManager

- (VKIconManager)init
{
  VKIconManager *v2;
  VKIconManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VKIconManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKIconManager;
  v2 = -[VKIconManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = 0;

    v5 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = 0;

    v6 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = 0;

    +[VKSharedResourcesManager sharedManager](VKSharedResourcesManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v3 + 24) = objc_msgSend(v7, "hasResources");
    v8 = v3;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)*((_QWORD *)self + 2);
  if (v3)
  {
    objc_msgSend(v3, "purgeNonsharedResources");
    v4 = (void *)*((_QWORD *)self + 2);
    *((_QWORD *)self + 2) = 0;

  }
  v5 = (void *)*((_QWORD *)self + 1);
  if (v5)
  {
    *((_QWORD *)self + 1) = 0;

    +[VKSharedResourcesManager removeResourceUser](VKSharedResourcesManager, "removeResourceUser");
  }
  v6 = *((_QWORD *)self + 12);
  if (v6)
  {
    dispatch_source_cancel(v6);
    v7 = (void *)*((_QWORD *)self + 12);
    *((_QWORD *)self + 12) = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)VKIconManager;
  -[VKIconManager dealloc](&v8, sel_dealloc);
}

- (id)_internalIconManager
{
  std::mutex *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  dispatch_source_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  VKInternalIconManager *v20;
  void *v21;
  _QWORD handler[4];
  id v23;
  int v24;
  id location;

  v3 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  v4 = (void *)*((_QWORD *)self + 2);
  if (v4)
    goto LABEL_2;
  v6 = (void *)*((_QWORD *)self + 1);
  if (!v6)
  {
    +[VKSharedResourcesManager sharedResourcesCreateIfNil:addResourceUser:](VKSharedResourcesManager, "sharedResourcesCreateIfNil:addResourceUser:", 0, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = v7;

    v6 = (void *)*((_QWORD *)self + 1);
    if (!v6)
    {
      v20 = objc_alloc_init(VKInternalIconManager);
      v21 = (void *)*((_QWORD *)self + 2);
      *((_QWORD *)self + 2) = v20;

      v4 = (void *)*((_QWORD *)self + 2);
LABEL_2:
      v5 = v4;
      goto LABEL_6;
    }
  }
  objc_msgSend(v6, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = v5;
  v10 = *((_QWORD *)self + 12);
  if (v10)
  {
    dispatch_source_cancel(v10);
    v11 = (void *)*((_QWORD *)self + 12);
    *((_QWORD *)self + 12) = 0;

  }
  dispatch_get_global_queue(-32768, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
  v14 = (void *)*((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = v13;

  v15 = *((_DWORD *)self + 26) + 1;
  *((_DWORD *)self + 26) = v15;
  objc_initWeak(&location, self);
  v16 = *((_QWORD *)self + 12);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __37__VKIconManager__internalIconManager__block_invoke;
  handler[3] = &unk_1E42EF630;
  objc_copyWeak(&v23, &location);
  v24 = v15;
  dispatch_source_set_event_handler(v16, handler);
  v17 = *((_QWORD *)self + 12);
  v18 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_resume(*((dispatch_object_t *)self + 12));
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  std::mutex::unlock(v3);
  return v9;
}

- (id)imageForImageSourceKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForImageSourceKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageForStyleAttributes:(id)a3 styleManager:(shared_ptr<gss:(float)a5 :(int64_t)a6 StylesheetManager<gss:(id)a7 :PropertyID>>)a4 contentScale:sizeGroup:modifiers:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;

  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  v12 = a3;
  v13 = (id)a6;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = (std::__shared_weak_count *)ptr[1];
  v25 = *ptr;
  v26 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  *(float *)&v15 = a5;
  objc_msgSend(v14, "imageForStyleAttributes:styleManager:contentScale:sizeGroup:modifiers:", v12, &v25, cntrl, v13, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;
  if (v26)
  {
    v22 = (unint64_t *)&v26->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v20;
}

- (id)imageForStyleAttributes:(id)a3 withStylesheetName:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = a5;
  objc_msgSend(v15, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v12, v13, a6, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)imageForDataID:(unsigned int)a3 text:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a7;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a5;
  objc_msgSend(v14, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v10, v12, a6, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)imageForKey:(unsigned int)a3 value:(unsigned int)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  double v14;
  void *v15;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a5;
  objc_msgSend(v13, "imageForKey:value:contentScale:sizeGroup:modifiers:", v10, v9, a6, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)imageForName:(id)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;

  v10 = a3;
  v11 = a6;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a4;
  objc_msgSend(v12, "imageForName:contentScale:sizeGroup:modifiers:", v10, a5, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)imageForIconID:(unsigned int)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  double v12;
  void *v13;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  objc_msgSend(v11, "imageForIconID:contentScale:sizeGroup:modifiers:", v8, a5, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unsigned)styleAttributeTransitTypeKey
{
  void *v2;
  unsigned int v3;

  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "styleAttributeTransitTypeKey");

  return v3;
}

- (unsigned)styleAttributeTransitSystemTypeKey
{
  void *v2;
  unsigned int v3;

  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "styleAttributeTransitSystemTypeKey");

  return v3;
}

- (unsigned)trafficIncidentTypeKey
{
  void *v2;
  unsigned int v3;

  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trafficIncidentTypeKey");

  return v3;
}

- (unsigned)darkVariant
{
  void *v2;
  unsigned int v3;

  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "darkVariant");

  return v3;
}

- (BOOL)isCachingAtlases
{
  void *v2;
  char v3;

  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCachingAtlases");

  return v3;
}

- (void)setIsCachingAtlases:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VKIconManager _internalIconManager](self, "_internalIconManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsCachingAtlases:", v3);

}

- (void)purge
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  v4 = (void *)*((_QWORD *)self + 2);
  if (v4)
    objc_msgSend(v4, "purgeNonsharedResources");
  std::mutex::unlock(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 850045863;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_QWORD *)self + 11) = 0;
  return self;
}

void __37__VKIconManager__internalIconManager__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  std::mutex *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (std::mutex *)(WeakRetained + 32);
    v9 = WeakRetained;
    std::mutex::lock((std::mutex *)(WeakRetained + 32));
    if (*((_DWORD *)v9 + 26) == *(_DWORD *)(a1 + 40))
    {
      v4 = *((_QWORD *)v9 + 12);
      if (v4)
      {
        dispatch_source_cancel(v4);
        v5 = (void *)*((_QWORD *)v9 + 12);
        *((_QWORD *)v9 + 12) = 0;

      }
      v6 = (void *)*((_QWORD *)v9 + 2);
      if (v6)
      {
        objc_msgSend(v6, "purgeNonsharedResources");
        v7 = (void *)*((_QWORD *)v9 + 2);
        *((_QWORD *)v9 + 2) = 0;

      }
      v8 = (void *)*((_QWORD *)v9 + 1);
      if (v8)
      {
        *((_QWORD *)v9 + 1) = 0;

        +[VKSharedResourcesManager removeResourceUser](VKSharedResourcesManager, "removeResourceUser");
      }
    }
    std::mutex::unlock(v3);
    WeakRetained = v9;
  }

}

+ (id)sharedManager
{
  if (+[VKIconManager sharedManager]::_once != -1)
    dispatch_once(&+[VKIconManager sharedManager]::_once, &__block_literal_global_8678);
  return (id)+[VKIconManager sharedManager]::singleton;
}

void __30__VKIconManager_sharedManager__block_invoke()
{
  VKIconManager *v0;
  void *v1;

  if (!+[VKIconManager sharedManager]::singleton)
  {
    v0 = objc_alloc_init(VKIconManager);
    v1 = (void *)+[VKIconManager sharedManager]::singleton;
    +[VKIconManager sharedManager]::singleton = (uint64_t)v0;

  }
}

@end
