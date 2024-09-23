@implementation PXUserDefaultsStandardDataSource

void __57__PXUserDefaultsStandardDataSource_persistedValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)persistedValueForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__252519;
  v16 = __Block_byref_object_dispose__252520;
  v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PXUserDefaultsStandardDataSource_persistedValueForKey___block_invoke;
  v9[3] = &unk_1E5148AA8;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (PXUserDefaultsStandardDataSource)sharedInstance
{
  if (sharedInstance_onceToken_252532 != -1)
    dispatch_once(&sharedInstance_onceToken_252532, &__block_literal_global_194_252533);
  return (PXUserDefaultsStandardDataSource *)(id)sharedInstance_sharedInstance_252534;
}

void __50__PXUserDefaultsStandardDataSource_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PXUserDefaultsStandardDataSource _initAsSharedInstance]([PXUserDefaultsStandardDataSource alloc], "_initAsSharedInstance");
  v1 = (void *)sharedInstance_sharedInstance_252534;
  sharedInstance_sharedInstance_252534 = (uint64_t)v0;

}

- (id)_initAsSharedInstance
{
  PXUserDefaultsStandardDataSource *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXUserDefaultsStandardDataSource;
  v2 = -[PXUserDefaultsStandardDataSource init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.userdefaults-datasource-queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (PXUserDefaultsStandardDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUserDefaults.m"), 338, CFSTR("%s is not available as initializer"), "-[PXUserDefaultsStandardDataSource init]");

  abort();
}

- (NSDate)currentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)setPersistedValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PXUserDefaultsStandardDataSource_setPersistedValue_forKey___block_invoke;
  v11[3] = &unk_1E5148D08;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__PXUserDefaultsStandardDataSource_setPersistedValue_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
