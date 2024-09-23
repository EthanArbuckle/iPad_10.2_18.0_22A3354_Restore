@implementation PUIDoubleSubtitleCell

- (PUIDoubleSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUIDoubleSubtitleCell *v4;
  PUIDoubleSubtitleCell *v5;
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
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)PUIDoubleSubtitleCell;
  v4 = -[PUIDoubleSubtitleCell initWithStyle:reuseIdentifier:](&v52, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUIDoubleSubtitleCell setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[PUIDoubleSubtitleCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[PUIDoubleSubtitleCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAxis:", 1);
    -[PUIDoubleSubtitleCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    objc_msgSend(v10, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    objc_msgSend(v10, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(v10, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    objc_msgSend(v10, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    v24 = (void *)objc_opt_new();
    -[PUIDoubleSubtitleCell setPrimaryLabel:](v5, "setPrimaryLabel:", v24);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDoubleSubtitleCell primaryLabel](v5, "primaryLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v26);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDoubleSubtitleCell primaryLabel](v5, "primaryLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v29);

    -[PUIDoubleSubtitleCell primaryLabel](v5, "primaryLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUIDoubleSubtitleCell primaryLabel](v5, "primaryLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addArrangedSubview:", v32);

    v33 = (void *)objc_opt_new();
    -[PUIDoubleSubtitleCell setSecondaryLabel:](v5, "setSecondaryLabel:", v33);

    -[PUIDoubleSubtitleCell detailTextLabel](v5, "detailTextLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "font");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDoubleSubtitleCell secondaryLabel](v5, "secondaryLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFont:", v35);

    -[PUIDoubleSubtitleCell detailTextLabel](v5, "detailTextLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "textColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDoubleSubtitleCell secondaryLabel](v5, "secondaryLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTextColor:", v38);

    -[PUIDoubleSubtitleCell secondaryLabel](v5, "secondaryLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUIDoubleSubtitleCell secondaryLabel](v5, "secondaryLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addArrangedSubview:", v41);

    v42 = (void *)objc_opt_new();
    -[PUIDoubleSubtitleCell setTertiaryLabel:](v5, "setTertiaryLabel:", v42);

    -[PUIDoubleSubtitleCell detailTextLabel](v5, "detailTextLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDoubleSubtitleCell tertiaryLabel](v5, "tertiaryLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFont:", v44);

    -[PUIDoubleSubtitleCell detailTextLabel](v5, "detailTextLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "textColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIDoubleSubtitleCell tertiaryLabel](v5, "tertiaryLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTextColor:", v47);

    -[PUIDoubleSubtitleCell tertiaryLabel](v5, "tertiaryLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUIDoubleSubtitleCell tertiaryLabel](v5, "tertiaryLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addArrangedSubview:", v50);

  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUIDoubleSubtitleCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, a3);
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIDoubleSubtitleCell primaryLabel](self, "primaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[PUIDoubleSubtitleCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIDoubleSubtitleCell secondaryLabel](self, "secondaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[PSTableCell specifier](self, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PUIDoubleSubtitleCellTeritaryTextKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIDoubleSubtitleCell tertiaryLabel](self, "tertiaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
