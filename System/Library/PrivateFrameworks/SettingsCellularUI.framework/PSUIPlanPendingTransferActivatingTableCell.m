@implementation PSUIPlanPendingTransferActivatingTableCell

- (PSUIPlanPendingTransferActivatingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUIPlanPendingTransferActivatingTableCell *v4;
  uint64_t v5;
  UIActivityIndicatorView *spinner;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUIPlanPendingTransferActivatingTableCell;
  v4 = -[PSUIDanglingPlanTableCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView startAnimating](v4->_spinner, "startAnimating");
    -[PSUIPlanPendingTransferActivatingTableCell setAccessoryView:](v4, "setAccessoryView:", v4->_spinner);
  }
  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CTCellularPlanPendingTransfer *v7;
  CTCellularPlanPendingTransfer *planPendingTransfer;
  void *v9;
  uint64_t v10;
  CTCellularPlanPendingTransfer *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PSUIPlanPendingTransferActivatingTableCell;
  v4 = a3;
  -[PSUIDanglingPlanTableCell refreshCellContentsWithSpecifier:](&v23, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planPendingTransferFromReference:", v5);
  v7 = (CTCellularPlanPendingTransfer *)objc_claimAutoreleasedReturnValue();
  planPendingTransfer = self->_planPendingTransfer;
  self->_planPendingTransfer = v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = self->_planPendingTransfer;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[CTCellularPlanPendingTransfer carrierName](v11, "carrierName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer deviceName](self->_planPendingTransfer, "deviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      v19 = 0;
      goto LABEL_7;
    }
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("USED_ON_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer deviceName](self->_planPendingTransfer, "deviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CTCellularPlanPendingTransfer planLabel](v11, "planLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CTCellularPlanPendingTransfer phoneNumber](self->_planPendingTransfer, "phoneNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SettingsCellularUtils formattedPhoneNumber:](SettingsCellularUtils, "formattedPhoneNumber:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[PSUIDanglingPlanTableCell _setLabel:andPhoneNumber:](self, "_setLabel:andPhoneNumber:", v12, v19);
  -[PSUIPlanPendingTransferActivatingTableCell _setStatusLabelText](self, "_setStatusLabelText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIDanglingPlanTableCell statusLabel](self, "statusLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[PSUIPlanPendingTransferActivatingTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_setStatusLabelText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ACTIVATING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CTCellularPlanPendingTransfer)planPendingTransfer
{
  return self->_planPendingTransfer;
}

- (void)setPlanPendingTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_planPendingTransfer, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_planPendingTransfer, 0);
}

@end
