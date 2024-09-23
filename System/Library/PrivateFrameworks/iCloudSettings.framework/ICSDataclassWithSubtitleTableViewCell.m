@implementation ICSDataclassWithSubtitleTableViewCell

- (ICSDataclassWithSubtitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  ICSDataclassWithSubtitleTableViewCell *v5;
  ICSDataclassWithSubtitleTableViewCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSDataclassWithSubtitleTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v8, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ICSDataclassWithSubtitleTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[ICSDataclassWithSubtitleTableViewCell _setupViews](v6, "_setupViews");
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ICSDataclassWithSubtitleTableViewCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v30, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell primaryLabel](self, "primaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 1;
LABEL_6:
  objc_msgSend(v15, "setHidden:", v17);

  if (objc_msgSend(v4, "hasValidGetter"))
  {
    objc_msgSend(v4, "performGetter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 0);

      -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v18);

      -[ICSDataclassWithSubtitleTableViewCell toggleContainer](self, "toggleContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidden:", 1);

      -[ICSDataclassWithSubtitleTableViewCell trailingConstraint](self, "trailingConstraint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = 0.0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v26;
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v26, "setText:", &stru_251C6B070);
        goto LABEL_14;
      }
      objc_msgSend(v26, "setHidden:", 1);

      -[ICSDataclassWithSubtitleTableViewCell toggleContainer](self, "toggleContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setHidden:", 0);

      v28 = objc_msgSend(v18, "BOOLValue");
      -[ICSDataclassWithSubtitleTableViewCell toggle](self, "toggle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setOn:", v28);

      -[ICSDataclassWithSubtitleTableViewCell trailingConstraint](self, "trailingConstraint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = -16.0;
    }
    objc_msgSend(v22, "setConstant:", v24);
LABEL_14:

    goto LABEL_15;
  }
  -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", &stru_251C6B070);
LABEL_15:

  -[ICSDataclassWithSubtitleTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v103[4];
  id v104;
  id location;
  _QWORD v106[7];
  _QWORD v107[4];
  _QWORD v108[2];
  _QWORD v109[3];
  _QWORD v110[4];

  v110[2] = *MEMORY[0x24BDAC8D0];
  -[ICSDataclassWithSubtitleTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[ICSDataclassWithSubtitleTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  v5 = objc_alloc(MEMORY[0x24BEBD668]);
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
  -[ICSDataclassWithSubtitleTableViewCell setIconView:](self, "setIconView:", v10);

  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentMode:", 1);

  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1148846080;
  objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v14);

  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1148846080;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 0, v16);

  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 0;
  objc_msgSend(v18, "setOpacity:", v19);

  v20 = (void *)MEMORY[0x24BDD1628];
  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 29.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v22;
  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v28);

  v29 = objc_alloc(MEMORY[0x24BEBD978]);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v6, v7, v8, v9);
  v109[0] = v30;
  -[ICSDataclassWithSubtitleTableViewCell iconView](self, "iconView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v31;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v6, v7, v8, v9);
  v109[2] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v29, "initWithArrangedSubviews:", v33);

  objc_msgSend(v100, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v100, "setAxis:", 1);
  objc_msgSend(v100, "setDistribution:", 3);
  objc_msgSend(v100, "setSpacing:", 0.0);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
  -[ICSDataclassWithSubtitleTableViewCell setPrimaryLabel:](self, "setPrimaryLabel:", v34);

  -[ICSDataclassWithSubtitleTableViewCell primaryLabel](self, "primaryLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v36 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell primaryLabel](self, "primaryLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFont:", v37);

  -[ICSDataclassWithSubtitleTableViewCell primaryLabel](self, "primaryLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setNumberOfLines:", 0);

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
  -[ICSDataclassWithSubtitleTableViewCell setSecondaryLabel:](self, "setSecondaryLabel:", v40);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTextColor:", v41);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFont:", v43);

  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setNumberOfLines:", 0);

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
  -[ICSDataclassWithSubtitleTableViewCell setTertiaryLabel:](self, "setTertiaryLabel:", v47);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTextColor:", v48);

  -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTextAlignment:", 2);

  -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v36);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFont:", v52);

  v54 = objc_alloc(MEMORY[0x24BEBD978]);
  -[ICSDataclassWithSubtitleTableViewCell primaryLabel](self, "primaryLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v55;
  -[ICSDataclassWithSubtitleTableViewCell secondaryLabel](self, "secondaryLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)objc_msgSend(v54, "initWithArrangedSubviews:", v57);

  objc_msgSend(v99, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v99, "setAxis:", 1);
  objc_msgSend(v99, "setDistribution:", 0);
  objc_msgSend(v99, "setSpacing:", 2.0);
  objc_initWeak(&location, self);
  v58 = (void *)MEMORY[0x24BEBD388];
  v103[0] = MEMORY[0x24BDAC760];
  v103[1] = 3221225472;
  v103[2] = __52__ICSDataclassWithSubtitleTableViewCell__setupViews__block_invoke;
  v103[3] = &unk_251C61488;
  objc_copyWeak(&v104, &location);
  objc_msgSend(v58, "actionWithHandler:", v103);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9B8]), "initWithFrame:primaryAction:", v98, v6, v7, v8, v9);
  -[ICSDataclassWithSubtitleTableViewCell setToggle:](self, "setToggle:", v59);

  -[ICSDataclassWithSubtitleTableViewCell toggle](self, "toggle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v102 = (void *)objc_opt_new();
  objc_msgSend(v102, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICSDataclassWithSubtitleTableViewCell toggle](self, "toggle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "addSubview:", v61);

  -[ICSDataclassWithSubtitleTableViewCell setToggleContainer:](self, "setToggleContainer:", v102);
  v62 = objc_alloc(MEMORY[0x24BEBD978]);
  v107[0] = v100;
  v107[1] = v99;
  -[ICSDataclassWithSubtitleTableViewCell tertiaryLabel](self, "tertiaryLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v63;
  v107[3] = v102;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v62, "initWithArrangedSubviews:", v64);

  objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v65, "setAxis:", 0);
  objc_msgSend(v65, "setDistribution:", 0);
  objc_msgSend(v65, "setSpacing:", 16.0);
  -[ICSDataclassWithSubtitleTableViewCell contentView](self, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addSubview:", v65);

  objc_msgSend(v65, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell setTrailingConstraint:](self, "setTrailingConstraint:", v70);

  v80 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v65, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell contentView](self, "contentView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "topAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:constant:", v95, 10.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v94;
  objc_msgSend(v65, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell contentView](self, "contentView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "bottomAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:constant:", v91, -10.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v90;
  objc_msgSend(v65, "leadingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassWithSubtitleTableViewCell contentView](self, "contentView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 16.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v86;
  -[ICSDataclassWithSubtitleTableViewCell trailingConstraint](self, "trailingConstraint");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v85;
  -[ICSDataclassWithSubtitleTableViewCell toggle](self, "toggle");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "leadingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v106[4] = v81;
  -[ICSDataclassWithSubtitleTableViewCell toggle](self, "toggle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v106[5] = v74;
  -[ICSDataclassWithSubtitleTableViewCell toggle](self, "toggle");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerYAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "centerYAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v106[6] = v78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v106, 7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "activateConstraints:", v79);

  objc_destroyWeak(&v104);
  objc_destroyWeak(&location);

}

void __52__ICSDataclassWithSubtitleTableViewCell__setupViews__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAction:", v3);

}

- (void)_handleAction:(id)a3
{
  void *v4;
  id v5;

  -[PSTableCell specifier](self, "specifier", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UISwitch isOn](self->_toggle, "isOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSetterWithValue:", v4);

}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabel, a3);
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
  objc_storeStrong((id *)&self->_toggle, a3);
}

- (UIView)toggleContainer
{
  return self->_toggleContainer;
}

- (void)setToggleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_toggleContainer, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_toggleContainer, 0);
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
