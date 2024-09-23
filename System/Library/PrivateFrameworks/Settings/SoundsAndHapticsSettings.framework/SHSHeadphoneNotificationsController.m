@implementation SHSHeadphoneNotificationsController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  UIView *v10;
  UIView *descriptionLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  objc_super v50;
  _QWORD v51[10];

  v51[8] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)SHSHeadphoneNotificationsController;
  -[SHSHeadphoneNotificationsController loadView](&v50, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SHSHeadphoneNotificationsController createScrollView](self, "createScrollView");
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[SHSHeadphoneNotificationsController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_scrollView);

  -[SHSHeadphoneNotificationsController createTitleLabel](self, "createTitleLabel");
  v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  -[SHSHeadphoneNotificationsController createDescriptionLabel](self, "createDescriptionLabel");
  v10 = (UIView *)objc_claimAutoreleasedReturnValue();
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v10;

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_titleLabel);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_descriptionLabel);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "safeAreaLayoutGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v44;
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v39;
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "safeAreaLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v34;
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v29;
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:multiplier:", v27, 0.9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v26;
  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView centerXAnchor](self->_scrollView, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v13;
  -[UIView widthAnchor](self->_descriptionLabel, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v15, 0.9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v16;
  -[UIView centerXAnchor](self->_descriptionLabel, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView centerXAnchor](self->_scrollView, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObjectsFromArray:", v20);

  _NSDictionaryOfVariableBindings(CFSTR("titleLabelMargin, descriptionLabelMargin"), &unk_24F19D978, &unk_24F19D988, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDD1628];
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _descriptionLabel"), self->_titleLabel, self->_descriptionLabel, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(titleLabelMargin)-[_titleLabel]-(descriptionLabelMargin)-[_descriptionLabel]-|"), 0, v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObjectsFromArray:", v24);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v49);
}

- (id)titleText
{
  return SHS_LocalizedStringForSounds(CFSTR("ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_TITLE"));
}

- (id)linkText:(id)a3 withLink:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1688];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithString:attributes:", v7, 0);

  v9 = objc_msgSend(v8, "length");
  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "footerHyperlinkColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x24BEBB368];
  v17[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributes:range:", v12, 0, v9);
  v13 = *MEMORY[0x24BEBB388];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAttribute:value:range:", v13, v14, 0, v9);
  return v8;
}

- (id)bluetoothSettingsLinkText
{
  void *v3;
  void *v4;

  SHS_LocalizedStringForSounds(CFSTR("CLASSIFY_BLUETOOTH_DEVICES_IN_SETTINGS_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController linkText:withLink:](self, "linkText:withLink:", v3, CFSTR("prefs:root=Bluetooth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)healthLinkText
{
  void *v3;
  void *v4;

  SHS_LocalizedStringForSounds(CFSTR("LEARN_MORE_IN_HEALTH_LINK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationsController linkText:withLink:](self, "linkText:withLink:", v3, CFSTR("x-apple-Health://HearingAppPlugin.healthplugin/SafeHeadphoneListening"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fontDescriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v32, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v4, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BDD1458]);
  SHS_LocalizedStringForSounds(CFSTR("ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_DETAILS_1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v7 = objc_alloc(MEMORY[0x24BDD1458]);
  SHS_LocalizedStringForSounds(CFSTR("ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_SUBTITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  SHS_LocalizedStringForSounds(CFSTR("ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_DETAILS_2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v10, "initWithString:", v11);

  -[SHSHeadphoneNotificationsController bluetoothSettingsLinkText](self, "bluetoothSettingsLinkText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  SHS_LocalizedStringForSounds(CFSTR("ABOUT_HEADPHONE_LEVEL_WEEKLY_NOTIFICATIONS_DETAILS_3"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v12, "initWithString:", v13);

  -[SHSHeadphoneNotificationsController healthLinkText](self, "healthLinkText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "appendAttributedString:", v30);
  objc_msgSend(v15, "appendAttributedString:", v9);
  objc_msgSend(v15, "appendAttributedString:", v29);
  objc_msgSend(v15, "appendAttributedString:", v28);
  objc_msgSend(v15, "appendAttributedString:", v27);
  objc_msgSend(v15, "appendAttributedString:", v14);
  v16 = objc_msgSend(v15, "length");
  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x24BEBB360];
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v26, 0, v16);
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v18, 0, v16);
  objc_msgSend(v15, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "rangeOfString:", v21);
  v24 = v23;

  objc_msgSend(v15, "addAttribute:value:range:", v19, v31, v22, v24);
  objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x24BEBB440], MEMORY[0x24BDBD1C0], 0, v16);

  return v15;
}

- (id)createScrollView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = objc_alloc(MEMORY[0x24BEBD918]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v4, "setContentInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  objc_msgSend(v4, "setScrollEnabled:", 1);
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 1);
  -[SHSHeadphoneNotificationsController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  objc_msgSend(v4, "contentSize");
  objc_msgSend(v4, "setContentSize:", v7);

  return v4;
}

- (id)createTitleLabel
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SHSHeadphoneNotificationsController titleText](self, "titleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  LODWORD(v5) = 1036831949;
  objc_msgSend(v3, "_setHyphenationFactor:", v5);
  objc_msgSend(v3, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE240], 1024);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  return v3;
}

- (id)createDescriptionLabel
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "setSelectable:", 1);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SHSHeadphoneNotificationsController descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v5);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v7 = a4;
  v8 = v7;
  if (!a6)
  {
    objc_msgSend(v7, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("prefs")))
    {

    }
    else
    {
      objc_msgSend(v8, "scheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("x-apple-health"));

      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "openURL:withCompletionHandler:", v8, 0);
        goto LABEL_7;
      }
    }
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openSensitiveURL:withOptions:", v8, 0);
LABEL_7:

  }
  return 0;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
