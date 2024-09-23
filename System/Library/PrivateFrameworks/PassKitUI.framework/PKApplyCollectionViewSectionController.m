@implementation PKApplyCollectionViewSectionController

- (PKApplyCollectionViewSectionController)initWithController:(id)a3 applyPage:(id)a4
{
  id v7;
  id v8;
  PKApplyCollectionViewSectionController *v9;
  PKApplyCollectionViewSectionController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplyCollectionViewSectionController;
  v9 = -[PKPaymentSetupListSectionController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    objc_storeStrong((id *)&v10->_page, a4);
  }

  return v10;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  return 0;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  return 0;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  objc_msgSend(a4, "configureCell:", a3);
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKApplyCollectionViewSectionController _hasHeaderContentForIdentifier:](self, "_hasHeaderContentForIdentifier:", v5))
  {
    objc_msgSend(v6, "setHeaderMode:", 1);
  }
  if (-[PKApplyCollectionViewSectionController _hasFooterContentForIdentifier:](self, "_hasFooterContentForIdentifier:", v5))
  {
    objc_msgSend(v6, "setFooterMode:", 1);
  }

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC35C8];
  v6 = objc_msgSend(v4, "cellClass");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PKApplyCollectionViewSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E78660;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __66__PKApplyCollectionViewSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "configureCellForRegistration:item:", v7, v6);

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v9;
  v12 = v11;
  v13 = 0.0;
  if (v11 != v10)
  {
    v13 = 15.0;
    if (v10)
    {
      if (v11)
      {
        if (objc_msgSend(v10, "isEqualToString:", v11))
          v13 = 0.0;
        else
          v13 = 15.0;
      }
    }
  }

  -[PKApplyCollectionViewSectionController _hasFooterContentForIdentifier:](self, "_hasFooterContentForIdentifier:", v10);
  -[PKApplyCollectionViewSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](self, "listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:", v7, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "contentInsets");
  objc_msgSend(v15, "setContentInsets:", v13);

  return v15;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  objc_class *v9;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[PKApplyCollectionViewSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v7);
  v9 = -[PKApplyCollectionViewSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v7);
  if ((id)*MEMORY[0x1E0DC48A8] != v6 || v8 == 0)
  {
    if ((id)*MEMORY[0x1E0DC48A0] != v6 || v9 == 0)
      objc_opt_class();
    else
      -[PKApplyCollectionViewSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKApplyCollectionViewSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return (Class)v13;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
  {
    -[PKPaymentSetupListSectionController headerAttributedStringForIdentifier:](self, "headerAttributedStringForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKApplyCollectionViewSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v9))
    {
      -[PKApplyCollectionViewSectionController configureHeaderView:forSectionIdentifier:](self, "configureHeaderView:forSectionIdentifier:", v23, v9);
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedText:", v10);
    -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = v13;
    v16 = v15;
    if (v15 == v14)
    {
      v18 = 10.0;
      v17 = 10.0;
    }
    else
    {
      v17 = 0.0;
      v18 = 30.0;
      if (v14 && v15)
      {
        v19 = objc_msgSend(v14, "isEqualToString:", v15);
        if (v19)
          v17 = 10.0;
        else
          v17 = 0.0;
        if (v19)
          v18 = 10.0;
        else
          v18 = 30.0;
      }
    }

    v22 = v11;
    v20 = v18;
    v21 = v17;
LABEL_21:
    objc_msgSend(v22, "setDirectionalLayoutMargins:", v20, 0.0, v21, 0.0);
    objc_msgSend(v23, "setContentConfiguration:", v11);

    goto LABEL_22;
  }
  if ((id)*MEMORY[0x1E0DC48A0] == v8)
  {
    -[PKPaymentSetupListSectionController footerAttributedStringForIdentifier:](self, "footerAttributedStringForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKApplyCollectionViewSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v9))
    {
      -[PKApplyCollectionViewSectionController configureFooterView:forSectionIdentifier:](self, "configureFooterView:forSectionIdentifier:", v23, v9);
LABEL_22:

      goto LABEL_23;
    }
    if (!v10)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedText:", v10);
    v20 = 10.0;
    v21 = 10.0;
    v22 = v11;
    goto LABEL_21;
  }
LABEL_23:

}

- (void)didSelectItem:(id)a3
{
  int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE54ABD8);
  v5 = v8;
  if (v4)
  {
    v6 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "handleCellSelection");
      -[PKApplyCollectionViewSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deselectCells");

    }
    v5 = v8;
  }

}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE54ABD8))
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "shouldHighlightItem");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasHeaderContentForIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[PKApplyCollectionViewSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[PKPaymentSetupListSectionController headerAttributedStringForIdentifier:](self, "headerAttributedStringForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)_hasFooterContentForIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[PKApplyCollectionViewSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[PKPaymentSetupListSectionController footerAttributedStringForIdentifier:](self, "footerAttributedStringForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (PKApplyController)controller
{
  return self->_controller;
}

- (PKDynamicProvisioningPageContent)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  objc_storeStrong((id *)&self->_page, a3);
}

- (PKApplyCollectionViewSectionControllerDelegate)dynamicCollectionDelegate
{
  return self->_dynamicCollectionDelegate;
}

- (void)setDynamicCollectionDelegate:(id)a3
{
  self->_dynamicCollectionDelegate = (PKApplyCollectionViewSectionControllerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
