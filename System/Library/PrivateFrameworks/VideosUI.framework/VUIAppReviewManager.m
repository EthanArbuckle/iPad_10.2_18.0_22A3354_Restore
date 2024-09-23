@implementation VUIAppReviewManager

- (void)isFeatureEnabled:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VUIAppReviewManager_isFeatureEnabled___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__VUIAppReviewManager_isFeatureEnabled___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained[7], "isEnabled");
  else
    v4 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v6 = __40__VUIAppReviewManager_isFeatureEnabled___block_invoke_2;
  v7 = &unk_1E9F9BE68;
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v5[0], 3221225472))
    v6((uint64_t)v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (void)reportApplicationDidForegroundtoAMSSharedStoreReview
{
  -[AMSSharedStoreReview applicationDidForeground](self->_sharedStoreReview, "applicationDidForeground");
}

uint64_t __40__VUIAppReviewManager_isFeatureEnabled___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __37__VUIAppReviewManager_sharedInstance__block_invoke()
{
  VUIAppReviewManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIAppReviewManager);
  v1 = (void *)sharedInstance_singleton_0;
  sharedInstance_singleton_0 = (uint64_t)v0;

}

- (VUIAppReviewManager)init
{
  VUIAppReviewManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double completionThreshold;
  void *v15;
  uint64_t v16;
  AMSSharedStoreReview *sharedStoreReview;
  void *v18;
  __CFString *v19;
  void *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VUIAppReviewManager;
  v2 = -[VUIAppReviewManager init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_numberOfAddToUpNexts = objc_msgSend(v3, "integerForKey:", CFSTR("AppReviewNumberOfAddToUpNexts"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_numberOfPlaybacks = objc_msgSend(v4, "integerForKey:", CFSTR("AppReviewNumberOfPlaybacks"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("AppReviewAfterNthAddToUpNext"));
    if (v6)
      v7 = v6;
    else
      v7 = 3;
    v2->_numberOfAddToUpNextsBeforePrompting = v7;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerForKey:", CFSTR("AppReviewAfterNthPlaybacks"));
    if (v9)
      v10 = v9;
    else
      v10 = 3;
    v2->_numberOfPlaybacksBeforePrompting = v10;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleForKey:", CFSTR("AppReviewMinCompletionThreshold"));
    v2->_completionThreshold = v12;

    completionThreshold = v2->_completionThreshold;
    if (completionThreshold <= 0.0 || completionThreshold > 1.0)
      v2->_completionThreshold = 0.7;
    v2->_lastPlaybackEvent = 0;
    objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC28]), "initWithBag:", v15);
    sharedStoreReview = v2->_sharedStoreReview;
    v2->_sharedStoreReview = (AMSSharedStoreReview *)v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__handleIsPlaybackUIBeingShownDidChange_, v19, v20);

    v21 = dispatch_queue_create("com.apple.tv.appreviewmanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v21;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_49);
  return (id)sharedInstance_singleton_0;
}

- (void)processAddToUpNext
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  unint64_t numberOfAddToUpNexts;
  unint64_t numberOfAddToUpNextsBeforePrompting;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[VUIAppReviewManager _isYouthAccount](self, "_isYouthAccount"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Skip Add to Up Next -- Ineligible Account", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_numberOfAddToUpNexts;
    objc_msgSend(v4, "setInteger:forKey:");

    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      numberOfAddToUpNexts = self->_numberOfAddToUpNexts;
      numberOfAddToUpNextsBeforePrompting = self->_numberOfAddToUpNextsBeforePrompting;
      *(_DWORD *)buf = 134218240;
      v12 = numberOfAddToUpNexts;
      v13 = 2048;
      v14 = numberOfAddToUpNextsBeforePrompting;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Add to Up Next -- up next: %lu/%lu", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v8 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__VUIAppReviewManager_processAddToUpNext__block_invoke;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __41__VUIAppReviewManager_processAddToUpNext__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_shouldAttemptToPrompt"))
  {
    VUIDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: initiate user prompt triggered by Add to Up Next", v3, 2u);
    }

    objc_msgSend(WeakRetained, "_attemptToPrompt");
  }

}

- (void)setMostRecentPlaybackProgressForNonTrailerContent:(double)a3
{
  if (self->_highestPlaybackProgress < a3)
    self->_highestPlaybackProgress = a3;
}

- (void)_handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (-[VUIAppReviewManager _isYouthAccount](self, "_isYouthAccount", a3))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Skip Playback -- Ineligible Account", buf, 2u);
    }

  }
  else
  {
    +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke;
    v6[3] = &unk_1E9F9B4F8;
    v6[4] = self;
    objc_msgSend(v5, "isFeatureEnabled:", v6);

  }
}

void __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  char v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (a2)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlaybackUIBeingShown");

    if ((v4 & 1) == 0)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v5 = dispatch_time(0, 1000000000);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke_2;
      v6[3] = &unk_1E9F99C98;
      objc_copyWeak(&v7, &location);
      dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __62__VUIAppReviewManager__handleIsPlaybackUIBeingShownDidChange___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[VideosUI handlePlaybackDidEndForTCC](_TtC8VideosUI8VideosUI, "handlePlaybackDidEndForTCC");
  +[VideosUI getFullorHalfSheetPromptedAt](_TtC8VideosUI8VideosUI, "getFullorHalfSheetPromptedAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlaybackUIBeingShown");

    if (v4)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        v6 = "VUIAppReviewManager: Skip Playback -- Playback UI being shown";
LABEL_16:
        v9 = v5;
        v10 = 2;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    if (objc_msgSend(WeakRetained, "lastPlaybackEvent") == 1)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        v6 = "VUIAppReviewManager: Skip Playback -- There was an error";
        goto LABEL_16;
      }
LABEL_18:

      objc_msgSend(WeakRetained, "_resetStates");
      goto LABEL_19;
    }
    if (*((double *)WeakRetained + 6) < *((double *)WeakRetained + 5))
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = WeakRetained[5];
        v8 = WeakRetained[6];
        v16 = 134218240;
        v17 = v7;
        v18 = 2048;
        v19 = v8;
        v6 = "VUIAppReviewManager: Skip Playback -- live events or less than completion threshold %.02f -- progress %.02f";
        v9 = v5;
        v10 = 22;
LABEL_17:
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v16, v10);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ++WeakRetained[2];
    objc_msgSend(v11, "setInteger:forKey:");

    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = WeakRetained[2];
      v14 = WeakRetained[4];
      v16 = 134218240;
      v17 = v13;
      v18 = 2048;
      v19 = v14;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Playback did end -- playback: %lu/%lu", (uint8_t *)&v16, 0x16u);
    }

    if (objc_msgSend(WeakRetained, "lastPlaybackEvent") == 2)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        v6 = "VUIAppReviewManager: Skip Playback -- Upsell presented";
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    objc_msgSend(WeakRetained, "_resetStates");
    if (objc_msgSend(WeakRetained, "_shouldAttemptToPrompt"))
    {
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Initiate prompt. Triggered by playback", (uint8_t *)&v16, 2u);
      }

      objc_msgSend(WeakRetained, "_attemptToPrompt");
    }
  }
LABEL_19:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIAppReviewManager;
  -[VUIAppReviewManager dealloc](&v4, sel_dealloc);
}

- (void)_resetStates
{
  self->_lastPlaybackEvent = 0;
  self->_highestPlaybackProgress = 0.0;
}

- (BOOL)_isYouthAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E0CFD798]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4 && (objc_msgSend(v4, "BOOLValue") & 1) != 0;

  return v6;
}

- (void)_attemptToPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("AppReviewLastPromptedAt"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("AppReviewLastPromptedOSVersion"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteger:forKey:", 0, CFSTR("AppReviewNumberOfPlaybacks"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteger:forKey:", 0, CFSTR("AppReviewNumberOfAddToUpNexts"));

  self->_numberOfAddToUpNexts = 0;
  self->_numberOfPlaybacks = 0;
  -[AMSSharedStoreReview didAttemptPromptReview](self->_sharedStoreReview, "didAttemptPromptReview");
  v10 = (void *)MEMORY[0x1E0CD8078];
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestReviewInScene:", v12);

  VUIDefaultLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: Attempted to prompt", v14, 2u);
  }

}

- (BOOL)_shouldAttemptToPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  BOOL v12;
  void *v14;
  void *v15;
  unint64_t numberOfAddToUpNexts;
  unint64_t numberOfPlaybacks;
  unint64_t numberOfAddToUpNextsBeforePrompting;
  unint64_t numberOfPlaybacksBeforePrompting;
  int v20;
  _BOOL4 v21;
  int v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_4;
  +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
LABEL_5:
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v12 = 0;
      goto LABEL_10;
    }
    LOWORD(v22) = 0;
    v9 = "VUIAppReviewManager: Already presenting";
    goto LABEL_7;
  }
  objc_msgSend(v4, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_5;
  if (self->_numberOfAddToUpNexts < self->_numberOfAddToUpNextsBeforePrompting
    && self->_numberOfPlaybacks < self->_numberOfPlaybacksBeforePrompting)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    numberOfAddToUpNexts = self->_numberOfAddToUpNexts;
    numberOfPlaybacks = self->_numberOfPlaybacks;
    numberOfAddToUpNextsBeforePrompting = self->_numberOfAddToUpNextsBeforePrompting;
    numberOfPlaybacksBeforePrompting = self->_numberOfPlaybacksBeforePrompting;
    v22 = 134218752;
    v23 = numberOfAddToUpNexts;
    v24 = 2048;
    v25 = numberOfAddToUpNextsBeforePrompting;
    v26 = 2048;
    v27 = numberOfPlaybacks;
    v28 = 2048;
    v29 = numberOfPlaybacksBeforePrompting;
    v9 = "VUIAppReviewManager: -- conditions not met -- up next: %lu/%lu -- playback: %lu/%lu";
    v10 = v8;
    v11 = 42;
    goto LABEL_8;
  }
  v20 = -[AMSSharedStoreReview shouldAttemptPromptReview](self->_sharedStoreReview, "shouldAttemptPromptReview");
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v20)
  {
    if (!v21)
      goto LABEL_9;
    LOWORD(v22) = 0;
    v9 = "VUIAppReviewManager: [AMSSharedStoreReview shouldAttemptPromptReview] returned NO";
LABEL_7:
    v10 = v8;
    v11 = 2;
LABEL_8:
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v22, v11);
    goto LABEL_9;
  }
  if (v21)
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIAppReviewManager: [AMSSharedStoreReview shouldAttemptPromptReview] returned YES", (uint8_t *)&v22, 2u);
  }
  v12 = 1;
LABEL_10:

  return v12;
}

- (unint64_t)lastPlaybackEvent
{
  return self->_lastPlaybackEvent;
}

- (void)setLastPlaybackEvent:(unint64_t)a3
{
  self->_lastPlaybackEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sharedStoreReview, 0);
}

@end
