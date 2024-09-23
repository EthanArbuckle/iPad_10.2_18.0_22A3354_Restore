@implementation CACCustomCommandApplicationViewController

- (CACCustomCommandApplicationViewController)init
{
  CACCustomCommandApplicationViewController *v2;
  void *v3;

  v2 = -[CACCustomCommandApplicationViewController initWithStyle:](self, "initWithStyle:", 1);
  if (v2)
  {
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.Application"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCustomCommandApplicationViewController setTitle:](v2, "setTitle:", v3);

  }
  return v2;
}

- (void)setApplicationIdentifiersToNames:(id)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  NSDictionary *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (NSDictionary *)a3;
  if (self->_applicationIdentifiersToNames != v5)
  {
    objc_storeStrong((id *)&self->_applicationIdentifiersToNames, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSDictionary count](v5, "count") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.speech.SystemWideScope"));
    -[NSDictionary allKeys](v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __78__CACCustomCommandApplicationViewController_setApplicationIdentifiersToNames___block_invoke;
    v24[3] = &unk_24F2AB2A0;
    v8 = v5;
    v25 = v8;
    objc_msgSend(v7, "sortedArrayUsingComparator:", v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObjectsFromArray:", v9);
    -[CACCustomCommandApplicationViewController setSortedIdentifiers:](self, "setSortedIdentifiers:", v6);
    v10 = (void *)MEMORY[0x24BDBCEB8];
    -[CACCustomCommandApplicationViewController sortedIdentifiers](self, "sortedIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CustomCommand.AnyApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v16);
    }

    -[CACCustomCommandApplicationViewController setSortedNames:](self, "setSortedNames:", v12);
  }

}

uint64_t __78__CACCustomCommandApplicationViewController_setApplicationIdentifiersToNames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACCustomCommandApplicationViewController;
  -[CACCustomCommandApplicationViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[CACCustomCommandApplicationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ApplicationCell"));

  -[CACCustomCommandApplicationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AnyCell"));

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (!a4)
    return 1;
  -[CACCustomCommandApplicationViewController sortedNames](self, "sortedNames", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
    v8 = CFSTR("ApplicationCell");
  else
    v8 = CFSTR("AnyCell");
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "section");
  v11 = objc_msgSend(v6, "row");
  if (v10)
    v12 = v11 + 1;
  else
    v12 = v11;
  -[CACCustomCommandApplicationViewController sortedNames](self, "sortedNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[CACCustomCommandApplicationViewController commandItem](self, "commandItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customScope");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandApplicationViewController sortedIdentifiers](self, "sortedIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", v19))
    v20 = 3;
  else
    v20 = 0;
  objc_msgSend(v9, "setAccessoryType:", v20);

  if (objc_msgSend(v6, "section"))
  {
    v21 = (void *)MEMORY[0x24BEBD640];
    -[CACCustomCommandApplicationViewController sortedIdentifiers](self, "sortedIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    objc_msgSend(v21, "_applicationIconImageForBundleIdentifier:format:scale:", v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setImage:", v25);

    objc_msgSend(v9, "imageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMasksToBounds:", 1);

    objc_msgSend(v9, "imageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", 5.0);

  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v5, "row");
  if (v6)
    v8 = v7 + 1;
  else
    v8 = v7;
  -[CACCustomCommandApplicationViewController sortedIdentifiers](self, "sortedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCustomCommandApplicationViewController commandItem](self, "commandItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCustomScope:", v10);

  -[CACCustomCommandApplicationViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForRowAtIndexPath:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CACCustomCommandApplicationViewController tableView](self, "tableView", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleCells");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
        if (v20 == v13)
          v21 = 3;
        else
          v21 = 0;
        objc_msgSend(v20, "setAccessoryType:", v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  -[CACCustomCommandApplicationViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deselectRowAtIndexPath:animated:", v5, 1);

  -[CACCustomCommandApplicationViewController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didUpdateCommandItemForApplicationViewController:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCustomCommandApplicationViewControllerDelegate)delegate
{
  return (CACCustomCommandApplicationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CACSpokenCommandItem)commandItem
{
  return self->_commandItem;
}

- (void)setCommandItem:(id)a3
{
  objc_storeStrong((id *)&self->_commandItem, a3);
}

- (NSDictionary)applicationIdentifiersToNames
{
  return self->_applicationIdentifiersToNames;
}

- (NSArray)sortedNames
{
  return self->_sortedNames;
}

- (void)setSortedNames:(id)a3
{
  objc_storeStrong((id *)&self->_sortedNames, a3);
}

- (NSArray)sortedIdentifiers
{
  return self->_sortedIdentifiers;
}

- (void)setSortedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sortedIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortedNames, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiersToNames, 0);
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
