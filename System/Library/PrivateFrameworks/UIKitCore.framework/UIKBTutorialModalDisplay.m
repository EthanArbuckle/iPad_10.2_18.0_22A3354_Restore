@implementation UIKBTutorialModalDisplay

- (UIEdgeInsets)safeAreaInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)constructMediaView
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  UIKBTutorialSinglePageView *v10;
  void *v11;
  UIKBTutorialSinglePageView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v36;
  void *v37;
  UIKBTutorialMultipageView *v38;
  UIKBTutorialMultipageView *v39;

  -[UIKBTutorialModalDisplay mediaContents](self, "mediaContents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[UIKBTutorialModalDisplay textTitleDescriptions](self, "textTitleDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v3, "count");
    -[UIKBTutorialModalDisplay textBodyDescriptions](self, "textBodyDescriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 != v8)
    {
      v39 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v9 = 0;
      do
      {
        v10 = [UIKBTutorialSinglePageView alloc];
        objc_msgSend(v3, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[UIKBTutorialSinglePageView initWithImageView:](v10, "initWithImageView:", v11);

        -[UIKBTutorialModalDisplay textTitleDescriptions](self, "textTitleDescriptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          -[UIKBTutorialModalDisplay textTitleDescriptions](self, "textTitleDescriptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndex:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTutorialSinglePageView textTitle](v12, "textTitle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setText:", v17);

          -[UIKBTutorialModalDisplay textTitleFont](self, "textTitleFont");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTutorialSinglePageView textTitle](v12, "textTitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setFont:", v19);

          -[UIKBTutorialModalDisplay styling](self, "styling");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "mainTextColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTutorialSinglePageView textTitle](v12, "textTitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setTextColor:", v22);

        }
        -[UIKBTutorialModalDisplay textBodyDescriptions](self, "textBodyDescriptions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
        {
          -[UIKBTutorialModalDisplay textBodyDescriptions](self, "textBodyDescriptions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndex:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTutorialSinglePageView textBody](v12, "textBody");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setText:", v28);

          -[UIKBTutorialModalDisplay textBodyFont](self, "textBodyFont");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTutorialSinglePageView textBody](v12, "textBody");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setFont:", v30);

          -[UIKBTutorialModalDisplay styling](self, "styling");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "mainTextColor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTutorialSinglePageView textBody](v12, "textBody");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setTextColor:", v33);

          v35 = -[UIKBTutorialModalDisplay textBodyMaxLines](self, "textBodyMaxLines");
          -[UIKBTutorialSinglePageView textBody](v12, "textBody");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setNumberOfLines:", v35);

          -[UIKBTutorialSinglePageView textBody](v12, "textBody");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setAdjustsFontSizeToFitWidth:", 1);

        }
        if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
          && -[UIKBTutorialModalDisplay presentsFullScreen](self, "presentsFullScreen"))
        {
          -[UIKBTutorialSinglePageView setUseAlertStyle:](v12, "setUseAlertStyle:", 1);
        }
        objc_msgSend(v5, "addObject:", v12);

        ++v9;
      }
      while (v9 < objc_msgSend(v3, "count"));
    }
    v38 = [UIKBTutorialMultipageView alloc];
    -[UIKBTutorialModalDisplay pagingInterval](self, "pagingInterval");
    v39 = -[UIKBTutorialMultipageView initWithPageViews:pagingInterval:](v38, "initWithPageViews:pagingInterval:", v5);
  }
  else
  {
    v39 = 0;
  }

LABEL_17:
  return v39;
}

- (UIFont)textBodyFont
{
  return (UIFont *)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
}

- (UIKBTutorialModalDisplayStyling)styling
{
  return self->_styling;
}

- (BOOL)presentsFullScreen
{
  return 0;
}

- (double)pagingInterval
{
  return 0.0;
}

- (UIKBTutorialModalDisplay)initWithKeyboardAppearance:(int64_t)a3
{
  UIKBTutorialModalDisplay *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UIKBTutorialModalDisplayStyling *v9;
  UIKBTutorialModalDisplayStyling *styling;
  UIVisualEffectView *v11;
  UIVisualEffectView *backgroundBlurView;
  void *v13;
  UIView *v14;
  UIView *containerView;
  uint64_t v16;
  UIView *mediaView;
  uint64_t v18;
  UIButton *button;
  UIButton *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  void *v24;
  void *v25;
  UIKBTutorialModalDisplay *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)UIKBTutorialModalDisplay;
  v4 = -[UIView init](&v28, sel_init);
  if (v4)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v4->_appearance = a3;
    if (a3 == 10 || !a3)
    {
      -[UIView traitCollection](v4, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceStyle");

      v8 = 1;
      if (v7 != 2)
        v8 = 2;
      v4->_appearance = v8;
    }
    v9 = -[UIKBTutorialModalDisplayStyling initWithKeyboardAppearance:]([UIKBTutorialModalDisplayStyling alloc], "initWithKeyboardAppearance:", v4->_appearance);
    styling = v4->_styling;
    v4->_styling = v9;

    v11 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
    backgroundBlurView = v4->_backgroundBlurView;
    v4->_backgroundBlurView = v11;

    -[UIKBTutorialModalDisplayStyling backgroundEffects](v4->_styling, "backgroundEffects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v4->_backgroundBlurView, "setBackgroundEffects:", v13);

    -[UIView addSubview:](v4, "addSubview:", v4->_backgroundBlurView);
    v14 = objc_alloc_init(UIView);
    containerView = v4->_containerView;
    v4->_containerView = v14;

    -[UIView addSubview:](v4, "addSubview:", v4->_containerView);
    -[UIKBTutorialModalDisplay constructMediaView](v4, "constructMediaView");
    v16 = objc_claimAutoreleasedReturnValue();
    mediaView = v4->_mediaView;
    v4->_mediaView = (UIView *)v16;

    if (v4->_mediaView)
      -[UIView addSubview:](v4->_containerView, "addSubview:");
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (UIButton *)v18;

    v20 = v4->_button;
    -[UIKBTutorialModalDisplay buttonTitle](v4, "buttonTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v20, "setTitle:forState:", v21, 0);

    v22 = v4->_button;
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v22, "setTitleColor:forState:", v23, 0);

    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 18.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v4->_button, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFont:", v24);

    -[UIControl addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel_tapInsideButton_, 64);
    -[UIView addSubview:](v4->_containerView, "addSubview:", v4->_button);
    v26 = v4;
  }

  return v4;
}

- (UIButton)button
{
  return self->_button;
}

- (NSString)buttonTitle
{
  return (NSString *)_UILocalizedStringInSystemLanguage(CFSTR("Continue"), CFSTR("Continue"));
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_adjustableConstraints, 0);
  objc_storeStrong((id *)&self->_containerViewTopConstraits, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_styling, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)layoutSubviews
{
  -[UIKBTutorialModalDisplay configBackgroundBlur](self, "configBackgroundBlur");
  -[UIKBTutorialModalDisplay configContainerView](self, "configContainerView");
}

- (BOOL)isPortrait
{
  void *v2;
  BOOL v3;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v2, "interfaceOrientation") - 5) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (double)containerTopPadding
{
  _BOOL4 v3;
  double result;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v3 = -[UIKBTutorialModalDisplay isPortrait](self, "isPortrait");
    result = 60.0;
    if (v3)
      return 20.0;
  }
  else
  {
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_inputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_inputAssistantView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v8 + v11;

    -[UIKBTutorialModalDisplay safeAreaInsets](self, "safeAreaInsets");
    if (v13 <= 0.0)
    {
      -[UIView _rootInputWindowController](self, "_rootInputWindowController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_inputAssistantView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[UIKBTutorialModalDisplay textBodyDescriptions](self, "textBodyDescriptions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = dbl_18667CC40[(unint64_t)objc_msgSend(v18, "length") > 0xBE];

      }
      else
      {
        v14 = 0.12;
      }

    }
    else
    {
      v14 = 0.2;
    }
    return v12 * v14;
  }
  return result;
}

- (double)containerBottomPadding
{
  unint64_t v3;
  double result;
  double v5;

  v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  result = 20.0;
  if (v3 != 1)
  {
    -[UIKBTutorialModalDisplay safeAreaInsets](self, "safeAreaInsets", 20.0);
    result = 34.0;
    if (v5 <= 0.0)
      return 19.0;
  }
  return result;
}

- (void)configBackgroundBlur
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  id v57;

  if (-[UIKBTutorialModalDisplay presentsFullScreen](self, "presentsFullScreen"))
  {
    -[UIKBTutorialModalDisplay backgroundBlurView](self, "backgroundBlurView");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "removeFromSuperview");
    goto LABEL_17;
  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "_inputAssistantView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_showsScribbleIconsInAssistantView");

      if ((v12 & 1) == 0)
      {
        -[UIView _rootInputWindowController](self, "_rootInputWindowController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_inputAssistantView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {

    }
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_inputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    if (v14)
      objc_msgSend(v15, "_inputView");
    else
      objc_msgSend(v15, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v5, "_inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v16 = v7;
  objc_msgSend(v7, "topAnchor");
  v57 = (id)objc_claimAutoreleasedReturnValue();

  v17 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "_inputView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v22 = -fabs(v21);
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v24 = fabs(v23);
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v26 = -fabs(v25);
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v28 = fabs(v27);
  }
  else
  {
    objc_msgSend(v18, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0.0;
    v22 = 0.0;
    v24 = 0.0;
    v28 = 0.0;
  }
  -[UIView topAnchor](self, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v57, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UIView bottomAnchor](self, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[UIView leftAnchor](self, "leftAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[UIView rightAnchor](self, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, v28);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[UIKBTutorialModalDisplay backgroundBlurView](self, "backgroundBlurView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialModalDisplay backgroundBlurView](self, "backgroundBlurView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[UIKBTutorialModalDisplay backgroundBlurView](self, "backgroundBlurView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[UIKBTutorialModalDisplay backgroundBlurView](self, "backgroundBlurView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leftAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leftAnchor](self, "leftAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[UIKBTutorialModalDisplay backgroundBlurView](self, "backgroundBlurView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView rightAnchor](self, "rightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

LABEL_17:
}

- (void)configContainerView
{
  if (-[UIKBTutorialModalDisplay presentsFullScreen](self, "presentsFullScreen"))
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      -[UIKBTutorialModalDisplay containerForFullScreenView](self, "containerForFullScreenView");
    else
      -[UIKBTutorialModalDisplay containerForAlertPresentation](self, "containerForAlertPresentation");
  }
  else
  {
    -[UIKBTutorialModalDisplay containerForKeyboardView](self, "containerForKeyboardView");
  }
}

- (void)containerForKeyboardView
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  UILayoutGuide *v7;
  void *v8;
  uint64_t SafeDeviceIdiom;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
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
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
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
  _QWORD v80[2];

  v80[1] = *MEMORY[0x1E0C80C00];
  -[UIKBTutorialModalDisplay adjustableConstraints](self, "adjustableConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if ((v5 & 1) == 0)
  {
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = objc_alloc_init(UILayoutGuide);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v7);
    -[UILayoutGuide widthAnchor](v7, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    v10 = 320.0;
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v10 = 448.0;
    objc_msgSend(v8, "constraintEqualToConstant:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v7, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay mediaLayoutWidthAdjustment](self, "mediaLayoutWidthAdjustment");
    objc_msgSend(v13, "constraintEqualToAnchor:multiplier:constant:", v14, 1.0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay setWidthAdjustmentConstraint:](self, "setWidthAdjustmentConstraint:", v16);

    -[UIKBTutorialModalDisplay widthAdjustmentConstraint](self, "widthAdjustmentConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay setContainerViewTopConstraits:](self, "setContainerViewTopConstraits:", v25);

    -[UIKBTutorialModalDisplay containerViewTopConstraits](self, "containerViewTopConstraits");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UIView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UIKBTutorialModalDisplay button](self, "button");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialModalDisplay button](self, "button");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[UIKBTutorialModalDisplay button](self, "button");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "widthAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:multiplier:", v41, 0.7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v43 = 50.0;
    else
      v43 = 21.0;
    -[UIKBTutorialModalDisplay button](self, "button");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    v47 = 0.0;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      -[UIKBTutorialModalDisplay safeAreaInsets](self, "safeAreaInsets");
      if (v48 <= 0.0)
        v47 = 23.0;
      else
        v47 = 0.0;
    }
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay button](self, "button");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, v47);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setActive:", 1);

    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "centerXAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    -[UIKBTutorialModalDisplay button](self, "button");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = objc_msgSend(v65, "isHidden");

    if ((_DWORD)v61)
    {
      -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "bottomAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTutorialModalDisplay setAdjustableConstraints:](self, "setAdjustableConstraints:", v70);
    }
    else
    {
      -[UIKBTutorialModalDisplay button](self, "button");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bottomAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTutorialModalDisplay setAdjustableConstraints:](self, "setAdjustableConstraints:", v71);

    }
    v72 = (void *)MEMORY[0x1E0D156E0];
    -[UIKBTutorialModalDisplay adjustableConstraints](self, "adjustableConstraints");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "activateConstraints:", v73);

    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "widthAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialModalDisplay containerView](self, "containerView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setActive:", 1);

  }
}

- (void)containerForFullScreenView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILayoutGuide *v20;
  UILabel *v21;
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
  double v48;
  void *v49;
  UILayoutGuide *v50;
  UILayoutGuide *v51;
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
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  UILayoutGuide *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  UILayoutGuide *v113;
  UILayoutGuide *v114;
  UILabel *v115;
  _QWORD v116[9];
  _QWORD v117[3];
  _QWORD v118[7];

  v118[5] = *MEMORY[0x1E0C80C00];
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[UIView trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[UIView bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  v20 = objc_alloc_init(UILayoutGuide);
  -[UIView addLayoutGuide:](self, "addLayoutGuide:");
  v21 = objc_alloc_init(UILabel);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKBTutorialModalDisplay largeTitleFont](self, "largeTitleFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v21, "setFont:", v22);

  -[UIKBTutorialModalDisplay largeTitle](self, "largeTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v21, "setText:", v23);

  -[UILabel setTextAlignment:](v21, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v21, "setAdjustsFontSizeToFitWidth:", 1);
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v21);

  v89 = (void *)MEMORY[0x1E0D156E0];
  -[UILayoutGuide topAnchor](v20, "topAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v105);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v102;
  v114 = v20;
  -[UILayoutGuide heightAnchor](v20, "heightAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:multiplier:", v93, 0.09);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v91;
  -[UIView topAnchor](v21, "topAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](v20, "bottomAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:constant:", v85, 8.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v83;
  v115 = v21;
  -[UIView leadingAnchor](v21, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v28;
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v21, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v31, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "activateConstraints:", v33);

  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v97 = (void *)MEMORY[0x1E0D156E0];
  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "topAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v115, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v106);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v103;
  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v37;
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "activateConstraints:", v43);

  -[UIKBTutorialModalDisplay button](self, "button");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialModalDisplay button](self, "button");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToConstant:", 327.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v48) = 1148829696;
  v49 = v47;
  v82 = v47;
  objc_msgSend(v47, "setPriority:", v48);
  v50 = objc_alloc_init(UILayoutGuide);
  -[UIView addLayoutGuide:](self, "addLayoutGuide:", v50);
  v51 = objc_alloc_init(UILayoutGuide);
  -[UIView addLayoutGuide:](self, "addLayoutGuide:", v51);
  v77 = (void *)MEMORY[0x1E0D156E0];
  -[UILayoutGuide widthAnchor](v51, "widthAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide widthAnchor](v50, "widthAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:multiplier:", v104, 1.0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v101;
  v113 = v50;
  -[UILayoutGuide leadingAnchor](v50, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "leadingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v92, 1.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v90;
  -[UIKBTutorialModalDisplay button](self, "button");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v50, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v84);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v81;
  v107 = v51;
  -[UILayoutGuide leadingAnchor](v51, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay button](self, "button");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v76;
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](v51, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v73, 1.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v116[4] = v72;
  -[UIKBTutorialModalDisplay button](self, "button");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "heightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToConstant:", 50.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v116[5] = v69;
  -[UIKBTutorialModalDisplay button](self, "button");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v53, 128.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v116[6] = v54;
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay button](self, "button");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 55.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v116[7] = v59;
  v116[8] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 9);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "activateConstraints:", v60);

  -[UIKBTutorialModalDisplay styling](self, "styling");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "buttonTextColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay button](self, "button");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setBackgroundColor:", v62);

  -[UIKBTutorialModalDisplay button](self, "button");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setTitleColor:forState:", v65, 0);

  -[UIKBTutorialModalDisplay button](self, "button");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "_setContinuousCornerRadius:", 14.0);

}

- (void)containerForAlertPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id v62;

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[UIView trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[UIView bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UIKBTutorialModalDisplay button](self, "button");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIKBTutorialModalDisplay button](self, "button");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[UIKBTutorialModalDisplay button](self, "button");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  -[UIKBTutorialModalDisplay button](self, "button");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToConstant:", 50.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[UIKBTutorialModalDisplay button](self, "button");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 0.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setActive:", 1);

  -[UIKBTutorialModalDisplay containerView](self, "containerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay button](self, "button");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 0.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  -[UIKBTutorialModalDisplay button](self, "button");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTutorialModalDisplay styling](self, "styling");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "buttonTextColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setTitleColor:forState:", v61, 0);

}

- (CGSize)sizeForTutorialPageView
{
  unint64_t v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  v4 = -[UIKBTutorialModalDisplay isPortrait](self, "isPortrait");
  v5 = 201.6;
  if (!v4)
    v5 = 246.4;
  v6 = 160.0;
  if (!v4)
    v6 = 96.0;
  v7 = 320.0;
  if (v3 == 1)
    v7 = 448.0;
  else
    v5 = v6;
  result.height = v5;
  result.width = v7;
  return result;
}

- (void)updateMediaViewTextAndPlacement
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBTutorialModalDisplay mediaLayoutWidthAdjustment](self, "mediaLayoutWidthAdjustment");
    v5 = v4;
    -[UIKBTutorialModalDisplay widthAdjustmentConstraint](self, "widthAdjustmentConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", v5);

    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageViews");
    v49 = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v49, "count");
    v9 = v49;
    if (v8)
    {
      for (i = 0; i < v37; ++i)
      {
        objc_msgSend(v9, "objectAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBTutorialModalDisplay textTitleDescriptions](self, "textTitleDescriptions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
        {
          -[UIKBTutorialModalDisplay textTitleDescriptions](self, "textTitleDescriptions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", i);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textTitle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setText:", v16);

          -[UIKBTutorialModalDisplay textTitleFont](self, "textTitleFont");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textTitle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFont:", v18);

          -[UIKBTutorialModalDisplay styling](self, "styling");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "mainTextColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textTitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTextColor:", v21);

        }
        else
        {
          objc_msgSend(v11, "textTitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setText:", &stru_1E16EDF20);
        }

        -[UIKBTutorialModalDisplay textBodyDescriptions](self, "textBodyDescriptions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndex:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");

        if (v25)
        {
          -[UIKBTutorialModalDisplay textBodyDescriptions](self, "textBodyDescriptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndex:", i);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textBody");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setText:", v27);

          -[UIKBTutorialModalDisplay textBodyFont](self, "textBodyFont");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textBody");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFont:", v29);

          -[UIKBTutorialModalDisplay styling](self, "styling");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "mainTextColor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textBody");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setTextColor:", v32);

          v34 = -[UIKBTutorialModalDisplay textBodyMaxLines](self, "textBodyMaxLines");
          objc_msgSend(v11, "textBody");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setNumberOfLines:", v34);

          objc_msgSend(v11, "textBody");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setAdjustsFontSizeToFitWidth:", 1);
        }
        else
        {
          objc_msgSend(v11, "textBody");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setText:", &stru_1E16EDF20);
        }

        objc_msgSend(v11, "setNeedsLayout");
        v37 = objc_msgSend(v49, "count");
        v9 = v49;
      }
    }
    v38 = (void *)MEMORY[0x1E0D156E0];
    -[UIKBTutorialModalDisplay adjustableConstraints](self, "adjustableConstraints");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "deactivateConstraints:", v39);

    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIKBTutorialModalDisplay button](self, "button");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isHidden");

    if ((v42 & 1) != 0)
    {
      -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bottomAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v46);
    }
    else
    {
      -[UIKBTutorialModalDisplay button](self, "button");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v47);

    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v40);
    -[UIKBTutorialModalDisplay setAdjustableConstraints:](self, "setAdjustableConstraints:", v40);
    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layoutIfNeeded");

  }
}

- (void)tapInsideButton:(id)a3
{
  void *v4;

  -[UIView superview](self, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBTutorialModalDisplay extraButtonTapAction](self, "extraButtonTapAction");
    -[UIView removeFromSuperview](self, "removeFromSuperview");
  }
}

- (void)restartPagingAnimation
{
  void *v3;
  char v4;
  id v5;

  -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKBTutorialModalDisplay mediaView](self, "mediaView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetPageScrolling");

  }
}

- (NSArray)textTitleDescriptions
{
  return (NSArray *)&unk_1E1A934E8;
}

- (UIFont)textTitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleBody"), 2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (NSArray)textBodyDescriptions
{
  return (NSArray *)&unk_1E1A93500;
}

- (NSString)largeTitle
{
  return (NSString *)CFSTR("Title");
}

- (UIFont)largeTitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleTitle0"), 2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (NSArray)mediaContents
{
  UIImageView *v2;
  void *v3;
  UIImageView *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = [UIImageView alloc];
  _UIImageWithName(CFSTR("globe_tutorial-light"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIImageView initWithImage:](v2, "initWithImage:", v3);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (double)mediaLayoutWidthAdjustment
{
  return 0.0;
}

- (int64_t)textBodyMaxLines
{
  return 0;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)mediaView
{
  return self->_mediaView;
}

- (void)setMediaView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaView, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setStyling:(id)a3
{
  objc_storeStrong((id *)&self->_styling, a3);
}

- (UIVisualEffectView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurView, a3);
}

- (NSLayoutConstraint)containerViewTopConstraits
{
  return self->_containerViewTopConstraits;
}

- (void)setContainerViewTopConstraits:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewTopConstraits, a3);
}

- (NSArray)adjustableConstraints
{
  return self->_adjustableConstraints;
}

- (void)setAdjustableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_adjustableConstraints, a3);
}

- (NSLayoutConstraint)widthAdjustmentConstraint
{
  return self->_widthAdjustmentConstraint;
}

- (void)setWidthAdjustmentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthAdjustmentConstraint, a3);
}

@end
