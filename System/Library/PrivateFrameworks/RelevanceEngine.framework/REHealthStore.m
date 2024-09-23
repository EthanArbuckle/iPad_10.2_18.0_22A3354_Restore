@implementation REHealthStore

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  objc_super v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8[0].receiver = self;
  v8[0].super_class = (Class)REHealthStore;
  v2 = -[objc_super _init](v8, sel__init);
  if (v2)
  {
    if (!HealthKitLibraryCore_frameworkLibrary_1)
    {
      v8[1] = (objc_super)xmmword_24CF8C4E0;
      v9 = 0;
      HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    }
    if (HealthKitLibraryCore_frameworkLibrary_1)
    {
      objc_msgSend(v2, "_createStore");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v2[1];
      v2[1] = v3;

    }
    v5 = dispatch_queue_create("com.apple.RelevanceEngine.REHealthStore", 0);
    v6 = (void *)v2[2];
    v2[2] = v5;

  }
  return v2;
}

- (id)_createStore
{
  id v2;

  if (!-[REHealthStore _isClockHostApp](self, "_isClockHostApp"))
    goto LABEL_6;
  if (!FitnessUILibraryCore_frameworkLibrary)
    FitnessUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (FitnessUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(getHKHealthStoreClass(), "fiui_sharedHealthStoreForCarousel");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v2 = objc_alloc_init((Class)getHKHealthStoreClass());
  }
  return v2;
}

- (BOOL)_isClockHostApp
{
  return 0;
}

- (void)accessHealthStore:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__REHealthStore_accessHealthStore___block_invoke;
    v7[3] = &unk_24CF8B2E0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __35__REHealthStore_accessHealthStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
