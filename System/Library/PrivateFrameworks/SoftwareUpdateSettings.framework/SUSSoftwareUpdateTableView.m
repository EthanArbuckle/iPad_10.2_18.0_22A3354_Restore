@implementation SUSSoftwareUpdateTableView

- (SUSSoftwareUpdateTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  UILabel *v4;
  UILabel *checkingStatusLabel;
  UILabel *v6;
  UILabel *subtitleLabel;
  uint64_t v8;
  UIActivityIndicatorView *checkingForUpdateSpinner;
  __CFNotificationCenter *DarwinNotifyCenter;
  SUSSoftwareUpdateTableView *v12;
  UILabel *v13;
  id v14;
  UILabel *v15;
  id v16;
  UILabel *v17;
  id v18;
  UILabel *v19;
  id v20;
  UILabel *v21;
  id v22;
  UILabel *v23;
  id v24;
  UILabel *v25;
  id v26;
  id v27;
  objc_super v28;
  int64_t v29;
  SEL v30;
  SUSSoftwareUpdateTableView *v31;
  CGRect v32;

  v32 = a3;
  v30 = a2;
  v29 = a4;
  v31 = 0;
  v28.receiver = self;
  v28.super_class = (Class)SUSSoftwareUpdateTableView;
  v31 = -[SUSSoftwareUpdateTableView initWithFrame:style:](&v28, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    v31->_disableScanUI = 0;
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    checkingStatusLabel = v31->_checkingStatusLabel;
    v31->_checkingStatusLabel = v4;

    -[UILabel setTextAlignment:](v31->_checkingStatusLabel, "setTextAlignment:");
    v13 = v31->_checkingStatusLabel;
    v14 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    -[UILabel setFont:](v13, "setFont:");

    v15 = v31->_checkingStatusLabel;
    v16 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    -[UILabel setBackgroundColor:](v15, "setBackgroundColor:");

    v17 = v31->_checkingStatusLabel;
    v18 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
    -[UILabel setTextColor:](v17, "setTextColor:");

    -[UILabel setNumberOfLines:](v31->_checkingStatusLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v31->_checkingStatusLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v31->_checkingStatusLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v31->_subtitleLabel;
    v31->_subtitleLabel = v6;

    v19 = v31->_subtitleLabel;
    v20 = -[SUSSoftwareUpdateTableView upToDateText](v31, "upToDateText");
    -[UILabel setText:](v19, "setText:");

    -[UILabel setTextAlignment:](v31->_subtitleLabel, "setTextAlignment:", 1);
    v21 = v31->_subtitleLabel;
    v22 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    -[UILabel setFont:](v21, "setFont:");

    v23 = v31->_subtitleLabel;
    v24 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    -[UILabel setBackgroundColor:](v23, "setBackgroundColor:");

    v25 = v31->_subtitleLabel;
    v26 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
    -[UILabel setTextColor:](v25, "setTextColor:");

    -[UILabel setNumberOfLines:](v31->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v31->_subtitleLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v31->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    checkingForUpdateSpinner = v31->_checkingForUpdateSpinner;
    v31->_checkingForUpdateSpinner = (UIActivityIndicatorView *)v8;

    -[UIActivityIndicatorView sizeToFit](v31->_checkingForUpdateSpinner, "sizeToFit");
    v27 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v27, "addObserver:selector:name:object:", v31, sel_preferredContentSizeChanged_, *MEMORY[0x24BEBE088]);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v31, (CFNotificationCallback)_settingDidChangeFontSize, (CFStringRef)kSUSUIApplePreferredContentSizeCategoryNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v12 = v31;
  objc_storeStrong((id *)&v31, 0);
  return v12;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  refreshPadding = 1;
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  float v23;
  float v24;
  double v25;
  UIFont *v26;
  NSString *v27;
  UIFont *v28;
  NSString *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  double v39;
  double v40;
  id location;
  objc_super v42;
  SEL v43;
  SUSSoftwareUpdateTableView *v44;

  v44 = self;
  v43 = a2;
  v42.receiver = self;
  v42.super_class = (Class)SUSSoftwareUpdateTableView;
  -[SUSSoftwareUpdateTableView layoutSubviews](&v42, sel_layoutSubviews);
  if ((refreshPadding & 1) != 0)
  {
    statusMessageTopAfterScanningMargin = -1.0;
    refreshPadding = 0;
  }
  if (*(double *)&layoutSubviews_statusMessageTopMargin < 0.0)
  {
    PSRoundToPixel();
    layoutSubviews_statusMessageTopMargin = v2;
  }
  if (*(double *)&statusMessageTopAfterScanningMargin < 0.0)
  {
    location = (id)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory", *(double *)&statusMessageTopAfterScanningMargin);
    UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)location, (UIContentSizeCategory)*MEMORY[0x24BEBE078]);
    PSRoundToPixel();
    statusMessageTopAfterScanningMargin = v3;
    objc_storeStrong(&location, 0);
  }
  -[SUSSoftwareUpdateTableView bounds](v44, "bounds");
  v39 = v4;
  v40 = v5;
  if (v44->_state < 2u || v44->_state == 3 || v44->_state == 4)
  {
    v27 = -[UILabel text](v44->_checkingStatusLabel, "text");
    v26 = -[UILabel font](v44->_checkingStatusLabel, "font");
    CGSizeMake();
    -[NSString _legacy_sizeWithFont:constrainedToSize:](v27, "_legacy_sizeWithFont:constrainedToSize:", v26, v6, v7);
    v36 = v8;
    v37 = v9;

    v10 = v36;
    v38.size.width = ceilf(v10);
    v11 = v37;
    v38.size.height = ceilf(v11);
    v12 = (v39 - v38.size.width) / 2.0;
    v38.origin.x = floorf(v12);
    v13 = v40 / 2.0 - (double)kLabelOffset;
    v38.origin.y = floorf(v13);
    -[UILabel setFrame:](v44->_checkingStatusLabel, "setFrame:", *(_OWORD *)&v38.origin, *(_OWORD *)&v38.size);
    v29 = -[UILabel text](v44->_subtitleLabel, "text");
    v28 = -[UILabel font](v44->_subtitleLabel, "font");
    CGSizeMake();
    -[NSString _legacy_sizeWithFont:constrainedToSize:](v29, "_legacy_sizeWithFont:constrainedToSize:", v28, v14, v15);
    v31 = v16;
    v32 = v17;

    v18 = v31;
    v34 = ceilf(v18);
    v19 = v32;
    v35 = ceilf(v19);
    v20 = (v39 - v34) / 2.0;
    v33 = floorf(v20);
    v21 = CGRectGetMaxY(v38) + (double)kSublabelOffset;
    -[UILabel setFrame:](v44->_subtitleLabel, "setFrame:", v33, floorf(v21), v34, v35);
    -[UIActivityIndicatorView frame](v44->_checkingForUpdateSpinner, "frame");
    v23 = (v39 - v22) / 2.0;
    v30 = floorf(v23);
    v24 = v38.origin.y - v38.size.height - 12.0;
    -[UIActivityIndicatorView setFrame:](v44->_checkingForUpdateSpinner, "setFrame:", v30, floorf(v24), v22, v25);
  }
}

- (void)setState:(int)a3
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  SUSSoftwareUpdateTableView *v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  SUSSoftwareUpdateTableView *v22;
  unsigned int v23;
  BOOL v24;
  BOOL v25;
  id v26;
  os_log_type_t v27;
  id v28;
  unsigned int v29;
  SEL v30;
  SUSSoftwareUpdateTableView *v31;
  uint8_t v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  v30 = a2;
  v29 = a3;
  if (a3 != self->_state)
  {
    v28 = _SUSLoggingFacility();
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      log = v28;
      type = v27;
      v9 = +[SUSSoftwareUpdateTableView stringForState:](SUSSoftwareUpdateTableView, "stringForState:", v29);
      v26 = v9;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"-[SUSSoftwareUpdateTableView setState:]", (uint64_t)v26);
      _os_log_impl(&dword_22CBAC000, log, type, "%s: Setting state %@", v32, 0x16u);

      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v28, 0);
    if (v31->_state == 1 && (!v29 || v29 == 3 || v29 == 2))
      -[UIActivityIndicatorView setAlpha:](v31->_checkingForUpdateSpinner, "setAlpha:", 0.0);
    v25 = 0;
    v6 = 0;
    if (v31->_state == 1)
      v6 = v29 == 2;
    v25 = v6;
    v24 = 0;
    v5 = 0;
    if (v31->_state == 4)
      v5 = v29 == 2;
    v24 = v5;
    if (v25 || v24)
    {
      -[UIActivityIndicatorView setAlpha:](v31->_checkingForUpdateSpinner, "setAlpha:");
      -[UILabel setAlpha:](v31->_checkingStatusLabel, "setAlpha:", 0.0);
      -[UILabel setAlpha:](v31->_subtitleLabel, "setAlpha:", 0.0);
    }
    v31->_state = v29;
    if (-[SUSSoftwareUpdateTableView disableScanUI](v31, "disableScanUI"))
    {
      -[SUSSoftwareUpdateTableView setNeedsLayout](v31, "setNeedsLayout");
    }
    else
    {
      v4 = (void *)MEMORY[0x24BEBDB00];
      v3 = MEMORY[0x24BDAC760];
      v17 = MEMORY[0x24BDAC760];
      v18 = -1073741824;
      v19 = 0;
      v20 = __39__SUSSoftwareUpdateTableView_setState___block_invoke;
      v21 = &unk_24F762FE0;
      v23 = v29;
      v22 = v31;
      v10 = v3;
      v11 = -1073741824;
      v12 = 0;
      v13 = __39__SUSSoftwareUpdateTableView_setState___block_invoke_2;
      v14 = &unk_24F763008;
      v15 = v31;
      v16 = v29;
      objc_msgSend(v4, "animateWithDuration:animations:completion:", &v17, &v10, 0.300000012);
      -[SUSSoftwareUpdateTableView setNeedsLayout](v31, "setNeedsLayout");
      objc_storeStrong((id *)&v15, 0);
      objc_storeStrong((id *)&v22, 0);
    }
  }
}

void __39__SUSSoftwareUpdateTableView_setState___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v14[3];

  v14[2] = (id)a1;
  v14[1] = (id)a1;
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 3272);
    v10 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CHECKING_FOR_UPDATES"), &stru_24F764478, CFSTR("Software Update"));
    objc_msgSend(v8, "setText:");

    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3272));
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3288));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3288), "startAnimating");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3272), "setAlpha:");
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 3288);
    v12 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    objc_msgSend(v11, "setColor:");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3288), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3280), "setAlpha:", 0.0);
  }
  else if (*(_DWORD *)(a1 + 40) && *(_DWORD *)(a1 + 40) != 4)
  {
    if (*(_DWORD *)(a1 + 40) == 3)
    {
      v1 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14[0] = (id)objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MANAGED_DEVICE_HIDDEN_WITHIN_DELAY"), &stru_24F764478, CFSTR("Software Update"));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3272), "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3256));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3280), "setText:", v14[0]);
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3272));
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3280));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3272), "setAlpha:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3280), "setAlpha:", 1.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3288), "setAlpha:", 0.0);
      objc_storeStrong(v14, 0);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3272), "setAlpha:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3280), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3288), "setAlpha:", 0.0);
    }
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "updatesDeferred") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "suPathsRestricted") & 1) != 0)
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 3280);
      v7 = (id)objc_msgSend(*(id *)(a1 + 32), "upToDateManagedText");
      objc_msgSend(v6, "setText:");

    }
    else if (*(_DWORD *)(a1 + 40) == 4)
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 3280);
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "upToDateWithAlternate");
      objc_msgSend(v4, "setText:");

    }
    else
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 3280);
      v3 = (id)objc_msgSend(*(id *)(a1 + 32), "upToDateText");
      objc_msgSend(v2, "setText:");

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3272), "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3256));
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3272));
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 3280));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3272), "setAlpha:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3280), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 3288), "setAlpha:", 0.0);
  }
}

uint64_t __39__SUSSoftwareUpdateTableView_setState___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 3252) == *(_DWORD *)(result + 40))
  {
    if (*(_DWORD *)(result + 40) == 1)
    {
      return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 3280), "removeFromSuperview");
    }
    else if (!*(_DWORD *)(result + 40) || *(_DWORD *)(result + 40) == 3 || *(_DWORD *)(result + 40) == 4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 3288), "stopAnimating");
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 3288), "removeFromSuperview");
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 3272), "removeFromSuperview");
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 3280), "removeFromSuperview");
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 3288), "stopAnimating");
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 3288), "removeFromSuperview");
    }
  }
  return result;
}

- (id)upToDateText
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UP_TO_DATE"));
  v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (id)upToDateWithAlternate
{
  id v2;
  id v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;
  id v13[3];

  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  v11 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  location = (id)objc_msgSend(v11, "systemVersion");

  if (location)
  {
    v10 = (id)objc_msgSend(location, "componentsSeparatedByString:", CFSTR("."));
    v2 = (id)objc_msgSend(v10, "firstObject");
    v3 = v13[0];
    v13[0] = v2;

  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("UP_TO_DATE_WITH_ALTERNATE"));
  v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  v9 = (id)objc_msgSend(v5, "stringWithFormat:", v13[0]);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v9;
}

- (id)upToDateManagedText
{
  id v3;
  id v4;
  id v5;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("MANAGED_DEVICE_DELAY_EXPIRED_UNAVAILABLE"));
  v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

+ (id)stringForState:(int)a3
{
  if (a3 <= 5uLL)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentVersion, a3);
}

- (NSDate)lastScannedDate
{
  return self->_lastScannedDate;
}

- (void)setLastScannedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastScannedDate, a3);
}

- (BOOL)updatesDeferred
{
  return self->_updatesDeferred;
}

- (void)setUpdatesDeferred:(BOOL)a3
{
  self->_updatesDeferred = a3;
}

- (BOOL)suPathsRestricted
{
  return self->_suPathsRestricted;
}

- (void)setSuPathsRestricted:(BOOL)a3
{
  self->_suPathsRestricted = a3;
}

- (UILabel)checkingStatusLabel
{
  return self->_checkingStatusLabel;
}

- (void)setCheckingStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_checkingStatusLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIActivityIndicatorView)checkingForUpdateSpinner
{
  return self->_checkingForUpdateSpinner;
}

- (void)setCheckingForUpdateSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, a3);
}

- (int)state
{
  return self->_state;
}

- (BOOL)disableScanUI
{
  return self->_disableScanUI;
}

- (void)setDisableScanUI:(BOOL)a3
{
  self->_disableScanUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_checkingStatusLabel, 0);
  objc_storeStrong((id *)&self->_lastScannedDate, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
}

@end
