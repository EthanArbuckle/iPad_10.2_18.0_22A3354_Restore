@implementation PSUICellularPlanLabelListController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSUICellularPlanLabelListController;
  -[PSUICellularPlanLabelListController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  int v5;
  id v6;

  -[PSUICellularPlanLabelListController textField](self, "textField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5)
  {
    -[PSUICellularPlanLabelListController textField](self, "textField");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  PSUICellularPlanUniversalReference *v7;
  PSUICellularPlanUniversalReference *planReference;
  NSObject *v9;
  PSUICellularPlanUniversalReference *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *predefinedLabels;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSUICellularPlanLabelListController getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[PSUICellularPlanLabelListController specifiers]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", buf, 0xCu);
    }

    v6 = (void *)objc_opt_new();
    if (!self->_planReference)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", *MEMORY[0x24BE75958]);
      v7 = (PSUICellularPlanUniversalReference *)objc_claimAutoreleasedReturnValue();
      planReference = self->_planReference;
      self->_planReference = v7;

      -[PSUICellularPlanLabelListController getLogger](self, "getLogger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_planReference;
        *(_DWORD *)buf = 138412290;
        v46 = (const char *)v10;
        _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "initializing label picker with plan reference: %@", buf, 0xCu);
      }

    }
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "planFromReference:", self->_planReference);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subscriptionContextForPlanItem:cachedSubscriptionContexts:", v12, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v12, "phoneNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16)
      {
        +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "phoneNumber");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedPhoneNumber:context:", v18, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          -[PSUICellularPlanLabelListController setTitle:](self, "setTitle:", v19);

      }
    }
    v38 = (void *)v14;
    v39 = v12;
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predefinedLabels");
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    predefinedLabels = self->_predefinedLabels;
    self->_predefinedLabels = v21;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = self->_predefinedLabels;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v41;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v27), "label");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, 0, 0, 0, 0, 3, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v30);
          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v25);
    }

    v31 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CUSTOM_LABEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "groupSpecifierWithName:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v34);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 3, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v35);
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v6, CFSTR("[PSUICellularPlanLabelListController specifiers] end"));
    v36 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *validatedCustomLabelText;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "planFromReference:", self->_planReference);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "section"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1000, CFSTR("customLabel"));
    objc_msgSend(v9, "userLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexInPredefinedLabels:", self->_predefinedLabels);

    if (v12 == -1)
    {
      -[PSUICellularPlanLabelListController getLogger](self, "getLogger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "userLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v21;
        _os_log_impl(&dword_2161C6000, v20, OS_LOG_TYPE_DEFAULT, "user label is not a predefined label, selecting custom label: %@", buf, 0xCu);

      }
      objc_msgSend(v10, "setAccessoryType:", 3);
      objc_msgSend(v9, "userLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "label");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "editableTextField");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v23);

      objc_msgSend(v9, "userLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "label");
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      validatedCustomLabelText = self->_validatedCustomLabelText;
      self->_validatedCustomLabelText = v26;

    }
    else
    {
      v13 = self->_validatedCustomLabelText;
      if (v13)
      {
        objc_msgSend(v10, "editableTextField");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setText:", v13);

LABEL_14:
        objc_msgSend(v10, "editableTextField");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setReturnKeyType:", 9);

        objc_msgSend(v10, "editableTextField");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setClearButtonMode:", 1);

        objc_msgSend(v10, "editableTextField");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setDelegate:", self);

        objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "editableTextField");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setFont:", v33);

        objc_msgSend(v10, "setSelectionStyle:", 0);
        objc_msgSend(v10, "setTextFieldOffset:", 0.01);
        objc_msgSend(v10, "editableTextField");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&self->_textField, v35);

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("TYPE_LABEL_HERE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "editableTextField");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPlaceholder:", v28);

    }
    goto LABEL_14;
  }
  v37.receiver = self;
  v37.super_class = (Class)PSUICellularPlanLabelListController;
  -[PSUICellularPlanLabelListController tableView:cellForRowAtIndexPath:](&v37, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "indexInPredefinedLabels:", self->_predefinedLabels);
  v17 = objc_msgSend(v7, "row");

  if (v16 == v17)
  {
    -[PSUICellularPlanLabelListController getLogger](self, "getLogger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "userLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "user label found, selecting predefined label: %@", buf, 0xCu);

    }
    objc_msgSend(v10, "setAccessoryType:", 3);
  }
LABEL_15:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "planFromReference:", self->_planReference);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICellularPlanLabelListController getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "selected label at indexPath %@ for plan %@", (uint8_t *)&v16, 0x16u);
  }

  if (!objc_msgSend(v6, "section"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_predefinedLabels, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v14 = v13;
    goto LABEL_7;
  }
  if (self->_validatedCustomLabelText)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", self->_validatedCustomLabelText);
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11;
LABEL_7:
    objc_msgSend(v12, "setLabel:forPlan:", v14, v9);

  }
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  objc_msgSend(v7, "reloadData");

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), 1);

}

- (void)dismissKeyboard
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  objc_msgSend(WeakRetained, "resignFirstResponder");

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *validatedCustomLabelText;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  id obj;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(obj, "length"))
  {
    if ((unint64_t)objc_msgSend(obj, "length") < 0x1F)
    {
      v11 = obj;
    }
    else
    {
      v6 = objc_msgSend(obj, "length");
      if (v6 >= 0x1E)
        v7 = 30;
      else
        v7 = v6;
      v8 = objc_msgSend(obj, "rangeOfComposedCharacterSequencesForRange:", 0, v7);
      objc_msgSend(obj, "substringWithRange:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v10;
    }
    obj = v11;
    objc_storeStrong((id *)&self->_validatedCustomLabelText, v11);
    validatedCustomLabelText = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", self->_validatedCustomLabelText);
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "planFromReference:", self->_planReference);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLabel:forPlan:", validatedCustomLabelText, v15);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "reloadData");
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE75790]));
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), 1);

  }
  else
  {
    validatedCustomLabelText = self->_validatedCustomLabelText;
    self->_validatedCustomLabelText = 0;
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularPlanLabelListController"));
}

- (NSArray)predefinedLabels
{
  return self->_predefinedLabels;
}

- (void)setPredefinedLabels:(id)a3
{
  objc_storeStrong((id *)&self->_predefinedLabels, a3);
}

- (NSString)validatedCustomLabelText
{
  return self->_validatedCustomLabelText;
}

- (void)setValidatedCustomLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_validatedCustomLabelText, a3);
}

- (UITextField)textField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textField);
}

- (void)setTextField:(id)a3
{
  objc_storeWeak((id *)&self->_textField, a3);
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
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong((id *)&self->_validatedCustomLabelText, 0);
  objc_storeStrong((id *)&self->_predefinedLabels, 0);
}

@end
