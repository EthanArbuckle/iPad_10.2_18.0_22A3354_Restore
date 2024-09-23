@implementation VUIRentalExpirationMonitor

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_87(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D512C8]);
  objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPersistentID:inLibrary:", a2, v5);

  if (v6)
  {
    objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D50F88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_10;
    objc_msgSend(v7, "doubleValue");
    if (v9 == 0.0)
      goto LABEL_10;
    v10 = (void *)sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      v12 = v10;
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Found rental that will expire on %@", (uint8_t *)&v20, 0xCu);

    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(_QWORD *)(v14 + 40);
    v15 = (id *)(v14 + 40);
    if (v16)
    {
      objc_msgSend(v8, "doubleValue");
      v18 = v17;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "doubleValue");
      if (v18 >= v19)
      {
LABEL_10:

        goto LABEL_11;
      }
      v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_storeStrong(v15, v8);
    goto LABEL_10;
  }
LABEL_11:

}

id __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (void *)MEMORY[0x1E0D51218];
    v8 = *MEMORY[0x1E0D50F88];
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithProperty:value:comparison:", v8, v10, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D51218];
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithProperty:value:comparison:", v8, v14, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", *MEMORY[0x1E0D50EE0], 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D511D8];
    v33[0] = v11;
    v33[1] = v15;
    v33[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateMatchingPredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D512C8];
    objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "queryWithLibrary:predicate:orderingTerms:", v21, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setIgnoreSystemFilterPredicates:", 1);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512A0]), "initWithQuery:", v22);

  }
  else
  {
    v24 = sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_ERROR))
      __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    v23 = 0;
  }

  return v23;
}

- (void)setDateOfLastRentalExpirationHandling:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastRentalExpirationHandling, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (VUIRentalExpirationMonitor)init
{
  VUIRentalExpirationMonitor *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  uint64_t v6;
  TVPStateMachine *stateMachine;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VUIRentalExpirationMonitor;
  v2 = -[VUIRentalExpirationMonitor init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), objc_opt_class());
    v4 = dispatch_queue_create("com.apple.VideosUI.VUIRentalExpirationMonitor", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB1978]), "initWithName:initialState:mode:", v3, CFSTR("Idle"), 0);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v6;

    -[TVPStateMachine setLogObject:](v2->_stateMachine, "setLogObject:", sLogObject_19);
    -[VUIRentalExpirationMonitor _registerStateMachineHandlers](v2, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v2->_stateMachine, "setShouldAcceptEvents:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC6AB0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__isPlaybackUIBeingShownDidChange_, v10, v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D50B00];
    objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__libraryContentsDidChange_, v13, v14);

  }
  return v2;
}

- (NSDate)dateOfLastRentalExpirationHandling
{
  return self->_dateOfLastRentalExpirationHandling;
}

- (void)_registerStateMachineHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38;
  id location;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[VUIRentalExpirationMonitor stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3;
  aBlock[3] = &unk_1E9FA1A30;
  objc_copyWeak(&v38, &location);
  v36 = &__block_literal_global_71;
  v37 = &__block_literal_global_60;
  v5 = _Block_copy(aBlock);
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_79;
  v31[3] = &unk_1E9FA1A58;
  objc_copyWeak(&v34, &location);
  v32 = &__block_literal_global_60;
  v33 = &__block_literal_global_69;
  v6 = _Block_copy(v31);
  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_84;
  v28[3] = &unk_1E9F9B898;
  objc_copyWeak(&v30, &location);
  v7 = v6;
  v29 = v7;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Start monitoring"), CFSTR("Idle"), v28);
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_86;
  v25[3] = &unk_1E9F9B898;
  objc_copyWeak(&v27, &location);
  v8 = v5;
  v26 = v8;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Rental query did complete"), CFSTR("Waiting for rental query to complete"), v25);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_91;
  v23[3] = &unk_1E9F9BFC0;
  v9 = v8;
  v24 = v9;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Application did become active"), CFSTR("Waiting for appropriate app state to handle expiration"), v23);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_92;
  v21[3] = &unk_1E9F9BFC0;
  v10 = v9;
  v22 = v10;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback UI no longer being shown"), CFSTR("Waiting for appropriate app state to handle expiration"), v21);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_93;
  v19[3] = &unk_1E9F9BFC0;
  v11 = v7;
  v20 = v11;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Expiration UI complete"), CFSTR("Showing expiration UI"), v19);
  v40[0] = CFSTR("Idle");
  v40[1] = CFSTR("Waiting for earliest rental to expire");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_94;
  v17[3] = &unk_1E9F9BFC0;
  v13 = v11;
  v18 = v13;
  objc_msgSend(v3, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Library contents did change"), v12, v17);

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_95;
  v15[3] = &unk_1E9F9BFC0;
  v14 = v13;
  v16 = v14;
  objc_msgSend(v3, "registerHandlerForEvent:onState:withBlock:", CFSTR("Rental expiration timer did fire"), CFSTR("Waiting for earliest rental to expire"), v15);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v3;

  -[VUIRentalExpirationMonitor stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Application did become active"));

}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)startMonitoring
{
  id v2;

  -[VUIRentalExpirationMonitor stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Start monitoring"));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_27 != -1)
    dispatch_once(&sharedInstance_onceToken_27, &__block_literal_global_119);
  return (id)sharedInstance_instance_4;
}

void __44__VUIRentalExpirationMonitor_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  VUIRentalExpirationMonitor *v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIRentalExpirationMonitor");
  v1 = (void *)sLogObject_19;
  sLogObject_19 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIRentalExpirationMonitor);
  v3 = (void *)sharedInstance_instance_4;
  sharedInstance_instance_4 = (uint64_t)v2;

}

- (NSTimer)earliestExpirationTimer
{
  return self->_earliestExpirationTimer;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIRentalExpirationMonitor;
  -[VUIRentalExpirationMonitor dealloc](&v4, sel_dealloc);
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  v6 = sLogObject_19;
  if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "isPlaybackUIBeingShown did change to %@", buf, 0xCu);
  }
  if ((v5 & 1) == 0)
  {
    v8 = sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Delaying EventPlaybackUINoLongerBeingShown to allow transition to finish.", buf, 2u);
    }
    objc_initWeak((id *)buf, self);
    v9 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__VUIRentalExpirationMonitor__isPlaybackUIBeingShownDidChange___block_invoke;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __63__VUIRentalExpirationMonitor__isPlaybackUIBeingShownDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  id WeakRetained;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaybackUIBeingShown");

  v4 = sLogObject_19;
  v5 = os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "After delay, playback is fullscreen.  Not posting event.", v8, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "After delay, playback is not fullscreen.  Posting event.", buf, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:", CFSTR("Playback UI no longer being shown"));

  }
}

- (void)_libraryContentsDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DE7910];
  -[VUIRentalExpirationMonitor stateMachine](self, "stateMachine", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", v5, sel_postEvent_, CFSTR("Library contents did change"));

  -[VUIRentalExpirationMonitor stateMachine](self, "stateMachine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSelector:withObject:afterDelay:", sel_postEvent_, CFSTR("Library contents did change"), 1.0);

}

- (void)_expirationTimerDidFire:(id)a3
{
  id v4;

  -[VUIRentalExpirationMonitor setEarliestExpirationTimer:](self, "setEarliestExpirationTimer:", 0);
  -[VUIRentalExpirationMonitor stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:", CFSTR("Rental expiration timer did fire"));

}

id __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_67(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D51218];
  v3 = *MEMORY[0x1E0D50F88];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:value:comparison:", v3, v5, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", *MEMORY[0x1E0D50EE0], 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D511D8];
  v16[0] = v7;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateMatchingPredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D512C8];
  objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryWithLibrary:predicate:orderingTerms:", v12, v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setIgnoreSystemFilterPredicates:", 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512A0]), "initWithQuery:", v13);

  return v14;
}

uint64_t __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "applicationState"))
  {
    v1 = 0;
  }
  else
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v2, "isPlaybackUIBeingShown") ^ 1;

  }
  return v1;
}

const __CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  const __CFString *v5;
  _QWORD v7[5];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4;
    v7[3] = &unk_1E9F99420;
    v4 = *(id *)(a1 + 40);
    v7[4] = WeakRetained;
    v8 = v4;
    objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v7);

    v5 = CFSTR("Showing expiration UI");
  }
  else
  {
    v5 = CFSTR("Waiting for appropriate app state to handle expiration");
  }

  return v5;
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dateOfLastRentalExpirationHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v9, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setDateOfLastRentalExpirationHandling:", v9);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  CFPreferencesSetAppValue(CFSTR("LastRunValue"), (CFPropertyListRef)objc_msgSend(v6, "numberWithDouble:"), CFSTR("com.apple.videos-preferences"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.videos-preferences"));
  objc_msgSend(v4, "updateToLibraryCurrentRevision");
  objc_msgSend(v4, "enumeratePersistentIDsUsingBlock:", &__block_literal_global_75_1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("VUIRentalExpirationMonitorRentalDidExpireNotification"), v5, 0);

  objc_msgSend(v5, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postEvent:", CFSTR("Expiration UI complete"));
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  VUIUniversalAssetController *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CC23F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_mediaItemForPersistentIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VUIUniversalAssetController initWithMPMediaItem:]([VUIUniversalAssetController alloc], "initWithMPMediaItem:", v4);
  v6 = (void *)sLogObject_19;
  if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Removing download for rental [%@]", (uint8_t *)&v9, 0xCu);

  }
  -[VUIUniversalAssetController cancelAndRemoveDownload](v5, "cancelAndRemoveDownload");

}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_79(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "dateOfLastRentalExpirationHandling");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_80;
  block[3] = &unk_1E9F9D178;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_copyWeak(&v16, v3);
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_80(id *a1)
{
  id WeakRetained;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "updateToLibraryCurrentRevision");
  objc_msgSend(a1[5], "updateToLibraryCurrentRevision");
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_81;
  block[3] = &unk_1E9F99840;
  v4 = a1[4];
  v5 = a1[5];
  v6 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_81(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("ExpiredQueryKey"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("UnexpiredQueryKey"));
  objc_msgSend(*(id *)(a1 + 48), "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Rental query did complete"), 0, v6);

}

const __CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_84(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("LastRunValue"), CFSTR("com.apple.videos-preferences"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    CFPreferencesSetAppValue(CFSTR("LastRunValue"), (CFPropertyListRef)objc_msgSend(v8, "numberWithDouble:"), CFSTR("com.apple.videos-preferences"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.videos-preferences"));
    v7 = v5;
  }
  v9 = v7;
  objc_msgSend(WeakRetained, "setDateOfLastRentalExpirationHandling:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return CFSTR("Waiting for rental query to complete");
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_86(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v42[5];
  uint8_t v43[4];
  void *v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v12, "objectForKey:", CFSTR("ExpiredQueryKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("UnexpiredQueryKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)sLogObject_19;
  if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v14, "count");
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu rentals that have expired since expiration handling", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(WeakRetained, "earliestExpirationTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (!v19)
  {
    v20 = sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Invalidating existing expiration timer", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(WeakRetained, "earliestExpirationTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidate");

    objc_msgSend(WeakRetained, "setEarliestExpirationTimer:", 0);
  }
  if (objc_msgSend(v14, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = objc_msgSend(v15, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "Found %lu rentals that will expire in the future", (uint8_t *)&buf, 0xCu);

    }
    if (objc_msgSend(v15, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v46 = 0x3032000000;
      v47 = __Block_byref_object_copy__24;
      v48 = __Block_byref_object_dispose__24;
      v49 = 0;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_87;
      v42[3] = &unk_1E9FA1A80;
      v42[4] = &buf;
      objc_msgSend(v15, "enumeratePersistentIDsUsingBlock:", v42);
      v26 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v26)
      {
        v27 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v26, "doubleValue");
        objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:", v28 + 5.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = sLogObject_19;
        if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v43 = 138412290;
          v44 = v29;
          _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "Scheduling expiration timer for earliest expiration: %@", v43, 0xCu);
        }
        v31 = (void *)MEMORY[0x1E0C99E88];
        objc_msgSend(v29, "timeIntervalSinceNow");
        objc_msgSend(v31, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", WeakRetained, sel__expirationTimerDidFire_, 0, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setEarliestExpirationTimer:", v32);

        v22 = CFSTR("Waiting for earliest rental to expire");
      }
      else
      {
        v33 = sLogObject_19;
        if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_ERROR))
          __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_86_cold_1(v33, v34, v35, v36, v37, v38, v39, v40);
        v22 = CFSTR("Idle");
      }
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      v22 = CFSTR("Idle");
    }
  }

  return v22;
}

uint64_t __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_91(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_93(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return CFSTR("Waiting for rental query to complete");
}

const __CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_94(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return CFSTR("Waiting for rental query to complete");
}

const __CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_95(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return CFSTR("Waiting for rental query to complete");
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (void)setEarliestExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_earliestExpirationTimer, a3);
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_earliestExpirationTimer, 0);
  objc_storeStrong((id *)&self->_dateOfLastRentalExpirationHandling, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Unable to check for expired rentals since dateOfLastRentalExpirationCheck or currentDate is nil", a5, a6, a7, a8, 0);
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_86_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Unable to determine earliest expiration date.  Not scheduling expiration timer", a5, a6, a7, a8, 0);
}

@end
