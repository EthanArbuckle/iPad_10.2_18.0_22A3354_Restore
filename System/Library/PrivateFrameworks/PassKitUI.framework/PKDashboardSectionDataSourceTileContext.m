@implementation PKDashboardSectionDataSourceTileContext

- (PKDashboardSectionDataSourceTileContext)initWithTileContext:(int64_t)a3 forPass:(id)a4 groupID:(id)a5 overridesMaximumRows:(BOOL)a6
{
  id v11;
  id v12;
  PKDashboardSectionDataSourceTileContext *v13;
  PKDashboardSectionDataSourceTileContext *v14;
  PKPaymentDefaultDataProvider *v15;
  PKPaymentDefaultDataProvider *paymentDataProvider;
  uint64_t v17;
  PKPassSemanticTileFactory *tileFactory;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKDashboardSectionDataSourceTileContext;
  v13 = -[PKDashboardSectionDataSourceTileContext init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_context = a3;
    objc_storeStrong((id *)&v13->_pass, a4);
    objc_storeStrong((id *)&v14->_groupID, a5);
    v14->_overridesMaximumRows = a6;
    v15 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentDataProvider = v14->_paymentDataProvider;
    v14->_paymentDataProvider = v15;

    -[PKPaymentDefaultDataProvider addDelegate:](v14->_paymentDataProvider, "addDelegate:", v14);
    +[PKPassSemanticTileFactory sharedInstance](PKPassSemanticTileFactory, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    tileFactory = v14->_tileFactory;
    v14->_tileFactory = (PKPassSemanticTileFactory *)v17;

    -[PKDashboardSectionDataSourceTileContext _loadTiles](v14, "_loadTiles");
  }

  return v14;
}

- (void)reloadTiles
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PKDashboardSectionDataSourceTileContext_reloadTiles__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__PKDashboardSectionDataSourceTileContext_reloadTiles__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadTiles");
}

- (void)_loadTiles
{
  PKPassSemanticTileFactory *tileFactory;
  PKPass *pass;
  int64_t context;
  void *v6;
  PKPaymentDefaultDataProvider *paymentDataProvider;
  void *v8;
  int64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id location;

  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:](PKPassSemanticTileFactory, "supportsSemanticTilesForPass:", self->_pass))
  {
    objc_initWeak(&location, self);
    tileFactory = self->_tileFactory;
    context = self->_context;
    pass = self->_pass;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke;
    v11[3] = &unk_1E3E61BE0;
    objc_copyWeak(&v12, &location);
    -[PKPassSemanticTileFactory createTilesForPass:context:tileUpdateBlock:](tileFactory, "createTilesForPass:context:tileUpdateBlock:", pass, context, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardSectionDataSourceTileContext _updateWithTiles:](self, "_updateWithTiles:", v6);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    paymentDataProvider = self->_paymentDataProvider;
    -[PKPass uniqueID](self->_pass, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_context;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_2;
    v10[3] = &unk_1E3E61E98;
    v10[4] = self;
    -[PKPaymentDefaultDataProvider tilesForPassWithUniqueIdentifier:context:completion:](paymentDataProvider, "tilesForPassWithUniqueIdentifier:context:completion:", v8, v9, v10);

  }
}

void __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateWithTiles:", v3);

}

void __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_3;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __53__PKDashboardSectionDataSourceTileContext__loadTiles__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithTiles:", *(_QWORD *)(a1 + 40));
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v8 = a3;
  v9 = a4;
  if (self->_context == a5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PKDashboardSectionDataSourceTileContext_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    block[3] = &unk_1E3E61400;
    block[4] = self;
    v11 = v8;
    v12 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __94__PKDashboardSectionDataSourceTileContext_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKEqualObjects();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_updateWithTiles:", *(_QWORD *)(a1 + 48));
}

- (void)_updateWithTiles:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  id WeakRetained;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  PKDashboardSectionDataSourceTileContext *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = self->_tileGroups;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke;
  aBlock[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v16, &location);
  v7 = v4;
  v14 = v7;
  v15 = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_3;
    v11[3] = &unk_1E3E61F78;
    objc_copyWeak(&v12, &location);
    v11[4] = v5;
    objc_msgSend(v10, "updateSectionDataSource:withUpdates:diff:", self, v8, v11);

    objc_destroyWeak(&v12);
  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *WeakRetained;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_2;
    v6[3] = &unk_1E3E61EC0;
    v2 = *(void **)(a1 + 32);
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "pk_objectsPassingTest:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WeakRetained[6];
    WeakRetained[6] = v3;
  }
  else
  {
    v4 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
  }

  *((_BYTE *)WeakRetained + 64) = 1;
}

uint64_t __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
    return 1;
  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else if (v6)
  {
    v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *v4;
  uint64_t *WeakRetained;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = (id *)(a1 + 40);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = WeakRetained[6];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_5;
    v11[3] = &unk_1E3E61F50;
    objc_copyWeak(&v12, v4);
    +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldSections:andNewSections:sectionIdentifier:sectionItemsAccessor:firstSectionIndex:](PKCollectionViewItemsDiffCalculator, "calculateDiffBetweenOldSections:andNewSections:sectionIdentifier:sectionItemsAccessor:firstSectionIndex:", v7, v8, &__block_literal_global_3, v11, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __60__PKDashboardSectionDataSourceTileContext__updateWithTiles___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateTypeGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "tiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v8)
    {
      objc_msgSend(v6, "header");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = objc_msgSend(v10, "length");

        if (v12)
          objc_msgSend(v9, "addObject:", v11);
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

      objc_msgSend(v6, "footer");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "length");

        if (v17)
          objc_msgSend(v9, "addObject:", v16);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)itemForSectionIdentifier:(id)a3 atIndex:(unint64_t)a4
{
  id v5;
  PKDashboardPassTilesItem *v6;
  NSArray *tileGroups;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = objc_alloc_init(PKDashboardPassTilesItem);
  -[PKDashboardPassTilesItem setPass:](v6, "setPass:", self->_pass);
  tileGroups = self->_tileGroups;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___groupForSectionIdentifier_block_invoke;
  v11[3] = &unk_1E3E61FE0;
  v12 = v5;
  v8 = v5;
  -[NSArray pk_firstObjectPassingTest:](tileGroups, "pk_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDashboardPassTilesItem setGroupTile:](v6, "setGroupTile:", v9);
  if (self->_overridesMaximumRows)
    -[PKDashboardPassTilesItem setMaximumRowsOverride:](v6, "setMaximumRowsOverride:", -1);
  return v6;
}

- (unint64_t)numberOfItemsInSection:(id)a3
{
  id v4;
  NSArray *tileGroups;
  id v6;
  void *v7;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  tileGroups = self->_tileGroups;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___groupForSectionIdentifier_block_invoke;
  v11[3] = &unk_1E3E61FE0;
  v12 = v4;
  v6 = v4;
  -[NSArray pk_firstObjectPassingTest:](tileGroups, "pk_firstObjectPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self->_isContentLoaded && v7 != 0;
  return v9;
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)-[NSArray pk_arrayByApplyingBlock:](self->_tileGroups, "pk_arrayByApplyingBlock:", &__block_literal_global_19);
}

id __61__PKDashboardSectionDataSourceTileContext_sectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForSectionIdentifier:(id)a3
{
  id v4;
  NSArray *tileGroups;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  tileGroups = self->_tileGroups;
  v6 = v4;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___groupForSectionIdentifier_block_invoke;
  v25[3] = &unk_1E3E61FE0;
  v26 = v6;
  -[NSArray pk_firstObjectPassingTest:](tileGroups, "pk_firstObjectPassingTest:", v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v7, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stateTypeGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "header");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stateTypeGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "headerActionTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v12;
    v17 = v16;
    if (v16)
    {
      v18 = (void *)objc_msgSend(v16, "length");

      if (v18)
      {
        objc_msgSend(v7, "metadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "metadataTypeHorizontalFlowGroup");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "groupStyle");

        if (v21)
          v22 = 3;
        else
          v22 = 0;
        +[PKDashboardHeaderTextItem itemWithHeaderText:style:](PKDashboardHeaderTextItem, "itemWithHeaderText:style:", v17, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setActionTitle:", v15);
        objc_msgSend(v18, "setPreferBaselineAlignment:", 1);
        objc_msgSend(v18, "setUseActionInsets:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setActionColor:", v23);

      }
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)footerTextItemForSectionIdentifier:(id)a3
{
  id v4;
  NSArray *tileGroups;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  tileGroups = self->_tileGroups;
  v6 = v4;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = ___groupForSectionIdentifier_block_invoke;
  v26[3] = &unk_1E3E61FE0;
  v27 = v6;
  -[NSArray pk_firstObjectPassingTest:](tileGroups, "pk_firstObjectPassingTest:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v7, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stateTypeGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "footer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stateTypeGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "footerActionTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16 = objc_msgSend(v12, "length");
      v17 = v16 != 0;
      if (!v15)
      {
        if (v16)
        {
          v18 = 0;
          goto LABEL_14;
        }
        goto LABEL_21;
      }
    }
    else
    {
      if (!v15)
        goto LABEL_21;
      v17 = 0;
    }
    v20 = objc_msgSend(v15, "length");
    v18 = v20 != 0;

    if (v17 && v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v15, v12);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 1;
      if (v21)
        goto LABEL_18;
    }
    else
    {
      if (v17)
      {
LABEL_14:
        v21 = v12;
        if (!v21)
          goto LABEL_21;
LABEL_18:
        +[PKDashboardFooterTextItem itemWithFooterText:](PKDashboardFooterTextItem, "itemWithFooterText:", v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v22 = objc_msgSend(v15, "length");
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setLinkTextColor:", v23);

          objc_msgSend(v19, "setLinkRange:", 0, v22);
        }
        objc_msgSend(v19, "setBottomInsetType:", 0);
        objc_msgSend(v19, "setUseHorizontalInsets:", 0);
        objc_msgSend(v19, "setUseContentInsets:", 0);
        objc_msgSend(v19, "setMaximumNumberOfLines:", 4);
        PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48C8], 0x8000, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFont:", v24);

        goto LABEL_22;
      }
      if (v20)
      {
        v21 = v15;
        v18 = 1;
        goto LABEL_18;
      }
    }
LABEL_21:
    v19 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (PKDashboardSectionDataSourceDelegate)delegate
{
  return (PKDashboardSectionDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isContentLoaded
{
  return self->_isContentLoaded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileFactory, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
