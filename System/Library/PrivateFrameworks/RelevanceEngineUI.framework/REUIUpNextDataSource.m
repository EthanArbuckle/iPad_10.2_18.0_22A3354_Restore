@implementation REUIUpNextDataSource

- (REUIUpNextDataSource)initWithRelevanceEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REUIUpNextDataSource *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "configuration", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "historicSectionDescriptor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
        objc_msgSend(v12, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  v18 = -[REUIUpNextDataSource initWithRelevanceEngine:sectionOrder:](self, "initWithRelevanceEngine:sectionOrder:", v4, v17);

  return v18;
}

- (REUIUpNextDataSource)initWithRelevanceEngine:(id)a3 sectionOrder:(id)a4
{
  id v6;
  id v7;
  REUIUpNextDataSource *v8;
  REUIRelevanceEngineController *v9;
  REUIRelevanceEngineController *controller;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REUIUpNextDataSource;
  v8 = -[REUIUpNextDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = -[REUIRelevanceEngineController initWithRelevanceEngine:sectionOrder:]([REUIRelevanceEngineController alloc], "initWithRelevanceEngine:sectionOrder:", v6, v7);
    controller = v8->_controller;
    v8->_controller = v9;

  }
  return v8;
}

- (id)_sectionTitleAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;

  -[REUIUpNextDataSource sectionOrder](self, "sectionOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == (void *)*MEMORY[0x24BE7D0B8])
  {
    v8 = CFSTR("Up Next");
  }
  else if (v5 == (void *)*MEMORY[0x24BE7D118])
  {
    v8 = CFSTR("Upcoming");
  }
  else if (v5 == (void *)*MEMORY[0x24BE7D0A0])
  {
    v8 = CFSTR("All Day");
  }
  else if (v5 == (void *)*MEMORY[0x24BE7D120])
  {
    v8 = CFSTR("Tomorrow");
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BE7D0B8], "stringByAppendingString:", CFSTR("_historic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
      v8 = CFSTR("Recent");
    else
      v8 = CFSTR("Unknown");
  }

  return (id)v8;
}

- (RERelevanceEngine)relevanceEngine
{
  return -[REUIRelevanceEngineController engine](self->_controller, "engine");
}

- (NSArray)sectionOrder
{
  return -[REUIRelevanceEngineController sectionOrder](self->_controller, "sectionOrder");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_controller, "numberOfItemsInSectionAtIndex:", a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[REUIRelevanceEngineController numberOfSections](self->_controller, "numberOfSections", a3);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "headersRegistered"))
  {
    v11 = *MEMORY[0x24BDF7630];
  }
  else
  {
    v12 = objc_opt_class();
    v11 = *MEMORY[0x24BDF7630];
    objc_msgSend(v8, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v12, *MEMORY[0x24BDF7630], CFSTR("REUpNextHeaderReuseIdentifier"));
    objc_msgSend(v8, "setHeadersRegistered:", 1);
  }
  if (objc_msgSend(v9, "isEqualToString:", v11))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("REUpNextHeaderReuseIdentifier"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUIUpNextDataSource _sectionTitleAtIndex:](self, "_sectionTitleAtIndex:", objc_msgSend(v10, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v14, "uppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithString:", v16);
    objc_msgSend(v13, "setAttributedText:", v17);

  }
  else
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, &stru_24CF7A2B0, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "cellRegistered") & 1) == 0)
  {
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("REUpNextLargeTextCellReuseIdentifier"));
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("REUpNextMultilineCellReuseIdentifier"));
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("REUpNextThumbnailCellReuseIdentifier"));
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("REUpNextLargeWithDetailTextCellReuseIdentifier"));
    objc_msgSend(v6, "setCellRegistered:", 1);
  }
  -[REUIRelevanceEngineController contentAtIndexPath:](self->_controller, "contentAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "style");
  if (v9 > 5)
    v10 = CFSTR("REUpNextLargeTextCellReuseIdentifier");
  else
    v10 = off_24CF7A048[v9];
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureWithContent:", v8);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("siriblur"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentImage:animated:", v12, 0);

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[REUIUpNextDataSource _sectionTitleAtIndex:](self, "_sectionTitleAtIndex:", a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[REUIRelevanceEngineController numberOfSections](self->_controller, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_controller, "numberOfItemsInSectionAtIndex:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "cellRegistered") & 1) == 0)
  {
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
    objc_msgSend(v6, "setCellRegistered:", 1);
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUIRelevanceEngineController contentAtIndexPath:](self->_controller, "contentAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
    objc_msgSend(v8, "configureWithContent:", v9);

  return v8;
}

- (void)setDelegate:(id)a3
{
  -[REUIRelevanceEngineController setDelegate:](self->_controller, "setDelegate:", a3);
}

- (REUIRelevanceEngineControllerDelegate)delegate
{
  return -[REUIRelevanceEngineController delegate](self->_controller, "delegate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
