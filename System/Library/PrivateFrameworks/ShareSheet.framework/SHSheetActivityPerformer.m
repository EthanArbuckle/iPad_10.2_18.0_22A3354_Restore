@implementation SHSheetActivityPerformer

- (SHSheetActivityPerformer)initWithActivity:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  SHSheetActivityPerformer *v9;
  SHSheetActivityPerformer *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHSheetActivityPerformer;
  v9 = -[SHSheetActivityPerformer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    objc_storeWeak((id *)&v10->_session, v8);
    objc_msgSend(v8, "activityViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_activityViewController, v11);

    v10->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SHSheetActivityPerformer activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cleanup");

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endBackgroundTask:", self->_backgroundTaskIdentifier);

  -[SHSheetActivityPerformer presentationController](self, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityPerformCleanUpPresentation:", self);

  v6.receiver = self;
  v6.super_class = (Class)SHSheetActivityPerformer;
  -[SHSheetActivityPerformer dealloc](&v6, sel_dealloc);
}

- (void)setActivityItemProviderOperationQueue:(id)a3
{
  NSOperationQueue *v5;
  NSOperationQueue *v6;
  NSOperationQueue **p_activityItemProviderOperationQueue;
  NSOperationQueue *activityItemProviderOperationQueue;
  NSOperationQueue *v9;

  v5 = (NSOperationQueue *)a3;
  activityItemProviderOperationQueue = self->_activityItemProviderOperationQueue;
  p_activityItemProviderOperationQueue = &self->_activityItemProviderOperationQueue;
  v6 = activityItemProviderOperationQueue;
  if (activityItemProviderOperationQueue != v5)
  {
    v9 = v5;
    -[NSOperationQueue cancelAllOperations](v6, "cancelAllOperations");
    objc_storeStrong((id *)p_activityItemProviderOperationQueue, a3);
    v5 = v9;
  }

}

- (BOOL)isRunning
{
  int64_t v3;

  v3 = -[SHSheetActivityPerformer state](self, "state");
  if (v3 != 1)
    LOBYTE(v3) = -[SHSheetActivityPerformer state](self, "state") == 2;
  return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v12[4];
  id v13;
  _BYTE buf[12];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetActivityPerformer setState:](self, "setState:", 1);
  -[SHSheetActivityPerformer activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformer setBeginPerformingActivityTimestamp:](self, "setBeginPerformingActivityTimestamp:", mach_continuous_time());
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Performing activity %{public}@ (%{public}@)", buf, 0x16u);

  }
  -[SHSheetActivityPerformer setCompletionHandler:](self, "setCompletionHandler:", v4);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__SHSheetActivityPerformer_performWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E40032C0;
  objc_copyWeak(&v13, (id *)buf);
  objc_msgSend(v5, "setDidFinishPerformingActivityHandler:", v12);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__start, CFSTR("_UIActivityViewControllerExecuteActivityNotification"), v9);

  if (!objc_msgSend(v5, "_needsResolvedActivityItems"))
    goto LABEL_7;
  objc_msgSend(v5, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.DocumentManagerUICore.AddTagsActionExtension")))
  {

LABEL_7:
    -[SHSheetActivityPerformer _executeActivity](self, "_executeActivity");
    goto LABEL_8;
  }
  v11 = -[SHSheetActivityPerformer _enqueueBackgroundOperationsIfNeeded](self, "_enqueueBackgroundOperationsIfNeeded");

  if (!v11)
    goto LABEL_7;
LABEL_8:
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __57__SHSheetActivityPerformer_performWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5;
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  if (a2)
    v5 = 5;
  else
    v5 = 4;
  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_completePerformingActivityWithState:returnedItems:error:", v5, v8, v7);

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetActivityPerformer activity](self, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetActivityPerformer activity](self, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling activity %{public}@ (%{public}@)", (uint8_t *)&v7, 0x16u);

  }
  -[SHSheetActivityPerformer _finishWithState:](self, "_finishWithState:", 3);
}

- (void)finishWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetActivityPerformer activity](self, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetActivityPerformer activity](self, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Finishing activity %{public}@ (%{public}@) with success:%@", (uint8_t *)&v11, 0x20u);

  }
  if (v3)
    v10 = 5;
  else
    v10 = 4;
  -[SHSheetActivityPerformer _finishWithState:](self, "_finishWithState:", v10);
}

- (void)_finishWithState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBackgroundTask:", -[SHSheetActivityPerformer backgroundTaskIdentifier](self, "backgroundTaskIdentifier"));

  -[SHSheetActivityPerformer setBackgroundTaskIdentifier:](self, "setBackgroundTaskIdentifier:", *MEMORY[0x1E0DC4878]);
  v6 = (void *)MEMORY[0x1E0DE7910];
  -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelPreviousPerformRequestsWithTarget:", v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("_UIActivityViewControllerExecuteActivityNotification"), 0);

  -[SHSheetActivityPerformer setActivityItemProviderOperationQueue:](self, "setActivityItemProviderOperationQueue:", 0);
  -[SHSheetActivityPerformer _completePerformingActivityWithState:returnedItems:error:](self, "_completePerformingActivityWithState:returnedItems:error:", a3, 0, 0);
}

- (void)_completePerformingActivityWithState:(int64_t)a3 returnedItems:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  SHSheetActivityPerformerResult *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  int v21;
  SHSheetActivityPerformer *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 5)
      v11 = 0;
    else
      v11 = off_1E4003330[a3];
    -[SHSheetActivityPerformer activity](self, "activity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetActivityPerformer activity](self, "activity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = (SHSheetActivityPerformer *)v11;
    v23 = 2114;
    v24 = (int64_t)v12;
    v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Completing with state:%@ %{public}@ (%{public}@)", (uint8_t *)&v21, 0x20u);

  }
  if (-[SHSheetActivityPerformer state](self, "state") < 3)
  {
    -[SHSheetActivityPerformer setState:](self, "setState:", a3);
    -[SHSheetActivityPerformer activity](self, "activity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDidFinishPerformingActivityHandler:", 0);

    -[SHSheetActivityPerformer presentationController](self, "presentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activityPerformerStopListeningForDismissalTransition:", self);

    v18 = [SHSheetActivityPerformerResult alloc];
    -[SHSheetActivityPerformer activity](self, "activity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SHSheetActivityPerformerResult initWithActivity:completedState:returnedItems:error:](v18, "initWithActivity:completedState:returnedItems:error:", v19, a3, v8, v9);

    -[SHSheetActivityPerformer setResult:](self, "setResult:", v15);
    -[SHSheetActivityPerformer completionHandler](self, "completionHandler");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSObject *))v20)[2](v20, v15);
    -[SHSheetActivityPerformer setCompletionHandler:](self, "setCompletionHandler:", 0);
    -[SHSheetActivityPerformer setRetainedActivityViewController:](self, "setRetainedActivityViewController:", 0);

  }
  else
  {
    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = self;
      v23 = 2048;
      v24 = a3;
      _os_log_impl(&dword_19E419000, v15, OS_LOG_TYPE_DEFAULT, "Activity Performer:%@ is already completed with state:%ld", (uint8_t *)&v21, 0x16u);
    }
  }

}

- (id)_resolvedActivityItems
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SHSheetActivityPerformer activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, v3);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ResolveActivityItemValues", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, v3);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v3, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v10;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ResolveActivityItemValuesWithType", "activityType=%{public, signpost.telemetry:string1}@", (uint8_t *)&v21, 0xCu);

  }
  -[SHSheetActivityPerformer session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityItemsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityItemValuesForActivity:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, v3);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v14, OS_SIGNPOST_INTERVAL_END, v16, "ResolveActivityItemValues", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_make_with_pointer(v18, v3);

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v17, OS_SIGNPOST_INTERVAL_END, v19, "ResolveActivityItemValuesWithType", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  return v13;
}

- (void)_executeActivity
{
  void *v2;
  id v3;

  -[SHSheetActivityPerformer session](self, "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_executeActivity");

}

- (void)_start
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SHSheetActivityPerformer *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[SHSheetActivityPerformer setState:](self, "setState:", 2);
  -[SHSheetActivityPerformer activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "activityType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v3;
    v26 = 2114;
    v27 = v5;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Executing activity %{public}@ (%{public}@)", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endBackgroundTask:", self->_backgroundTaskIdentifier);

  self->_backgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SHSheetActivityPerformer activityItemProviderOperations](self, "activityItemProviderOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isCancelled") & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  -[SHSheetActivityPerformer setActivityItemProviderOperations:](self, "setActivityItemProviderOperations:", 0);
  -[SHSheetActivityPerformer presentationController](self, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "activityPerformerCanPresent:", self);

  if ((v8 & 1) != 0 || !v12)
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "activityType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v3;
      v26 = 2114;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "Cancel activity %{public}@ (%{public}@) anyOperationWasCanceled:%@ canPresent:%@", buf, 0x2Au);

    }
    -[SHSheetActivityPerformer cancel](self, "cancel");
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __34__SHSheetActivityPerformer__start__block_invoke;
    v17[3] = &unk_1E4001248;
    v18 = v3;
    v19 = self;
    -[SHSheetActivityPerformer _prepareActivityWithCompletion:](self, "_prepareActivityWithCompletion:", v17);

  }
}

uint64_t __34__SHSheetActivityPerformer__start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "activityType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "Did prepare activity %{public}@ (%{public}@)", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_prepareActivityPresentation");
}

- (void)_prepareActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  _BYTE buf[12];
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetActivityPerformer _resolvedActivityItems](self, "_resolvedActivityItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformer activity](self, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SFGenerateTypeList();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    *(_QWORD *)&buf[4] = v6;
    v27 = 2114;
    v28 = v9;
    v29 = 2117;
    v30 = v5;
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "Preparing activity %{public}@ (%{public}@) with activity items:%{sensitive}@ of types:%{public}@", buf, 0x2Au);

  }
  -[SHSheetActivityPerformer _configureActivityBeforePreparation](self, "_configureActivityBeforePreparation");
  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, v6);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PrepareActivity", " enableTelemetry=YES ", buf, 2u);
  }

  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, v6);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    objc_msgSend(v6, "activityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v17;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PrepareActivityWithType", "activityType=%{public, signpost.telemetry:string1}@", buf, 0xCu);

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__SHSheetActivityPerformer__prepareActivityWithCompletion___block_invoke;
  v21[3] = &unk_1E4002D40;
  objc_copyWeak(&v25, (id *)buf);
  v18 = v6;
  v22 = v18;
  v19 = v7;
  v23 = v19;
  v20 = v4;
  v24 = v20;
  objc_msgSend(v18, "_prepareWithActivityItems:completion:", v5, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

void __59__SHSheetActivityPerformer__prepareActivityWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));

    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v3, OS_SIGNPOST_INTERVAL_END, v5, "PrepareActivity", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
    }

    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PrepareActivityWithType", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(WeakRetained, "_configureActivityAfterPreparation");
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v10, "activityType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "Preparing activity view controller:%@ %{public}@ (%{public}@)", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_prepareActivity:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (BOOL)_presentPopoverContentViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 6)
    return 0;
  if (!_ShareSheetPlatformPrefersPopover())
    return 0;
  -[SHSheetActivityPerformer activity](self, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_embeddedActivityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[SHSheetActivityPerformer presentationController](self, "presentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activityPerformer:presentPopoverContentViewController:", self, v7);

  return v9;
}

- (void)_prepareActivityPresentation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  uint64_t v24;
  SHSheetActivityPresentationContext *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE buf[12];
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[SHSheetActivityPerformer activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SHSheetActivityPerformer _presentPopoverContentViewController](self, "_presentPopoverContentViewController"))
  {
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "activityType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v3;
      v34 = 2114;
      v35 = v5;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Did present popover content for activity %{public}@ (%{public}@)", buf, 0x16u);

    }
  }
  else
  {
    -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom") == 6;

    objc_msgSend(v3, "activityViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v8)
    {
      if (v9)
      {
        v10 = v9;
      }
      else
      {
        objc_msgSend(v3, "_embeddedActivityViewController");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

      v4 = v11;
    }
    -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "activityType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v4;
      v34 = 2114;
      v35 = v3;
      v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_19E419000, v15, OS_LOG_TYPE_DEFAULT, "Prepare activity presentation for view controller:%@ %{public}@ (%{public}@)", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[SHSheetActivityPerformer presentationController](self, "presentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke;
    v30[3] = &unk_1E40017C0;
    v19 = v3;
    v31 = v19;
    objc_copyWeak(&v32, (id *)buf);
    objc_msgSend(v17, "activityPerformer:startListeningForDismissalTransitionWithCompletion:", self, v30);

    if (_ShareSheetIsSupportedPrintActivity(v19))
    {
      objc_msgSend(v12, "_window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWindowHoldingActivityViewController:", v20);

    }
    -[SHSheetActivityPerformer session](self, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "allowsEmbedding");
    if (v4)
      v23 = 1;
    else
      v23 = v22;
    if ((v23 & 1) != 0)
      v24 = 1;
    else
      v24 = objc_msgSend(v19, "_managesOwnPresentation");

    objc_msgSend(v19, "_willBePerformedOrPresented");
    v25 = objc_alloc_init(SHSheetActivityPresentationContext);
    -[SHSheetActivityPresentationContext setShouldDismissBeforePresentation:](v25, "setShouldDismissBeforePresentation:", v14 ^ 1u);
    -[SHSheetActivityPresentationContext setShouldPresentOverCurrentContext:](v25, "setShouldPresentOverCurrentContext:", v24);
    -[SHSheetActivityPerformer session](self, "session");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetActivityPresentationContext setIsCloudSharing:](v25, "setIsCloudSharing:", objc_msgSend(v26, "configureForCloudSharing"));

    if (-[SHSheetActivityPresentationContext shouldDismissBeforePresentation](v25, "shouldDismissBeforePresentation")
      && !-[SHSheetActivityPresentationContext shouldPresentOverCurrentContext](v25, "shouldPresentOverCurrentContext"))
    {
      -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetActivityPerformer setRetainedActivityViewController:](self, "setRetainedActivityViewController:", v27);

    }
    -[SHSheetActivityPerformer presentationController](self, "presentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke_2;
    v29[3] = &unk_1E40032E8;
    v29[4] = self;
    objc_msgSend(v28, "activityPerformer:preparePresentationWithContext:completion:", self, v25, v29);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

  }
}

void __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "_allowsAutoCancelOnDismiss"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "cancel");

  }
}

uint64_t __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPresentationWithViewController:", a2);
}

- (void)_performPresentationWithViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  int IsSupportedPrintActivity;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetActivityPerformer activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = (unint64_t)v4;
    v41 = 2114;
    v42 = v5;
    v43 = 2114;
    v44 = v7;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Perform presentation with view controller:%@ %{public}@ (%{public}@)", buf, 0x20u);

  }
  location = 0;
  objc_initWeak(&location, self);
  -[SHSheetActivityPerformer activity](self, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke;
  v36[3] = &unk_1E40016A0;
  objc_copyWeak(&v37, &location);
  v10 = objc_msgSend(v8, "_presentActivityOnViewController:animated:completion:", v4, 1, v36);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v5, "activityViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IsSupportedPrintActivity = _ShareSheetIsSupportedPrintActivity(v5);
    objc_msgSend(v5, "activityType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    if (v11)
      v15 = IsSupportedPrintActivity;
    else
      v15 = 1;
    if ((v15 | v14) == 1)
    {
      objc_msgSend(v5, "performActivity");
      share_sheet_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "activityType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = (unint64_t)v5;
        v41 = 2114;
        v42 = v17;
        _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, "Performed non-UI activity %{public}@ (%{public}@)", buf, 0x16u);

      }
      share_sheet_log();
      v18 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_signpost_id_make_with_pointer(v19, v5);

      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        v21 = -[SHSheetActivityPerformer beginPerformingActivityTimestamp](self, "beginPerformingActivityTimestamp");
        *(_DWORD *)buf = 134349056;
        v40 = v21;
        _os_signpost_emit_with_name_impl(&dword_19E419000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PerformNonUIActivity", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      share_sheet_log();
      v22 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_make_with_pointer(v23, v5);

      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19E419000, v22, OS_SIGNPOST_INTERVAL_END, v24, "PerformNonUIActivity", " enableTelemetry=YES ", buf, 2u);
      }

      share_sheet_log();
      v25 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_make_with_pointer(v26, v5);

      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        v28 = -[SHSheetActivityPerformer beginPerformingActivityTimestamp](self, "beginPerformingActivityTimestamp");
        objc_msgSend(v5, "activityType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134349314;
        v40 = v28;
        v41 = 2114;
        v42 = v29;
        _os_signpost_emit_with_name_impl(&dword_19E419000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PerformNonUIActivityWithType", "%{public, signpost.description:begin_time}llu activityType=%{public, signpost.telemetry:string1}@", buf, 0x16u);

      }
      share_sheet_log();
      v30 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_signpost_id_make_with_pointer(v31, v5);

      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19E419000, v30, OS_SIGNPOST_INTERVAL_END, v32, "PerformNonUIActivityWithType", " enableTelemetry=YES ", buf, 2u);
      }

    }
    else
    {
      -[SHSheetActivityPerformer presentationController](self, "presentationController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v9;
      v34[1] = 3221225472;
      v34[2] = __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke_69;
      v34[3] = &unk_1E40016A0;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v33, "activityPerformer:presentViewController:completion:", self, v11, v34);

      objc_destroyWeak(&v35);
    }

  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

void __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePresentationCompletion");

}

void __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke_69(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePresentationCompletion");

}

- (void)_handlePresentationCompletion
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  void *v22;
  void (**v23)(_QWORD);
  int v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SHSheetActivityPerformer activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "activityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = (unint64_t)v5;
    v26 = 2114;
    v27 = v3;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Presented view controller:%@ for UI activity %{public}@ (%{public}@)", (uint8_t *)&v24, 0x20u);

  }
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, v3);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = -[SHSheetActivityPerformer beginPerformingActivityTimestamp](self, "beginPerformingActivityTimestamp");
    v24 = 134349056;
    v25 = v10;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformUIActivity", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v24, 0xCu);
  }

  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, v3);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PerformUIActivity", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, v3);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v17 = -[SHSheetActivityPerformer beginPerformingActivityTimestamp](self, "beginPerformingActivityTimestamp");
    objc_msgSend(v3, "activityType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 134349314;
    v25 = v17;
    v26 = 2114;
    v27 = v18;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PerformUIActivityWithType", "%{public, signpost.description:begin_time}llu activityType=%{public, signpost.telemetry:string1}@", (uint8_t *)&v24, 0x16u);

  }
  share_sheet_log();
  v19 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_make_with_pointer(v20, v3);

  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v19, OS_SIGNPOST_INTERVAL_END, v21, "PerformUIActivityWithType", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  -[SHSheetActivityPerformer activityViewController](self, "activityViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_activityPresentationCompletionHandler");
  v23 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v22, "_setActivityPresentationCompletionHandler:", 0);
    v23[2](v23);
  }

}

- (void)_configureActivityBeforePreparation
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  id v25;

  -[SHSheetActivityPerformer activity](self, "activity");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v25;
    -[SHSheetActivityPerformer session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setKeyboardVisible:", objc_msgSend(v4, "showKeyboardAutomatically"));

  }
  objc_msgSend(v25, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message"));

  if (v6)
  {
    v7 = v25;
    -[SHSheetActivityPerformer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "linkMetadataForActivityPerformer:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLinkMetadata:", v9);

    -[SHSheetActivityPerformer session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPeopleSuggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPeopleSuggestion:", v11);

  }
  -[SHSheetActivityPerformer session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsCollaboration");

  if (v13)
  {
    -[SHSheetActivityPerformer session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collaborationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v25, "setCollaborationItem:", v15);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = v25;
      -[SHSheetActivityPerformer session](self, "session");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsCollaborative:", objc_msgSend(v17, "isCollaborative"));

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = v25;
      -[SHSheetActivityPerformer delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collaborationServiceForActivityPerformer:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setCollaborationService:", v20);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "activityType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D975B8]);

      if (v22)
      {
        if (!objc_msgSend(v15, "type"))
        {
          v23 = v25;
          objc_msgSend(v15, "fileURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setOriginalFileURL:", v24);

        }
      }
    }

  }
}

- (void)_configureActivityAfterPreparation
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[SHSheetActivityPerformer activity](self, "activity");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = v17;
    -[SHSheetActivityPerformer session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSessionID:", v5);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v17;
    -[SHSheetActivityPerformer session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityItemsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipientsHandlesForActivity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRecipients:", v9);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SHSheetActivityPerformer session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityItemsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subjectForActivity:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      || (-[SHSheetActivityPerformer activityViewController](self, "activityViewController"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "subject"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12))
    {
      objc_msgSend(v17, "_setMailSubject:", v12);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SHSheetActivityPerformer session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activityItemsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "initialSocialTextForActivity:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setInitialText:", v16);
  }

}

- (BOOL)_enqueueBackgroundOperationsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSUInteger v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  SHSheetActivityPerformer *v32;
  id v33;
  _BYTE buf[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformer activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformer session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityItemsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke;
  v30[3] = &unk_1E4003310;
  v8 = v4;
  v31 = v8;
  v32 = self;
  v9 = v3;
  v33 = v9;
  objc_msgSend(v6, "enumerateBackgroundOperationsForActivity:enumerator:", v8, v30);

  -[SHSheetActivityPerformer activityItemProviderOperationQueue](self, "activityItemProviderOperationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(v9, "copy");
    -[SHSheetActivityPerformer setActivityItemProviderOperations:](self, "setActivityItemProviderOperations:", v11);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetActivityPerformer setBackgroundTaskIdentifier:](self, "setBackgroundTaskIdentifier:", objc_msgSend(v12, "beginBackgroundTaskWithExpirationHandler:", &__block_literal_global_31));

    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[NSOperationQueue operationCount](self->_activityItemProviderOperationQueue, "operationCount");
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "Starting load of %{public}ld activity item providers", buf, 0xCu);
    }

    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_make_with_pointer(v16, self->_activityItemProviderOperationQueue);

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "LoadActivityItemProviders", " enableTelemetry=YES ", buf, 2u);
    }

    share_sheet_log();
    v18 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_make_with_pointer(v19, self->_activityItemProviderOperationQueue);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      objc_msgSend(v8, "activityType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "LoadActivityItemProvidersWithType", "activityType=%{public, signpost.telemetry:string1}@", buf, 0xCu);

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[SHSheetActivityPerformer activityItemProviderOperationQueue](self, "activityItemProviderOperationQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    v26 = 3221225472;
    v27 = __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke_90;
    v28 = &unk_1E40016A0;
    objc_copyWeak(&v29, (id *)buf);
    objc_msgSend(v22, "addOperationWithBlock:", &v25);

    -[SHSheetActivityPerformer activityItemProviderOperationQueue](self, "activityItemProviderOperationQueue", v25, v26, v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSuspended:", 0);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

  return v10 != 0;
}

void __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1[4], "activityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412803;
    v17 = v6;
    v18 = 2113;
    v19 = v5;
    v20 = 2112;
    v21 = v15;
    _os_log_debug_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEBUG, "enumerate background operation:%@ for activityItem:%{private}@ activityType:%@", (uint8_t *)&v16, 0x20u);

  }
  if (objc_msgSend(a1[5], "_shouldExecuteItemOperation:", v6))
  {
    if ((objc_msgSend(v6, "isFinished") & 1) != 0
      || (objc_msgSend(v6, "isExecuting") & 1) != 0
      || (objc_msgSend(*((id *)a1[5] + 10), "operations"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "containsObject:", v6),
          v8,
          (v9 & 1) != 0))
    {
      share_sheet_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138477827;
        v17 = v5;
        _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Warning - UIActivityItemProvider %{private}@ ignored (duplicate, executing or finished)", (uint8_t *)&v16, 0xCu);
      }

    }
    else
    {
      if (!*((_QWORD *)a1[5] + 10))
      {
        v11 = objc_alloc_init(MEMORY[0x1E0CB3828]);
        v12 = a1[5];
        v13 = (void *)v12[10];
        v12[10] = v11;

        objc_msgSend(*((id *)a1[5] + 10), "setName:", CFSTR("com.apple.UIActivityOperationQueue"));
        objc_msgSend(*((id *)a1[5] + 10), "setMaxConcurrentOperationCount:", 1);
        objc_msgSend(*((id *)a1[5] + 10), "setSuspended:", 1);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1[4], "activityType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setActivityType:", v14);

      }
      objc_msgSend(a1[6], "addObject:", v6);
      objc_msgSend(*((id *)a1[5] + 10), "addOperation:", v6);
    }
  }

}

void __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke_90(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinishAllBackgroundOperations");

}

- (BOOL)_shouldExecuteItemOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SHSheetActivityPerformer activity](self, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "_shouldExecuteItemOperationForActivity:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_didFinishAllBackgroundOperations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SHSheetActivityPerformer__didFinishAllBackgroundOperations__block_invoke;
  block[3] = &unk_1E4001608;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__SHSheetActivityPerformer__didFinishAllBackgroundOperations__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityItemProviderOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v3, v4);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v2, OS_SIGNPOST_INTERVAL_END, v5, "LoadActivityItemProviders", " enableTelemetry=YES ", buf, 2u);
  }

  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityItemProviderOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v7, v8);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v6, OS_SIGNPOST_INTERVAL_END, v9, "LoadActivityItemProvidersWithType", " enableTelemetry=YES ", v13, 2u);
  }

  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Finished load of activity item providers", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setActivityItemProviderOperationQueue:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_executeActivity");
}

- (UIActivity)activity
{
  return self->_activity;
}

- (SHSheetSession)session
{
  return (SHSheetSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (SHSheetActivityPerformerDelegate)delegate
{
  return (SHSheetActivityPerformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetActivityPerformerPresentationInterface)presentationController
{
  return (SHSheetActivityPerformerPresentationInterface *)objc_loadWeakRetained((id *)&self->_presentationController);
}

- (void)setPresentationController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationController, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SHSheetActivityPerformerResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (UIActivityViewController)activityViewController
{
  return (UIActivityViewController *)objc_loadWeakRetained((id *)&self->_activityViewController);
}

- (void)setActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_activityViewController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)activityItemProviderOperations
{
  return self->_activityItemProviderOperations;
}

- (void)setActivityItemProviderOperations:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemProviderOperations, a3);
}

- (NSOperationQueue)activityItemProviderOperationQueue
{
  return self->_activityItemProviderOperationQueue;
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (unint64_t)beginPerformingActivityTimestamp
{
  return self->_beginPerformingActivityTimestamp;
}

- (void)setBeginPerformingActivityTimestamp:(unint64_t)a3
{
  self->_beginPerformingActivityTimestamp = a3;
}

- (UIActivityViewController)retainedActivityViewController
{
  return self->_retainedActivityViewController;
}

- (void)setRetainedActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_retainedActivityViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedActivityViewController, 0);
  objc_storeStrong((id *)&self->_activityItemProviderOperationQueue, 0);
  objc_storeStrong((id *)&self->_activityItemProviderOperations, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_presentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
