@implementation WLKAppInstaller

+ (id)defaultAppInstaller
{
  if (defaultAppInstaller___once != -1)
    dispatch_once(&defaultAppInstaller___once, &__block_literal_global_33);
  return (id)defaultAppInstaller___defaultAppInstaller;
}

void __38__WLKAppInstaller_defaultAppInstaller__block_invoke()
{
  WLKAppInstaller *v0;
  void *v1;

  v0 = objc_alloc_init(WLKAppInstaller);
  v1 = (void *)defaultAppInstaller___defaultAppInstaller;
  defaultAppInstaller___defaultAppInstaller = (uint64_t)v0;

}

- (WLKAppInstaller)init
{
  WLKAppInstaller *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *installQueue;
  NSMutableSet *v5;
  NSMutableSet *installSessions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLKAppInstaller;
  v2 = -[WLKAppInstaller init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WatchListKit.WLKAppInstaller", 0);
    installQueue = v2->_installQueue;
    v2->_installQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    installSessions = v2->_installSessions;
    v2->_installSessions = v5;

  }
  return v2;
}

- (void)installAppForInstallable:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  -[WLKAppInstaller installAppForInstallable:sceneIdentifier:offer:progressHandler:completion:](self, "installAppForInstallable:sceneIdentifier:offer:progressHandler:completion:", a3, 0, 0, a4, a5);
}

- (void)installAppForInstallable:(id)a3 sceneIdentifier:(id)a4 progressHandler:(id)a5 completion:(id)a6
{
  -[WLKAppInstaller installAppForInstallable:sceneIdentifier:offer:progressHandler:completion:](self, "installAppForInstallable:sceneIdentifier:offer:progressHandler:completion:", a3, a4, 0, a5, a6);
}

- (void)installAppForInstallable:(id)a3 sceneIdentifier:(id)a4 offer:(id)a5 progressHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *installQueue;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  WLKAppInstaller *v22;
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    installQueue = self->_installQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke;
    v18[3] = &unk_1E68A8EE8;
    v19 = v12;
    v20 = v14;
    v21 = v13;
    v22 = self;
    v23 = v15;
    v24 = v16;
    dispatch_async(installQueue, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("installable must be non-nil"));
  }

}

void __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke(uint64_t a1)
{
  _WLKAppInstallSession *v2;
  uint64_t v3;
  uint64_t v4;
  _WLKAppInstallSession *v5;
  _QWORD v6[4];
  _WLKAppInstallSession *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  _WLKAppInstallSession *v11;
  id v12;

  v2 = -[_WLKAppInstallSession initWithInstallable:offer:sceneIdentifier:]([_WLKAppInstallSession alloc], "initWithInstallable:offer:sceneIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "addObject:", v2);
  NSLog(CFSTR("[WLKAppInstaller] Beginning installation for session: %@"), v2);
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_2;
  v10[3] = &unk_1E68A8E98;
  v11 = v2;
  v12 = *(id *)(a1 + 64);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_4;
  v6[3] = &unk_1E68A8EC0;
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v11;
  v8 = v4;
  v9 = *(id *)(a1 + 72);
  v5 = v11;
  -[_WLKAppInstallSession beginInstallationWithProgressHandler:completion:](v5, "beginInstallationWithProgressHandler:completion:", v10, v6);

}

void __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_2(uint64_t a1, double a2)
{
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  double v8;

  NSLog(CFSTR("[WLKAppInstaller] Install progress is %f for session: %@"), *(_QWORD *)&a2, *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_3;
    block[3] = &unk_1E68A8A70;
    v7 = v4;
    v8 = a2;
    dispatch_async(v5, block);

  }
}

uint64_t __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

void __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  NSLog(CFSTR("[WLKAppInstaller] Installation completed for session: %@"), a1[4]);
  objc_msgSend(*(id *)(a1[5] + 16), "removeObject:", a1[4]);
  v4 = (void *)a1[6];
  if (v4)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_5;
    block[3] = &unk_1E68A8930;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __93__WLKAppInstaller_installAppForInstallable_sceneIdentifier_offer_progressHandler_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installSessions, 0);
  objc_storeStrong((id *)&self->_installQueue, 0);
}

@end
