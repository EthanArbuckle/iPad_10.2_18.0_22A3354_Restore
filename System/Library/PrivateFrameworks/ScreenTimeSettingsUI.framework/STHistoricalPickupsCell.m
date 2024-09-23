@implementation STHistoricalPickupsCell

- (STHistoricalPickupsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STHistoricalPickupsCell *v5;
  uint64_t v6;
  STHistoricalUsageViewController *historicalUsageViewController;
  void *v8;
  uint64_t v9;
  STHorizontallySegmentedView *pickupMetricsView;
  uint64_t v11;
  UILabel *firstUsedAfterPickupLabel;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)STHistoricalPickupsCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v41, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  +[STHistoricalUsageViewController historicalUsageViewControllerOfType:graphHeight:](STHistoricalUsageViewController, "historicalUsageViewControllerOfType:graphHeight:", 6, 62.0);
  v6 = objc_claimAutoreleasedReturnValue();
  historicalUsageViewController = v5->_historicalUsageViewController;
  v5->_historicalUsageViewController = (STHistoricalUsageViewController *)v6;

  -[STTableCell childViewControllers](v5, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5->_historicalUsageViewController);

  v9 = objc_opt_new();
  pickupMetricsView = v5->_pickupMetricsView;
  v5->_pickupMetricsView = (STHorizontallySegmentedView *)v9;

  -[STHorizontallySegmentedView setTranslatesAutoresizingMaskIntoConstraints:](v5->_pickupMetricsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = objc_opt_new();
  firstUsedAfterPickupLabel = v5->_firstUsedAfterPickupLabel;
  v5->_firstUsedAfterPickupLabel = (UILabel *)v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_firstUsedAfterPickupLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBDA18], "_defaultFontForTableViewStyle:isSectionHeader:", 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5->_firstUsedAfterPickupLabel, "setFont:", v13);

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FirstUsedAfterPickupTitle"), &stru_24DB8A1D0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v5->_firstUsedAfterPickupLabel, "setText:", v15);

  objc_msgSend(MEMORY[0x24BEBDA18], "_defaultTextColorForTableViewStyle:isSectionHeader:", 1, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5->_firstUsedAfterPickupLabel, "setTextColor:", v16);

  -[UILabel setNumberOfLines:](v5->_firstUsedAfterPickupLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](v5->_firstUsedAfterPickupLabel, "setLineBreakMode:", 0);
  LODWORD(v17) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](v5->_firstUsedAfterPickupLabel, "setContentHuggingPriority:forAxis:", 1, v17);
  LODWORD(v18) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_firstUsedAfterPickupLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
  -[STHistoricalPickupsCell contentView](v5, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalUsageViewController view](v5->_historicalUsageViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "addSubview:", v20);
  objc_msgSend(v19, "addSubview:", v5->_pickupMetricsView);
  _NSDictionaryOfVariableBindings(CFSTR("historicalUsageView, _pickupMetricsView"), v20, v5->_pickupMetricsView, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[historicalUsageView][_pickupMetricsView]"), 0, 0, v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  -[STTableCell contentLayoutGuide](v5, "contentLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v26);

  objc_msgSend(v23, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v29);

  objc_msgSend(v23, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontallySegmentedView leadingAnchor](v5->_pickupMetricsView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v32);

  objc_msgSend(v23, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontallySegmentedView trailingAnchor](v5->_pickupMetricsView, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v35);

  objc_msgSend(v19, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontallySegmentedView bottomAnchor](v5->_pickupMetricsView, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 11.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[STHistoricalPickupsCell setBottomConstraint:](v5, "setBottomConstraint:", v38);
  objc_msgSend(v22, "addObject:", v38);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v22);
  -[STHistoricalUsageViewController addObserver:forKeyPath:options:context:](v5->_historicalUsageViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("titleView.hasMultilineLayout"), 3, "KVOContextHistoricalPickupsCell");
  -[STHistoricalUsageViewController addObserver:forKeyPath:options:context:](v5->_historicalUsageViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("titleView.hasMultilineLayout"), 3, "KVOContextHistoricalPickupsCell");
  -[STHorizontallySegmentedView addObserver:forKeyPath:options:context:](v5->_pickupMetricsView, "addObserver:forKeyPath:options:context:", v5, CFSTR("numberOfLines"), 3, "KVOContextHistoricalPickupsCell");

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STHistoricalUsageViewController removeObserver:forKeyPath:context:](self->_historicalUsageViewController, "removeObserver:forKeyPath:context:", self, CFSTR("titleView.hasMultilineLayout"), "KVOContextHistoricalPickupsCell");
  -[STHistoricalUsageViewController removeObserver:forKeyPath:context:](self->_historicalUsageViewController, "removeObserver:forKeyPath:context:", self, CFSTR("titleView.hasMultilineLayout"), "KVOContextHistoricalPickupsCell");
  -[STHorizontallySegmentedView removeObserver:forKeyPath:context:](self->_pickupMetricsView, "removeObserver:forKeyPath:context:", self, CFSTR("numberOfLines"), "KVOContextHistoricalPickupsCell");
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalPickupsCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextHistoricalPickupsCell")
  {
    -[STHistoricalPickupsCell historicalUsageViewController](self, "historicalUsageViewController");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentViewMode")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STHistoricalPickupsCell _currentViewModeDidChangeFrom:to:](self, "_currentViewModeDidChangeFrom:to:", objc_msgSend(v12, "integerValue"), objc_msgSend(v14, "integerValue"));
    }
    else
    {
      -[STHistoricalPickupsCell historicalUsageViewController](self, "historicalUsageViewController");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("titleView.hasMultilineLayout")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v16)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v17)
        {

          v14 = 0;
        }
        -[STHistoricalPickupsCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", objc_msgSend(v12, "BOOLValue"), objc_msgSend(v14, "BOOLValue"));
      }
      else
      {
        -[STHistoricalPickupsCell pickupMetricsView](self, "pickupMetricsView");

        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("numberOfLines")))
          goto LABEL_22;
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v18)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v19)
        {

          v14 = 0;
        }
        -[STHistoricalPickupsCell _numberOfLinesDidChangeFrom:to:](self, "_numberOfLinesDidChangeFrom:to:", objc_msgSend(v12, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
      }
    }

    goto LABEL_22;
  }
  v20.receiver = self;
  v20.super_class = (Class)STHistoricalPickupsCell;
  -[STHistoricalPickupsCell observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_22:

}

- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (a3 != a4)
  {
    -[STHistoricalPickupsCell historicalUsageViewController](self, "historicalUsageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasMultilineLayout");

    -[STHistoricalPickupsCell pickupMetricsView](self, "pickupMetricsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberOfLines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    -[STHistoricalPickupsCell _handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:", a4, v8, v11);
  }
}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (a3 != a4)
  {
    v4 = a4;
    -[STHistoricalPickupsCell historicalUsageViewController](self, "historicalUsageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentViewMode");

    -[STHistoricalPickupsCell pickupMetricsView](self, "pickupMetricsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberOfLines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    -[STHistoricalPickupsCell _handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:", v7, v4, v10);
  }
}

- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (a3 != a4)
  {
    -[STHistoricalPickupsCell historicalUsageViewController](self, "historicalUsageViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "currentViewMode");
    objc_msgSend(v9, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasMultilineLayout");

    -[STHistoricalPickupsCell _handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:", v6, v8, a4);
  }
}

- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4 numberOfLines:(unint64_t)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v6 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SpecifierIdentifierHistoricalPickupsCell-%lu-%d-%lu"), a3, v6, a5);
  v12 = CFSTR("HistoricalPickupsSpecifierIdentifier");
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("HistoricalPickupsSpecifierIdentifierDidChange"), self, v11);

  -[STHistoricalPickupsCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  objc_msgSend(v9, "postNotificationName:object:", 0x24DB927F0, self);

}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STHistoricalPickupsCell;
  -[PSTableCell value](&v3, sel_value);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _UNKNOWN **v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  STSegmentItem *v33;
  void *v34;
  STSegmentItem *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  STSegmentItem *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
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
  int v77;
  void *v78;
  void *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  objc_super v87;
  _QWORD v88[3];

  v88[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_2550EA810) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalPickupsCell.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]"));

  }
  v87.receiver = self;
  v87.super_class = (Class)STHistoricalPickupsCell;
  -[PSTableCell setValue:](&v87, sel_setValue_, v6);
  -[STHistoricalPickupsCell historicalUsageViewController](self, "historicalUsageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v6);

  objc_msgSend(v6, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedUsageReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type");
  v11 = &off_24DB85000;
  v12 = 9863680000;
  v85 = v6;
  if (v10 == 1)
  {
    v83 = v9;
    v20 = v9;
    objc_msgSend(v20, "firstPickup");
    v21 = objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)v21;
    if (v21)
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "setTimeStyle:", 1);
      objc_msgSend(v23, "setDateStyle:", 0);
      objc_msgSend(v23, "setFormattingContext:", 1);
      objc_msgSend(v23, "stringFromDate:", v21);
      v24 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = &stru_24DB8A1D0;
    }
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("FirstPickupTime"), &stru_24DB8A1D0, 0);
    v38 = v22;
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v20, "totalPickups");

    v82 = (void *)v39;
    v43 = objc_msgSend(v40, "initWithFormat:locale:", v39, v41, v42, v24);
    v37 = (__CFString *)v24;
    v26 = (void *)v43;

    v36 = v38;
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("FirstPickupTitle"), &stru_24DB8A1D0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("PickupArrowBig"), v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = [STSegmentItem alloc];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = -[STSegmentItem initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:](v44, "initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:", v27, v26, v31, v28, v32);
    v13 = v81;
    goto LABEL_15;
  }
  if (!v10)
  {
    v83 = v9;
    v13 = v9;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "firstWeekday");
    objc_msgSend(v13, "dateIntervals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v13, "maxPickupDateIntervalIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v18 = objc_claimAutoreleasedReturnValue();

    v80 = (__CFString *)v18;
    if (v13)
      v19 = objc_msgSend(v14, "component:fromDate:", 512, v18) - 1;
    else
      v19 = 0;
    v25 = v15 + v19;
    objc_msgSend(v14, "standaloneWeekdaySymbols");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectAtIndexedSubscript:", (v25 - 1) % (unint64_t)objc_msgSend(v82, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MostPickupsDetailText"), &stru_24DB8A1D0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithFormat:locale:", v28, v30, v26, objc_msgSend(v13, "maxPickups"));

    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MostPickupsTitle"), &stru_24DB8A1D0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [STSegmentItem alloc];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    v36 = v14;
    v86 = -[STSegmentItem initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:](v35, "initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:", v32, v31, v34, 0, 0);

    v37 = v80;
LABEL_15:

    v12 = 0x24BEBD000uLL;
    v11 = &off_24DB85000;
    v9 = v83;
    goto LABEL_16;
  }
  v86 = 0;
LABEL_16:
  v45 = v9;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("PickupsCount"), &stru_24DB8A1D0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v45, "totalPickups");

  v51 = (void *)objc_msgSend(v48, "initWithFormat:locale:", v47, v49, v50);
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("TotalPickups"), &stru_24DB8A1D0, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_alloc((Class)v11[231]);
  objc_msgSend(*(id *)(v12 + 1208), "systemGrayColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v53, "initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:", v52, v51, v54, 0, 0);

  -[STHistoricalPickupsCell pickupMetricsView](self, "pickupMetricsView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v86;
  v88[0] = v86;
  v88[1] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setSegmentItems:", v58);

  -[STHistoricalPickupsCell contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalPickupsCell firstUsedAfterPickupLabel](self, "firstUsedAfterPickupLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "pickupsByTrustIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  objc_msgSend(v59, "subviews");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "containsObject:", v60);

  if (!v62 || (v64 & 1) != 0)
  {
    if (v62)
      v77 = 0;
    else
      v77 = v64;
    v76 = v85;
    if (v77 == 1)
    {
      objc_msgSend(v60, "removeFromSuperview");
      -[STHistoricalPickupsCell bottomConstraint](self, "bottomConstraint");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setActive:", 1);

      objc_msgSend(v59, "setNeedsUpdateConstraints");
    }
  }
  else
  {
    objc_msgSend(v59, "addSubview:", v60);
    -[STHistoricalPickupsCell bottomConstraint](self, "bottomConstraint");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 0);

    _NSDictionaryOfVariableBindings(CFSTR("pickupMetricsView, firstUsedAfterPickupLabel"), v56, v60, 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[pickupMetricsView]-14.0-[firstUsedAfterPickupLabel]-2.0-|"), 0, 0, v84);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v66, "mutableCopy");

    -[STTableCell contentLayoutGuide](self, "contentLayoutGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v70 = v55;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v72);

    objc_msgSend(v68, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v75);

    v55 = v70;
    v57 = (void *)v86;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v67);
    objc_msgSend(v59, "setNeedsUpdateConstraints");

    v76 = v85;
  }

}

- (STHistoricalUsageViewController)historicalUsageViewController
{
  return (STHistoricalUsageViewController *)objc_getProperty(self, a2, 1232, 1);
}

- (STHorizontallySegmentedView)pickupMetricsView
{
  return (STHorizontallySegmentedView *)objc_getProperty(self, a2, 1240, 1);
}

- (UILabel)firstUsedAfterPickupLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1248, 1);
}

- (NSLayoutConstraint)bottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_firstUsedAfterPickupLabel, 0);
  objc_storeStrong((id *)&self->_pickupMetricsView, 0);
  objc_storeStrong((id *)&self->_historicalUsageViewController, 0);
}

@end
