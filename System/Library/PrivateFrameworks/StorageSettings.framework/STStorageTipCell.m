@implementation STStorageTipCell

- (STStorageTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  STStorageTipCell *v9;
  STStorageTipCell *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  UILabel *titleLabel;
  void *v19;
  uint64_t v20;
  UIImageView *appIconView;
  uint64_t v22;
  UIButton *enableButton;
  UIButton *v24;
  void *v25;
  UIButton *v26;
  void *v27;
  uint64_t v28;
  UIActivityIndicatorView *spinner;
  double v30;
  uint64_t v31;
  UIImageView *checkIconView;
  void *v33;
  void *v34;
  uint64_t v35;
  UILabel *progressLabel;
  void *v37;
  void *v38;
  STStorageProgressView *v39;
  uint64_t v40;
  STStorageProgressView *progressView;
  void *v42;
  objc_super v44;
  _QWORD v45[8];

  v45[7] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v44.receiver = self;
  v44.super_class = (Class)STStorageTipCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v44, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[STStorageTipCell contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDF6B68]);
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], v14, v15, v16);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v17;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_titleLabel, "setFont:", v19);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_titleLabel, "setAccessibilityIdentifier:", CFSTR("Title"));
    -[UILabel setAllowsDefaultTighteningForTruncation:](v10->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v11, "addSubview:", v10->_titleLabel);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v13, v14, v15, v16);
    appIconView = v10->_appIconView;
    v10->_appIconView = (UIImageView *)v20;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v10->_appIconView, "setAccessibilityIdentifier:", CFSTR("Icon"));
    -[UIImageView setContentMode:](v10->_appIconView, "setContentMode:", 1);
    objc_msgSend(v11, "addSubview:", v10->_appIconView);
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v22 = objc_claimAutoreleasedReturnValue();
    enableButton = v10->_enableButton;
    v10->_enableButton = (UIButton *)v22;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_enableButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v10->_enableButton, "setAccessibilityIdentifier:", CFSTR("Switch"));
    v24 = v10->_enableButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v24, "setTitleColor:forState:", v25, 0);

    v26 = v10->_enableButton;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v26, "setTitleColor:forState:", v27, 2);

    -[UIButton addTarget:action:forControlEvents:](v10->_enableButton, "addTarget:action:forControlEvents:", v10, sel__activateOption, 0x2000);
    -[UIButton setEnabled:](v10->_enableButton, "setEnabled:", 1);
    -[UIButton setHidden:](v10->_enableButton, "setHidden:", 1);
    objc_msgSend(v11, "addSubview:", v10->_enableButton);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    spinner = v10->_spinner;
    v10->_spinner = (UIActivityIndicatorView *)v28;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v10->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setAccessibilityIdentifier:](v10->_spinner, "setAccessibilityIdentifier:", CFSTR("Spinner"));
    -[UIActivityIndicatorView setHidesWhenStopped:](v10->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView sizeToFit](v10->_spinner, "sizeToFit");
    -[UIActivityIndicatorView bounds](v10->_spinner, "bounds");
    v10->_nativeSpinnerWidth = v30;
    objc_msgSend(v11, "addSubview:", v10->_spinner);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v13, v14, v15, v16);
    checkIconView = v10->_checkIconView;
    v10->_checkIconView = (UIImageView *)v31;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_checkIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v10->_checkIconView, "setAccessibilityIdentifier:", CFSTR("CheckIcon"));
    -[UIImageView setContentMode:](v10->_checkIconView, "setContentMode:", 1);
    -[UIImageView setHidden:](v10->_checkIconView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v10->_checkIconView, "setImage:", v33);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10->_checkIconView, "setTintColor:", v34);

    objc_msgSend(v11, "addSubview:", v10->_checkIconView);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v13, v14, v15, v16);
    progressLabel = v10->_progressLabel;
    v10->_progressLabel = (UILabel *)v35;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_progressLabel, "setFont:", v37);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_progressLabel, "setTextColor:", v38);

    -[UILabel setHidden:](v10->_progressLabel, "setHidden:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_progressLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_progressLabel, "setAccessibilityIdentifier:", CFSTR("Progress"));
    -[UILabel setNumberOfLines:](v10->_progressLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v10->_progressLabel, "setLineBreakMode:", 4);
    objc_msgSend(v11, "addSubview:", v10->_progressLabel);
    v39 = [STStorageProgressView alloc];
    -[UIActivityIndicatorView frame](v10->_spinner, "frame");
    v40 = -[STStorageProgressView initWithFrame:](v39, "initWithFrame:");
    progressView = v10->_progressView;
    v10->_progressView = (STStorageProgressView *)v40;

    -[STStorageProgressView setPercent:](v10->_progressView, "setPercent:", 0.0);
    -[STStorageProgressView setHidden:](v10->_progressView, "setHidden:", 1);
    -[STStorageProgressView setTranslatesAutoresizingMaskIntoConstraints:](v10->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STStorageProgressView setAccessibilityIdentifier:](v10->_progressView, "setAccessibilityIdentifier:", CFSTR("ProgressIndicator"));
    -[STStorageProgressView sizeToFit](v10->_progressView, "sizeToFit");
    objc_msgSend(v11, "addSubview:", v10->_progressView);
    v45[0] = v10->_titleLabel;
    v45[1] = v10->_appIconView;
    v45[2] = v10->_enableButton;
    v45[3] = v10->_spinner;
    v45[4] = v10->_checkIconView;
    v45[5] = v10->_progressLabel;
    v45[6] = v10->_progressView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityElements:", v42);

    -[STStorageTipCell setSeparatorInset:](v10, "setSeparatorInset:", 0.0, 58.0, 0.0, 0.0);
    -[STStorageTipCell refreshCellContentsWithSpecifier:](v10, "refreshCellContentsWithSpecifier:", v8);

  }
  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)STStorageTipCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v27, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v5);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stIcon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIImageView setImage:](self->_appIconView, "setImage:", v6);
  }
  else
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("stRepresentedApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __53__STStorageTipCell_refreshCellContentsWithSpecifier___block_invoke;
      v26[3] = &unk_24C756978;
      v26[4] = self;
      STLoadTableIconForAppID(v7, v26);
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDF6AC8];
      -[UIImageView traitCollection](self->_appIconView, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("info.circle"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_appIconView, "setImage:", v10);

    }
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("stEnableTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  v13 = v11;
  if (!v11)
  {
    STFrameworkLocStr(CFSTR("ST_ENABLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v15);

  if (!v11)
  -[UIButton setAttributedTitle:forState:](self->_enableButton, "setAttributedTitle:forState:", v16, 0);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stTipKind"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isOption = objc_msgSend(v17, "isEqualToString:", CFSTR("stOptionTip"));

  if (self->_isOption)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("stPercent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    self->_percent = *(float *)&v19;
    if (*(float *)&v19 > 1.0)
    {
      self->_percent = 1.0;
      LODWORD(v19) = 1.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      *(float *)&v19 = self->_percent;
      v18 = (void *)v20;
    }
    if (*(float *)&v19 == 0.0 || *(float *)&v19 == 1.0)
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      -[STStorageProgressView setHidden:](self->_progressView, "setHidden:", 1);
      -[UILabel setHidden:](self->_progressLabel, "setHidden:", 1);
      -[UILabel setText:](self->_progressLabel, "setText:", 0);
    }
    else if (*(float *)&v19 >= 0.0)
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      -[STStorageProgressView setPercent:](self->_progressView, "setPercent:", self->_percent);
      -[STStorageProgressView setHidden:](self->_progressView, "setHidden:", 0);
      v23 = PercentString_onceToken;
      v24 = v18;
      if (v23 != -1)
        dispatch_once(&PercentString_onceToken, &__block_literal_global_4);
      objc_msgSend((id)PercentString__formatter, "stringFromNumber:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel setText:](self->_progressLabel, "setText:", v25);
      -[UILabel setHidden:](self->_progressLabel, "setHidden:", 0);
    }
    else
    {
      -[STStorageProgressView setHidden:](self->_progressView, "setHidden:", 1);
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
      objc_msgSend(v4, "propertyForKey:", CFSTR("stActivating"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_progressLabel, "setText:", v21);

      -[UILabel text](self->_progressLabel, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setHidden:](self->_progressLabel, "setHidden:", objc_msgSend(v22, "length") == 0);

    }
    -[UIButton setHidden:](self->_enableButton, "setHidden:", self->_percent != 0.0);
    -[UIImageView setHidden:](self->_checkIconView, "setHidden:", self->_percent < 1.0);

  }
  -[STStorageTipCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[STStorageTipCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)updateConstraints
{
  void *v3;
  NSString *v4;
  double titleWidth;
  double enableWidth;
  double progressWidth;
  double v8;
  double v9;
  double v10;
  NSString *hformat;
  NSString *h2format;
  NSString *v13;
  NSString *v14;
  float percent;
  NSString *v16;
  __CFString *v17;
  float v18;
  __CFString *v19;
  double v20;
  void *v21;
  void *v22;
  double nativeSpinnerWidth;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *v28;
  NSMutableArray *constraints;
  NSMutableArray *v30;
  void *v31;
  NSString *v32;
  NSMutableArray *v33;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  NSMutableArray *v39;
  void *v40;
  NSMutableArray *v41;
  void *v42;
  NSMutableArray *v43;
  void *v44;
  void *v45;
  NSMutableArray *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  void *v51;
  NSMutableArray *v52;
  void *v53;
  NSMutableArray *v54;
  void *v55;
  void *v56;
  NSMutableArray *v57;
  void *v58;
  NSMutableArray *v59;
  void *v60;
  NSMutableArray *v61;
  void *v62;
  NSMutableArray *v63;
  void *v64;
  NSMutableArray *v65;
  void *v66;
  NSMutableArray *v67;
  void *v68;
  void *v69;
  NSString *v70;
  NSString *v71;
  _BOOL4 IsAccessibilityCategory;
  objc_super v73;

  -[STStorageTipCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v70 = self->_hformat;
  v71 = self->_h2format;
  titleWidth = self->_titleWidth;
  enableWidth = self->_enableWidth;
  progressWidth = self->_progressWidth;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UIButton sizeToFit](self->_enableButton, "sizeToFit");
  -[UILabel sizeToFit](self->_progressLabel, "sizeToFit");
  -[UILabel bounds](self->_titleLabel, "bounds");
  self->_titleWidth = v8;
  -[UIButton bounds](self->_enableButton, "bounds");
  self->_enableWidth = v9;
  -[UILabel bounds](self->_progressLabel, "bounds");
  self->_progressWidth = v10;
  hformat = self->_hformat;
  self->_hformat = (NSString *)CFSTR("H:|-59-[_titleLabel]-15-|");

  h2format = self->_h2format;
  self->_h2format = 0;

  if (IsAccessibilityCategory)
  {
    v14 = v70;
    v13 = v71;
    if (!self->_isOption)
      goto LABEL_21;
    percent = self->_percent;
    if (percent == 0.0)
    {
      v16 = self->_h2format;
      v17 = CFSTR("H:|-59-[_enableButton(==enableWidth)]");
    }
    else if (percent >= 1.0)
    {
      v16 = self->_h2format;
      v17 = CFSTR("H:|-59-[_checkIconView(==56)]");
    }
    else
    {
      v16 = self->_h2format;
      if (percent >= 0.0)
        v17 = CFSTR("H:|-59-[_progressLabel(==progressWidth)]-6-[_progressView(==48)]");
      else
        v17 = CFSTR("H:|-59-[_progressLabel(==progressWidth)]-6-[_spinner(==spinnerWidth)]");
    }
    self->_h2format = &v17->isa;
  }
  else
  {
    v14 = v70;
    v13 = v71;
    if (!self->_isOption)
      goto LABEL_21;
    v18 = self->_percent;
    if (v18 == 0.0)
    {
      v16 = self->_hformat;
      v19 = CFSTR("H:|-59-[_titleLabel]-6-[_enableButton(==enableWidth)]-15-|");
    }
    else if (v18 >= 1.0)
    {
      v16 = self->_hformat;
      v19 = CFSTR("H:|-59-[_titleLabel]-6-[_checkIconView(==28)]-15-|");
    }
    else
    {
      v16 = self->_hformat;
      if (v18 >= 0.0)
        v19 = CFSTR("H:|-59-[_titleLabel]-6-[_progressLabel(==progressWidth)]-6-[_progressView(==24)]-15-|");
      else
        v19 = CFSTR("H:|-59-[_titleLabel]-6-[_progressLabel(==progressWidth)]-6-[_spinner(==spinnerWidth)]-15-|");
    }
    self->_hformat = &v19->isa;
  }

LABEL_21:
  if (v14 != self->_hformat)
  {
    v20 = self->_titleWidth;
    goto LABEL_23;
  }
  v20 = self->_titleWidth;
  if (v13 != self->_h2format
    || titleWidth != v20
    || enableWidth != self->_enableWidth
    || progressWidth != self->_progressWidth)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_enableWidth);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    nativeSpinnerWidth = self->_nativeSpinnerWidth;
    if (IsAccessibilityCategory)
      nativeSpinnerWidth = nativeSpinnerWidth + nativeSpinnerWidth;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", nativeSpinnerWidth);
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progressWidth);
    v25 = objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("_appIconView, _titleLabel, _enableButton, _spinner, _checkIconView, _progressLabel, _progressView"), self->_appIconView, self->_titleLabel, self->_enableButton, self->_spinner, self->_checkIconView, self->_progressLabel, self->_progressView, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)v25;
    v69 = (void *)v24;
    _NSDictionaryOfVariableBindings(CFSTR("titleWidth, spinnerWidth, enableWidth, progressWidth"), v21, v24, v22, v25, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_constraints, "count"))
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    constraints = self->_constraints;
    self->_constraints = v28;

    v30 = self->_constraints;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", self->_hformat, 0, v27, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", v31);

    v32 = self->_h2format;
    if (v32)
    {
      v33 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v32, 0, v27, v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v33, "addObjectsFromArray:", v34);

    }
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    v35 = self->_constraints;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-15-[_appIconView(==29)]"), 0, 0, v26);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v36);

    v37 = self->_constraints;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_appIconView, 4, 0, self->_titleLabel, 12, 1.0, 2.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v37, "addObject:", v38);

      v39 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_appIconView(==29)]-(>=8)-|"), 0, 0, v26);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v39, "addObjectsFromArray:", v40);

      v41 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-13-[_titleLabel]-(>=8)-|"), 0, 0, v26);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v41, "addObjectsFromArray:", v42);

      if ((-[UILabel isHidden](self->_progressLabel, "isHidden") & 1) == 0)
      {
        v43 = self->_constraints;
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-13-[_titleLabel]-1-[_progressLabel]-(>=8)-|"), 0, 0, v26);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v43, "addObjectsFromArray:", v44);

      }
      v45 = (void *)v27;
      if ((-[UIActivityIndicatorView isHidden](self->_spinner, "isHidden") & 1) == 0)
      {
        v46 = self->_constraints;
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_titleLabel]-8-[_spinner]-(>=8)-|"), 0, 0, v26);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v46, "addObjectsFromArray:", v47);

      }
      v14 = v70;
      v49 = v68;
      v48 = v21;
      if ((-[STStorageProgressView isHidden](self->_progressView, "isHidden") & 1) == 0)
      {
        v50 = self->_constraints;
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_titleLabel]-6-[_progressView(==48)]-(>=8)-|"), 0, v45, v26);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v51);

      }
      if ((-[UIButton isHidden](self->_enableButton, "isHidden") & 1) == 0)
      {
        v52 = self->_constraints;
        objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_titleLabel]-1-[_enableButton]-(>=8)-|"), 0, 0, v26);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v52, "addObjectsFromArray:", v53);

      }
      if ((-[UIImageView isHidden](self->_checkIconView, "isHidden") & 1) != 0)
        goto LABEL_42;
      v54 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_titleLabel]-10-[_checkIconView(==56)]-(>=8)-|"), 0, 0, v26);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v54, "addObjectsFromArray:", v55);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-7-[_appIconView(==29)]-(>=8)-|"), 0, 0, v26);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v37, "addObjectsFromArray:", v56);

      v57 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-13-[_titleLabel]-(>=8)-|"), 0, 0, v26);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v57, "addObjectsFromArray:", v58);

      v59 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-14-[_progressLabel]"), 0, 0, v26);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v59, "addObjectsFromArray:", v60);

      v61 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-13-[_spinner]"), 0, 0, v26);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v61, "addObjectsFromArray:", v62);

      v63 = self->_constraints;
      v45 = (void *)v27;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-10-[_progressView(==24)]"), 0, v27, v26);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v63, "addObjectsFromArray:", v64);

      v65 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-7-[_enableButton]"), 0, 0, v26);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v65, "addObjectsFromArray:", v66);

      v67 = self->_constraints;
      objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-10-[_checkIconView(==28)]"), 0, 0, v26);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](v67, "addObjectsFromArray:", v55);
      v14 = v70;
      v49 = v68;
      v48 = v21;
    }

LABEL_42:
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);

    v13 = v71;
  }
  v73.receiver = self;
  v73.super_class = (Class)STStorageTipCell;
  -[STStorageTipCell updateConstraints](&v73, sel_updateConstraints);

}

uint64_t __53__STStorageTipCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setImage:", a2);
}

- (void)_activateOption
{
  void *v2;
  id v3;

  -[PSTableCell specifier](self, "specifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSetterWithValue:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_h2format, 0);
  objc_storeStrong((id *)&self->_hformat, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_storeStrong((id *)&self->_checkIconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
