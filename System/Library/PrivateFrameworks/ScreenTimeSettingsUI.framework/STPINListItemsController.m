@implementation STPINListItemsController

- (void)loadView
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STPINListItemsController;
  -[STPINListItemsController loadView](&v7, sel_loadView);
  v3 = (int)*MEMORY[0x24BE757A8];
  v4 = *MEMORY[0x24BE759C0];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "objectForKeyedSubscript:", *MEMORY[0x24BE759C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPINListItemsController setTitle:](self, "setTitle:", v6);

  }
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ (int)*MEMORY[0x24BE757A8]), "objectForKeyedSubscript:", 0x24DB91230);
}

- (void)prepareSpecifiersMetadata
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STPINListItemsController;
  -[PSListItemsController prepareSpecifiersMetadata](&v3, sel_prepareSpecifiersMetadata);
  -[STPINListItemsController updateFooter](self, "updateFooter");
}

- (void)listItemSelected:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STPINListItemsController;
  -[PSListItemsController listItemSelected:](&v4, sel_listItemSelected_, a3);
  -[STPINListItemsController updateFooter](self, "updateFooter");
}

- (void)updateFooter
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("STValueToGroupFootersKey"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[STPINListItemsController specifierAtIndex:](self, "specifierAtIndex:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75708]));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(v4, "values");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[STPINListItemsController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75A68]);
      -[STPINListItemsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v10, 1);

    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  STPINListItemsController *v12;

  v6 = a3;
  v7 = a4;
  if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62__STPINListItemsController_tableView_didSelectRowAtIndexPath___block_invoke;
    v9[3] = &unk_24DB867C8;
    v10 = v6;
    v11 = v7;
    v12 = self;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v9);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STPINListItemsController;
    -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

id __62__STPINListItemsController_tableView_didSelectRowAtIndexPath___block_invoke(id result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  objc_super v4;

  if (a2)
  {
    v2 = *((_QWORD *)result + 5);
    v3 = *((_QWORD *)result + 4);
    v4.receiver = (id)*((_QWORD *)result + 6);
    v4.super_class = (Class)STPINListItemsController;
    return objc_msgSendSuper2(&v4, sel_tableView_didSelectRowAtIndexPath_, v3, v2);
  }
  return result;
}

- (void)didCancelEnteringPIN
{
  -[PSListController st_didCancelEnteringPIN](self, "st_didCancelEnteringPIN");
  -[STPINListItemsController reloadSpecifiers](self, "reloadSpecifiers");
}

@end
