@implementation PKPayLaterSectionController

- (PKPayLaterSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 viewControllerDelegate:(id)a5
{
  id v9;
  id v10;
  PKPayLaterViewControllerDelegate *v11;
  PKPayLaterSectionController *v12;
  PKPayLaterSectionController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = (PKPayLaterViewControllerDelegate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterSectionController;
  v12 = -[PKPaymentSetupListSectionController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payLaterAccount, a3);
    objc_storeStrong((id *)&v13->_dynamicContentPage, a4);
    v13->_viewControllerDelegate = v11;
  }

  return v13;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = a3;
    -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 > 0x7FFFFFFFFFFFFFFELL || v6 >= objc_msgSend(v8, "count"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footerContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "footerText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {

        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  return 0;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[PKPayLaterSectionController footerContentForSectionIdentifier:](self, "footerContentForSectionIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPayLaterSectionController footerContentForSectionIdentifier:](self, "footerContentForSectionIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_initWeak(&location, self);
      v9 = v6;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __72__PKPayLaterSectionController_configureFooterView_forSectionIdentifier___block_invoke;
      v15 = &unk_1E3E62DF8;
      objc_copyWeak(&v16, &location);
      +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:linkTapped:](PKTextRangeHyperlink, "hyperlinkSourcesFromApplyFooter:linkTapped:", v8, &v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "footerText", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v11);

      objc_msgSend(v9, "setTextAlignment:", 4);
      objc_msgSend(v9, "setSources:", v10);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }

}

void __72__PKPayLaterSectionController_configureFooterView_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didTapHyperLink:", v5);

}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "backgroundConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "setBackgroundConfiguration:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundConfiguration:", v7);

  }
  objc_msgSend(v5, "configureCell:", v8);

}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPayLaterSectionController _hasHeaderContentForIdentifier:](self, "_hasHeaderContentForIdentifier:", v5))
    objc_msgSend(v6, "setHeaderMode:", 1);
  if (-[PKPayLaterSectionController _hasFooterContentForIdentifier:](self, "_hasFooterContentForIdentifier:", v5))
    objc_msgSend(v6, "setFooterMode:", 1);

  return v6;
}

- (void)didTapHyperLink:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didTapHyperLink:", v4);

}

- (double)headerViewHeight
{
  return 0.0;
}

- (id)contextMenuForPayLaterItem:(id)a3
{
  return 0;
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
  v9[2] = __55__PKPayLaterSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E64740;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __55__PKPayLaterSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  int v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  double v17;

  v6 = a4;
  v7 = a3;
  -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v9;
  v12 = v11;
  if (v11 == v10)
  {
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (v10 && v11)
      v13 = objc_msgSend(v10, "isEqualToString:", v11);
  }

  -[PKPayLaterSectionController _hasFooterContentForIdentifier:](self, "_hasFooterContentForIdentifier:", v10);
  v14 = -[PKPayLaterSectionController _hasHeaderContentForIdentifier:](self, "_hasHeaderContentForIdentifier:", v10);
  -[PKPayLaterSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](self, "listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:", v7, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "contentInsets");
  v17 = 15.0;
  if (v14)
    v17 = 8.0;
  if (v13)
    v17 = 0.0;
  objc_msgSend(v16, "setContentInsets:", v17);

  return v16;
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
  v8 = -[PKPayLaterSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v7);
  v9 = -[PKPayLaterSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v7);
  if ((id)*MEMORY[0x1E0DC48A8] != v6 || v8 == 0)
  {
    if ((id)*MEMORY[0x1E0DC48A0] != v6 || v9 == 0)
      objc_opt_class();
    else
      -[PKPayLaterSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPayLaterSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v7);
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
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if ((id)*MEMORY[0x1E0DC48A8] == v8)
  {
    -[PKPaymentSetupListSectionController headerAttributedStringForIdentifier:](self, "headerAttributedStringForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPayLaterSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v9))
    {
      -[PKPayLaterSectionController configureHeaderView:forSectionIdentifier:](self, "configureHeaderView:forSectionIdentifier:", v23, v9);
LABEL_20:

      goto LABEL_21;
    }
    if (!v10)
      goto LABEL_20;
    objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedText:", v10);
    -[PKPaymentSetupListSectionController identifiers](self, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = v13;
    if (v15 == v14)
    {

    }
    else
    {
      v16 = v15;
      if (!v14 || !v15)
      {

LABEL_18:
        v21 = 0.0;
        v19 = 36.0;
        v20 = 0.0;
        v22 = 0.0;
        goto LABEL_19;
      }
      v17 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v17 & 1) == 0)
        goto LABEL_18;
    }
    -[PKPayLaterSectionController firstSectionHeaderEdgeInsets](self, "firstSectionHeaderEdgeInsets");
LABEL_19:
    objc_msgSend(v11, "setDirectionalLayoutMargins:", v19, v20, v21, v22);
    -[PKPaymentSetupListSectionController applyHeaderConfigurationProperties:sectionIdentifier:](self, "applyHeaderConfigurationProperties:sectionIdentifier:", v11, v14);
    objc_msgSend(v23, "setContentConfiguration:", v11);

    goto LABEL_20;
  }
  if ((id)*MEMORY[0x1E0DC48A0] == v8)
  {
    -[PKPaymentSetupListSectionController footerAttributedStringForIdentifier:](self, "footerAttributedStringForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPayLaterSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v9))
    {
      -[PKPayLaterSectionController configureFooterView:forSectionIdentifier:](self, "configureFooterView:forSectionIdentifier:", v23, v9);
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAttributedText:", v10);
      objc_msgSend(v18, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
      objc_msgSend(v23, "setContentConfiguration:", v18);

    }
    goto LABEL_20;
  }
LABEL_21:

}

- (NSDirectionalEdgeInsets)firstSectionHeaderEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 16.0;
  v3 = 0.0;
  v4 = 10.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE54B2F8))
  {
    v5 = v4;
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __45__PKPayLaterSectionController_didSelectItem___block_invoke;
    v10 = &unk_1E3E61310;
    objc_copyWeak(&v11, &location);
    v6 = (void (**)(_QWORD))_Block_copy(&v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "handleCellSelectionWithContinueBlock:", v6, v7, v8, v9, v10);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "handleCellSelection", v7, v8, v9, v10);
      v6[2](v6);
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __45__PKPayLaterSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deselectCells");

    WeakRetained = v3;
  }

}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE54B2F8))
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

- (id)contextMenuConfigurationForItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE54B2F8))
  {
    -[PKPayLaterSectionController contextMenuForPayLaterItem:](self, "contextMenuForPayLaterItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  if (-[PKPayLaterSectionController headerViewClassForSectionIdentifier:](self, "headerViewClassForSectionIdentifier:", v4))
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
  if (-[PKPayLaterSectionController footerViewClassForSectionIdentifier:](self, "footerViewClassForSectionIdentifier:", v4))
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

- (PKPayLaterSectionControllerDelegate)dynamicCollectionDelegate
{
  return (PKPayLaterSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_dynamicCollectionDelegate);
}

- (void)setDynamicCollectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dynamicCollectionDelegate, a3);
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterAccount:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterAccount, a3);
}

- (PKPayLaterDynamicContentPage)dynamicContentPage
{
  return self->_dynamicContentPage;
}

- (PKPayLaterViewControllerDelegate)viewControllerDelegate
{
  return self->_viewControllerDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_destroyWeak((id *)&self->_dynamicCollectionDelegate);
}

@end
