@implementation TPSCallForwardingListController

- (TPSCallForwardingController)callForwardingController
{
  TPSCallForwardingController *callForwardingController;
  TPSCallForwardingController *v4;
  void *v5;
  TPSCallForwardingController *v6;
  TPSCallForwardingController *v7;

  callForwardingController = self->_callForwardingController;
  if (!callForwardingController)
  {
    v4 = [TPSCallForwardingController alloc];
    -[TPSListController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TPSCallForwardingController initWithSubscriptionContext:](v4, "initWithSubscriptionContext:", v5);
    v7 = self->_callForwardingController;
    self->_callForwardingController = v6;

    -[TPSCallForwardingController setDelegate:](self->_callForwardingController, "setDelegate:", self);
    callForwardingController = self->_callForwardingController;
  }
  return callForwardingController;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[TPSListController subscriptionContext](self, "subscriptionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_14:

      v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCallForwardingListController mainSwitchSpecifier](self, "mainSwitchSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = objc_msgSend(v6, "serviceType");
    if (v9 != 1)
    {
      v10 = v9;
      if ((objc_msgSend(v6, "isLoading") & 1) == 0 && (objc_msgSend(v6, "isUnloading") & 1) == 0)
      {
        if (objc_msgSend(v6, "isConditionalServiceAvailable"))
        {
          -[TPSCallForwardingListController conditionalServiceSwitchSpecifier](self, "conditionalServiceSwitchSpecifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v11);

        }
        if (v10 == 2)
        {
          -[TPSCallForwardingListController unconditionalServiceTypeSpecifiers](self, "unconditionalServiceTypeSpecifiers");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        if (v10 == 3)
        {
          -[TPSCallForwardingListController conditionalServiceTypeSpecifiers](self, "conditionalServiceTypeSpecifiers");
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v13 = (void *)v12;
          objc_msgSend(v7, "addObjectsFromArray:", v12);

        }
      }
    }
    v14 = (objc_class *)objc_msgSend(v7, "copy");
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v14;

    goto LABEL_14;
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingListController;
  -[TPSCallForwardingListController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingListController configureCell:](self, "configureCell:", v5);
  return v5;
}

- (PSSpecifier)mainSwitchSpecifier
{
  PSSpecifier *mainSwitchSpecifier;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *v7;

  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("MAIN_SWITCH_SPECIFIER_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setMainSwitchOn_specifier_, sel_mainSwitchOn_, 0, 6, 0);
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v6;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }
  return mainSwitchSpecifier;
}

- (PSSpecifier)conditionalServiceSwitchSpecifier
{
  PSSpecifier *conditionalServiceSwitchSpecifier;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *v7;

  conditionalServiceSwitchSpecifier = self->_conditionalServiceSwitchSpecifier;
  if (!conditionalServiceSwitchSpecifier)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("CONDITIONAL_SWITCH_SPECIFIER_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setConditionalServiceSwitchOn_specifier_, sel_conditionalServiceSwitchOn_, 0, 6, 0);
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_conditionalServiceSwitchSpecifier;
    self->_conditionalServiceSwitchSpecifier = v6;

    conditionalServiceSwitchSpecifier = self->_conditionalServiceSwitchSpecifier;
  }
  return conditionalServiceSwitchSpecifier;
}

- (id)conditionalServiceTypeSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);
  v6 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(v4, "localizedConditionalBusyTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, sel_setConditionalServiceBusyPhoneNumber_specifier_, sel_conditionalServiceBusyPhoneNumber_, v8, 2, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v9);
  v10 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(v4, "localizedConditionalUnansweredTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setConditionalServiceUnansweredPhoneNumber_specifier_, sel_conditionalServiceUnansweredPhoneNumber_, v12, 2, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v13);
  v14 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(v4, "localizedConditionalUnreachableTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, sel_setConditionalServiceUnreachablePhoneNumber_specifier_, sel_conditionalServiceUnreachablePhoneNumber_, v16, 2, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v17);
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

- (id)unconditionalServiceTypeSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)MEMORY[0x1E0D804E8];
  +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", CFSTR("UNCONDITIONAL_SERVICE_FORWARD_TO_SPECIFIER_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel_setUnconditionalServicePhoneNumber_specifier_, sel_unconditionalServicePhoneNumber_, v7, 2, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v8);
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)mainSwitchOn:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "serviceType") != 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = *MEMORY[0x1E0D807D0];
  v7 = a4;
  objc_msgSend(v7, "propertyForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v14, "BOOLValue"), 1);
  -[TPSCallForwardingListController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setLoading:", 1);
  v10 = objc_msgSend(v14, "BOOLValue");
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v11, "updateServiceType:", v13);

}

- (id)conditionalServiceBusyPhoneNumber:(id)a3
{
  void *v3;
  void *v4;

  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conditionalServiceBusyPhoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConditionalServiceBusyPhoneNumber:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConditionalServiceBusyPhoneNumber:", v6);

  -[TPSCallForwardingListController reloadSpecifier:](self, "reloadSpecifier:", v8);
}

- (id)conditionalServiceUnansweredPhoneNumber:(id)a3
{
  void *v3;
  void *v4;

  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conditionalServiceUnansweredPhoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConditionalServiceUnansweredPhoneNumber:", v6);

  -[TPSCallForwardingListController reloadSpecifier:](self, "reloadSpecifier:", v8);
}

- (id)conditionalServiceUnreachablePhoneNumber:(id)a3
{
  void *v3;
  void *v4;

  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conditionalServiceUnreachablePhoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConditionalServiceUnreachablePhoneNumber:", v6);

  -[TPSCallForwardingListController reloadSpecifier:](self, "reloadSpecifier:", v8);
}

- (id)conditionalServiceSwitchOn:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "serviceType") == 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setConditionalServiceSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = *MEMORY[0x1E0D807D0];
  v7 = a4;
  objc_msgSend(v7, "propertyForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v14, "BOOLValue"), 1);
  -[TPSCallForwardingListController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v9, "setLoading:", 1);
  v10 = objc_msgSend(v14, "BOOLValue");
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = 3;
  else
    v13 = 2;
  objc_msgSend(v11, "updateServiceType:", v13);

}

- (id)unconditionalServicePhoneNumber:(id)a3
{
  void *v3;
  void *v4;

  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unconditionalServicePhoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setUnconditionalServicePhoneNumber:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnconditionalServicePhoneNumber:", v6);

  -[TPSCallForwardingListController reloadSpecifier:](self, "reloadSpecifier:", v8);
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
    objc_msgSend(v4, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCallForwardingListController configureCell:forSpecifier:](self, "configureCell:forSpecifier:", v4, v5);

  }
}

- (void)configureCell:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[TPSCallForwardingListController callForwardingController](self, "callForwardingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCallForwardingListController mainSwitchSpecifier](self, "mainSwitchSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v10 = v13;
    if ((objc_msgSend(v7, "isLoading") & 1) != 0)
      v11 = 1;
    else
      v11 = objc_msgSend(v7, "isUnloading");
    objc_msgSend(v10, "setLoading:", v11);
    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x1E0D807D0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v7, "serviceType") != 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_conditionalServiceSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_callForwardingController, 0);
}

@end
