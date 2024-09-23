@implementation STAllowanceItemSearchResultsController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STAllowanceItemSearchResultsController;
  -[STAllowanceItemSearchResultsController viewDidLoad](&v6, sel_viewDidLoad);
  -[STAllowanceItemSearchResultsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 0.0, 2.22507386e-308);
  objc_msgSend(v3, "setTableHeaderView:", v4);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSearchResultsController.viewDidLoad", v5, 2u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STAllowanceItemSearchResultsController;
  -[STAllowanceItemSearchResultsController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[STAllowanceItemSearchResultsController selectedWebDomains](self, "selectedWebDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSearchResultsController setInitialWebDomains:](self, "setInitialWebDomains:", v4);

  -[STAllowanceItemSearchResultsController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSearchResultsController setInitalBundleIdentifiers:](self, "setInitalBundleIdentifiers:", v5);

  -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSearchResultsController.viewWillAppear", v6, 2u);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[STAllowanceItemSearchResultsController filteredAllowanceItemSpecifiers](self, "filteredAllowanceItemSpecifiers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AllowanceItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v7, "setSelectedBackgroundView:", v8);
  -[STAllowanceItemSearchResultsController filteredAllowanceItemSpecifiers](self, "filteredAllowanceItemSpecifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE75A18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "BOOLValue");
  else
    v15 = 1;
  objc_msgSend(v7, "setUserInteractionEnabled:", v15);
  objc_msgSend(v7, "iconImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = 0.5;
  if ((_DWORD)v15)
    v18 = 1.0;
  objc_msgSend(v16, "setAlpha:", v18);
  objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CategoryIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BE84810];
  v58 = v20;
  v59 = v8;
  v60 = v14;
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BE84810]))
  {
    objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v22, "userInterfaceStyle");
    objc_msgSend(v12, "name");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v57 = v22;
    if (objc_msgSend(v23, "length"))
    {
      v53 = v21;
      v54 = v19;
      v55 = v17;
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setScheme:", CFSTR("https"));
      objc_msgSend(v24, "setHost:", v23);
      objc_msgSend(v24, "URL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "_lp_highLevelDomain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "host");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v25;
      v29 = v26;
      v30 = v27;
      if (objc_msgSend(v28, "length"))
      {
        objc_msgSend(v28, "substringToIndex:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uppercaseString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v29, "substringToIndex:", 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "uppercaseString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:].cold.2((uint64_t)v30, (uint64_t)v29);
      }
      v21 = v53;

      v19 = v54;
      v17 = v55;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:].cold.1((uint64_t)v23);
      v32 = 0;
    }
    v37 = v58;

    objc_msgSend(v19, "monogramImageForInitial:useDarkColors:", v32, v56 == 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v39);

  }
  else
  {
    objc_msgSend(v12, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageForBundleIdentifier:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v17, "setImage:", v34);
    }
    else
    {
      objc_msgSend(v19, "imageForBlankApplicationIcon");
      v35 = v17;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setImage:", v36);

      v17 = v35;
    }
    v37 = v58;

  }
  objc_msgSend(v7, "nameLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setText:", v41);

  objc_msgSend(v40, "setEnabled:", v15);
  objc_msgSend(v7, "dashLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setEnabled:", v15);

  objc_msgSend(v7, "categoryLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v37;
  if (objc_msgSend(v44, "isEqualToString:", v21))
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v45 = v12;
    v46 = v19;
    v47 = v17;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("MostUsedWebsites"), &stru_24DB8A1D0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v47;
    v19 = v46;
    v12 = v45;
  }
  else
  {
    if ((objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BE157D0]) & 1) != 0
      || (objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BE157E0]) & 1) != 0
      || objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BE157D8]))
    {
      objc_msgSend(MEMORY[0x24BE15828], "shortLocalizedNameForIdentifier:", v44);
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      STCategoryNameWithIdentifier();
      v50 = objc_claimAutoreleasedReturnValue();
    }
    v49 = (void *)v50;
  }

  objc_msgSend(v43, "setText:", v49);
  objc_msgSend(v43, "setEnabled:", v15);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double MinX;
  void *v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v19 = a3;
  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(v7, "isUserInteractionEnabled") & 1) == 0 && (objc_msgSend(v7, "isSelected") & 1) == 0)
  {
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);
    objc_msgSend(v19, "selectRowAtIndexPath:animated:scrollPosition:", v8, 0, 0);
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);
  }
  objc_msgSend(v7, "separatorInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v7, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  MinX = CGRectGetMinX(v20);
  objc_msgSend(v7, "nameLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v18 = MinX + CGRectGetMinX(v21);

  objc_msgSend(v7, "setSeparatorInset:", v10, v18, v12, v14);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  -[STAllowanceItemSearchResultsController filteredAllowanceItemSpecifiers](self, "filteredAllowanceItemSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CategoryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSearchResultsController selectedWebDomains](self, "selectedWebDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSearchResultsController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE84810]);
  objc_msgSend(v16, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v13 = v9;
  else
    v13 = v10;
  objc_msgSend(v13, "addObject:", v12);

  -[STAllowanceItemSearchResultsController initialWebDomains](self, "initialWebDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isSubsetOfOrderedSet:", v14) & 1) != 0)
  {
    -[STAllowanceItemSearchResultsController initalBundleIdentifiers](self, "initalBundleIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", objc_msgSend(v10, "isSubsetOfOrderedSet:", v15) ^ 1);

  }
  else
  {
    -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", 1);
  }

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  -[STAllowanceItemSearchResultsController filteredAllowanceItemSpecifiers](self, "filteredAllowanceItemSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CategoryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSearchResultsController selectedWebDomains](self, "selectedWebDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAllowanceItemSearchResultsController selectedBundleIdentifiers](self, "selectedBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE84810]);
  objc_msgSend(v16, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v13 = v9;
  else
    v13 = v10;
  objc_msgSend(v13, "removeObject:", v12);

  -[STAllowanceItemSearchResultsController initialWebDomains](self, "initialWebDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isSubsetOfOrderedSet:", v14) & 1) != 0)
  {
    -[STAllowanceItemSearchResultsController initalBundleIdentifiers](self, "initalBundleIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", objc_msgSend(v10, "isSubsetOfOrderedSet:", v15) ^ 1);

  }
  else
  {
    -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", 1);
  }

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  STAllowanceItemSearchResultsController *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v30 = v4;
  objc_msgSend(v4, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = self;
  -[STAllowanceItemSearchResultsController allowanceItemSpecifiers](self, "allowanceItemSpecifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    v12 = *MEMORY[0x24BE84810];
    v33 = *MEMORY[0x24BE157D0];
    v32 = *MEMORY[0x24BE157E0];
    v31 = *MEMORY[0x24BE157D8];
    do
    {
      v13 = 0;
      v34 = v10;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "localizedCaseInsensitiveContainsString:", v7);

        if (v16)
        {
          objc_msgSend(v5, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CategoryIdentifier"));
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqualToString:", v12))
          {
            +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
            v18 = v7;
            v19 = v11;
            v20 = v5;
            v21 = v12;
            v22 = v8;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MostUsedWebsites"), &stru_24DB8A1D0, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v22;
            v12 = v21;
            v5 = v20;
            v11 = v19;
            v7 = v18;
            v10 = v34;
          }
          else
          {
            if ((objc_msgSend(v17, "isEqualToString:", v33) & 1) != 0
              || (objc_msgSend(v17, "isEqualToString:", v32) & 1) != 0
              || objc_msgSend(v17, "isEqualToString:", v31))
            {
              objc_msgSend(MEMORY[0x24BE15828], "shortLocalizedNameForIdentifier:", v17);
              v25 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              STCategoryNameWithIdentifier();
              v25 = objc_claimAutoreleasedReturnValue();
            }
            v24 = (void *)v25;
          }

          if (objc_msgSend(v24, "localizedCaseInsensitiveContainsString:", v7))
            objc_msgSend(v5, "addObject:", v14);

        }
        ++v13;
      }
      while (v10 != v13);
      v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v10 = v26;
    }
    while (v26);
  }

  -[STAllowanceItemSearchResultsController setFilteredAllowanceItemSpecifiers:](v29, "setFilteredAllowanceItemSpecifiers:", v5);
  -[STAllowanceItemSearchResultsController tableView](v29, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reloadData");
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __81__STAllowanceItemSearchResultsController_updateSearchResultsForSearchController___block_invoke;
  v35[3] = &unk_24DB86470;
  v35[4] = v29;
  v36 = v27;
  v28 = v27;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v35);

}

void __81__STAllowanceItemSearchResultsController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CategoryIdentifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE84810]);
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "selectedWebDomains");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "containsObject:", v9);
    if ((v10 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v7, "selectedBundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "containsObject:", v12);
  if (v13)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "selectRowAtIndexPath:animated:scrollPosition:", v14, 0, 0);

  }
LABEL_6:

}

- (NSMutableOrderedSet)selectedBundleIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setSelectedBundleIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (NSMutableOrderedSet)selectedWebDomains
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setSelectedWebDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (BOOL)hasNewSelection
{
  return self->_hasNewSelection;
}

- (void)setHasNewSelection:(BOOL)a3
{
  self->_hasNewSelection = a3;
}

- (NSArray)allowanceItemSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setAllowanceItemSpecifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1040);
}

- (NSArray)filteredAllowanceItemSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setFilteredAllowanceItemSpecifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1048);
}

- (NSOrderedSet)initialWebDomains
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setInitialWebDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1056);
}

- (NSOrderedSet)initalBundleIdentifiers
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setInitalBundleIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initalBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialWebDomains, 0);
  objc_storeStrong((id *)&self->_filteredAllowanceItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_allowanceItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_selectedWebDomains, 0);
  objc_storeStrong((id *)&self->_selectedBundleIdentifiers, 0);
}

- (void)tableView:(uint64_t)a1 cellForRowAtIndexPath:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Web domain name must have at least one character for monogram: %@", (uint8_t *)&v1, 0xCu);
}

- (void)tableView:(uint64_t)a1 cellForRowAtIndexPath:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", (uint8_t *)&v2, 0x16u);
}

@end
