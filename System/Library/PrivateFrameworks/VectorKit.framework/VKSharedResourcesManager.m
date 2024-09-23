@implementation VKSharedResourcesManager

+ (id)sharedResourcesCreateIfNil:(BOOL)a3 addResourceUser:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  +[VKSharedResourcesManager sharedManager](VKSharedResourcesManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourcesCreateIfNil:addResourceUser:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sharedResources
{
  void *v2;
  void *v3;

  +[VKSharedResourcesManager sharedManager](VKSharedResourcesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcesCreateIfNil:addResourceUser:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resourcesCreateIfNil:(BOOL)a3 addResourceUser:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  std::mutex *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;

  v4 = a4;
  v5 = a3;
  v7 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v8 = (void *)*((_QWORD *)self + 9);
  if (v8)
    v9 = 1;
  else
    v9 = !v5;
  if (!v9)
  {
    v10 = operator new();
    md::Device::Device(v10);
    v11 = -[VKSharedResources _initWithDevice:standardLibrary:]([VKSharedResources alloc], "_initWithDevice:standardLibrary:", v10, *(_QWORD *)(v10 + 24) + 16);
    v12 = (void *)*((_QWORD *)self + 9);
    *((_QWORD *)self + 9) = v11;

    v8 = (void *)*((_QWORD *)self + 9);
  }
  if (v8)
    v13 = !v4;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(v8, "_addResourceUser");
    v8 = (void *)*((_QWORD *)self + 9);
  }
  v14 = v8;
  std::mutex::unlock(v7);
  return v14;
}

+ (id)sharedManager
{
  if (+[VKSharedResourcesManager sharedManager]::_once != -1)
    dispatch_once(&+[VKSharedResourcesManager sharedManager]::_once, &__block_literal_global_82);
  return (id)+[VKSharedResourcesManager sharedManager]::singleton;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

void __41__VKSharedResourcesManager_sharedManager__block_invoke()
{
  VKSharedResourcesManager *v0;
  void *v1;

  if (!+[VKSharedResourcesManager sharedManager]::singleton)
  {
    v0 = objc_alloc_init(VKSharedResourcesManager);
    v1 = (void *)+[VKSharedResourcesManager sharedManager]::singleton;
    +[VKSharedResourcesManager sharedManager]::singleton = (uint64_t)v0;

  }
}

- (VKSharedResourcesManager)init
{
  VKSharedResourcesManager *v2;
  VKSharedResourcesManager *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKSharedResourcesManager;
  v2 = -[VKSharedResourcesManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = 0;

  }
  return v3;
}

- (BOOL)hasResources
{
  VKSharedResourcesManager *v2;
  std::mutex *v3;

  v2 = self;
  v3 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  LOBYTE(v2) = *((_QWORD *)v2 + 9) != 0;
  std::mutex::unlock(v3);
  return (char)v2;
}

- (void)_removeResourceUser
{
  std::mutex *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v4 = (void *)*((_QWORD *)self + 9);
  if (v4)
  {
    objc_msgSend(v4, "_removeResourceUser");
    if ((objc_msgSend(*((id *)self + 9), "_hasResourceUsers") & 1) == 0)
    {
      v5 = (void *)*((_QWORD *)self + 9);
      *((_QWORD *)self + 9) = 0;

      objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearAllCaches");

    }
  }
  std::mutex::unlock(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

+ (void)removeResourceUser
{
  id v2;

  +[VKSharedResourcesManager sharedManager](VKSharedResourcesManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeResourceUser");

}

@end
