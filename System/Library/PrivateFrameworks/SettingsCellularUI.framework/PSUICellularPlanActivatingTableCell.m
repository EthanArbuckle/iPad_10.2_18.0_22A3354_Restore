@implementation PSUICellularPlanActivatingTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUICellularPlanActivatingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUICellularPlanActivatingTableCell *v4;
  PSUICellularPlanActivatingTableCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSUIBadgeView *v12;
  PSUIBadgeView *badgeView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *titleLabel;
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
  UILabel *v35;
  UILabel *subtitleLabel;
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
  PSUIBadgeView *v55;
  PSUIBadgeView *centeredBadgeView;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  UILabel *v63;
  UILabel *centeredTitleLabel;
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
  UILabel *v78;
  UILabel *badgelessCenteredTitleLabel;
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
  UILabel *v96;
  UILabel *statusLabel;
  void *v98;
  void *v99;
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
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  UIActivityIndicatorView *spinner;
  uint64_t v123;
  objc_super v124;
  objc_super v125;
  objc_super v126;
  objc_super v127;
  objc_super v128;
  objc_super v129;
  objc_super v130;

  v130.receiver = self;
  v130.super_class = (Class)PSUICellularPlanActivatingTableCell;
  v4 = -[PSUICellularPlanActivatingTableCell initWithStyle:reuseIdentifier:](&v130, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v129.receiver = v4;
    v129.super_class = (Class)PSUICellularPlanActivatingTableCell;
    -[PSUICellularPlanActivatingTableCell textLabel](&v129, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", CFSTR("ABC"));

    v128.receiver = v5;
    v128.super_class = (Class)PSUICellularPlanActivatingTableCell;
    -[PSUICellularPlanActivatingTableCell detailTextLabel](&v128, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR("XYZ"));

    v127.receiver = v5;
    v127.super_class = (Class)PSUICellularPlanActivatingTableCell;
    -[PSUICellularPlanActivatingTableCell textLabel](&v127, sel_textLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    v126.receiver = v5;
    v126.super_class = (Class)PSUICellularPlanActivatingTableCell;
    -[PSUICellularPlanActivatingTableCell detailTextLabel](&v126, sel_detailTextLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    v125.receiver = v5;
    v125.super_class = (Class)PSUICellularPlanActivatingTableCell;
    -[PSUICellularPlanActivatingTableCell textLabel](&v125, sel_textLabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    v124.receiver = v5;
    v124.super_class = (Class)PSUICellularPlanActivatingTableCell;
    -[PSUICellularPlanActivatingTableCell detailTextLabel](&v124, sel_detailTextLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[PSUICellularPlanActivatingTableCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v12 = objc_alloc_init(PSUIBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v12;

    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_badgeView);

    -[PSUIBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v20;

    v123 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v22);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v5->_titleLabel);

    -[UILabel firstBaselineAnchor](v5->_titleLabel, "firstBaselineAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v26, 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView trailingAnchor](v5->_badgeView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scaledValueForValue:", 4.0);
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[PSUIBadgeView centerYAnchor](v5->_badgeView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    v35 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v35;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_subtitleLabel, "setFont:", v37);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_subtitleLabel, "setTextColor:", v38);

    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v5->_subtitleLabel);

    -[UILabel firstBaselineAnchor](v5->_subtitleLabel, "firstBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_titleLabel, "lastBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v41, 1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_subtitleLabel, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_subtitleLabel, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_subtitleLabel, "lastBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v53, 1.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    v55 = objc_alloc_init(PSUIBadgeView);
    centeredBadgeView = v5->_centeredBadgeView;
    v5->_centeredBadgeView = v55;

    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v5->_centeredBadgeView);

    -[PSUIBadgeView leadingAnchor](v5->_centeredBadgeView, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "layoutMarginsGuide");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

    v63 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    centeredTitleLabel = v5->_centeredTitleLabel;
    v5->_centeredTitleLabel = v63;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v123);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_centeredTitleLabel, "setFont:", v65);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_centeredTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_centeredTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_centeredTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addSubview:", v5->_centeredTitleLabel);

    -[UILabel centerYAnchor](v5->_centeredTitleLabel, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_centeredTitleLabel, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView trailingAnchor](v5->_centeredBadgeView, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "scaledValueForValue:", 4.0);
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    -[PSUIBadgeView centerYAnchor](v5->_centeredBadgeView, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_centeredTitleLabel, "centerYAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setActive:", 1);

    v78 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    badgelessCenteredTitleLabel = v5->_badgelessCenteredTitleLabel;
    v5->_badgelessCenteredTitleLabel = v78;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v123);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_badgelessCenteredTitleLabel, "setFont:", v80);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_badgelessCenteredTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_badgelessCenteredTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_badgelessCenteredTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addSubview:", v5->_badgelessCenteredTitleLabel);

    -[UILabel centerYAnchor](v5->_badgelessCenteredTitleLabel, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "centerYAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_badgelessCenteredTitleLabel, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "layoutMarginsGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setActive:", 1);

    -[UILabel widthAnchor](v5->_badgelessCenteredTitleLabel, "widthAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "layoutMarginsGuide");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "widthAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:multiplier:", v94, 0.6);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    v96 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v96;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v123);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_statusLabel, "setFont:", v98);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_statusLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_statusLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_statusLabel, "setTextColor:", v99);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "addSubview:", v5->_statusLabel);

    -[UILabel centerYAnchor](v5->_statusLabel, "centerYAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "centerYAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_statusLabel, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanActivatingTableCell contentView](v5, "contentView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "layoutMarginsGuide");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "trailingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setActive:", 1);

    LODWORD(v110) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_statusLabel, "setContentCompressionResistancePriority:forAxis:", 0, v110);
    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v112, 2.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_centeredTitleLabel, "trailingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v115, 2.0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_badgelessCenteredTitleLabel, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v118, 2.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setActive:", 1);

    v120 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v120;

    -[UIActivityIndicatorView startAnimating](v5->_spinner, "startAnimating");
    -[PSUICellularPlanActivatingTableCell setAccessoryView:](v5, "setAccessoryView:", v5->_spinner);
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

- (void)_setBadge:(id)a3 andTitle:(id)a4 andSubtitle:(id)a5 andStatus:(id)a6
{
  PSUIBadgeView *badgeView;
  id v11;
  id v12;
  id v13;
  id v14;

  badgeView = self->_badgeView;
  v14 = a6;
  v13 = a5;
  v11 = a4;
  v12 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 0);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredTitleLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_badgelessCenteredTitleLabel, "setHidden:", 1);
  -[PSUIBadgeView setText:](self->_badgeView, "setText:", v12);
  -[UILabel setText:](self->_titleLabel, "setText:", v11);
  -[UILabel setText:](self->_subtitleLabel, "setText:", v13);

  -[PSUIBadgeView setText:](self->_centeredBadgeView, "setText:", v12);
  -[UILabel setText:](self->_centeredTitleLabel, "setText:", v11);
  -[UILabel setText:](self->_badgelessCenteredTitleLabel, "setText:", v11);

  -[UILabel setText:](self->_statusLabel, "setText:", v14);
}

- (void)_setCenteredBadge:(id)a3 andCenteredTitle:(id)a4 andStatus:(id)a5
{
  PSUIBadgeView *badgeView;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  badgeView = self->_badgeView;
  v13 = a5;
  v9 = a4;
  v10 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 1);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_centeredTitleLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_badgelessCenteredTitleLabel, "setHidden:", 1);
  -[PSUIBadgeView setText:](self->_badgeView, "setText:", v10);
  -[UILabel setText:](self->_titleLabel, "setText:", v9);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_PHONE_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v12);

  -[PSUIBadgeView setText:](self->_centeredBadgeView, "setText:", v10);
  -[UILabel setText:](self->_centeredTitleLabel, "setText:", v9);
  -[UILabel setText:](self->_badgelessCenteredTitleLabel, "setText:", v9);

  -[UILabel setText:](self->_statusLabel, "setText:", v13);
}

- (void)_setBadgelessCenteredTitle:(id)a3 andStatus:(id)a4
{
  PSUIBadgeView *badgeView;
  id v7;
  void *v8;
  void *v9;
  id v10;

  badgeView = self->_badgeView;
  v10 = a4;
  v7 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 1);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredTitleLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_badgelessCenteredTitleLabel, "setHidden:", 0);
  -[PSUIBadgeView setText:](self->_badgeView, "setText:", &stru_24D5028C8);
  -[UILabel setText:](self->_titleLabel, "setText:", v7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_PHONE_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v9);

  -[PSUIBadgeView setText:](self->_centeredBadgeView, "setText:", &stru_24D5028C8);
  -[UILabel setText:](self->_centeredTitleLabel, "setText:", v7);
  -[UILabel setText:](self->_badgelessCenteredTitleLabel, "setText:", v7);

  -[UILabel setText:](self->_statusLabel, "setText:", v10);
}

- (void)_setBadgelessTitle:(id)a3 andSubtitle:(id)a4 andStatus:(id)a5
{
  PSUIBadgeView *badgeView;
  id v9;
  id v10;
  id v11;

  badgeView = self->_badgeView;
  v11 = a5;
  v9 = a4;
  v10 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 0);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredTitleLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_badgelessCenteredTitleLabel, "setHidden:", 1);
  -[PSUIBadgeView setText:](self->_badgeView, "setText:", &stru_24D5028C8);
  -[UILabel setText:](self->_titleLabel, "setText:", v10);

  -[UILabel setText:](self->_subtitleLabel, "setText:", v9);
  -[PSUIBadgeView setText:](self->_centeredBadgeView, "setText:", &stru_24D5028C8);
  -[UILabel setText:](self->_statusLabel, "setText:", v11);

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
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  PSUICellularPlanActivatingTableCell *v22;
  __CFString *v23;
  const __CFString *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PSUICellularPlanActivatingTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v25, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958], v25.receiver, v25.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v7, "carrierName");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
  }
  else
  {
    +[PSUICoreTelephonySubscriberCache sharedInstance](PSUICoreTelephonySubscriberCache, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortLabel:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "userLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedPhoneNumber:context:", v17, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v12, "length") || !-[__CFString length](v11, "length"))
  {
    if (-[__CFString length](v11, "length"))
    {
      v21 = objc_msgSend(v13, "length");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ACTIVATING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = self;
      v23 = v11;
      if (v21)
      {
        -[PSUICellularPlanActivatingTableCell _setBadgelessTitle:andSubtitle:andStatus:](self, "_setBadgelessTitle:andSubtitle:andStatus:", v11, v13, v20);
        goto LABEL_15;
      }
      v24 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ACTIVATING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = self;
      v23 = v20;
      v24 = &stru_24D5028C8;
    }
    -[PSUICellularPlanActivatingTableCell _setBadgelessCenteredTitle:andStatus:](v22, "_setBadgelessCenteredTitle:andStatus:", v23, v24);
    goto LABEL_15;
  }
  v18 = objc_msgSend(v13, "length");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ACTIVATING"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v18)
    -[PSUICellularPlanActivatingTableCell _setBadge:andTitle:andSubtitle:andStatus:](self, "_setBadge:andTitle:andSubtitle:andStatus:", v12, v11, v13, v20);
  else
    -[PSUICellularPlanActivatingTableCell _setCenteredBadge:andCenteredTitle:andStatus:](self, "_setCenteredBadge:andCenteredTitle:andStatus:", v12, v11, v20);
LABEL_15:

  -[PSUICellularPlanActivatingTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (PSUIBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (PSUIBadgeView)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setCenteredBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredBadgeView, a3);
}

- (UILabel)centeredTitleLabel
{
  return self->_centeredTitleLabel;
}

- (void)setCenteredTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centeredTitleLabel, a3);
}

- (UILabel)badgelessCenteredTitleLabel
{
  return self->_badgelessCenteredTitleLabel;
}

- (void)setBadgelessCenteredTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgelessCenteredTitleLabel, a3);
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
  objc_storeStrong((id *)&self->_badgelessCenteredTitleLabel, 0);
  objc_storeStrong((id *)&self->_centeredTitleLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
