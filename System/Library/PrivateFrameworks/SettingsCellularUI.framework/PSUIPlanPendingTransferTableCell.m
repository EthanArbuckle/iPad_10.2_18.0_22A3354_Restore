@implementation PSUIPlanPendingTransferTableCell

- (PSUIPlanPendingTransferTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUIPlanPendingTransferTableCell *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImageView *view;
  UIImageView *v9;
  void *v10;
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
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PSUIPlanPendingTransferTableCell;
  v4 = -[PSUIDanglingPlanTableCell initWithStyle:reuseIdentifier:](&v30, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.circle.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1D0], 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v5);
    view = v4->_view;
    v4->_view = (UIImageView *)v7;

    -[UIImageView setPreferredSymbolConfiguration:](v4->_view, "setPreferredSymbolConfiguration:", v6);
    v9 = v4->_view;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v9, "setTintColor:", v10);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_view, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIPlanPendingTransferTableCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_view);

    -[UIImageView centerYAnchor](v4->_view, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferTableCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UIImageView trailingAnchor](v4->_view, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferTableCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    LODWORD(v22) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_view, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_view, "setContentHuggingPriority:forAxis:", 0, v23);
    -[UIImageView leadingAnchor](v4->_view, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell nameLabel](v4, "nameLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[PSUIDanglingPlanTableCell statusLabel](v4, "statusLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeFromSuperview");

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
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PSUIPlanPendingTransferTableCell;
  -[PSUIDanglingPlanTableCell refreshCellContentsWithSpecifier:](&v26, sel_refreshCellContentsWithSpecifier_, v4);
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

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("USED_AS_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer planLabel](self->_planPendingTransfer, "planLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CTCellularPlanPendingTransfer phoneNumber](self->_planPendingTransfer, "phoneNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SettingsCellularUtils formattedPhoneNumber:](SettingsCellularUtils, "formattedPhoneNumber:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CTCellularPlanPendingTransfer carrierName](self->_planPendingTransfer, "carrierName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanPendingTransfer deviceName](self->_planPendingTransfer, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("USED_ON_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanPendingTransfer deviceName](self->_planPendingTransfer, "deviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_6;
  }
  v18 = 0;
LABEL_6:
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  if (objc_msgSend(v4, "hasValidGetter"))
  {
    objc_msgSend(v4, "performGetter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PSUIDanglingPlanTableCell statusLabel](self, "statusLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setText:", v24);

      }
    }

  }
  -[PSUIDanglingPlanTableCell _setLabel:andPhoneNumber:](self, "_setLabel:andPhoneNumber:", v11, v18);
  -[PSUIPlanPendingTransferTableCell setNeedsLayout](self, "setNeedsLayout");

}

- (UIImageView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (CTCellularPlanPendingTransfer)planPendingTransfer
{
  return self->_planPendingTransfer;
}

- (void)setPlanPendingTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_planPendingTransfer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planPendingTransfer, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
