@implementation PXSharedLibraryAssistantRulesViewController

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__PXSharedLibraryAssistantRulesViewController_Internal_PHPickerViewControllerDelegate__picker_didFinishPicking___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

uint64_t __112__PXSharedLibraryAssistantRulesViewController_Internal_PHPickerViewControllerDelegate__picker_didFinishPicking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePickerResults:", *(_QWORD *)(a1 + 40));
}

- (void)continueAndSkipMovingItems
{
  void *v3;

  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_75615);

  -[PXSharedLibraryAssistantRulesViewController _continueWithPolicy:](self, "_continueWithPolicy:", 0);
}

- (void)continueWithSelectedRuleType
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "selectedRuleType");
  v5 = &__block_literal_global_132;
  switch(v4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", &__block_literal_global_132);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantRulesViewController+Internal.m"), 44, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      goto LABEL_3;
    case 2:
      v5 = &__block_literal_global_133_75612;
LABEL_3:
      objc_msgSend(v7, "performChanges:", v5);
      goto LABEL_5;
    case 3:
      objc_msgSend(v7, "performChanges:", &__block_literal_global_134);
      -[PXSharedLibraryAssistantRulesViewController _continueWithPhotosPicker](self, "_continueWithPhotosPicker");
      goto LABEL_7;
    default:
      v4 = 0;
LABEL_5:
      -[PXSharedLibraryAssistantRulesViewController _continueWithPolicy:](self, "_continueWithPolicy:", v4);
LABEL_7:

      return;
  }
}

- (NSString)footerText
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRuleType");

  if ((unint64_t)(v3 - 1) >= 2)
    v4 = CFSTR("PXSharedLibraryAssistant_Rules_Footer_PreviewBefore");
  else
    v4 = CFSTR("PXSharedLibraryAssistant_Rules_Footer_AlbumsNotIncluded_And_PreviewBefore");
  PXLocalizedSharedLibraryString(v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_continueWithPolicy:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PXSharedLibraryAssistantRulesViewController_Internal___continueWithPolicy___block_invoke;
  v8[3] = &__block_descriptor_40_e52_v16__0___PXSharedLibraryAssistantMutableViewModel__8l;
  v8[4] = a3;
  objc_msgSend(v5, "performChanges:", v8);

  -[PXSharedLibraryAssistantRulesViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PXSharedLibraryAssistantRulesViewController(Internal) _continueWithPolicy:]";
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Missing delegate: %s", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "stepForwardInAssistantForAssistantViewController:", self);

}

- (void)_continueWithPhotosPicker
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceLibraryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSelectionLimit:", 0);
  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetLocalIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "setPreselectedAssetIdentifiers:", v8);

  objc_msgSend(v10, "setDisabledCapabilities:", 16);
  objc_msgSend(v10, "_setDisabledPrivateCapabilities:", 7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v10);
  objc_msgSend(v9, "setDelegate:", self);
  -[PXSharedLibraryAssistantRulesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_handlePickerResults:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PXSharedLibraryAssistantRulesViewController_Internal___handlePickerResults___block_invoke_2;
  v7[3] = &unk_1E5144D60;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performChanges:", v7);

  if (objc_msgSend(v6, "count"))
    -[PXSharedLibraryAssistantRulesViewController _continueWithPolicy:](self, "_continueWithPolicy:", 0);

}

uint64_t __78__PXSharedLibraryAssistantRulesViewController_Internal___handlePickerResults___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssetLocalIdentifiers:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__PXSharedLibraryAssistantRulesViewController_Internal___handlePickerResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

uint64_t __77__PXSharedLibraryAssistantRulesViewController_Internal___continueWithPolicy___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAutoSharePolicy:", *(_QWORD *)(a1 + 32));
}

void __85__PXSharedLibraryAssistantRulesViewController_Internal__continueWithSelectedRuleType__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setStartDate:", 0);
  v2 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "setPersonUUIDs:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v3, "setAssetLocalIdentifiers:", v2);

}

uint64_t __85__PXSharedLibraryAssistantRulesViewController_Internal__continueWithSelectedRuleType__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssetLocalIdentifiers:", MEMORY[0x1E0C9AA60]);
}

void __85__PXSharedLibraryAssistantRulesViewController_Internal__continueWithSelectedRuleType__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStartDate:", 0);
  objc_msgSend(v2, "setPersonUUIDs:", MEMORY[0x1E0C9AA60]);

}

uint64_t __83__PXSharedLibraryAssistantRulesViewController_Internal__continueAndSkipMovingItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssetLocalIdentifiers:", MEMORY[0x1E0C9AA60]);
}

- (PXSharedLibraryAssistantRulesViewController)initWithViewModel:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  PXSharedLibraryAssistantRulesViewController *v9;
  PXSharedLibraryAssistantRulesViewController *v10;
  uint64_t v11;
  NSArray *listViewItems;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantRulesViewController+iOS.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_Title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_Subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryAssistantRulesViewController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v15, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v7, v8, 0, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    PXSharedLibraryAssistantRulesListViewItems(-[PXSharedLibraryAssistantViewModel shouldShowPeopleState](v10->_viewModel, "shouldShowPeopleState") == 1);
    v11 = objc_claimAutoreleasedReturnValue();
    listViewItems = v10->_listViewItems;
    v10->_listViewItems = (NSArray *)v11;

  }
  return v10;
}

- (void)_updateIcon
{
  void *v3;
  id v4;

  PXSharedLibraryCreatePlatterImage(CFSTR("photo.on.rectangle.angled"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantRulesViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:accessibilityLabel:", v4, 0);

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  OBBoldTrayButton *v6;
  OBBoldTrayButton *continueButton;
  OBBoldTrayButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryAssistantRulesViewController;
  -[OBTableWelcomeController viewDidLoad](&v16, sel_viewDidLoad);
  -[PXSharedLibraryAssistantRulesViewController _updateIcon](self, "_updateIcon");
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setAllowsSelection:", 1);
  objc_msgSend(v4, "setAllowsMultipleSelection:", 0);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v6;

  v8 = self->_continueButton;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Continue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v8, "setTitle:forState:", v9, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantRulesViewController viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", objc_msgSend(v10, "selectedRuleType") != 0);

  -[PXSharedLibraryAssistantRulesViewController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", self->_continueButton);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_continueButtonTapped_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantRulesViewController addKeyCommand:](self, "addKeyCommand:", v12);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_MoveLater"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v14, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_addLaterButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantRulesViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", v13);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantRulesViewController;
  v4 = a3;
  -[PXSharedLibraryAssistantRulesViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryAssistantRulesViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryAssistantRulesViewController _updateIcon](self, "_updateIcon");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_listViewItems, "count", a3, a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
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
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("PXSharedLibraryRulesTableViewCellReuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "contentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PXSharedLibraryRulesTableViewCellReuseIdentifier"));
    objc_msgSend(v9, "defaultContentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v10, "secondaryTextProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secondaryTextProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC34D8], "listPlainCellConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    objc_msgSend(v9, "setBackgroundConfiguration:", v15);
  }
  -[NSArray objectAtIndexedSubscript:](self->_listViewItems, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "systemImageName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryCellSystemImageNamed(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v19);

  objc_msgSend(v17, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v20);

  objc_msgSend(v9, "setContentConfiguration:", v10);
  v21 = objc_msgSend(v17, "tag");
  if (v21 == -[PXSharedLibraryAssistantViewModel selectedRuleType](self->_viewModel, "selectedRuleType"))
  {
    objc_msgSend(v9, "setAccessoryType:", 3);
    if ((objc_msgSend(v9, "isSelected") & 1) == 0)
      objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);
  }
  else
  {
    objc_msgSend(v9, "setAccessoryType:", 0);
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  OBBoldTrayButton *continueButton;
  id v6;
  void *v7;
  PXSharedLibraryAssistantViewModel *viewModel;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  continueButton = self->_continueButton;
  v6 = a4;
  -[OBBoldTrayButton setEnabled:](continueButton, "setEnabled:", 1);
  -[NSArray objectAtIndexedSubscript:](self->_listViewItems, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  viewModel = self->_viewModel;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PXSharedLibraryAssistantRulesViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v13[3] = &unk_1E5144D60;
  v14 = v7;
  v9 = v7;
  -[PXSharedLibraryAssistantViewModel performChanges:](viewModel, "performChanges:", v13);
  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellForRowAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessoryType:", 3);
  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessoryType:", 0);
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_listViewItems, 0);
}

void __81__PXSharedLibraryAssistantRulesViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSelectedRuleType:", objc_msgSend(v2, "tag"));

}

@end
