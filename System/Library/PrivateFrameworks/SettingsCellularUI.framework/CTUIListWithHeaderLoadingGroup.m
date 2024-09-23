@implementation CTUIListWithHeaderLoadingGroup

- (CTUIListWithHeaderLoadingGroup)initWithHostController:(id)a3
{
  id v4;
  CTUIListWithHeaderLoadingGroup *v5;
  CTUIListWithHeaderLoadingGroup *v6;
  uint64_t v7;
  PSSpecifier *spinnerSpecifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTUIListWithHeaderLoadingGroup;
  v5 = -[CTUIListWithHeaderLoadingGroup init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hostController, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", &stru_24D5028C8, 0, 0, 0, 0, 15, 0);
    spinnerSpecifier = v6->_spinnerSpecifier;
    v6->_spinnerSpecifier = (PSSpecifier *)v7;

  }
  return v6;
}

- (void)setContentSpecifiers:(id)a3
{
  PSListController **p_hostController;
  id WeakRetained;
  NSArray **p_contentSpecifiers;
  NSArray *contentSpecifiers;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (v13)
  {
    p_hostController = &self->_hostController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    objc_msgSend(WeakRetained, "beginUpdates");

    p_contentSpecifiers = &self->_contentSpecifiers;
    contentSpecifiers = self->_contentSpecifiers;
    v9 = objc_loadWeakRetained((id *)&self->_hostController);
    v10 = v9;
    if (contentSpecifiers)
    {
      objc_msgSend(v9, "updateSpecifiers:withSpecifiers:", *p_contentSpecifiers, v13);
    }
    else
    {
      objc_msgSend(v9, "removeSpecifier:animated:", self->_spinnerSpecifier, 1);

      v10 = objc_loadWeakRetained((id *)&self->_hostController);
      -[NSArray lastObject](self->_headerSpecifiers, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertContiguousSpecifiers:afterSpecifier:animated:", v13, v12, 1);

    }
    objc_storeStrong((id *)p_contentSpecifiers, a3);
    v11 = objc_loadWeakRetained((id *)p_hostController);
    objc_msgSend(v11, "endUpdates");
  }
  else
  {
    v11 = self->_contentSpecifiers;
    self->_contentSpecifiers = 0;
  }

}

- (id)specifiers
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_headerSpecifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_contentSpecifiers)
    objc_msgSend(v3, "addObjectsFromArray:");
  else
    objc_msgSend(v3, "addObject:", self->_spinnerSpecifier);
  return v4;
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (NSArray)headerSpecifiers
{
  return self->_headerSpecifiers;
}

- (void)setHeaderSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_headerSpecifiers, a3);
}

- (NSArray)contentSpecifiers
{
  return self->_contentSpecifiers;
}

- (PSSpecifier)spinnerSpecifier
{
  return self->_spinnerSpecifier;
}

- (void)setSpinnerSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_contentSpecifiers, 0);
  objc_storeStrong((id *)&self->_headerSpecifiers, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end
