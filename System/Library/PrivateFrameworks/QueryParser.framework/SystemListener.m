@implementation SystemListener

- (SystemListener)init
{
  SystemListener *v2;
  const __CFArray *v3;
  CFLocaleRef v4;
  const __CFLocale *v5;
  NSArray *locked_supportedSemanticLanguages;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *locked_currentResources;
  _QWORD block[4];
  const __CFLocale *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SystemListener;
  v2 = -[SystemListener init](&v14, sel_init);
  if (v2)
  {
    v3 = copyCurrentPreferredLanguages();
    v4 = copyCurrentLocale();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __22__SystemListener_init__block_invoke;
    block[3] = &unk_24DA24858;
    v5 = v4;
    v13 = v5;
    if (-[SystemListener init]::onceToken != -1)
      dispatch_once(&-[SystemListener init]::onceToken, block);
    *(_WORD *)&v2->_autoUpdatingLocale = 0;
    *(_WORD *)&v2->_locked_hasUpdatedLocale = 0;
    v2->_locked_semanticSearchEnabled = 0;
    locked_supportedSemanticLanguages = v2->_locked_supportedSemanticLanguages;
    v2->_locked_supportedSemanticLanguages = (NSArray *)MEMORY[0x24BDBD1A8];

    v7 = dispatch_queue_create("com.apple.QueryParser.AssetManager.locale", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    locked_currentResources = v2->_locked_currentResources;
    v2->_locked_currentResources = v9;

    -[SystemListener updateLocaleWithLocale:preferredLanguages:force:](v2, "updateLocaleWithLocale:preferredLanguages:force:", v5, v3, 1);
  }
  return v2;
}

void __22__SystemListener_init__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllParametersForClient:locale:options:", CFSTR("Parser"), *(_QWORD *)(a1 + 32), &unk_24DA34AF0);

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
  v5[2] = __34__SystemListener_hasUpdatedLocale__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SystemListener_hasUpdatedLocale__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (BOOL)hasUpdatedFirstWeekDay
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
  v5[2] = __40__SystemListener_hasUpdatedFirstWeekDay__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__SystemListener_hasUpdatedFirstWeekDay__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

- (BOOL)hasUpdatedResources
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD block[4];
  id v8;
  SystemListener *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[SystemListener currentLocale](self, "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SystemListener_hasUpdatedResources__block_invoke;
  block[3] = &unk_24DA248A8;
  v8 = v3;
  v9 = self;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __37__SystemListener_hasUpdatedResources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  localeKeyForLocale(*(NSLocale **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKeyedSubscript:", v2);
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

- (id)currentLocale
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SystemListener_currentLocale__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__SystemListener_currentLocale__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__SystemListener_currentRegion__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__SystemListener_currentRegion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
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
  v5[2] = __37__SystemListener_currentFirstWeekDay__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SystemListener_currentFirstWeekDay__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (id)currentPreferredLanguages
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SystemListener_currentPreferredLanguages__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__SystemListener_currentPreferredLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)supportedSemanticLanguages
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SystemListener_supportedSemanticLanguages__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SystemListener_supportedSemanticLanguages__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
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
  v5[2] = __39__SystemListener_semanticSearchEnabled__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SystemListener_semanticSearchEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
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
  SystemListener *v18;
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
    -[SystemListener currentLocale](self, "currentLocale");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __45__SystemListener_pathsForContentType_locale___block_invoke;
  v16[3] = &unk_24DA248D0;
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

void __45__SystemListener_pathsForContentType_locale___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  localeKeyForLocale(*(NSLocale **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v2 = v8;
    if (v3)
    {
      objc_msgSend(v3, "filePathArrayForKey:", *(_QWORD *)(a1 + 48));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v2 = v8;
    }
  }

}

- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *queue;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  id v20;
  _QWORD v21[5];
  _QWORD block[4];
  id v23;
  id v24;
  SystemListener *v25;

  v5 = a5;
  v20 = a3;
  v8 = a4;
  if (!v20)
    goto LABEL_13;
  v9 = -[SystemListener force](self, "force");
  v10 = -[SystemListener force](self, "force");
  if (v9 || v5)
  {
    v11 = 1;
  }
  else
  {
    -[SystemListener currentLocale](self, "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v20, "localeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isEqualToString:", v14) ^ 1;

    }
    else
    {
      v11 = 1;
    }

  }
  if (v10 || v5)
  {
    v15 = 1;
    if (!v11)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SystemListener currentFirstWeekDay](self, "currentFirstWeekDay");
    v15 = !v19 || v18 && v19 != objc_msgSend(v18, "firstWeekday");

    if (!v11)
      goto LABEL_11;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke;
  block[3] = &unk_24DA248F8;
  v23 = v20;
  v24 = v8;
  v25 = self;
  dispatch_sync(queue, block);

LABEL_11:
  if (v15)
  {
    v17 = self->_queue;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke_26;
    v21[3] = &unk_24DA24858;
    v21[4] = self;
    dispatch_sync(v17, v21);
  }
LABEL_13:

}

void __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (listenerLogger(void)::token != -1)
    dispatch_once(&listenerLogger(void)::token, &__block_literal_global_79);
  v2 = (id)listenerLogger(void)::log;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1[4], "localeIdentifier");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "UTF8String");
    v5 = a1[5];
    *(_DWORD *)buf = 136315394;
    v45 = v4;
    v46 = 2112;
    v47 = v5;
    _os_log_impl(&dword_218E10000, v2, OS_LOG_TYPE_INFO, "QueryParserListener: updating locale %s preferred languages %@", buf, 0x16u);

  }
  *((_BYTE *)a1[6] + 8) = 1;
  v6 = objc_msgSend(a1[4], "copy");
  v7 = (void *)*((_QWORD *)a1[6] + 2);
  *((_QWORD *)a1[6] + 2) = v6;

  objc_msgSend(a1[4], "regionCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = a1[6];
  v11 = (void *)v10[3];
  v10[3] = v9;

  v12 = objc_msgSend(a1[5], "copy");
  v13 = (void *)*((_QWORD *)a1[6] + 5);
  *((_QWORD *)a1[6] + 5) = v12;

  localeKeyForLocale((NSLocale *)a1[4]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35
    || (objc_msgSend(*((id *)a1[6] + 8), "objectForKeyedSubscript:"),
        (v36 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v36 = 0;
LABEL_10:
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager", v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a1[6];
    v16 = v15[2];
    v42[0] = CFSTR("SRResourcesOwner");
    v42[1] = CFSTR("forceLoad");
    v43[0] = CFSTR("QueryParser");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "force"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resourcesForClient:locale:options:", CFSTR("Parser"), v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*((id *)a1[6] + 8), "setObject:forKey:", v19, v35);
    v36 = (void *)v19;
    if (!v19)
      goto LABEL_33;
    goto LABEL_11;
  }
  if (objc_msgSend(a1[6], "force"))
    goto LABEL_10;
LABEL_11:
  objc_msgSend(v36, "filePathArrayForKey:", CFSTR("Embedding"), v35);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("defaults.plist"));

        if (v26)
        {
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "valueForKey:", CFSTR("SupportedLanguages"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = objc_alloc(MEMORY[0x24BDBCE30]);
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("SupportedLanguages"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v29, "initWithArray:", v25);
          }
          else
          {
            v30 = (void *)MEMORY[0x24BDBD1A8];
          }
          objc_storeStrong((id *)a1[6] + 7, v30);
          if (v28)
          {

          }
          objc_msgSend(v27, "valueForKey:", CFSTR("Defaults"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("EnableSemanticSearch"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
            {
              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("EnableSemanticSearch"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *((_BYTE *)a1[6] + 48) = objc_msgSend(v34, "BOOLValue");

            }
            else
            {
              *((_BYTE *)a1[6] + 48) = 0;
            }

          }
          else
          {
            *((_BYTE *)a1[6] + 48) = 0;
          }

          goto LABEL_32;
        }

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_32:

LABEL_33:
}

void __66__SystemListener_updateLocaleWithLocale_preferredLanguages_force___block_invoke_26(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (listenerLogger(void)::token != -1)
    dispatch_once(&listenerLogger(void)::token, &__block_literal_global_79);
  v3 = (id)listenerLogger(void)::log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = objc_msgSend(v2, "firstWeekday");
    _os_log_impl(&dword_218E10000, v3, OS_LOG_TYPE_INFO, "QueryParserListener: updating first week day %lu", (uint8_t *)&v4, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v2, "firstWeekday");

}

- (void)updateResources
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SystemListener_updateResources__block_invoke;
  block[3] = &unk_24DA24858;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __33__SystemListener_updateResources__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  NSLocale *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x24BDAC8D0];
  if (listenerLogger(void)::token != -1)
    dispatch_once(&listenerLogger(void)::token, &__block_literal_global_79);
  v2 = listenerLogger(void)::log;
  if (os_log_type_enabled((os_log_t)listenerLogger(void)::log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218E10000, v2, OS_LOG_TYPE_INFO, "QueryParserListener: updating resources", buf, 2u);
  }
  v25 = (NSLocale *)*(id *)(*(_QWORD *)(a1 + 32) + 16);
  localeKeyForLocale(v25);
  v3 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v3;
  if (!v3
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v3),
        (v27 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v27 = 0;
LABEL_10:
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[2];
    v34[0] = CFSTR("SRResourcesOwner");
    v34[1] = CFSTR("forceLoad");
    v35[0] = CFSTR("QueryParser");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "force"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourcesForClient:locale:options:", CFSTR("Parser"), v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v9, v3);
    v27 = (void *)v9;
    if (!v9)
      goto LABEL_33;
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "force"))
    goto LABEL_10;
LABEL_11:
  objc_msgSend(v27, "filePathArrayForKey:", CFSTR("Embedding"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
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
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v20);
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
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = objc_msgSend(v24, "BOOLValue");

            }
            else
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
            }

          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
          }

          goto LABEL_32;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_32:

LABEL_33:
}

- (void)updateLocale
{
  CFLocaleRef v3;
  const __CFArray *v4;

  v4 = copyCurrentPreferredLanguages();
  v3 = copyCurrentLocale();
  -[SystemListener updateLocaleWithLocale:preferredLanguages:force:](self, "updateLocaleWithLocale:preferredLanguages:force:", v3, v4, 0);

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
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_2);
  v4.receiver = self;
  v4.super_class = (Class)SystemListener;
  -[SystemListener dealloc](&v4, sel_dealloc);
}

+ (id)defaultListener
{
  if (+[SystemListener defaultListener]::defaultOnceToken != -1)
    dispatch_once(&+[SystemListener defaultListener]::defaultOnceToken, &__block_literal_global_29);
  return (id)+[SystemListener defaultListener]::__DefaultListener;
}

void __33__SystemListener_defaultListener__block_invoke()
{
  SystemListener *v0;
  void *v1;

  v0 = objc_alloc_init(SystemListener);
  v1 = (void *)+[SystemListener defaultListener]::__DefaultListener;
  +[SystemListener defaultListener]::__DefaultListener = (uint64_t)v0;

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
  objc_storeStrong((id *)&self->_locked_supportedSemanticLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentRegion, 0);
  objc_storeStrong((id *)&self->_locked_currentLocale, 0);
}

@end
