@implementation PXSharedLibraryAssistantParticipantViewController

- (PXSharedLibraryAssistantParticipantViewController)initWithAssistantViewModel:(id)a3 participantViewModel:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PXSharedLibraryAssistantParticipantViewController *v11;
  PXSharedLibraryAssistantParticipantViewController *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryAssistantParticipantViewController;
  v11 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v14, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v9, v10, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assistantViewModel, a3);
    objc_storeStrong((id *)&v12->_participantViewModel, a4);
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  PXSharedLibraryParticipantTableViewController *v4;
  void *v5;
  PXSharedLibraryParticipantTableViewController *v6;
  PXSharedLibraryParticipantTableViewController *tableViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OBTrayButton *titleButton;
  id v15;
  OBLinkTrayButton *v16;
  OBLinkTrayButton *addLaterButton;
  OBLinkTrayButton *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibraryAssistantParticipantViewController;
  -[OBTableWelcomeController viewDidLoad](&v21, sel_viewDidLoad);
  -[PXSharedLibraryAssistantParticipantViewController assistantViewModel](self, "assistantViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PXSharedLibraryAssistantViewModelObservationContext);
  v4 = [PXSharedLibraryParticipantTableViewController alloc];
  objc_msgSend(v3, "participantDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSharedLibraryParticipantTableViewController initWithDataSourceManager:](v4, "initWithDataSourceManager:", v5);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v6;

  -[PXSharedLibraryParticipantTableViewController setDelegate:](self->_tableViewController, "setDelegate:", self);
  -[PXSharedLibraryParticipantTableViewController tableView](self->_tableViewController, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[OBTableWelcomeController setTableView:](self, "setTableView:", v8);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Continue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantParticipantViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v10);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_continueButtonTapped_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantParticipantViewController addKeyCommand:](self, "addKeyCommand:", v13);

  titleButton = self->_titleButton;
  self->_titleButton = (OBTrayButton *)v10;
  v15 = v10;

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v16 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  addLaterButton = self->_addLaterButton;
  self->_addLaterButton = v16;

  v18 = self->_addLaterButton;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_AddLater"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v18, "setTitle:forState:", v19, 0);

  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_addLaterButton, "addTarget:action:forControlEvents:", self, sel_addLaterButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantParticipantViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", self->_addLaterButton);

  -[PXSharedLibraryAssistantParticipantViewController _updateButtonsAppearance](self, "_updateButtonsAppearance");
  -[PXSharedLibraryAssistantParticipantViewController _updateIcon](self, "_updateIcon");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantParticipantViewController;
  v4 = a3;
  -[PXSharedLibraryAssistantParticipantViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryAssistantParticipantViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryAssistantParticipantViewController _updateIcon](self, "_updateIcon");

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 forSharedLibraryParticipantTableViewController:(id)a5
{
  -[PXSharedLibraryAssistantParticipantViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, a4, 0);
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forSharedLibraryParticipantTableViewController:(id)a4
{
  -[PXSharedLibraryAssistantParticipantViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (void)_updateTableViewLayoutConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *tableViewLayoutConstraints;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_tableViewLayoutConstraints);
  -[PXSharedLibraryParticipantTableViewController tableViewHeight](self->_tableViewController, "tableViewHeight");
  v4 = v3;
  -[PXSharedLibraryParticipantTableViewController tableView](self->_tableViewController, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tableViewLayoutConstraints = self->_tableViewLayoutConstraints;
  self->_tableViewLayoutConstraints = v8;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_tableViewLayoutConstraints);
}

- (void)_updateButtonsAppearance
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  -[PXSharedLibraryAssistantParticipantViewController assistantViewModel](self, "assistantViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v7, "phoneNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  -[OBTrayButton setEnabled:](self->_titleButton, "setEnabled:", v5);
  -[OBLinkTrayButton setEnabled:](self->_addLaterButton, "setEnabled:", v5 ^ 1);

}

- (void)_updateIcon
{
  void *v3;
  id v4;

  PXSharedLibraryCreatePlatterImage(CFSTR("person.crop.circle.badge.plus"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantParticipantViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:accessibilityLabel:", v4, 0);

}

- (void)_continueAssistant
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantParticipantViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[PXSharedLibraryAssistantParticipantViewController _continueAssistant]";
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle %s", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "stepForwardInAssistantForAssistantViewController:", self);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x20) != 0 && (void *)PXSharedLibraryAssistantViewModelObservationContext == a5)
    -[PXSharedLibraryAssistantParticipantViewController _updateButtonsAppearance](self, "_updateButtonsAppearance", a3);
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (PXSharedLibraryAssistantViewModel)assistantViewModel
{
  return self->_assistantViewModel;
}

- (PXSharedLibraryAssistantParticipantViewModel)participantViewModel
{
  return self->_participantViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantViewModel, 0);
  objc_storeStrong((id *)&self->_assistantViewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_addLaterButton, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_tableViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
}

@end
