@implementation PSAppDataUsagePolicyListController

- (PSAppDataUsagePolicyListController)init
{
  PSAppDataUsagePolicyListController *v2;
  PSAppDataUsagePolicyListController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSAppDataUsagePolicyListController;
  v2 = -[PSAppDataUsagePolicyListController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PSAppDataUsagePolicyListController _adjustTitle](v2, "_adjustTitle");
  return v3;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)PSAppDataUsagePolicyListController;
    v5 = -[PSListItemsController specifiers](&v16, sel_specifiers);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v3), "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 && !*(_QWORD *)(v6 + (int)*MEMORY[0x24BE75738]))
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SFLocalizableWAPIStringKeyForKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24D96EF60, CFSTR("WirelessData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v12, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SFLocalizableWAPIStringKeyForKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24D96EF60, CFSTR("WirelessData"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v7, "setName:", v13);
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  v14 = (void *)objc_msgSend(v4, "mutableCopy");
  +[SettingsCellularSharedUtils logSpecifiers:origin:](SettingsCellularSharedUtils, "logSpecifiers:origin:", v14, CFSTR("[PSAppDataUsagePolicyListController specifiers] end"));

  return *(id *)((char *)&self->super.super.super.super.super.super.isa + v3);
}

- (void)setSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSAppDataUsagePolicyListController;
  -[PSAppDataUsagePolicyListController setSpecifier:](&v4, sel_setSpecifier_, a3);
  -[PSAppDataUsagePolicyListController _adjustTitle](self, "_adjustTitle");
}

- (void)_adjustTitle
{
  void *v3;
  id v4;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]);
  if (v3)
  {
    objc_msgSend(v3, "displayName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      -[PSAppDataUsagePolicyListController setTitle:](self, "setTitle:", v4);

  }
}

@end
