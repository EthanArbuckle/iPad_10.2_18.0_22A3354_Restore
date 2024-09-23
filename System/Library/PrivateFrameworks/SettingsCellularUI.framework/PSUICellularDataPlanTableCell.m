@implementation PSUICellularDataPlanTableCell

- (PSUICellularDataPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUICellularDataPlanTableCell *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImageView *iconView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSUICellularDataPlanTableCell;
  v4 = -[PSUICellularDataPlanTableCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v4, sel_infoSymbolTapped_);
    objc_msgSend(v5, "setNumberOfTapsRequired:", 1);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("info.circle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v6);
    iconView = v4->_iconView;
    v4->_iconView = (UIImageView *)v7;

    -[PSUICellularDataPlanTableCell setAccessoryView:](v4, "setAccessoryView:", v4->_iconView);
    -[UIImageView addGestureRecognizer:](v4->_iconView, "addGestureRecognizer:", v5);
    -[UIImageView setUserInteractionEnabled:](v4->_iconView, "setUserInteractionEnabled:", 1);

  }
  return v4;
}

- (id)_cellularPlanItem
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canBeChecked
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PSUICellularDataPlanTableCell _cellularPlanItem](self, "_cellularPlanItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isSelectable") && objc_msgSend(v3, "transferredStatus") != 4)
  {
    if (v5)
      v6 = objc_msgSend(v5, "BOOLValue");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)primaryText
{
  void *v3;
  id v4;
  void *v5;

  -[PSUICellularDataPlanTableCell planDescription](self, "planDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[PSUICellularDataPlanTableCell planStatus](self, "planStatus");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)detailText
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[PSUICellularDataPlanTableCell planDescription](self, "planDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[PSUICellularDataPlanTableCell planStatus](self, "planStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)planDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[PSUICellularDataPlanTableCell _cellularPlanItem](self, "_cellularPlanItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isSimStateValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    v9 = CFSTR("CELLULAR_PLAN_SIM_STATE_INVALID");
LABEL_9:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24D5028C8, CFSTR("Cellular"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(v2, "isBackedByCellularPlan"))
  {
    objc_msgSend(v2, "plan");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "plan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "carrierName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "length")
      || !objc_msgSend(v6, "length")
      || (objc_msgSend(v4, "isEqualToString:", v6) & 1) != 0)
    {
      if (v4)
      {
        v7 = v4;
      }
      else if (v6)
      {
        v7 = v6;
      }
      else
      {
        objc_msgSend(v2, "name");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_22;
    }
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CARRIER_AND_PLAN_NAME"), &stru_24D5028C8, CFSTR("Cellular"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  objc_msgSend(v2, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE158C0]);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    v9 = CFSTR("HOME_PLAN");
    goto LABEL_9;
  }
  objc_msgSend(v2, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE158C8]);

  if (v14)
  {
    objc_msgSend(v2, "plan");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "carrierName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HOME_PLAN_WITH_ROAMING"), &stru_24D5028C8, CFSTR("Cellular"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v10 = v7;
      goto LABEL_23;
    }
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HOME_PLAN_FOR_CARRIER_WITH_ROAMING"), &stru_24D5028C8, CFSTR("Cellular"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend(v2, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v10;
}

- (id)planStatus
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PSUICellularDataPlanTableCell _cellularPlanItem](self, "_cellularPlanItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "transferredStatus") == 4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CONVERTED");
LABEL_10:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D5028C8, CFSTR("Cellular"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v2, "transferredStatus"))
  {
    objc_msgSend(v2, "transferredToDeviceDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TRANSFERRED_TO_@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TRANSFERRED"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
  if (!objc_msgSend(v2, "isBackedByCellularPlan") || !objc_msgSend(v2, "isSimStateValid"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CELLULAR_PLAN_STATUS_SIM_CARD");
    goto LABEL_10;
  }
  PSUIFormatPlanStatusForPlan(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v9;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIImageView *iconView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PSUICellularDataPlanTableCell;
  -[PSUICarrierSpacePlanTableCell refreshCellContentsWithSpecifier:](&v25, sel_refreshCellContentsWithSpecifier_, a3);
  -[PSUICellularDataPlanTableCell _cellularPlanItem](self, "_cellularPlanItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isSelected"))
  {
    objc_msgSend((id)objc_opt_class(), "checkIcon");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "spacerIcon");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[PSTableCell setIcon:](self, "setIcon:", v6);

  if (-[PSUICellularDataPlanTableCell _isDisabledPhysicalSIM:](self, "_isDisabledPhysicalSIM:", v5))
  {
    iconView = self->_iconView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](iconView, "setTintColor:", v9);

  }
  -[PSUICellularDataPlanTableCell primaryText](self, "primaryText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDataPlanTableCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[PSUICellularDataPlanTableCell detailText](self, "detailText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularDataPlanTableCell detailTextLabel](self, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  if (v5)
  {
    objc_msgSend(v5, "plan");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "planStatus");

    if (v15 == 4)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularDataPlanTableCell detailTextLabel](self, "detailTextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColor:", v16);

    }
  }
  if (objc_msgSend(v5, "transferredStatus") == 4)
  {
    -[PSTableCell specifier](self, "specifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);

  }
  v19 = -[PSUICellularDataPlanTableCell canBeChecked](self, "canBeChecked");
  -[PSTableCell titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEnabled:", v19);

  -[PSUICellularDataPlanTableCell detailTextLabel](self, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEnabled:", v19);

  -[PSUICarrierSpacePlanTableCell accessoryText](self, "accessoryText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
  {
    v23 = objc_alloc(MEMORY[0x24BEBD708]);
    v24 = (void *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v24, "setText:", v22);
    objc_msgSend(v24, "sizeToFit");
    -[PSUICellularDataPlanTableCell setAccessoryView:](self, "setAccessoryView:", v24);

  }
}

- (void)infoSymbolTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  -[PSUICellularDataPlanTableCell _cellularPlanItem](self, "_cellularPlanItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSUICellularDataPlanTableCell _isDisabledPhysicalSIM:](self, "_isDisabledPhysicalSIM:", v4))
  {
    -[PSUICellularDataPlanTableCell getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Skip sending notification for disabled physical SIM!", buf, 2u);
    }

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__PSUICellularDataPlanTableCell_infoSymbolTapped___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __50__PSUICellularDataPlanTableCell_infoSymbolTapped___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSDataPlanInfoSymbolTappedNotification"), v2);

}

- (BOOL)_isDisabledPhysicalSIM:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "type"))
    v5 = objc_msgSend(v4, "isSelected") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDataPlanTableCell"));
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
