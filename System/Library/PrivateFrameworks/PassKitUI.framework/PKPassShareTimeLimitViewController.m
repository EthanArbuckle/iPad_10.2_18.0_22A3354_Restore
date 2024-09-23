@implementation PKPassShareTimeLimitViewController

- (PKPassShareTimeLimitViewController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 entitlementEntry:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPassShareTimeLimitViewController *v14;
  PKPassShareTimeLimitViewController *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKPassShareTimeLimitViewController;
  v14 = -[PKPaymentSetupOptionsViewController init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_entitlementComposer, a4);
    objc_storeStrong((id *)&v15->_entitlementEntry, a5);
    objc_storeStrong((id *)&v15->_delegate, a6);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v15, "setUseItemIdentityWhenUpdating:", 1);
    -[PKPaymentSetupOptionsViewController setHeaderMode:](v15, "setHeaderMode:", 2);
    -[PKPassShareTimeLimitViewController _configureSections](v15, "_configureSections");
  }

  return v15;
}

- (void)_configureSections
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  PKPassEntitlementsComposerEntry *entitlementEntry;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  PKPassShareScheduleSectionController *scheduleSectionController;
  PKPassShareScheduleSectionController *v18;
  PKPassShareScheduleSectionController *v19;
  PKPassShareToggleSectionController *entitlementAccessSectionController;
  PKPassShareToggleSectionController *v21;
  void *v22;
  PKPassShareToggleSectionController *v23;
  PKPassShareToggleSectionController *v24;
  PKPassEntitlementCapabilitySectionController *capabilitySectionController;
  PKPassEntitlementCapabilitySectionController *v26;
  PKPassEntitlementCapabilitySectionController *v27;
  int v28;
  PKPassShareToggleSectionController *advancedScheduleSectionController;
  PKPassShareToggleSectionController *v30;
  void *v31;
  PKPassShareToggleSectionController *v32;
  PKPassShareToggleSectionController *v33;
  PKPassShareToggleSectionController *v34;
  void *v35;
  PKPassShareToggleSectionController *v36;
  void *v37;
  void *v38;
  char v39;
  unsigned int v40;
  void *v41;
  id v42;

  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", self->_entitlementEntry);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "possibleTimeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_msgSend(v7, "copy");
  v41 = v10;

  entitlementEntry = self->_entitlementEntry;
  v12 = objc_msgSend(v6, "isManagingTimeConfiguration");
  v13 = v12 ^ 1u;
  if (entitlementEntry)
    v14 = 0;
  else
    v14 = v13;
  v15 = objc_msgSend(v7, "support");
  v40 = -[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable");
  if (!entitlementEntry)
  {
    v16 = 0;
LABEL_14:
    scheduleSectionController = self->_scheduleSectionController;
    if (scheduleSectionController)
    {
      -[PKPassShareScheduleSectionController setConfiguration:](scheduleSectionController, "setConfiguration:", v41);
      -[PKPassShareScheduleSectionController setIsDisabled:](self->_scheduleSectionController, "setIsDisabled:", v13);
    }
    else
    {
      v18 = -[PKPassShareScheduleSectionController initWithConfiguration:possibleTimeConfiguration:isEditable:isDisabled:delegate:]([PKPassShareScheduleSectionController alloc], "initWithConfiguration:possibleTimeConfiguration:isEditable:isDisabled:delegate:", v41, v7, v40, v13, self);
      v19 = self->_scheduleSectionController;
      self->_scheduleSectionController = v18;

    }
    objc_msgSend(v42, "addObject:", self->_scheduleSectionController);
    if (!entitlementEntry)
      goto LABEL_26;
    goto LABEL_18;
  }
  v16 = objc_msgSend(v6, "enabled");
  if (v12)
    goto LABEL_14;
LABEL_18:
  entitlementAccessSectionController = self->_entitlementAccessSectionController;
  if (!entitlementAccessSectionController)
  {
    v21 = [PKPassShareToggleSectionController alloc];
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_ENTITLEMENT_ACCESS_TOGGLE_TITLE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKPassShareToggleSectionController initWithIdentifier:title:toggleValue:isEditable:delegate:](v21, "initWithIdentifier:title:toggleValue:isEditable:delegate:", CFSTR("EntitlementAccessToggle"), v22, v16, v40, self);
    v24 = self->_entitlementAccessSectionController;
    self->_entitlementAccessSectionController = v23;

    entitlementAccessSectionController = self->_entitlementAccessSectionController;
  }
  objc_msgSend(v42, "insertObject:atIndex:", entitlementAccessSectionController, 0);
  if (objc_msgSend(v6, "isManagingEntitlementConfiguration"))
  {
    capabilitySectionController = self->_capabilitySectionController;
    if (capabilitySectionController)
    {
      -[PKPassEntitlementCapabilitySectionController setIsDisabled:](capabilitySectionController, "setIsDisabled:", v16 ^ 1);
    }
    else
    {
      v26 = -[PKPassEntitlementCapabilitySectionController initWithMode:entitlementComposer:composerView:isDisabled:delegate:]([PKPassEntitlementCapabilitySectionController alloc], "initWithMode:entitlementComposer:composerView:isDisabled:delegate:", self->_mode, self->_entitlementComposer, v6, v16 ^ 1, self);
      v27 = self->_capabilitySectionController;
      self->_capabilitySectionController = v26;

    }
    -[PKPassShareScheduleSectionController setShowTimeLimitHeader:](self->_scheduleSectionController, "setShowTimeLimitHeader:", 1);
    objc_msgSend(v42, "insertObject:atIndex:", self->_capabilitySectionController, 1);
  }
  else
  {
    -[PKPassShareScheduleSectionController setShowTimeLimitHeader:](self->_scheduleSectionController, "setShowTimeLimitHeader:", 0);
  }
LABEL_26:
  if (v15 > 2)
    v28 = 1;
  else
    v28 = v14;
  if (!(_DWORD)v16 && v28)
  {
    advancedScheduleSectionController = self->_advancedScheduleSectionController;
    if (!advancedScheduleSectionController)
    {
      v30 = [PKPassShareToggleSectionController alloc];
      PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_ADVANCED_SCHEDULING_TITLE"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[PKPassShareToggleSectionController initWithIdentifier:title:toggleValue:isEditable:delegate:](v30, "initWithIdentifier:title:toggleValue:isEditable:delegate:", CFSTR("AdvancedScheduleToggle"), v31, v14, v40, self);
      v33 = self->_advancedScheduleSectionController;
      self->_advancedScheduleSectionController = v32;

      v34 = self->_advancedScheduleSectionController;
      PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_ADVANCED_SCHEDULING_EXPLANATION"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareToggleSectionController setFooterText:](v34, "setFooterText:", v35);

      v36 = self->_advancedScheduleSectionController;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar.badge.plus"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareToggleSectionController setIcon:](v36, "setIcon:", v37);

      advancedScheduleSectionController = self->_advancedScheduleSectionController;
    }
    objc_msgSend(v42, "addObject:", advancedScheduleSectionController);
  }
  -[PKDynamicCollectionViewController sections](self, "sections");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = PKEqualObjects();

  if ((v39 & 1) == 0)
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v42, 1);

}

- (void)viewDidLoad
{
  PKPassEntitlementsComposerEntry *entitlementEntry;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassShareTimeLimitViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v6, sel_viewDidLoad);
  entitlementEntry = self->_entitlementEntry;
  if (entitlementEntry)
  {
    -[PKPassEntitlementsComposerEntry displayableEntitlement](entitlementEntry, "displayableEntitlement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareTimeLimitViewController setTitle:](self, "setTitle:", v5);

  }
  else
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULES_TIME_LIMIT_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareTimeLimitViewController setTitle:](self, "setTitle:", v4);
  }

}

- (void)toggle:(id)a3 valueDidChange:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v6;
  int v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;

  v4 = a4;
  v6 = (__CFString *)a3;
  v15 = v6;
  if (v6 == CFSTR("AdvancedScheduleToggle"))
    goto LABEL_4;
  if (v6)
  {
    v7 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("AdvancedScheduleToggle"));

    if (v7)
    {
LABEL_4:
      -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIsManagingTimeConfiguration:", v4 ^ 1);
LABEL_5:

      goto LABEL_6;
    }
    v9 = v15;
    if (v9 == CFSTR("EntitlementAccessToggle")
      || (v10 = v9,
          v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("EntitlementAccessToggle")),
          v10,
          v11))
    {
      if (v4)
      {
        -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "maxSelectionCount");

        if (v13 == 1)
        {
          -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setEnabled:", 0);

        }
      }
      -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", self->_entitlementEntry);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEnabled:", v4);
      goto LABEL_5;
    }
  }
LABEL_6:
  -[PKPassShareTimeLimitViewController _configureSections](self, "_configureSections");
  -[PKDynamicCollectionViewController reloadDataForSection:animated:](self, "reloadDataForSection:animated:", self->_scheduleSectionController, 1);

}

- (void)timeConfigurationDidChange:(id)a3
{
  PKPassEntitlementsComposer *entitlementComposer;
  PKPassEntitlementsComposerEntry *entitlementEntry;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  entitlementComposer = self->_entitlementComposer;
  entitlementEntry = self->_entitlementEntry;
  v6 = a3;
  -[PKPassEntitlementsComposer viewFor:](entitlementComposer, "viewFor:", entitlementEntry);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "setTimeConfiguration:", v6);
  -[PKPassShareScheduleSectionController setConfiguration:](self->_scheduleSectionController, "setConfiguration:", v6);

}

- (void)didSelectEditStartDate
{
  -[PKPassShareTimeLimitViewController _showTimeLimitEditForStartDate:expirationDate:](self, "_showTimeLimitEditForStartDate:expirationDate:", 1, 0);
}

- (void)didSelectEditEndDate
{
  -[PKPassShareTimeLimitViewController _showTimeLimitEditForStartDate:expirationDate:](self, "_showTimeLimitEditForStartDate:expirationDate:", 0, 1);
}

- (void)_showTimeLimitEditForStartDate:(BOOL)a3 expirationDate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  PKPassShareSelectDateViewController *v28;
  id v29;
  id v30;
  void *v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  BOOL v37;
  id location;

  v4 = a3;
  -[PKPassEntitlementsComposer viewFor:](self->_entitlementComposer, "viewFor:", self->_entitlementEntry, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PKPassEntitlementsComposer globalView](self->_entitlementComposer, "globalView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "possibleTimeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v32 = v4;
  if (v4)
  {
    objc_msgSend(v12, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      v16 = CFSTR("SHARE_SCHEDULES_EDIT_START_DATE_TITLE");
LABEL_9:
      v18 = v15;
      goto LABEL_12;
    }
    objc_msgSend(v10, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = CFSTR("SHARE_SCHEDULES_EDIT_START_DATE_TITLE");
  }
  else
  {
    objc_msgSend(v12, "expirationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v15 = v17;
      v16 = CFSTR("SHARE_SCHEDULES_EDIT_EXPIRATION_DATE_TITLE");
      goto LABEL_9;
    }
    objc_msgSend(v10, "expirationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = CFSTR("SHARE_SCHEDULES_EDIT_EXPIRATION_DATE_TITLE");
  }
LABEL_12:

  objc_msgSend(v18, "laterDate:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "laterDate:", v11);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (void *)v21;
  else
    v23 = v11;
  v24 = v23;

  objc_msgSend(v10, "expirationDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "laterDate:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedShareableCredentialString(&v16->isa);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PKPassShareSelectDateViewController initWithDate:minimumDate:maximumDate:title:]([PKPassShareSelectDateViewController alloc], "initWithDate:minimumDate:maximumDate:title:", v19, v24, v26, v27);
  objc_initWeak(&location, self);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __84__PKPassShareTimeLimitViewController__showTimeLimitEditForStartDate_expirationDate___block_invoke;
  v33[3] = &unk_1E3E64648;
  objc_copyWeak(&v36, &location);
  v29 = v9;
  v34 = v29;
  v30 = v10;
  v35 = v30;
  v37 = v32;
  -[PKPassShareSelectDateViewController setDateChangeHandler:](v28, "setDateChangeHandler:", v33);
  -[PKPassShareTimeLimitViewController navigationController](self, "navigationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pushViewController:animated:", v28, 1);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __84__PKPassShareTimeLimitViewController__showTimeLimitEditForStartDate_expirationDate___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v7 = v6;

    if (*(_BYTE *)(a1 + 56))
    {
      PKStartOfDay();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStartDate:", v8);
      objc_msgSend(v7, "expirationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 || objc_msgSend(v14, "compare:", v9) != 1)
        goto LABEL_16;
      objc_msgSend(*(id *)(a1 + 40), "expirationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKStartOfDay();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExpirationDate:", v11);

    }
    else
    {
      PKEndOfDay();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExpirationDate:", v8);
      objc_msgSend(v7, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 || objc_msgSend(v14, "compare:", v9) != -1)
        goto LABEL_16;
      objc_msgSend(*(id *)(a1 + 40), "startDate");
      v12 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v12;
      if (v12)
        v13 = (void *)v12;
      else
        v13 = v8;
      objc_msgSend(v7, "setStartDate:", v13);
    }

LABEL_16:
    objc_msgSend(WeakRetained, "timeConfigurationDidChange:", v7);
    objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_entitlementEntry, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_capabilitySectionController, 0);
  objc_storeStrong((id *)&self->_entitlementAccessSectionController, 0);
  objc_storeStrong((id *)&self->_advancedScheduleSectionController, 0);
  objc_storeStrong((id *)&self->_scheduleSectionController, 0);
}

@end
