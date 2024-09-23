@implementation PSUIDefaultVoiceLineListItemsController

- (PSUIDefaultVoiceLineListItemsController)init
{
  PSUIDefaultVoiceLineListItemsController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSUIDefaultVoiceLineListItemsController;
  v2 = -[PSUIDefaultVoiceLineListItemsController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_reloadCache, CFSTR("PSUICellularPlanChanged"), 0);

  }
  return v2;
}

- (void)reloadCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__PSUIDefaultVoiceLineListItemsController_reloadCache__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __54__PSUIDefaultVoiceLineListItemsController_reloadCache__block_invoke(uint64_t a1)
{
  int v2;
  char *v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;

  v7 = *(id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE757A8]);
  objc_msgSend(v7, "updateCachedState");
  v2 = objc_msgSend(v7, "isSubcontrollerNeeded");
  v3 = *(char **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "reloadSpecifiers");
    v4 = v7;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&v3[*MEMORY[0x24BE757A0]]);

    v6 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);
    v4 = WeakRetained;
  }

}

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)PSUIDefaultVoiceLineListItemsController;
  -[PSListItemsController specifiers](&v22, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = *MEMORY[0x24BE75948];
    v8 = *MEMORY[0x24BE75950];
    v17 = *MEMORY[0x24BE75CE8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "cellType"))
        {
          objc_msgSend(v10, "setProperty:forKey:", objc_opt_class(), v7);
          v11 = (int)*MEMORY[0x24BE757A8];
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v11), "planItemForListItem:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v10, "setProperty:forKey:", v12, v8);
            objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v11), "subscriptionContextForListItem:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v10, "setProperty:forKey:", v13, v17);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  v14 = (void *)MEMORY[0x24BE856B8];
  v15 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v14, "logSpecifiers:origin:", v15, CFSTR("[PSUIDefaultVoiceLineListItemsController specifiers] end"));

  return v3;
}

@end
