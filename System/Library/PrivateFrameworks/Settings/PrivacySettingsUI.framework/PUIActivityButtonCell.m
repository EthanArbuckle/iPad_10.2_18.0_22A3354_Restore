@implementation PUIActivityButtonCell

- (PUIActivityButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUIActivityButtonCell *v4;
  PUIActivityButtonCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)PUIActivityButtonCell;
  v4 = -[PUIActivityButtonCell initWithStyle:reuseIdentifier:](&v61, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUIActivityButtonCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSTableCell titleLabel](v5, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[PUIActivityButtonCell detailTextLabel](v5, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    v10 = (void *)objc_opt_new();
    -[PUIActivityButtonCell setPrimaryLabel:](v5, "setPrimaryLabel:", v10);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v13);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNumberOfLines:", 0);

    -[PUIActivityButtonCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[PUIActivityButtonCell setSpinner:](v5, "setSpinner:", v21);

    -[PUIActivityButtonCell spinner](v5, "spinner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUIActivityButtonCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell spinner](v5, "spinner");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[PUIActivityButtonCell spinner](v5, "spinner");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 1);

    -[PUIActivityButtonCell spinner](v5, "spinner");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[PUIActivityButtonCell spinner](v5, "spinner");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[PUIActivityButtonCell spinner](v5, "spinner");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell spinner](v5, "spinner");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v45, 8.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    -[PUIActivityButtonCell primaryLabel](v5, "primaryLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell contentView](v5, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "centerXAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PUIActivityButtonCellIsActive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "BOOLValue") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D80808]);

  v19.receiver = self;
  v19.super_class = (Class)PUIActivityButtonCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v19, sel_refreshCellContentsWithSpecifier_, v5);
  -[PSTableCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIActivityButtonCell primaryLabel](self, "primaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PUIActivityButtonCellIsActive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v11, "BOOLValue");
  -[PUIActivityButtonCell spinner](self, "spinner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((_DWORD)v8)
  {
    objc_msgSend(v12, "setHidden:", 0);

    -[PUIActivityButtonCell spinner](self, "spinner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startAnimating");

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell primaryLabel](self, "primaryLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);
  }
  else
  {
    objc_msgSend(v12, "setHidden:", 1);

    -[PUIActivityButtonCell spinner](self, "spinner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopAnimating");

    -[PSTableCell titleLabel](self, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIActivityButtonCell primaryLabel](self, "primaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v16);

  }
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
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
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
