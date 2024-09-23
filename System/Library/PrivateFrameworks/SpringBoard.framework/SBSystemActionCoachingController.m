@implementation SBSystemActionCoachingController

- (id)initWithHUDController:(void *)a3 ringerControl:(void *)a4 activityManager:(void *)a5 applicationController:(void *)a6 doNotDisturbStateMonitor:(void *)a7 flashlightActivityManager:(void *)a8 bannerManager:
{
  id v16;
  id v17;
  void *v18;
  id *v19;
  id *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSString *v24;
  id v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v16 = a2;
  v41 = a3;
  v40 = a4;
  v39 = a5;
  v38 = a6;
  v37 = a7;
  v17 = a8;
  v18 = v17;
  v36 = v16;
  if (a1)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("HUDController != ((void *)0)"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.1();
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911A98);
    }
    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("ringerControl != ((void *)0)"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.2();
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911B00);
    }
    if (!v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activityManager != ((void *)0)"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.3();
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911B68);
    }
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("applicationController != ((void *)0)"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.4();
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911BD0);
    }
    if (!v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("doNotDisturbStateMonitor != ((void *)0)"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.5();
      objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911C38);
    }
    if (!v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("flashlightActivityManager != ((void *)0)"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.6();
      objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911CA0);
    }
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bannerManager != ((void *)0)"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.7();
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0911D08);
    }
    v42.receiver = a1;
    v42.super_class = (Class)SBSystemActionCoachingController;
    v19 = (id *)objc_msgSendSuper2(&v42, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 2, a2);
      objc_storeStrong(v20 + 3, a3);
      objc_storeStrong(v20 + 4, a4);
      objc_storeStrong(v20 + 5, a5);
      objc_storeStrong(v20 + 6, a6);
      objc_storeStrong(v20 + 7, a7);
      objc_storeStrong(v20 + 8, a8);
      +[SBSystemActionDomain rootSettings](SBSystemActionDomain, "rootSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "coachingSettings");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v20[9];
      v20[9] = (id)v22;

      objc_msgSend(v20[9], "addKeyObserver:", v20);
      objc_msgSend(v20[9], "policyClassName");
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(NSClassFromString(v24));
      v26 = v20[10];
      v20[10] = v25;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObserver:selector:name:object:", v20, sel__systemApertureLayoutChanged_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSystemActionCoachingController _stopObservingSignalsToDismissIfNeeded]((uint64_t)self);
  -[SBSystemActionCoachingController _invalidateBannerWindowLevelAssertion]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionCoachingController;
  -[SBSystemActionCoachingController dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingSignalsToDismissIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      objc_msgSend(*(id *)(a1 + 16), "windowScene");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "systemGestureManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeGestureRecognizer:", *(_QWORD *)(a1 + 96));

      v4 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0DAC2F8], 0);
      objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0DAC3F8], 0);

    }
  }
}

- (void)_invalidateBannerWindowLevelAssertion
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 104);
    if (v2)
    {
      objc_msgSend(v2, "invalidate");
      v3 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

    }
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  SBSystemActionCoachingPolicy *v5;
  SBSystemActionCoachingPolicy *policy;
  NSString *v7;

  if (self->_settings == a3)
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("policyClassName")))
    {
      -[SBSystemActionCoachingSettings policyClassName](self->_settings, "policyClassName");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = (SBSystemActionCoachingPolicy *)objc_alloc_init(NSClassFromString(v7));
      policy = self->_policy;
      self->_policy = v5;

    }
  }
}

- (void)systemActionCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)(a4 - 1) < 2)
  {
    v7 = v6;
    -[SBSystemActionCoachingController _startObservingSignalsToDismissIfNeeded]((uint64_t)self);
    -[SBSystemActionCoachingController _acquireBannerWindowLevelAssertion]((uint64_t)self);
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v7 = v6;
    -[SBSystemActionCoachingController _stopObservingSignalsToDismissIfNeeded]((uint64_t)self);
    -[SBSystemActionCoachingController _invalidateBannerWindowLevelAssertion]((uint64_t)self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_startObservingSignalsToDismissIfNeeded
{
  SBFailingSystemGestureRecognizer *v2;
  void *v3;
  SBFailingSystemGestureRecognizer *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 96))
    {
      v2 = objc_alloc_init(SBFailingSystemGestureRecognizer);
      -[SBFailingSystemGestureRecognizer setDelegate:](v2, "setDelegate:", a1);
      v3 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v2;
      v4 = v2;

      objc_msgSend(*(id *)(a1 + 16), "windowScene");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemGestureManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addGestureRecognizer:withType:", *(_QWORD *)(a1 + 96), 135);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel__backlightLevelChanged_, *MEMORY[0x1E0DAC2F8], 0);
      objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel__volumeButtonPressed_, *MEMORY[0x1E0DAC3F8], 0);

    }
  }
}

- (void)_acquireBannerWindowLevelAssertion
{
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 104))
    {
      v2 = *(void **)(a1 + 64);
      v3 = *MEMORY[0x1E0CEB660] + 1.0;
      objc_msgSend(*(id *)(a1 + 16), "windowScene");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", 1, v6, CFSTR("Coaching HUD Presentation"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v4;

    }
  }
}

- (void)systemActionPreviewCoordinator:(id)a3 didBeginPreview:(id)a4 forAction:(id)a5
{
  void *v6;
  id v7;

  -[SBSystemActionCoachingPolicy noteDidBeginPreview:forAction:](self->_policy, "noteDidBeginPreview:forAction:", a4, a5);
  -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB9B8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "HUDViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSystemActionCoachingHUDViewController state]((uint64_t)v6) == 1)
    -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)v6, 2, 1, 0);

}

- (void)systemActionPreviewCoordinator:(id)a3 didInvalidateExpansionOfPreview:(id)a4 forAction:(id)a5 withResult:(unint64_t)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id *v13;
  NSObject *v14;
  int v15;
  SBSystemActionCoachingController *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  -[SBSystemActionCoachingPolicy noteDidInvalidateExpansionOfPreview:forAction:withResult:](self->_policy, "noteDidInvalidateExpansionOfPreview:forAction:withResult:", a4, v9, a6);
  if (a6)
  {
    v10 = *MEMORY[0x1E0DAB9B8];
    -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB9B8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "HUDViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBSystemActionCoachingPolicy wantsCoachingPresentedForAction:](self->_policy, "wantsCoachingPresentedForAction:", v9))
    {
      if ((-[SBSystemActionCoachingController _canPresentCoachingForAction:]((uint64_t)self, v9) & 1) == 0)
      {
        SBLogSystemActionCoaching();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138543618;
          v16 = self;
          v17 = 2114;
          v18 = v9;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Delegate denied presentation of coaching for action %{public}@", (uint8_t *)&v15, 0x16u);
        }

        goto LABEL_13;
      }
      if (!v11)
      {
        v13 = -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:]([SBSystemActionCoachingHUDViewController alloc], self->_ringerControl, self->_activityManager, self->_applicationController, self->_doNotDisturbStateMonitor, self->_flashlightActivityManager);

        -[SBSystemActionCoachingHUDViewController setDelegate:](v13, self);
        -[SBSystemActionCoachingHUDViewController setSystemApertureFrames:]((uint64_t)v13, self->_systemApertureFrames);
        -[SBHUDController HUDSessionForViewController:identifier:](self->_HUDController, "HUDSessionForViewController:identifier:", v13, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13;
      }
      -[SBSystemActionCoachingHUDViewController setAction:]((id *)v12, v9);
      objc_msgSend(v11, "presentWithDismissalInterval:animated:", 0, 60.0);
    }
    else if (-[SBSystemActionCoachingHUDViewController state]((uint64_t)v12) != 2)
    {
LABEL_13:

      goto LABEL_14;
    }
    -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)v12, 1, 1, 0);
    goto LABEL_13;
  }
  -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
LABEL_14:

}

- (void)_dismissCoaching
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB9B8]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "HUDViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__SBSystemActionCoachingController__dismissCoaching__block_invoke;
    v4[3] = &unk_1E8E9E980;
    v5 = v1;
    v3 = v1;
    -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)v2, 0, 1, v4);

  }
}

- (uint64_t)_canPresentCoachingForAction:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v5 = WeakRetained;
    if (WeakRetained)
      a1 = objc_msgSend(WeakRetained, "systemActionCoachingController:canPresentCoachingForAction:", a1, v3);
    else
      a1 = 1;

  }
  return a1;
}

- (void)systemActionPreviewCoordinator:(id)a3 didEndPreview:(id)a4 forAction:(id)a5 withResult:(unint64_t)a6
{
  SBSystemActionCoachingPolicy *policy;
  id v9;

  policy = self->_policy;
  v9 = a5;
  -[SBSystemActionCoachingPolicy noteDidEndPreview:forAction:](policy, "noteDidEndPreview:forAction:", a4, v9);
  LODWORD(a4) = -[SBSystemActionCoachingPolicy wantsCoachingDismissedForAction:](self->_policy, "wantsCoachingDismissedForAction:", v9);

  if ((_DWORD)a4)
    -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_dismissGestureRecognizer == a3)
  {
    -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB9B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "HUDViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_dismissGestureRecognizer == a3)
    -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
}

uint64_t __52__SBSystemActionCoachingController__dismissCoaching__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "dismiss");
  return result;
}

- (void)_backlightLevelChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  id v13;

  objc_msgSend(a3, "userInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DAC2E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DAC308]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DAC300]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  if (v5 == 3 && v11 > v8)
    -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);

}

- (void)_systemApertureLayoutChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSystemApertureFrames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v5, "copy");

  objc_storeStrong((id *)&self->_systemApertureFrames, obj);
  -[SBHUDController knownHUDControllerForIdentifier:](self->_HUDController, "knownHUDControllerForIdentifier:", *MEMORY[0x1E0DAB9B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "HUDViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemActionCoachingHUDViewController setSystemApertureFrames:]((uint64_t)v8, obj);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_systemApertureFrames, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_flashlightActivityManager, 0);
  objc_storeStrong((id *)&self->_doNotDisturbStateMonitor, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.7()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
