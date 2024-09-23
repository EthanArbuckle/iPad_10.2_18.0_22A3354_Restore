@implementation PKCombinedSelectActionGroupViewControllerListSectionController

- (PKCombinedSelectActionGroupViewControllerListSectionController)initWithIdentifier:(id)a3 pass:(id)a4 actionGroups:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKCombinedSelectActionGroupViewControllerListSectionController *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PKPaymentPassActionGroupViewModel *v19;
  uint64_t v20;
  NSArray *actionGroupViewModels;
  void *v22;
  uint64_t v23;
  PKCombinedSelectActionGroupViewControllerListSectionController *v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  PKCombinedSelectActionGroupViewControllerListSectionController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKCombinedSelectActionGroupViewControllerListSectionController;
  v11 = -[PKCombinedSelectActionGroupViewControllerListSectionController init](&v34, sel_init);
  if (v11)
  {
    v27 = v9;
    v36[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setIdentifiers:](v11, "setIdentifiers:", v12);

    -[PKDynamicListSectionController setHeaderText:](v11, "setHeaderText:", CFSTR(" "));
    objc_storeStrong((id *)&v11->_pass, a4);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = -[PKPaymentPassActionGroupViewModel initWithActionGroup:]([PKPaymentPassActionGroupViewModel alloc], "initWithActionGroup:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18));
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }

    v20 = objc_msgSend(v13, "copy");
    actionGroupViewModels = v11->_actionGroupViewModels;
    v11->_actionGroupViewModels = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0DC35C8];
    v23 = objc_opt_class();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __103__PKCombinedSelectActionGroupViewControllerListSectionController_initWithIdentifier_pass_actionGroups___block_invoke;
    v28[3] = &unk_1E3E6DD88;
    v24 = v11;
    v29 = v24;
    objc_msgSend(v22, "registrationWithCellClass:configurationHandler:", v23, v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCombinedSelectActionGroupViewControllerListSectionController setCellRegistration:](v24, "setCellRegistration:", v25);

    v9 = v27;
  }

  return v11;
}

void __103__PKCombinedSelectActionGroupViewControllerListSectionController_initWithIdentifier_pass_actionGroups___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0DC39A8];
  v7 = a4;
  objc_msgSend(v6, "subtitleCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionGroupDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKCommutePlanFormatTitleFromLabelAndValue();
  v11 = v10;

  v12 = v22;
  objc_msgSend(v8, "setText:", v11);
  objc_msgSend(v8, "setSecondaryText:", v12);
  objc_msgSend(v8, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v14);

  objc_msgSend(v8, "secondaryTextProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v16);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v5, "setContentConfiguration:", v8);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningSecondaryBackgroundColor();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  objc_msgSend(v5, "setBackgroundConfiguration:", v17);
  LODWORD(v18) = objc_msgSend(v7, "isInPreflight");

  if ((_DWORD)v18)
  {
    +[PKCellAccessoryLoadingIndicator accessory](PKCellAccessoryLoadingIndicator, "accessory");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    v20 = (id *)v24;
  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    v23 = v19;
    v20 = &v23;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessories:", v21);

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_actionGroupViewModels);
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "setIsInPreflight:", 1);
  -[PKCombinedSelectActionGroupViewControllerListSectionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItem:animated:", v4, 1);
  objc_msgSend(v4, "actionGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PKCombinedSelectActionGroupViewControllerListSectionController_didSelectItem___block_invoke;
  v9[3] = &unk_1E3E61388;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v7, "didSelectActionGroup:completion:", v6, v9);

}

uint64_t __80__PKCombinedSelectActionGroupViewControllerListSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsInPreflight:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "reloadItem:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (id)defaultListLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  PKProvisioningBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PKCombinedSelectActionGroupViewControllerListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->cellRegistration, a3);
}

- (PKCombinedSelectActionGroupViewControllerListSectionControllerDelegate)delegate
{
  return (PKCombinedSelectActionGroupViewControllerListSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_actionGroupViewModels, 0);
}

@end
