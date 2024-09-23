@implementation PUITrackerCell

- (PUITrackerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUITrackerCell *v4;
  PUITrackerCell *v5;
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
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)PUITrackerCell;
  v4 = -[PUITrackerCell initWithStyle:reuseIdentifier:](&v56, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUITrackerCell setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[PUITrackerCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[PUITrackerCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setSpacing:", 8.0);
    -[PUITrackerCell contentView](v5, "contentView");
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
    -[PUITrackerCell setPrimaryLabel:](v5, "setPrimaryLabel:", v24);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerCell primaryLabel](v5, "primaryLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v26);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "textColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerCell primaryLabel](v5, "primaryLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v29);

    -[PUITrackerCell primaryLabel](v5, "primaryLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerCell primaryLabel](v5, "primaryLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addArrangedSubview:", v32);

    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v33, "setAxis:", 1);
    objc_msgSend(v33, "setSpacing:", 2.0);
    objc_msgSend(v10, "addArrangedSubview:", v33);
    v34 = (void *)objc_opt_new();
    -[PUITrackerCell setValueLabel:](v5, "setValueLabel:", v34);

    -[PUITrackerCell detailTextLabel](v5, "detailTextLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "font");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerCell valueLabel](v5, "valueLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFont:", v36);

    -[PUITrackerCell detailTextLabel](v5, "detailTextLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerCell valueLabel](v5, "valueLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTextColor:", v39);

    -[PUITrackerCell valueLabel](v5, "valueLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerCell valueLabel](v5, "valueLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextAlignment:", 2);

    -[PUITrackerCell valueLabel](v5, "valueLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setNumberOfLines:", 0);

    -[PUITrackerCell valueLabel](v5, "valueLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addArrangedSubview:", v44);

    v45 = (void *)objc_opt_new();
    -[PUITrackerCell setSubtitleLabel:](v5, "setSubtitleLabel:", v45);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerCell subtitleLabel](v5, "subtitleLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFont:", v46);

    -[PUITrackerCell detailTextLabel](v5, "detailTextLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "textColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITrackerCell subtitleLabel](v5, "subtitleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextColor:", v49);

    -[PUITrackerCell subtitleLabel](v5, "subtitleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUITrackerCell subtitleLabel](v5, "subtitleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTextAlignment:", 2);

    -[PUITrackerCell subtitleLabel](v5, "subtitleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setNumberOfLines:", 0);

    -[PUITrackerCell subtitleLabel](v5, "subtitleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addArrangedSubview:", v54);

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
  v13.super_class = (Class)PUITrackerCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, a3);
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerCell primaryLabel](self, "primaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[PUITrackerCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerCell valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[PSTableCell specifier](self, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PUITrackerCellSubtitleTextKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITrackerCell subtitleLabel](self, "subtitleLabel");
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

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
