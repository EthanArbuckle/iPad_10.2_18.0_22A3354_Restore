@implementation PSPowerlogListController

- (id)specifiers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PSPowerlogListController;
  -[PSListItemsController specifiers](&v13, sel_specifiers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "cellType"))
        {
          objc_msgSend(v7, "setCellType:", 2);
          objc_msgSend(v7, "setDetailControllerClass:", objc_opt_class());
          objc_msgSend(v7, "setEditPaneClass:", objc_opt_class());
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v4);
  }
  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PSPowerlogListController specifierAtIndex:](self, "specifierAtIndex:", -[PSPowerlogListController indexForIndexPath:](self, "indexForIndexPath:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSPowerlogListController selectSpecifier:](self, "selectSpecifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);
  objc_msgSend(v10, "loadPane");
  objc_msgSend(v10, "pane");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[PSPowerlogListController tableView:didSelectRowAtIndexPath:].cold.1();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "propertyForKey:", CFSTR("powerlogReader"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValueOfTable:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  -[PSPowerlogListController showController:animate:](self, "showController:animate:", v10, 1);
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  __assert_rtn("-[PSPowerlogListController tableView:didSelectRowAtIndexPath:]", "PUIProblemReportingController.m", 333, "[pane isKindOfClass:[PSTextViewPane class]]");
}

@end
