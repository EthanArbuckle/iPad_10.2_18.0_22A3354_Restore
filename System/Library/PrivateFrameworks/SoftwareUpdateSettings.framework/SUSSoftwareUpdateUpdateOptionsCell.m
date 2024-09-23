@implementation SUSSoftwareUpdateUpdateOptionsCell

- (SUSSoftwareUpdateUpdateOptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SUSSoftwareUpdateUpdateOptionsCell *v5;
  SUSSoftwareUpdateUpdateOptionsCell *v7;
  SUSSoftwareUpdateUpdateOptionsCell *v9;
  objc_super v10;
  id v11;
  id location;
  int64_t v13;
  SEL v14;
  SUSSoftwareUpdateUpdateOptionsCell *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v5 = v15;
  v15 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)SUSSoftwareUpdateUpdateOptionsCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, v13, location, v11);
  v15 = v9;
  objc_storeStrong((id *)&v15, v9);
  if (v9)
  {
    -[SUSSoftwareUpdateUpdateOptionsCell setSelectionStyle:](v15, "setSelectionStyle:", 0);
    -[SUSSoftwareUpdateUpdateOptionsCell setHoverStyle:](v15, "setHoverStyle:", 0);
    -[SUSSoftwareUpdateUpdateOptionsCell _setupView](v15, "_setupView");
  }
  v7 = v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (BOOL)isPrimaryButtonEnabled
{
  return -[UIButton isEnabled](self->_primaryButton, "isEnabled", a2, self) & 1;
}

- (void)setPrimaryButtonEnabled:(BOOL)a3
{
  -[UIButton setEnabled:](self->_primaryButton, "setEnabled:", a3);
}

- (BOOL)isSecondaryButtonEnabled
{
  return -[UIButton isEnabled](self->_secondaryButton, "isEnabled", a2, self) & 1;
}

- (void)setSecondaryButtonEnabled:(BOOL)a3
{
  -[UIButton setEnabled:](self->_secondaryButton, "setEnabled:", a3);
}

- (void)setPrimaryButtonHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_primaryButton, "setHidden:", a3);
  -[SUSSoftwareUpdateUpdateOptionsCell _configureStackViewMargin](self, "_configureStackViewMargin");
}

- (BOOL)isPrimaryButtonHidden
{
  return -[UIButton isHidden](self->_primaryButton, "isHidden", a2, self) & 1;
}

- (void)setSecondaryButtonHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_secondaryButton, "setHidden:", a3);
  -[SUSSoftwareUpdateUpdateOptionsCell _configureStackViewMargin](self, "_configureStackViewMargin");
}

- (BOOL)isSecondaryButtonHidden
{
  return -[UIButton isHidden](self->_secondaryButton, "isHidden", a2, self) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  -[UIButton setEnabled:](self->_primaryButton, "setEnabled:", a3);
  -[UIButton setEnabled:](self->_secondaryButton, "setEnabled:", v3);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  -[UIButton setHidden:](self->_primaryButton, "setHidden:", a3);
  -[UIButton setHidden:](self->_secondaryButton, "setHidden:", v3);
  -[SUSSoftwareUpdateUpdateOptionsCell _configureStackViewMargin](self, "_configureStackViewMargin");
}

- (NSString)primaryButtonText
{
  return (NSString *)-[UIButton title](self->_primaryButton, "title", a2, self);
}

- (void)setPrimaryButtonText:(id)a3
{
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIButton setTitle:forState:](v4->_primaryButton, "setTitle:forState:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (NSString)secondaryButtonText
{
  return (NSString *)self->_secondaryButton;
}

- (void)setSecondaryButtonText:(id)a3
{
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIButton setTitle:forState:](v4->_secondaryButton, "setTitle:forState:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)setActivityIndicatorDisplayStyle:(int64_t)a3
{
  os_log_t v3;
  os_log_t oslog;
  os_log_type_t v5;
  id location;
  int64_t v7;
  SEL v8;
  SUSSoftwareUpdateUpdateOptionsCell *v9;
  uint8_t v10[16];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8 = a2;
  v7 = a3;
  if (self->_activityIndicator)
    -[UIActivityIndicatorView removeFromSuperview](v9->_activityIndicator, "removeFromSuperview");
  v9->_currentActivityIndicatorStyle = v7;
  if (v7 == 1)
  {
    if (!v9->_primaryButton || (-[UIButton isHidden](v9->_primaryButton, "isHidden") & 1) != 0)
    {
      location = _SUSLoggingFacility();
      v5 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSSoftwareUpdateUpdateOptionsCell setActivityIndicatorDisplayStyle:]");
        _os_log_error_impl(&dword_22CBAC000, (os_log_t)location, v5, "%s: Attempt to display the activity indicator for the primary button, while the primary button is not displayed on the screen.", v11, 0xCu);
      }
      objc_storeStrong(&location, 0);
    }
    -[SUSSoftwareUpdateUpdateOptionsCell _addActivityIndicatorFor:](v9, "_addActivityIndicatorFor:", v9->_primaryButton);
  }
  else if (v7 == 2)
  {
    if (!v9->_secondaryButton || (-[UIButton isHidden](v9->_secondaryButton, "isHidden") & 1) != 0)
    {
      oslog = (os_log_t)_SUSLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v3 = oslog;
        __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[SUSSoftwareUpdateUpdateOptionsCell setActivityIndicatorDisplayStyle:]");
        _os_log_error_impl(&dword_22CBAC000, oslog, OS_LOG_TYPE_ERROR, "%s: Attempt to display the activity indicator for the primary button, while the primary button is not displayed on the screen.", v10, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    -[SUSSoftwareUpdateUpdateOptionsCell _addActivityIndicatorFor:](v9, "_addActivityIndicatorFor:", v9->_secondaryButton, v3);
  }
}

- (int64_t)activityIndicatorDisplayStyle
{
  return self->_currentActivityIndicatorStyle;
}

- (void)setPrimaryButtonActionHandler:(id)a3
{
  uint64_t v3;
  id primaryButtonAction;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = MEMORY[0x22E303A08](location[0]);
  primaryButtonAction = v6->_primaryButtonAction;
  v6->_primaryButtonAction = (id)v3;

  objc_storeStrong(location, 0);
}

- (void)setPrimaryButtonLongTapActionHandler:(id)a3
{
  uint64_t v3;
  id primaryButtonLongTapAction;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = MEMORY[0x22E303A08](location[0]);
  primaryButtonLongTapAction = v6->_primaryButtonLongTapAction;
  v6->_primaryButtonLongTapAction = (id)v3;

  objc_storeStrong(location, 0);
}

- (void)setSecondaryButtonActionHandler:(id)a3
{
  uint64_t v3;
  id secondaryButtonAction;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = MEMORY[0x22E303A08](location[0]);
  secondaryButtonAction = v6->_secondaryButtonAction;
  v6->_secondaryButtonAction = (id)v3;

  objc_storeStrong(location, 0);
}

- (void)setSecondaryButtonMenu:(id)a3
{
  id v3;
  uint64_t v4;
  UIContextMenuInteraction *secondaryButtonContextMenuInteraction;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v7->_secondaryButtonContextMenuInteraction)
  {
    -[UIButton removeInteraction:](v7->_secondaryButton, "removeInteraction:", v7->_secondaryButtonContextMenuInteraction);
    objc_storeStrong((id *)&v7->_secondaryButtonContextMenuInteraction, 0);
  }
  objc_storeStrong((id *)&v7->_secondaryButtonMenu, location[0]);
  v3 = objc_alloc(MEMORY[0x24BEBD500]);
  v4 = objc_msgSend(v3, "initWithDelegate:", v7);
  secondaryButtonContextMenuInteraction = v7->_secondaryButtonContextMenuInteraction;
  v7->_secondaryButtonContextMenuInteraction = (UIContextMenuInteraction *)v4;

  -[UIButton addInteraction:](v7->_secondaryButton, "addInteraction:", v7->_secondaryButtonContextMenuInteraction);
  objc_storeStrong(location, 0);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  id (*v10)(_QWORD *, void *);
  void *v11;
  SUSSoftwareUpdateUpdateOptionsCell *v12;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v14;
  CGPoint v15;

  v15 = a4;
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (void *)MEMORY[0x24BEBD4F8];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __92__SUSSoftwareUpdateUpdateOptionsCell_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v11 = &unk_24F762F50;
  v12 = v14;
  v6 = (id)objc_msgSend(v5, "configurationWithIdentifier:previewProvider:actionProvider:", 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  return v6;
}

id __92__SUSSoftwareUpdateUpdateOptionsCell_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = *(id *)(a1[4] + 1216);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = objc_alloc_init(MEMORY[0x24BEBD888]);
  v13 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
  objc_msgSend(v17, "setBackgroundColor:");

  v14 = (void *)MEMORY[0x24BEBD420];
  -[UIButton bounds](v21->_secondaryButton, "bounds");
  v15 = (id)objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v5, v6, v7, v8, 18.0);
  objc_msgSend(v17, "setVisiblePath:");

  v9 = objc_alloc(MEMORY[0x24BEBDA30]);
  v16 = (void *)objc_msgSend(v9, "initWithView:parameters:", v21->_secondaryButton, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (void)_setupView
{
  id v2;
  UIButton *v3;
  UIButton *primaryButton;
  UIButton *v5;
  UIButton *secondaryButton;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *stackViewTopAnchor;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *stackViewBottomAnchor;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41[2];
  SUSSoftwareUpdateUpdateOptionsCell *v42;
  _QWORD v43[9];

  v43[8] = *MEMORY[0x24BDAC8D0];
  v42 = self;
  v41[1] = (id)a2;
  if (*(_OWORD *)&self->_primaryButton == 0)
  {
    v41[0] = objc_alloc_init(MEMORY[0x24BEBD978]);
    objc_msgSend(v41[0], "setAxis:");
    objc_msgSend(v41[0], "setDistribution:", 1);
    objc_msgSend(v41[0], "setSpacing:", 10.0);
    objc_msgSend(v41[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v41[0], "setClipsToBounds:", 1);
    v2 = objc_alloc(MEMORY[0x24BEBDB00]);
    v40 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v40, "addSubview:", v41[0]);
    v11 = (id)-[SUSSoftwareUpdateUpdateOptionsCell contentView](v42, "contentView");
    objc_msgSend(v11, "addSubview:", v40);

    v3 = (UIButton *)-[SUSSoftwareUpdateUpdateOptionsCell _configurePrimaryButton](v42, "_configurePrimaryButton");
    primaryButton = v42->_primaryButton;
    v42->_primaryButton = v3;

    v5 = (UIButton *)-[SUSSoftwareUpdateUpdateOptionsCell _configureSecondaryButton](v42, "_configureSecondaryButton");
    secondaryButton = v42->_secondaryButton;
    v42->_secondaryButton = v5;

    objc_storeStrong((id *)&v42->_activityIndicator, 0);
    objc_msgSend(v41[0], "addArrangedSubview:", v42->_primaryButton);
    objc_msgSend(v41[0], "addArrangedSubview:", v42->_secondaryButton);
    v14 = (id)objc_msgSend(v40, "topAnchor");
    v13 = (id)-[SUSSoftwareUpdateUpdateOptionsCell contentView](v42, "contentView");
    v12 = (id)objc_msgSend(v13, "topAnchor");
    v7 = (NSLayoutConstraint *)(id)objc_msgSend(v14, "constraintEqualToAnchor:constant:");
    stackViewTopAnchor = v42->_stackViewTopAnchor;
    v42->_stackViewTopAnchor = v7;

    v17 = (id)objc_msgSend(v40, "bottomAnchor");
    v16 = (id)-[SUSSoftwareUpdateUpdateOptionsCell contentView](v42, "contentView");
    v15 = (id)objc_msgSend(v16, "bottomAnchor");
    v9 = (NSLayoutConstraint *)(id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 0.0);
    stackViewBottomAnchor = v42->_stackViewBottomAnchor;
    v42->_stackViewBottomAnchor = v9;

    v18 = (void *)MEMORY[0x24BDD1628];
    v43[0] = v42->_stackViewTopAnchor;
    v43[1] = v42->_stackViewBottomAnchor;
    v39 = (id)objc_msgSend(v41[0], "leadingAnchor");
    v38 = (id)-[SUSSoftwareUpdateUpdateOptionsCell contentView](v42, "contentView");
    v37 = (id)objc_msgSend(v38, "leadingAnchor");
    v36 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", 17.0);
    v43[2] = v36;
    v35 = (id)objc_msgSend(v41[0], "trailingAnchor");
    v34 = (id)-[SUSSoftwareUpdateUpdateOptionsCell contentView](v42, "contentView");
    v33 = (id)objc_msgSend(v34, "trailingAnchor");
    v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:", -17.0);
    v43[3] = v32;
    v31 = (id)objc_msgSend(v41[0], "topAnchor");
    v30 = (id)objc_msgSend(v40, "topAnchor");
    v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v43[4] = v29;
    v28 = (id)objc_msgSend(v41[0], "bottomAnchor");
    v27 = (id)objc_msgSend(v40, "bottomAnchor");
    v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v43[5] = v26;
    v25 = (id)objc_msgSend(v41[0], "leadingAnchor");
    v24 = (id)objc_msgSend(v40, "leadingAnchor");
    v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v43[6] = v23;
    v22 = (id)objc_msgSend(v41[0], "trailingAnchor");
    v21 = (id)objc_msgSend(v40, "trailingAnchor");
    v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
    v43[7] = v20;
    v19 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 8);
    objc_msgSend(v18, "activateConstraints:");

    -[SUSSoftwareUpdateUpdateOptionsCell setClipsToBounds:](v42, "setClipsToBounds:", 0);
    objc_msgSend(v41[0], "setClipsToBounds:", 0);
    objc_msgSend(v40, "setClipsToBounds:", 0);
    -[UIButton setClipsToBounds:](v42->_secondaryButton, "setClipsToBounds:", 0);
    v42->_currentActivityIndicatorStyle = 0;
    objc_storeStrong(&v40, 0);
    objc_storeStrong(v41, 0);
  }
}

- (id)_configurePrimaryButton
{
  double v2;
  id v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  SUSSoftwareUpdateUpdateOptionsCell *v21;
  id v22;
  id v23[2];
  SUSSoftwareUpdateUpdateOptionsCell *v24;

  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)objc_msgSend(MEMORY[0x24BEBD438], "filledButtonConfiguration");
  objc_msgSend(v23[0], "setCornerStyle:", 4);
  v7 = (void *)MEMORY[0x24BEBD430];
  v6 = v23[0];
  v5 = (void *)MEMORY[0x24BEBD388];
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __61__SUSSoftwareUpdateUpdateOptionsCell__configurePrimaryButton__block_invoke;
  v20 = &unk_24F762F78;
  v21 = v24;
  v8 = (id)objc_msgSend(v5, "actionWithHandler:");
  v22 = (id)objc_msgSend(v7, "buttonWithConfiguration:primaryAction:", v6);

  v9 = v22;
  v10 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  objc_msgSend(v9, "setTitleColor:forState:");

  v12 = (id)objc_msgSend(v22, "titleLabel");
  v11 = (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB600]);
  objc_msgSend(v12, "setFont:");

  objc_msgSend(v22, "setContentHuggingPriority:forAxis:", 0);
  objc_msgSend(v22, "setClipsToBounds:", 0);
  LODWORD(v2) = 1148846080;
  objc_msgSend(v22, "setContentCompressionResistancePriority:forAxis:", 1, v2);
  v13 = v22;
  v3 = objc_alloc(MEMORY[0x24BEBD740]);
  v14 = (id)objc_msgSend(v3, "initWithTarget:action:", v24, sel__primaryButtonLongTapped_);
  objc_msgSend(v13, "addGestureRecognizer:");

  objc_msgSend(v22, "setContentHorizontalAlignment:", 0);
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("SUSpecifierUpdateOptionsCellPrimaryButton"));
  v15 = v22;
  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong(v23, 0);
  return v15;
}

void __61__SUSSoftwareUpdateUpdateOptionsCell__configurePrimaryButton__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (*(_QWORD *)(a1[4] + 1232))
    (*(void (**)(void))(*(_QWORD *)(a1[4] + 1232) + 16))();
  objc_storeStrong(location, 0);
}

- (id)_configureSecondaryButton
{
  double v2;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(_QWORD *, void *);
  void *v17;
  SUSSoftwareUpdateUpdateOptionsCell *v18;
  id v19;
  id v20[2];
  SUSSoftwareUpdateUpdateOptionsCell *v21;

  v21 = self;
  v20[1] = (id)a2;
  v20[0] = (id)objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  objc_msgSend(v20[0], "setCornerStyle:", 4);
  v6 = (void *)MEMORY[0x24BEBD430];
  v5 = v20[0];
  v4 = (void *)MEMORY[0x24BEBD388];
  v13 = MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __63__SUSSoftwareUpdateUpdateOptionsCell__configureSecondaryButton__block_invoke;
  v17 = &unk_24F762F78;
  v18 = v21;
  v7 = (id)objc_msgSend(v4, "actionWithHandler:");
  v19 = (id)objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v5);

  v8 = v19;
  v9 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  objc_msgSend(v8, "setTitleColor:forState:");

  v11 = (id)objc_msgSend(v19, "titleLabel");
  v10 = (id)objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB608]);
  objc_msgSend(v11, "setFont:");

  objc_msgSend(v19, "setContentHuggingPriority:forAxis:", 0);
  objc_msgSend(v19, "setClipsToBounds:", 0);
  LODWORD(v2) = 1148846080;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 1, v2);
  objc_msgSend(v19, "setContentHorizontalAlignment:", 0);
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("SUSpecifierUpdateOptionsCellSecondaryButton"));
  v12 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(v20, 0);
  return v12;
}

void __63__SUSSoftwareUpdateUpdateOptionsCell__configureSecondaryButton__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (*(_QWORD *)(a1[4] + 1248))
    (*(void (**)(void))(*(_QWORD *)(a1[4] + 1248) + 16))();
  objc_storeStrong(location, 0);
}

- (void)_addActivityIndicatorFor:(id)a3
{
  uint64_t v3;
  UIActivityIndicatorView *activityIndicator;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v15;
  _QWORD v16[2];
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v15->_activityIndicator;
    v15->_activityIndicator = (UIActivityIndicatorView *)v3;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v15->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidden:](v15->_activityIndicator, "setHidden:", 0);
    -[UIActivityIndicatorView startAnimating](v15->_activityIndicator, "startAnimating");
    objc_msgSend(location[0], "addSubview:", v15->_activityIndicator);
    v5 = (void *)MEMORY[0x24BDD1628];
    v12 = (id)-[UIActivityIndicatorView centerYAnchor](v15->_activityIndicator, "centerYAnchor");
    v11 = (id)objc_msgSend(location[0], "centerYAnchor");
    v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v16[0] = v10;
    v9 = (id)-[UIActivityIndicatorView trailingAnchor](v15->_activityIndicator, "trailingAnchor");
    v8 = (id)objc_msgSend(location[0], "trailingAnchor");
    v7 = (id)objc_msgSend(v9, "constraintEqualToAnchor:constant:", -10.0);
    v16[1] = v7;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    objc_msgSend(v5, "activateConstraints:");

  }
  else
  {
    v13 = _SUSLoggingFacility();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v17, (uint64_t)"-[SUSSoftwareUpdateUpdateOptionsCell _addActivityIndicatorFor:]");
      _os_log_error_impl(&dword_22CBAC000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "%s: Can't add the activity indicator to a nil button.", v17, 0xCu);
    }
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_configureStackViewMargin
{
  if ((-[UIButton isHidden](self->_primaryButton, "isHidden") & 1) != 0)
  {
    -[NSLayoutConstraint setConstant:](self->_stackViewTopAnchor, "setConstant:", 6.0);
    -[NSLayoutConstraint setConstant:](self->_stackViewBottomAnchor, "setConstant:", -6.0);
  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_stackViewTopAnchor, "setConstant:", 12.0);
    -[NSLayoutConstraint setConstant:](self->_stackViewBottomAnchor, "setConstant:", -12.0);
  }
}

- (void)_primaryButtonLongTapped:(id)a3
{
  id location[2];
  SUSSoftwareUpdateUpdateOptionsCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_primaryButtonLongTapAction)
    (*((void (**)(void))v4->_primaryButtonLongTapAction + 2))();
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewBottomAnchor, 0);
  objc_storeStrong((id *)&self->_stackViewTopAnchor, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong(&self->_secondaryButtonAction, 0);
  objc_storeStrong(&self->_primaryButtonLongTapAction, 0);
  objc_storeStrong(&self->_primaryButtonAction, 0);
  objc_storeStrong((id *)&self->_secondaryButtonContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_secondaryButtonMenu, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end
