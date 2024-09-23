@implementation SCLHistoryDayDataSource

- (SCLHistoryDayDataSource)initWithListController:(id)a3 viewModel:(id)a4 historyGroup:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  SCLHistoryDayDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SCLHistoryDayDataSource;
  v12 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v28, sel_initWithListController_viewModel_, a3, a4);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("HISTORY_CELL_GROUP"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HISTORY_CELL-0x%p"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, 0, 0, 0, 0, -1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    v18 = *MEMORY[0x24BE75948];
    objc_msgSend(v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75948]);
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "items");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE75DA0];
    objc_msgSend(v16, "setProperty:forKey:", v21, *MEMORY[0x24BE75DA0]);

    -[SCLHistoryDayDataSource setCountSpecifier:](v12, "setCountSpecifier:", v16);
    v23 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HISTORY_ITEM_CELL-0x%p"), v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, 0, 0, 0, 0, -1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setProperty:forKey:", objc_opt_class(), v18);
    objc_msgSend(v25, "setProperty:forKey:", v10, v22);
    -[SCLHistoryDayDataSource setItemSpecifier:](v12, "setItemSpecifier:", v25);
    v29[0] = v13;
    v29[1] = v16;
    v29[2] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSpecifierDataSource setSpecifiers:](v12, "setSpecifiers:", v26);

  }
  return v12;
}

- (PSSpecifier)countSpecifier
{
  return self->_countSpecifier;
}

- (void)setCountSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_countSpecifier, a3);
}

- (PSSpecifier)itemSpecifier
{
  return self->_itemSpecifier;
}

- (void)setItemSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSpecifier, 0);
  objc_storeStrong((id *)&self->_countSpecifier, 0);
}

@end
