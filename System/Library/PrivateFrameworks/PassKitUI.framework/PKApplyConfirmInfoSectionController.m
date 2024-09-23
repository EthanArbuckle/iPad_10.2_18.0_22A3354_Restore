@implementation PKApplyConfirmInfoSectionController

- (PKApplyConfirmInfoSectionController)initWithController:(id)a3 applyPage:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  PKApplyConfirmInfoSectionController *v10;
  PKApplyConfirmInfoSectionController *v11;
  uint64_t v12;
  PKApplyActionContent *actionContent;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKApplyConfirmInfoSectionController;
  v10 = -[PKApplyCollectionViewSectionController initWithController:applyPage:](&v15, sel_initWithController_applyPage_, a3, v8);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    objc_msgSend(v8, "actionContent");
    v12 = objc_claimAutoreleasedReturnValue();
    actionContent = v11->_actionContent;
    v11->_actionContent = (PKApplyActionContent *)v12;

  }
  return v11;
}

- (void)setPage:(id)a3
{
  id v4;
  PKApplyActionContent *v5;
  PKApplyActionContent *actionContent;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKApplyConfirmInfoSectionController;
  v4 = a3;
  -[PKApplyCollectionViewSectionController setPage:](&v7, sel_setPage_, v4);
  objc_msgSend(v4, "actionContent", v7.receiver, v7.super_class);
  v5 = (PKApplyActionContent *)objc_claimAutoreleasedReturnValue();

  actionContent = self->_actionContent;
  self->_actionContent = v5;

}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyConfirmInfoSectionController;
  -[PKApplyCollectionViewSectionController configureCellForRegistration:item:](&v9, sel_configureCellForRegistration_item_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKApplyActionContentActionItemCell backgroundColor](PKApplyActionContentActionItemCell, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v6, "setBackgroundConfiguration:", v7);
  }

}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kContentSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  void *v7;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("kContentSection")
    || v4
    && (v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("kContentSection")), v5, v6))
  {
    -[PKApplyActionContent footerContent](self->_actionContent, "footerContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return (Class)v7;
}

- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKApplyActionContent footerContent](self->_actionContent, "footerContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (__CFString *)v7;
      if (v9 == CFSTR("kContentSection")
        || (v10 = v9) != 0
        && (v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("kContentSection")),
            v10,
            v11))
      {
        objc_initWeak(&location, self);
        v12 = v6;
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __80__PKApplyConfirmInfoSectionController_configureFooterView_forSectionIdentifier___block_invoke;
        v18 = &unk_1E3E62DF8;
        objc_copyWeak(&v19, &location);
        +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:linkTapped:](PKTextRangeHyperlink, "hyperlinkSourcesFromApplyFooter:linkTapped:", v8, &v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "footerText", v15, v16, v17, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v14);

        objc_msgSend(v12, "setTextAlignment:", 4);
        objc_msgSend(v12, "setSources:", v13);

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __80__PKApplyConfirmInfoSectionController_configureFooterView_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 12);
    objc_msgSend(v5, "didTapFooterLink:", v6);

  }
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kContentSection")
    || v7
    && (v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kContentSection")), v8, v9))
  {
    -[PKApplyConfirmInfoSectionController _configureContentSection:](self, "_configureContentSection:", v6);
  }

  return v6;
}

- (void)_configureContentSection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKApplyActionContentActionItemRow *v9;
  PKApplyActionContentActionItemRow *v10;
  void *v11;
  id v12;
  id obj;
  _QWORD v14[5];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKApplyActionContent actionItems](self->_actionContent, "actionItems");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_initWeak(&location, self);
        v9 = [PKApplyActionContentActionItemRow alloc];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __64__PKApplyConfirmInfoSectionController__configureContentSection___block_invoke;
        v14[3] = &unk_1E3E61B68;
        objc_copyWeak(&v15, &location);
        v14[4] = v8;
        v10 = -[PKApplyActionContentActionItemRow initWithApplyActionContentActionItem:selectionHandler:](v9, "initWithApplyActionContentActionItem:selectionHandler:", v8, v14);
        objc_msgSend(v4, "safelyAddObject:", v10);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v12, "appendItems:", v11);

}

void __64__PKApplyConfirmInfoSectionController__configureContentSection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 12);
    objc_msgSend(v3, "didSelectActionItem:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionContent, 0);
}

@end
