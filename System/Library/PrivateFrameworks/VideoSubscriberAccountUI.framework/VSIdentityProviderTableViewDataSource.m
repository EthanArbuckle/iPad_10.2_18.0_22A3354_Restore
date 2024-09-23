@implementation VSIdentityProviderTableViewDataSource

- (VSIdentityProviderTableViewDataSource)init
{
  VSIdentityProviderTableViewDataSource *v2;
  VSIdentityProviderTableViewDataSource *v3;
  NSArray *providerSections;
  NSArray *v5;
  NSArray *storefrontSections;
  NSArray *identityProviders;
  NSDictionary *destinationsBySectionIndexTitle;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderTableViewDataSource;
  v2 = -[VSIdentityProviderTableViewDataSource init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    providerSections = v2->_providerSections;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_providerSections = (NSArray *)MEMORY[0x24BDBD1A8];

    storefrontSections = v3->_storefrontSections;
    v3->_storefrontSections = v5;

    identityProviders = v3->_identityProviders;
    v3->_identityProviders = v5;

    destinationsBySectionIndexTitle = v3->_destinationsBySectionIndexTitle;
    v3->_destinationsBySectionIndexTitle = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v3;
}

- (void)setIdentityProviders:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  VSIdentityProviderSection *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  VSIdentityProviderSection *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  VSIdentityProviderTableViewDataSource *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  _QWORD v86[4];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v60 = self;
  objc_storeStrong((id *)&self->_identityProviders, a3);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("rankForSorting"), 1);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("rankForSorting"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)v9;
  objc_msgSend(MEMORY[0x24BDD14B8], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v9);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterUsingPredicate:");
  v56 = (void *)v8;
  v86[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingDescriptors:", v10);

  if (objc_msgSend(v7, "count"))
  {
    v11 = objc_alloc_init(VSIdentityProviderSection);
    -[VSIdentityProviderSection setIdentityProviders:](v11, "setIdentityProviders:", v7);
    objc_msgSend(v6, "addObject:", v11);

  }
  v59 = v6;
  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v83 = v13;
    v84 = 2112;
    v85 = v7;
    _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Found %@ featured providers: %@", buf, 0x16u);

  }
  v14 = (void *)objc_msgSend(v5, "mutableCopy");
  v15 = objc_msgSend(v14, "count");
  if (v15 < -[VSIdentityProviderTableViewDataSource _minimumProviderCountForIndexes](self, "_minimumProviderCountForIndexes"))objc_msgSend(v14, "removeObjectsInArray:", v7);
  v57 = v7;
  v52 = objc_msgSend(v14, "count");
  objc_msgSend(MEMORY[0x24BDF6B98], "currentCollation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v16, "sectionIndexTitles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = 0;
    do
    {
      v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v17, "addObject:", v21);

      ++v20;
      objc_msgSend(v16, "sectionIndexTitles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v20 < v23);
  }
  v58 = v5;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v76 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v16, "sectionForObject:collationStringSelector:", v29, sel_nameForSorting));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v26);
  }

  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v32 = v17;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v72 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(v16, "sortedArrayFromArray:collationStringSelector:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j), sel_nameForSorting);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v34);
  }

  v38 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = objc_msgSend(v59, "count");
  objc_msgSend(v16, "sectionIndexTitles");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __62__VSIdentityProviderTableViewDataSource_setIdentityProviders___block_invoke;
  v65[3] = &unk_24FE1B510;
  v41 = v16;
  v66 = v41;
  v42 = v31;
  v67 = v42;
  v69 = v52;
  v70 = v39;
  v43 = v38;
  v68 = v43;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v65);

  -[VSIdentityProviderTableViewDataSource setDestinationsBySectionIndexTitle:](v60, "setDestinationsBySectionIndexTitle:", v43);
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v45 = v42;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v47; ++k)
      {
        if (*(_QWORD *)v62 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(v44, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k));
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    }
    while (v47);
  }

  v50 = objc_alloc_init(VSIdentityProviderSection);
  -[VSIdentityProviderSection setIdentityProviders:](v50, "setIdentityProviders:", v44);
  objc_msgSend(v59, "addObject:", v50);
  -[VSIdentityProviderTableViewDataSource setProviderSections:](v60, "setProviderSections:", v59);
  -[VSIdentityProviderTableViewDataSource tableView](v60, "tableView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "reloadData");

}

void __62__VSIdentityProviderTableViewDataSource_setIdentityProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "sectionForSectionIndexTitleAtIndex:", a3);
  if (v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 += objc_msgSend(v9, "count");

    }
  }
  if (v7 >= *(_QWORD *)(a1 + 56) - 1)
    v10 = *(_QWORD *)(a1 + 56) - 1;
  else
    v10 = v7;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v10, *(_QWORD *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v11, v12);

}

- (void)setTvProviderSupportedStorefronts:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  VSStorefrontSection *v16;
  VSStorefrontSection *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, a3);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "isFeatured", (_QWORD)v19))
          v15 = v6;
        else
          v15 = v7;
        objc_msgSend(v15, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v6, "count"))
  {
    v16 = objc_alloc_init(VSStorefrontSection);
    -[VSStorefrontSection setStorefronts:](v16, "setStorefronts:", v6);
    objc_msgSend(v8, "addObject:", v16);

  }
  v17 = objc_alloc_init(VSStorefrontSection);
  -[VSStorefrontSection setStorefronts:](v17, "setStorefronts:", v7);
  objc_msgSend(v8, "addObject:", v17);
  -[VSIdentityProviderTableViewDataSource setStorefrontSections:](self, "setStorefrontSections:", v8);
  -[VSIdentityProviderTableViewDataSource tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadData");

}

- (unint64_t)_minimumProviderCountForIndexes
{
  return 50;
}

- (void)setTableView:(id)a3
{
  UITableView *v5;
  UITableView *tableView;
  UITableView *v7;

  v5 = (UITableView *)a3;
  tableView = self->_tableView;
  if (tableView != v5)
  {
    v7 = v5;
    -[UITableView setDataSource:](tableView, "setDataSource:", 0);
    objc_storeStrong((id *)&self->_tableView, a3);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setSectionIndexMinimumDisplayRowCount:](self->_tableView, "setSectionIndexMinimumDisplayRowCount:", -[VSIdentityProviderTableViewDataSource _minimumProviderCountForIndexes](self, "_minimumProviderCountForIndexes"));
    v5 = v7;
  }

}

- (void)setAdditionalProvidersMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_additionalProvidersMode != a3)
  {
    self->_additionalProvidersMode = a3;
    -[VSIdentityProviderTableViewDataSource tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

    if (a3 - 5 <= 1)
    {
      -[VSIdentityProviderTableViewDataSource tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vs_scrollToTopAnimated:", 0);

      -[VSIdentityProviderTableViewDataSource tableView](self, "tableView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsFocusUpdate");

    }
  }
}

- (id)identityProviderForRowAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[VSIdentityProviderTableViewDataSource providerSections](self, "providerSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "count"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "row");
    objc_msgSend(v7, "identityProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= objc_msgSend(v9, "count"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)preferredIndexPathForIdentityProviderWithName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[VSIdentityProviderTableViewDataSource providerSections](self, "providerSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v5 = 0;
    v22 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        v25 = v5;
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "identityProviders");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v27;
LABEL_8:
          v13 = 0;
          v24 = v11 + v10;
          while (1)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v13), "displayName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "object");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v4);

            if ((v16 & 1) != 0)
              break;
            if (v10 == ++v13)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              v11 = v24;
              if (v10)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v18 = v11 + v13;
          v17 = v25;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v18, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            goto LABEL_19;
        }
        else
        {
LABEL_14:

          v17 = v25;
        }
        v5 = v17 + 1;
        ++v6;
      }
      while (v6 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (id)storefrontAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");

  -[VSIdentityProviderTableViewDataSource storefrontSections](self, "storefrontSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "storefronts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasStorefrontOrIdentityProviderAtIndexPath:(id)a3
{
  id v4;
  unint64_t additionalProvidersMode;
  void *v6;
  BOOL v7;

  v4 = a3;
  additionalProvidersMode = self->_additionalProvidersMode;
  if (additionalProvidersMode == 5)
  {
    -[VSIdentityProviderTableViewDataSource identityProviderForRowAtIndexPath:](self, "identityProviderForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (additionalProvidersMode != 6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    -[VSIdentityProviderTableViewDataSource storefrontAtIndexPath:](self, "storefrontAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6 != 0;

LABEL_7:
  return v7;
}

- (id)_additionalProvidersRowTitle
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode");
  switch(v2)
  {
    case 5uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("REGIONS_PICKER_OTHER_REGIONS_ROW_TITLE");
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE_DEVELOPER");
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE");
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cellReuseIdentifierForRowAtIndexPath:(id)a3
{
  void *v3;

  -[VSIdentityProviderTableViewDataSource identityProviderForRowAtIndexPath:](self, "identityProviderForRowAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return CFSTR("IdentityProviderCell");
  else
    return CFSTR("AdditionalProvidersCell");
}

- (int64_t)_cellStyleForRowAtIndexPath:(id)a3
{
  void *v3;

  -[VSIdentityProviderTableViewDataSource identityProviderForRowAtIndexPath:](self, "identityProviderForRowAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (id)_titleForRowAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VSIdentityProviderTableViewDataSource identityProviderForRowAtIndexPath:](self, "identityProviderForRowAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[VSIdentityProviderTableViewDataSource _additionalProvidersRowTitle](self, "_additionalProvidersRowTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
LABEL_3:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The title parameter must not be nil."));
LABEL_4:

  return v7;
}

- (int64_t)_textAlignmentForRowAtIndexPath:(id)a3
{
  id v4;

  v4 = a3;
  if (-[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode") != 6)
  {
    -[VSIdentityProviderTableViewDataSource identityProviderForRowAtIndexPath:](self, "identityProviderForRowAtIndexPath:", v4);

  }
  return 4;
}

- (id)_textColorForRowAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x24BDF6950];
  v5 = a3;
  objc_msgSend(v4, "vsa_primaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode") == 6)
    -[VSIdentityProviderTableViewDataSource storefrontAtIndexPath:](self, "storefrontAtIndexPath:", v5);
  else
    -[VSIdentityProviderTableViewDataSource identityProviderForRowAtIndexPath:](self, "identityProviderForRowAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "vsa_primaryLabelColor");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (void)_scrollToTableHeaderView
{
  void *v2;
  id v3;

  -[VSIdentityProviderTableViewDataSource tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", v2);
  objc_msgSend(v3, "scrollRectToVisible:animated:", 0);

}

- (void)setNumberOfLinesForCell:(id)a3 atIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

}

- (int64_t)cellAccessoryType
{
  return 0;
}

- (id)tableView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Requesting index path for title %@ at index %@", (uint8_t *)&v14, 0x16u);

  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDF7DF0]))
  {
    -[VSIdentityProviderTableViewDataSource performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scrollToTableHeaderView, 0, 0.0);
    v10 = 0;
  }
  else
  {
    -[VSIdentityProviderTableViewDataSource destinationsBySectionIndexTitle](self, "destinationsBySectionIndexTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Returning index path %@", (uint8_t *)&v14, 0xCu);
  }

  return v10;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDF7DF0]);
  objc_msgSend(MEMORY[0x24BDF6B98], "currentCollation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIndexTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  -[VSIdentityProviderTableViewDataSource providerSections](self, "providerSections", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  switch(-[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode"))
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
      ++v5;
      break;
    case 6uLL:
      -[VSIdentityProviderTableViewDataSource storefrontSections](self, "storefrontSections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "count");

      break;
    default:
      return v5;
  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  unint64_t v13;

  if (-[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode", a3) == 6)
  {
    -[VSIdentityProviderTableViewDataSource storefrontSections](self, "storefrontSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "storefronts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
LABEL_5:

    goto LABEL_6;
  }
  -[VSIdentityProviderTableViewDataSource providerSections](self, "providerSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "count");
  if (v10 > a4)
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identityProviders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "count");

    goto LABEL_5;
  }
  if (v10 == a4)
  {
    v13 = -[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode");
    v9 = v13 <= 5 && ((1 << v13) & 0x2A) != 0;
  }
  else
  {
    v9 = 0;
  }
LABEL_6:

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (-[VSIdentityProviderTableViewDataSource additionalProvidersMode](self, "additionalProvidersMode") == 6)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("IdentityProviderCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("IdentityProviderCell"));
    -[VSIdentityProviderTableViewDataSource storefrontAtIndexPath:](self, "storefrontAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryType:", -[VSIdentityProviderTableViewDataSource cellAccessoryType](self, "cellAccessoryType"));
    objc_msgSend(v8, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);
  }
  else
  {
    -[VSIdentityProviderTableViewDataSource _cellReuseIdentifierForRowAtIndexPath:](self, "_cellReuseIdentifierForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v12 = -[VSIdentityProviderTableViewDataSource _cellStyleForRowAtIndexPath:](self, "_cellStyleForRowAtIndexPath:", v7);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", v12, v9);
    }
    -[VSIdentityProviderTableViewDataSource _titleForRowAtIndexPath:](self, "_titleForRowAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v10);

    -[VSIdentityProviderTableViewDataSource setNumberOfLinesForCell:atIndexPath:](self, "setNumberOfLinesForCell:atIndexPath:", v8, v7);
    objc_msgSend(v8, "setAccessoryType:", -[VSIdentityProviderTableViewDataSource cellAccessoryType](self, "cellAccessoryType"));
    objc_msgSend(v8, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setTextAlignment:", -[VSIdentityProviderTableViewDataSource _textAlignmentForRowAtIndexPath:](self, "_textAlignmentForRowAtIndexPath:", v7));
  -[VSIdentityProviderTableViewDataSource _textColorForRowAtIndexPath:](self, "_textColorForRowAtIndexPath:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v14);
  objc_msgSend(v11, "setLineBreakMode:", 0);
  if (!v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The cell parameter must not be nil."));

  return v8;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSArray)identityProviders
{
  return self->_identityProviders;
}

- (unint64_t)additionalProvidersMode
{
  return self->_additionalProvidersMode;
}

- (NSString)requestedStorefrontCountryCode
{
  return self->_requestedStorefrontCountryCode;
}

- (void)setRequestedStorefrontCountryCode:(id)a3
{
  self->_requestedStorefrontCountryCode = (NSString *)a3;
}

- (NSArray)tvProviderSupportedStorefronts
{
  return self->_tvProviderSupportedStorefronts;
}

- (NSArray)providerSections
{
  return self->_providerSections;
}

- (void)setProviderSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)storefrontSections
{
  return self->_storefrontSections;
}

- (void)setStorefrontSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)destinationsBySectionIndexTitle
{
  return self->_destinationsBySectionIndexTitle;
}

- (void)setDestinationsBySectionIndexTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationsBySectionIndexTitle, 0);
  objc_storeStrong((id *)&self->_storefrontSections, 0);
  objc_storeStrong((id *)&self->_providerSections, 0);
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, 0);
  objc_storeStrong((id *)&self->_identityProviders, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
