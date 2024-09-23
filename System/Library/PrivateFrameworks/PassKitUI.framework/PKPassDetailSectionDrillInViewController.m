@implementation PKPassDetailSectionDrillInViewController

- (PKPassDetailSectionDrillInViewController)initWithPass:(id)a3 field:(id)a4 useBridgeStyle:(BOOL)a5 isShowingSecureInformation:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  PKPassDetailSectionDrillInViewController *v12;
  PKConfigurablePassDetailSectionsController *v13;
  void *v14;
  uint64_t v15;
  PKConfigurablePassDetailSectionsController *sectionController;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[2];

  v6 = a6;
  v7 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPassDetailSectionDrillInViewController;
  v12 = -[PKDynamicTableViewController init](&v24, sel_init);
  if (v12)
  {
    v13 = [PKConfigurablePassDetailSectionsController alloc];
    objc_msgSend(v11, "sectionIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKConfigurablePassDetailSectionsController initWithPaymentPass:forSelectSections:](v13, "initWithPaymentPass:forSelectSections:", v10, v14);
    sectionController = v12->_sectionController;
    v12->_sectionController = (PKConfigurablePassDetailSectionsController *)v15;

    -[PKConfigurablePassDetailSectionsController setUseBridgeStyle:](v12->_sectionController, "setUseBridgeStyle:", v7);
    v25[0] = v12->_sectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicTableViewController setSectionControllers:](v12, "setSectionControllers:", v17);

    -[PKPassDetailSectionDrillInViewController navigationItem](v12, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v19, "configureWithOpaqueBackground");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    objc_msgSend(v18, "setStandardAppearance:", v19);
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 1.0);
    objc_msgSend(v11, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDetailSectionDrillInViewController setTitle:](v12, "setTitle:", v21);

    if (v6)
    {
      -[PKPassDetailSectionDrillInViewController tableView](v12, "tableView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);

    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
