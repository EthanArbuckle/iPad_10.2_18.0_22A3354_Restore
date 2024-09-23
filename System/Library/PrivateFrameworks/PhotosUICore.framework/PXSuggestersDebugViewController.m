@implementation PXSuggestersDebugViewController

- (PXSuggestersDebugViewController)initWithOptions:(id)a3
{
  id v5;
  PXSuggestersDebugViewController *v6;
  PXSuggestersDebugViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSuggestersDebugViewController;
  v6 = -[PXSuggestersDebugViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSuggestersDebugViewController;
  -[PXSuggestersDebugViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PXSuggestersDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Suggesters"));

  -[PXSuggestersDebugViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

  -[PXSuggestersDebugViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEstimatedRowHeight:", 44.0);

  -[PXSuggestersDebugViewController _fetchSuggesters](self, "_fetchSuggesters");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  PXSuggesterDebugViewController *v5;
  void *v6;
  void *v7;
  PXSuggesterDebugViewController *v8;
  void *v9;
  id v10;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [PXSuggesterDebugViewController alloc];
  objc_msgSend(v10, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSuggesterDebugViewController initWithName:options:](v5, "initWithName:options:", v6, v7);

  -[PXSuggestersDebugViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;

  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("\n"));

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 44.0;
  else
    v7 = 66.0;

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_items, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SuggestersDebugTableViewCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SuggestersDebugTableViewCellIdentifier"));
    objc_msgSend(v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 2);

    objc_msgSend(v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSuggestersDebugViewController configureCell:withItem:](self, "configureCell:withItem:", v7, v10);

  return v7;
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "textLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setText:", v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v9);

  objc_msgSend(v6, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v12);

  objc_msgSend(v10, "sizeToFit");
}

- (void)_fetchSuggesters
{
  void *v3;
  NSDictionary *options;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PXSuggestersDebugCollectionItem *v18;
  PXSuggestersDebugCollectionItem *v19;
  NSArray *items;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD17D0];
  options = self->_options;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableSuggestionTypeInfosWithOptions:photoLibrary:", options, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        v18 = [PXSuggestersDebugCollectionItem alloc];
        v19 = -[PXSuggestersDebugCollectionItem initWithSuggesterInfo:](v18, "initWithSuggesterInfo:", v17, (_QWORD)v21);
        -[NSArray addObject:](v11, "addObject:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  items = self->_items;
  self->_items = v11;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
