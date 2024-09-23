@implementation PKApplyPrimaryActionSectionController

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("primaryAction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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
  if (v7 == CFSTR("primaryAction")
    || v7 && (v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("primaryAction")), v8, v9))
  {
    -[PKApplyPrimaryActionSectionController _configureContentSection:](self, "_configureContentSection:", v6);
  }

  return v6;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyPrimaryActionSectionController;
  -[PKApplyCollectionViewSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](&v6, sel_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemSeparatorHandler:", &__block_literal_global_147);
  return v4;
}

id __104__PKApplyPrimaryActionSectionController_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(a2, "row"))
    objc_msgSend(v4, "setBottomSeparatorVisibility:", 2);
  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  double v11;
  objc_super v13;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = v7;
  if (v7 == CFSTR("primaryAction"))
  {
    v9 = 1;
  }
  else if (v7)
  {
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("primaryAction"));
  }
  else
  {
    v9 = 0;
  }

  v13.receiver = self;
  v13.super_class = (Class)PKApplyPrimaryActionSectionController;
  -[PKApplyCollectionViewSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v13, sel_layoutWithLayoutEnvironment_sectionIdentifier_, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInsets");
  if (v9)
    v11 = 16.0;
  objc_msgSend(v10, "setContentInsets:", v11);

  return v10;
}

- (void)_configureContentSection:(id)a3
{
  id v4;
  PKApplyPrimaryActionRow *v5;
  void *v6;
  void *v7;
  PKApplyPrimaryActionRow *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PKApplyPrimaryActionRow alloc];
  -[PKApplyCollectionViewSectionController page](self, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryActionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKApplyPrimaryActionRow initWithTitle:](v5, "initWithTitle:", v7);

  -[PKApplyPrimaryActionRow setLoading:](v8, "setLoading:", self->_primaryButtonLoading);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __66__PKApplyPrimaryActionSectionController__configureContentSection___block_invoke;
  v13 = &unk_1E3E71770;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  -[PKApplyPrimaryActionRow setAction:](v8, "setAction:", &v10);
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendItems:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __66__PKApplyPrimaryActionSectionController__configureContentSection___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "setLoading:", 1);
      WeakRetained[88] = 1;
      objc_msgSend(v3, "primaryButtonTapped");
    }

  }
}

- (BOOL)primaryButtonLoading
{
  return self->_primaryButtonLoading;
}

- (void)setPrimaryButtonLoading:(BOOL)a3
{
  self->_primaryButtonLoading = a3;
}

@end
