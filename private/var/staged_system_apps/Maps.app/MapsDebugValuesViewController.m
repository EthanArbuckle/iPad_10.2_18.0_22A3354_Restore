@implementation MapsDebugValuesViewController

+ (id)navigationDestinationTitle
{
  return CFSTR("Debug Settings");
}

- (MapsDebugValuesViewController)init
{
  MapsDebugValuesViewController *v2;
  MapsDebugValuesViewController *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  UISearchController *v8;
  UISearchController *searchController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MapsDebugValuesViewController;
  v2 = -[MapsDebugValuesViewController initWithStyle:](&v11, "initWithStyle:", 2);
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_class(v2), "navigationDestinationTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[MapsDebugValuesViewController setTitle:](v3, "setTitle:", v5);

    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v3, "_done");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController navigationItem](v3, "navigationItem"));
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

    if (objc_msgSend((id)objc_opt_class(v3), "isSearchable"))
    {
      v8 = (UISearchController *)objc_alloc_init((Class)UISearchController);
      searchController = v3->_searchController;
      v3->_searchController = v8;

      -[UISearchController setDelegate:](v3->_searchController, "setDelegate:", v3);
      -[UISearchController setActive:](v3->_searchController, "setActive:", 1);
      -[UISearchController setSearchResultsUpdater:](v3->_searchController, "setSearchResultsUpdater:", v3);
      -[UISearchController setObscuresBackgroundDuringPresentation:](v3->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    }
  }
  return v3;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_sections;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setDisplayingViewController:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsDebugValuesViewController;
  -[MapsDebugValuesViewController dealloc](&v8, "dealloc");
}

- (void)viewDidLoad
{
  MapsDebugValuesViewDiffableDataSource *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  MapsDebugValuesViewDiffableDataSource *v7;
  MapsDebugValuesViewDiffableDataSource *diffableDataSource;
  void *v9;
  UISearchController *searchController;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MapsDebugValuesViewController;
  -[MapsDebugValuesViewController viewDidLoad](&v14, "viewDidLoad");
  if (self->_searchController)
  {
    v3 = [MapsDebugValuesViewDiffableDataSource alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController tableView](self, "tableView"));
    v5 = sub_10046D908(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[MapsDebugValuesViewDiffableDataSource initWithTableView:cellProvider:](v3, "initWithTableView:cellProvider:", v4, v6);
    diffableDataSource = self->_diffableDataSource;
    self->_diffableDataSource = v7;

    -[MapsDebugValuesViewDiffableDataSource setDefaultRowAnimation:](self->_diffableDataSource, "setDefaultRowAnimation:", 0);
    objc_storeWeak((id *)&self->_diffableDataSource->_debugVC, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
    objc_msgSend(v9, "setDelegate:", self);

    searchController = self->_searchController;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v11, "setSearchController:", searchController);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
    objc_msgSend(v13, "setAutocorrectionType:", 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsDebugValuesViewController;
  -[MapsDebugValuesViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MapsDebugValuesViewController loadContentNowIfNeeded:](self, "loadContentNowIfNeeded:", 0);
}

+ (BOOL)isSearchable
{
  return 1;
}

- (void)prepareContent
{
  void (**prepareContentBlock)(id, MapsDebugValuesViewController *);

  if (self->_navigationDestinationTitle)
    -[MapsDebugValuesViewController setTitle:](self, "setTitle:");
  prepareContentBlock = (void (**)(id, MapsDebugValuesViewController *))self->_prepareContentBlock;
  if (prepareContentBlock)
    prepareContentBlock[2](prepareContentBlock, self);
}

- (void)addSection:(id)a3
{
  -[NSMutableArray addObject:](self->_mutableSections, "addObject:", a3);
}

- (id)addSectionWithTitle:(id)a3 content:(id)a4
{
  void (**v6)(id, MapsDebugTableSection *);
  id v7;
  MapsDebugTableSection *v8;

  v6 = (void (**)(id, MapsDebugTableSection *))a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugTableSection);
  -[MapsDebugTableSection setTitle:](v8, "setTitle:", v7);

  v6[2](v6, v8);
  -[MapsDebugTableSection commit](v8, "commit");
  -[NSMutableArray addObject:](self->_mutableSections, "addObject:", v8);
  return v8;
}

- (id)_sections
{
  -[MapsDebugValuesViewController loadContentNowIfNeeded:](self, "loadContentNowIfNeeded:", 0);
  return self->_sections;
}

- (void)loadContentNowIfNeeded
{
  -[MapsDebugValuesViewController loadContentNowIfNeeded:](self, "loadContentNowIfNeeded:", 0);
}

- (void)loadContentNowIfNeeded:(BOOL)a3
{
  MapsDebugValuesViewController *v3;
  NSMutableArray *v4;
  NSMutableArray *mutableSections;
  NSArray *v6;
  NSArray *sections;
  NSMutableArray *v8;
  void *v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *sectionIdentifierMap;
  id v19;
  id v20;
  void *j;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  void *v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *rowIdentifierMap;
  void *v32;
  void *v33;
  _BOOL4 v34;
  MapsDebugValuesViewController *v35;
  void *v36;
  NSArray *obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];

  if (!self->_sections)
  {
    v3 = self;
    v34 = a3;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableSections = v3->_mutableSections;
    v3->_mutableSections = v4;

    -[MapsDebugValuesViewController prepareContent](v3, "prepareContent");
    v6 = (NSArray *)-[NSMutableArray copy](v3->_mutableSections, "copy");
    sections = v3->_sections;
    v3->_sections = v6;

    v8 = v3->_mutableSections;
    v3->_mutableSections = 0;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v10 = v3->_sections;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    v35 = v3;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "setDisplayingViewController:", v3);
          objc_msgSend(v15, "commit");
          if (objc_msgSend(v15, "visible"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v15));
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v15, v16);

            v3 = v35;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v12);
    }

    v17 = (NSDictionary *)objc_msgSend(v36, "copy");
    sectionIdentifierMap = v3->_sectionIdentifierMap;
    v3->_sectionIdentifierMap = v17;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v3->_sections;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v19)
    {
      v20 = v19;
      v38 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v44 != v38)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "rows"));
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v25; k = (char *)k + 1)
              {
                if (*(_QWORD *)v40 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k);
                if (objc_msgSend(v28, "visible"))
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v28));
                  objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, v29);

                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v25);
          }

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v20);
    }

    v30 = (NSDictionary *)objc_msgSend(v9, "copy");
    rowIdentifierMap = v35->_rowIdentifierMap;
    v35->_rowIdentifierMap = v30;

    if (-[UISearchController isActive](v35->_searchController, "isActive"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](v35->_searchController, "searchBar"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "text"));

    }
    else
    {
      v33 = 0;
    }
    -[MapsDebugValuesViewController _applySnapshotWithFilterText:animated:](v35, "_applySnapshotWithFilterText:animated:", v33, v34);

  }
}

- (BOOL)debugTableSection:(id)a3 matches:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  if ((objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", v6) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "footer"));
    v8 = objc_msgSend(v9, "localizedCaseInsensitiveContainsString:", v6);

  }
  return v8;
}

- (BOOL)debugTableRow:(id)a3 matches:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  if ((objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", v6) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));
    v8 = objc_msgSend(v9, "localizedCaseInsensitiveContainsString:", v6);

  }
  return v8;
}

- (void)_applySnapshotWithFilterText:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSArray *v7;
  id v8;
  int *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *j;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  NSArray *obj;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];

  v4 = a4;
  v6 = a3;
  if (self->_searchController)
  {
    v30 = v4;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_sections, "count")));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v7 = self->_sections;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    v9 = &OBJC_IVAR___SuggestionsDataProvider__suggestions;
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i)));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_sectionIdentifierMap, "objectForKeyedSubscript:", v13));

          if (v14)
            objc_msgSend(v33, "addObject:", v13);

        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v10);
    }

    v32 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
    objc_msgSend(v32, "appendSectionsWithIdentifiers:", v33);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = self->_sections;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v44;
      v38 = v6;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9[264]), "objectForKeyedSubscript:", v17));

          if (v18)
          {
            v36 = v17;
            v37 = j;
            if (objc_msgSend(v6, "length"))
              v19 = -[MapsDebugValuesViewController debugTableSection:matches:](self, "debugTableSection:matches:", v16, v6);
            else
              v19 = 1;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rows"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v20, "count")));

            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rows"));
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v40;
              do
              {
                for (k = 0; k != v24; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v40 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k);
                  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v27));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowIdentifierMap, "objectForKeyedSubscript:", v28));

                  if (v29
                    && ((v19 & 1) != 0
                     || !objc_msgSend(v38, "length")
                     || -[MapsDebugValuesViewController debugTableRow:matches:](self, "debugTableRow:matches:", v27, v38)))
                  {
                    objc_msgSend(v21, "addObject:", v28);
                  }

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              }
              while (v24);
            }

            v17 = v36;
            objc_msgSend(v32, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v21, v36);

            j = v37;
            v6 = v38;
            v9 = &OBJC_IVAR___SuggestionsDataProvider__suggestions;
          }

        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v35);
    }

    -[MapsDebugValuesViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v32, v30);
  }

}

- (void)segueToViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MapsDebugValuesViewController willNavigateToSubsequentController:](self, "willNavigateToSubsequentController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController navigationDelegate](self, "navigationDelegate"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController navigationDelegate](self, "navigationDelegate"));
    objc_msgSend(v6, "debugViewController:segueToViewController:", self, v4);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "pushViewController:animated:", v4, 1);
  }

}

- (void)willNavigateToSubsequentController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate"));
  objc_msgSend(v4, "setDelegate:", v5);

}

- (void)_done
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate"));
  objc_msgSend(v3, "debugControllerDidFinish:", self);

}

- (id)sectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewDiffableDataSource sectionIdentifierForIndex:](self->_diffableDataSource, "sectionIdentifierForIndex:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_sectionIdentifierMap, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)rowAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_rowIdentifierMap, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  NSDictionary *rowIdentifierMap;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  rowIdentifierMap = self->_rowIdentifierMap;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](rowIdentifierMap, "objectForKeyedSubscript:", a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForTableView:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionAction"));
  objc_msgSend(v9, "setSelectionStyle:", v10 != 0);

  objc_msgSend(v8, "setCurrentCell:", v9);
  return v9;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController rowAtIndexPath:](self, "rowAtIndexPath:", a5));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentCell"));

  if (v8 == v7)
    objc_msgSend(v9, "setCurrentCell:", 0);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController rowAtIndexPath:](self, "rowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionAction"));

  if (v8)
  {
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionAction"));
    v9[2]();

  }
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)reloadData
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController tableView](self, "tableView"));
  objc_msgSend(v2, "reloadData");

}

- (void)rebuildSections
{
  NSArray *sections;

  sections = self->_sections;
  self->_sections = 0;

  -[MapsDebugValuesViewController loadContentNowIfNeeded:](self, "loadContentNowIfNeeded:", 1);
  -[MapsDebugValuesViewController reloadData](self, "reloadData");
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[MapsDebugValuesViewController _applySnapshotWithFilterText:animated:](self, "_applySnapshotWithFilterText:animated:", v4, 1);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[MapsDebugValuesViewController _applySnapshotWithFilterText:animated:](self, "_applySnapshotWithFilterText:animated:", a4, 1);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[MapsDebugValuesViewController _applySnapshotWithFilterText:animated:](self, "_applySnapshotWithFilterText:animated:", 0, 1);
}

- (MapsDebugViewControllerNavigationDelegate)navigationDelegate
{
  return (MapsDebugViewControllerNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (MapsDebugViewControllerDelegate)delegate
{
  return (MapsDebugViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)prepareContentBlock
{
  return self->_prepareContentBlock;
}

- (void)setPrepareContentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)navigationDestinationTitle
{
  return self->_navigationDestinationTitle;
}

- (void)setNavigationDestinationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationDestinationTitle, 0);
  objc_storeStrong(&self->_prepareContentBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_rowIdentifierMap, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierMap, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_mutableSections, 0);
}

@end
