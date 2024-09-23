@implementation PSUIAppInstallCell

+ (id)specifierForAppWithDescription:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  SEL v21;
  uint8_t buf[16];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v21 = a5;
  if (!_MergedGlobals_1_2)
  {
    *(_OWORD *)buf = xmmword_24D501DD8;
    v23 = 0;
    _MergedGlobals_1_2 = _sl_dlopen();
  }
  if (_MergedGlobals_1_2)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 4, 0, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75D10]);

    objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v7, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v11, CFSTR("PSUIAppIcon"));

    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v12, CFSTR("PSUIAppName"));

    objc_msgSend(v7, "publisher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v13, CFSTR("PSUIAppPublisher"));

    objc_msgSend(v9, "setProperty:forKey:", v8, CFSTR("PSUIAppButtonTarget"));
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v21, ":");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v14, CFSTR("PSUIAppButtonAction"));

    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    if (objc_msgSend(v7, "installed"))
    {
      v15 = MEMORY[0x24BDBD1C8];
      v16 = v9;
    }
    else
    {
      v16 = v9;
      v15 = 0;
    }
    objc_msgSend(v16, "setProperty:forKey:", v15, CFSTR("PSUIAppInstalled"));
    objc_msgSend(v7, "installedLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v7, "installedLabel");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", v17, CFSTR("PSUIAppInstalledLabel"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", CFSTR("INSTALLED"), &stru_24D5028C8, CFSTR("AppInstallCell"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", v19, CFSTR("PSUIAppInstalledLabel"));

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallCell"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "MobileStoreUI Framework not available. Will not return AppInstallCell.", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (PSUIAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSUIAppInstallCell *v9;
  id v10;
  void *v11;
  uint64_t v12;
  UIImageView *iconView;
  double v14;
  void *v15;
  UILabel *v16;
  UILabel *nameLabel;
  void *v18;
  void *v19;
  double v20;
  UILabel *v21;
  UILabel *publisherLabel;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  UILabel *v27;
  UILabel *installedLabel;
  void *v29;
  void *v30;
  double v31;
  UIView *v32;
  UIView *labelContainerView;
  double v34;
  void *v35;
  void *v36;
  objc_class *v37;
  SUUIItemOfferButton *v38;
  SUUIItemOfferButton *installButton;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  SUUIItemOfferButton *v46;
  void *v47;
  uint64_t v48;
  NSMutableArray *constraints;
  uint64_t v50;
  NSMutableArray *v51;
  uint64_t v52;
  void *v53;
  NSMutableArray *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSLayoutConstraint *installedConstraint;
  void *v63;
  void *v64;
  uint64_t v65;
  NSLayoutConstraint *availableConstraint;
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
  uint64_t v100;
  NSLayoutConstraint *labelPaddingTop;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  NSLayoutConstraint *labelPaddingBottom;
  void *v107;
  uint64_t v108;
  NSLayoutConstraint *installButtonWidthConstraint;
  void *v110;
  uint64_t v111;
  NSLayoutConstraint *installButtonHeightConstraint;
  void *v113;
  void *v115;
  id v116;
  objc_super v117;
  _QWORD v118[5];
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;

  v8 = a4;
  v117.receiver = self;
  v117.super_class = (Class)PSUIAppInstallCell;
  v116 = a5;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v117, sel_initWithStyle_reuseIdentifier_specifier_, a3, v8);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppIcon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithImage:", v11);
    iconView = v9->_iconView;
    v9->_iconView = (UIImageView *)v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v14) = 1144766464;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v9->_iconView, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v9->_iconView);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v9->_nameLabel;
    v9->_nameLabel = v16;

    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_nameLabel, "setText:", v18);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_nameLabel, "setFont:", v19);

    -[UILabel setOpaque:](v9->_nameLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v9->_nameLabel, "setBackgroundColor:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v20) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v9->_nameLabel, "setContentHuggingPriority:forAxis:", 1, v20);
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    publisherLabel = v9->_publisherLabel;
    v9->_publisherLabel = v21;

    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppPublisher"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_publisherLabel, "setText:", v23);

    v24 = *MEMORY[0x24BEBE1F0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_publisherLabel, "setFont:", v25);

    -[UILabel setOpaque:](v9->_publisherLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v9->_publisherLabel, "setBackgroundColor:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_publisherLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v26) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v9->_publisherLabel, "setContentHuggingPriority:forAxis:", 1, v26);
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    installedLabel = v9->_installedLabel;
    v9->_installedLabel = v27;

    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppInstalledLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_installedLabel, "setText:", v29);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_installedLabel, "setFont:", v30);

    -[UILabel setOpaque:](v9->_installedLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v9->_installedLabel, "setBackgroundColor:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_installedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v31) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v9->_installedLabel, "setContentHuggingPriority:forAxis:", 1, v31);
    v32 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    labelContainerView = v9->_labelContainerView;
    v9->_labelContainerView = v32;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_labelContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v9->_labelContainerView, "addSubview:", v9->_nameLabel);
    -[UIView addSubview:](v9->_labelContainerView, "addSubview:", v9->_publisherLabel);
    -[UIView addSubview:](v9->_labelContainerView, "addSubview:", v9->_installedLabel);
    LODWORD(v34) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v9->_labelContainerView, "setContentHuggingPriority:forAxis:", 1, v34);
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v9->_labelContainerView);

    v119 = 0;
    v120 = &v119;
    v121 = 0x2050000000;
    v36 = (void *)qword_253E97110;
    v122 = qword_253E97110;
    if (!qword_253E97110)
    {
      v118[0] = MEMORY[0x24BDAC760];
      v118[1] = 3221225472;
      v118[2] = __getSUUIItemOfferButtonClass_block_invoke;
      v118[3] = &unk_24D5018D0;
      v118[4] = &v119;
      __getSUUIItemOfferButtonClass_block_invoke((uint64_t)v118);
      v36 = (void *)v120[3];
    }
    v37 = objc_retainAutorelease(v36);
    _Block_object_dispose(&v119, 8);
    v38 = (SUUIItemOfferButton *)objc_alloc_init(v37);
    installButton = v9->_installButton;
    v9->_installButton = v38;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("OPEN"), &stru_24D5028C8, CFSTR("AppInstallCell"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setTitle:](v9->_installButton, "setTitle:", v41);

    -[SUUIItemOfferButton setEnabled:](v9->_installButton, "setEnabled:", 1);
    -[SUUIItemOfferButton setAlpha:](v9->_installButton, "setAlpha:", 1.0);
    LODWORD(v42) = -0.5;
    -[SUUIItemOfferButton setCharge:](v9->_installButton, "setCharge:", v42);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setBackgroundColor:](v9->_installButton, "setBackgroundColor:", v43);

    -[SUUIItemOfferButton setTranslatesAutoresizingMaskIntoConstraints:](v9->_installButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v9->_installButton);

    v118[0] = 0;
    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppButtonAction"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "getValue:", v118);

    v46 = v9->_installButton;
    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppButtonTarget"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton addTarget:action:forControlEvents:](v46, "addTarget:action:forControlEvents:", v47, v118[0], 64);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v48 = objc_claimAutoreleasedReturnValue();
    constraints = v9->_constraints;
    v9->_constraints = (NSMutableArray *)v48;

    _NSDictionaryOfVariableBindings(CFSTR("_iconView, _nameLabel, _publisherLabel, _installedLabel, _labelContainerView, _installButton"), v9->_iconView, v9->_nameLabel, v9->_publisherLabel, v9->_installedLabel, v9->_labelContainerView, v9->_installButton, 0);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v9->_constraints;
    v115 = (void *)v50;
    v52 = v50;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-15-[_iconView]-8-[_labelContainerView]-(>=10)-[_installButton]-12-|"), 0, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v51, "addObjectsFromArray:", v53);

    v54 = v9->_constraints;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_nameLabel]-2-[_publisherLabel]-3-[_installedLabel]"), 0, 0, v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v54, "addObjectsFromArray:", v55);

    -[UIImageView widthAnchor](v9->_iconView, "widthAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v9->_iconView, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:multiplier:", v57, 1.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    -[UILabel bottomAnchor](v9->_installedLabel, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v9->_labelContainerView, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = objc_claimAutoreleasedReturnValue();
    installedConstraint = v9->_installedConstraint;
    v9->_installedConstraint = (NSLayoutConstraint *)v61;

    -[NSLayoutConstraint setActive:](v9->_installedConstraint, "setActive:", 1);
    -[UILabel bottomAnchor](v9->_publisherLabel, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v9->_labelContainerView, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = objc_claimAutoreleasedReturnValue();
    availableConstraint = v9->_availableConstraint;
    v9->_availableConstraint = (NSLayoutConstraint *)v65;

    -[NSLayoutConstraint setActive:](v9->_availableConstraint, "setActive:", 0);
    -[UIImageView centerYAnchor](v9->_iconView, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[UIView centerYAnchor](v9->_labelContainerView, "centerYAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "centerYAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    -[SUUIItemOfferButton centerYAnchor](v9->_installButton, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "centerYAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setActive:", 1);

    -[UIView leadingAnchor](v9->_labelContainerView, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v9->_nameLabel, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setActive:", 1);

    -[UIView leadingAnchor](v9->_labelContainerView, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v9->_publisherLabel, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setActive:", 1);

    -[UIView leadingAnchor](v9->_labelContainerView, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v9->_installedLabel, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setActive:", 1);

    -[UIView trailingAnchor](v9->_labelContainerView, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v9->_nameLabel, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintGreaterThanOrEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setActive:", 1);

    -[UIView trailingAnchor](v9->_labelContainerView, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v9->_publisherLabel, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintGreaterThanOrEqualToAnchor:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setActive:", 1);

    -[UIView trailingAnchor](v9->_labelContainerView, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v9->_installedLabel, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintGreaterThanOrEqualToAnchor:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setActive:", 1);

    -[UIView topAnchor](v9->_labelContainerView, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "topAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintGreaterThanOrEqualToAnchor:constant:", v99, 15.0);
    v100 = objc_claimAutoreleasedReturnValue();
    labelPaddingTop = v9->_labelPaddingTop;
    v9->_labelPaddingTop = (NSLayoutConstraint *)v100;

    -[NSLayoutConstraint setActive:](v9->_labelPaddingTop, "setActive:", 1);
    -[UIView bottomAnchor](v9->_labelContainerView, "bottomAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAppInstallCell contentView](v9, "contentView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintGreaterThanOrEqualToAnchor:constant:", v104, -15.0);
    v105 = objc_claimAutoreleasedReturnValue();
    labelPaddingBottom = v9->_labelPaddingBottom;
    v9->_labelPaddingBottom = (NSLayoutConstraint *)v105;

    -[NSLayoutConstraint setActive:](v9->_labelPaddingBottom, "setActive:", 1);
    -[SUUIItemOfferButton widthAnchor](v9->_installButton, "widthAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToConstant:", 59.0);
    v108 = objc_claimAutoreleasedReturnValue();
    installButtonWidthConstraint = v9->_installButtonWidthConstraint;
    v9->_installButtonWidthConstraint = (NSLayoutConstraint *)v108;

    -[SUUIItemOfferButton heightAnchor](v9->_installButton, "heightAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToConstant:", 26.0);
    v111 = objc_claimAutoreleasedReturnValue();
    installButtonHeightConstraint = v9->_installButtonHeightConstraint;
    v9->_installButtonHeightConstraint = (NSLayoutConstraint *)v111;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v9->_constraints);
    objc_msgSend(v116, "propertyForKey:", CFSTR("PSUIAppInstalled"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v9->_installState = v113 != 0;
    -[PSUIAppInstallCell _updateCellWithInstallState](v9, "_updateCellWithInstallState");

  }
  return v9;
}

- (void)setInstallState:(int)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallCell getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUIAppInstallCell setInstallState:]";
    v8 = 1024;
    v9 = a3;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s setting app install state to %i", (uint8_t *)&v6, 0x12u);
  }

  self->_installState = a3;
  -[PSUIAppInstallCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSUIAppInstallCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateConstraints
{
  NSObject *v3;
  int *v4;
  int installState;
  int *v6;
  double v7;
  double v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallCell getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PSUIAppInstallCell updateConstraints]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = &OBJC_IVAR___PSUIAppInstallCell__installedConstraint;
  installState = self->_installState;
  if (!installState)
  {
    v6 = &OBJC_IVAR___PSUIAppInstallCell__availableConstraint;
    v7 = -21.0;
    v8 = 21.0;
    goto LABEL_7;
  }
  if (installState == 1)
  {
    v6 = &OBJC_IVAR___PSUIAppInstallCell__installedConstraint;
    v4 = &OBJC_IVAR___PSUIAppInstallCell__availableConstraint;
    v7 = -15.0;
    v8 = 15.0;
LABEL_7:
    -[NSLayoutConstraint setConstant:](self->_labelPaddingTop, "setConstant:", v8);
    -[NSLayoutConstraint setConstant:](self->_labelPaddingBottom, "setConstant:", v7);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v4), "setActive:", 0);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v6), "setActive:", 1);
  }
  v9.receiver = self;
  v9.super_class = (Class)PSUIAppInstallCell;
  -[PSUIAppInstallCell updateConstraints](&v9, sel_updateConstraints);
}

- (void)layoutSubviews
{
  NSObject *v3;
  double v4;
  double v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallCell getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[PSUIAppInstallCell layoutSubviews]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)PSUIAppInstallCell;
  -[PSTableCell layoutSubviews](&v6, sel_layoutSubviews);
  -[PSUIAppInstallCell _updateCellWithInstallState](self, "_updateCellWithInstallState");
  if (!-[NSLayoutConstraint isActive](self->_installButtonWidthConstraint, "isActive"))
  {
    -[SUUIItemOfferButton sizeToFit](self->_installButton, "sizeToFit");
    -[SUUIItemOfferButton bounds](self->_installButton, "bounds");
    -[NSLayoutConstraint setConstant:](self->_installButtonWidthConstraint, "setConstant:", v4);
    -[SUUIItemOfferButton bounds](self->_installButton, "bounds");
    -[NSLayoutConstraint setConstant:](self->_installButtonHeightConstraint, "setConstant:", v5);
    -[NSLayoutConstraint setActive:](self->_installButtonWidthConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](self->_installButtonHeightConstraint, "setActive:", 1);
  }
}

- (void)_updateCellWithInstallState
{
  NSObject *v3;
  int installState;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallCell getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    installState = self->_installState;
    v9 = 136315394;
    v10 = "-[PSUIAppInstallCell _updateCellWithInstallState]";
    v11 = 1024;
    v12 = installState;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s updating UI view state with install state %i", (uint8_t *)&v9, 0x12u);
  }

  v5 = self->_installState;
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OPEN"), &stru_24D5028C8, CFSTR("AppInstallCell"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    if (v5)
      return;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INSTALL"), &stru_24D5028C8, CFSTR("AppInstallCell"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  -[SUUIItemOfferButton setTitle:](self->_installButton, "setTitle:", v7);

  -[UILabel setHidden:](self->_installedLabel, "setHidden:", v8);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstallCell"));
}

- (int)installState
{
  return self->_installState;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)publisherLabel
{
  return self->_publisherLabel;
}

- (void)setPublisherLabel:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLabel, a3);
}

- (UILabel)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
  objc_storeStrong((id *)&self->_installedLabel, a3);
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (void)setLabelContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainerView, a3);
}

- (NSLayoutConstraint)installedConstraint
{
  return self->_installedConstraint;
}

- (void)setInstalledConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_installedConstraint, a3);
}

- (NSLayoutConstraint)availableConstraint
{
  return self->_availableConstraint;
}

- (void)setAvailableConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_availableConstraint, a3);
}

- (NSLayoutConstraint)labelPaddingTop
{
  return self->_labelPaddingTop;
}

- (void)setLabelPaddingTop:(id)a3
{
  objc_storeStrong((id *)&self->_labelPaddingTop, a3);
}

- (NSLayoutConstraint)labelPaddingBottom
{
  return self->_labelPaddingBottom;
}

- (void)setLabelPaddingBottom:(id)a3
{
  objc_storeStrong((id *)&self->_labelPaddingBottom, a3);
}

- (SUUIItemOfferButton)installButton
{
  return self->_installButton;
}

- (void)setInstallButton:(id)a3
{
  objc_storeStrong((id *)&self->_installButton, a3);
}

- (NSLayoutConstraint)installButtonWidthConstraint
{
  return self->_installButtonWidthConstraint;
}

- (void)setInstallButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_installButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)installButtonHeightConstraint
{
  return self->_installButtonHeightConstraint;
}

- (void)setInstallButtonHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_installButtonHeightConstraint, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_installButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_installButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_installButton, 0);
  objc_storeStrong((id *)&self->_labelPaddingBottom, 0);
  objc_storeStrong((id *)&self->_labelPaddingTop, 0);
  objc_storeStrong((id *)&self->_availableConstraint, 0);
  objc_storeStrong((id *)&self->_installedConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_installedLabel, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
