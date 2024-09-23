@implementation PSUIDataUsageCategoryListController

- (PSUIDataUsageCategoryListController)init
{
  PSUIDataUsageCategoryListController *v2;
  uint64_t v3;
  PSSpecifier *spinnerSpecifier;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSUIDataUsageCategoryListController;
  v2 = -[PSUIDataUsageCategoryListController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", &stru_24D5028C8, 0, 0, 0, 0, 15, 0);
    spinnerSpecifier = v2->_spinnerSpecifier;
    v2->_spinnerSpecifier = (PSSpecifier *)v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_reloadSpecifiers, *MEMORY[0x24BE856C0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_reloadSpecifiers, *MEMORY[0x24BE856D8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_reloadSpecifiers, *MEMORY[0x24BE856D0], 0);

  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (-[PSUIDataUsageCategoryListController shouldShowSpinner](self, "shouldShowSpinner"))
    {
      v14[0] = self->_spinnerSpecifier;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[PSUIDataUsageCategoryListController parentSpecifier](self, "parentSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subcategorySpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      +[CTUIDataUsageSorting userSelectedComparator](CTUIDataUsageSorting, "userSelectedComparator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sortUsingComparator:", v11);

      objc_msgSend(v7, "addObjectsFromArray:", v10);
      objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v7, CFSTR("[PSUIDataUsageCategoryListController specifiers] end"));
      v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v7;

    }
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)shouldShowSpinner
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  -[PSUIDataUsageCategoryListController parentSpecifier](self, "parentSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") != 2)
  {

    goto LABEL_5;
  }
  -[PSUIDataUsageCategoryListController parentSpecifier](self, "parentSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subcategorySpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
LABEL_5:
    -[PSUIDataUsageCategoryListController parentSpecifier](self, "parentSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "dataUsage") == 0;

    return v7;
  }
  return 0;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (PSUIDataUsageCategorySpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentSpecifier, a3);
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
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end
