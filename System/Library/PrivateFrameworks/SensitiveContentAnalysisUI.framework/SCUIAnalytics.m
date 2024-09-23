@implementation SCUIAnalytics

- (SCUIAnalytics)init
{
  SCUIAnalytics *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BMStream *biomeSCUIStream;
  uint64_t v7;
  BMSource *biomeSCUISource;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *clientBundleID;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SCUIAnalytics;
  v2 = -[SCUIAnalytics init](&v16, sel_init);
  if (v2)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SensitiveContentAnalysis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UIInteraction");
    v5 = objc_claimAutoreleasedReturnValue();
    biomeSCUIStream = v2->_biomeSCUIStream;
    v2->_biomeSCUIStream = (BMStream *)v5;

    -[BMStream source](v2->_biomeSCUIStream, "source");
    v7 = objc_claimAutoreleasedReturnValue();
    biomeSCUISource = v2->_biomeSCUISource;
    v2->_biomeSCUISource = (BMSource *)v7;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    clientBundleID = v2->_clientBundleID;
    v2->_clientBundleID = (NSString *)v11;

    v2->_ageGroup = -[SCUIAnalytics biomeAgeGroup](v2, "biomeAgeGroup");
    v13 = dispatch_queue_create("com.apple.SensitiveContentAnalysis.SCUIAnalytics", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1)
    dispatch_once(&sharedInstance_creation, &__block_literal_global_0);
  return (id)sharedInstance_sInstance;
}

void __31__SCUIAnalytics_sharedInstance__block_invoke()
{
  SCUIAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(SCUIAnalytics);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (void)collectUIInteractionEvent:(int)a3 :(int)a4 :(int)a5 :(int)a6 :(int)a7
{
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;

  -[SCUIAnalytics clientBundleID](self, "clientBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SCUIAnalytics ageGroup](self, "ageGroup");
  -[SCUIAnalytics biomeSCUISource](self, "biomeSCUISource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCUIAnalytics queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke;
  block[3] = &unk_2516EC848;
  v22 = a3;
  v23 = v14;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v20 = v13;
  v21 = v15;
  v17 = v15;
  v18 = v13;
  dispatch_async(v16, block);

}

void __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;

  if ((SCIsAnalyticsEnabled() & 1) != 0)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE0C618]), "initWithInteractionType:ageGroup:eventDirection:screen:action:contentType:clientBundleID:trackingVersion:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 32), CFSTR("1"));
    objc_msgSend(*(id *)(a1 + 40), "sendEvent:", v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE96D0], "clientUI");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke_cold_1(v2);

  }
}

- (int)biomeAgeGroup
{
  void *v2;
  unint64_t v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDE96D8], "currentScanningPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "policy");

  if (v3 < 2)
    return 3;
  objc_msgSend(MEMORY[0x24BDE96D8], "currentInterventionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE63EE0]))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (BMStream)biomeSCUIStream
{
  return self->_biomeSCUIStream;
}

- (void)setBiomeSCUIStream:(id)a3
{
  objc_storeStrong((id *)&self->_biomeSCUIStream, a3);
}

- (BMSource)biomeSCUISource
{
  return self->_biomeSCUISource;
}

- (void)setBiomeSCUISource:(id)a3
{
  objc_storeStrong((id *)&self->_biomeSCUISource, a3);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (void)setAgeGroup:(int)a3
{
  self->_ageGroup = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_biomeSCUISource, 0);
  objc_storeStrong((id *)&self->_biomeSCUIStream, 0);
}

void __47__SCUIAnalytics_collectUIInteractionEvent___::__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_245CB6000, log, OS_LOG_TYPE_DEBUG, "SCAnalytics: No consent for analytics: UIInteraction", v1, 2u);
}

@end
