@implementation CTUIListLoadingGroup

- (CTUIListLoadingGroup)initWithHostController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  CTUIListLoadingGroup *v8;
  CTUIListLoadingGroup *v9;
  uint64_t v10;
  PSSpecifier *spinnerSpecifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CTUIListLoadingGroup;
  v8 = -[CTUIListLoadingGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", &stru_24D5028C8, 0, 0, 0, 0, 15, 0);
    spinnerSpecifier = v9->_spinnerSpecifier;
    v9->_spinnerSpecifier = (PSSpecifier *)v10;

  }
  return v9;
}

- (void)setSpecifiers:(id)a3
{
  unint64_t v5;
  PSListController **p_hostController;
  id WeakRetained;
  NSArray *specifiers;
  id v9;
  void *v10;
  id v11;
  id v12;
  PSSpecifier *spinnerSpecifier;
  id v14;
  id v15;

  v5 = (unint64_t)a3;
  if (v5 | (unint64_t)self->_specifiers)
  {
    v15 = (id)v5;
    p_hostController = &self->_hostController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    objc_msgSend(WeakRetained, "beginUpdates");

    specifiers = self->_specifiers;
    v9 = objc_loadWeakRetained((id *)&self->_hostController);
    v10 = v9;
    if (specifiers)
      objc_msgSend(v9, "removeContiguousSpecifiers:animated:", self->_specifiers, 1);
    else
      objc_msgSend(v9, "removeSpecifier:animated:", self->_spinnerSpecifier, 1);

    objc_storeStrong((id *)&self->_specifiers, a3);
    v11 = objc_loadWeakRetained((id *)&self->_hostController);
    if (v15)
    {
      v12 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      objc_msgSend(v11, "insertContiguousSpecifiers:afterSpecifier:animated:", v15, v12, 1);
    }
    else
    {
      spinnerSpecifier = self->_spinnerSpecifier;
      v12 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      objc_msgSend(v11, "insertSpecifier:afterSpecifier:animated:", spinnerSpecifier, v12, 1);
    }

    v14 = objc_loadWeakRetained((id *)p_hostController);
    objc_msgSend(v14, "endUpdates");

    v5 = (unint64_t)v15;
  }

}

- (NSArray)specifiers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_specifiers)
    objc_msgSend(v3, "addObjectsFromArray:");
  else
    objc_msgSend(v3, "addObject:", self->_spinnerSpecifier);
  return (NSArray *)v4;
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
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
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
