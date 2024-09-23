@implementation SBTestableAlertItemTestRecipe

- (id)title
{
  return CFSTR("Test SpringBoard SBAlertItems");
}

+ (id)testCases
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 52);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 52; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)testCasesGrouped
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 52);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 52; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)nameForCase:(int64_t)a3
{
  if ((unint64_t)a3 > 0x32)
    return CFSTR("Not a Real Test");
  else
    return off_1E8EABCE0[a3];
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
    -[SBTestableAlertItemTestRecipe _nextAlertItemToTest](self, "_nextAlertItemToTest");
    v3 = (SBAlertItem *)objc_claimAutoreleasedReturnValue();
    item = self->_item;
    self->_item = v3;

    if (!-[SBAlertItem shouldShowInLockScreen](self->_item, "shouldShowInLockScreen"))
    {
      +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasAnyLockState");

      if (v6)
        -[SBTestableAlertItemTestRecipe _dismissCurrentItem](self, "_dismissCurrentItem");
    }
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateAlertItem:", self->_item);

}

- (void)handleVolumeDecrease
{
  if (self->_item)
    -[SBTestableAlertItemTestRecipe _dismissCurrentItem](self, "_dismissCurrentItem");
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
  void *v10;
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
        objc_msgSend(v8, "application");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && !objc_msgSend(v9, "isSystemApplication"))
        {
          v5 = v8;

          goto LABEL_12;
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

- (id)dataPlanAlertItemForCase:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBDataPlanActivationAlertItem *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  SBDataPlanCompletionAlertItem *v12;
  SBDataPlanUsageAlertItem *v13;
  double v14;
  void *v15;
  uint64_t v16;
  SBDataPlanExpirationAlertItem *v17;

  objc_msgSend((id)SBApp, "telephonyStateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSIMPresentForSlot:", 1))
    v5 = 1;
  else
    v5 = 2;
  objc_msgSend(v4, "carrierBundleInfoForSlot:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carrierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 24:
      v8 = [SBDataPlanActivationAlertItem alloc];
      v9 = 0;
      goto LABEL_8;
    case 25:
      v8 = [SBDataPlanActivationAlertItem alloc];
      v9 = 1;
LABEL_8:
      v11 = 0;
      goto LABEL_12;
    case 26:
      v8 = [SBDataPlanActivationAlertItem alloc];
      v9 = 0;
      goto LABEL_11;
    case 27:
      v8 = [SBDataPlanActivationAlertItem alloc];
      v9 = 1;
LABEL_11:
      v11 = 1;
LABEL_12:
      v12 = -[SBDataPlanActivationAlertItem initWithAccountURL:newAccount:promptToDisable:](v8, "initWithAccountURL:newAccount:promptToDisable:", 0, v9, v11);
      goto LABEL_15;
    case 28:
      v12 = -[SBDataPlanCompletionAlertItem initWithCarrierName:newAccount:]([SBDataPlanCompletionAlertItem alloc], "initWithCarrierName:newAccount:", v7, 1);
      goto LABEL_15;
    case 29:
      v12 = -[SBDataPlanFailureAlertItem initWithAccountURL:carrierName:newAccount:]([SBDataPlanFailureAlertItem alloc], "initWithAccountURL:carrierName:newAccount:", 0, v7, 1);
LABEL_15:
      v10 = v12;
      break;
    case 30:
      v13 = [SBDataPlanUsageAlertItem alloc];
      LODWORD(v14) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBDataPlanUsageAlertItem initWithAccountURL:usage:](v13, "initWithAccountURL:usage:", 0, v15);
      goto LABEL_18;
    case 31:
      v17 = [SBDataPlanExpirationAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBDataPlanExpirationAlertItem initWithAccountURL:expirationDate:](v17, "initWithAccountURL:expirationDate:", 0, v15);
LABEL_18:
      v10 = (void *)v16;

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (id)_nextAlertItemToTest
{
  int64_t v3;
  NSArray *recipesToTest;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSArray count](self->_recipesToTest, "count");
  if (v3)
  {
    recipesToTest = self->_recipesToTest;
    v5 = _nextAlertItemToTest_alertItemIndex++;
    -[NSArray objectAtIndex:](recipesToTest, "objectAtIndex:", v5 % v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v8 = _nextAlertItemToTest_alertItemIndex++;
    v7 = v8 % 52;
  }
  return -[SBTestableAlertItemTestRecipe alertForIndex:](self, "alertForIndex:", v7);
}

- (id)alertForIndex:(int64_t)a3
{
  SBUnsupportedURLAlertItem *v3;
  SBLowPowerAlertItem *v5;
  SBBuddyLockScreenDismissOnlyAlertItem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __objc2_class *v10;
  SBActivationFailedAlertItem *v11;
  uint64_t v12;
  __objc2_class *v13;
  uint64_t v14;
  SBDismissOnlyAlertItem *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __objc2_class *v36;
  id v37;
  SBFairPlayFamilyLeaveAlertItem *v38;
  void *v39;
  SBVPPAppRequiresHealingAlertItem *v40;
  SBPasscodeComplianceAlertItem *v41;
  SBPasscodeComplianceAlertItem *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  SBPasscodeAlertItem *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v6 = [SBBuddyLockScreenDismissOnlyAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_REQUIRED"), CFSTR("Activation Required"), CFSTR("SpringBoard"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBDismissOnlyAlertItem initWithTitle:body:](v6, "initWithTitle:body:", v8, 0);
      goto LABEL_37;
    case 1:
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "performSelector:", sel__settingLanguageStringForNewLanguage);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = SBBuddyLockScreenDismissOnlyAlertItem;
      goto LABEL_18;
    case 2:
      v11 = [SBActivationFailedAlertItem alloc];
      v12 = 1;
      goto LABEL_7;
    case 3:
      v11 = [SBActivationFailedAlertItem alloc];
      v12 = 5;
LABEL_7:
      v5 = -[SBActivationFailedAlertItem initWithFailureCount:slot:](v11, "initWithFailureCount:slot:", v12, 1);
      goto LABEL_57;
    case 4:
      v5 = -[SBLowPowerAlertItem initWithLevel:]([SBLowPowerAlertItem alloc], "initWithLevel:", 5);
      goto LABEL_57;
    case 5:
      v5 = -[SBBluetoothAccessoryLowPowerAlertItem initWithAccessory:batteryLevel:]([SBBluetoothAccessoryLowPowerAlertItem alloc], "initWithAccessory:batteryLevel:", CFSTR(" Pencil"), 5);
      goto LABEL_57;
    case 6:
      -[SBTestableAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = SBApplicationLaunchNotifyInCallAlertItem;
      goto LABEL_12;
    case 7:
      -[SBTestableAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = SBApplicationLaunchNotifyAirplaneModeAlertItem;
LABEL_12:
      v14 = objc_msgSend([v13 alloc], "initWithApplication:", v7);
      goto LABEL_31;
    case 8:
      v15 = [SBDismissOnlyAlertItem alloc];
      v16 = CFSTR("Download Error");
      v17 = CFSTR("Some kind of download error");
      goto LABEL_60;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ACTIVATION_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_ACTIVATION_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (objc_class *)SBDismissOnlyAlertItem;
      goto LABEL_20;
    case 10:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = CFSTR("PHONE_ACTIVATED");
      goto LABEL_17;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = CFSTR("UNSUPPORTED_CHARGING_ACCESSORY");
LABEL_17:
      objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = SBDismissOnlyAlertItem;
LABEL_18:
      v14 = objc_msgSend([v10 alloc], "initWithTitle:body:", v7, 0);
      goto LABEL_31;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CARRIER_DEBUGGING_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CARRIER_DEBUGGING_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = NSClassFromString(CFSTR("SBCarrierDebuggingAlert"));
LABEL_20:
      v3 = (SBUnsupportedURLAlertItem *)objc_msgSend([v22 alloc], "initWithTitle:body:", v19, v21);

      return v3;
    case 13:
      v28 = NSClassFromString(CFSTR("SBReorderInfoAlert"));
      goto LABEL_33;
    case 14:
      v28 = (objc_class *)SBRestoreFailureAlertItem;
      goto LABEL_33;
    case 15:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = CFSTR("RESTRICTED_URL_TITLE");
      goto LABEL_25;
    case 16:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = CFSTR("UNHANDLED_URL_BODY");
LABEL_25:
      objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_URL_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v34, CFSTR("http://www.apple.com"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = -[SBDismissOnlyAlertItem initWithTitle:body:]([SBUnsupportedURLAlertItem alloc], "initWithTitle:body:", v7, v35);
      goto LABEL_42;
    case 17:
      v36 = SBAppProfileExpiredAlertItem;
      goto LABEL_30;
    case 18:
      v36 = SBAppDeniedAlertItem;
      goto LABEL_30;
    case 19:
      v36 = SBAppProfileNotTrustedAlertItem;
      goto LABEL_30;
    case 20:
      v36 = SBAppFreeDevProfileNotTrustedAlertItem;
LABEL_30:
      v37 = [v36 alloc];
      -[SBTestableAlertItemTestRecipe _mapsApp](self, "_mapsApp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v37, "initWithApp:", v7);
LABEL_31:
      v3 = (SBUnsupportedURLAlertItem *)v14;
      goto LABEL_42;
    case 21:
      v28 = (objc_class *)SBInsecureDrawingAlertItem;
LABEL_33:
      v5 = (SBLowPowerAlertItem *)objc_alloc_init(v28);
      goto LABEL_57;
    case 22:
      v38 = [SBFairPlayFamilyLeaveAlertItem alloc];
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "musicApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "info");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[SBFairPlayFamilyLeaveAlertItem initWithAppInfo:](v38, "initWithAppInfo:", v39);

      goto LABEL_38;
    case 23:
      v40 = [SBVPPAppRequiresHealingAlertItem alloc];
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cameraApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBVPPAppRequiresHealingAlertItem initWithApplication:](v40, "initWithApplication:", v8);
      goto LABEL_37;
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
      -[SBTestableAlertItemTestRecipe dataPlanAlertItemForCase:](self, "dataPlanAlertItemForCase:");
      v5 = (SBLowPowerAlertItem *)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 32:
      v41 = [SBPasscodeComplianceAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBPasscodeComplianceAlertItem initWithTitle:message:continueButtonTitle:cancelButtonTitle:](v41, "initWithTitle:message:continueButtonTitle:cancelButtonTitle:", CFSTR("Non-compliant passcode!"), CFSTR("Which is bad!"), v8, 0);
LABEL_37:
      v3 = (SBUnsupportedURLAlertItem *)v9;
LABEL_38:

      goto LABEL_42;
    case 33:
      v42 = [SBPasscodeComplianceAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_LATER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("Which is bad, but whatevs?");
      goto LABEL_41;
    case 34:
      v42 = [SBPasscodeComplianceAlertItem alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REMINDER_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("Which is bad, so cancel!");
LABEL_41:
      v3 = -[SBPasscodeComplianceAlertItem initWithTitle:message:continueButtonTitle:cancelButtonTitle:](v42, "initWithTitle:message:continueButtonTitle:cancelButtonTitle:", CFSTR("Non-compliant passcode!"), v46, v43, v45);

LABEL_42:
      return v3;
    case 35:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 0;
      goto LABEL_50;
    case 36:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 0;
      goto LABEL_52;
    case 37:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 0;
      goto LABEL_54;
    case 38:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 1;
      goto LABEL_50;
    case 39:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 1;
      goto LABEL_52;
    case 40:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 1;
      goto LABEL_54;
    case 41:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 2;
LABEL_50:
      v49 = 0;
      v50 = 1;
      goto LABEL_56;
    case 42:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 2;
LABEL_52:
      v49 = 1;
      goto LABEL_55;
    case 43:
      v47 = [SBPasscodeAlertItem alloc];
      v48 = 2;
LABEL_54:
      v49 = 2;
LABEL_55:
      v50 = 0xFFFFFFFFLL;
LABEL_56:
      v5 = -[SBPasscodeAlertItem initWithPasscodeMode:unlockScreenType:simplePasscodeType:](v47, "initWithPasscodeMode:unlockScreenType:simplePasscodeType:", v48, v49, v50);
      goto LABEL_57;
    case 51:
      v15 = [SBDismissOnlyAlertItem alloc];
      v16 = CFSTR("All Done");
      v17 = CFSTR("Bye bye now.");
LABEL_60:
      v5 = -[SBDismissOnlyAlertItem initWithTitle:body:](v15, "initWithTitle:body:", v16, v17);
LABEL_57:
      v3 = (SBUnsupportedURLAlertItem *)v5;
      break;
    default:
      return v3;
  }
  return v3;
}

- (NSArray)recipesToTest
{
  return self->_recipesToTest;
}

- (void)setRecipesToTest:(id)a3
{
  objc_storeStrong((id *)&self->_recipesToTest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipesToTest, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
