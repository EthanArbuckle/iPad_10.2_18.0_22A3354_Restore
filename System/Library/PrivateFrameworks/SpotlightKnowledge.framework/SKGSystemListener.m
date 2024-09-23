@implementation SKGSystemListener

+ (id)sharedListener
{
  if (sharedListener_defaultOnceToken != -1)
    dispatch_once(&sharedListener_defaultOnceToken, &__block_literal_global_2);
  return (id)sharedListener___DefaultListener;
}

uint64_t __35__SKGSystemListener_sharedListener__block_invoke()
{
  SKGSystemListener *v0;
  const __CFArray *v1;
  CFLocaleRef v2;
  uint64_t v3;
  void *v4;

  v0 = [SKGSystemListener alloc];
  v1 = copyCurrentPreferredLanguages();
  v2 = copyCurrentLocale();
  v3 = -[SKGSystemListener initWithPreferredLanguages:locale:](v0, "initWithPreferredLanguages:locale:", v1, v2);
  v4 = (void *)sharedListener___DefaultListener;
  sharedListener___DefaultListener = v3;

  return objc_msgSend((id)sharedListener___DefaultListener, "setAutoUpdatingLocale:", 1);
}

- (SKGSystemListener)init
{
  const __CFArray *v3;
  CFLocaleRef v4;
  SKGSystemListener *v5;
  const __CFLocale *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *locked_currentResources;
  NSArray *locked_supportedSemanticLanguages;
  NSArray *v12;
  NSArray *locked_doNotUpdateList;
  _QWORD block[4];
  const __CFLocale *v16;
  objc_super v17;

  v3 = copyCurrentPreferredLanguages();
  v4 = copyCurrentLocale();
  v17.receiver = self;
  v17.super_class = (Class)SKGSystemListener;
  v5 = -[SKGSystemListener init](&v17, sel_init);
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__SKGSystemListener_init__block_invoke;
    block[3] = &unk_2518FF8B0;
    v6 = v4;
    v16 = v6;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);
    v5->_force = 1;
    v5->_locked_hasDiskCapacity = 0;
    v5->_locked_lastDiskFlushDate = 0.0;
    v5->_autoUpdatingLocale = 0;
    v5->_locked_hasUpdatedLocale = 0;
    v7 = dispatch_queue_create("com.apple.SpotlightKnowledge.SystemListener.locale", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    locked_currentResources = v5->_locked_currentResources;
    v5->_locked_currentResources = v9;

    v5->_locked_semanticSearchEnabled = 0;
    locked_supportedSemanticLanguages = v5->_locked_supportedSemanticLanguages;
    v12 = (NSArray *)MEMORY[0x24BDBD1A8];
    v5->_locked_supportedSemanticLanguages = (NSArray *)MEMORY[0x24BDBD1A8];

    locked_doNotUpdateList = v5->_locked_doNotUpdateList;
    v5->_locked_doNotUpdateList = v12;

    -[SKGSystemListener updateLocaleWithLocale:preferredLanguages:force:](v5, "updateLocaleWithLocale:preferredLanguages:force:", v6, v3, 1);
    -[SKGSystemListener hasDiskCapacity](v5, "hasDiskCapacity");

  }
  return v5;
}

void __25__SKGSystemListener_init__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllParametersForClient:locale:options:", CFSTR("SpotlightKnowledge"), *(_QWORD *)(a1 + 32), &unk_251904EA0);

}

- (SKGSystemListener)initWithPreferredLanguages:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  SKGSystemListener *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v12;
  NSMutableDictionary *locked_currentResources;
  NSArray *locked_supportedSemanticLanguages;
  NSArray *v15;
  NSArray *locked_doNotUpdateList;
  _QWORD block[4];
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SKGSystemListener;
  v8 = -[SKGSystemListener init](&v20, sel_init);
  if (v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SKGSystemListener_initWithPreferredLanguages_locale___block_invoke;
    block[3] = &unk_2518FF8B0;
    v9 = v7;
    v19 = v9;
    if (initWithPreferredLanguages_locale__onceToken != -1)
      dispatch_once(&initWithPreferredLanguages_locale__onceToken, block);
    v8->_force = 0;
    v8->_locked_hasDiskCapacity = 0;
    v8->_locked_lastDiskFlushDate = 0.0;
    v8->_autoUpdatingLocale = 0;
    v8->_locked_hasUpdatedLocale = 0;
    v10 = dispatch_queue_create("com.apple.SpotlightKnowledge.SystemListener.locale", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    locked_currentResources = v8->_locked_currentResources;
    v8->_locked_currentResources = v12;

    v8->_locked_semanticSearchEnabled = 0;
    locked_supportedSemanticLanguages = v8->_locked_supportedSemanticLanguages;
    v15 = (NSArray *)MEMORY[0x24BDBD1A8];
    v8->_locked_supportedSemanticLanguages = (NSArray *)MEMORY[0x24BDBD1A8];

    locked_doNotUpdateList = v8->_locked_doNotUpdateList;
    v8->_locked_doNotUpdateList = v15;

    -[SKGSystemListener updateLocaleWithLocale:preferredLanguages:force:](v8, "updateLocaleWithLocale:preferredLanguages:force:", v9, v6, 1);
    -[SKGSystemListener hasDiskCapacity](v8, "hasDiskCapacity");

  }
  return v8;
}

void __55__SKGSystemListener_initWithPreferredLanguages_locale___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllParametersForClient:locale:options:", CFSTR("SpotlightKnowledge"), *(_QWORD *)(a1 + 32), &unk_251904EC8);

}

- (void)setAutoUpdatingLocale:(BOOL)a3
{
  _BOOL4 v3;
  __CFNotificationCenter *LocalCenter;

  v3 = a3;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  if (v3)
  {
    if (!self->_autoUpdatingLocale)
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)localeChangeCallback, (CFStringRef)*MEMORY[0x24BDBD3F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  else if (self->_autoUpdatingLocale)
  {
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x24BDBD3F0], 0);
  }
  self->_autoUpdatingLocale = v3;
}

- (BOOL)hasDiskCapacity
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_hasDiskCapacity__block_invoke;
  v5[3] = &unk_2518FF968;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__SKGSystemListener_hasDiskCapacity__block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  id v17;
  void *v18;

  if (*(double *)(*(_QWORD *)(a1 + 32) + 16) == 0.0
    || (Current = CFAbsoluteTimeGetCurrent(), v3 = *(_QWORD *)(a1 + 32), Current - *(double *)(v3 + 16) > 3600.0))
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    v5 = (void *)MEMORY[0x24BDD17C8];
    NSHomeDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if (v11)
    {
      v18 = 0;
      v12 = *MEMORY[0x24BDBCDB8];
      v17 = 0;
      objc_msgSend(v8, "getResourceValue:forKey:error:", &v18, v12, &v17);
      v13 = v18;
      v14 = v17;
      if (!v14)
      {
        v15 = v13;
        objc_msgSend(v15, "doubleValue");
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v16 * 0.05 > 40000000.0;

      }
    }
    else
    {
      v14 = 0;
    }
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 16) = CFAbsoluteTimeGetCurrent();

    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v3 + 8);
}

- (BOOL)isCJK
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __26__SKGSystemListener_isCJK__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__SKGSystemListener_isCJK__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

- (BOOL)hasUpdatedLocale
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SKGSystemListener_hasUpdatedLocale__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SKGSystemListener_hasUpdatedLocale__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

- (BOOL)hasUpdatedResources
{
  void *v3;
  NSObject *queue;
  id v5;
  BOOL v6;
  _QWORD block[4];
  id v9;
  SKGSystemListener *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[SKGSystemListener currentLocale](self, "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SKGSystemListener_hasUpdatedResources__block_invoke;
  block[3] = &unk_2518FF9B8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v13 + 24))
  {
    -[SKGSystemListener updateResources](self, "updateResources");
    v6 = *((_BYTE *)v13 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __40__SKGSystemListener_hasUpdatedResources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  localeKeyForLocale(*(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "hasUpdates"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v4 = 0;
  }

}

- (id)rootLocale
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("root"));
}

- (NSLocale)currentLocale
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SKGSystemListener_currentLocale__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSLocale *)v3;
}

void __34__SKGSystemListener_currentLocale__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)currentLanguage
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_currentLanguage__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__SKGSystemListener_currentLanguage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)currentRegion
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SKGSystemListener_currentRegion__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SKGSystemListener_currentRegion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)currentFirstWeekDay
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SKGSystemListener_currentFirstWeekDay__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__SKGSystemListener_currentFirstWeekDay__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (NSArray)currentPreferredLocales
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SKGSystemListener_currentPreferredLocales__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __44__SKGSystemListener_currentPreferredLocales__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)currentPreferredLocaleIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__SKGSystemListener_currentPreferredLocaleIdentifiers__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __54__SKGSystemListener_currentPreferredLocaleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)currentPreferredLanguages
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SKGSystemListener_currentPreferredLanguages__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__SKGSystemListener_currentPreferredLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)doNotUpdateList
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SKGSystemListener_doNotUpdateList__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __36__SKGSystemListener_doNotUpdateList__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)supportedSemanticLanguages
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SKGSystemListener_supportedSemanticLanguages__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __47__SKGSystemListener_supportedSemanticLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)semanticSearchEnabled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SKGSystemListener_semanticSearchEnabled__block_invoke;
  v5[3] = &unk_2518FF990;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SKGSystemListener_semanticSearchEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (id)pathsForContentType:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SKGSystemListener *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[SKGSystemListener currentLocale](self, "currentLocale");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__SKGSystemListener_pathsForContentType_locale___block_invoke;
  v16[3] = &unk_2518FF9E0;
  v17 = v9;
  v18 = self;
  v19 = v6;
  v20 = &v21;
  v12 = v6;
  v13 = v10;
  dispatch_sync(queue, v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __48__SKGSystemListener_pathsForContentType_locale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  localeKeyForLocale(*(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "filePathArrayForKey:", *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = 0;
  v6 = 1;
LABEL_6:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
  if ((v6 & 1) == 0)

}

- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5
{
  id v8;
  const __CFArray *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  const __CFArray *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  const __CFArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  NSObject *queue;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char IsCJK;
  void *v36;
  void *v37;
  SKGSystemListener *v38;
  id v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (const __CFArray *)a4;
  if (v8)
  {
    if (-[SKGSystemListener force](self, "force"))
      goto LABEL_6;
    if (a5)
      goto LABEL_6;
    -[SKGSystemListener currentLocale](self, "currentLocale");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_6;
    v11 = (void *)v10;
    objc_msgSend(v8, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
LABEL_6:
      v38 = self;
      v15 = copyNormalizedLanguagesForIdentifiers(v9);
      v16 = objc_alloc(MEMORY[0x24BDBCEA0]);
      v39 = v8;
      objc_msgSend(v8, "localeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithLocaleIdentifier:", v17);

      v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v20 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v21 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v37 = (void *)v18;
      SILanguagesGetLanguageID();
      SILanguagesGetLanguage();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      IsCJK = languageIsCJK(v36);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v22 = v15;
      v23 = -[__CFArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (SILanguagesGetLanguageID() - 2 <= 0x38)
            {
              objc_msgSend(v21, "addObject:", SILanguagesGetLanguage());
              objc_msgSend(v19, "addObject:", v28);
              objc_msgSend(v20, "addObject:", v27);
            }

          }
          v24 = -[__CFArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v24);
      }

      queue = v38->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__SKGSystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke;
      block[3] = &unk_2518FFA08;
      v46 = IsCJK;
      block[4] = v38;
      v41 = v37;
      v42 = v36;
      v43 = v19;
      v44 = v20;
      v45 = v21;
      v30 = v21;
      v31 = v20;
      v32 = v19;
      v33 = v36;
      v34 = v37;
      dispatch_sync(queue, block);
      -[SKGSystemListener updateResources](v38, "updateResources");

      v8 = v39;
    }
  }

}

void __69__SKGSystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = *(_BYTE *)(a1 + 80);
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 40), "regionCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v9;

  objc_msgSend(*(id *)(a1 + 56), "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 64);
  *(_QWORD *)(v14 + 64) = v13;

  objc_msgSend(*(id *)(a1 + 64), "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 72);
  *(_QWORD *)(v18 + 72) = v17;

  objc_msgSend(*(id *)(a1 + 72), "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 80);
  *(_QWORD *)(v22 + 80) = v21;

  localeKeyForLocale(*(void **)(a1 + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v25 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD **)(a1 + 32);
    v29 = v28[4];
    v32[0] = CFSTR("SRResourcesOwner");
    v32[1] = CFSTR("forceLoad");
    v33[0] = CFSTR("SpotlightKnowledge");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v28, "force"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resourcesForClient:locale:options:", CFSTR("SpotlightKnowledge"), v29, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKey:", v26, v24);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_6;
  v26 = v25;
  if (objc_msgSend(*(id *)(a1 + 32), "force"))
    goto LABEL_6;
LABEL_7:

}

- (void)updateResources
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SKGSystemListener_updateResources__block_invoke;
  block[3] = &unk_2518FF8B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __36__SKGSystemListener_updateResources__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  localeKeyForLocale(v2);
  i = objc_claimAutoreleasedReturnValue();
  if (!i)
  {
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", i);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (v5 = v4, objc_msgSend(*(id *)(a1 + 32), "force")))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD **)(a1 + 32);
    v8 = v7[4];
    v49[0] = CFSTR("SRResourcesOwner");
    v49[1] = CFSTR("forceLoad");
    v50[0] = CFSTR("SpotlightKnowledge");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "force"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourcesForClient:locale:options:", CFSTR("SpotlightKnowledge"), v8, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKey:", v5, i);
    if (!v5)
      goto LABEL_43;
  }
  v36 = i;
  v37 = v2;
  objc_msgSend(v5, "filePathArrayForKey:", CFSTR("Embedding"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("defaults.plist"));

        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "valueForKey:", CFSTR("SupportedLanguages"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = objc_alloc(MEMORY[0x24BDBCE30]);
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SupportedLanguages"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v19, "initWithArray:", v15);
          }
          else
          {
            v20 = (void *)MEMORY[0x24BDBD1A8];
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v20);
          if (v18)
          {

          }
          objc_msgSend(v17, "valueForKey:", CFSTR("Defaults"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("EnableSemanticSearch"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("EnableSemanticSearch"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = objc_msgSend(v24, "BOOLValue");

            }
            else
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
            }

          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
          }

          goto LABEL_28;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_28:

  v35 = v5;
  objc_msgSend(v5, "filePathArrayForKey:", CFSTR("Processor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("doNotUpdate"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = objc_alloc(MEMORY[0x24BDBCE30]);
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("doNotUpdate"));
            i = objc_claimAutoreleasedReturnValue();
            v5 = (void *)objc_msgSend(v33, "initWithArray:", i);
            v34 = v5;
          }
          else
          {
            v34 = (void *)MEMORY[0x24BDBD1A8];
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v34);
          if (v32)
          {

          }
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v27);
  }

  i = v36;
  v2 = v37;
LABEL_43:

}

- (void)updateLocale
{
  CFLocaleRef v3;
  const __CFArray *v4;

  v4 = copyCurrentPreferredLanguages();
  v3 = copyCurrentLocale();
  -[SKGSystemListener updateLocaleWithLocale:preferredLanguages:force:](self, "updateLocaleWithLocale:preferredLanguages:force:", v3, v4, 0);

}

- (void)dealloc
{
  __CFNotificationCenter *LocalCenter;
  objc_super v4;

  if (self->_autoUpdatingLocale)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x24BDBD3F0], 0);
  }
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_48);
  v4.receiver = self;
  v4.super_class = (Class)SKGSystemListener;
  -[SKGSystemListener dealloc](&v4, sel_dealloc);
}

- (BOOL)currentLocaleIsCJK
{
  return self->_currentLocaleIsCJK;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locked_currentResources, 0);
  objc_storeStrong((id *)&self->_locked_doNotUpdateList, 0);
  objc_storeStrong((id *)&self->_locked_supportedSemanticLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLocales, 0);
  objc_storeStrong((id *)&self->_locked_currentRegion, 0);
  objc_storeStrong((id *)&self->_locked_currentLanguage, 0);
  objc_storeStrong((id *)&self->_locked_currentLocale, 0);
}

@end
