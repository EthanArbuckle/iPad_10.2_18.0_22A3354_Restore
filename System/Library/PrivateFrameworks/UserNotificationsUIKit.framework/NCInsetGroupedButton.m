@implementation NCInsetGroupedButton

- (id)_initWithTitle:(id)a3 top:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NCInsetGroupedButton *v11;
  uint64_t v12;
  UIView *cornersView;
  UIView *v14;
  void *v15;
  uint64_t v16;
  UIView *backgroundView;
  UIView *v18;
  void *v19;
  uint64_t v20;
  UILabel *titleLabel;
  UILabel *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  UILabel *subtitleLabel;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  uint64_t v31;
  UIImageView *arrowImageView;
  UIImageView *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
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
  void *v60;
  void *v61;
  void *v62;
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
  double v73;
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
  double v86;
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
  void *v104;
  void *v105;
  id v106;
  objc_super v107;

  v4 = a4;
  v6 = a3;
  v107.receiver = self;
  v107.super_class = (Class)NCInsetGroupedButton;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[NCInsetGroupedButton initWithFrame:](&v107, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    cornersView = v11->_cornersView;
    v11->_cornersView = (UIView *)v12;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_cornersView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = v11->_cornersView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UIView setUserInteractionEnabled:](v11->_cornersView, "setUserInteractionEnabled:", 0);
    -[UIView _setContinuousCornerRadius:](v11->_cornersView, "_setContinuousCornerRadius:", 16.0);
    -[NCInsetGroupedButton addSubview:](v11, "addSubview:", v11->_cornersView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = (UIView *)v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v11->_backgroundView, "setUserInteractionEnabled:", 0);
    v18 = v11->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[NCInsetGroupedButton addSubview:](v11, "addSubview:", v11->_backgroundView);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setUserInteractionEnabled:](v11->_titleLabel, "setUserInteractionEnabled:", 0);
    v22 = v11->_titleLabel;
    v23 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v24);

    v106 = v6;
    -[UILabel setText:](v11->_titleLabel, "setText:", v6);
    -[NCInsetGroupedButton addSubview:](v11, "addSubview:", v11->_titleLabel);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v11->_subtitleLabel;
    v11->_subtitleLabel = (UILabel *)v25;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setUserInteractionEnabled:](v11->_subtitleLabel, "setUserInteractionEnabled:", 0);
    v27 = v11->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v27, "setFont:", v28);

    v29 = v11->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v29, "setTextColor:", v30);

    -[NCInsetGroupedButton addSubview:](v11, "addSubview:", v11->_subtitleLabel);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    arrowImageView = v11->_arrowImageView;
    v11->_arrowImageView = (UIImageView *)v31;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v11->_arrowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v11->_arrowImageView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 14.0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v11->_arrowImageView, "setImage:");
    -[UIImageView setContentMode:](v11->_arrowImageView, "setContentMode:", 4);
    v33 = v11->_arrowImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v33, "setTintColor:", v34);

    -[NCInsetGroupedButton addSubview:](v11, "addSubview:", v11->_arrowImageView);
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView leadingAnchor](v11->_backgroundView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton leadingAnchor](v11, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v38);

    -[NCInsetGroupedButton trailingAnchor](v11, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_backgroundView, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v41);

    -[UIView topAnchor](v11->_backgroundView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton topAnchor](v11, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v44 = 16.0;
    else
      v44 = 0.0;
    if (v4)
      v45 = 0.0;
    else
      v45 = 16.0;
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v46);

    -[NCInsetGroupedButton bottomAnchor](v11, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v11->_backgroundView, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, v45);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v49);

    -[UIView leadingAnchor](v11->_cornersView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton leadingAnchor](v11, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v52);

    -[NCInsetGroupedButton trailingAnchor](v11, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11->_cornersView, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v55);

    -[UIView heightAnchor](v11->_cornersView, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToConstant:", 32.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v57);

    if (v4)
    {
      -[UIView topAnchor](v11->_cornersView, "topAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCInsetGroupedButton topAnchor](v11, "topAnchor");
    }
    else
    {
      -[NCInsetGroupedButton bottomAnchor](v11, "bottomAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v11->_cornersView, "bottomAnchor");
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v60);

    -[UILabel centerYAnchor](v11->_titleLabel, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton centerYAnchor](v11, "centerYAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v63);

    -[UILabel topAnchor](v11->_titleLabel, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton topAnchor](v11, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:constant:", v65, 16.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v66);

    -[NCInsetGroupedButton bottomAnchor](v11, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v11->_titleLabel, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:constant:", v68, 16.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v69);

    -[UILabel leadingAnchor](v11->_titleLabel, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton leadingAnchor](v11, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, 16.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v72);

    LODWORD(v73) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v11->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v73);
    -[UILabel centerYAnchor](v11->_subtitleLabel, "centerYAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton centerYAnchor](v11, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v76);

    -[UILabel leadingAnchor](v11->_subtitleLabel, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v11->_titleLabel, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintGreaterThanOrEqualToAnchor:constant:", v78, 16.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v79);

    -[UILabel topAnchor](v11->_subtitleLabel, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton topAnchor](v11, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintGreaterThanOrEqualToAnchor:constant:", v81, 16.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v82);

    -[NCInsetGroupedButton bottomAnchor](v11, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v11->_subtitleLabel, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:constant:", v84, 16.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v85);

    LODWORD(v86) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v11->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v86);
    -[UILabel centerYAnchor](v11->_subtitleLabel, "centerYAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton centerYAnchor](v11, "centerYAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v89);

    -[UIImageView leadingAnchor](v11->_arrowImageView, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v11->_subtitleLabel, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, 8.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v92);

    -[UIImageView centerYAnchor](v11->_arrowImageView, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCInsetGroupedButton centerYAnchor](v11, "centerYAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v95);

    -[NCInsetGroupedButton trailingAnchor](v11, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v11->_arrowImageView, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, 16.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v98);

    -[UIImageView heightAnchor](v11->_arrowImageView, "heightAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToConstant:", 10.0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v100);

    -[UIImageView widthAnchor](v11->_arrowImageView, "widthAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToConstant:", 10.0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v102);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);
    v6 = v106;
  }

  return v11;
}

+ (id)buttonWithTitle:(id)a3 top:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = -[NCInsetGroupedButton _initWithTitle:top:]([NCInsetGroupedButton alloc], "_initWithTitle:top:", v5, v4);

  return v6;
}

- (void)setSubtitleText:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCInsetGroupedButton;
  -[NCInsetGroupedButton layoutSubviews](&v4, sel_layoutSubviews);
  if ((-[NCInsetGroupedButton isHighlighted](self, "isHighlighted") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_cornersView, "setBackgroundColor:", v3);
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v3);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[NCInsetGroupedButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)NCInsetGroupedButton;
  -[NCInsetGroupedButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != -[NCInsetGroupedButton isHighlighted](self, "isHighlighted"))
    -[NCInsetGroupedButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[NCInsetGroupedButton isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)NCInsetGroupedButton;
  -[NCInsetGroupedButton setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != -[NCInsetGroupedButton isSelected](self, "isSelected"))
    -[NCInsetGroupedButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  NCInsetGroupedButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (NCInsetGroupedButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "numberOfTapsRequired");

  if (v6 != 1)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_cornersView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
