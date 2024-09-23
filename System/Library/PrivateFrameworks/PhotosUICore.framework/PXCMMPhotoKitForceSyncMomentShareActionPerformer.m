@implementation PXCMMPhotoKitForceSyncMomentShareActionPerformer

- (BOOL)canPerformActionWithSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "momentShare");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "status") == 1 || objc_msgSend(v5, "status") == 3;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PXCMMActionPerformer session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitForceSyncMomentShareActionPerformer.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  if (objc_msgSend(v5, "status") != 1 && objc_msgSend(v5, "status") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitForceSyncMomentShareActionPerformer.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare.status == PHShareStatusOwned || momentShare.status == PHShareStatusAccepted"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PXCMMPhotoKitForceSyncMomentShareActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5148600;
  v8[4] = self;
  objc_msgSend(v5, "forceSyncMomentShareWithCompletion:", v8);

}

void __73__PXCMMPhotoKitForceSyncMomentShareActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __73__PXCMMPhotoKitForceSyncMomentShareActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(_QWORD *)(a1 + 40) == 0);
}

@end
