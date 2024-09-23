@implementation STDatePickerBar

- (STDatePickerBar)initWithFrame:(CGRect)a3
{
  STDatePickerBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STDatePickerBar;
  v3 = -[STDatePickerBar initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STDatePickerBar _stDatePickerBarCommonInit](v3, "_stDatePickerBarCommonInit");
  return v3;
}

- (STDatePickerBar)initWithCoder:(id)a3
{
  STDatePickerBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STDatePickerBar;
  v3 = -[STDatePickerBar initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STDatePickerBar _stDatePickerBarCommonInit](v3, "_stDatePickerBarCommonInit");
  return v3;
}

- (void)_stDatePickerBarCommonInit
{
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *dateLabel;
  void *v7;
  UIButton *v8;
  UIButton *leftArrowButton;
  _BOOL8 v10;
  UIButton *v11;
  UIButton *rightArrowButton;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *bottomBorderLine;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  _QWORD v68[20];

  v68[18] = *MEMORY[0x24BDAC8D0];
  -[STDatePickerBar setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STDatePickerBar setAlpha:](self, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 10);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v65);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = v3;
  -[STDatePickerBar addSubview:](self, "addSubview:", v3);
  v5 = (UILabel *)objc_opt_new();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_dateLabel, "setFont:", v7);

  -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_dateLabel, "setLineBreakMode:", 0);
  -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", 1);
  -[STDatePickerBar addSubview:](self, "addSubview:", self->_dateLabel);
  v8 = (UIButton *)objc_opt_new();
  leftArrowButton = self->_leftArrowButton;
  self->_leftArrowButton = v8;

  v10 = -[STDatePickerBar effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  -[STDatePickerBar _configureArrowButton:isLeft:isLayoutDirectionRightToLeft:](self, "_configureArrowButton:isLeft:isLayoutDirectionRightToLeft:", self->_leftArrowButton, 1, v10);
  -[STDatePickerBar addSubview:](self, "addSubview:", self->_leftArrowButton);
  -[UIButton addTarget:action:forEvents:](self->_leftArrowButton, "addTarget:action:forEvents:", self, sel__leftDatePickerBarButtonTapped_, 0x2000);
  v11 = (UIButton *)objc_opt_new();
  rightArrowButton = self->_rightArrowButton;
  self->_rightArrowButton = v11;

  -[STDatePickerBar _configureArrowButton:isLeft:isLayoutDirectionRightToLeft:](self, "_configureArrowButton:isLeft:isLayoutDirectionRightToLeft:", self->_rightArrowButton, 0, v10);
  -[STDatePickerBar addSubview:](self, "addSubview:", self->_rightArrowButton);
  -[UIButton addTarget:action:forEvents:](self->_rightArrowButton, "addTarget:action:forEvents:", self, sel__rightDatePickerBarButtonTapped_, 0x2000);
  v13 = objc_alloc(MEMORY[0x24BEBD668]);
  -[STDatePickerBar horizontalLineImage](self, "horizontalLineImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
  bottomBorderLine = self->_bottomBorderLine;
  self->_bottomBorderLine = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomBorderLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STDatePickerBar addSubview:](self, "addSubview:", self->_bottomBorderLine);
  -[STDatePickerBar topAnchor](self, "topAnchor");
  v17 = objc_claimAutoreleasedReturnValue();
  -[STDatePickerBar leadingAnchor](self, "leadingAnchor");
  v18 = objc_claimAutoreleasedReturnValue();
  -[STDatePickerBar bottomAnchor](self, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDatePickerBar trailingAnchor](self, "trailingAnchor");
  v19 = objc_claimAutoreleasedReturnValue();
  -[STDatePickerBar centerYAnchor](self, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v17);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v4;
  v68[0] = v62;
  objc_msgSend(v4, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v18);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v60;
  objc_msgSend(v4, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v66);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v58;
  objc_msgSend(v4, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  objc_msgSend(v57, "constraintEqualToAnchor:", v19);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v56;
  -[UIButton leadingAnchor](self->_leftArrowButton, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v18;
  objc_msgSend(v55, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v18, 2.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v68[4] = v54;
  -[UIButton centerYAnchor](self->_leftArrowButton, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v67);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v68[5] = v52;
  -[UILabel topAnchor](self->_dateLabel, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v17;
  objc_msgSend(v50, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v17, 2.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v68[6] = v49;
  -[UILabel leadingAnchor](self->_dateLabel, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_leftArrowButton, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v46, 2.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v68[7] = v45;
  -[UILabel centerYAnchor](self->_dateLabel, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v67);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v68[8] = v42;
  -[UILabel centerXAnchor](self->_dateLabel, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDatePickerBar centerXAnchor](self, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v68[9] = v39;
  -[UIButton topAnchor](self->_rightArrowButton, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v17, 2.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v68[10] = v37;
  -[UIButton leadingAnchor](self->_rightArrowButton, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_dateLabel, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v35, 2.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v68[11] = v34;
  -[UIButton centerYAnchor](self->_rightArrowButton, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v67);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v68[12] = v32;
  -[UIImageView leadingAnchor](self->_bottomBorderLine, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v68[13] = v30;
  -[UIImageView trailingAnchor](self->_bottomBorderLine, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68[14] = v22;
  -[UIImageView bottomAnchor](self->_bottomBorderLine, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v66);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[15] = v24;
  -[UILabel bottomAnchor](self->_dateLabel, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v25, 2.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v68[16] = v26;
  -[UIButton trailingAnchor](self->_rightArrowButton, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, 2.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v68[17] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v29);

}

- (void)_configureArrowButton:(id)a3 isLeft:(BOOL)a4 isLayoutDirectionRightToLeft:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  v5 = a5;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BEBDB90];
  v8 = a3;
  objc_msgSend(v7, "plainButtonConfiguration");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("chevron.right.circle.fill");
  if (v5)
    v10 = CFSTR("chevron.left.circle.fill");
  else
    v10 = CFSTR("chevron.right.circle.fill");
  if (!v5)
    v9 = CFSTR("chevron.left.circle.fill");
  if (v6)
    v11 = v9;
  else
    v11 = v10;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v12);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImageTintColor:", v13);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreferredSymbolConfigurationForImage:", v14);

  objc_msgSend(v8, "_setConfiguration:", v16);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v15) = 1144766464;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v15);

}

- (UIImage)horizontalLineImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__STDatePickerBar_horizontalLineImage__block_invoke;
  block[3] = &unk_24DB86440;
  block[4] = self;
  if (horizontalLineImage_onceToken_0 != -1)
    dispatch_once(&horizontalLineImage_onceToken_0, block);
  return (UIImage *)(id)horizontalLineImage_horizontalLineImage_0;
}

void __38__STDatePickerBar_horizontalLineImage__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = 1.0 / v2;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v3, v3);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__STDatePickerBar_horizontalLineImage__block_invoke_2;
  v9[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v9[4] = v3;
  objc_msgSend(v8, "imageWithActions:", v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)horizontalLineImage_horizontalLineImage_0;
  horizontalLineImage_horizontalLineImage_0 = v4;

  objc_msgSend((id)horizontalLineImage_horizontalLineImage_0, "resizableImageWithCapInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)horizontalLineImage_horizontalLineImage_0;
  horizontalLineImage_horizontalLineImage_0 = v6;

}

void __38__STDatePickerBar_horizontalLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  CGRect v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  v5.size.width = *(CGFloat *)(a1 + 32);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.height = v5.size.width;
  CGContextFillRect(v3, v5);
}

- (void)updateWithCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "usageDetailsCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedUsageReport");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[STDatePickerBar usageReport](self, "usageReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUsageDetailListController selectedUsageReportDidChangeFrom:to:datePickerBar:coordinator:](STUsageDetailListController, "selectedUsageReportDidChangeFrom:to:datePickerBar:coordinator:", v7, v8, self, v4);

  -[STDatePickerBar setUsageReport:](self, "setUsageReport:", v8);
  -[STDatePickerBar setCoordinator:](self, "setCoordinator:", v4);

}

- (void)_leftDatePickerBarButtonTapped:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  -[STDatePickerBar coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "selectedUsageReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    v8 = objc_msgSend(v12, "selectedDay");
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == objc_msgSend(v9, "firstWeekday"))
      objc_msgSend(v12, "setSelectedWeek:", objc_msgSend(v12, "selectedWeek") + 1);
    if (v8 == objc_msgSend(v9, "maximumRangeOfUnit:", 512))
      v11 = v10;
    else
      v11 = v8 - 1;
    objc_msgSend(v12, "setSelectedDay:", v11);

    goto LABEL_10;
  }
  v7 = v12;
  if (!v6)
  {
    objc_msgSend(v12, "setSelectedWeek:", objc_msgSend(v12, "selectedWeek") + 1);
LABEL_10:
    v7 = v12;
  }

}

- (void)_rightDatePickerBarButtonTapped:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  -[STDatePickerBar coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "selectedUsageReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    v8 = objc_msgSend(v16, "selectedDay");
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "firstWeekday");
    v12 = objc_msgSend(v9, "maximumRangeOfUnit:", 512);
    v13 = v11;
    v14 = v10 - 1;
    if (v10 == v12)
      v14 = v11;
    if (v8 == v14)
      objc_msgSend(v16, "setSelectedWeek:", objc_msgSend(v16, "selectedWeek") - 1);
    if (v8 == v13)
      v15 = v12;
    else
      v15 = v8 + 1;
    objc_msgSend(v16, "setSelectedDay:", v15);

    goto LABEL_12;
  }
  v7 = v16;
  if (!v6)
  {
    objc_msgSend(v16, "setSelectedWeek:", objc_msgSend(v16, "selectedWeek") - 1);
LABEL_12:
    v7 = v16;
  }

}

- (UILabel)dateLabel
{
  return (UILabel *)objc_getProperty(self, a2, 416, 1);
}

- (UIButton)leftArrowButton
{
  return (UIButton *)objc_getProperty(self, a2, 424, 1);
}

- (UIButton)rightArrowButton
{
  return (UIButton *)objc_getProperty(self, a2, 432, 1);
}

- (UIImageView)bottomBorderLine
{
  return (UIImageView *)objc_getProperty(self, a2, 440, 1);
}

- (STUsageReport)usageReport
{
  return (STUsageReport *)objc_getProperty(self, a2, 448, 1);
}

- (void)setUsageReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 456, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_usageReport, 0);
  objc_storeStrong((id *)&self->_bottomBorderLine, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
