@implementation SearchUIPersonHeaderViewController

+ (id)downtimeBadgeStyleSettings
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C97490]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithPosition:color:backgroundColor:cropStyle:", 0, v3, v4, 0);

  objc_msgSend(v5, "setContentMode:", 4);
  return v5;
}

- (SearchUIPersonHeaderViewController)init
{
  return -[SearchUIPersonHeaderViewController initWithDowntimeButton:](self, "initWithDowntimeButton:", 0);
}

- (id)contactNameFor:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 1000);
}

- (void)handleErrorResultFromDowntimeToggleFor:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  -[SearchUIPersonHeaderViewController contactNameFor:](self, "contactNameFor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("DOWNTIME_TOGGLE_ERROR_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("DOWNTIME_TOGGLE_ERROR_MESSAGE_FORMAT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  SearchUIGeneralLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[SearchUIPersonHeaderViewController handleErrorResultFromDowntimeToggleFor:withError:].cold.1((uint64_t)v6, v12);

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CONFIRMATION_ACTION_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v16);
  objc_msgSend(v13, "setPreferredAction:", v16);
  -[SearchUIPersonHeaderViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)handleConfirmDowntimeToggleFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  +[SearchUIDowntimeManager sharedManager](SearchUIDowntimeManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIPersonHeaderViewController STUserID](self, "STUserID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "statusForSTUserID:forceRecheck:", v6, 1);

  -[SearchUIPersonHeaderViewController contactNameFor:](self, "contactNameFor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 > 0;
  if (v7 <= 0)
    v10 = CFSTR("DOWNTIME_TOGGLE_OFF_TO_ON_CONFIRM");
  else
    v10 = CFSTR("DOWNTIME_TOGGLE_ON_TO_OFF_CONFIRM");
  if (v7 <= 0)
    v11 = CFSTR("DOWNTIME_TOGGLE_OFF_TO_ON");
  else
    v11 = CFSTR("DOWNTIME_TOGGLE_ON_TO_OFF");
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = (void *)MEMORY[0x1E0CB3940];
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 2 * v9;
  v19 = (void *)MEMORY[0x1E0DC3448];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke;
  v25[3] = &unk_1EA1F7FE0;
  v25[4] = self;
  v26 = v4;
  v20 = v4;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v12, v18, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v21);
  objc_msgSend(v17, "setPreferredAction:", v21);
  v22 = (void *)MEMORY[0x1E0DC3448];
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CANCEL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v24);
  -[SearchUIPersonHeaderViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

}

void __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "STUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke_2;
  v5[3] = &unk_1EA1F6F30;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "toggleOnDemandDowntimeForUserID:completionHandler:", v3, v5);

}

uint64_t __69__SearchUIPersonHeaderViewController_handleConfirmDowntimeToggleFor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "handleErrorResultFromDowntimeToggleFor:withError:", *(_QWORD *)(a1 + 40), a2);
  return objc_msgSend(*(id *)(a1 + 32), "updateDowntimeBadgeForceRecheck:", 1);
}

- (id)actionsViewConfigurationWithDowntimeButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;
  id location;

  v3 = a3;
  if (actionsViewConfigurationWithDowntimeButton__onceToken != -1)
    dispatch_once(&actionsViewConfigurationWithDowntimeButton__onceToken, &__block_literal_global_29);
  objc_initWeak(&location, self);
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_2;
    aBlock[3] = &unk_1EA1F81E0;
    objc_copyWeak(&v20, &location);
    v5 = _Block_copy(aBlock);
    v6 = objc_alloc(MEMORY[0x1E0C974F8]);
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("DOWNTIME_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:actionType:systemImageName:overrideEnabledState:actionBlock:", v7, CFSTR("SearchUICNActionTypeDowntime"), CFSTR("downtime"), 1, v5);

    objc_msgSend(v8, "setShouldPresentDisambiguationUI:", 0);
    objc_msgSend((id)actionsViewConfigurationWithDowntimeButton__baseActions, "arrayByAddingObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = &v20;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_3;
    v17[3] = &unk_1EA1F81E0;
    objc_copyWeak(&v18, &location);
    v11 = _Block_copy(v17);
    v12 = objc_alloc(MEMORY[0x1E0C974F8]);
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("INFO"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTitle:actionType:systemImageName:actionBlock:", v13, CFSTR("SearchUICNActionTypeOpenContact"), CFSTR("person.crop.circle.fill"), v11);

    objc_msgSend(v14, "setShouldPresentDisambiguationUI:", 0);
    objc_msgSend((id)actionsViewConfigurationWithDowntimeButton__baseActions, "arrayByAddingObject:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIPersonHeaderViewController setOpenContactAction:](self, "setOpenContactAction:", v14);

    v10 = &v18;
  }
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97508]), "initWithDefaultActionItems:displaysUnavailableActionTypes:actionViewStyle:", v9, 1, 6);

  return v15;
}

void __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C974F8]);
  v1 = (void *)objc_msgSend(v0, "initWithTitle:actionType:actionBlock:", 0, *MEMORY[0x1E0C96620], 0);
  v10[0] = v1;
  v2 = objc_alloc(MEMORY[0x1E0C974F8]);
  v3 = (void *)objc_msgSend(v2, "initWithTitle:actionType:actionBlock:", 0, *MEMORY[0x1E0C965F8], 0);
  v10[1] = v3;
  v4 = objc_alloc(MEMORY[0x1E0C974F8]);
  v5 = (void *)objc_msgSend(v4, "initWithTitle:actionType:actionBlock:", 0, *MEMORY[0x1E0C96658], 0);
  v10[2] = v5;
  v6 = objc_alloc(MEMORY[0x1E0C974F8]);
  v7 = (void *)objc_msgSend(v6, "initWithTitle:actionType:actionBlock:", 0, *MEMORY[0x1E0C96618], 0);
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)actionsViewConfigurationWithDowntimeButton__baseActions;
  actionsViewConfigurationWithDowntimeButton__baseActions = v8;

}

void __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "group");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleConfirmDowntimeToggleFor:", v3);

}

void __81__SearchUIPersonHeaderViewController_actionsViewConfigurationWithDowntimeButton___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCoreSpotlightIdentifier:", v5);

  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setApplicationBundleIdentifier:", v6);

  +[SearchUICommandHandler handlerForCommand:environment:](SearchUICommandHandler, "handlerForCommand:environment:", v1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performCommand:triggerEvent:environment:", v1, 2, 0);

}

- (SearchUIPersonHeaderViewController)initWithDowntimeButton:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SearchUIPersonHeaderViewController *v12;
  objc_super v14;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C974F0]);
  v6 = (void *)objc_msgSend(v5, "initGroupWithName:photo:contacts:", 0, 0, MEMORY[0x1E0C9AA60]);
  -[SearchUIPersonHeaderViewController actionsViewConfigurationWithDowntimeButton:](self, "actionsViewConfigurationWithDowntimeButton:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97480];
  +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settingsWithContactStore:cacheSize:threeDTouchEnabled:", v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SearchUIPersonHeaderViewController;
  v12 = -[CNGroupIdentityHeaderViewController initWithGroupIdentity:actionsViewConfiguration:avatarViewControllerSettings:](&v14, sel_initWithGroupIdentity_actionsViewConfiguration_avatarViewControllerSettings_, v6, v7, v11);

  if (v12)
    -[SearchUIPersonHeaderViewController setupDowntimeStatusSubscription](v12, "setupDowntimeStatusSubscription");

  return v12;
}

- (id)STUserID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNGroupIdentityHeaderViewController group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIDowntimeManager screenTimeUserIDForContact:](SearchUIDowntimeManager, "screenTimeUserIDForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIPersonHeaderViewController;
  -[CNGroupIdentityHeaderViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SearchUIPersonHeaderViewController updateDowntimeBadge](self, "updateDowntimeBadge");
  v3 = objc_alloc(MEMORY[0x1E0DACA88]);
  v4 = (void *)objc_msgSend(v3, "initWithStatusTypeIdentifier:", *MEMORY[0x1E0D00580]);
  -[SearchUIPersonHeaderViewController setSubscriptionService:](self, "setSubscriptionService:", v4);

  -[SearchUIPersonHeaderViewController subscriptionService](self, "subscriptionService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);

  -[SearchUIPersonHeaderViewController updateSubscriptions](self, "updateSubscriptions");
}

- (void)groupIdentityDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIPersonHeaderViewController;
  -[CNGroupIdentityHeaderViewController groupIdentityDidUpdate:](&v4, sel_groupIdentityDidUpdate_, a3);
  -[SearchUIPersonHeaderViewController updateDowntimeBadge](self, "updateDowntimeBadge");
  -[SearchUIPersonHeaderViewController updateSubscriptions](self, "updateSubscriptions");
}

- (void)updateWithContact:(id)a3 isActualContact:(BOOL)a4
{
  uint64_t v4;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  LODWORD(v4) = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[SearchUIPersonHeaderViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = v6;
  if (v6)
  {
    v4 = v4;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setNickname:", CFSTR(" "));
    v4 = 0;
  }
  -[SearchUIPersonHeaderViewController openContactAction](self, "openContactAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShouldOverrideEnabledState:", v4);

  -[SearchUIPersonHeaderViewController openContactAction](self, "openContactAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideEnabledState:", v4);

  v12 = objc_alloc(MEMORY[0x1E0C974F0]);
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initGroupWithName:photo:contacts:", 0, 0, v13);

  -[SearchUIPersonHeaderViewController groupIdentityDidUpdate:](self, "groupIdentityDidUpdate:", v14);
}

- (void)updateSubscriptions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke;
  v2[3] = &unk_1EA1F62F0;
  v2[4] = self;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v2);
}

void __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  _QWORD v17[5];
  id v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[SearchUIUtilities skHandlesFromContact:](SearchUIUtilities, "skHandlesFromContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "subscriptionService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "statusSubscriptionForHandle:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "retainTransientSubscriptionAssertionWithCompletion:", 0);
          objc_msgSend(v2, "addObject:", v13);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setStatusSubcriptions:", v14);

  v15 = objc_msgSend(*(id *)(a1 + 32), "userIsUnavailable");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke_2;
  v17[3] = &unk_1EA1F63B8;
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v5;
  v19 = v15;
  v16 = v5;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v17);

}

void __57__SearchUIPersonHeaderViewController_updateSubscriptions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "showingDowntimeBadge");

    if ((v4 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setShouldShowContactBusy:", *(unsigned __int8 *)(a1 + 48));
  }
  else
  {

  }
}

- (BOOL)userIsUnavailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SearchUIPersonHeaderViewController statusSubcriptions](self, "statusSubcriptions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "currentStatus");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00588]), "initWithPublishedStatus:", v6);
        v8 = v7;
        if (v7 && (objc_msgSend(v7, "isAvailable") & 1) == 0)
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)updateDowntimeBadge
{
  -[SearchUIPersonHeaderViewController updateDowntimeBadgeForceRecheck:](self, "updateDowntimeBadgeForceRecheck:", 0);
}

- (void)updateDowntimeBadgeForceRecheck:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SearchUIPersonHeaderViewController *v9;
  BOOL v10;

  -[SearchUIPersonHeaderViewController STUserID](self, "STUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SearchUIPersonHeaderViewController_updateDowntimeBadgeForceRecheck___block_invoke;
  v7[3] = &unk_1EA1F63B8;
  v8 = v5;
  v9 = self;
  v10 = a3;
  v6 = v5;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

}

void __70__SearchUIPersonHeaderViewController_updateDowntimeBadgeForceRecheck___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "STUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToUserID:", v3);

  if (!(_DWORD)v2)
    goto LABEL_5;
  +[SearchUIDowntimeManager sharedManager](SearchUIDowntimeManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "STUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "statusForSTUserID:forceRecheck:", v5, *(unsigned __int8 *)(a1 + 48));

  if (v6 > 0 == objc_msgSend(*(id *)(a1 + 40), "showingDowntimeBadge"))
    return;
  objc_msgSend(*(id *)(a1 + 40), "setShowingDowntimeBadge:", v6 > 0);
  if (v6 >= 1)
  {
    +[SearchUISymbolImage uiImageWithSymbolName:](SearchUISymbolImage, "uiImageWithSymbolName:", CFSTR("downtime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAvatarBadgeImage:", v7);

    objc_msgSend((id)objc_opt_class(), "downtimeBadgeStyleSettings");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAvatarBadgeStyleSettings:", v8);

  }
  else
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "setAvatarBadgeImage:", 0);
  }
}

- (void)setupDowntimeStatusSubscription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  -[SearchUIPersonHeaderViewController downtimeStatusObserver](self, "downtimeStatusObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    +[SearchUIDowntimeManager sharedManager](SearchUIDowntimeManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __69__SearchUIPersonHeaderViewController_setupDowntimeStatusSubscription__block_invoke;
    v9 = &unk_1EA1F8208;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "addObserverForDowntimeStatuses:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIPersonHeaderViewController setDowntimeStatusObserver:](self, "setDowntimeStatusObserver:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __69__SearchUIPersonHeaderViewController_setupDowntimeStatusSubscription__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "STUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqualToString:", v6);

  if (v7)
    objc_msgSend(WeakRetained, "updateDowntimeBadge");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *downtimeStatusObserver;
  objc_super v6;

  +[SearchUIDowntimeManager sharedManager](SearchUIDowntimeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIPersonHeaderViewController downtimeStatusObserver](self, "downtimeStatusObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  downtimeStatusObserver = self->_downtimeStatusObserver;
  self->_downtimeStatusObserver = 0;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIPersonHeaderViewController;
  -[SearchUIPersonHeaderViewController dealloc](&v6, sel_dealloc);
}

- (SKStatusSubscriptionService)subscriptionService
{
  return (SKStatusSubscriptionService *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setSubscriptionService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (NSArray)statusSubcriptions
{
  return (NSArray *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setStatusSubcriptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (NSObject)downtimeStatusObserver
{
  return self->_downtimeStatusObserver;
}

- (void)setDowntimeStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_downtimeStatusObserver, a3);
}

- (BOOL)showingDowntimeBadge
{
  return self->_showingDowntimeBadge;
}

- (void)setShowingDowntimeBadge:(BOOL)a3
{
  self->_showingDowntimeBadge = a3;
}

- (CNGroupIdentityActionItem)openContactAction
{
  return (CNGroupIdentityActionItem *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setOpenContactAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openContactAction, 0);
  objc_storeStrong((id *)&self->_downtimeStatusObserver, 0);
  objc_storeStrong((id *)&self->_statusSubcriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionService, 0);
}

- (void)handleErrorResultFromDowntimeToggleFor:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "SearchUIPersonHeaderViewController: toggled downtime with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
