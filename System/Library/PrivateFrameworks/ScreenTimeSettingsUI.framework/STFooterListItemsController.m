@implementation STFooterListItemsController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  objc_class *v20;
  void *v21;
  objc_super v23;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (int)*MEMORY[0x24BE757A8];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "objectForKeyedSubscript:", CFSTR("STFooterListItemsSwitchRestrictionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "objectForKeyedSubscript:", CFSTR("STFooterListItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23.receiver = self;
    v23.super_class = (Class)STFooterListItemsController;
    v8 = -[PSListItemsController specifiers](&v23, sel_specifiers);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "objectForKeyedSubscript:", CFSTR("STDisabledRadioGroupIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "objectForKeyedSubscript:", CFSTR("STDisabledRadioGroupIDKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STFooterListItemsController specifierForID:](self, "specifierForID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    }
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5);
    v13 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    v14 = v12;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("STTitleSectionFooterTextKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v13, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "titleDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        v18 = v16 == 0;
      else
        v18 = 1;
      if (!v18)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A68]);

    }
    if (v7)
      v19 = v6 == 0;
    else
      v19 = 0;
    if (v19)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3), "arrayByAddingObjectsFromArray:", v7);
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v21 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v20;

    }
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[STFooterListItemsController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STFooterListItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STFooterListItemsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)STFooterListItemsController;
    -[STPINListItemsController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

@end
