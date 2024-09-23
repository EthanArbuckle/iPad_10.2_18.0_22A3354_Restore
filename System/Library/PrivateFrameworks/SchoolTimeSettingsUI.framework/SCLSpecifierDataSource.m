@implementation SCLSpecifierDataSource

- (SCLSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  SCLSpecifierDataSource *v8;
  SCLSpecifierDataSource *v9;
  NSArray *specifiers;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLSpecifierDataSource;
  v8 = -[SCLSpecifierDataSource init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    specifiers = v9->_specifiers;
    v9->_specifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_storeStrong((id *)&v9->_viewModel, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SCLSpecifierDataSource setChildDataSources:](self, "setChildDataSources:", MEMORY[0x24BDBD1A8]);
  v3.receiver = self;
  v3.super_class = (Class)SCLSpecifierDataSource;
  -[SCLSpecifierDataSource dealloc](&v3, sel_dealloc);
}

- (void)setChildDataSources:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *childDataSources;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_childDataSources;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9++), "removeObserver:forKeyPath:context:", self, CFSTR("allSpecifiers"), CFSTR("active"));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)objc_msgSend(v4, "copy");
  childDataSources = self->_childDataSources;
  self->_childDataSources = v10;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "addObserver:forKeyPath:options:context:", self, CFSTR("allSpecifiers"), 9, CFSTR("active"), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (NSArray)allSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[SCLSpecifierDataSource isActive](self, "isActive"))
  {
    -[SCLSpecifierDataSource specifiers](self, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SCLSpecifierDataSource childDataSources](self, "childDataSources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "isActive"))
          {
            objc_msgSend(v10, "allSpecifiers");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObjectsFromArray:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  return (NSArray *)v3;
}

+ (id)keyPathsForValuesAffectingAllSpecifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("childDataSources"), CFSTR("active"), CFSTR("specifiers"), 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;
  objc_super v9;

  if (a6 == CFSTR("active"))
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E78], a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
      -[SCLSpecifierDataSource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("allSpecifiers"));
    else
      -[SCLSpecifierDataSource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("allSpecifiers"));
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCLSpecifierDataSource;
    -[SCLSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 specifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCLSpecifierDataSource childDataSources](self, "childDataSources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v18, "isActive", (_QWORD)v19))
          objc_msgSend(v18, "tableView:didSelectRowAtIndexPath:specifier:", v8, v9, v10);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (SCLListViewController)listController
{
  return (SCLListViewController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)childDataSources
{
  return self->_childDataSources;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDataSources, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_listController);
}

@end
