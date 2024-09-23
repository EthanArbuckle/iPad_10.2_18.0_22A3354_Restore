@implementation SBOmnibusAlertItemTestRecipe

- (id)title
{
  return CFSTR("SpringBoard SBAlertItem Tour");
}

- (void)_dismissCurrentItem
{
  SBAlertItem *item;

  -[SBAlertItem deactivateForReason:](self->_item, "deactivateForReason:", 4);
  item = self->_item;
  self->_item = 0;

}

- (void)handleVolumeIncrease
{
  SBAlertItem *v3;
  SBAlertItem *item;
  void *v5;
  int v6;
  id v7;

  while (!self->_item)
  {
    -[SBOmnibusAlertItemTestRecipe _nextAlertItemToTest](self, "_nextAlertItemToTest");
    v3 = (SBAlertItem *)objc_claimAutoreleasedReturnValue();
    item = self->_item;
    self->_item = v3;

    if (!-[SBAlertItem shouldShowInLockScreen](self->_item, "shouldShowInLockScreen"))
    {
      +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasAnyLockState");

      if (v6)
        -[SBOmnibusAlertItemTestRecipe _dismissCurrentItem](self, "_dismissCurrentItem");
    }
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateAlertItem:", self->_item);

}

- (void)handleVolumeDecrease
{
  if (self->_item)
    -[SBOmnibusAlertItemTestRecipe _dismissCurrentItem](self, "_dismissCurrentItem");
}

- (id)_anyAppIcon
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
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
  +[SBIconController sharedInstance](SBIconController, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leafIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isApplicationIcon") & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_anyUserInstalledAppIcon
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leafIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isApplicationIcon"))
        {
          objc_msgSend(v8, "application");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isSystemApplication");

          if (!v10)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)_anySUDescriptor
{
  return objc_alloc_init(MEMORY[0x1E0DA8BC0]);
}

- (id)_mapsApp
{
  void *v2;
  void *v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", CFSTR("com.apple.Maps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_nextAlertItemToTest
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBDataPlanCompletionAlertItem *v9;
  SBUnsupportedURLAlertItem *v10;
  SBLowPowerAlertItem *v11;
  __objc2_class *v12;
  id v13;
  void *v14;
  uint64_t v15;
  SBBuddyLockScreenDismissOnlyAlertItem *v16;
  uint64_t v17;
  __objc2_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  SBDismissOnlyAlertItem *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __objc2_class *v43;
  SBPasscodeComplianceAlertItem *v44;
  SBPasscodeComplianceAlertItem *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  SBPasscodeAlertItem *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  SBApplication32BitDeprecationAlertItem *v56;

  v2 = _nextAlertItemToTest_alertItemIndex_0++;
  v3 = v2 % 35;
  switch(v2 % 35)
  {
    case 0:
      v11 = -[SBLowPowerAlertItem initWithLevel:]([SBLowPowerAlertItem alloc], "initWithLevel:", 5);
      goto LABEL_54;
    case 1:
      v11 = -[SBActivationFailedAlertItem initWithFailureCount:slot:]([SBActivationFailedAlertItem alloc], "initWithFailureCount:slot:", 5, 1);
      goto LABEL_54;
    case 2:
      v12 = SBAppDeniedAlertItem;
      goto LABEL_13;
    case 3:
      v12 = SBAppProfileExpiredAlertItem;
      goto LABEL_13;
    case 4:
      v12 = SBAppProfileNotTrustedAlertItem;
LABEL_13:
      v13 = [v12 alloc];
      -[SBOmnibusAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithApp:", v14);
      goto LABEL_56;
    case 5:
      v16 = [SBBuddyLockScreenDismissOnlyAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_REQUIRED"), CFSTR("Activation Required"), CFSTR("SpringBoard"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBDismissOnlyAlertItem initWithTitle:body:](v16, "initWithTitle:body:", v7, 0);
      goto LABEL_32;
    case 6:
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "performSelector:", sel__settingLanguageStringForNewLanguage);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = SBBuddyLockScreenDismissOnlyAlertItem;
      goto LABEL_22;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CARRIER_DEBUGGING_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CARRIER_DEBUGGING_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = CFSTR("SBCarrierDebuggingAlert");
      goto LABEL_37;
    case 8:
    case 9:
      objc_msgSend((id)SBApp, "telephonyStateProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSIMPresentForSlot:", 1))
        v6 = 1;
      else
        v6 = 2;
      objc_msgSend(v5, "carrierBundleInfoForSlot:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "carrierName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 == 8)
        v9 = -[SBDataPlanCompletionAlertItem initWithCarrierName:newAccount:]([SBDataPlanCompletionAlertItem alloc], "initWithCarrierName:newAccount:", v8, 1);
      else
        v9 = -[SBDataPlanFailureAlertItem initWithAccountURL:carrierName:newAccount:]([SBDataPlanFailureAlertItem alloc], "initWithAccountURL:carrierName:newAccount:", 0, v8, 1);
      v10 = (SBUnsupportedURLAlertItem *)v9;

      goto LABEL_61;
    case 10:
      v24 = [SBDismissOnlyAlertItem alloc];
      v25 = CFSTR("Download Error");
      v26 = CFSTR("Some kind of download error");
      goto LABEL_58;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ACTIVATION_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ACTIVATION_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (objc_class *)SBDismissOnlyAlertItem;
      goto LABEL_38;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = CFSTR("PHONE_ACTIVATED");
      goto LABEL_21;
    case 13:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = CFSTR("UNSUPPORTED_CHARGING_ACCESSORY");
LABEL_21:
      objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = SBDismissOnlyAlertItem;
LABEL_22:
      v33 = objc_msgSend([v18 alloc], "initWithTitle:body:", v5, 0);
      goto LABEL_30;
    case 14:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = CFSTR("RESTRICTED_URL_TITLE");
      goto LABEL_25;
    case 15:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      v36 = CFSTR("UNHANDLED_URL_BODY");
LABEL_25:
      objc_msgSend(v34, "localizedStringForKey:value:table:", v36, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_URL_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", v39, CFSTR("http://www.apple.com"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[SBDismissOnlyAlertItem initWithTitle:body:]([SBUnsupportedURLAlertItem alloc], "initWithTitle:body:", v5, v40);
      goto LABEL_62;
    case 16:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("REORDER_INFO_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("REORDER_INFO_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = CFSTR("SBHomeScreenNagAlert");
      goto LABEL_37;
    case 17:
      -[SBOmnibusAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = SBApplicationLaunchNotifyInCallAlertItem;
      goto LABEL_29;
    case 18:
      -[SBOmnibusAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = SBApplicationLaunchNotifyAirplaneModeAlertItem;
LABEL_29:
      v33 = objc_msgSend([v43 alloc], "initWithApplication:", v5);
LABEL_30:
      v10 = (SBUnsupportedURLAlertItem *)v33;
      goto LABEL_62;
    case 19:
      v44 = [SBPasscodeComplianceAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBPasscodeComplianceAlertItem initWithTitle:message:continueButtonTitle:cancelButtonTitle:](v44, "initWithTitle:message:continueButtonTitle:cancelButtonTitle:", CFSTR("Non-compliant passcode!"), CFSTR("Which is bad!"), v7, 0);
LABEL_32:
      v10 = (SBUnsupportedURLAlertItem *)v17;
LABEL_61:

      goto LABEL_62;
    case 20:
      v45 = [SBPasscodeComplianceAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_LATER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("Which is bad, but whatevs?");
      goto LABEL_35;
    case 21:
      v45 = [SBPasscodeComplianceAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REMINDER_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("Which is bad, so cancel!");
LABEL_35:
      v10 = -[SBPasscodeComplianceAlertItem initWithTitle:message:continueButtonTitle:cancelButtonTitle:](v45, "initWithTitle:message:continueButtonTitle:cancelButtonTitle:", CFSTR("Non-compliant passcode!"), v49, v46, v48);

LABEL_62:
      return v10;
    case 22:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("REORDER_INFO_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("REORDER_INFO_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = CFSTR("SBReorderInfoAlert");
LABEL_37:
      v29 = NSClassFromString(&v23->isa);
LABEL_38:
      v10 = (SBUnsupportedURLAlertItem *)objc_msgSend([v29 alloc], "initWithTitle:body:", v20, v22);

      return v10;
    case 23:
      v11 = objc_alloc_init(SBRestoreFailureAlertItem);
      goto LABEL_54;
    case 24:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 0;
      goto LABEL_47;
    case 25:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 0;
      goto LABEL_49;
    case 26:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 0;
      goto LABEL_51;
    case 27:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 1;
      goto LABEL_47;
    case 28:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 1;
      goto LABEL_49;
    case 29:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 1;
      goto LABEL_51;
    case 30:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 2;
LABEL_47:
      v54 = 0;
      v55 = 1;
      goto LABEL_53;
    case 31:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 2;
LABEL_49:
      v54 = 1;
      goto LABEL_52;
    case 32:
      v52 = [SBPasscodeAlertItem alloc];
      v53 = 2;
LABEL_51:
      v54 = 2;
LABEL_52:
      v55 = 0xFFFFFFFFLL;
LABEL_53:
      v11 = -[SBPasscodeAlertItem initWithPasscodeMode:unlockScreenType:simplePasscodeType:](v52, "initWithPasscodeMode:unlockScreenType:simplePasscodeType:", v53, v54, v55);
      goto LABEL_54;
    case 33:
      v56 = [SBApplication32BitDeprecationAlertItem alloc];
      -[SBOmnibusAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SBApplication32BitDeprecationAlertItem initWithApplication:](v56, "initWithApplication:", v14);
LABEL_56:
      v10 = (SBUnsupportedURLAlertItem *)v15;

      return v10;
    case 34:
      v24 = [SBDismissOnlyAlertItem alloc];
      v25 = CFSTR("All Done");
      v26 = CFSTR("Bye bye now.");
LABEL_58:
      v11 = -[SBDismissOnlyAlertItem initWithTitle:body:](v24, "initWithTitle:body:", v25, v26);
LABEL_54:
      v10 = (SBUnsupportedURLAlertItem *)v11;
      break;
    default:
      v10 = 0;
      break;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
