@implementation PXSharedLibraryExitAssistantViewController

- (PXSharedLibraryExitAssistantViewController)initWithOwnerAsCurrentUser:(BOOL)a3 keepAllCountsString:(id)a4 contributedOnlyCountsString:(id)a5
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PXSharedLibraryExitAssistantViewController *v13;
  PXSharedLibraryExitAssistantViewController *v14;
  objc_super v16;

  v7 = a3;
  v9 = a4;
  v10 = a5;
  PXSharedLibraryExitAssistantViewTitle(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryExitAssistantViewSubtitle(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryExitAssistantViewController;
  v13 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v16, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v11, v12, 0, 1);
  v14 = v13;
  if (v13)
  {
    v13->_exitRetentionPolicy = 0;
    v13->_currentUserIsOwner = v7;
    objc_storeStrong((id *)&v13->_keepAllCountsString, a4);
    objc_storeStrong((id *)&v14->_contributedOnlyCountsString, a5);
  }

  return v14;
}

- (void)setDisableControlsWithBusyIndicator:(BOOL)a3
{
  if (self->_disableControlsWithBusyIndicator != a3)
  {
    self->_disableControlsWithBusyIndicator = a3;
    -[PXSharedLibraryExitAssistantViewController _updateTableView](self, "_updateTableView");
    -[PXSharedLibraryExitAssistantViewController _updateExitButton](self, "_updateExitButton");
    -[PXSharedLibraryExitAssistantViewController _updateCancelButton](self, "_updateCancelButton");
  }
}

- (UIPopoverPresentationControllerSourceItem)exitButtonSourceItem
{
  return self->_exitButton;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  OBBoldTrayButton *v7;
  OBBoldTrayButton *exitButton;
  void *v9;
  void *v10;
  OBLinkTrayButton *v11;
  OBLinkTrayButton *cancelButton;
  OBLinkTrayButton *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryExitAssistantViewController;
  -[OBTableWelcomeController viewDidLoad](&v16, sel_viewDidLoad);
  -[PXSharedLibraryExitAssistantViewController _updateIcon](self, "_updateIcon");
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);
  PXSharedLibraryExitAssistantViewButtonTitle(self->_currentUserIsOwner);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v7 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  exitButton = self->_exitButton;
  self->_exitButton = v7;

  -[OBBoldTrayButton setTitle:forState:](self->_exitButton, "setTitle:forState:", v6, 0);
  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_exitButton, "addTarget:action:forControlEvents:", self, sel_exitButtonTapped_, 0x2000);
  -[PXSharedLibraryExitAssistantViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", self->_exitButton);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_exitButtonTapped_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryExitAssistantViewController addKeyCommand:](self, "addKeyCommand:", v10);

  -[PXSharedLibraryExitAssistantViewController _updateExitButton](self, "_updateExitButton");
  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v11 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v11;

  v13 = self->_cancelButton;
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v13, "setTitle:forState:", v14, 0);

  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel_cancelButtonTapped_, 0x2000);
  -[PXSharedLibraryExitAssistantViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", self->_cancelButton);

  -[PXSharedLibraryExitAssistantViewController _updateCancelButton](self, "_updateCancelButton");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryExitAssistantViewController;
  v4 = a3;
  -[PXSharedLibraryExitAssistantViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryExitAssistantViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryExitAssistantViewController _updateIcon](self, "_updateIcon");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  int *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("CellIdentifier"));
    objc_msgSend(v7, "setSelectionStyle:", 0);
  }
  v8 = -[PXSharedLibraryExitAssistantViewController disableControlsWithBusyIndicator](self, "disableControlsWithBusyIndicator");
  v9 = objc_msgSend(v6, "item");

  if (!v9)
  {
    v10 = &OBJC_IVAR___PXSharedLibraryExitAssistantViewController__keepAllCountsString;
    v11 = 2;
    v12 = CFSTR("PXSharedLibraryExitAssistant_ExitRetentionPolicy_KeepAll_iOS");
LABEL_7:
    PXLocalizedSharedLibraryString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(id *)((char *)&self->super.super.super.super.super.super.isa + *v10);
    if (self->_exitRetentionPolicy == v11)
      v15 = 3;
    else
      v15 = 0;
    goto LABEL_11;
  }
  if (v9 == 1)
  {
    v10 = &OBJC_IVAR___PXSharedLibraryExitAssistantViewController__contributedOnlyCountsString;
    v11 = 1;
    v12 = CFSTR("PXSharedLibraryExitAssistant_ExitRetentionPolicy_ContributedOnly_iOS");
    goto LABEL_7;
  }
  v14 = 0;
  v15 = 0;
  v13 = 0;
LABEL_11:
  objc_msgSend(v7, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v13);
  if (v8)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v17);

  objc_msgSend(v16, "setNumberOfLines:", 0);
  objc_msgSend(v16, "setLineBreakMode:", 0);
  objc_msgSend(v7, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v14);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v19);

  objc_msgSend(v7, "setAccessoryType:", v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v20);

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (-[PXSharedLibraryExitAssistantViewController disableControlsWithBusyIndicator](self, "disableControlsWithBusyIndicator"))
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = objc_msgSend(v6, "item");
  if (v7)
    v8 = v7 == 1;
  else
    v8 = 2;
  -[PXSharedLibraryExitAssistantViewController setExitRetentionPolicy:](self, "setExitRetentionPolicy:", v8);
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)exitButtonTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryExitAssistantViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[PXSharedLibraryExitAssistantViewController exitButtonTapped:]";
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v4, "completeExitAssistantViewController:withExitRetentionPolicy:", self, -[PXSharedLibraryExitAssistantViewController exitRetentionPolicy](self, "exitRetentionPolicy"));

}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryExitAssistantViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[PXSharedLibraryExitAssistantViewController cancelButtonTapped:]";
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v4, "cancelExitAssistantViewController:", self);

}

- (void)_updateIcon
{
  __CFString *v3;
  void *v4;
  id v5;

  if (self->_currentUserIsOwner)
    v3 = CFSTR("xmark.circle.fill");
  else
    v3 = CFSTR("minus.circle.fill");
  PXSharedLibraryCreatePlatterImage(CFSTR("person.2.fill"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryExitAssistantViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:accessibilityLabel:", v5, 0);

}

- (void)_updateTableView
{
  id v2;

  -[OBTableWelcomeController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_updateExitButton
{
  _BOOL4 v3;
  OBBoldTrayButton *exitButton;

  -[OBBoldTrayButton setEnabled:](self->_exitButton, "setEnabled:", self->_exitRetentionPolicy != 0);
  v3 = -[PXSharedLibraryExitAssistantViewController disableControlsWithBusyIndicator](self, "disableControlsWithBusyIndicator");
  exitButton = self->_exitButton;
  if (v3)
    -[OBBoldTrayButton showsBusyIndicator](exitButton, "showsBusyIndicator");
  else
    -[OBBoldTrayButton hidesBusyIndicator](exitButton, "hidesBusyIndicator");
}

- (void)_updateCancelButton
{
  -[OBLinkTrayButton setEnabled:](self->_cancelButton, "setEnabled:", -[PXSharedLibraryExitAssistantViewController disableControlsWithBusyIndicator](self, "disableControlsWithBusyIndicator") ^ 1);
}

- (void)setExitRetentionPolicy:(int64_t)a3
{
  if (self->_exitRetentionPolicy != a3)
  {
    self->_exitRetentionPolicy = a3;
    -[PXSharedLibraryExitAssistantViewController _updateTableView](self, "_updateTableView");
    -[PXSharedLibraryExitAssistantViewController _updateExitButton](self, "_updateExitButton");
  }
}

- (PXSharedLibraryExitAssistantViewControllerDelegate)delegate
{
  return (PXSharedLibraryExitAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disableControlsWithBusyIndicator
{
  return self->_disableControlsWithBusyIndicator;
}

- (int64_t)exitRetentionPolicy
{
  return self->_exitRetentionPolicy;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contributedOnlyCountsString, 0);
  objc_storeStrong((id *)&self->_keepAllCountsString, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_exitButton, 0);
}

@end
