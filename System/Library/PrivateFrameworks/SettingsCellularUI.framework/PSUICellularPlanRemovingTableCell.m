@implementation PSUICellularPlanRemovingTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  PSUICellularPlanRemovingTableCell *v20;
  __CFString *v21;
  const __CFString *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PSUICellularPlanRemovingTableCell;
  v4 = a3;
  -[PSUICellularPlanActivatingTableCell refreshCellContentsWithSpecifier:](&v23, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958], v23.receiver, v23.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUICoreTelephonySubscriberCache sharedInstance](PSUICoreTelephonySubscriberCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortLabel:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "label");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedPhoneNumber:context:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") && -[__CFString length](v12, "length"))
  {
    v16 = objc_msgSend(v15, "length");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("REMOVING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[PSUICellularPlanActivatingTableCell _setBadge:andTitle:andSubtitle:andStatus:](self, "_setBadge:andTitle:andSubtitle:andStatus:", v10, v12, v15, v18);
    else
      -[PSUICellularPlanActivatingTableCell _setCenteredBadge:andCenteredTitle:andStatus:](self, "_setCenteredBadge:andCenteredTitle:andStatus:", v10, v12, v18);
  }
  else
  {
    v19 = -[__CFString length](v12, "length");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("REMOVING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = self;
      v21 = v12;
      v22 = v18;
    }
    else
    {
      v22 = &stru_24D5028C8;
      v20 = self;
      v21 = v18;
    }
    -[PSUICellularPlanActivatingTableCell _setBadgelessCenteredTitle:andStatus:](v20, "_setBadgelessCenteredTitle:andStatus:", v21, v22);
  }

  -[PSUICellularPlanRemovingTableCell setNeedsLayout](self, "setNeedsLayout");
}

@end
