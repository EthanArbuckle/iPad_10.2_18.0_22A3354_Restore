@implementation PSUIPlanPendingTransferCancelConsentRequestCell

- (PSUIPlanPendingTransferCancelConsentRequestCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSUIPlanPendingTransferCancelConsentRequestCell *v9;
  void *v10;
  uint64_t v11;
  CTCellularPlanPendingTransfer *planPendingTransfer;
  uint64_t v13;
  CTCellularPlanManager *cellularPlanManager;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  objc_super v65;
  objc_super v66;
  objc_super v67;

  v8 = a5;
  v67.receiver = self;
  v67.super_class = (Class)PSUIPlanPendingTransferCancelConsentRequestCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v67, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75958]);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "planPendingTransferFromReference:", v64);
    v11 = objc_claimAutoreleasedReturnValue();
    planPendingTransfer = v9->_planPendingTransfer;
    v9->_planPendingTransfer = (CTCellularPlanPendingTransfer *)v11;

    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v13 = objc_claimAutoreleasedReturnValue();
    cellularPlanManager = v9->_cellularPlanManager;
    v9->_cellularPlanManager = (CTCellularPlanManager *)v13;

    v66.receiver = v9;
    v66.super_class = (Class)PSUIPlanPendingTransferCancelConsentRequestCell;
    -[PSUIPlanPendingTransferCancelConsentRequestCell textLabel](&v66, sel_textLabel);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    v65.receiver = v9;
    v65.super_class = (Class)PSUIPlanPendingTransferCancelConsentRequestCell;
    -[PSUIPlanPendingTransferCancelConsentRequestCell textLabel](&v65, sel_textLabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");

    v17 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REQUEST_SENT"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v19);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v20);

    v21 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v22);

    objc_msgSend(v17, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v17, "setNumberOfLines:", 0);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v17);

    objc_msgSend(v17, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    objc_msgSend(v17, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v21);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFont:", v35);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTitle:forState:", v37, 0);

    objc_msgSend(v33, "addTarget:action:forEvents:", v9, sel_cancelPressed, 64);
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v33);

    objc_msgSend(v33, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    objc_msgSend(v33, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    LODWORD(v48) = 1148846080;
    objc_msgSend(v33, "setContentCompressionResistancePriority:forAxis:", 0, v48);
    v49 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v49, "setText:", &stru_24D5028C8);
    objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addSubview:", v49);

    objc_msgSend(v49, "centerYAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    objc_msgSend(v49, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPlanPendingTransferCancelConsentRequestCell contentView](v9, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    LODWORD(v59) = 1148846080;
    objc_msgSend(v49, "setContentCompressionResistancePriority:forAxis:", 0, v59);
    objc_msgSend(v49, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v61, 2.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

  }
  return v9;
}

- (void)cancelPressed
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CTCellularPlanManager cancelPlanActivation:](self->_cellularPlanManager, "cancelPlanActivation:", self->_planPendingTransfer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPlanPendingTransferCancelConsentRequestCell getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[PSUIPlanPendingTransferCancelConsentRequestCell cancelPressed]";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_2161C6000, v5, OS_LOG_TYPE_ERROR, "%s Failed to cancel the consent request on source device with error %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PSUIPlanPendingTransferCancelConsentRequestCell cancelPressed]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s Successfully cancelled the consent request on the source device", (uint8_t *)&v6, 0xCu);
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanPendingTransferCancelConsentRequest"));
}

- (CTCellularPlanPendingTransfer)planPendingTransfer
{
  return self->_planPendingTransfer;
}

- (void)setPlanPendingTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_planPendingTransfer, a3);
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
  objc_storeStrong((id *)&self->_cellularPlanManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planPendingTransfer, 0);
}

@end
