@implementation WBSLocalAssetController

- (WBSLocalAssetController)initWithURL:(id)a3
{
  id v5;
  WBSLocalAssetController *v6;
  WBSLocalAssetController *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  WBSLocalAssetController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSLocalAssetController;
  v6 = -[WBSLocalAssetController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = dispatch_queue_create("com.apple.SafariSharedUI.WBSLocalAssetController", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

- (WBSMobileAssetControllerDelegate)delegate
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__WBSLocalAssetController_delegate__block_invoke;
  v5[3] = &unk_1E5444748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSMobileAssetControllerDelegate *)v3;
}

void __35__WBSLocalAssetController_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
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
  v7[2] = __39__WBSLocalAssetController_setDelegate___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __39__WBSLocalAssetController_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    v4 = *(void **)(a1 + 40);
    if (v4)
      objc_msgSend(v4, "mobileAssetController:didBecomeAvailable:withAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
  }
}

- (NSDate)lastUpdateDate
{
  return 0;
}

- (double)updateInterval
{
  return 0.0;
}

- (void)queryURL:(id)a3
{
  (*((void (**)(id, NSURL *, _QWORD))a3 + 2))(a3, self->_url, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
