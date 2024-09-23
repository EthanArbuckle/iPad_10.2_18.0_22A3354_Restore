@implementation PSUICellularPlanLabelSpecifier

- (PSUICellularPlanLabelSpecifier)initWithPlanUniversalReference:(id)a3 planManagerCache:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PSUICellularPlanLabelSpecifier *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)PSUICellularPlanLabelSpecifier;
  v12 = -[PSUICellularPlanLabelSpecifier initWithName:target:set:get:detail:cell:edit:](&v14, sel_initWithName_target_set_get_detail_cell_edit_, v10, self, 0, sel_cellularPlanLabel_, v11, 2, 0);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_planReference, a3);
    objc_storeStrong((id *)&v12->_planManagerCache, a4);
    -[PSUICellularPlanLabelSpecifier setProperty:forKey:](v12, "setProperty:forKey:", v12->_planReference, *MEMORY[0x24BE75958]);
    -[PSUICellularPlanLabelSpecifier updateValuesAndTitles](v12, "updateValuesAndTitles");
  }

  return v12;
}

- (void)updateValuesAndTitles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache planFromReference:](self->_planManagerCache, "planFromReference:", self->_planReference);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEB8];
  -[PSUICellularPlanManagerCache predefinedLabels](self->_planManagerCache, "predefinedLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userLabel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v3, "userLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "containsObject:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v3, "userLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

    }
  }
  v12 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "label", (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  -[PSUICellularPlanLabelSpecifier getLogger](self, "getLogger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v13;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_2161C6000, v19, OS_LOG_TYPE_DEFAULT, "updating values and titles: %@ %@", buf, 0x16u);
  }

  -[PSUICellularPlanLabelSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v13, v12, v12);
  if (objc_msgSend(v3, "transferredStatus") == 4)
    v20 = MEMORY[0x24BDBD1C0];
  else
    v20 = MEMORY[0x24BDBD1C8];
  -[PSUICellularPlanLabelSpecifier setProperty:forKey:](self, "setProperty:forKey:", v20, *MEMORY[0x24BE75A18], (_QWORD)v21);

}

- (id)cellularPlanLabel:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanLabelSpecifier updateValuesAndTitles](self, "updateValuesAndTitles", a3);
  -[PSUICellularPlanManagerCache planFromReference:](self->_planManagerCache, "planFromReference:", self->_planReference);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularPlanLabelSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "userLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "displaying user label %@ for plan item %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(v4, "userLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularPlanLabel"));
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
  objc_storeStrong((id *)&self->_planReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planReference, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
}

@end
