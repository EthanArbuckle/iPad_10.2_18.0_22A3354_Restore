@implementation PXCMMPhotoKitNotifyWhenReadyActionPerformer

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint8_t buf[8];
  _QWORD v16[5];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  -[PXCMMActionPerformer session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "numberOfSections") >= 1)
  {
    v17 = objc_msgSend(v6, "identifier");
    v18 = xmmword_1A7C0C1F0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "assetCollectionAtSectionIndexPath:", &v17);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitNotifyWhenReadyActionPerformer.m"), 28, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v13, v14);

      }
      v9 = objc_msgSend(v6, "numberOfItemsInSection:", 0);

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68__PXCMMPhotoKitNotifyWhenReadyActionPerformer_performBackgroundTask__block_invoke;
      v16[3] = &unk_1E5148B78;
      v16[4] = self;
      PXMomentShareRequestNotificationOnUploadCompletion(v8, v9, v16);

      goto LABEL_10;
    }
    objc_msgSend(v6, "numberOfItemsInSection:", 0);
  }
  PLSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Found no moment share to notify on upload completion", buf, 2u);
  }

  -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
LABEL_10:

}

uint64_t __68__PXCMMPhotoKitNotifyWhenReadyActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

@end
