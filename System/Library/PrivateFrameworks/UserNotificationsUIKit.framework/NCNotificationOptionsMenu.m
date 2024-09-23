@implementation NCNotificationOptionsMenu

- (NCNotificationOptionsMenu)initWithNotificationRequest:(id)a3 presentingView:(id)a4 settingsDelegate:(id)a5 optionsForSection:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  NCNotificationOptionsMenu *v14;
  NCNotificationOptionsMenu *v15;
  uint64_t v16;
  UIContextMenuInteraction *menu;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationOptionsMenu;
  v14 = -[NCNotificationOptionsMenu init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    objc_storeStrong((id *)&v15->_presentingView, a4);
    objc_storeStrong((id *)&v15->_settingsDelegate, a5);
    v15->_optionsForSection = a6;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v15);
    menu = v15->_menu;
    v15->_menu = (UIContextMenuInteraction *)v16;

    -[UIView addInteraction:](v15->_presentingView, "addInteraction:", v15->_menu);
  }

  return v15;
}

- (void)presentMenu
{
  UIContextMenuInteraction *menu;

  menu = self->_menu;
  -[UIView center](self->_presentingView, "center");
  -[UIContextMenuInteraction _presentMenuAtLocation:](menu, "_presentMenuAtLocation:");
}

- (void)dismissMenu
{
  -[UIContextMenuInteraction dismissMenu](self->_menu, "dismissMenu");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__NCNotificationOptionsMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v5[3] = &unk_1E8D1DBB8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, &__block_literal_global_16, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __83__NCNotificationOptionsMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __83__NCNotificationOptionsMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationOptionsMenuRequestsSystemSettings:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelSectionIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)v6;
  objc_msgSend(v7, "notificationOptionsMenu:sectionSettingsForSectionIdentifier:", *(_QWORD *)(a1 + 32), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_threadName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TITLE_CONVERSATION_FORMAT"), &stru_1E8D21F60, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v9);
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TITLE_FORMAT"), &stru_1E8D21F60, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v61);
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isCriticalAlert");

  if (v17)
  {
    v18 = objc_msgSend(v8, "criticalAlertsEnabled");
    v19 = *(void **)(a1 + 32);
    if (v18)
      objc_msgSend(v19, "_criticalOffAction");
    else
      objc_msgSend(v19, "_criticalOnAction");
LABEL_19:
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    objc_msgSend(v15, "addObject:", v32);

    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "interruptionLevel");

  if (v21 == 2)
  {
    v22 = objc_msgSend(v8, "isTimeSensitiveEnabled");
    v23 = *(void **)(a1 + 32);
    if (v22)
      objc_msgSend(v23, "_timeSensitiveOffAction");
    else
      objc_msgSend(v23, "_timeSensitiveOnAction");
    goto LABEL_19;
  }
  objc_msgSend(v8, "muteAssertion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_threadIdentifierOrNil");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "activeMuteAssertionLevelForThreadIdentifier:", v25);

  v27 = *(void **)(a1 + 32);
  if (v26)
  {
    objc_msgSend(v27, "_unmuteActionForMuteAssertionLevel:", v26);
  }
  else
  {
    objc_msgSend(v27, "_muteForOneHourAction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v28);

    objc_msgSend(*(id *)(a1 + 32), "_muteForTodayAction");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v29);

  if (objc_msgSend(v4, "isScheduledDeliveryEnabled")
    && (objc_msgSend(*(id *)(a1 + 32), "_isCommunicationThread") & 1) == 0)
  {
    v30 = objc_msgSend(v8, "isScheduledDeliveryEnabled");
    v31 = *(void **)(a1 + 32);
    if (v30)
      objc_msgSend(v31, "_deliverImmediatelyAcion");
    else
      objc_msgSend(v31, "_sendToDigestAction");
    goto LABEL_19;
  }
LABEL_21:
  if (objc_msgSend(*(id *)(a1 + 32), "_canAddToContacts"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_addToContactsAction");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v34);

  }
  v64 = (void *)v9;
  v66 = v4;
  if (objc_msgSend(*(id *)(a1 + 32), "areOptionsForSection"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_clearSectionAction");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v35);

  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E8D21F60, 0, 0, 1, v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v36);

  v37 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "_customSettingsActionForSectionSettings:", v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend(v37, "addObject:", v38);
  objc_msgSend(*(id *)(a1 + 32), "_settingsActionForSectionSettings:", v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v39);

  v40 = objc_msgSend(v8, "notificationsEnabled");
  v41 = *(void **)(a1 + 32);
  objc_msgSend(v8, "displayName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
    objc_msgSend(v41, "_offActionWithSectionDisplayName:", v42);
  else
    objc_msgSend(v41, "_onActionWithSectionDisplayName:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v43);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E8D21F60, 0, 0, 1, v37);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v44);

  v45 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "notificationOptionsMenuRequestsCurrentModeConfiguration:", *(_QWORD *)(a1 + 32));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "_didApplicationBreakthroughMode:", v47)
    && objc_msgSend(*(id *)(a1 + 32), "_isApplicationAllowedForMode:", v47))
  {
    objc_msgSend(*(id *)(a1 + 32), "_offActionForApplicationForMode:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v48);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_didContactBreakthroughMode:", v47)
    && objc_msgSend(*(id *)(a1 + 32), "_isContactAllowedForMode:", v47))
  {
    objc_msgSend(*(id *)(a1 + 32), "_offActionForContactForMode:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v49);

  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E8D21F60, 0, 0, 1, v45);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v50);

  if (+[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& ((MEMORY[0x1D17DCDFC]("-[NCNotificationOptionsMenu contextMenuInteraction:configurationForMenuAtLocation:]_block_invoke_2") & 1) != 0|| _NCDeviceIsRunningSeedBuild()))
  {
    v51 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "_summaryFeedbackPositive");
    v62 = v15;
    v52 = v2;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObject:", v53);

    objc_msgSend(*(id *)(a1 + 32), "_summaryFeedbackNegative");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObject:", v54);

    v55 = (void *)MEMORY[0x1E0DC39D0];
    NCUserNotificationsUIKitFrameworkBundle();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_SUMMARY_FEEDBACK_TITLE"), &stru_1E8D21F60, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "menuWithTitle:image:identifier:options:children:", v57, 0, 0, 1, v51);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObject:", v58);

    v2 = v52;
    v15 = v62;

  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", v63, v2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  objc_msgSend(v6, "setShadowPath:", v7);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView visiblePathForPreview](self->_presentingView, "visiblePathForPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisiblePath:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v8);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self->_presentingView, v6);
  return v9;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;

  -[NCNotificationOptionsMenu settingsDelegate](self, "settingsDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationOptionsMenuWillDismiss:", self);

}

- (id)_customSettingsActionForSectionSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "showsCustomSettingsLink"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_CONFIGURE_IN_APP_FORMAT"), &stru_1E8D21F60, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("app.badge"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke;
    v14[3] = &unk_1E8D1DC08;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, v11, 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A68]), "initWithNotification:", v5);
    v7 = (void *)MEMORY[0x1E0D23158];
    v8 = *MEMORY[0x1E0D22D88];
    v17[0] = *MEMORY[0x1E0D22DA8];
    v17[1] = v8;
    v18[0] = MEMORY[0x1E0C9AAB0];
    v18[1] = MEMORY[0x1E0C9AAB0];
    v17[2] = *MEMORY[0x1E0D22CE0];
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "optionsWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2;
    v14[3] = &unk_1E8D1DBE0;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v12, "openApplication:withOptions:completion:", v13, v11, v14);

  }
}

void __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2_cold_1(a1, v7, (uint64_t)v6);
  }

}

- (id)_settingsActionForSectionSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nc_notificationSettingsURLForSectionIdentifier:isAppClip:", v5, objc_msgSend(v3, "isAppClip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_SETTINGS"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gear"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke;
  v15[3] = &unk_1E8D1DC30;
  v16 = v6;
  v17 = v3;
  v11 = v3;
  v12 = v6;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke_2;
  v3[3] = &unk_1E8D1B3A0;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

}

void __63__NCNotificationOptionsMenu__settingsActionForSectionSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0D22D88];
  v19[0] = *MEMORY[0x1E0D22DA8];
  v19[1] = v4;
  v20[0] = MEMORY[0x1E0C9AAB0];
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, v5, &v12);
  v6 = v12;

  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "sectionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_ERROR, "Error opening Settings for %{public}@, %{public}@, %{public}@", buf, 0x20u);

    }
  }

}

- (id)_offActionWithSectionDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (-[NCNotificationOptionsMenu _isCommunicationThread](self, "_isCommunicationThread"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_ALL_FORMAT"), &stru_1E8D21F60, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF"), &stru_1E8D21F60, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__NCNotificationOptionsMenu__offActionWithSectionDisplayName___block_invoke;
  v13[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v8, v10, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAttributes:", 2);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v11;
}

void __62__NCNotificationOptionsMenu__offActionWithSectionDisplayName___block_invoke(uint64_t a1)
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
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", WeakRetained, 0, v2, v3);

  objc_msgSend(WeakRetained, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v4, "isCriticalAlert");

  if ((_DWORD)v2)
  {
    objc_msgSend(WeakRetained, "settingsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationOptionsMenu:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", WeakRetained, 0, v6, v7);

  }
}

- (id)_onActionWithSectionDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (-[NCNotificationOptionsMenu _isCommunicationThread](self, "_isCommunicationThread"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_ON_ALL_FORMAT"), &stru_1E8D21F60, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_ON"), &stru_1E8D21F60, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("app.badge.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__NCNotificationOptionsMenu__onActionWithSectionDisplayName___block_invoke;
  v13[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v8, v10, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

void __61__NCNotificationOptionsMenu__onActionWithSectionDisplayName___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setAllowsNotifications:forNotificationRequest:withSectionIdentifier:", WeakRetained, 1, v2, v4);

  objc_msgSend(WeakRetained, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v5, "isCriticalAlert");

  if ((_DWORD)v2)
  {
    objc_msgSend(WeakRetained, "settingsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationOptionsMenu:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", WeakRetained, 1, v7, v8);

  }
}

- (id)_criticalOffAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CRITICAL"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__NCNotificationOptionsMenu__criticalOffAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __47__NCNotificationOptionsMenu__criticalOffAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", WeakRetained, 0, v2, v3);

}

- (id)_criticalOnAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_ON_CRITICAL"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__NCNotificationOptionsMenu__criticalOnAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __46__NCNotificationOptionsMenu__criticalOnAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setAllowsCriticalAlerts:forNotificationRequest:withSectionIdentifier:", WeakRetained, 1, v2, v4);

}

- (id)_timeSensitiveOffAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_TIME_SENSITIVE"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NCNotificationOptionsMenu__timeSensitiveOffAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __52__NCNotificationOptionsMenu__timeSensitiveOffAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", WeakRetained, 0, v2, v3);

}

- (id)_timeSensitiveOnAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_ON_TIME_SENSITIVE"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NCNotificationOptionsMenu__timeSensitiveOnAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __51__NCNotificationOptionsMenu__timeSensitiveOnAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", WeakRetained, 1, v2, v3);

}

- (id)_summaryFeedbackPositive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_SUMMARY_FEEDBACK_POSITIVE"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCSummarizationFeedbackManager thumbsUpImage](NCSummarizationFeedbackManager, "thumbsUpImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NCNotificationOptionsMenu__summaryFeedbackPositive__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __53__NCNotificationOptionsMenu__summaryFeedbackPositive__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settingsDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "notificationOptionsMenu:isDisplayingStackSummaryForNotificationRequest:", v6, v2);

    +[NCSummarizationFeedbackManager sharedInstance](NCSummarizationFeedbackManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbsUpFor:isShowingStackSummary:", v2, v4);

    WeakRetained = v6;
  }

}

- (id)_summaryFeedbackNegative
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_SUMMARY_FEEDBACK_NEGATIVE"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCSummarizationFeedbackManager thumbsDownImage](NCSummarizationFeedbackManager, "thumbsDownImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NCNotificationOptionsMenu__summaryFeedbackNegative__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __53__NCNotificationOptionsMenu__summaryFeedbackNegative__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settingsDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "notificationOptionsMenu:isDisplayingStackSummaryForNotificationRequest:", v6, v2);

    +[NCSummarizationFeedbackManager sharedInstance](NCSummarizationFeedbackManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbsDownFor:isShowingStackSummary:", v2, v4);

    WeakRetained = v6;
  }

}

- (id)_muteForOneHourAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_MUTE_FOR_ONE_HOUR"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bell.slash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__NCNotificationOptionsMenu__muteForOneHourAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __50__NCNotificationOptionsMenu__muteForOneHourAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _dateOneHourFromNow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_threadIdentifierOrNil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", WeakRetained, 1, v2, v3, v4, v5);

}

- (id)_muteForTodayAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_MUTE_FOR_TODAY"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bell.slash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NCNotificationOptionsMenu__muteForTodayAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __48__NCNotificationOptionsMenu__muteForTodayAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _dateUntilEndOfToday();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_threadIdentifierOrNil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", WeakRetained, 1, v2, v3, v4, v5);

}

- (id)_unmuteActionForMuteAssertionLevel:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  if (a3 == 1)
  {
    -[NCNotificationOptionsMenu _threadIdentifierOrNil](self, "_threadIdentifierOrNil");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_UNMUTE"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__NCNotificationOptionsMenu__unmuteActionForMuteAssertionLevel___block_invoke;
  v12[3] = &unk_1E8D1DC08;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

void __64__NCNotificationOptionsMenu__unmuteActionForMuteAssertionLevel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationOptionsMenu:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", WeakRetained, 0, 0, v3, v4, *(_QWORD *)(a1 + 32));

}

- (id)_sendToDigestAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_ADD_TO_SUMMARY"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("newspaper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NCNotificationOptionsMenu__sendToDigestAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __48__NCNotificationOptionsMenu__sendToDigestAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", WeakRetained, 1, v2, v3);

}

- (id)_deliverImmediatelyAcion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_DELIVER_IMMEDIATELY"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NCNotificationOptionsMenu__deliverImmediatelyAcion__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __53__NCNotificationOptionsMenu__deliverImmediatelyAcion__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", WeakRetained, 0, v2, v3);

}

- (id)_addToContactsAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_ADD_TO_CONTACTS"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.plus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NCNotificationOptionsMenu__addToContactsAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __49__NCNotificationOptionsMenu__addToContactsAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:addSenderToContactsForNotificationRequest:withSectionIdentifier:", WeakRetained, v2, v3);

}

- (id)_clearSectionAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR_NOTIFICATIONS"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NCNotificationOptionsMenu__clearSectionAction__block_invoke;
  v8[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __48__NCNotificationOptionsMenu__clearSectionAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notificationOptionsMenu:requestsClearingSectionWithIdentifier:", WeakRetained, v2);

}

- (id)_offActionForApplicationForMode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticType");

  switch(v6)
  {
    case 0:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_DO_NOT_DISTURB"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_SLEEP"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_DRIVING"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_FITNESS"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_WORK"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_PERSONAL"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_READING"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_GAMING"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = (void *)v8;
      break;
    default:
      v9 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_APPLICATION_DURING_FOCUS"), &stru_1E8D21F60, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  objc_msgSend(v4, "mode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "symbolImageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__NCNotificationOptionsMenu__offActionForApplicationForMode___block_invoke;
  v21[3] = &unk_1E8D1DC08;
  objc_copyWeak(&v23, &location);
  v18 = v4;
  v22 = v18;
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v13, v17, 0, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v19;
}

void __61__NCNotificationOptionsMenu__offActionForApplicationForMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(WeakRetained, "_sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeExceptionForApplication:", v5);

  objc_msgSend(v2, "setConfiguration:", v4);
  objc_msgSend(WeakRetained, "settingsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationOptionsMenu:setModeConfiguration:", WeakRetained, v2);

}

- (id)_offActionForContactForMode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  NCNotificationOptionsMenu *v23;
  id v24;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticType");

  switch(v6)
  {
    case 0:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_DO_NOT_DISTURB"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_SLEEP"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_DRIVING"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_FITNESS"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_WORK"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_PERSONAL"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_READING"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_GAMING"), &stru_1E8D21F60, 0);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = (void *)v8;
      break;
    default:
      v9 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_OPTIONS_TURN_OFF_CONTACT_DURING_FOCUS"), &stru_1E8D21F60, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  objc_msgSend(v4, "mode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "symbolImageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__NCNotificationOptionsMenu__offActionForContactForMode___block_invoke;
  v21[3] = &unk_1E8D1DC58;
  objc_copyWeak(&v24, &location);
  v18 = v4;
  v22 = v18;
  v23 = self;
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v13, v17, 0, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

void __57__NCNotificationOptionsMenu__offActionForContactForMode___block_invoke(id *a1)
{
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
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = (void *)objc_msgSend(a1[4], "mutableCopy");
  objc_msgSend(a1[4], "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(a1[5], "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "communicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cnContactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5C0]), "initWithContactIdentifier:", v9);
  objc_msgSend(v4, "removeExceptionForContact:", v10);
  objc_msgSend(v2, "setConfiguration:", v4);
  objc_msgSend(WeakRetained, "settingsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationOptionsMenu:setModeConfiguration:", WeakRetained, v2);

}

- (BOOL)_didBreakthroughMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend(a3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationOptionsMenu request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "shouldSuppress") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "activeModeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v9);

  }
  return v8;
}

- (BOOL)_didApplicationBreakthroughMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[NCNotificationOptionsMenu request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reason");

  v8 = -[NCNotificationOptionsMenu _didBreakthroughMode:](self, "_didBreakthroughMode:", v4);
  return v7 == 2 && v8;
}

- (BOOL)_didContactBreakthroughMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[NCNotificationOptionsMenu request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reason");

  v8 = -[NCNotificationOptionsMenu _didBreakthroughMode:](self, "_didBreakthroughMode:", v4);
  return v7 == 3 && v8;
}

- (BOOL)_isApplicationAllowedForMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationOptionsMenu request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v4, "exceptionForApplication:", v6) == 0;
  return (char)v5;
}

- (BOOL)_isContactAllowedForMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationOptionsMenu request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "communicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cnContactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0D1D6F0]);
  objc_msgSend(v10, "setContactIdentifier:", v9);
  LOBYTE(v6) = objc_msgSend(v4, "exceptionForContactHandle:", v10) == 0;

  return (char)v6;
}

- (id)_sectionIdentifier
{
  void *v2;
  void *v3;

  -[NCNotificationOptionsMenu request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topLevelSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isCommunicationThread
{
  void *v4;
  void *v5;
  char v6;

  if (-[NCNotificationOptionsMenu areOptionsForSection](self, "areOptionsForSection"))
    return 0;
  -[NCNotificationOptionsMenu request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMessagingType");

  return v6;
}

- (id)_threadName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[NCNotificationOptionsMenu _isCommunicationThread](self, "_isCommunicationThread"))
  {
    -[NCNotificationOptionsMenu request](self, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "communicationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_threadIdentifierOrNil
{
  void *v3;
  void *v4;

  if (-[NCNotificationOptionsMenu _isCommunicationThread](self, "_isCommunicationThread"))
  {
    -[NCNotificationOptionsMenu request](self, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueThreadIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_sender
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationOptionsMenu request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "communicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_canAddToContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[NCNotificationOptionsMenu _sender](self, "_sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationOptionsMenu _sender](self, "_sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationOptionsMenu request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topLevelSectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "canAddToCuratedContacts:bundleIdentifier:", v5, v7);

  return v8;
}

- (NCNotificationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (UIView)presentingView
{
  return self->_presentingView;
}

- (void)setPresentingView:(id)a3
{
  objc_storeStrong((id *)&self->_presentingView, a3);
}

- (NCNotificationOptionsMenuSettingsDelegate)settingsDelegate
{
  return self->_settingsDelegate;
}

- (void)setSettingsDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_settingsDelegate, a3);
}

- (UIContextMenuInteraction)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (BOOL)areOptionsForSection
{
  return self->_optionsForSection;
}

- (void)setOptionsForSection:(BOOL)a3
{
  self->_optionsForSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_settingsDelegate, 0);
  objc_storeStrong((id *)&self->_presentingView, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __69__NCNotificationOptionsMenu__customSettingsActionForSectionSettings___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "Error opening Application settings for %{public}@, %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
