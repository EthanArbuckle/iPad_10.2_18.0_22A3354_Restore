@implementation PXCMMTranscriptBubbleViewController

- (PXCMMTranscriptBubbleViewController)initWithURL:(id)a3 isSender:(BOOL)a4
{
  id v7;
  PXCMMTranscriptBubbleViewController *v8;
  PXCMMTranscriptBubbleViewController *v9;
  NSObject *v10;
  uint64_t v11;
  PHFetchResult *backingFetchResult;
  NSObject *v13;
  PXCMMTranscriptBubbleViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSError *error;
  void *v19;
  uint64_t v20;
  PHPhotoLibrary *photoLibrary;
  NSObject *v22;
  PXCMMTranscriptBubbleViewController *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  NSObject *v28;
  _BOOL4 v29;
  PXCMMTranscriptBubbleViewController *v30;
  void *v31;
  NSError *v32;
  PXCMMTranscriptBubbleViewController *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  objc_super v39;
  uint8_t buf[4];
  PXCMMTranscriptBubbleViewController *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PXCMMTranscriptBubbleViewController;
  v8 = -[PXCMMTranscriptBubbleViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (!v8)
    goto LABEL_30;
  if (!v7)
  {
    PLSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "A URL must be provided to a transcript bubble", buf, 2u);
    }

    objc_storeStrong((id *)&v9->_url, a3);
    v9->_isSender = a4;
    goto LABEL_27;
  }
  objc_storeStrong((id *)&v8->_url, a3);
  v9->_isSender = a4;
  v38 = 0;
  PXFetchAssetCollectionForCMMShareURL(v7, 1, &v38);
  v11 = objc_claimAutoreleasedReturnValue();
  backingFetchResult = v9->_backingFetchResult;
  v9->_backingFetchResult = (PHFetchResult *)v11;

  if (v38 == 1)
  {
    PLSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "pl_redactedShareURL");
      v14 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Unsupported debug URL: %{public}@", buf, 0xCu);

    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "pl_redactedShareURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1102, CFSTR("Debug URLs are unsupported: %@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    error = v9->_error;
    v9->_error = (NSError *)v17;

    goto LABEL_26;
  }
  -[PHFetchResult firstObject](v9->_backingFetchResult, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v20 = objc_claimAutoreleasedReturnValue();
  photoLibrary = v9->_photoLibrary;
  v9->_photoLibrary = (PHPhotoLibrary *)v20;

  if (v19)
  {
    if (objc_msgSend(v19, "trashedState") != 1)
    {
      -[PXCMMTranscriptBubbleViewController _triggerForcedSyncIfNeeded](v9, "_triggerForcedSyncIfNeeded");
      goto LABEL_25;
    }
    PLSharingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "pl_redactedShareURL");
      v23 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "Bubble will display error for trashed moment share URL: %{public}@", buf, 0xCu);

    }
    v24 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "pl_redactedShareURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1100, CFSTR("Moment share is trashed for URL: %@"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = objc_msgSend((id)objc_opt_class(), "_isPermanentFailureURL:", v7);
    PLSharingGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if ((v27 & 1) == 0)
    {
      if (v29)
      {
        objc_msgSend(v7, "pl_redactedShareURL");
        v33 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v33;
        _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_DEFAULT, "Unable to find MomentShare for URL %{public}@. Triggering network request", buf, 0xCu);

      }
      -[PXCMMTranscriptBubbleViewController _fetchMomentShareFromNetworkURL:](v9, "_fetchMomentShareFromNetworkURL:", v7);
      goto LABEL_25;
    }
    if (v29)
    {
      objc_msgSend(v7, "pl_redactedShareURL");
      v30 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v30;
      _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_DEFAULT, "Dropping to error state for known permanent failure URL: %{public}@", buf, 0xCu);

    }
    v31 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "pl_redactedShareURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "px_genericErrorWithDebugDescription:", CFSTR("Known permanent failure for URL: %@"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v32 = v9->_error;
  v9->_error = (NSError *)v26;

LABEL_25:
LABEL_26:
  -[PHPhotoLibrary px_registerChangeObserver:](v9->_photoLibrary, "px_registerChangeObserver:", v9);
LABEL_27:
  -[UIViewController px_enableExtendedTraitCollection](v9, "px_enableExtendedTraitCollection");
  v9->_readyForBubbleStateTransitions = 1;
  -[PXCMMTranscriptBubbleViewController _updateBubbleState](v9, "_updateBubbleState");
  PLSharingGetLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = -[PXCMMTranscriptBubbleViewController bubbleState](v9, "bubbleState");
    v36 = -[PXCMMTranscriptBubbleViewController targetState](v9, "targetState");
    *(_DWORD *)buf = 138412802;
    v41 = v9;
    v42 = 2048;
    v43 = v35;
    v44 = 2048;
    v45 = v36;
    _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_DEFAULT, "Initialized transcript bubble: %@ -  Initial state %lu (%lu)", buf, 0x20u);
  }

LABEL_30:
  return v9;
}

- (PXCMMTranscriptBubbleViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleViewController.m"), 140, CFSTR("%s is not available as initializer"), "-[PXCMMTranscriptBubbleViewController init]");

  abort();
}

- (PXCMMTranscriptBubbleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleViewController.m"), 144, CFSTR("%s is not available as initializer"), "-[PXCMMTranscriptBubbleViewController initWithNibName:bundle:]");

  abort();
}

- (PXCMMTranscriptBubbleViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleViewController.m"), 148, CFSTR("%s is not available as initializer"), "-[PXCMMTranscriptBubbleViewController initWithCoder:]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PXCMMTranscriptBubbleViewController;
  -[PXCMMTranscriptBubbleViewController dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXCMMTranscriptBubbleViewController;
  -[PXCMMTranscriptBubbleViewController description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMTranscriptBubbleViewController url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pl_redactedShareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXCMMTranscriptBubbleViewController isSender](self, "isSender"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  if (v4)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  v11 = objc_msgSend(v4, "assetCount");
  v12 = objc_msgSend(v4, "uploadedPhotosCount");
  -[PXCMMTranscriptBubbleViewController error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" URL: %@ isSender: %@ hasMomentShare: %@ expectedAssetCount: %lu uploadedCount: %lu error: %@"), v6, v8, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXCMMTranscriptBubbleViewController _updateBubbleView](self, "_updateBubbleView");
  v8.receiver = self;
  v8.super_class = (Class)PXCMMTranscriptBubbleViewController;
  -[PXTranscriptBubbleViewController contentSizeThatFits:](&v8, sel_contentSizeThatFits_, width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)workaroundSizeForSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  +[PXCMMStackBubbleView sizeThatFits:](PXCMMStackBubbleView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    -[PXCMMTranscriptBubbleViewController _updateBubbleState](self, "_updateBubbleState");
    v5 = v6;
  }

}

- (void)setBubbleState:(int64_t)a3
{
  NSObject *v5;
  int64_t bubbleState;
  int v7;
  PXCMMTranscriptBubbleViewController *v8;
  __int16 v9;
  int64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_bubbleState != a3)
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      bubbleState = self->_bubbleState;
      v7 = 138412802;
      v8 = self;
      v9 = 2048;
      v10 = bubbleState;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Transitioning bubble %@ state from %ld to %ld", (uint8_t *)&v7, 0x20u);
    }

    self->_bubbleState = a3;
    -[PXCMMTranscriptBubbleViewController _updateBubbleView](self, "_updateBubbleView");
  }
}

- (void)setTargetState:(int64_t)a3
{
  if (self->_targetState != a3)
  {
    self->_targetState = a3;
    -[PXCMMTranscriptBubbleViewController _ensureBubbleStateTransition](self, "_ensureBubbleStateTransition");
  }
}

- (PHMomentShare)momentShare
{
  return (PHMomentShare *)-[PHFetchResult firstObject](self->_backingFetchResult, "firstObject");
}

- (void)_fetchMomentShareFromNetworkURL:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  int v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  PXCMMTranscriptBubbleViewController *v15;
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke;
  v13 = &unk_1E5147B18;
  v5 = v4;
  v14 = v5;
  v15 = self;
  objc_copyWeak(&v16, &location);
  v6 = (void (**)(_QWORD))dispatch_block_create(DISPATCH_BLOCK_DETACHED, &v10);
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance", v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "simulateDelays");

  if (v8)
  {
    v9 = dispatch_time(0, 3000000000);
    dispatch_after(v9, MEMORY[0x1E0C80D38], v6);
  }
  else
  {
    v6[2](v6);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_momentShareURL:(id)a3 fetchDidFailWithError:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PXCMMTranscriptBubbleViewController setError:](self, "setError:", v6);
  v7 = PXMomentShareTypeForError(v6);

  if (v7 == 4 || (v7 & 0xE) == 2)
    objc_msgSend((id)objc_opt_class(), "_registerPermanentFailureURL:", v8);

}

- (void)_autoAcceptMomentShareIfNeeded:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "autoAcceptBubbles");

  if (v5)
    -[PXCMMTranscriptBubbleViewController _acceptMomentShareIfNeeded:](self, "_acceptMomentShareIfNeeded:", v6);

}

- (void)_acceptMomentShareIfNeeded:(id)a3
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  int v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXCMMTranscriptBubbleViewController__acceptMomentShareIfNeeded___block_invoke;
  block[3] = &unk_1E5149198;
  v4 = v3;
  v10 = v4;
  v5 = (void (**)(_QWORD))dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "simulateDelays");

  if (v7)
  {
    v8 = dispatch_time(0, 3000000000);
    dispatch_after(v8, MEMORY[0x1E0C80D38], v5);
  }
  else
  {
    v5[2](v5);
  }

}

- (void)_triggerForcedSyncIfNeeded
{
  void *v3;
  _QWORD v4[5];

  if (!self->_triggeredForcedSync)
  {
    -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXCMMTranscriptBubbleViewController bubbleState](self, "bubbleState") == 2
      && v3
      && (objc_msgSend(v3, "status") == 1 || objc_msgSend(v3, "status") == 3))
    {
      self->_triggeredForcedSync = 1;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __65__PXCMMTranscriptBubbleViewController__triggerForcedSyncIfNeeded__block_invoke;
      v4[3] = &unk_1E5148600;
      v4[4] = self;
      objc_msgSend(v3, "forceSyncMomentShareWithCompletion:", v4);
    }

  }
}

- (void)_retryMomentShareFetch
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  PXCMMTranscriptBubbleViewController *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  PXCMMTranscriptBubbleViewController *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  PXCMMTranscriptBubbleViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    PLSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PXCMMTranscriptBubbleViewController url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pl_redactedShareURL");
      v8 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
      -[PXCMMTranscriptBubbleViewController error](self, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Retrying moment share fetch for URL: %{public}@ - Previous error: %@", buf, 0x16u);

    }
    -[PXCMMTranscriptBubbleViewController setError:](self, "setError:", 0);
    -[PXCMMTranscriptBubbleViewController url](self, "url");
    v5 = objc_claimAutoreleasedReturnValue();
    -[PXCMMTranscriptBubbleViewController _fetchMomentShareFromNetworkURL:](self, "_fetchMomentShareFromNetworkURL:", v5);
    goto LABEL_10;
  }
  if (self->_isExpungingAndRefetching
    || objc_msgSend(v3, "trashedState") != 1
    || objc_msgSend(v4, "status") == 1)
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Skipping moment share retry. There's already a moment share for bubble: %@", buf, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  -[PXCMMTranscriptBubbleViewController setError:](self, "setError:", 0);
  self->_isExpungingAndRefetching = 1;
  PLSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[PXCMMTranscriptBubbleViewController url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pl_redactedShareURL");
    v12 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Retrying moment share fetch for URL: %{public}@ - Trashed Moment Shared with UUID: %@", buf, 0x16u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PXCMMTranscriptBubbleViewController__retryMomentShareFetch__block_invoke;
  v14[3] = &unk_1E5147B40;
  v14[4] = self;
  v15 = v4;
  PXExpungeMomentShare(v15, v14);

LABEL_11:
}

- (BOOL)_shouldRetryOnTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXCMMTranscriptBubbleViewController error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXCMMTranscriptBubbleViewController error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)PXMomentShareTypeForError(v4);

    if (v3 != (void *)1)
    {
      if (v3 == (void *)3)
      {
        -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v3) = objc_msgSend(v5, "status") != 1;

      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "alwaysTapToRetry"))
    {
      -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        LOBYTE(v3) = 1;
    }

  }
  return (char)v3;
}

- (BOOL)_shouldOpenInSafari
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXCMMTranscriptBubbleViewController error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = PXMomentShareTypeForError(v2) == 6;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldOpenCloudSettings
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXCMMTranscriptBubbleViewController error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = PXMomentShareTypeForError(v2) == 10;
  else
    v4 = 0;

  return v4;
}

- (void)_tapGesture:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  PXCMMTranscriptBubbleViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 3)
  {
    if (-[PXCMMTranscriptBubbleViewController _shouldNavigateToContent](self, "_shouldNavigateToContent"))
    {
      -[PXTranscriptBubbleViewController delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[PXCMMTranscriptBubbleViewController touchDelegate](self, "touchDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "transcriptBubbleViewController:didSelectMomentShare:", self, v10);

      }
    }
    else
    {
      if (-[PXCMMTranscriptBubbleViewController _shouldRetryOnTap](self, "_shouldRetryOnTap"))
      {
        -[PXCMMTranscriptBubbleViewController _retryMomentShareFetch](self, "_retryMomentShareFetch");
        return;
      }
      if (-[PXCMMTranscriptBubbleViewController _shouldOpenInSafari](self, "_shouldOpenInSafari"))
      {
        PLSharingGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to open URL in Safari for bubble: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
        v8 = objc_claimAutoreleasedReturnValue();
        -[PXCMMTranscriptBubbleViewController url](self, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject openURL:configuration:completionHandler:](v8, "openURL:configuration:completionHandler:", v9, 0, 0);

      }
      else
      {
        if (-[PXCMMTranscriptBubbleViewController _shouldOpenCloudSettings](self, "_shouldOpenCloudSettings"))
        {
          +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 4, 0);
          return;
        }
        PLSharingGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v12 = self;
          _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "No action required for tap on bubble: %@", buf, 0xCu);
        }
      }

    }
  }
}

- (void)viewDidLoad
{
  void *v4;
  uint64_t v5;
  PXCMMSpecManager *v6;
  PXCMMSpecManager *specManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXCMMTranscriptBubbleViewController;
  -[PXTranscriptBubbleViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleViewController.m"), 384, CFSTR("Spec cannot be set up if there's no trait collection"));

  }
  if (-[PXCMMTranscriptBubbleViewController isSender](self, "isSender"))
    v5 = 1;
  else
    v5 = 2;
  v6 = -[PXCMMSpecManager initWithExtendedTraitCollection:activityType:]([PXCMMSpecManager alloc], "initWithExtendedTraitCollection:activityType:", v4, v5);
  specManager = self->_specManager;
  self->_specManager = v6;

  -[PXCMMSpecManager registerChangeObserver:context:](self->_specManager, "registerChangeObserver:context:", self, CMMSpecObservationContext);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__tapGesture_);
  -[PXCMMTranscriptBubbleViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addGestureRecognizer:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMTranscriptBubbleViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

}

- (BOOL)_shouldShowContent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "trashedState") != 1;
  else
    v4 = 0;

  return v4;
}

- (void)_updateBubbleView
{
  int64_t v3;
  PXCMMStackBubbleView *v4;
  PXCMMTranscriptBubbleStatusView *v5;
  PXCMMTranscriptBubbleStatusView *v6;
  PXCMMTranscriptBubbleStatusView *v7;
  PXCMMStackBubbleView *v8;
  PXCMMTranscriptBubbleStatusView *v9;
  void *v10;
  void *v11;
  void *v12;
  PXCMMTranscriptBubbleStatusView *v13;
  PXCMMTranscriptBubbleStatusView *v14;
  PXCMMTranscriptBubbleStatusView *v15;
  PXCMMStackBubbleView *v16;
  PXCMMTranscriptBubbleStatusView *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  PXCMMStackBubbleView *v26;
  PXCMMStackBubbleView *v27;
  PXCMMStackBubbleView *stackBubbleView;
  void *v29;
  double v30;
  double v31;
  PXCMMTranscriptBubbleStatusView *loadingStatusView;
  PXCMMTranscriptBubbleStatusView *errorStatusView;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = -[PXCMMTranscriptBubbleViewController bubbleState](self, "bubbleState");
  if (v3 != 1)
  {
    if (v3 != 3)
    {
      if (v3 != 2)
        return;
      if (self->_stackBubbleView)
      {
        v4 = 0;
      }
      else
      {
        v26 = [PXCMMStackBubbleView alloc];
        v27 = -[PXCMMStackBubbleView initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        stackBubbleView = self->_stackBubbleView;
        self->_stackBubbleView = v27;

        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bounds");
        v31 = v30;

        -[PXCMMStackBubbleView setMaximumHeight:](self->_stackBubbleView, "setMaximumHeight:", ceil(v31 * 0.2));
        v4 = self->_stackBubbleView;
      }
      loadingStatusView = self->_loadingStatusView;
      self->_loadingStatusView = 0;

      errorStatusView = self->_errorStatusView;
      self->_errorStatusView = 0;

      -[PXCMMTranscriptBubbleViewController _updateContent](self, "_updateContent");
      if (!v4)
        return;
LABEL_28:
      -[PXTranscriptBubbleViewController transitionToContentView:](self, "transitionToContentView:", v4);

      return;
    }
    if (self->_errorStatusView)
    {
      v4 = 0;
    }
    else
    {
      v13 = [PXCMMTranscriptBubbleStatusView alloc];
      v14 = -[PXCMMTranscriptBubbleStatusView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v15 = self->_errorStatusView;
      self->_errorStatusView = v14;

      v4 = self->_errorStatusView;
    }
    v16 = self->_stackBubbleView;
    self->_stackBubbleView = 0;

    v17 = self->_loadingStatusView;
    self->_loadingStatusView = 0;

    PXLocalizedStringFromTable(CFSTR("PXMessagesBubbleLinkUnavailableTitle"), CFSTR("PhotosUICore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMTranscriptBubbleStatusView setStatusTitle:](self->_errorStatusView, "setStatusTitle:", v18);

    -[PXCMMTranscriptBubbleViewController error](self, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "simulateMomentShareBubbleError");

    if (v21)
    {
      +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "simulatedMomentShareBubbleErrorType");

      PLSharingGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (v23 > 0xB)
          v25 = 0;
        else
          v25 = *(&off_1E512B3A0 + v23);
        v34 = v25;
        v38 = 138543362;
        v39 = v34;
        _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "Simulating moment share bubble error (PXCompleteMyMomentSettings.sharedInstance.simulatedMomentShareBubbleErrorType):  %{public}@", (uint8_t *)&v38, 0xCu);

      }
      if (v23 > 0xB)
      {
        v35 = 0;
LABEL_27:
        -[PXCMMTranscriptBubbleStatusView setStatusDescription:](self->_errorStatusView, "setStatusDescription:", v35);
        -[PXTranscriptBubbleViewController delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "safeAreaInsetsForBubble:", self);
        -[PXCMMTranscriptBubbleStatusView setBubbleSafeAreaInsets:](self->_errorStatusView, "setBubbleSafeAreaInsets:");

        -[PXFeatureSpecManager spec](self->_specManager, "spec");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXCMMTranscriptBubbleStatusView setSpec:](self->_errorStatusView, "setSpec:", v37);

        if (!v4)
          return;
        goto LABEL_28;
      }
    }
    else
    {
      v23 = PXMomentShareTypeForError(v19);
    }
    PXLocalizedStringFromTable(off_1E5147B60[v23], CFSTR("PhotosUICore"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (self->_loadingStatusView)
  {
    v4 = 0;
  }
  else
  {
    v5 = [PXCMMTranscriptBubbleStatusView alloc];
    v6 = -[PXCMMTranscriptBubbleStatusView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_loadingStatusView;
    self->_loadingStatusView = v6;

    v4 = self->_loadingStatusView;
  }
  v8 = self->_stackBubbleView;
  self->_stackBubbleView = 0;

  v9 = self->_errorStatusView;
  self->_errorStatusView = 0;

  PXLocalizedStringFromTable(CFSTR("PXMessagesBubbleLoadingMessage"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMTranscriptBubbleStatusView setStatusTitle:](self->_loadingStatusView, "setStatusTitle:", v10);

  -[PXCMMTranscriptBubbleStatusView setShowsActivityIndicator:](self->_loadingStatusView, "setShowsActivityIndicator:", 1);
  -[PXTranscriptBubbleViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaInsetsForBubble:", self);
  -[PXCMMTranscriptBubbleStatusView setBubbleSafeAreaInsets:](self->_loadingStatusView, "setBubbleSafeAreaInsets:");

  -[PXFeatureSpecManager spec](self->_specManager, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMTranscriptBubbleStatusView setSpec:](self->_loadingStatusView, "setSpec:", v12);

  if (v4)
    goto LABEL_28;
}

- (void)_updateContent
{
  id v3;

  if (-[PXCMMTranscriptBubbleViewController _shouldShowContent](self, "_shouldShowContent"))
  {
    -[PXCMMTranscriptBubbleViewController momentShare](self, "momentShare");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCMMStackBubbleView setMomentShare:](self->_stackBubbleView, "setMomentShare:", v3);

  }
}

- (void)_updateBubbleState
{
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  PXCMMTranscriptBubbleViewController *v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PXCMMTranscriptBubbleViewController bubbleState](self, "bubbleState");
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "simulateMomentShareBubbleError");

  -[PXCMMTranscriptBubbleViewController error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 || v5)
  {
    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if ((v5 & 1) != 0)
      {
        v9 = CFSTR("Simulated");
      }
      else
      {
        -[PXCMMTranscriptBubbleViewController error](self, "error");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Will enter error state for bubble: %@ - Error: %@", (uint8_t *)&v10, 0x16u);
      if ((v5 & 1) == 0)

    }
    v7 = 3;
  }
  else if (-[PXCMMTranscriptBubbleViewController _shouldShowContent](self, "_shouldShowContent"))
  {
    v7 = 2;
  }
  else
  {
    v7 = v3 != 0;
  }
  -[PXCMMTranscriptBubbleViewController setTargetState:](self, "setTargetState:", v7);
}

- (void)_ensureBubbleStateTransition
{
  int64_t v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = -[PXCMMTranscriptBubbleViewController targetState](self, "targetState");
  if (v3 != -[PXCMMTranscriptBubbleViewController bubbleState](self, "bubbleState")
    && self->_readyForBubbleStateTransitions)
  {
    -[PXCMMTranscriptBubbleViewController setBubbleState:](self, "setBubbleState:", -[PXCMMTranscriptBubbleViewController targetState](self, "targetState"));
    self->_readyForBubbleStateTransitions = 0;
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 2000000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PXCMMTranscriptBubbleViewController__ensureBubbleStateTransition__block_invoke;
    v5[3] = &unk_1E5148D30;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_readyForStateTransition
{
  self->_readyForBubbleStateTransitions = 1;
  -[PXCMMTranscriptBubbleViewController _ensureBubbleStateTransition](self, "_ensureBubbleStateTransition");
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v5;
  NSObject *v6;
  PXCMMTranscriptBubbleViewController *v7;
  NSObject *v8;
  PHFetchResult *v9;
  PHFetchResult *backingFetchResult;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXCMMTranscriptBubbleViewController *v17;
  void *v18;
  _BOOL4 isExpungingAndRefetching;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  PXCMMTranscriptBubbleViewController *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = self;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Photo library did change for bubble: %@.", buf, 0xCu);
  }

  if (!self->_backingFetchResult)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleViewController.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_backingFetchResult"));

  }
  objc_msgSend(v5, "changeDetailsForFetchResult:");
  v7 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "Change details: %@.", buf, 0xCu);
    }

    -[PXCMMTranscriptBubbleViewController fetchResultAfterChanges](v7, "fetchResultAfterChanges");
    v9 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    backingFetchResult = self->_backingFetchResult;
    self->_backingFetchResult = v9;

    -[PXCMMTranscriptBubbleViewController changedIndexes](v7, "changedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    -[PXCMMTranscriptBubbleViewController error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_25;
    -[PXCMMTranscriptBubbleViewController fetchResultBeforeChanges](v7, "fetchResultBeforeChanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFetchResult firstObject](self->_backingFetchResult, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMTranscriptBubbleViewController url](self, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pl_redactedShareURL");
    v17 = (PXCMMTranscriptBubbleViewController *)objc_claimAutoreleasedReturnValue();

    if (v15 && objc_msgSend(v15, "trashedState") == 1 && !objc_msgSend(v26, "trashedState"))
    {
      PLSharingGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Moment share was trashed for URL: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1100, CFSTR("Moment share was trashed for URL: %@"), v17);
    }
    else
    {
      -[PXCMMTranscriptBubbleViewController removedIndexes](v7, "removedIndexes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "count")
        || -[PHFetchResult count](self->_backingFetchResult, "count")
        || !objc_msgSend(v14, "count"))
      {
        goto LABEL_23;
      }
      isExpungingAndRefetching = self->_isExpungingAndRefetching;

      if (isExpungingAndRefetching)
      {
LABEL_24:

LABEL_25:
        if (self->_isExpungingAndRefetching)
        {
          -[PXCMMTranscriptBubbleViewController insertedIndexes](v7, "insertedIndexes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            -[PXCMMTranscriptBubbleViewController fetchResultBeforeChanges](v7, "fetchResultBeforeChanges");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (!v24)
              self->_isExpungingAndRefetching = 0;
          }
          else
          {

          }
        }
        -[PXCMMTranscriptBubbleViewController _updateBubbleState](self, "_updateBubbleState");
        if (v12)
          -[PXCMMTranscriptBubbleViewController _updateBubbleView](self, "_updateBubbleView");
        -[PXCMMTranscriptBubbleViewController _triggerForcedSyncIfNeeded](self, "_triggerForcedSyncIfNeeded");
        goto LABEL_33;
      }
      PLSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Moment share object went away for URL: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1101, CFSTR("Moment share object went away for URL: %@"), v17);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMTranscriptBubbleViewController setError:](self, "setError:", v18);
LABEL_23:

    goto LABEL_24;
  }
LABEL_33:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)CMMSpecObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleViewController.m"), 633, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXCMMTranscriptBubbleViewController _updateBubbleView](self, "_updateBubbleView");
    v9 = v11;
  }

}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isSender
{
  return self->_isSender;
}

- (PXCMMTranscriptBubbleTouchDelegate)touchDelegate
{
  return (PXCMMTranscriptBubbleTouchDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (void)setTouchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_touchDelegate, a3);
}

- (int64_t)bubbleState
{
  return self->_bubbleState;
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusView, 0);
  objc_storeStrong((id *)&self->_errorStatusView, 0);
  objc_storeStrong((id *)&self->_stackBubbleView, 0);
  objc_storeStrong((id *)&self->_backingFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __67__PXCMMTranscriptBubbleViewController__ensureBubbleStateTransition__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_readyForStateTransition");

}

void __61__PXCMMTranscriptBubbleViewController__retryMomentShareFetch__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pl_redactedShareURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Successfully expunged trashed moment share fetch for refetch - URL: %{public}@ UUID: %@", (uint8_t *)&v16, 0x16u);

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_fetchMomentShareFromNetworkURL:", v12);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pl_redactedShareURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to expunge trashed moment share fetch for refetch - URL: %{public}@ UUID: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1081) = 0;
  }

}

void __65__PXCMMTranscriptBubbleViewController__triggerForcedSyncIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 134218242;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Forced sync for bubble %p, failed with error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __66__PXCMMTranscriptBubbleViewController__acceptMomentShareIfNeeded___block_invoke(uint64_t a1)
{
  PXMomentShareAcceptIfNeeded(*(void **)(a1 + 32), 0);
}

void __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CD1680];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke_2;
  v5[3] = &unk_1E5147AF0;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "fetchMomentShareFromShareURL:options:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
}

void __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_autoAcceptMomentShareIfNeeded:", v5);

    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched MomentShare for URL %{public}@", buf, 0xCu);

    }
  }
  else
  {
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13 = *(id *)(a1 + 32);
    v10 = v6;
    px_dispatch_on_main_queue();
    PLSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch MomentShare for url (%@) with error: %{public}@", buf, 0x16u);

    }
    objc_destroyWeak(&v14);
  }

}

void __71__PXCMMTranscriptBubbleViewController__fetchMomentShareFromNetworkURL___block_invoke_150(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_momentShareURL:fetchDidFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (void)_registerPermanentFailureURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)knownPermanentFailures;
  v7 = v3;
  if (!knownPermanentFailures)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)knownPermanentFailures;
    knownPermanentFailures = v5;

    v3 = v7;
    v4 = (void *)knownPermanentFailures;
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (BOOL)_isPermanentFailureURL:(id)a3
{
  return objc_msgSend((id)knownPermanentFailures, "containsObject:", a3);
}

@end
