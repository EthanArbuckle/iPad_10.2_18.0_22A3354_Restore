@implementation SBProductivityGestureEducationController

- (void)dealloc
{
  objc_super v3;

  -[SBProductivityGestureEducationController _invalidateBannerTimer](self, "_invalidateBannerTimer");
  v3.receiver = self;
  v3.super_class = (Class)SBProductivityGestureEducationController;
  -[SBProductivityGestureEducationController dealloc](&v3, sel_dealloc);
}

- (SBProductivityGestureEducationController)initWithBannerPoster:(id)a3
{
  id v5;
  SBProductivityGestureEducationController *v6;
  SBProductivityGestureEducationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBProductivityGestureEducationController;
  v6 = -[SBProductivityGestureEducationController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bannerPoster, a3);

  return v7;
}

- (void)gestureActivatedForType:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  SBProductivityGestureEducationItem *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *educationItemMap;
  int v14;
  int64_t v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[SBProductivityGestureEducationController _itemTypeForType:](self, "_itemTypeForType:");
  SBLogSystemGesture();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218240;
    v15 = a3;
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Received education suggestion for education type %lu, itemType %lu", (uint8_t *)&v14, 0x16u);
  }

  if (v5)
  {
    -[SBProductivityGestureEducationPillViewController item](self->_educationPillViewController, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 == v5)
    {
      SBLogSystemGesture();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134217984;
        v15 = a3;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring education suggestion because currently showing education suggestion for education type %lu", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      -[SBProductivityGestureEducationController _loadItemMap](self, "_loadItemMap");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_educationItemMap, "objectForKeyedSubscript:", v9);
      v10 = (SBProductivityGestureEducationItem *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = -[SBProductivityGestureEducationItem initWithType:]([SBProductivityGestureEducationItem alloc], "initWithType:", v5);
        v11 = (void *)-[NSDictionary mutableCopy](self->_educationItemMap, "mutableCopy");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v9);
        v12 = (NSDictionary *)objc_msgSend(v11, "copy");
        educationItemMap = self->_educationItemMap;
        self->_educationItemMap = v12;

        -[SBProductivityGestureEducationController _itemMapUpdated](self, "_itemMapUpdated");
      }
      if (-[SBProductivityGestureEducationItem isValidWithActivationForType:](v10, "isValidWithActivationForType:", a3))
        -[SBProductivityGestureEducationController _presentBannerWithEducationItem:](self, "_presentBannerWithEducationItem:", v10);

    }
  }
}

- (void)_invalidateBannerTimer
{
  BSAbsoluteMachTimer *bannerDismissTimer;

  -[BSAbsoluteMachTimer invalidate](self->_bannerDismissTimer, "invalidate");
  bannerDismissTimer = self->_bannerDismissTimer;
  self->_bannerDismissTimer = 0;

}

- (int64_t)_itemTypeForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return 0;
  else
    return qword_1D0E89AA8[a3 - 1];
}

- (void)_loadItemMap
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  id v10;
  NSDictionary *educationItemMap;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_educationItemMap)
    return;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("SBProductivityGestureEducationItemMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v8, &v17);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  educationItemMap = self->_educationItemMap;
  self->_educationItemMap = v9;

  SBLogSystemGesture();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_1D0540000, v13, OS_LOG_TYPE_ERROR, "%{public}@ error unarchive educationItemMap: %{public}@", buf, 0x16u);
LABEL_7:

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "%{public}@ successfully unarchive educationItemMap", buf, 0xCu);
    goto LABEL_7;
  }

  if (!self->_educationItemMap)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v16 = self->_educationItemMap;
    self->_educationItemMap = v15;

  }
}

- (void)_itemMapUpdated
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ successfully archived educationItemMap", (uint8_t *)&v5, 0xCu);

}

- (void)_presentBannerWithEducationItem:(id)a3
{
  SBProductivityGestureEducationPillViewController *educationPillViewController;
  id v5;
  SBProductivityGestureEducationPillViewController *v6;
  SBProductivityGestureEducationPillViewController *v7;
  BNPosting *bannerPoster;
  SBProductivityGestureEducationPillViewController *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  educationPillViewController = self->_educationPillViewController;
  v5 = a3;
  -[SBProductivityGestureEducationController _resetPillViewController:](self, "_resetPillViewController:", educationPillViewController);
  v6 = -[SBProductivityGestureEducationPillViewController initWithItem:]([SBProductivityGestureEducationPillViewController alloc], "initWithItem:", v5);

  v7 = self->_educationPillViewController;
  self->_educationPillViewController = v6;

  -[SBProductivityGestureEducationPillViewController setDelegate:](self->_educationPillViewController, "setDelegate:", self);
  bannerPoster = self->_bannerPoster;
  v9 = self->_educationPillViewController;
  v13 = 0;
  -[BNPosting postPresentable:withOptions:userInfo:error:](bannerPoster, "postPresentable:withOptions:userInfo:error:", v9, 1, 0, &v13);
  v10 = v13;
  if (v10)
  {
    SBLogSystemGesture();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v10;
      _os_log_error_impl(&dword_1D0540000, v11, OS_LOG_TYPE_ERROR, "%{public}@ error while presenting gesture education banner: %{public}@", buf, 0x16u);

    }
    -[SBProductivityGestureEducationController _resetPillViewController:](self, "_resetPillViewController:", self->_educationPillViewController);
  }

}

- (void)_dismissBanner:(id)a3
{
  BNPosting *bannerPoster;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  bannerPoster = self->_bannerPoster;
  objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", self->_educationPillViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)-[BNPosting revokePresentablesWithIdentification:reason:options:userInfo:error:](bannerPoster, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v5, v7, 0, 0, 0);

}

- (void)_resetPillViewController:(id)a3
{
  void *v4;
  SBProductivityGestureEducationPillViewController *v5;
  SBProductivityGestureEducationPillViewController *educationPillViewController;
  SBProductivityGestureEducationPillViewController *v7;

  v7 = (SBProductivityGestureEducationPillViewController *)a3;
  -[SBProductivityGestureEducationPillViewController item](v7, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetActivations");

  v5 = v7;
  if (v7 && self->_educationPillViewController == v7)
  {
    -[SBProductivityGestureEducationController _invalidateBannerTimer](self, "_invalidateBannerTimer");
    educationPillViewController = self->_educationPillViewController;
    self->_educationPillViewController = 0;

    v5 = v7;
  }

}

- (void)_dismissBannerTimerWithInterval:(double)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BSAbsoluteMachTimer *v9;
  BSAbsoluteMachTimer *bannerDismissTimer;
  BSAbsoluteMachTimer *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a4;
  -[SBProductivityGestureEducationController _invalidateBannerTimer](self, "_invalidateBannerTimer");
  v7 = objc_alloc(MEMORY[0x1E0D01690]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBProductivityGestureEducation.bannerDismissTimer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (BSAbsoluteMachTimer *)objc_msgSend(v7, "initWithIdentifier:", v8);
  bannerDismissTimer = self->_bannerDismissTimer;
  self->_bannerDismissTimer = v9;

  objc_initWeak(&location, self);
  v11 = self->_bannerDismissTimer;
  v12 = MEMORY[0x1E0C80D38];
  v13 = MEMORY[0x1E0C80D38];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__SBProductivityGestureEducationController__dismissBannerTimerWithInterval_reason___block_invoke;
  v15[3] = &unk_1E8EAEE30;
  objc_copyWeak(&v17, &location);
  v14 = v6;
  v16 = v14;
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v11, "scheduleWithFireInterval:leewayInterval:queue:handler:", v12, v15, a3, 0.05);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __83__SBProductivityGestureEducationController__dismissBannerTimerWithInterval_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissBanner:", *(_QWORD *)(a1 + 32));

}

- (void)gestureEducationPillViewControllerWillAppear:(id)a3
{
  void *v4;

  objc_msgSend(a3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentDidAppear");

  -[SBProductivityGestureEducationController _itemMapUpdated](self, "_itemMapUpdated");
  -[SBProductivityGestureEducationController _dismissBannerTimerWithInterval:reason:](self, "_dismissBannerTimerWithInterval:reason:", CFSTR("Timer"), 5.0);
}

- (void)gestureEducationPillViewControllerDidReceiveUserTap:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "actionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogSystemGesture();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Productivity banner tapped, launching to %@", (uint8_t *)&v6, 0xCu);
  }

  SBWorkspaceActivateApplicationFromURL(v4, 0, 0);
  -[SBProductivityGestureEducationController _dismissBanner:](self, "_dismissBanner:", CFSTR("User Interaction"));

}

- (void)gestureEducationPillViewControllerMarqueeStarted:(id)a3 duration:(double)a4
{
  if (a4 > 0.0 && self->_educationPillViewController == a3)
    -[SBProductivityGestureEducationController _dismissBannerTimerWithInterval:reason:](self, "_dismissBannerTimerWithInterval:reason:", CFSTR("Marquee Ended"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_educationPillViewController, 0);
  objc_storeStrong((id *)&self->_bannerDismissTimer, 0);
  objc_storeStrong((id *)&self->_educationItemMap, 0);
  objc_storeStrong((id *)&self->_bannerPoster, 0);
}

@end
