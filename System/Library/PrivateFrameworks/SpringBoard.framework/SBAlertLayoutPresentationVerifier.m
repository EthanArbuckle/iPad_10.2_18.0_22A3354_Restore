@implementation SBAlertLayoutPresentationVerifier

- (uint64_t)_hasBrokenWindowInvariants
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL4 v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double MidX;
  double v29;
  int v30;
  NSObject *v31;
  _DWORD v32[2];
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 24);
    if (result)
    {
      objc_msgSend((id)result, "screen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(v1 + 40);

      objc_msgSend(*(id *)(v1 + 24), "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      objc_msgSend(*(id *)(v1 + 40), "bounds");
      v41.origin.x = v12;
      v41.origin.y = v13;
      v41.size.width = v14;
      v41.size.height = v15;
      v38.origin.x = v5;
      v38.origin.y = v7;
      v38.size.width = v9;
      v38.size.height = v11;
      v16 = CGRectEqualToRect(v38, v41);
      v17 = objc_msgSend(*(id *)(v1 + 24), "isHidden") | v16;
      if (v2 == v3)
      {
        objc_msgSend(*(id *)(v1 + 40), "coordinateSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 24), "bounds");
        objc_msgSend(v19, "convertRect:fromCoordinateSpace:", *(_QWORD *)(v1 + 24));
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        v39.origin.x = v21;
        v39.origin.y = v23;
        v39.size.width = v25;
        v39.size.height = v27;
        MidX = CGRectGetMidX(v39);
        objc_msgSend(*(id *)(v1 + 40), "bounds");
        v29 = vabdd_f64(MidX, CGRectGetMidX(v40));
        v30 = objc_msgSend(*(id *)(v1 + 24), "isHidden");
        if (v29 < 1.0)
          v18 = 1;
        else
          v18 = v30;
        if ((v17 & v18 & 1) != 0)
          return 0;
      }
      else
      {
        v18 = 0;
      }
      SBLogAlertItems();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32[0] = 67109632;
        v32[1] = v2 == v3;
        v33 = 1024;
        v34 = v17;
        v35 = 1024;
        v36 = v18;
        _os_log_error_impl(&dword_1D0540000, v31, OS_LOG_TYPE_ERROR, "Alert window invariants broken. correctScreenPresentation:%{BOOL}i correctBounds:%{BOOL}i correctXLayout:%{BOOL}i", (uint8_t *)v32, 0x14u);
      }

      return 1;
    }
  }
  return result;
}

uint64_t __78__SBAlertLayoutPresentationVerifier_scheduleAlertLayoutVerificationForReason___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentState");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    *(_BYTE *)(v3 + 8) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "scheduleAlertLayoutVerificationForReason:", CFSTR("Rescheduling for later when not in a transaction."));
  }
  else
  {
    -[SBAlertLayoutPresentationVerifier _performLayoutVerification](v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  }
}

- (void)_performLayoutVerification
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Alert layout appears correct.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (uint64_t)_hasBrokenHostingLayerInvariants
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  float64x2_t v17;
  NSObject *v18;
  void *v20;
  void *v21;
  CGPoint point;
  CGFloat v23;
  double MidX;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  v1 = a1;
  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 24), "_scene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "sceneWithIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "uiPresentationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultPresentationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layerPresentationOverrides");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA930], "targetForUIWindow:", *(_QWORD *)(v1 + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transformer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
      if (v11)
      {
        objc_msgSend(v11, "transform");
      }
      else
      {
        v25 = *(float64x2_t *)MEMORY[0x1E0C9BAA8];
        v26 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
        v27 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      objc_msgSend(*(id *)(v1 + 24), "bounds");
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
      MidX = CGRectGetMidX(v34);
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      MidY = CGRectGetMidY(v35);
      v17 = vaddq_f64(v27, vmlaq_n_f64(vmulq_n_f64(v26, MidY), v25, MidX));
      v1 = MidX != v17.f64[0];
      if (MidX != v17.f64[0])
      {
        point = (CGPoint)v17;
        v23 = MidY;
        SBLogAlertItems();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v33.y = v23;
          v33.x = MidX;
          NSStringFromCGPoint(v33);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCGPoint(point);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v29 = v20;
          v30 = 2114;
          v31 = v21;
          _os_log_error_impl(&dword_1D0540000, v18, OS_LOG_TYPE_ERROR, "Alert window hosting layer has misaligned transform. Layer midpoint: %{public}@. Transformed midpoint:  %{public}@", buf, 0x16u);

        }
      }

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)_hasBrokenAlertPresentationInvariants
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double MidX;
  double v29;
  CGRect v30;
  CGRect v31;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "currentlyPresentedAlertItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "alertController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "window");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isHidden");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v5, "window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(v1 + 24);

          v14 = *(void **)(v1 + 40);
          objc_msgSend(*(id *)(v1 + 24), "screen");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 != v15)
          {
            v16 = 0;
LABEL_7:
            SBLogAlertItems();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[SBAlertLayoutPresentationVerifier _hasBrokenAlertPresentationInvariants].cold.1(v12 == v13, v16, v17);

            v1 = 1;
            goto LABEL_12;
          }
          objc_msgSend(*(id *)(v1 + 40), "coordinateSpace");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bounds");
          objc_msgSend(v19, "convertRect:fromCoordinateSpace:", v5);
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;

          v30.origin.x = v21;
          v30.origin.y = v23;
          v30.size.width = v25;
          v30.size.height = v27;
          MidX = CGRectGetMidX(v30);
          objc_msgSend(*(id *)(v1 + 40), "bounds");
          v29 = vabdd_f64(MidX, CGRectGetMidX(v31));
          v16 = v29 < 1.0;
          if (v12 != v13 || v29 >= 1.0)
            goto LABEL_7;
        }
      }
      else
      {

      }
    }
    v1 = 0;
LABEL_12:

  }
  return v1;
}

- (void)activeInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Will change to orientation %li"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAlertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:](self, "scheduleAlertLayoutVerificationForReason:", v4);

}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did change from orientation %li to orientation %li"), a4, a5, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAlertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:](self, "scheduleAlertLayoutVerificationForReason:", v6);

}

- (void)scheduleAlertLayoutVerificationForReason:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertLayoutPresentationVerifier.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableArray addObject:](self->_updateReasons, "addObject:", v5);
  if (!self->_pendingLayoutVerification)
  {
    self->_pendingLayoutVerification = 1;
    v6 = (void *)*MEMORY[0x1E0CEB258];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__SBAlertLayoutPresentationVerifier_scheduleAlertLayoutVerificationForReason___block_invoke;
    v8[3] = &unk_1E8E9DED8;
    v8[4] = self;
    objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v8);
  }

}

- (SBAlertLayoutPresentationVerifier)initWithScreen:(id)a3
{
  id v5;
  SBAlertLayoutPresentationVerifier *v6;
  NSMutableArray *v7;
  NSMutableArray *updateReasons;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAlertLayoutPresentationVerifier;
  v6 = -[SBAlertLayoutPresentationVerifier init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    updateReasons = v6->_updateReasons;
    v6->_updateReasons = v7;

    v6->_firstLogEventTime = -1.79769313e308;
    objc_storeStrong((id *)&v6->_screen, a3);
    v6->_lastAutoBugCaptureEventTime = 0.0;
    objc_msgSend((id)SBApp, "addActiveOrientationObserver:", v6);
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v6);

    +[SBAlertLayoutPresentationVerifier _handleTrackingStateChange]();
    -[SBAlertLayoutPresentationVerifier addVerifier:]((uint64_t)v6, v6);
  }

  return v6;
}

+ (void)_handleTrackingStateChange
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __isReportingBadPositions = objc_msgSend(v0, "BOOLForKey:", CFSTR("SBTrackAlertWindowPosition"));

  os_unfair_lock_lock((os_unfair_lock_t)&__verifierLock);
  +[SBAlertLayoutPresentationVerifier __lock_verifiers]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)&__verifierLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(*(id *)(v8 + 48), "invalidate");
          v9 = *(void **)(v8 + 48);
          *(_QWORD *)(v8 + 48) = 0;

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  if (__isReportingBadPositions)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[SBAlertLayoutPresentationVerifier _startTrackingBadPositions](*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

- (void)addVerifier:(uint64_t)a1
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)&__verifierLock);
    +[SBAlertLayoutPresentationVerifier __lock_verifiers]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v2);

    os_unfair_lock_unlock((os_unfair_lock_t)&__verifierLock);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBAlertLayoutPresentationVerifier removeVerifier:]((uint64_t)self, self);
  -[NSTimer invalidate](self->_bugCaptureTimer, "invalidate");
  objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBAlertLayoutPresentationVerifier;
  -[SBAlertLayoutPresentationVerifier dealloc](&v4, sel_dealloc);
}

- (void)removeVerifier:(uint64_t)a1
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)&__verifierLock);
    +[SBAlertLayoutPresentationVerifier __lock_verifiers]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

    os_unfair_lock_unlock((os_unfair_lock_t)&__verifierLock);
  }
}

- (void)setAlertItemWindow:(id)a3
{
  objc_storeStrong((id *)&self->_alertWindow, a3);
}

- (void)setAlertPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_alertPresenter, a3);
}

- (void)scheduleDelayedAlertLayoutVerificationForReason:(id)a3
{
  id v5;
  dispatch_time_t v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertLayoutPresentationVerifier.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_pendingScheduledLayoutVerification)
  {
    -[NSMutableArray addObject:](self->_updateReasons, "addObject:", v5);
  }
  else
  {
    self->_pendingScheduledLayoutVerification = 1;
    v6 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__SBAlertLayoutPresentationVerifier_scheduleDelayedAlertLayoutVerificationForReason___block_invoke;
    block[3] = &unk_1E8E9E820;
    block[4] = self;
    v10 = v5;
    v7 = (void *)MEMORY[0x1E0C80D38];
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __85__SBAlertLayoutPresentationVerifier_scheduleDelayedAlertLayoutVerificationForReason___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "scheduleAlertLayoutVerificationForReason:", *(_QWORD *)(a1 + 40));
}

+ (id)__lock_verifiers
{
  objc_opt_self();
  if (__lock_verifiers_once != -1)
    dispatch_once(&__lock_verifiers_once, &__block_literal_global_273);
  return (id)__lock_verifiers_lock_verifiers;
}

void __53__SBAlertLayoutPresentationVerifier___lock_verifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 5);
  v1 = (void *)__lock_verifiers_lock_verifiers;
  __lock_verifiers_lock_verifiers = v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SBTrackAlertWindowPreferencesChangedHandler, CFSTR("com.apple.springboard.trackAlertWindowPositionPrefsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopTrackingBadPositions
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    v2 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

  }
}

- (void)_startTrackingBadPositions
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v2 = (void *)MEMORY[0x1E0C99E88];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__SBAlertLayoutPresentationVerifier__startTrackingBadPositions__block_invoke;
    v5[3] = &unk_1E8E9FA90;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v2, "scheduledTimerWithTimeInterval:repeats:block:", 1, v5, 5.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)val + 6);
    *((_QWORD *)val + 6) = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __63__SBAlertLayoutPresentationVerifier__startTrackingBadPositions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scheduleAlertLayoutVerificationForReason:", CFSTR("timer"));

}

- (void)_logToAutoBugCapture
{
  double v2;
  double v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (__isReportingBadPositions)
    {
      v2 = *(double *)(a1 + 56);
      if (v2 == 0.0 || (BSContinuousMachTimeNow(), v3 - *(double *)(a1 + 56) >= 300.0))
      {
        BSContinuousMachTimeNow();
        *(_QWORD *)(a1 + 56) = v4;
        v5 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "processName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("SpringBoard"), CFSTR("AlertLayout"), CFSTR("PositionVerifier"), 0, v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = *MEMORY[0x1E0DAFF50];
        v12[0] = *MEMORY[0x1E0DAFF60];
        v12[1] = v9;
        v13[0] = MEMORY[0x1E0C9AAA0];
        v13[1] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke;
        v11[3] = &unk_1E8EB7A20;
        v11[4] = a1;
        *(double *)&v11[5] = v2;
        objc_msgSend(v5, "snapshotWithSignature:duration:events:payload:actions:reply:", v8, MEMORY[0x1E0C9AA60], 0, v10, v11, 0.0);

      }
    }
  }
}

void __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _QWORD *v5;
  _QWORD block[6];
  _QWORD v7[5];

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_2;
    v7[3] = &unk_1E8E9DED8;
    v7[4] = *(_QWORD *)(a1 + 32);
    v5 = v7;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_3;
    block[3] = &unk_1E8E9DE88;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = *(_QWORD *)(a1 + 40);
    v5 = block;
  }
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

uint64_t __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = BSContinuousMachTimeNow();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v3;
  return result;
}

double __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_3(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

- (void)_logAlertItemLayout
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "Broken invariant in alert item layout.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (uint64_t)_fixAlertItemLayout
{
  uint64_t v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];
  CGRect v17;
  CGRect v18;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 24), "frame");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(*(id *)(v1 + 40), "bounds");
    v18.origin.x = v10;
    v18.origin.y = v11;
    v18.size.width = v12;
    v18.size.height = v13;
    v17.origin.x = v3;
    v17.origin.y = v5;
    v17.size.width = v7;
    v17.size.height = v9;
    result = CGRectEqualToRect(v17, v18);
    if ((result & 1) == 0)
    {
      SBLogAlertItems();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Broken alert layout getting fixed", v16, 2u);
      }

      v15 = *(void **)(v1 + 24);
      objc_msgSend(*(id *)(v1 + 40), "bounds");
      return objc_msgSend(v15, "setFrame:");
    }
  }
  return result;
}

- (void)handleReachabilityYOffsetDidChange
{
  -[SBAlertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:](self, "scheduleAlertLayoutVerificationForReason:", CFSTR("Reachability update"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bugCaptureTimer, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_destroyWeak((id *)&self->_alertPresenter);
  objc_storeStrong((id *)&self->_alertWindow, 0);
  objc_storeStrong((id *)&self->_updateReasons, 0);
}

- (void)_hasBrokenAlertPresentationInvariants
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Alert layout invariants broken. correctScreenPresentation:%{BOOL}i correctXLayout:%{BOOL}i", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_2_0();
}

@end
