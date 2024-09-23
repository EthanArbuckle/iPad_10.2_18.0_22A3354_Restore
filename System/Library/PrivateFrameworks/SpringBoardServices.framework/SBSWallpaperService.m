@implementation SBSWallpaperService

- (SBSWallpaperService)init
{
  SBSWallpaperService *v2;
  uint64_t Serial;
  OS_dispatch_queue *callbackQueue;
  SBSWallpaperClient *v5;
  SBSWallpaperClient *client;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSWallpaperService;
  v2 = -[SBSWallpaperService init](&v8, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)Serial;

    v5 = -[SBSWallpaperClient initWithCalloutQueue:]([SBSWallpaperClient alloc], "initWithCalloutQueue:", v2->_callbackQueue);
    client = v2->_client;
    v2->_client = v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_wasInvalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSWallpaperService.m"), 34, CFSTR("%@: you must call -invalidate before releasing"), objc_opt_class());

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSWallpaperService;
  -[SBSWallpaperService dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  -[FBSServiceFacilityClient invalidate](self->_client, "invalidate");
  self->_wasInvalidated = 1;
}

- (void)handleQuickActionConfigurationRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke;
    v10[3] = &unk_1E288D768;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient handleQuickActionConfigurationRequest:completionHandler:](client, "handleQuickActionConfigurationRequest:completionHandler:", a3, v10);

  }
}

void __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __79__SBSWallpaperService_handleQuickActionConfigurationRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchThumbnailForVariant:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke;
    v10[3] = &unk_1E288D3D0;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchThumbnailForVariant:completionHandler:](client, "fetchThumbnailForVariant:completionHandler:", a3, v10);

  }
}

void __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __66__SBSWallpaperService_fetchThumbnailForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchOriginalImageForVariant:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke;
    v10[3] = &unk_1E288D3D0;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchOriginalImageForVariant:completionHandler:](client, "fetchOriginalImageForVariant:completionHandler:", a3, v10);

  }
}

void __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __70__SBSWallpaperService_fetchOriginalImageForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchOriginalVideoURLForVariant:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke;
    v10[3] = &unk_1E288E2B0;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchOriginalVideoURLForVariant:completionHandler:](client, "fetchOriginalVideoURLForVariant:completionHandler:", a3, v10);

  }
}

void __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __73__SBSWallpaperService_fetchOriginalVideoURLForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchContentCutoutBoundsForVariant:(int64_t)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v11;
  _QWORD v12[4];
  OS_dispatch_queue *v13;
  id v14;

  v8 = a5;
  if (v8)
  {
    v9 = self->_callbackQueue;
    client = self->_client;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke;
    v12[3] = &unk_1E288E300;
    v13 = v9;
    v14 = v8;
    v11 = v9;
    -[SBSWallpaperClient fetchContentCutoutBoundsForVariant:orientation:completionHandler:](client, "fetchContentCutoutBoundsForVariant:orientation:completionHandler:", a3, a4, v12);

  }
}

void __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v9;
  _QWORD block[4];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E288E2D8;
  v9 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  dispatch_async(v9, block);

}

uint64_t __88__SBSWallpaperService_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchLockScreenContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E288E300;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchLockScreenContentCutoutBoundsForOrientation:completionHandler:](client, "fetchLockScreenContentCutoutBoundsForOrientation:completionHandler:", a3, v10);

  }
}

void __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v9;
  _QWORD block[4];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E288E2D8;
  v9 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  dispatch_async(v9, block);

}

uint64_t __90__SBSWallpaperService_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchMaximalLockScreenContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E288E300;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchMaximalLockScreenContentCutoutBoundsForOrientation:completionHandler:](client, "fetchMaximalLockScreenContentCutoutBoundsForOrientation:completionHandler:", a3, v10);

  }
}

void __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v9;
  _QWORD block[4];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E288E2D8;
  v9 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  dispatch_async(v9, block);

}

uint64_t __97__SBSWallpaperService_fetchMaximalLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchObscurableBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E288E300;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchObscurableBoundsForOrientation:completionHandler:](client, "fetchObscurableBoundsForOrientation:completionHandler:", a3, v10);

  }
}

void __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v9;
  _QWORD block[4];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E288E2D8;
  v9 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  dispatch_async(v9, block);

}

uint64_t __77__SBSWallpaperService_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchLimitedOcclusionBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E288E300;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchLimitedOcclusionBoundsForOrientation:completionHandler:](client, "fetchLimitedOcclusionBoundsForOrientation:completionHandler:", a3, v10);

  }
}

void __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v9;
  _QWORD block[4];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E288E2D8;
  v9 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  dispatch_async(v9, block);

}

uint64_t __83__SBSWallpaperService_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)fetchLockScreenTimeBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  SBSWallpaperClient *client;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  OS_dispatch_queue *v11;
  id v12;

  v6 = a4;
  if (v6)
  {
    v7 = self->_callbackQueue;
    client = self->_client;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke;
    v10[3] = &unk_1E288E300;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    -[SBSWallpaperClient fetchLockScreenTimeBoundsForOrientation:completionHandler:](client, "fetchLockScreenTimeBoundsForOrientation:completionHandler:", a3, v10);

  }
}

void __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v9;
  _QWORD block[4];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke_2;
  block[3] = &unk_1E288E2D8;
  v9 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  dispatch_async(v9, block);

}

uint64_t __81__SBSWallpaperService_fetchLockScreenTimeBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)setWallpaperWithVideoWithWallpaperMode:(id)a3 cropRect:(CGRect)a4 wallpaperMode:(int64_t)a5
{
  return -[SBSWallpaperClient setWallpaperWithVideoWithWallpaperMode:cropRect:wallpaperMode:](self->_client, "setWallpaperWithVideoWithWallpaperMode:cropRect:wallpaperMode:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(unint64_t)a4
{
  return -[SBSWallpaperClient setWallpaperColorName:forVariants:](self->_client, "setWallpaperColorName:forVariants:", a3, a4);
}

- (BOOL)setWallpaperColor:(id)a3 darkColor:(id)a4 forVariants:(unint64_t)a5
{
  return -[SBSWallpaperClient setWallpaperColor:darkColor:forVariants:](self->_client, "setWallpaperColor:darkColor:forVariants:", a3, a4, a5);
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(unint64_t)a4
{
  return -[SBSWallpaperClient setWallpaperGradient:forVariants:](self->_client, "setWallpaperGradient:forVariants:", a3, a4);
}

- (void)restoreDefaultWallpaperWithCompletion:(id)a3
{
  -[SBSWallpaperClient restoreDefaultWallpaperWithCompletion:](self->_client, "restoreDefaultWallpaperWithCompletion:", a3);
}

- (void)triggerPosterSignificantEventWithCompletion:(id)a3
{
  -[SBSWallpaperClient triggerPosterSignificantEventWithCompletion:](self->_client, "triggerPosterSignificantEventWithCompletion:", a3);
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  return -[SBSWallpaperClient significantEventsCounterForPosterWithIdentifier:](self->_client, "significantEventsCounterForPosterWithIdentifier:", a3);
}

- (unint64_t)posterSignificantEventsCounter
{
  return -[SBSWallpaperClient posterSignificantEventsCounter](self->_client, "posterSignificantEventsCounter");
}

- (void)fetchPosterSignificantEventsCounterWithCompletionHandler:(id)a3
{
  -[SBSWallpaperClient fetchPosterSignificantEventsCounterWithCompletionHandler:](self->_client, "fetchPosterSignificantEventsCounterWithCompletionHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
