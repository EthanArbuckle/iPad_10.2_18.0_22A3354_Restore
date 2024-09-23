@implementation SBChronoApplicationProcessStateObserver

- (void)_queue_handleApplicationProcessStateDidChangeIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  CHSInteractionEventService *service;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("previousProcessState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isForeground");
  objc_msgSend(v12, "processState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isForeground");

  if (v9
    && (v7 & 1) == 0
    && -[SBChronoApplicationProcessStateObserver _shouldInformChronoForApplication:](self, "_shouldInformChronoForApplication:", v12))
  {
    service = self->_service;
    objc_msgSend(v12, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHSInteractionEventService applicationEnteredForegroundWithBundleID:](service, "applicationEnteredForegroundWithBundleID:", v11);

  }
}

uint64_t __76__SBChronoApplicationProcessStateObserver_applicationProcessStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleApplicationProcessStateDidChangeIfNecessary:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__SBChronoApplicationProcessStateObserver__shouldInformChronoForApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CHSIsWidgetExtensionPoint();

  return v4;
}

- (BOOL)_shouldInformChronoForApplication:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CHSWidgetExtensionProvider *extensionProvider;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);

  if (v7)
  {
    objc_msgSend(v7, "applicationExtensionRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_filter:", &__block_literal_global_9_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      extensionProvider = self->_extensionProvider;
      objc_msgSend(v4, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetExtensionProvider widgetExtensionContainerForContainerBundleIdentifier:](extensionProvider, "widgetExtensionContainerForContainerBundleIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      objc_msgSend(v12, "localExtensions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__SBChronoApplicationProcessStateObserver__shouldInformChronoForApplication___block_invoke_2;
      v16[3] = &unk_1E8EA7648;
      v16[4] = &v17;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

      v14 = *((_BYTE *)v18 + 24) == 0;
      _Block_object_dispose(&v17, 8);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)applicationProcessStateDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SBChronoApplicationProcessStateObserver_applicationProcessStateDidChange___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __77__SBChronoApplicationProcessStateObserver__shouldInformChronoForApplication___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "orderedDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

LABEL_4:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v9, "orderedControlDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    goto LABEL_4;
LABEL_5:

}

+ (SBChronoApplicationProcessStateObserver)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_84);
  return (SBChronoApplicationProcessStateObserver *)(id)sharedInstance___instance_0;
}

void __57__SBChronoApplicationProcessStateObserver_sharedInstance__block_invoke()
{
  SBChronoApplicationProcessStateObserver *v0;
  void *v1;

  v0 = objc_alloc_init(SBChronoApplicationProcessStateObserver);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

- (SBChronoApplicationProcessStateObserver)init
{
  SBChronoApplicationProcessStateObserver *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CHSWidgetExtensionProvider *extensionProvider;
  CHSInteractionEventService *v9;
  CHSInteractionEventService *service;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  _QWORD block[4];
  SBChronoApplicationProcessStateObserver *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBChronoApplicationProcessStateObserver;
  v2 = -[SBChronoApplicationProcessStateObserver init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D101C0]);
    objc_msgSend(MEMORY[0x1E0D10180], "visible");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0FFE8], "visible");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithWidgetsPredicate:controlsPredicate:", v4, v5);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D101B0]), "initWithOptions:", v6);
    extensionProvider = v2->_extensionProvider;
    v2->_extensionProvider = (CHSWidgetExtensionProvider *)v7;

    v9 = (CHSInteractionEventService *)objc_alloc_init(MEMORY[0x1E0D10078]);
    service = v2->_service;
    v2->_service = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.chronoservices.SBChronoApplicationProcessStateObserver", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SBChronoApplicationProcessStateObserver_init__block_invoke;
    block[3] = &unk_1E8E9DED8;
    v18 = v2;
    dispatch_async(v15, block);

  }
  return v2;
}

id __47__SBChronoApplicationProcessStateObserver_init__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
