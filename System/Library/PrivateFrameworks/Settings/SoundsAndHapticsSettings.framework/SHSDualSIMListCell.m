@implementation SHSDualSIMListCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SHSDualSIMListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SHSDualSIMListCell *v4;
  SHSDualSIMListCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SHSBadgeView *v12;
  SHSBadgeView *badgeView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *nameLabel;
  uint64_t v24;
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
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  UILabel *v54;
  UILabel *numberLabel;
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
  void *v73;
  void *v74;
  SHSBadgeView *v75;
  SHSBadgeView *centeredBadgeView;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  UILabel *v83;
  UILabel *centeredNameLabel;
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
  UILabel *v98;
  UILabel *detailToneTextLabel;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  objc_super v127;
  objc_super v128;
  objc_super v129;
  objc_super v130;
  objc_super v131;
  objc_super v132;
  objc_super v133;

  v133.receiver = self;
  v133.super_class = (Class)SHSDualSIMListCell;
  v4 = -[SHSDualSIMListCell initWithStyle:reuseIdentifier:](&v133, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v132.receiver = v4;
    v132.super_class = (Class)SHSDualSIMListCell;
    -[SHSDualSIMListCell textLabel](&v132, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", CFSTR("ABC"));

    v131.receiver = v5;
    v131.super_class = (Class)SHSDualSIMListCell;
    -[SHSDualSIMListCell detailTextLabel](&v131, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR("XYZ"));

    v130.receiver = v5;
    v130.super_class = (Class)SHSDualSIMListCell;
    -[SHSDualSIMListCell textLabel](&v130, sel_textLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    v129.receiver = v5;
    v129.super_class = (Class)SHSDualSIMListCell;
    -[SHSDualSIMListCell detailTextLabel](&v129, sel_detailTextLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    v128.receiver = v5;
    v128.super_class = (Class)SHSDualSIMListCell;
    -[SHSDualSIMListCell textLabel](&v128, sel_textLabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    v127.receiver = v5;
    v127.super_class = (Class)SHSDualSIMListCell;
    -[SHSDualSIMListCell detailTextLabel](&v127, sel_detailTextLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[SHSDualSIMListCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v12 = objc_alloc_init(SHSBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v12;

    -[SHSDualSIMListCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    v22 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v22;

    v24 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_nameLabel, "setFont:", v25);

    -[UILabel setNumberOfLines:](v5->_nameLabel, "setNumberOfLines:", 2);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v5->_nameLabel);

    -[UILabel firstBaselineAnchor](v5->_nameLabel, "firstBaselineAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v29, 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_nameLabel, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scaledValueForValue:", 4.0);
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_nameLabel, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v45 = v44;
    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "size");
    v48 = v47;
    -[SHSDualSIMListCell nameLabel](v5, "nameLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "font");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "capHeight");
    v52 = v51;
    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", v42, v45, v48, v52);

    v54 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v54;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_numberLabel, "setFont:", v56);

    -[UILabel setNumberOfLines:](v5->_numberLabel, "setNumberOfLines:", 2);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_numberLabel, "setTextColor:", v57);

    -[SHSDualSIMListCell contentView](v5, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v5->_numberLabel);

    -[UILabel firstBaselineAnchor](v5->_numberLabel, "firstBaselineAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_nameLabel, "lastBaselineAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v60, 1.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_numberLabel, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell badgeView](v5, "badgeView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_numberLabel, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layoutMarginsGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintLessThanOrEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[SHSDualSIMListCell contentView](v5, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_numberLabel, "lastBaselineAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v73, 1.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    v75 = objc_alloc_init(SHSBadgeView);
    centeredBadgeView = v5->_centeredBadgeView;
    v5->_centeredBadgeView = v75;

    -[SHSDualSIMListCell contentView](v5, "contentView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addSubview:", v5->_centeredBadgeView);

    -[SHSBadgeView leadingAnchor](v5->_centeredBadgeView, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layoutMarginsGuide");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setActive:", 1);

    v83 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    centeredNameLabel = v5->_centeredNameLabel;
    v5->_centeredNameLabel = v83;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v24);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_centeredNameLabel, "setFont:", v85);

    -[UILabel setNumberOfLines:](v5->_centeredNameLabel, "setNumberOfLines:", 2);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_centeredNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "addSubview:", v5->_centeredNameLabel);

    -[UILabel centerYAnchor](v5->_centeredNameLabel, "centerYAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "centerYAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_centeredNameLabel, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSBadgeView trailingAnchor](v5->_centeredBadgeView, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "scaledValueForValue:", 4.0);
    objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setActive:", 1);

    -[SHSBadgeView centerYAnchor](v5->_centeredBadgeView, "centerYAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_centeredNameLabel, "centerYAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setActive:", 1);

    v98 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    detailToneTextLabel = v5->_detailToneTextLabel;
    v5->_detailToneTextLabel = v98;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v24);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_detailToneTextLabel, "setFont:", v100);

    -[UILabel setNumberOfLines:](v5->_detailToneTextLabel, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_detailToneTextLabel, "setTextColor:", v101);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_detailToneTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addSubview:", v5->_detailToneTextLabel);

    -[UILabel centerYAnchor](v5->_detailToneTextLabel, "centerYAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "centerYAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_detailToneTextLabel, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "layoutMarginsGuide");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "trailingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setActive:", 1);

    LODWORD(v112) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_detailToneTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v112);
    -[UILabel leadingAnchor](v5->_detailToneTextLabel, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListCell contentView](v5, "contentView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "centerXAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintGreaterThanOrEqualToAnchor:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_detailToneTextLabel, "leadingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_nameLabel, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v118, 1.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_detailToneTextLabel, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_centeredNameLabel, "trailingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v121, 1.0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_numberLabel, "trailingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_detailToneTextLabel, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintLessThanOrEqualToAnchor:", v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setActive:", 1);

  }
  return v5;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 0;
}

- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4
{
  SHSBadgeView *badgeView;
  id v7;
  id v8;

  badgeView = self->_badgeView;
  v8 = a4;
  v7 = a3;
  -[SHSBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 1);
  -[SHSBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 0);
  -[SHSBadgeView setText:](self->_badgeView, "setText:", v7);
  -[UILabel setText:](self->_nameLabel, "setText:", v8);
  -[UILabel setText:](self->_numberLabel, "setText:", CFSTR("+1 (123) 456-7890"));
  -[SHSBadgeView setText:](self->_centeredBadgeView, "setText:", v7);

  -[UILabel setText:](self->_centeredNameLabel, "setText:", v8);
}

- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5
{
  SHSBadgeView *badgeView;
  id v9;
  id v10;
  id v11;

  badgeView = self->_badgeView;
  v9 = a5;
  v11 = a4;
  v10 = a3;
  -[SHSBadgeView setHidden:](badgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 0);
  -[SHSBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 1);
  -[SHSBadgeView setText:](self->_badgeView, "setText:", v10);
  -[UILabel setText:](self->_nameLabel, "setText:", v11);
  -[UILabel setText:](self->_numberLabel, "setText:", v9);

  -[SHSBadgeView setText:](self->_centeredBadgeView, "setText:", v10);
  -[UILabel setText:](self->_centeredNameLabel, "setText:", v11);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHSDualSIMListCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v14, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("contextShortLabel"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24F198178;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(v5, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:](SHSDualSIMToneHelper, "fetchLocalizedPhoneNumberForContext:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SHSLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v16 = "-[SHSDualSIMListCell refreshCellContentsWithSpecifier:]";
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_228D17000, v12, OS_LOG_TYPE_DEFAULT, "%s : Received badge: %@, label: %@, phoneNumber: %@", buf, 0x2Au);
  }

  if (objc_msgSend(v11, "length"))
    -[SHSDualSIMListCell _setBadge:andLabel:andPhoneNumber:](self, "_setBadge:andLabel:andPhoneNumber:", v9, v10, v11);
  else
    -[SHSDualSIMListCell _setCenteredBadge:andLabel:](self, "_setCenteredBadge:andLabel:", v9, v10);
  if (objc_msgSend(v4, "hasValidGetter"))
  {
    objc_msgSend(v4, "performGetter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UILabel setText:](self->_detailToneTextLabel, "setText:", v13);
    }

  }
  -[SHSDualSIMListCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (SHSBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabel, a3);
}

- (UILabel)detailToneTextLabel
{
  return self->_detailToneTextLabel;
}

- (void)setDetailToneTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailToneTextLabel, a3);
}

- (SHSBadgeView)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setCenteredBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredBadgeView, a3);
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centeredNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_detailToneTextLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
