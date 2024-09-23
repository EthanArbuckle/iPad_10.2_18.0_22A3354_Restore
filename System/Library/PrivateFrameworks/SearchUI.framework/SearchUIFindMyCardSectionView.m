@implementation SearchUIFindMyCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getFMUILocationDetailViewControllerViewOptionsClass_softClass;
  v21 = getFMUILocationDetailViewControllerViewOptionsClass_softClass;
  if (!getFMUILocationDetailViewControllerViewOptionsClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke;
    v16 = &unk_1EA1F6930;
    v17 = &v18;
    __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v4, "spotlightWidget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v6 = (void *)getFMUILocationDetailViewControllerClass_softClass;
  v21 = getFMUILocationDetailViewControllerClass_softClass;
  if (!getFMUILocationDetailViewControllerClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getFMUILocationDetailViewControllerClass_block_invoke;
    v16 = &unk_1EA1F6930;
    v17 = &v18;
    __getFMUILocationDetailViewControllerClass_block_invoke((uint64_t)&v13);
    v6 = (void *)v19[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v18, 8);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumLayoutSize:", 0.0, 200.0);

  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaximumLayoutSize:", 1.79769313e308, 200.0);

  objc_msgSend(v8, "setViewOptions:", v5);
  -[SearchUIFindMyCardSectionView setViewController:](self, "setViewController:", v8);
  objc_msgSend(v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUIFindMyCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v21, sel_updateWithRowModel_, v4);
  -[SearchUIFindMyCardSectionView contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView section](self, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", v9) & 1) == 0)
  {
    -[SearchUIFindMyCardSectionView locationLabel](self, "locationLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", 0);

    -[SearchUIFindMyCardSectionView timeLabel](self, "timeLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", 0);

    -[SearchUIFindMyCardSectionView locationLabel](self, "locationLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);

    -[SearchUIFindMyCardSectionView timeLabel](self, "timeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[SearchUIFindMyCardSectionView viewController](self, "viewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stopObserving");

    objc_initWeak(&location, self);
    +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke;
    v17[3] = &unk_1EA1F8058;
    v17[4] = self;
    v18 = v4;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v15, "fetchContactsForIdentifiers:completionHandler:", v16, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(a1[4], "rowModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = a1[5];

  if (v4 == v5)
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setContact:", v6);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke_2;
    v7[3] = &unk_1EA1F8030;
    objc_copyWeak(&v10, a1 + 6);
    v8 = a1[5];
    v9 = v3;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

    objc_destroyWeak(&v10);
  }

}

void __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3 && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(WeakRetained, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startObservingContacts:", *(_QWORD *)(a1 + 40));

  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (FMUILocationDetailViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (TLKLabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (TLKLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
