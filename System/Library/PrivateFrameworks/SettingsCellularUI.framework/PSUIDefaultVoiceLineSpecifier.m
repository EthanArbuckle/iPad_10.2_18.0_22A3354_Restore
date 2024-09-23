@implementation PSUIDefaultVoiceLineSpecifier

- (id)initSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  PSUIDefaultVoiceLineSpecifier *v6;

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PSUIDefaultVoiceLineSpecifier initWithPlanManagerCache:planManager:simStatusCache:](self, "initWithPlanManagerCache:planManager:simStatusCache:", v3, v4, v5);

  return v6;
}

- (PSUIDefaultVoiceLineSpecifier)initWithPlanManagerCache:(id)a3 planManager:(id)a4 simStatusCache:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PSUIDefaultVoiceLineSpecifier *v14;
  id v16;
  objc_super v17;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DEFAULT_VOICE_LINE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v17.receiver = self;
  v17.super_class = (Class)PSUIDefaultVoiceLineSpecifier;
  v14 = -[PSUIDefaultVoiceLineSpecifier initWithName:target:set:get:detail:cell:edit:](&v17, sel_initWithName_target_set_get_detail_cell_edit_, v12, self, sel_setDefaultVoiceLine_specifier_, sel_defaultVoiceLine_, v13, 2, 0);

  if (v14)
  {
    -[PSUIDefaultVoiceLineSpecifier setIdentifier:](v14, "setIdentifier:", CFSTR("VOICE_LINE_SETTINGS"));
    objc_storeStrong((id *)&v14->_planManagerCache, a3);
    objc_storeStrong((id *)&v14->_planManager, a4);
    objc_storeStrong((id *)&v14->_simStatusCache, a5);
    -[PSUIDefaultVoiceLineSpecifier updateCachedState](v14, "updateCachedState");
  }

  return v14;
}

- (void)updateCachedState
{
  NSArray *v3;
  NSArray *cachedPlanItems;
  NSArray *v5;
  NSArray *cachedSubscriptionContexts;
  void *v7;
  void *v8;
  NSArray *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PSUIDefaultVoiceLineSpecifier *v21;
  id v22;

  -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedPlanItems = self->_cachedPlanItems;
  self->_cachedPlanItems = v3;

  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedSubscriptionContexts = self->_cachedSubscriptionContexts;
  self->_cachedSubscriptionContexts = v5;

  v22 = (id)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v21 = self;
  v9 = self->_cachedPlanItems;
  if (-[NSArray count](v9, "count"))
  {
    v10 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isSelected"))
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v11, "userLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v15);

        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v11, "userLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "label");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v19);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v20);

      }
      ++v10;
    }
    while (-[NSArray count](v9, "count") > v10);
  }
  -[PSUIDefaultVoiceLineSpecifier setValues:titles:shortTitles:](v21, "setValues:titles:shortTitles:", v8, v22, v7);

}

- (BOOL)isSubcontrollerNeeded
{
  return -[NSArray count](self->_cachedPlanItems, "count") != 0;
}

- (id)defaultVoiceLine:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  if (-[NSArray count](self->_cachedPlanItems, "count", a3))
  {
    v4 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularPlanManagerCache subscriptionContextForPlanItem:cachedSubscriptionContexts:](self->_planManagerCache, "subscriptionContextForPlanItem:cachedSubscriptionContexts:", v5, self->_cachedSubscriptionContexts);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userDefaultVoice");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "userDefaultVoice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if (v10)
          break;
      }

      if (-[NSArray count](self->_cachedPlanItems, "count") <= ++v4)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v11 = 0;
  }
  return v11;
}

- (void)setDefaultVoiceLine:(id)a3 specifier:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  dispatch_semaphore_t v11;
  CTCellularPlanManager *planManager;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  dispatch_semaphore_t v16;

  -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", objc_msgSend(a3, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularPlanManagerCache subscriptionContextForPlanItem:cachedSubscriptionContexts:](self->_planManagerCache, "subscriptionContextForPlanItem:cachedSubscriptionContexts:", v5, self->_cachedSubscriptionContexts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userDefaultVoice");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        objc_msgSend(v6, "userDefaultVoice"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "BOOLValue"),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v11 = dispatch_semaphore_create(0);
    planManager = self->_planManager;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__PSUIDefaultVoiceLineSpecifier_setDefaultVoiceLine_specifier___block_invoke;
    v14[3] = &unk_24D501760;
    v14[4] = self;
    v15 = v5;
    v16 = v11;
    v13 = v11;
    -[CTCellularPlanManager didSelectPlanForDefaultVoice:completion:](planManager, "didSelectPlanForDefaultVoice:completion:", v15, v14);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  }
}

void __63__PSUIDefaultVoiceLineSpecifier_setDefaultVoiceLine_specifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v13 = 138412290;
      v14 = v8;
      v9 = "set default to: %@";
      v10 = v6;
      v11 = 12;
LABEL_6:
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138412546;
    v14 = v12;
    v15 = 2112;
    v16 = v5;
    v9 = "failed to set default to: %@, error: %@";
    v10 = v6;
    v11 = 22;
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)planItemForListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSArray *cachedPlanItems;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "cellType") != 3)
    goto LABEL_3;
  objc_msgSend(v4, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    cachedPlanItems = self->_cachedPlanItems;
    objc_msgSend(v4, "values");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](cachedPlanItems, "objectAtIndexedSubscript:", objc_msgSend(v12, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    v9 = 0;
  }

  return v9;
}

- (id)subscriptionContextForListItem:(id)a3
{
  void *v4;
  void *v5;

  -[PSUIDefaultVoiceLineSpecifier planItemForListItem:](self, "planItemForListItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularPlanManagerCache subscriptionContextForPlanItem:cachedSubscriptionContexts:](self->_planManagerCache, "subscriptionContextForPlanItem:cachedSubscriptionContexts:", v4, self->_cachedSubscriptionContexts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("DefaultVoiceLine"));
}

- (NSArray)cachedPlanItems
{
  return self->_cachedPlanItems;
}

- (void)setCachedPlanItems:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPlanItems, a3);
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
}

- (CTCellularPlanManager)planManager
{
  return self->_planManager;
}

- (void)setPlanManager:(id)a3
{
  objc_storeStrong((id *)&self->_planManager, a3);
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusCache, a3);
}

- (NSArray)cachedSubscriptionContexts
{
  return self->_cachedSubscriptionContexts;
}

- (void)setCachedSubscriptionContexts:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSubscriptionContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubscriptionContexts, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_planManager, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cachedPlanItems, 0);
}

@end
