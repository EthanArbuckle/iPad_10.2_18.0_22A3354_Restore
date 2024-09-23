@implementation SBLogoutProgressTestRecipe

- (id)title
{
  return CFSTR("Logout Progress Transient Overlay");
}

- (void)handleVolumeIncrease
{
  void *v3;
  SBLogoutProgressTransientOverlayViewController *v4;
  void *v5;
  void *v6;
  SBLogoutProgressTransientOverlayViewController *v7;
  SBLogoutProgressTransientOverlayViewController *logoutProgressTransientOverlayViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (self->_logoutProgressTransientOverlayViewController)
  {
    -[SBLogoutProgressTestRecipe remainingApplications](self, "remainingApplications");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v16, "count") < 2)
    {
      if (v16)
        -[SBLogoutProgressTestRecipe setRemainingApplications:](self, "setRemainingApplications:", 0);
    }
    else
    {
      objc_msgSend(v16, "subarrayWithRange:", 1, objc_msgSend(v16, "count") - 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLogoutProgressTestRecipe setRemainingApplications:](self, "setRemainingApplications:", v3);

    }
    -[SBLogoutProgressTestRecipe remainingBlockingTasks](self, "remainingBlockingTasks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v15);

      -[SBLogoutProgressTestRecipe setRemainingBlockingTasks:](self, "setRemainingBlockingTasks:", v13);
    }
    else
    {
      -[SBLogoutProgressTestRecipe setRemainingBlockingTasks:](self, "setRemainingBlockingTasks:", 0);
    }
    -[SBLogoutProgressTransientOverlayViewController refreshData](self->_logoutProgressTransientOverlayViewController, "refreshData");

  }
  else
  {
    v4 = [SBLogoutProgressTransientOverlayViewController alloc];
    objc_msgSend((id)SBApp, "userSessionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBLogoutProgressTransientOverlayViewController initWithUserAccount:](v4, "initWithUserAccount:", v6);
    logoutProgressTransientOverlayViewController = self->_logoutProgressTransientOverlayViewController;
    self->_logoutProgressTransientOverlayViewController = v7;

    -[SBLogoutProgressTestRecipe _defaultPendingApplications](self, "_defaultPendingApplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressTestRecipe setRemainingApplications:](self, "setRemainingApplications:", v9);

    -[SBLogoutProgressTestRecipe _defaultBlockingTasks](self, "_defaultBlockingTasks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutProgressTestRecipe setRemainingBlockingTasks:](self, "setRemainingBlockingTasks:", v10);

    -[SBLogoutProgressTransientOverlayViewController setDataSource:](self->_logoutProgressTransientOverlayViewController, "setDataSource:", self);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentTransientOverlayViewController:animated:completion:", self->_logoutProgressTransientOverlayViewController, 1, 0);

    objc_msgSend((id)SBApp, "userSessionController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLoggingOut:", 1);
  }

}

- (void)handleVolumeDecrease
{
  void *v3;
  SBLogoutProgressTransientOverlayViewController *logoutProgressTransientOverlayViewController;
  id v5;

  if (self->_logoutProgressTransientOverlayViewController)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissTransientOverlayViewController:animated:completion:", self->_logoutProgressTransientOverlayViewController, 1, 0);

    logoutProgressTransientOverlayViewController = self->_logoutProgressTransientOverlayViewController;
    self->_logoutProgressTransientOverlayViewController = 0;

    -[SBLogoutProgressTestRecipe setRemainingApplications:](self, "setRemainingApplications:", 0);
    objc_msgSend((id)SBApp, "userSessionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLoggingOut:", 0);

  }
}

- (id)_defaultBlockingTasks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5F08], "taskWithName:reason:", CFSTR("name1"), CFSTR("reason1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5F08], "taskWithName:reason:", CFSTR("name2"), CFSTR("reason2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("com.apple.MobileSafari");
  v7[1] = CFSTR("com.apple.MobilePhone");
  v8[0] = v4;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultPendingApplications
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v2, "addObject:", v4);
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", CFSTR("com.apple.Maps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v2, "addObject:", v6);
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobiletimer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v2, "addObject:", v8);
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

- (SBLogoutProgressTransientOverlayViewController)logoutProgressTransientOverlayViewController
{
  return self->_logoutProgressTransientOverlayViewController;
}

- (void)setLogoutProgressTransientOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_logoutProgressTransientOverlayViewController, a3);
}

- (NSArray)remainingApplications
{
  return self->_remainingApplications;
}

- (void)setRemainingApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)remainingBlockingTasks
{
  return self->_remainingBlockingTasks;
}

- (void)setRemainingBlockingTasks:(id)a3
{
  objc_storeStrong((id *)&self->_remainingBlockingTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingBlockingTasks, 0);
  objc_storeStrong((id *)&self->_remainingApplications, 0);
  objc_storeStrong((id *)&self->_logoutProgressTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
