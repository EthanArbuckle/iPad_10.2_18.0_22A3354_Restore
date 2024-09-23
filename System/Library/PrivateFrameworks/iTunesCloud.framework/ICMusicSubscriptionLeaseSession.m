@implementation ICMusicSubscriptionLeaseSession

- (id)_initWithRequestContext:(id)a3 isDelegatedLeaseSession:(BOOL)a4 delegate:(id)a5 leaseStatus:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICMusicSubscriptionLeaseSession *v13;
  NSRecursiveLock *v14;
  NSRecursiveLock *lock;
  dispatch_queue_t v16;
  OS_dispatch_queue *calloutQueue;
  uint64_t v18;
  ICStoreRequestContext *requestContext;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICMusicSubscriptionLeaseSession;
  v13 = -[ICMusicSubscriptionLeaseSession init](&v21, sel_init);
  if (v13)
  {
    v14 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v13->_lock;
    v13->_lock = v14;

    v16 = dispatch_queue_create("com.apple.iTunesCloud.ICMusicSubscriptionLease.calloutQueue", MEMORY[0x1E0C80D50]);
    calloutQueue = v13->_calloutQueue;
    v13->_calloutQueue = (OS_dispatch_queue *)v16;

    v13->_delegatedLeaseSession = a4;
    v18 = objc_msgSend(v10, "copy");
    requestContext = v13->_requestContext;
    v13->_requestContext = (ICStoreRequestContext *)v18;

    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_leaseStatus, a6);
  }

  return v13;
}

- (void)dealloc
{
  NSObject *automaticRefreshTimerSource;
  OS_dispatch_source *v4;
  objc_super v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  automaticRefreshTimerSource = self->_automaticRefreshTimerSource;
  if (automaticRefreshTimerSource)
  {
    dispatch_source_cancel(automaticRefreshTimerSource);
    v4 = self->_automaticRefreshTimerSource;
    self->_automaticRefreshTimerSource = 0;

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v5.receiver = self;
  v5.super_class = (Class)ICMusicSubscriptionLeaseSession;
  -[ICMusicSubscriptionLeaseSession dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  ICStoreRequestContext *requestContext;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestContext = self->_requestContext;
  -[ICMusicSubscriptionLeaseSession leaseStatus](self, "leaseStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p requestContext: %@; leaseStatus: %@>"),
    v5,
    self,
    requestContext,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ICMusicSubscriptionLeaseStatus)leaseStatus
{
  ICMusicSubscriptionLeaseStatus *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_leaseStatus;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)beginAutomaticallyRefreshingLease
{
  int64_t automaticRefreshCount;

  -[NSRecursiveLock lock](self->_lock, "lock");
  automaticRefreshCount = self->_automaticRefreshCount;
  self->_automaticRefreshCount = automaticRefreshCount + 1;
  if (!automaticRefreshCount)
  {
    -[ICMusicSubscriptionLeaseSession _locked_updateAutomaticRefreshProperties](self, "_locked_updateAutomaticRefreshProperties");
    -[ICMusicSubscriptionLeaseSession _locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady](self, "_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)endAutomaticallyRefreshingLease
{
  int64_t v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_automaticRefreshCount - 1;
  self->_automaticRefreshCount = v3;
  if (!v3)
    -[ICMusicSubscriptionLeaseSession _locked_updateAutomaticRefreshProperties](self, "_locked_updateAutomaticRefreshProperties");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isAutomaticallyRefreshingLease
{
  ICMusicSubscriptionLeaseSession *v2;
  NSRecursiveLock *lock;

  v2 = self;
  -[NSRecursiveLock lock](self->_lock, "lock");
  lock = v2->_lock;
  LOBYTE(v2) = v2->_automaticRefreshCount > 0;
  -[NSRecursiveLock unlock](lock, "unlock");
  return (char)v2;
}

- (NSDate)lastPlaybackRequestDate
{
  NSDate *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = self->_lastPlaybackRequestDate;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)performPlaybackRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  ICMusicSubscriptionLeaseStatus *leaseStatus;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSDate *v21;
  NSDate *lastPlaybackRequestDate;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  ICMusicSubscriptionLeaseSession *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (objc_msgSend(v6, "shouldRequireLeaseAcquisition"))
    v9 = !-[ICMusicSubscriptionLeaseStatus hasPendingLeaseAcquisition](self->_leaseStatus, "hasPendingLeaseAcquisition");
  else
    v9 = 0;
  if ((objc_msgSend(v6, "shouldPreventLeaseAcquisition") & 1) != 0)
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    if (!v9)
    {
LABEL_13:
      objc_msgSend((id)objc_opt_class(), "_sharedOperationQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke;
      v26[3] = &unk_1E438DA90;
      v16 = v8;
      v27 = v16;
      v28 = v7;
      v17 = -[ICMusicSubscriptionLeaseSession _newOperationForPlaybackRequest:completionHandler:](self, "_newOperationForPlaybackRequest:completionHandler:", v6, v26);
      objc_msgSend(v16, "setCancellable:", 1);
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke_2;
      v24[3] = &unk_1E43913D8;
      v18 = v17;
      v25 = v18;
      objc_msgSend(v16, "setCancellationHandler:", v24);
      objc_msgSend(v14, "addOperation:", v18);
      v19 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v14, "operationCount");
        *(_DWORD *)buf = 138543874;
        v30 = self;
        v31 = 2114;
        v32 = v18;
        v33 = 2048;
        v34 = v20;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - performPlaybackRequest - enqueued operation: %{public}@ - operation count: %ld", buf, 0x20u);
      }

      -[NSRecursiveLock lock](self->_lock, "lock");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastPlaybackRequestDate = self->_lastPlaybackRequestDate;
      self->_lastPlaybackRequestDate = v21;

      -[NSRecursiveLock unlock](self->_lock, "unlock");
      goto LABEL_16;
    }
  }
  else
  {
    v10 = -[ICMusicSubscriptionLeaseStatus hasPendingLeaseAcquisition](self->_leaseStatus, "hasPendingLeaseAcquisition");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    if ((v9 & 1) == 0)
    {
      if (v10)
      {
        leaseStatus = self->_leaseStatus;
        self->_startedLeaseAcquisitionRevisionID = self->_pendingLeaseAcquisitionRevisionID;
        if (!-[ICMusicSubscriptionLeaseStatus hasInflightLeaseAcquisition](leaseStatus, "hasInflightLeaseAcquisition"))
        {
          v13 = (void *)-[ICMusicSubscriptionLeaseStatus copy](self->_leaseStatus, "copy");
          objc_msgSend(v13, "setHasInflightLeaseAcquisition:", 1);
          -[NSRecursiveLock lock](self->_lock, "lock");
          -[ICMusicSubscriptionLeaseSession _locked_setLeaseStatus:updatedLeaseExpirationDate:](self, "_locked_setLeaseStatus:updatedLeaseExpirationDate:", v13, 0);
          -[NSRecursiveLock unlock](self->_lock, "unlock");

        }
      }
      goto LABEL_13;
    }
  }
  objc_msgSend(v8, "setCompletedUnitCount:", 1);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7600, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v11);

  }
LABEL_16:

  return v8;
}

- (void)reloadFairPlayKeyStatusWithCompletionHandler:(id)a3
{
  ICMusicSubscriptionLeaseSessionDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "musicLeaseSession:requestsFairPlayKeyStatusUpdateWithCompletion:", self, v5);

}

- (void)_handlePlaybackLeaseDidEndPushNotification
{
  double v3;
  NSDate *v4;
  NSDate *leaseExpirationDate;
  NSObject *v6;
  _BOOL4 hasPendingLeaseDidEndPushNotification;
  int v8;
  ICMusicSubscriptionLeaseSession *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_hasPendingLeaseDidEndPushNotification = 1;
  -[NSDate timeIntervalSinceNow](self->_leaseExpirationDate, "timeIntervalSinceNow");
  if (v3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    leaseExpirationDate = self->_leaseExpirationDate;
    self->_leaseExpirationDate = v4;

  }
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    hasPendingLeaseDidEndPushNotification = self->_hasPendingLeaseDidEndPushNotification;
    v8 = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = hasPendingLeaseDidEndPushNotification;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _handlePlaybackLeaseDidEndPushNotification - _hasPendingLeaseDidEndPushNotification: %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }

  -[ICMusicSubscriptionLeaseSession _locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady](self, "_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_handleRemoteServerDidBecomeLikelyReachable
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  ICMusicSubscriptionLeasePlaybackRequest *v10;
  void *v11;
  id v12;
  int v13;
  ICMusicSubscriptionLeaseSession *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[ICMusicSubscriptionLeaseSession isAutomaticallyRefreshingLease](self, "isAutomaticallyRefreshingLease"))
    return;
  -[ICMusicSubscriptionLeaseSession leaseStatus](self, "leaseStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isWatch") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLowPowerModeEnabled");

  if (!v6)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_7;
  }
  v7 = objc_msgSend(v3, "leaseState") == 0;
LABEL_7:
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "skipping";
    if (v7)
      v9 = "performing";
    v13 = 138543618;
    v14 = self;
    v15 = 2082;
    v16 = v9;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _handleRemoteServerDidBecomeLikelyReachable: %{public}s renewal", (uint8_t *)&v13, 0x16u);
  }

  if (v7)
  {
    v10 = -[ICMusicSubscriptionLeasePlaybackRequest initWithRequestContext:]([ICMusicSubscriptionLeasePlaybackRequest alloc], "initWithRequestContext:", self->_requestContext);
    objc_msgSend((id)objc_opt_class(), "_sharedOperationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICMusicSubscriptionLeaseSession _newOperationForPlaybackRequest:completionHandler:](self, "_newOperationForPlaybackRequest:completionHandler:", v10, &__block_literal_global_23263);
    objc_msgSend(v11, "addOperation:", v12);

  }
}

- (void)_receivedUserInteractionEvent
{
  ICMusicSubscriptionLeaseStatus *leaseStatus;
  void *v4;
  NSObject *v5;
  int v6;
  ICMusicSubscriptionLeaseSession *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  leaseStatus = self->_leaseStatus;
  ++self->_pendingLeaseAcquisitionRevisionID;
  if (!-[ICMusicSubscriptionLeaseStatus hasPendingLeaseAcquisition](leaseStatus, "hasPendingLeaseAcquisition"))
  {
    v4 = (void *)-[ICMusicSubscriptionLeaseStatus copy](self->_leaseStatus, "copy");
    objc_msgSend(v4, "setHasPendingLeaseAcquisition:", 1);
    -[ICMusicSubscriptionLeaseSession _locked_setLeaseStatus:updatedLeaseExpirationDate:](self, "_locked_setLeaseStatus:updatedLeaseExpirationDate:", v4, 0);
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = self;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _receivedUserInteractionEvent - leaseStatus: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_setLeaseStatus:(id)a3 updatedLeaseExpirationDate:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[ICMusicSubscriptionLeaseSession _locked_setLeaseStatus:updatedLeaseExpirationDate:](self, "_locked_setLeaseStatus:updatedLeaseExpirationDate:", v7, v6);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)_newOperationForPlaybackRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  ICAsyncBlockOperation *v8;
  id v9;
  id v10;
  ICAsyncBlockOperation *v11;
  _QWORD v13[4];
  id v14;
  ICMusicSubscriptionLeaseSession *v15;
  id v16;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = [ICAsyncBlockOperation alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E438FB60;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  v11 = -[ICAsyncBlockOperation initWithStartHandler:](v8, "initWithStartHandler:", v13);

  return v11;
}

- (void)_locked_performAutomaticRefresh
{
  NSObject *automaticRefreshTimerSource;
  OS_dispatch_source *v4;
  ICMusicSubscriptionLeasePlaybackRequest *v5;
  void *v6;
  ICMusicSubscriptionLeasePlaybackRequest *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  if (!self->_isPerformingAutomaticRefresh)
  {
    automaticRefreshTimerSource = self->_automaticRefreshTimerSource;
    if (automaticRefreshTimerSource)
    {
      dispatch_source_cancel(automaticRefreshTimerSource);
      v4 = self->_automaticRefreshTimerSource;
      self->_automaticRefreshTimerSource = 0;

    }
    objc_initWeak(&location, self);
    self->_isPerformingAutomaticRefresh = 1;
    v5 = [ICMusicSubscriptionLeasePlaybackRequest alloc];
    -[ICMusicSubscriptionLeaseSession requestContext](self, "requestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICMusicSubscriptionLeasePlaybackRequest initWithRequestContext:](v5, "initWithRequestContext:", v6);

    -[ICMusicSubscriptionLeasePlaybackRequest setShouldPreventLeaseAcquisition:](v7, "setShouldPreventLeaseAcquisition:", 1);
    objc_msgSend((id)objc_opt_class(), "_sharedOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __66__ICMusicSubscriptionLeaseSession__locked_performAutomaticRefresh__block_invoke;
    v13 = &unk_1E438DB98;
    objc_copyWeak(&v14, &location);
    v9 = -[ICMusicSubscriptionLeaseSession _newOperationForPlaybackRequest:completionHandler:](self, "_newOperationForPlaybackRequest:completionHandler:", v7, &v10);
    objc_msgSend(v8, "addOperation:", v9, v10, v11, v12, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_locked_setLeaseStatus:(id)a3 updatedLeaseExpirationDate:(id)a4
{
  ICMusicSubscriptionLeaseStatus *v7;
  id v8;
  ICMusicSubscriptionLeaseStatus *leaseStatus;
  int v10;
  NSDate *v11;
  NSDate *leaseExpirationDate;
  NSObject *calloutQueue;
  _QWORD block[5];

  v7 = (ICMusicSubscriptionLeaseStatus *)a3;
  v8 = a4;
  leaseStatus = self->_leaseStatus;
  if (leaseStatus == v7 || -[ICMusicSubscriptionLeaseStatus isEqual:](leaseStatus, "isEqual:", v7))
  {
    v10 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_leaseStatus, a3);
    v10 = 1;
  }
  if (-[ICMusicSubscriptionLeaseStatus hasOnlinePlaybackKeys](self->_leaseStatus, "hasOnlinePlaybackKeys"))
  {
    if (!v8)
      goto LABEL_10;
    v11 = (NSDate *)objc_msgSend(v8, "copy");
    leaseExpirationDate = self->_leaseExpirationDate;
    self->_leaseExpirationDate = v11;
  }
  else
  {
    leaseExpirationDate = self->_leaseExpirationDate;
    self->_leaseExpirationDate = 0;
  }

LABEL_10:
  -[ICMusicSubscriptionLeaseSession _locked_updateAutomaticRefreshProperties](self, "_locked_updateAutomaticRefreshProperties");
  if (v10)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__ICMusicSubscriptionLeaseSession__locked_setLeaseStatus_updatedLeaseExpirationDate___block_invoke;
    block[3] = &unk_1E43913D8;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }

}

- (void)_locked_updateAutomaticRefreshProperties
{
  OS_dispatch_source *automaticRefreshTimerSource;
  OS_dispatch_source *v4;
  NSDate *leaseExpirationDate;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD handler[4];
  id v21;
  uint8_t buf[4];
  ICMusicSubscriptionLeaseSession *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  automaticRefreshTimerSource = self->_automaticRefreshTimerSource;
  if (automaticRefreshTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)self->_automaticRefreshTimerSource);
    v4 = self->_automaticRefreshTimerSource;
    self->_automaticRefreshTimerSource = 0;

  }
  if (self->_automaticRefreshCount >= 1
    && -[ICMusicSubscriptionLeaseStatus hasOnlinePlaybackKeys](self->_leaseStatus, "hasOnlinePlaybackKeys")
    && (leaseExpirationDate = self->_leaseExpirationDate) != 0)
  {
    -[NSDate timeIntervalSinceNow](leaseExpirationDate, "timeIntervalSinceNow");
    v7 = v6;
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      v24 = 2048;
      v25 = v7;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - Automatic lease refresh timer enabled with time left: %f.", buf, 0x16u);
    }

    if (v7 < 1.0)
    {
      if (self->_lastLeaseAcquisitionAttempt)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", self->_lastLeaseAcquisitionAttempt);
        v11 = v10;

        if (v11 < 120.0)
        {
          v7 = 120.0 - v11;
          v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v23 = self;
            v24 = 2048;
            v25 = 120.0 - v11;
            _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - Delaying lease refresh for %fs due to recent attempts", buf, 0x16u);
          }

        }
      }
    }
    if (v7 >= 1.0)
    {
      if (!self->_isPerformingAutomaticRefresh)
      {
        dispatch_get_global_queue(0, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);
        v16 = self->_automaticRefreshTimerSource;
        self->_automaticRefreshTimerSource = v15;

        v17 = self->_automaticRefreshTimerSource;
        v18 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
        objc_initWeak((id *)buf, self);
        v19 = self->_automaticRefreshTimerSource;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __75__ICMusicSubscriptionLeaseSession__locked_updateAutomaticRefreshProperties__block_invoke;
        handler[3] = &unk_1E4391400;
        objc_copyWeak(&v21, (id *)buf);
        dispatch_source_set_event_handler(v19, handler);
        dispatch_resume((dispatch_object_t)self->_automaticRefreshTimerSource);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      -[ICMusicSubscriptionLeaseSession _locked_performAutomaticRefresh](self, "_locked_performAutomaticRefresh");
    }
  }
  else if (automaticRefreshTimerSource)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - Automatic lease refresh timer disabled.", buf, 0xCu);
    }

  }
}

- (void)_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady
{
  ICMusicSubscriptionLeasePlaybackRequest *v3;
  const char *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  ICMusicSubscriptionLeaseSession *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_hasPendingLeaseDidEndPushNotification)
  {
    if (self->_automaticRefreshCount)
    {
      if (-[ICMusicSubscriptionLeaseStatus hasInflightLeaseAcquisition](self->_leaseStatus, "hasInflightLeaseAcquisition"))
      {
        v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v10 = self;
          v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Deferred until the in-flight lease acquisi"
               "tion completed [hasInflightLeaseAcquisition:YES]";
LABEL_16:
          _os_log_impl(&dword_1A03E3000, &v3->super, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
        }
      }
      else
      {
        self->_hasPendingLeaseDidEndPushNotification = 0;
        if (-[ICMusicSubscriptionLeaseStatus hasOnlinePlaybackKeys](self->_leaseStatus, "hasOnlinePlaybackKeys"))
        {
          v3 = -[ICMusicSubscriptionLeasePlaybackRequest initWithRequestContext:]([ICMusicSubscriptionLeasePlaybackRequest alloc], "initWithRequestContext:", self->_requestContext);
          -[ICMusicSubscriptionLeasePlaybackRequest setShouldPreventLeaseAcquisition:](v3, "setShouldPreventLeaseAcquisition:", 1);
          -[ICMusicSubscriptionLeasePlaybackRequest setTriggeredByLeasePrevention:](v3, "setTriggeredByLeasePrevention:", 1);
          objc_msgSend((id)objc_opt_class(), "_sharedOperationQueue");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __98__ICMusicSubscriptionLeaseSession__locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady__block_invoke;
          v8[3] = &unk_1E438DBC0;
          v8[4] = self;
          v6 = -[ICMusicSubscriptionLeaseSession _newOperationForPlaybackRequest:completionHandler:](self, "_newOperationForPlaybackRequest:completionHandler:", v3, v8);
          objc_msgSend(v5, "addOperation:", v6);
          v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v10 = self;
            _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Handled", buf, 0xCu);
          }

        }
        else
        {
          v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
          if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v10 = self;
            v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Dropped [hasOnlinePlaybackKeys:NO]";
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
      v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v10 = self;
        v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Deferred until refresh timer gets activated "
             "[_automaticRefreshCount:0]";
        goto LABEL_16;
      }
    }
  }
  else
  {
    v3 = (ICMusicSubscriptionLeasePlaybackRequest *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      v4 = "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Dropped [_hasPendingLeaseDidEndPushNotification:NO]";
      goto LABEL_16;
    }
  }

}

- (BOOL)isDelegatedLeaseSession
{
  return self->_delegatedLeaseSession;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (NSDate)leaseExpirationDate
{
  return self->_leaseExpirationDate;
}

- (ICMusicSubscriptionLeaseSessionDelegate)delegate
{
  return (ICMusicSubscriptionLeaseSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_leaseExpirationDate, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_lastLeaseAcquisitionAttempt, 0);
  objc_storeStrong((id *)&self->_lastPlaybackRequestDate, 0);
  objc_storeStrong((id *)&self->_leaseStatus, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_automaticRefreshTimerSource, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __98__ICMusicSubscriptionLeaseSession__locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Completed error=%{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - PlaybackLeaseDidEndPushNotification - Completed", (uint8_t *)&v11, 0xCu);
  }

}

void __75__ICMusicSubscriptionLeaseSession__locked_updateAutomaticRefreshProperties__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "lock");
    objc_msgSend(v2, "_locked_updateAutomaticRefreshProperties");
    objc_msgSend(v2[1], "unlock");
    WeakRetained = v2;
  }

}

void __85__ICMusicSubscriptionLeaseSession__locked_setLeaseStatus_updatedLeaseExpirationDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", ICMusicSubscriptionLeaseSessionLeaseStatusDidChangeNotification, *(_QWORD *)(a1 + 32));

}

void __66__ICMusicSubscriptionLeaseSession__locked_performAutomaticRefresh__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "lock");
    *((_BYTE *)v2 + 40) = 0;
    objc_msgSend(v2, "_locked_updateAutomaticRefreshProperties");
    objc_msgSend(v2[1], "unlock");
    WeakRetained = v2;
  }

}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  ICMusicSubscriptionPlaybackRequestOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  ICMusicSubscriptionPlaybackRequestOperation *v29;
  void *v30;
  _QWORD v31[4];
  ICMusicSubscriptionPlaybackRequestOperation *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 *v38;
  id v39;
  id v40;
  id from;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 *p_buf;
  id v46;
  id location;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  id v54;
  __int128 buf;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isCancelled"))
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "[AL] - ICMusicSubscriptionPlaybackRequestOperation canceled - request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v6 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2938];
    v59[0] = CFSTR("Playback request operation was canceled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = a1[6];
    v10 = *((_QWORD *)a1[5] + 4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_25;
    block[3] = &unk_1E4390EF8;
    v53 = v8;
    v54 = v9;
    v11 = v8;
    dispatch_async(v10, block);
    objc_msgSend(v3, "finishWithError:", v11);

    v12 = &v54;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setQualityOfService:", objc_msgSend(v14, "qualityOfService"));

    objc_msgSend(v13, "setName:", CFSTR("com.apple.iTunesCloud.ICMusicSubscriptionLeaseSession.innerOperationQueue"));
    v15 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2;
    v48[3] = &unk_1E438DAF8;
    v16 = a1[6];
    v17 = a1[5];
    v51 = v16;
    v48[4] = v17;
    v18 = v3;
    v49 = v18;
    v11 = v13;
    v50 = v11;
    v30 = (void *)MEMORY[0x1A1AFA8D0](v48);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)a1[5] + 11);
    *((_QWORD *)a1[5] + 11) = v19;

    v21 = objc_alloc_init(ICMusicSubscriptionPlaybackRequestOperation);
    objc_msgSend(a1[4], "assetSourceStorefrontID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicSubscriptionPlaybackRequestOperation setAssetSourceStorefrontID:](v21, "setAssetSourceStorefrontID:", v22);

    -[ICMusicSubscriptionPlaybackRequestOperation setStoreCloudID:](v21, "setStoreCloudID:", objc_msgSend(a1[4], "storeCloudID"));
    -[ICMusicSubscriptionPlaybackRequestOperation setStoreSubscriptionAdamID:](v21, "setStoreSubscriptionAdamID:", objc_msgSend(a1[4], "storeSubscriptionAdamID"));
    -[ICMusicSubscriptionPlaybackRequestOperation setStorePurchasedAdamID:](v21, "setStorePurchasedAdamID:", objc_msgSend(a1[4], "storePurchasedAdamID"));
    objc_msgSend(a1[4], "cloudUniversalLibraryID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicSubscriptionPlaybackRequestOperation setCloudUniversalLibraryID:](v21, "setCloudUniversalLibraryID:", v23);

    -[ICMusicSubscriptionPlaybackRequestOperation setDelegatedPlayback:](v21, "setDelegatedPlayback:", *((unsigned __int8 *)a1[5] + 96));
    -[ICMusicSubscriptionPlaybackRequestOperation setFollowUp:](v21, "setFollowUp:", objc_msgSend(a1[4], "isFollowUp"));
    objc_msgSend(a1[4], "requestContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMusicSubscriptionPlaybackRequestOperation setRequestContext:](v21, "setRequestContext:", v24);

    objc_initWeak(&location, a1[5]);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v56 = 0x2020000000;
    v57 = 0;
    v42[0] = v15;
    v42[1] = 3221225472;
    v42[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_4;
    v42[3] = &unk_1E438DB20;
    v43 = a1[4];
    objc_copyWeak(&v46, &location);
    v44 = a1[5];
    p_buf = &buf;
    -[ICMusicSubscriptionPlaybackRequestOperation setWillBeginExecutionHandler:](v21, "setWillBeginExecutionHandler:", v42);
    objc_initWeak(&from, v21);
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_31;
    v33[3] = &unk_1E438DB70;
    v25 = v18;
    v34 = v25;
    objc_copyWeak(&v39, &from);
    objc_copyWeak(&v40, &location);
    v26 = a1[4];
    v38 = &buf;
    v27 = a1[5];
    v35 = v26;
    v36 = v27;
    v28 = v30;
    v37 = v28;
    -[ICMusicSubscriptionPlaybackRequestOperation setResponseHandler:](v21, "setResponseHandler:", v33);
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_35;
    v31[3] = &unk_1E43913D8;
    v29 = v21;
    v32 = v29;
    objc_msgSend(v25, "setCancellationHandler:", v31);
    objc_msgSend(v11, "addOperation:", v29);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);

    objc_destroyWeak(&from);
    objc_destroyWeak(&v46);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&location);

    v12 = &v51;
  }

}

uint64_t __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 56);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_3;
    v15 = &unk_1E4390EA8;
    v19 = v10;
    v16 = v7;
    v17 = v8;
    v18 = v9;
    dispatch_async(v11, &v12);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9, v12, v13, v14, v15);

}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldPreventLeaseAcquisition") & 1) != 0
    || (WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56))) == 0)
  {
    v7 = 1;
  }
  else
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[1], "lock");
    v6 = objc_msgSend(v5[6], "hasPendingLeaseAcquisition");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5[7];
    objc_msgSend(v5[1], "unlock");

    if (v6)
      v7 = 2;
    else
      v7 = 1;
  }
  objc_msgSend(v3, "setRequestType:", v7);
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1 + 32;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(v11 + 8);
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v9;
    v16 = 2048;
    v17 = objc_msgSend(v3, "requestType");
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _newOperationForPlaybackRequest - Will start playback request operation - Request: %{public}@ - Type: %ld", (uint8_t *)&v12, 0x20u);
  }

}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  int8x16_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  int8x16_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "setCancellationHandler:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v14 = objc_msgSend(WeakRetained, "requestType");

  v15 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v15, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v23 = *(_QWORD *)(a1 + 40);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2_32;
    v24[3] = &unk_1E438DB48;
    v25 = v15;
    v17 = v10;
    v18 = v9;
    v19 = *(_QWORD *)(a1 + 64);
    v26 = v18;
    v31 = v19;
    v32 = v14;
    v22 = *(int8x16_t *)(a1 + 40);
    v20 = (id)v22.i64[0];
    v27 = vextq_s8(v22, v22, 8uLL);
    v30 = *(id *)(a1 + 56);
    v28 = v11;
    v29 = v12;
    v21 = v18;
    v10 = v17;
    objc_msgSend(v16, "musicLeaseSession:didFinishPlaybackRequest:withPlaybackResponse:responseError:updatedFairPlayKeyStatusList:completionHandler:", v25, v23, v21, v29, v17, v24);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_2_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(*(id *)(v7 + 8), "lock");
    if (*(_QWORD *)(a1 + 40))
    {
      if (*(_QWORD *)(a1 + 96) == 2)
      {
        v8 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v8 + 56) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        {
          if (objc_msgSend(*(id *)(v8 + 48), "hasPendingLeaseAcquisition"))
            objc_msgSend(v6, "setHasPendingLeaseAcquisition:", 0);
        }
      }
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (v9 <= v10)
      objc_msgSend(v6, "setHasInflightLeaseAcquisition:", 0);
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 96);
      v15 = 138544130;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "[Lease] - [%{public}@] - _newOperationForPlaybackRequest - Completed playback request operation - Request: %{public}@ - Type: %ld - status: %{public}@", (uint8_t *)&v15, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 32), "_locked_setLeaseStatus:updatedLeaseExpirationDate:", v6, v5);
    if (v9 <= v10)
      objc_msgSend(*(id *)(a1 + 32), "_locked_handlePendingPlaybackLeaseDidEndPushNotificationIfReady");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

uint64_t __85__ICMusicSubscriptionLeaseSession__newOperationForPlaybackRequest_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "setCompletedUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCancellationHandler:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__ICMusicSubscriptionLeaseSession_performPlaybackRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

+ (id)_sharedOperationQueue
{
  if (_sharedOperationQueue_sOnceToken != -1)
    dispatch_once(&_sharedOperationQueue_sOnceToken, &__block_literal_global_17);
  return (id)_sharedOperationQueue_sOperationQueue;
}

uint64_t __56__ICMusicSubscriptionLeaseSession__sharedOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_sharedOperationQueue_sOperationQueue;
  _sharedOperationQueue_sOperationQueue = (uint64_t)v0;

  objc_msgSend((id)_sharedOperationQueue_sOperationQueue, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)_sharedOperationQueue_sOperationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICMusicSubscriptionLeaseSession.operationQueue"));
  return objc_msgSend((id)_sharedOperationQueue_sOperationQueue, "setQualityOfService:", 25);
}

@end
