@implementation SHSheetFactory

+ (id)createMainPresenterWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  SHSheetRouter *v5;
  void *v6;
  SHSheetRouter *v7;
  SHSheetInteractor *v8;
  SHSheetPresenter *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Create main presenter for context:%@", (uint8_t *)&v11, 0xCu);
  }

  v5 = [SHSheetRouter alloc];
  objc_msgSend(v3, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SHSheetRouter initWithRootViewController:supportsModalPresentations:](v5, "initWithRootViewController:supportsModalPresentations:", v6, 1);

  v8 = -[SHSheetInteractor initWithContext:]([SHSheetInteractor alloc], "initWithContext:", v3);
  v9 = -[SHSheetPresenter initWithRouter:interactor:]([SHSheetPresenter alloc], "initWithRouter:interactor:", v7, v8);

  return v9;
}

+ (id)createContentViewControllerWithSession:(id)a3 presenter:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Create main view for session:%@", (uint8_t *)&v10, 0xCu);
  }

  +[SHSheetFactory _createPlatformViewControllerWithSession:](SHSheetFactory, "_createPlatformViewControllerWithSession:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresenter:", v6);

  return v8;
}

+ (id)createScreenTimeAlertViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_ALERT_SCREEN_TIME_TITLE"), CFSTR("Time Limit"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_ALERT_SCREEN_TIME_MESSAGE"), CFSTR("You've reached your limit for this app."), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _ShareSheetBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_ALERT_SCREEN_TIME_DISMISS_BUTTON_TITLE"), CFSTR("Dismiss"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v7, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);

  return v8;
}

+ (id)_createPlatformViewControllerWithSession:(id)a3
{
  id v3;
  int v4;
  __objc2_class **v5;
  UIActivityContentViewController *v6;
  NSObject *v7;
  int v9;
  UIActivityContentViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "useRemoteUIService"))
  {
    v4 = _ShareSheetPrefersModernRemoteScene();
    v5 = off_1E3FFFA90;
    if (!v4)
      v5 = off_1E3FFFAC8;
    v6 = (UIActivityContentViewController *)objc_msgSend(objc_alloc(*v5), "initWithSession:", v3);
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Created remote scene view controller:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v3, "createContentContext");
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = -[UIActivityContentViewController initWithContext:]([UIActivityContentViewController alloc], "initWithContext:", v7);
  }

  return v6;
}

+ (id)createAirdropViewControllerWithNoContentView:(BOOL)a3 delegate:(id)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 buf;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Create airdrop view with no content view:%@", (uint8_t *)&buf, 0xCu);

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)getSFAirDropViewControllerClass_softClass;
  v16 = getSFAirDropViewControllerClass_softClass;
  if (!getSFAirDropViewControllerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v18 = __getSFAirDropViewControllerClass_block_invoke;
    v19 = &unk_1E4001370;
    v20 = &v13;
    __getSFAirDropViewControllerClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v14[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v13, 8);
  v10 = [v9 alloc];
  v11 = (void *)objc_msgSend(v10, "initWithNoContentView:", v4, v13);
  objc_msgSend(v11, "setDelegate:", v5);

  return v11;
}

+ (id)createUserDefaultsViewControllerWithContext:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _UIActivityUserDefaultsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UIActivityUserDefaultsViewController *v16;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Create user defaults view with context:%@", buf, 0xCu);
  }

  v8 = [_UIActivityUserDefaultsViewController alloc];
  objc_msgSend(v5, "favoritesProxies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionProxies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activitiesByUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationActivityTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludedActivityTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "category");
  LOBYTE(v18) = objc_msgSend(v5, "isPresentedModally");
  v16 = -[_UIActivityUserDefaultsViewController initWithFavoritesProxies:suggestionProxies:activitiesByUUID:applicationActivityTypes:orderedUUIDs:excludedActivityTypes:activityCategory:isPresentedModally:](v8, "initWithFavoritesProxies:suggestionProxies:activitiesByUUID:applicationActivityTypes:orderedUUIDs:excludedActivityTypes:activityCategory:isPresentedModally:", v9, v10, v11, v12, v13, v14, v15, v18);

  -[_UIActivityUserDefaultsViewController setUserDefaultsDelegate:](v16, "setUserDefaultsDelegate:", v6);
  return v16;
}

+ (id)createOptionsViewControllerWithContext:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  ObjectManipulationViewController *v8;
  void *v9;
  ObjectManipulationViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  ObjectManipulationViewController *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Create options view with context:%@", (uint8_t *)&v16, 0xCu);
  }

  v8 = [ObjectManipulationViewController alloc];
  objc_msgSend(v5, "customizationGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ObjectManipulationViewController initWithCustomizationGroups:](v8, "initWithCustomizationGroups:", v9);

  -[ObjectManipulationViewController setRefreshDelegate:](v10, "setRefreshDelegate:", v6);
  objc_msgSend(v5, "itemPreviewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController setItemPreviewViewController:](v10, "setItemPreviewViewController:", v11);

  _ShareSheetBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Options"), CFSTR("Options"), CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController setTitle:](v10, "setTitle:", v13);

  v14 = v10;
  return v14;
}

+ (id)createCollaborationOptionsViewControllerWithCollaborationOptions:(id)a3 bundleIdentifier:(id)a4 updateHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v10 = (void *)getCSSharingOptionsViewControllerClass_softClass;
  v34 = getCSSharingOptionsViewControllerClass_softClass;
  v11 = MEMORY[0x1E0C809B0];
  if (!getCSSharingOptionsViewControllerClass_softClass)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __getCSSharingOptionsViewControllerClass_block_invoke;
    v30[3] = &unk_1E4001370;
    v30[4] = &v31;
    __getCSSharingOptionsViewControllerClass_block_invoke((uint64_t)v30);
    v10 = (void *)v32[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v31, 8);
  v13 = [v12 alloc];
  v25 = v11;
  v26 = 3221225472;
  v27 = __114__SHSheetFactory_createCollaborationOptionsViewControllerWithCollaborationOptions_bundleIdentifier_updateHandler___block_invoke;
  v28 = &unk_1E4002A28;
  v29 = v9;
  v14 = v9;
  v15 = (void *)objc_msgSend(v13, "initWithCollaborationSharingOptionsView:userDidChangeOption:", v7, &v25);
  objc_msgSend(v15, "navigationItem", v25, v26, v27, v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setManualScrollEdgeAppearanceEnabled:", 1);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v17, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowColor:", v18);

  objc_msgSend(v15, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollEdgeAppearance:", v17);

  v20 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v20, "configureWithDefaultBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowColor:", v21);

  objc_msgSend(v15, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStandardAppearance:", v20);

  objc_msgSend(v15, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setManualScrollEdgeAppearanceProgress:", 1.0);

  objc_msgSend(v15, "setHostBundleID:", v8);
  return v15;
}

uint64_t __114__SHSheetFactory_createCollaborationOptionsViewControllerWithCollaborationOptions_bundleIdentifier_updateHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)createCollaborationParticipantsViewControllerWithContext:(id)a3 request:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
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
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "fileOrFolderURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmButtonText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "share");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Showing add participants view with file URL %@, primary button text %@, options %@, container setup info %@ and share %@", buf, 0x34u);

  }
  if (objc_msgSend(getCSAddParticipantsViewControllerClass(), "instancesRespondToSelector:", sel_initWithCKShare_containerSetupInfo_fileURL_collaborationOptionsGroups_headerImageData_headerTitle_loadingText_supplementaryText_primaryButtonText_secondaryButtonText_))
  {
    v28 = objc_alloc((Class)getCSAddParticipantsViewControllerClass());
    objc_msgSend(v8, "share");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileOrFolderURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadingText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmButtonText");
    v21 = v7;
    v22 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v28, "initWithCKShare:containerSetupInfo:fileURL:collaborationOptionsGroups:headerImageData:headerTitle:loadingText:supplementaryText:primaryButtonText:secondaryButtonText:", v27, v16, v17, v18, 0, v19, v20, 0, v23, 0);

    v9 = v22;
    v7 = v21;

    objc_msgSend(v24, "setDelegate:", v9);
  }
  else
  {
    share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[SHSheetFactory createCollaborationParticipantsViewControllerWithContext:request:delegate:].cold.1(v25);

    v24 = 0;
  }

  return v24;
}

+ (void)createCollaborationParticipantsViewControllerWithContext:(os_log_t)log request:delegate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "API for CSAddParticipantsViewController is outdated", v1, 2u);
}

@end
