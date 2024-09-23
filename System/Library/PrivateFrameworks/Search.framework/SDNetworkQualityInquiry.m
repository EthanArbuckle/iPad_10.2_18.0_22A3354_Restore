@implementation SDNetworkQualityInquiry

+ (SDNetworkQualityInquiry)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  return (SDNetworkQualityInquiry *)(id)sharedInstance_sharedSelf;
}

void __41__SDNetworkQualityInquiry_sharedInstance__block_invoke()
{
  SDNetworkQualityInquiry *v0;
  void *v1;
  NSObject *v2;

  v0 = objc_alloc_init(SDNetworkQualityInquiry);
  v1 = (void *)sharedInstance_sharedSelf;
  sharedInstance_sharedSelf = (uint64_t)v0;

  if (!sharedInstance_sharedSelf)
  {
    SPLogForSPLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __41__SDNetworkQualityInquiry_sharedInstance__block_invoke_cold_1(v2);

  }
}

- (SDNetworkQualityInquiry)init
{
  SDNetworkQualityInquiry *v2;
  NWNetworkOfInterestManager *v3;
  NWNetworkOfInterestManager *manager;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  NSMutableSet *v7;
  NSMutableSet *knownNetworks;
  SDNetworkQualityInquiry *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SDNetworkQualityInquiry;
  v2 = -[SDNetworkQualityInquiry init](&v11, sel_init);
  if (v2)
  {
    v3 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x24BEB3620]);
    manager = v2->_manager;
    v2->_manager = v3;

    if (!v2->_manager)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v5 = dispatch_queue_create("com.apple.searchd.networkqualityinquiry", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[NWNetworkOfInterestManager setQueue:](v2->_manager, "setQueue:", v2->_queue);
    -[NWNetworkOfInterestManager setDelegate:](v2->_manager, "setDelegate:", v2);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    knownNetworks = v2->_knownNetworks;
    v2->_knownNetworks = v7;

    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v2->_manager, "trackNOIAnyForInterfaceType:options:", 2, 0);
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v2->_manager, "trackNOIAnyForInterfaceType:options:", 1, 0);
    -[NWNetworkOfInterestManager trackNOIAnyForInterfaceType:options:](v2->_manager, "trackNOIAnyForInterfaceType:options:", 3, 0);
  }
  v9 = v2;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NWNetworkOfInterestManager setDelegate:](self->_manager, "setDelegate:", 0);
  -[NWNetworkOfInterestManager destroy](self->_manager, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkQualityInquiry;
  -[SDNetworkQualityInquiry dealloc](&v3, sel_dealloc);
}

- (BOOL)areKnownNetworksReady
{
  NSObject *v3;
  void *v4;

  -[SDNetworkQualityInquiry queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SDNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "count") == 3;

  return (char)v3;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SDNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SDNetworkQualityInquiry knownNetworks](self, "knownNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[SDNetworkQualityInquiry manager](self, "manager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "interface");

  objc_msgSend(v7, "trackNOIAnyForInterfaceType:options:", v6, 0);
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SDNetworkQualityInquiry didStopTrackingNOI:](self, "didStopTrackingNOI:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)getNetworkQuality
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
  v9 = 3;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SDNetworkQualityInquiry_getNetworkQuality__block_invoke;
  v5[3] = &unk_24CF64588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__SDNetworkQualityInquiry_getNetworkQuality__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "areKnownNetworksReady"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "knownNetworks", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v7, "linkQuality") == 100)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          }
          else
          {
            objc_msgSend(v7, "linkQuality");
            if (objc_msgSend(v7, "linkQuality") == 20)
            {
              v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              if (!*(_QWORD *)(v8 + 24))
                *(_QWORD *)(v8 + 24) = 2;
            }
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __41__SDNetworkQualityInquiry_sharedInstance__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213202000, log, OS_LOG_TYPE_ERROR, "The network quality inquiry couldnt be initialized", v1, 2u);
}

@end
