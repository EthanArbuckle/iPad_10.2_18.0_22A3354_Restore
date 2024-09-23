@implementation PXCMMPhotoKitAcceptMomentShareActionPerformer

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
      v6 = objc_msgSend(v4, "status") == 2;
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
  _QWORD v7[5];

  -[PXCMMActionPerformer session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitAcceptMomentShareActionPerformer.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PXCMMPhotoKitAcceptMomentShareActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  PXMomentShareAcceptIfNeeded(v5, v7);

}

uint64_t __70__PXCMMPhotoKitAcceptMomentShareActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

@end
