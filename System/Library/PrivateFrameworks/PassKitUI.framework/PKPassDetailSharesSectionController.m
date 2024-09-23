@implementation PKPassDetailSharesSectionController

- (PKPassDetailSharesSectionController)init
{

  return 0;
}

- (PKPassDetailSharesSectionController)initWithSharesController:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKPassDetailSharesSectionController *v9;
  PKPassDetailSharesSectionController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassDetailSharesSectionController;
  v9 = -[PKPaymentPassDetailSectionController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharesController, a3);
    -[PKSharedPassSharesController addDelegate:](v10->_sharesController, "addDelegate:", v10);
    objc_storeWeak((id *)&v10->_delegate, v8);
    -[PKPassDetailSharesSectionController _updateSectionIdentifiers](v10, "_updateSectionIdentifiers");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKSharedPassSharesController removeDelegate:](self->_sharesController, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPassDetailSharesSectionController;
  -[PKPassDetailSharesSectionController dealloc](&v3, sel_dealloc);
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (void)_updateSectionIdentifiers
{
  void *v3;
  int mapped;
  int v5;
  id WeakRetained;
  void *v7;
  id v8;

  -[PKSharedPassSharesController myEntitlements](self->_sharesController, "myEntitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mapped = self->_mapped;
  v8 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "count") != 0;
  else
    v5 = 0;
  self->_mapped = v5;
  if (mapped != v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKPassDetailSharesSectionController sectionIdentifiers](self, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reloadSections:", v7);

  }
}

- (void)preflight:(id)a3
{
  id v4;
  PKSharedPassSharesController *sharesController;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  sharesController = self->_sharesController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PKPassDetailSharesSectionController_preflight___block_invoke;
  v7[3] = &unk_1E3E61C80;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[PKSharedPassSharesController updateSharesWithCompletion:](sharesController, "updateSharesWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __49__PKPassDetailSharesSectionController_preflight___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[64] = 1;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSectionIdentifiers");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("EntitlementsSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment") || !self->_mapped)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPassDetailSharesSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (PKEqualObjects())
  {
    PKLocalizedShareableCredentialString(CFSTR("MY_ENTITLEMENTS_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController disclosureCellWithTitle:forTableView:](self, "disclosureCellWithTitle:forTableView:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return PKEqualObjects();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id WeakRetained;

  if (PKEqualObjects())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sharesSectionControllerDidSelectViewEntitlements:", self);

  }
}

- (void)sharedPassSharesControllerDidUpdateShares:(id)a3
{
  if (self->_hasLoadedInitialData)
    -[PKPassDetailSharesSectionController _updateSectionIdentifiers](self, "_updateSectionIdentifiers", a3);
}

- (PKSharedPassSharesController)sharesController
{
  return self->_sharesController;
}

- (PKPassDetailSharesSectionControllerDelegate)delegate
{
  return (PKPassDetailSharesSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end
