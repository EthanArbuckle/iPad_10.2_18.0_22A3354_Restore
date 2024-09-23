@implementation PSUISIMSubgroup

- (PSUISIMSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7;
  id v8;
  PSUISIMSubgroup *v9;
  PSUISIMSubgroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSUISIMSubgroup;
  v9 = -[PSUISIMSubgroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    objc_storeWeak((id *)&v10->_parentSpecifier, v8);
  }

  return v10;
}

- (PSUISIMSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer called"), CFSTR("Unsupported initializer called"), 0));
}

- (id)specifiers
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *bundleControllers;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (NSMutableArray *)objc_opt_new();
  bundleControllers = self->_bundleControllers;
  self->_bundleControllers = v4;

  v32 = *MEMORY[0x24BE758F8];
  v33[0] = CFSTR("SIMSettings");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("items");
  v22 = (void *)v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v9 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v9, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)&self->_listController);
  v27 = 0;
  SpecifiersFromPlist();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v27;
  -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v13, &v27);
  objc_msgSend(v3, "addObjectsFromArray:", v12);
  v14 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    v19 = (int *)MEMORY[0x24BE75738];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        if (!*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20) + *v19))
          objc_msgSend(v14, "addObject:");
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
    objc_msgSend(v15, "removeObjectsInArray:", v14);

  return v15;
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (PSSpecifier)parentSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_parentSpecifier);
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_parentSpecifier, a3);
}

- (NSMutableArray)bundleControllers
{
  return self->_bundleControllers;
}

- (void)setBundleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end
