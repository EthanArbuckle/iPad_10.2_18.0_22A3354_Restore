@implementation ICQBackupStatusView

- (ICQBackupStatusView)initWithSpecifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  ICQBackupStatusView *v7;
  NSMutableSet *v8;
  NSMutableSet *visibleSubviews;
  uint64_t v10;
  UIActivityIndicatorView *spinner;
  uint64_t v12;
  UIProgressView *progressBar;
  uint64_t v14;
  UILabel *statusLabel;
  uint64_t v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  uint64_t v22;
  UILabel *timeRemainingLabel;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UILabel *backupIssueLabel;
  UILabel *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  uint64_t v40;
  UILabel *lastBackupLabel;
  UILabel *v42;
  void *v43;
  UILabel *v44;
  void *v45;
  UILabel *v46;
  void *v47;
  void *v48;
  void *v49;
  NSDateComponentsFormatter *v50;
  NSDateComponentsFormatter *durationFormatter;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)ICQBackupStatusView;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[ICQBackupStatusView initWithFrame:](&v53, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    visibleSubviews = v7->_visibleSubviews;
    v7->_visibleSubviews = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v7->_spinner;
    v7->_spinner = (UIActivityIndicatorView *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD8A0]), "initWithProgressViewStyle:", 0);
    progressBar = v7->_progressBar;
    v7->_progressBar = (UIProgressView *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    statusLabel = v7->_statusLabel;
    v7->_statusLabel = (UILabel *)v14;

    v16 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_statusLabel, "setFont:", v17);

    -[UILabel setAdjustsFontForContentSizeCategory:](v7->_statusLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v18 = v7->_statusLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    v20 = v7->_statusLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v20, "setBackgroundColor:", v21);

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    timeRemainingLabel = v7->_timeRemainingLabel;
    v7->_timeRemainingLabel = (UILabel *)v22;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_timeRemainingLabel, "setFont:", v24);

    -[UILabel setAdjustsFontForContentSizeCategory:](v7->_timeRemainingLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v25 = v7->_timeRemainingLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    -[UILabel setTextAlignment:](v7->_timeRemainingLabel, "setTextAlignment:", 1);
    v27 = v7->_timeRemainingLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v27, "setBackgroundColor:", v28);

    v29 = v7->_timeRemainingLabel;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ESTIMATING_TIME_REMAINING"), &stru_24E400750, CFSTR("Backup"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v29, "setText:", v31);

    v32 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    backupIssueLabel = v7->_backupIssueLabel;
    v7->_backupIssueLabel = (UILabel *)v32;

    v34 = v7->_backupIssueLabel;
    PreferencesTableViewFooterFont();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v34, "setFont:", v35);

    v36 = v7->_backupIssueLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v36, "setTextColor:", v37);

    -[UILabel setTextAlignment:](v7->_backupIssueLabel, "setTextAlignment:", 4);
    v38 = v7->_backupIssueLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v38, "setBackgroundColor:", v39);

    -[UILabel setNumberOfLines:](v7->_backupIssueLabel, "setNumberOfLines:", 0);
    v40 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    lastBackupLabel = v7->_lastBackupLabel;
    v7->_lastBackupLabel = (UILabel *)v40;

    v42 = v7->_lastBackupLabel;
    PreferencesTableViewFooterFont();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v42, "setFont:", v43);

    v44 = v7->_lastBackupLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v44, "setTextColor:", v45);

    -[UILabel setTextAlignment:](v7->_lastBackupLabel, "setTextAlignment:", 4);
    v46 = v7->_lastBackupLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v46, "setBackgroundColor:", v47);

    -[UILabel setNumberOfLines:](v7->_lastBackupLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("DETERMINING_LAST_BACKUP"), &stru_24E400750, CFSTR("Backup"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBackupStatusView setLastBackupText:](v7, "setLastBackupText:", v49);

    v50 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    durationFormatter = v7->_durationFormatter;
    v7->_durationFormatter = v50;

    -[NSDateComponentsFormatter setUnitsStyle:](v7->_durationFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setAllowedUnits:](v7->_durationFormatter, "setAllowedUnits:", 240);
    -[NSDateComponentsFormatter setMaximumUnitCount:](v7->_durationFormatter, "setMaximumUnitCount:", 1);
    -[NSDateComponentsFormatter setIncludesApproximationPhrase:](v7->_durationFormatter, "setIncludesApproximationPhrase:", 1);
    -[NSDateComponentsFormatter setIncludesTimeRemainingPhrase:](v7->_durationFormatter, "setIncludesTimeRemainingPhrase:", 1);
    -[NSDateComponentsFormatter setFormattingContext:](v7->_durationFormatter, "setFormattingContext:", 2);
  }
  return v7;
}

- (void)didMoveToSuperview
{
  double v3;
  double v4;

  -[ICQBackupStatusView bounds](self, "bounds");
  if (v4 == *MEMORY[0x24BDBF148] && v3 == *(double *)(MEMORY[0x24BDBF148] + 8))
    -[ICQBackupStatusView sizeToFit](self, "sizeToFit");
}

- (void)setLastBackupText:(id)a3
{
  -[UILabel setText:](self->_lastBackupLabel, "setText:", a3);
  -[ICQBackupStatusView sizeToFit](self, "sizeToFit");
}

- (void)updateStatus:(id)a3
{
  -[UILabel setText:](self->_statusLabel, "setText:", a3);
  -[UILabel sizeToFit](self->_statusLabel, "sizeToFit");
}

- (void)_sizeToFitWidth:(double)a3 inTableView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;

  v6 = a4;
  if (!v6)
    -[ICQBackupStatusView _sizeToFitWidth:inTableView:].cold.1();
  v45 = v6;
  PSTextViewInsets();
  v8 = v7;
  objc_msgSend(v45, "_backgroundInset");
  v10 = v9;
  if (PSIsN56())
  {
    PSTableViewSideInset();
  }
  else
  {
    PreferencesTableViewCellLeftPad();
    v11 = v12;
  }
  v13 = v10 + v11 - v8;
  -[ICQBackupStatusView frame](self, "frame");
  v44 = v14;
  v16 = v15;
  v17 = -[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:", self->_backupIssueLabel);
  v18 = 30.0;
  if (v17)
  {
    -[UILabel frame](self->_backupIssueLabel, "frame");
    v20 = v19;
    v22 = v21;
    -[UILabel text](self->_backupIssueLabel, "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_backupIssueLabel, "font");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v24, -[UILabel lineBreakMode](self->_backupIssueLabel, "lineBreakMode"), a3 + v13 * -2.0, 1.79769313e308);
    v26 = v25;
    v28 = v27;

    -[UILabel setFrame:](self->_backupIssueLabel, "setFrame:", v20, v22, v26, v28);
    v18 = v28 + 30.0;
  }
  v29 = -[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:", self->_lastBackupLabel);
  if (v29)
  {
    -[UILabel frame](self->_lastBackupLabel, "frame");
    v31 = v30;
    v33 = v32;
    -[UILabel text](self->_lastBackupLabel, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_lastBackupLabel, "font");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v35, -[UILabel lineBreakMode](self->_lastBackupLabel, "lineBreakMode"), a3 + v13 * -2.0, 1.79769313e308);
    v37 = v36;
    v39 = v38;

    -[UILabel setFrame:](self->_lastBackupLabel, "setFrame:", v31, v33, v37, v39);
    v18 = v18 + v39;
  }
  if ((v17 & v29) != 0)
    v40 = v18 + 15.0;
  else
    v40 = v18;
  if (-[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:", self->_statusLabel))
  {
    -[UILabel sizeToFit](self->_statusLabel, "sizeToFit");
    -[UILabel bounds](self->_statusLabel, "bounds");
    v40 = v40 + v41;
  }
  if (-[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:", self->_timeRemainingLabel))
  {
    -[UILabel sizeToFit](self->_timeRemainingLabel, "sizeToFit");
    -[UILabel frame](self->_timeRemainingLabel, "frame");
    -[UILabel setFrame:](self->_timeRemainingLabel, "setFrame:");
    -[UILabel bounds](self->_timeRemainingLabel, "bounds");
    v40 = v40 + v42;
  }
  if (-[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:", self->_progressBar))
  {
    -[UIProgressView bounds](self->_progressBar, "bounds");
    v40 = v40 + v43;
  }
  -[ICQBackupStatusView setFrame:](self, "setFrame:", v44, v16, a3, v40);
  -[ICQBackupStatusView setNeedsLayout](self, "setNeedsLayout");

}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v5;

  -[ICQBackupStatusView _sizeToFitWidth:inTableView:](self, "_sizeToFitWidth:inTableView:", a4, a3);
  -[ICQBackupStatusView bounds](self, "bounds");
  return v5;
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICQBackupStatusView;
  -[ICQBackupStatusView sizeToFit](&v8, sel_sizeToFit);
  -[ICQBackupStatusView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICQBackupStatusView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    -[ICQBackupStatusView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBackupStatusView _sizeToFitWidth:inTableView:](self, "_sizeToFitWidth:inTableView:", v7, v6);

  }
}

- (void)_layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  UILabel *backupIssueLabel;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  UILabel *lastBackupLabel;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UILabel *statusLabel;
  double v35;
  double v36;
  double v37;
  float v38;
  double v39;
  double v40;
  UIActivityIndicatorView *spinner;
  double v42;
  UIProgressView *progressBar;
  double v44;
  UILabel *timeRemainingLabel;
  double v46;
  float v47;
  CGRect v48;

  -[ICQBackupStatusView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICQBackupStatusView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_backgroundInset");
    v6 = v5;
    if (PSIsN56())
    {
      PSTableViewSideInset();
    }
    else
    {
      PreferencesTableViewCellLeftPad();
      v7 = v9;
    }
    v8 = v6 + v7;

  }
  else
  {
    v8 = 15.0;
  }

  -[ICQBackupStatusView bounds](self, "bounds");
  v11 = v10;
  backupIssueLabel = self->_backupIssueLabel;
  if (backupIssueLabel)
  {
    -[UILabel frame](backupIssueLabel, "frame");
    v14 = v13;
    v16 = v15;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

    v19 = v8;
    if (v18)
    {
      -[ICQBackupStatusView bounds](self, "bounds", v8);
      v19 = v20 - v8 - v14;
    }
    -[UILabel setFrame:](self->_backupIssueLabel, "setFrame:", v19, 10.0, v14, v16);
  }
  lastBackupLabel = self->_lastBackupLabel;
  if (lastBackupLabel)
  {
    -[UILabel frame](lastBackupLabel, "frame");
    v23 = v22;
    v25 = v24;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceLayoutDirection");

    v28 = v8;
    if (v27)
    {
      -[ICQBackupStatusView bounds](self, "bounds");
      v28 = v29 - v8 - v23;
    }
    v30 = 10.0;
    if (self->_backupIssueLabel
      && -[NSMutableSet containsObject:](self->_visibleSubviews, "containsObject:"))
    {
      -[UILabel frame](self->_backupIssueLabel, "frame");
      v30 = CGRectGetMaxY(v48) + 15.0;
    }
    -[UILabel setFrame:](self->_lastBackupLabel, "setFrame:", v28, v30, v23, v25);
  }
  v31 = v11 + v8 * -2.0;
  v32 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v33 = *(double *)(MEMORY[0x24BDBF090] + 24);
  statusLabel = self->_statusLabel;
  if (statusLabel)
  {
    -[UILabel frame](statusLabel, "frame");
    v36 = v35;
    v38 = (v31 - v37) * 0.5;
    v39 = v8 + floorf(v38);
    v40 = 10.0;
    -[UILabel setFrame:](self->_statusLabel, "setFrame:", v39, 10.0);
  }
  else
  {
    v39 = *MEMORY[0x24BDBF090];
    v40 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v36 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  spinner = self->_spinner;
  if (spinner)
  {
    -[UIActivityIndicatorView frame](spinner, "frame");
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v39 - v42 + -4.0, 10.0);
  }
  progressBar = self->_progressBar;
  if (progressBar)
  {
    -[UIProgressView frame](progressBar, "frame");
    v33 = v44;
    v32 = v40 + v36 + 4.0;
    -[UIProgressView setFrame:](self->_progressBar, "setFrame:", v8, v32, v31);
  }
  timeRemainingLabel = self->_timeRemainingLabel;
  if (timeRemainingLabel)
  {
    -[UILabel frame](timeRemainingLabel, "frame");
    v47 = (v31 - v46) * 0.5;
    -[UILabel setFrame:](self->_timeRemainingLabel, "setFrame:", v8 + floorf(v47), v32 + v33 + 4.0);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQBackupStatusView;
  -[ICQBackupStatusView layoutSubviews](&v3, sel_layoutSubviews);
  -[ICQBackupStatusView _layoutSubviews](self, "_layoutSubviews");
}

- (void)setBackupProgress:(double)a3 timeIntervalRemaining:(double)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  if (a4 > 604800.0 || a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ESTIMATING_TIME_REMAINING"), &stru_24E400750, CFSTR("Backup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSDateComponentsFormatter stringFromTimeInterval:](self->_durationFormatter, "stringFromTimeInterval:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ICQBackupStatusView_setBackupProgress_timeIntervalRemaining___block_invoke;
  block[3] = &unk_24E3F4898;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__ICQBackupStatusView_setBackupProgress_timeIntervalRemaining___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setText:", *(_QWORD *)(a1 + 40));
  v2 = *(double *)(a1 + 48);
  *(float *)&v2 = v2;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setProgress:", v2);
}

- (double)progress
{
  float v2;

  -[UIProgressView progress](self->_progressBar, "progress");
  return v2;
}

- (void)updateViewsForBackupState:(int)a3 restoreState:(int)a4 enabled:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v9;
  NSMutableSet *v10;
  NSObject *v11;
  NSError *backupError;
  void *v13;
  int v14;
  uint64_t v15;
  NSMutableSet *visibleSubviews;
  void *v17;
  UILabel *statusLabel;
  void *v19;
  void *v20;
  NSObject *v21;
  NSArray *syncErrors;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  NSError *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSMutableSet *v31;
  UILabel *backupIssueLabel;
  void *v33;
  uint64_t v34;
  NSMutableSet *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[5];
  NSMutableSet *v41;
  int v42;
  BOOL v43;
  _QWORD v44[4];
  NSMutableSet *v45;
  ICQBackupStatusView *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v5 = a5;
  v49 = *MEMORY[0x24BDAC8D0];
  ICQUSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v48) = a3;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "update view for backup state: %d", buf, 8u);
  }

  self->_animatedToEnabled = v5;
  self->_animatingToState = a3;
  -[NSMutableSet removeAllObjects](self->_visibleSubviews, "removeAllObjects");
  if (a3 > 6)
  {
    v10 = 0;
    goto LABEL_44;
  }
  if (((1 << a3) & 0x79) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", self->_backupIssueLabel, self->_lastBackupLabel, 0);
    v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    visibleSubviews = self->_visibleSubviews;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_spinner, self->_progressBar, self->_statusLabel, self->_timeRemainingLabel, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObjectsFromArray:](visibleSubviews, "addObjectsFromArray:", v17);

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    statusLabel = self->_statusLabel;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BACKING_UP"), &stru_24E400750, CFSTR("Backup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](statusLabel, "setText:", v20);

    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", self->_spinner, self->_progressBar, self->_statusLabel, self->_timeRemainingLabel, 0);
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  if (!v5)
  {
    -[NSMutableSet addObject:](v10, "addObject:", self->_backupIssueLabel);
    goto LABEL_44;
  }
  if (!self->_backupError)
  {
    if (-[NSArray count](self->_syncErrors, "count"))
    {
      ICQUSLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        syncErrors = self->_syncErrors;
        *(_DWORD *)buf = 138412290;
        v48 = syncErrors;
        _os_log_impl(&dword_21F2CC000, v21, OS_LOG_TYPE_DEFAULT, "sync errors only: %@", buf, 0xCu);
      }
      v23 = 0;
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  ICQUSLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    backupError = self->_backupError;
    *(_DWORD *)buf = 138412290;
    v48 = backupError;
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "backup error only: %@", buf, 0xCu);
  }

  -[NSError domain](self->_backupError, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("MBErrorDomain"));

  if (!v14)
    goto LABEL_30;
  v15 = -[NSError code](self->_backupError, "code");
  if (v15 > 202)
  {
    switch(v15)
    {
      case 300:
      case 304:
      case 308:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v24 = objc_claimAutoreleasedReturnValue();
        v21 = v24;
        v25 = CFSTR("BACKUP_ERROR_NETWORK");
        goto LABEL_31;
      case 301:
      case 302:
      case 305:
      case 306:
      case 307:
        goto LABEL_30;
      case 303:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x24BEBD538];
        v38 = CFSTR("BACKUP_ERROR_INSUFFICIENT_QUOTA");
        goto LABEL_47;
      default:
        if (v15 == 203)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v21 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x24BEBD538];
          v38 = CFSTR("BACKUP_ERROR_VERSION");
LABEL_47:
          objc_msgSend(v37, "modelSpecificLocalizedStringKeyForKey:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v39, &stru_24E400750, CFSTR("Backup"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
        if (v15 != 209)
          goto LABEL_30;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v24 = objc_claimAutoreleasedReturnValue();
        v21 = v24;
        v25 = CFSTR("BACKUP_ERROR_MISSING_ENCRYPTION_KEY");
        break;
    }
    goto LABEL_31;
  }
  if (v15 == 13)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v25 = CFSTR("BACKUP_ERROR_LOCKED");
LABEL_31:
    -[NSObject localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", v25, &stru_24E400750, CFSTR("Backup"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_33;
  }
  if (v15 == 105)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v25 = CFSTR("BACKUP_ERROR_NO_SPACE");
    goto LABEL_31;
  }
  if (v15 != 202)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v25 = CFSTR("BACKUP_ERROR");
    goto LABEL_31;
  }
LABEL_22:
  v23 = 0;
LABEL_33:
  if ((a4 - 1) > 1)
  {
    -[NSMutableSet addObject:](self->_visibleSubviews, "addObject:", self->_lastBackupLabel);
  }
  else
  {
    -[NSMutableSet addObject:](v10, "addObject:", self->_lastBackupLabel);

    v26 = self->_backupError;
    self->_backupError = 0;

    v23 = 0;
  }
  -[ICQBackupStatusView footerText](self, "footerText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[ICQBackupStatusView footerText](self, "footerText");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v23)
    {
      objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("\n\n%@"), v28);
      v30 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v30;
    }
    else
    {
      v23 = (void *)v28;
    }
  }
  -[UILabel setText:](self->_backupIssueLabel, "setText:", v23);
  if (objc_msgSend(v23, "length"))
  {
    v31 = self->_visibleSubviews;
    backupIssueLabel = self->_backupIssueLabel;
  }
  else
  {
    backupIssueLabel = self->_backupIssueLabel;
    v31 = v10;
  }
  -[NSMutableSet addObject:](v31, "addObject:", backupIssueLabel);

LABEL_44:
  v33 = (void *)MEMORY[0x24BEBDB00];
  v34 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke;
  v44[3] = &unk_24E3F34D8;
  v45 = v10;
  v46 = self;
  v40[0] = v34;
  v40[1] = 3221225472;
  v40[2] = __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke_2;
  v40[3] = &unk_24E3F48C0;
  v42 = a3;
  v43 = v5;
  v40[4] = self;
  v41 = v45;
  v35 = v45;
  objc_msgSend(v33, "animateWithDuration:delay:options:animations:completion:", 0, v44, v40, 0.400000006, 0.0);
  -[ICQBackupStatusView sizeToFit](self, "sizeToFit");
  -[ICQBackupStatusView _layoutSubviews](self, "_layoutSubviews");
  -[ICQBackupStatusView superview](self, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBackupStatusView frame](self, "frame");
  objc_msgSend(v36, "setNeedsDisplayInRect:");

}

void __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(v7, "setAlpha:", 0.0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 40) + 480);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        objc_msgSend(v14, "superview", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v14, "setAlpha:", 0.0);
          objc_msgSend(*(id *)(a1 + 40), "addSubview:", v14);
        }
        objc_msgSend(v14, "setAlpha:", 1.0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

}

void __70__ICQBackupStatusView_updateViewsForBackupState_restoreState_enabled___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 472) == *(_DWORD *)(a1 + 48) && *(unsigned __int8 *)(v1 + 476) == *(unsigned __int8 *)(a1 + 52))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (NSError)backupError
{
  return self->_backupError;
}

- (void)setBackupError:(id)a3
{
  objc_storeStrong((id *)&self->_backupError, a3);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_footerText, a3);
}

- (double)backupProgress
{
  return self->_backupProgress;
}

- (void)setBackupProgress:(double)a3
{
  self->_backupProgress = a3;
}

- (NSArray)syncErrors
{
  return self->_syncErrors;
}

- (void)setSyncErrors:(id)a3
{
  objc_storeStrong((id *)&self->_syncErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncErrors, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_backupError, 0);
  objc_storeStrong((id *)&self->_visibleSubviews, 0);
  objc_storeStrong((id *)&self->_lastBackupLabel, 0);
  objc_storeStrong((id *)&self->_backupIssueLabel, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

- (void)_sizeToFitWidth:inTableView:.cold.1()
{
  __assert_rtn("-[ICQBackupStatusView _sizeToFitWidth:inTableView:]", "ICQBackupController.m", 175, "tableView");
}

@end
