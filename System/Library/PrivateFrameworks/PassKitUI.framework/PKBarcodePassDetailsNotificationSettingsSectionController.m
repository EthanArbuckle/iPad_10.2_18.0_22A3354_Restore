@implementation PKBarcodePassDetailsNotificationSettingsSectionController

+ (BOOL)validForPass:(id)a3
{
  return 1;
}

- (PKBarcodePassDetailsNotificationSettingsSectionController)init
{

  return 0;
}

- (PKBarcodePassDetailsNotificationSettingsSectionController)initWithPass:(id)a3 detailViewStyle:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKBarcodePassDetailsNotificationSettingsSectionController *v11;
  uint64_t v12;
  NSArray *allSectionIdentifiers;
  uint64_t v14;
  NSArray *sectionIdentifiers;
  void *v16;
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKBarcodePassDetailsNotificationSettingsSectionController;
  v11 = -[PKBarcodePassDetailsNotificationSettingsSectionController init](&v18, sel_init);
  if (v11)
  {
    v20[0] = CFSTR("BarcodePassNotificationsSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    allSectionIdentifiers = v11->_allSectionIdentifiers;
    v11->_allSectionIdentifiers = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_pass, a3);
    v11->_detailViewStyle = a4;
    objc_storeWeak((id *)&v11->_delegate, v10);
    if (-[PKBarcodePassDetailsNotificationSettingsSectionController _shouldMapSection](v11, "_shouldMapSection"))
    {
      v19 = CFSTR("BarcodePassNotificationsSectionIdentifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      sectionIdentifiers = v11->_sectionIdentifiers;
      v11->_sectionIdentifiers = (NSArray *)v14;
    }
    else
    {
      sectionIdentifiers = v11->_sectionIdentifiers;
      v11->_sectionIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    PKObservePassSettingsChanged();
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__passSettingsChanged_, *MEMORY[0x1E0D6A7C0], 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  PKUnregisterPassSettingsChangedObserver();
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKBarcodePassDetailsNotificationSettingsSectionController;
  -[PKBarcodePassDetailsNotificationSettingsSectionController dealloc](&v4, sel_dealloc);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6;
  void *v7;

  v6 = a4;
  if (PKEqualObjects())
  {
    -[PKBarcodePassDetailsNotificationSettingsSectionController _settingsCellForRow:](self, "_settingsCellForRow:", objc_msgSend(v6, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  return 0;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (int64_t)_countOfRows
{
  return objc_msgSend((id)objc_opt_class(), "_countOfRowsForPass:", self->_pass);
}

- (id)_indexPathForRowType:(int64_t)a3
{
  id WeakRetained;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "indexOfSectionIdentifier:", CFSTR("BarcodePassNotificationsSectionIdentifier"));

  if (-[PKBarcodePassDetailsNotificationSettingsSectionController _countOfRows](self, "_countOfRows") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_cellForType:(int64_t)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[PKBarcodePassDetailsNotificationSettingsSectionController _indexPathForRowType:](self, "_indexPathForRowType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)canShowSectionforPass:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isUpdatable") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasTimeOrLocationRelevancyInfo");

  return v4;
}

+ (int64_t)_countOfRowsForPass:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "isUpdatable"))
  {
    if ((objc_msgSend(v3, "settings") & 2) != 0)
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4 + objc_msgSend(v3, "hasTimeOrLocationRelevancyInfo");

  return v5;
}

- (BOOL)_shouldMapSection
{
  return objc_msgSend((id)objc_opt_class(), "canShowSectionforPass:", self->_pass);
}

- (unint64_t)_settingForRow:(unint64_t)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  if (-[PKPass isUpdatable](self->_pass, "isUpdatable"))
  {
    v5 = -[PKPass settings](self->_pass, "settings");
    v6 = 0;
    if ((v5 & 2) != 0)
      v7 = 1;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v5 & 2) != 0)
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = -[PKPass hasTimeOrLocationRelevancyInfo](self->_pass, "hasTimeOrLocationRelevancyInfo");
  if (v9)
    v10 = v8;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 + (unint64_t)v9 <= a3)
    return 0;
  if (v6 == a3)
    return 2;
  if (v7 == a3)
    return 128;
  return v10 == a3;
}

- (id)_settingsCellForRow:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  PKSettingTableCell *v6;
  void *v7;
  PKSettingTableCell *v8;
  _QWORD *v9;
  PKSettingTableCell *v10;
  void *v11;
  PKSettingTableCell *v12;
  void *v13;

  v4 = -[PKBarcodePassDetailsNotificationSettingsSectionController _settingForRow:](self, "_settingForRow:", a3);
  v5 = -[PKPass settings](self->_pass, "settings");
  switch(v4)
  {
    case 1uLL:
      v10 = [PKSettingTableCell alloc];
      PKLocalizedString(CFSTR("SETTINGS_SHOW_ON_LOCKSCREEN_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKSettingTableCell initWithTitle:target:action:](v10, "initWithTitle:target:action:", v11, 0, 0);

      -[PKSettingTableCell setOn:](v8, "setOn:", v5 & 1);
      v9 = (_QWORD *)MEMORY[0x1E0D680D0];
      break;
    case 0x80uLL:
      v12 = [PKSettingTableCell alloc];
      PKLocalizedString(CFSTR("SETTINGS_SHOW_NOTIFICATIONS_TITLE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKSettingTableCell initWithTitle:target:action:](v12, "initWithTitle:target:action:", v13, 0, 0);

      -[PKSettingTableCell setOn:](v8, "setOn:", (v5 & 0x80) == 0);
      v9 = (_QWORD *)MEMORY[0x1E0D67898];
      break;
    case 2uLL:
      v6 = [PKSettingTableCell alloc];
      PKLocalizedString(CFSTR("SETTINGS_NOTIFY_ME_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PKSettingTableCell initWithTitle:target:action:](v6, "initWithTitle:target:action:", v7, 0, 0);

      -[PKSettingTableCell setOn:](v8, "setOn:", (v5 >> 1) & 1);
      v9 = (_QWORD *)MEMORY[0x1E0D67900];
      break;
    default:
      v8 = 0;
      goto LABEL_9;
  }
  -[PKSettingTableCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", *v9);
LABEL_9:
  -[PKSettingTableCell setTarget:action:](v8, "setTarget:action:", self, sel_pushSettingsFromViewToModel);
  return v8;
}

- (void)pushSettingsFromViewToModel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id WeakRetained;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PKPass settings](self->_pass, "settings");
  -[PKBarcodePassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBarcodePassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBarcodePassDetailsNotificationSettingsSectionController _cellForType:](self, "_cellForType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v7 = v3;
    if (!v5)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isOn"))
    v7 = v3 | 2;
  else
    v7 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  if (v5)
  {
LABEL_6:
    if ((objc_msgSend(v5, "isOn") & 1) != 0)
      v7 &= ~0x80uLL;
    else
      v7 |= 0x80uLL;
  }
LABEL_9:
  if (v6)
  {
    if (objc_msgSend(v6, "isOn"))
      v7 |= 1uLL;
    else
      v7 &= ~1uLL;
  }
  v8 = v7 ^ v3;
  if (((v7 ^ v3) & 2) != 0)
  {
    v9 = *MEMORY[0x1E0D68360];
    v18 = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v7 >> 1) & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v9, v11);

  }
  if ((v8 & 1) != 0)
  {
    v12 = *MEMORY[0x1E0D68358];
    v16 = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 & 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE3A74](v12, v14);

  }
  -[PKPass setSettings:](self->_pass, "setSettings:", (2 * v8) & 0x20 | v7);
  if ((v8 & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadSectionIdentifier:", CFSTR("BarcodePassNotificationsSectionIdentifier"));

  }
}

- (void)_passSettingsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D6A7F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass uniqueID](self->_pass, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D6A7E8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __82__PKBarcodePassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke;
      v12[3] = &unk_1E3E62010;
      v12[4] = self;
      v12[5] = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    }

  }
}

void __82__PKBarcodePassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSettingsWithoutUpdatingDataAccessor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_cellForType:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cellForType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cellForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4 = objc_msgSend(v7, "isOn");
    v5 = (*(_QWORD *)(a1 + 40) >> 1) & 1;
    objc_msgSend(v7, "setOn:notify:", v5, 0);
    objc_msgSend(v2, "setOn:notify:", (*(_QWORD *)(a1 + 40) & 0x80) == 0, 0);
    objc_msgSend(v3, "setOn:notify:", *(_DWORD *)(a1 + 40) & 1, 0);
    if (v4 != (_DWORD)v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(WeakRetained, "reloadSectionIdentifier:", CFSTR("BarcodePassNotificationsSectionIdentifier"));

    }
  }
  else
  {
    objc_msgSend(0, "setOn:notify:", (*(_QWORD *)(a1 + 40) >> 1) & 1, 0);
    objc_msgSend(v2, "setOn:notify:", (*(_QWORD *)(a1 + 40) & 0x80) == 0, 0);
    objc_msgSend(v3, "setOn:notify:", *(_DWORD *)(a1 + 40) & 1, 0);
  }

}

- (NSArray)allSectionIdentifiers
{
  return self->_allSectionIdentifiers;
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (PKBarcodePassDetailsNotificationSettingsSectionControllerDelegate)delegate
{
  return (PKBarcodePassDetailsNotificationSettingsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
