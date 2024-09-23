@implementation PKDashboardBarcodePassDataSource

- (PKDashboardBarcodePassDataSource)initWithGroupView:(id)a3 context:(id)a4
{
  id v6;
  PKDashboardBarcodePassDataSource *v7;
  PKDashboardBarcodePassDataSource *v8;
  uint64_t v9;
  PKGroup *group;
  NSOrderedSet *v11;
  NSOrderedSet *messages;
  NSMutableArray *v13;
  NSMutableArray *executionBlocksContentIsLoaded;
  uint64_t v15;
  PKPassSemanticTileFactory *tileFactory;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKDashboardBarcodePassDataSource;
  v7 = -[PKDashboardBarcodePassDataSource init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_groupView, a3);
    objc_msgSend(v6, "group");
    v9 = objc_claimAutoreleasedReturnValue();
    group = v8->_group;
    v8->_group = (PKGroup *)v9;

    v11 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    messages = v8->_messages;
    v8->_messages = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    executionBlocksContentIsLoaded = v8->_executionBlocksContentIsLoaded;
    v8->_executionBlocksContentIsLoaded = v13;

    +[PKPassSemanticTileFactory sharedInstance](PKPassSemanticTileFactory, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    tileFactory = v8->_tileFactory;
    v8->_tileFactory = (PKPassSemanticTileFactory *)v15;

    -[PKDashboardBarcodePassDataSource reloadFrontmostPass](v8, "reloadFrontmostPass");
    -[PKDashboardBarcodePassDataSource reloadData](v8, "reloadData");
  }

  return v8;
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKDashboardBarcodePassDataSource;
  -[PKDashboardBarcodePassDataSource dealloc](&v2, sel_dealloc);
}

- (void)sendContentIsLoadedIfNecessary
{
  if (self->_group)
    -[PKDashboardBarcodePassDataSource updateContentIsLoaded](self, "updateContentIsLoaded");
}

- (void)groupViewDidUpdatePassView:(id)a3
{
  PKPassGroupView *groupView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;

  groupView = self->_groupView;
  v5 = a3;
  -[PKPassGroupView frontmostPassView](groupView, "frontmostPassView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v8;
  v11 = v10;
  if (v13 == v11)
  {

  }
  else
  {
    if (!v13 || !v11)
    {

      goto LABEL_9;
    }
    v12 = objc_msgSend(v13, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_9;
  }
  -[PKDashboardBarcodePassDataSource reloadData](self, "reloadData");
LABEL_9:

}

- (void)groupViewDidChangeFrontmostPassView:(id)a3 withContext:(id)a4
{
  -[PKDashboardBarcodePassDataSource reloadFrontmostPass](self, "reloadFrontmostPass", a3, a4);
  -[PKDashboardBarcodePassDataSource reloadData](self, "reloadData");
}

- (void)reloadFrontmostPass
{
  PKPass *v3;
  PKPass **p_pass;
  PKPass *pass;
  NSObject *v6;
  uint8_t v7[16];

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex"));
  v3 = (PKPass *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  p_pass = &self->_pass;
  if (pass == v3)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Skipping reload of pass...", v7, 2u);
    }

  }
  else
  {
    objc_storeStrong((id *)p_pass, v3);
  }

}

- (void)reloadData
{
  -[PKDashboardBarcodePassDataSource reloadMessages](self, "reloadMessages");
  -[PKDashboardBarcodePassDataSource reloadTiles](self, "reloadTiles");
}

- (void)setDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[PKDashboardBarcodePassDataSource sendContentIsLoadedIfNecessary](self, "sendContentIsLoadedIfNecessary");
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v4;
  PKDashboardPassTilesItem *v5;
  void *v6;

  v4 = objc_msgSend(a3, "section");
  if (v4 == 2)
  {
    v5 = objc_alloc_init(PKDashboardPassTilesItem);
    -[PKDashboardPassTilesItem setPass:](v5, "setPass:", self->_pass);
    -[NSArray objectAtIndexedSubscript:](self->_tileGroups, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassTilesItem setGroupTile:](v5, "setGroupTile:", v6);

  }
  else if (v4 == 1)
  {
    v5 = objc_alloc_init(PKDashboardPassMessages);
    -[PKDashboardPassTilesItem setMessages:](v5, "setMessages:", self->_messages);
  }
  else if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[PKDashboardPassGroupItem initWithGroupView:]([PKDashboardPassGroupItem alloc], "initWithGroupView:", self->_groupView);
  }
  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  _BOOL4 allContentIsLoaded;
  void *tileGroups;

  if (a3)
  {
    if (a3 == 2)
    {
      allContentIsLoaded = self->_allContentIsLoaded;
      if (self->_allContentIsLoaded)
      {
        tileGroups = self->_tileGroups;
        return objc_msgSend(tileGroups, "count") != 0;
      }
    }
    else
    {
      if (a3 != 1)
        return 0;
      allContentIsLoaded = self->_allContentIsLoaded;
      if (self->_allContentIsLoaded)
      {
        tileGroups = self->_messages;
        return objc_msgSend(tileGroups, "count") != 0;
      }
    }
  }
  else
  {
    return 1;
  }
  return allContentIsLoaded;
}

- (unint64_t)numberOfSections
{
  return 3;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  if (a3 != 2)
    goto LABEL_7;
  -[NSArray objectAtIndexedSubscript:](self->_tileGroups, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {

LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stateTypeGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "header");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = (void *)objc_msgSend(v9, "length");

  if (v11)
  {
    +[PKDashboardHeaderTextItem itemWithHeaderText:](PKDashboardHeaderTextItem, "itemWithHeaderText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v11;
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  if (a3 != 2)
    goto LABEL_7;
  -[NSArray objectAtIndexedSubscript:](self->_tileGroups, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {

LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stateTypeGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = (void *)objc_msgSend(v9, "length");

  if (v11)
  {
    +[PKDashboardFooterTextItem itemWithFooterText:](PKDashboardFooterTextItem, "itemWithFooterText:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v11;
}

- (void)reloadTiles
{
  PKPassSemanticTileFactory *tileFactory;
  PKPass *pass;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:](PKPassSemanticTileFactory, "supportsSemanticTilesForPass:", self->_pass))
  {
    objc_initWeak(&location, self);
    tileFactory = self->_tileFactory;
    pass = self->_pass;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke;
    v9 = &unk_1E3E61BE0;
    objc_copyWeak(&v10, &location);
    -[PKPassSemanticTileFactory createTilesForPass:context:tileUpdateBlock:](tileFactory, "createTilesForPass:context:tileUpdateBlock:", pass, 1, &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardBarcodePassDataSource _updateWithTiles:](self, "_updateWithTiles:", v5, v6, v7, v8, v9);
    -[PKPassSemanticTileFactory prewarmTileContentForPass:context:](self->_tileFactory, "prewarmTileContentForPass:context:", self->_pass, 2);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKDashboardBarcodePassDataSource _updateWithTiles:](self, "_updateWithTiles:", 0);
  }
}

void __47__PKDashboardBarcodePassDataSource_reloadTiles__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateWithTiles:", v3);

}

- (void)_updateWithTiles:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[6];
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = self->_tileGroups;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke;
  aBlock[3] = &unk_1E3E61B68;
  objc_copyWeak(&v16, &location);
  v7 = v4;
  v15 = v7;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (self->_allContentIsLoaded)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_2;
    v11[3] = &unk_1E3E670F8;
    objc_copyWeak(&v13, &location);
    v11[5] = self;
    v12 = v9;
    v11[4] = v5;
    objc_msgSend(WeakRetained, "performBatchUpdates:completion:", v11, 0);

    objc_destroyWeak(&v13);
  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
    -[PKDashboardBarcodePassDataSource updateContentIsLoaded](self, "updateContentIsLoaded");
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WeakRetained[56] = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = v2;
  }
  else
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = 0;
  }

}

void __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_3(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[6], "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_3(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:andNewItems:inSection:](PKCollectionViewItemsDiffCalculator, "calculateDiffBetweenOldItems:andNewItems:inSection:", v3, v5, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_applyDiff:", v6);

  }
}

id __53__PKDashboardBarcodePassDataSource__updateWithTiles___block_invoke_3(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v1, "tiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v1, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateTypeGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "header");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "length");

      if (v9)
        objc_msgSend(v2, "addObject:", v8);
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

    objc_msgSend(v6, "footer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "length");

      if (v14)
        objc_msgSend(v2, "addObject:", v13);
    }

  }
  v15 = (void *)objc_msgSend(v2, "copy");

  return v15;
}

- (void)_applyDiff:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "deletedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "deleteItemsAtIndexPaths:", v6);

  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "deletedSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteSections:", v8);

  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "insertedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertItemsAtIndexPaths:", v10);

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "insertedSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSections:", v12);

  objc_msgSend(v4, "movedFromIndexPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movedToIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v15 = 0;
    do
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "moveItemAtIndexPath:toIndexPath:", v17, v18);

      ++v15;
    }
    while (objc_msgSend(v13, "count") > v15);
  }
  v28 = v4;
  objc_msgSend(v4, "changedIndexPaths", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23);
        v25 = objc_loadWeakRetained((id *)&self->_delegate);
        -[PKDashboardBarcodePassDataSource itemAtIndexPath:](self, "itemAtIndexPath:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "itemChanged:atIndexPath:", v26, v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v21);
  }

}

- (void)reloadMessages
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PKDashboardBarcodePassDataSource_reloadMessages__block_invoke;
  v2[3] = &unk_1E3E61310;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __50__PKDashboardBarcodePassDataSource_reloadMessages__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadMessages");

}

- (void)_reloadMessages
{
  void *v3;
  NSOrderedSet *v4;
  NSOrderedSet *messages;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[PKDashboardBarcodePassDataSource _messageForIssuerBinding](self, "_messageForIssuerBinding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pk_safelyAddObject:", v3);

  v4 = (NSOrderedSet *)objc_msgSend(v8, "copy");
  messages = self->_messages;
  self->_messages = v4;

  self->_messagesLoaded = 1;
  if (self->_allContentIsLoaded)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "reloadSections:", v7);

    }
  }
  else
  {
    -[PKDashboardBarcodePassDataSource updateContentIsLoaded](self, "updateContentIsLoaded");
  }

}

- (void)updateContentIsLoaded
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_allContentIsLoaded && self->_tilesLoaded && self->_messagesLoaded)
  {
    self->_allContentIsLoaded = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "contentIsLoaded");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)-[NSMutableArray copy](self->_executionBlocksContentIsLoaded, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_executionBlocksContentIsLoaded, "removeAllObjects");
  }
}

- (void)executeAfterContentIsLoaded:(id)a3
{
  void (**v4)(_QWORD);
  NSMutableArray *executionBlocksContentIsLoaded;
  void *v6;
  void (**aBlock)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    aBlock = v4;
    if (self->_allContentIsLoaded)
    {
      v4[2](v4);
    }
    else
    {
      executionBlocksContentIsLoaded = self->_executionBlocksContentIsLoaded;
      v6 = _Block_copy(v4);
      -[NSMutableArray addObject:](executionBlocksContentIsLoaded, "addObject:", v6);

    }
    v4 = aBlock;
  }

}

- (BOOL)hasContent
{
  return !self->_allContentIsLoaded
      || -[NSArray count](self->_tileGroups, "count")
      || -[NSOrderedSet count](self->_messages, "count") != 0;
}

- (id)_messageForIssuerBinding
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PKDashboardPassMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  _QWORD v22[5];
  _QWORD aBlock[5];
  id v24;

  -[PKPassGroupView frontmostPassView](self->_groupView, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nfcPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "payloadState");

  objc_msgSend(v4, "issuerBindingInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("learnMoreURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedPaymentString(CFSTR("ISSUER_DATA_DASHBOARD_ERROR_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  switch(v6)
  {
    case 0:
      goto LABEL_11;
    case 1:
      -[PKDashboardBarcodePassDataSource _sendAnalyticsForIssuerBindingMessageType:](self, "_sendAnalyticsForIssuerBindingMessageType:", *MEMORY[0x1E0D68B78]);
      objc_msgSend(v4, "organizationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("ISSUER_DATA_DASHBOARD_ERROR_INVALID_BINDING_MESSAGE"), CFSTR("%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        PKPassKitUIBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("MessageError"), CFSTR("pdf"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("ISSUER_DATA_DASHBOARD_ERROR_INVALID_BINDING_ACTION_TITLE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke;
        aBlock[3] = &unk_1E3E61388;
        aBlock[4] = self;
        v24 = v8;
        v16 = _Block_copy(aBlock);

      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
      }
      goto LABEL_8;
    case 2:
      -[PKDashboardBarcodePassDataSource _sendAnalyticsForIssuerBindingMessageType:](self, "_sendAnalyticsForIssuerBindingMessageType:", *MEMORY[0x1E0D68B80]);
      PKPassKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLForResource:withExtension:", CFSTR("MessageError"), CFSTR("pdf"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("ISSUER_DATA_DASHBOARD_ERROR_ACCOUNT_MISSING_MESSAGE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("ISSUER_DATA_DASHBOARD_ERROR_INVALID_BINDING_SIGN_IN_TITLE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke_2;
      v22[3] = &unk_1E3E612E8;
      v22[4] = self;
      v16 = _Block_copy(v22);
      goto LABEL_8;
    case 3:
      PKLocalizedPaymentString(CFSTR("ACTIVATING_TITLE"));
      v18 = objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("ACTIVATING_MESSAGE_PASS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v9 = (void *)v18;
      goto LABEL_8;
    default:
      v12 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
LABEL_8:
      v10 = objc_alloc_init(PKDashboardPassMessage);
      -[PKDashboardPassMessage setIdentifier:](v10, "setIdentifier:", CFSTR("IssuerBindingInvalidMessage"));
      if (v14)
      {
        v19 = PKUIScreenScale();
        PKUIImageFromPDF(v14, 45.0, 45.0, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setImage:](v10, "setImage:", v20);

      }
      -[PKDashboardPassMessage setTitle:](v10, "setTitle:", v9);
      -[PKDashboardPassMessage setMessage:](v10, "setMessage:", v12);
      -[PKDashboardPassMessage setButtonTitle:](v10, "setButtonTitle:", v15);
      -[PKDashboardPassMessage setActionOnButtonPress:](v10, "setActionOnButtonPress:", v16);

LABEL_11:
      return v10;
  }
}

void __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsForIssuerBindingDidTapButton:", *MEMORY[0x1E0D69640]);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v2, 0);

}

void __60__PKDashboardBarcodePassDataSource__messageForIssuerBinding__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsForIssuerBindingDidTapButton:", *MEMORY[0x1E0D69650]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)_sendAnalyticsForIssuerBindingMessageType:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69938];
  v6 = a3;
  objc_msgSend(v4, "beginSubjectReporting:", v5);
  v7 = (void *)MEMORY[0x1E0D66A58];
  v8 = *MEMORY[0x1E0D68F50];
  v16[0] = *MEMORY[0x1E0D68AA0];
  v16[1] = v8;
  v9 = *MEMORY[0x1E0D68FA8];
  v17[0] = v6;
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E0D69648];
  -[PKPassGroupView frontmostPassView](self->_groupView, "frontmostPassView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passTypeIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = *MEMORY[0x1E0D69618];
  if (v12)
    v14 = v12;
  v17[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subject:sendEvent:", v5, v15);

  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v5);
}

- (void)_sendAnalyticsForIssuerBindingDidTapButton:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D69938];
  v5 = a3;
  objc_msgSend(v3, "beginSubjectReporting:", v4);
  v6 = *MEMORY[0x1E0D68F50];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v7 = *MEMORY[0x1E0D68FA8];
  v11[0] = *MEMORY[0x1E0D68B18];
  v11[1] = v7;
  v8 = (void *)MEMORY[0x1E0D66A58];
  v10[2] = *MEMORY[0x1E0D68858];
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject:sendEvent:", v4, v9);

  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionBlocksContentIsLoaded, 0);
  objc_storeStrong((id *)&self->_tileFactory, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_groupView, 0);
}

@end
