@implementation TVRUIDevicePickerViewController

- (void)loadView
{
  id v3;

  v3 = -[_TVRUIDevicePickerView _initWithViewController:]([_TVRUIDevicePickerView alloc], "_initWithViewController:", self);
  -[TVRUIDevicePickerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  TVREventHaptic *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRUIDevicePickerViewController;
  -[TVRUIDevicePickerViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[TVRUIDevicePickerViewController _setupDeviceTitleView](self, "_setupDeviceTitleView");
  -[TVRUIDevicePickerViewController _setupButtons](self, "_setupButtons");
  -[TVRUIDevicePickerViewController resetSelectedDevice](self, "resetSelectedDevice");
  -[TVRUIDevicePickerViewController _setupDeviceList](self, "_setupDeviceList");
  -[TVRUIDevicePickerViewController _setupAnimators](self, "_setupAnimators");
  v3 = objc_alloc_init(TVREventHaptic);
  -[TVRUIDevicePickerViewController setEventHaptic:](self, "setEventHaptic:", v3);

  -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultDeviceTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v6, 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  void *v28;
  CGFloat v29;
  void *v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double Height;
  void *v39;
  double Width;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  CGFloat v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topControlPanelInsets");
  v14 = v13;
  v16 = v15;

  v17 = self->_baseHeight * 0.5 + -24.0;
  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v14, v17, 48.0, 48.0);

  -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v14, v17, 48.0, 48.0);

  -[TVRUIDevicePickerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = CGRectGetMaxX(v55) - v16 + -48.0;
  v22 = v5;
  v56.origin.x = v5;
  v23 = v7;
  v56.origin.y = v7;
  v24 = v9;
  v56.size.width = v9;
  v25 = v11;
  v56.size.height = v11;
  v26 = CGRectGetMidY(v56) + -24.0;
  -[TVRUIDevicePickerViewController powerButton](self, "powerButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v21, v26, 48.0, 48.0);

  -[TVRUIDevicePickerViewController powerButton](self, "powerButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v29 = CGRectGetMinX(v57) + -10.0;
  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v31 = v29 - (CGRectGetMaxX(v58) + 10.0);

  -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  objc_msgSend(v32, "setFrame:", CGRectGetMaxX(v59) + 10.0, 0.0, v31, self->_baseHeight);

  -[TVRUIDevicePickerViewController tableViewTopSeperator](self, "tableViewTopSeperator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "touchpadInsets");
  v37 = v36;
  v60.origin.x = v22;
  v60.origin.y = v23;
  v60.size.width = v24;
  v60.size.height = v25;
  Height = CGRectGetHeight(v60);
  -[TVRUIDevicePickerViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  Width = CGRectGetWidth(v61);
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "touchpadInsets");
  v43 = Width - v42;
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "touchpadInsets");
  objc_msgSend(v34, "setFrame:", v37, Height, v43 - v45, 1.0);

  -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v62.origin.x = v22;
  v62.origin.y = v23;
  v62.size.width = v24;
  v62.size.height = v25;
  v46 = CGRectGetMaxY(v62) + 2.0;
  -[TVRUIDevicePickerViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  v48 = CGRectGetWidth(v63);
  -[TVRUIDevicePickerViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v50 = CGRectGetHeight(v64);
  v65.origin.x = v22;
  v65.origin.y = v23;
  v65.size.width = v24;
  v65.size.height = v25;
  v51 = v50 - CGRectGetHeight(v65) + -2.0;
  -[TVRUIDevicePickerViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "safeAreaInsets");
  objc_msgSend(v54, "setFrame:", 0.0, v46, v48, v51 - v53);

}

- (void)_setupButtons
{
  TVRUIButton *v3;
  TVRUIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *muteButtonOverride;
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
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 29, 0);
  -[TVRUIDevicePickerViewController setMuteButton:](self, "setMuteButton:", v3);

  v4 = -[TVRUIButton initWithType:hasTapAction:]([TVRUIButton alloc], "initWithType:hasTapAction:", 30, 0);
  -[TVRUIDevicePickerViewController setPowerButton:](self, "setPowerButton:", v4);

  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  -[TVRUIDevicePickerViewController powerButton](self, "powerButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController setButtons:](self, "setButtons:", v7);

  -[TVRUIDevicePickerViewController _updateButtonsShapes](self, "_updateButtonsShapes");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[TVRUIDevicePickerViewController buttons](self, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[TVRUIDevicePickerViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v13);

        objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 1);
        objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__buttonReleased_, 448);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  if (+[TVRUIFeatures replaceMuteButtonWithContextMenu](TVRUIFeatures, "replaceMuteButtonWithContextMenu"))
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
    muteButtonOverride = self->_muteButtonOverride;
    self->_muteButtonOverride = v15;

    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "primaryTextAndGlyphColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v18);

    -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "symbolImageForButtonPanelNamed:", CFSTR("ellipsis.circle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:forState:", v22, 0);

    -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShowsMenuAsPrimaryAction:", 1);

    -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

    -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 0.0);

    -[TVRUIDevicePickerViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x24BED2718];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __48__TVRUIDevicePickerViewController__setupButtons__block_invoke;
  v32[3] = &unk_24DE2CC58;
  v32[4] = self;
  v31 = (id)objc_msgSend(v28, "addObserverForName:object:queue:usingBlock:", v29, 0, v30, v32);

}

uint64_t __48__TVRUIDevicePickerViewController__setupButtons__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonsShapes");
}

- (void)_updateButtonsShapes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TVRUIDevicePickerViewController buttons](self, "buttons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(v8, "setHasButtonShape:", _AXSButtonShapesEnabled() != 0);
        if ((objc_msgSend(v8, "hasButtonShape") & 1) != 0)
        {
          -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "buttonBackgroundColor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setBackgroundColor:", v10);

        }
        else
        {
          objc_msgSend(v8, "setBackgroundColor:", 0);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_setupDeviceTitleView
{
  void *v3;
  TVRUITitleView *v4;
  void *v5;
  TVRUITitleView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [TVRUITitleView alloc];
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TVRUITitleView initWithStyleProvider:](v4, "initWithStyleProvider:", v5);
    -[TVRUIDevicePickerViewController setDeviceTitleView:](self, "setDeviceTitleView:", v6);

    -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__toggleState);
    objc_msgSend(v13, "setCancelsTouchesInView:", 0);
    -[TVRUIDevicePickerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v13);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", self, sel__titleWasLongPressed_);
    objc_msgSend(v11, "setMinimumPressDuration:", 1.2);
    -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v11);

  }
}

- (void)_setupTitleButtonIfNeeded
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
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;

  -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController setTitleButton:](self, "setTitleButton:", v4);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontForDeviceTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v8);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textColorForDeviceTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v16);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "primaryTextAndGlyphColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v19);

    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "chevronImage");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:forState:", v37, 0);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentMode:", 1);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tintColorForChevronImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTintColor:", v27);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel__toggleState, 64);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContentHorizontalAlignment:", 0);

    v30 = (void *)MEMORY[0x24BEBDB00];
    -[TVRUIDevicePickerViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v31, "semanticContentAttribute"));

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32)
      v35 = 3;
    else
      v35 = 4;
    objc_msgSend(v33, "setSemanticContentAttribute:", v35);

    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPointerStyleProvider:", &__block_literal_global_9);

  }
}

id __60__TVRUIDevicePickerViewController__setupTitleButtonIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  CGFloat v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v2 = a2;
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v2, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bounds");
  v14 = v10 + CGRectGetWidth(v26) + 8.0;

  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v14;
  v27.size.height = v12;
  v28 = CGRectInset(v27, -16.0, -8.0);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v19 = CGRectGetHeight(v28) * 0.5;
  v20 = objc_alloc_init(MEMORY[0x24BEBD888]);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setVisiblePath:", v21);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:parameters:", v3, v20);
  objc_msgSend(MEMORY[0x24BEBD820], "effectWithPreview:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)_titleWasLongPressed:(id)a3
{
  void *v4;
  id v5;

  -[TVRUIDevicePickerViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicePickerTitleWasLongPressedForDevice:", v4);

}

- (void)setDeviceTitle:(id)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_deviceTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_deviceTitle, a3);
    v5 = (void *)MEMORY[0x24BEBDB00];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__TVRUIDevicePickerViewController_setDeviceTitle___block_invoke;
    v7[3] = &unk_24DE2C830;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v5, "performWithoutAnimation:", v7);

  }
}

void __50__TVRUIDevicePickerViewController_setDeviceTitle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "titleButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "titleButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)setMenuProvider:(id)a3
{
  objc_storeWeak((id *)&self->_menuProvider, a3);
  -[TVRUIDevicePickerViewController setContextMenuNeedsUpdate:](self, "setContextMenuNeedsUpdate:", 1);
  -[TVRUIDevicePickerViewController _updateViewState](self, "_updateViewState");
}

- (void)_setupDeviceList
{
  void *v3;
  void *v4;
  _TVRUITableViewWrapperView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  id v34;

  -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceListRowHeight");
    -[TVRUIDevicePickerViewController setBaseHeight:](self, "setBaseHeight:");

    v5 = objc_alloc_init(_TVRUITableViewWrapperView);
    -[TVRUIDevicePickerViewController setTableViewWrapper:](self, "setTableViewWrapper:", v5);

    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClipsToBounds:", 1);

    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaskedCorners:", 4);

    -[TVRUIDevicePickerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    v11 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[TVRUIDevicePickerViewController setTableView:](self, "setTableView:", v12);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsGroupBlending:", 0);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupOpacity:", 0);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataSource:", self);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSeparatorStyle:", 0);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIndicatorStyle:", 2);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v22);

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kTVRDropDownCellIdentifier"));

    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_didTapWrapperView_);
    objc_msgSend(v34, "setCancelsTouchesInView:", 0);
    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addGestureRecognizer:", v34);

    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "separatorView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController setTableViewTopSeperator:](self, "setTableViewTopSeperator:", v28);

    -[TVRUIDevicePickerViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController tableViewTopSeperator](self, "tableViewTopSeperator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    -[TVRUIDevicePickerViewController tableViewTopSeperator](self, "tableViewTopSeperator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAlpha:", 0.0);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UIA.TVRemoteService.%@"), CFSTR("deviceTable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAccessibilityIdentifier:", v32);

  }
}

- (void)setDevices:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *devices;
  uint64_t v14;
  void *v15;
  NSArray *v16;

  v4 = (NSArray *)a3;
  if (self->_devices != v4)
  {
    v16 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSArray count](v5, "count");
    -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      objc_msgSend(v8, "setHidden:", 0);

      -[TVRUIDevicePickerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
    }
    else
    {
      objc_msgSend(v8, "setHidden:", 1);

      -[TVRUIDevicePickerViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
    }
    objc_msgSend(v10, "setUserInteractionEnabled:", v12);

    devices = self->_devices;
    self->_devices = v5;

    -[TVRUIDevicePickerViewController _sortAndReloadDevices](self, "_sortAndReloadDevices");
    if (!-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
    {
      -[TVRUIDevicePickerViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIDevicePickerViewController _preferredTableViewFrameWhenExpanded:](self, "_preferredTableViewFrameWhenExpanded:", 0);
      objc_msgSend(v15, "setFrame:");

      goto LABEL_9;
    }
    v14 = -[NSArray count](v16, "count");
    v4 = v16;
    if (!v14)
    {
      -[TVRUIDevicePickerViewController _toggleState](self, "_toggleState");
LABEL_9:
      v4 = v16;
    }
  }

}

- (void)setSuggestedDevices:(id)a3
{
  id v5;

  v5 = a3;
  if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled")
    && !-[NSArray isEqualToArray:](self->_suggestedDevices, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)&self->_suggestedDevices, a3);
    -[TVRUIDevicePickerViewController _updateDevicesWithSuggestionsAndReload](self, "_updateDevicesWithSuggestionsAndReload");
  }

}

- (void)_updateDevicesWithSuggestionsAndReload
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_21B042000, a2, v4, "devices: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_sortAndReloadDevices
{
  NSArray *v3;
  NSArray *devices;

  -[NSArray sortedArrayUsingComparator:](self->_devices, "sortedArrayUsingComparator:", &__block_literal_global_64);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devices = self->_devices;
  self->_devices = v3;

  -[TVRUIDevicePickerViewController _updateDevicesWithSuggestionsAndReload](self, "_updateDevicesWithSuggestionsAndReload");
}

uint64_t __56__TVRUIDevicePickerViewController__sortAndReloadDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  if ((objc_msgSend(v6, "isConnected") & 1) != 0)
  {
    v8 = -1;
  }
  else if ((objc_msgSend(v7, "isConnected") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:options:", v10, 1);

  }
  return v8;
}

- (void)_setupAnimators
{
  void *v3;
  void *v4;
  void *v5;
  TVRUICubicSpringAnimator *v6;
  TVRUICubicSpringTimingParameters *v7;

  +[TVRUICubicSpringAnimator standardSpringAnimator](TVRUICubicSpringAnimator, "standardSpringAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController setShowAnimator:](self, "setShowAnimator:", v3);

  v7 = -[TVRUICubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([TVRUICubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 36.0, 0.0, 0.0);
  +[TVRUICubicSpringTimingParameters standardTimingParameters](TVRUICubicSpringTimingParameters, "standardTimingParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "springCubicTimingParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUICubicSpringTimingParameters setSpringCubicTimingParameters:](v7, "setSpringCubicTimingParameters:", v5);

  v6 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([TVRUICubicSpringAnimator alloc], "initWithDuration:timingParameters:", v7, 1.0);
  -[TVRUIDevicePickerViewController setHideAnimator:](self, "setHideAnimator:", v6);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[TVRUIDevicePickerViewController devices](self, "devices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kTVRDropDownCellIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _TVRUIDevicePickerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TVRUIDevicePickerViewController tableView:cellForRowAtIndexPath:].cold.1(v10);

  }
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStyleProvider:", v11);

  -[TVRUIDevicePickerViewController devices](self, "devices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v7, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDevice:", v13);
  objc_msgSend(v8, "setShowSeparator:", objc_msgSend(v7, "row") != objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section")) - 1);
  v14 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  objc_msgSend(v8, "setSelectedBackgroundView:", v14);
  if (objc_msgSend(v13, "isConnected"))
    -[TVRUIDevicePickerViewController setConnectedDeviceIndex:](self, "setConnectedDeviceIndex:", v7);
  v16 = (void *)MEMORY[0x24BEBD388];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__TVRUIDevicePickerViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v20[3] = &unk_24DE2CD00;
  objc_copyWeak(&v22, &location);
  v17 = v13;
  v21 = v17;
  objc_msgSend(v16, "actionWithHandler:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFindButtonTapAction:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v8;
}

void __67__TVRUIDevicePickerViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findButtonTappedForDevice:", *(_QWORD *)(a1 + 32));

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  if (-[TVRUIDevicePickerViewController _accessibilityFontSizesEnabled](self, "_accessibilityFontSizesEnabled", a3, a4))
    return *MEMORY[0x24BEBE770];
  -[TVRUIDevicePickerViewController baseHeight](self, "baseHeight");
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *devices;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  devices = self->_devices;
  v6 = a4;
  -[NSArray objectAtIndex:](devices, "objectAtIndex:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isConnected") & 1) != 0)
  {
    _TVRUIDevicePickerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v15) = 0;
    v9 = "User tapped on already connected device";
    v10 = v8;
    v11 = 2;
  }
  else
  {
    -[TVRUIDevicePickerViewController eventHaptic](self, "eventHaptic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playSelectionEventHaptic");

    -[TVRUIDevicePickerViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "devicePicked:", v7);

    _TVRUIDevicePickerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v15 = 138412290;
    v16 = v7;
    v9 = "User picked device %@";
    v10 = v8;
    v11 = 12;
  }
  _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
LABEL_7:

  -[TVRUIDevicePickerViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 0);

  if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
    -[TVRUIDevicePickerViewController _toggleState](self, "_toggleState");

}

- (void)expandDeviceList
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
  {
    _TVRUIDevicePickerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Expanding device list", v4, 2u);
    }

    -[TVRUIDevicePickerViewController _toggleState](self, "_toggleState");
  }
}

- (void)collapseDeviceList
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
  {
    _TVRUIDevicePickerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Collapsing device list", v4, 2u);
    }

    -[TVRUIDevicePickerViewController _toggleState](self, "_toggleState");
  }
}

- (void)didChangeToExpanded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[TVRUIDevicePickerViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController _preferredTableViewFrameWhenExpanded:](self, "_preferredTableViewFrameWhenExpanded:", v3);
  objc_msgSend(v5, "setFrame:");

}

- (void)didTapWrapperView:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  BOOL v10;
  id v11;
  CGPoint v12;
  CGRect v13;

  v11 = a3;
  if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
  {
    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[TVRUIDevicePickerViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v12.x = v6;
    v12.y = v8;
    v10 = CGRectContainsPoint(v13, v12);

    if (!v10)
      -[TVRUIDevicePickerViewController _toggleState](self, "_toggleState");
  }

}

- (void)_toggleState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id buf[2];

  _TVRUIDevicePickerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Toggle state called", (uint8_t *)buf, 2u);
  }

  if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing")
    || (-[TVRUIDevicePickerViewController devices](self, "devices"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    -[TVRUIDevicePickerViewController setDevicePickerShowing:](self, "setDevicePickerShowing:", -[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing") ^ 1);
    if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
    {
      -[TVRUIDevicePickerViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIDevicePickerViewController _preferredTableViewFrameWhenExpanded:](self, "_preferredTableViewFrameWhenExpanded:", 0);
      objc_msgSend(v6, "setFrame:");

    }
    -[TVRUIDevicePickerViewController showAnimator](self, "showAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isRunning");

    if (v8)
    {
      -[TVRUIDevicePickerViewController showAnimator](self, "showAnimator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopAnimation:", 1);

      _TVRUIDevicePickerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v11 = "showAnimator reversed";
LABEL_13:
        _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      -[TVRUIDevicePickerViewController hideAnimator](self, "hideAnimator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRunning");

      if (!v13)
      {
LABEL_15:
        -[TVRUIDevicePickerViewController _setupAnimators](self, "_setupAnimators");
        objc_initWeak(buf, self);
        if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
        {
          -[TVRUIDevicePickerViewController showAnimator](self, "showAnimator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __47__TVRUIDevicePickerViewController__toggleState__block_invoke;
          v25[3] = &unk_24DE2CD28;
          v16 = &v26;
          objc_copyWeak(&v26, buf);
          v25[4] = self;
          objc_msgSend(v15, "addAnimations:", v25);

          -[TVRUIDevicePickerViewController _sortAndReloadDevices](self, "_sortAndReloadDevices");
          -[TVRUIDevicePickerViewController eventHaptic](self, "eventHaptic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "playImpactEventHaptic");

          -[TVRUIDevicePickerViewController delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "devicePickerWillChangeState:animated:", 1, 0);

          -[TVRUIDevicePickerViewController showAnimator](self, "showAnimator");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startAnimation");
        }
        else
        {
          -[TVRUIDevicePickerViewController hideAnimator](self, "hideAnimator");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __47__TVRUIDevicePickerViewController__toggleState__block_invoke_2;
          v23[3] = &unk_24DE2C4F8;
          v16 = &v24;
          objc_copyWeak(&v24, buf);
          objc_msgSend(v20, "addAnimations:", v23);

          -[TVRUIDevicePickerViewController delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "devicePickerWillChangeState:animated:", 0, 0);

          -[TVRUIDevicePickerViewController hideAnimator](self, "hideAnimator");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startAnimation");
        }

        objc_destroyWeak(v16);
        objc_destroyWeak(buf);
        return;
      }
      -[TVRUIDevicePickerViewController hideAnimator](self, "hideAnimator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopAnimation:", 1);

      _TVRUIDevicePickerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v11 = "hideAnimator reversed";
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  _TVRUIDevicePickerLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B042000, v22, OS_LOG_TYPE_DEFAULT, "Not showing and device count is 0. Not expanding picker.", (uint8_t *)buf, 2u);
  }

}

void __47__TVRUIDevicePickerViewController__toggleState__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  _BOOL4 v4;
  CGFloat v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  CGAffineTransform v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection") == 1;

    v5 = dbl_21B0F7A00[v4];
    objc_msgSend(WeakRetained, "deviceTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeRotation(&v13, v5);
    objc_msgSend(v7, "setTransform:", &v13);

    objc_msgSend(WeakRetained, "powerButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

    objc_msgSend(WeakRetained, "muteButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

    objc_msgSend(WeakRetained, "muteButtonOverride");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    v11 = WeakRetained[135];
    objc_msgSend(WeakRetained, "_preferredTableViewFrameWhenExpanded:", 1);
    objc_msgSend(v11, "setFrame:");
    objc_msgSend(WeakRetained[137], "setAlpha:", 1.0);
    v12 = objc_loadWeakRetained(WeakRetained + 126);
    objc_msgSend(v12, "devicePickerWillChangeState:animated:", 1, 1);

  }
}

void __47__TVRUIDevicePickerViewController__toggleState__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _OWORD v11[3];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "deviceTitleView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v11[0] = *MEMORY[0x24BDBD8B8];
    v11[1] = v5;
    v11[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v4, "setTransform:", v11);

    objc_msgSend(v2, "powerButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

    objc_msgSend(v2, "muteButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

    objc_msgSend(v2, "muteButtonOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 1);

    v9 = v2[135];
    objc_msgSend(v2, "_preferredTableViewFrameWhenExpanded:", 0);
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v2[137], "setAlpha:", 0.0);
    v10 = objc_loadWeakRetained(v2 + 126);
    objc_msgSend(v10, "devicePickerWillChangeState:animated:", 0, 1);

  }
}

- (CGRect)_preferredTableViewFrameWhenExpanded:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    _TVRUIDevicePickerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIDevicePickerViewController devices](self, "devices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134217984;
      v21 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "tableViewFrameRequest with num devices %ld", (uint8_t *)&v20, 0xCu);

    }
    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    width = v7;
    -[TVRUIDevicePickerViewController _expandedContentHeight](self, "_expandedContentHeight");
    height = v9;
    x = 0.0;

    y = 0.0;
  }
  else
  {
    -[TVRUIDevicePickerViewController _calculatedContentHeight](self, "_calculatedContentHeight");
    v14 = -(v13 + 1.0);
    -[TVRUIDevicePickerViewController tableViewWrapper](self, "tableViewWrapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v24 = CGRectOffset(v23, 0.0, v14);
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;

  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_updateTableFrame:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[TVRUIDevicePickerViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController _preferredTableViewFrameWhenExpanded:](self, "_preferredTableViewFrameWhenExpanded:", v3);
  objc_msgSend(v5, "setFrame:");

}

- (void)_device:(id)a3 updatedFindMySupported:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  -[TVRUIDevicePickerViewController devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v7, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_updateFindMyButton");
}

- (double)_calculatedContentHeight
{
  double result;

  if (-[TVRUIDevicePickerViewController _accessibilityFontSizesEnabled](self, "_accessibilityFontSizesEnabled"))
    -[TVRUIDevicePickerViewController _contentHeightForPreferredContentSizeCategory](self, "_contentHeightForPreferredContentSizeCategory");
  else
    -[TVRUIDevicePickerViewController _defaultCalculatedContentHeight](self, "_defaultCalculatedContentHeight");
  return result;
}

- (double)_defaultCalculatedContentHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;

  -[TVRUIDevicePickerViewController baseHeight](self, "baseHeight");
  v4 = v3;
  -[TVRUIDevicePickerViewController devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 * (double)(unint64_t)objc_msgSend(v5, "count");

  return v6;
}

- (double)_expandedContentHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "touchpadHeight");
  v5 = v4 * 0.5;

  -[TVRUIDevicePickerViewController _calculatedContentHeight](self, "_calculatedContentHeight");
  v7 = v6;
  _TVRUIDevicePickerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218240;
    v11 = v5;
    v12 = 2048;
    v13 = v7;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "maxExpandedHeight=%f calculatedHeight=%f", (uint8_t *)&v10, 0x16u);
  }

  if (v7 >= v5)
    return v5;
  else
    return v7;
}

- (BOOL)_accessibilityFontSizesEnabled
{
  void *v2;
  NSString *v3;

  objc_msgSend(MEMORY[0x24BEBD4E0], "system");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

- (double)_contentHeightForPreferredContentSizeCategory
{
  double v3;
  double Height;
  void *v5;
  void *v6;
  void *v7;
  CGRect v9;

  -[TVRUIDevicePickerViewController _defaultCalculatedContentHeight](self, "_defaultCalculatedContentHeight");
  Height = v3;
  objc_msgSend(MEMORY[0x24BEBD4E0], "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE058]))
    {
      -[TVRUIDevicePickerViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      Height = CGRectGetHeight(v9);

    }
    else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE070]) & 1) != 0
           || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE068]))
    {
      Height = Height * 1.5;
    }
  }

  return Height;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_buttonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIDevicePickerViewController buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIDevicePickerViewController buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_buttonReleased:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, objc_msgSend(a3, "buttonType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIDevicePickerViewController buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIDevicePickerViewController buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (void)_updateTitleViewForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconForDeviceModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBDB00];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__TVRUIDevicePickerViewController__updateTitleViewForDevice___block_invoke;
  v11[3] = &unk_24DE2C8C8;
  v11[4] = self;
  v12 = v4;
  v13 = v7;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "performWithoutAnimation:", v11);

}

void __61__TVRUIDevicePickerViewController__updateTitleViewForDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "deviceTitleView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTitleWithDeviceName:icon:", v2, *(_QWORD *)(a1 + 48));

}

- (void)_updateViewState
{
  void *v2;
  BOOL v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  UIButton *muteButtonOverride;
  void *v17;
  void *v18;
  BOOL v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = -[TVRUIDevicePickerViewController enabled](self, "enabled");
  if (v4)
  {
    v5 = 1.0;
  }
  else
  {
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "disabledButtonAlpha");
    v5 = v6;
  }
  -[TVRUIDevicePickerViewController titleButton](self, "titleButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  if (!v4)
  v8 = -[TVRUIDevicePickerViewController enabled](self, "enabled");
  if (v8)
  {
    v9 = 1.0;
  }
  else
  {
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "disabledButtonAlpha");
    v9 = v10;
  }
  -[TVRUIDevicePickerViewController powerButton](self, "powerButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v9);

  if (!v8)
  v12 = -[TVRUIDevicePickerViewController enabled](self, "enabled");
  if (v12)
  {
    v13 = 1.0;
  }
  else
  {
    -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "disabledButtonAlpha");
    v13 = v14;
  }
  -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", v13);

  if (!v12)
  muteButtonOverride = self->_muteButtonOverride;
  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (muteButtonOverride)
  {
    objc_msgSend(v17, "setHidden:", 1);

    -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", 0.0);

    v19 = -[TVRUIDevicePickerViewController enabled](self, "enabled");
    if (v19)
    {
      v20 = 1.0;
    }
    else
    {
      -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "disabledButtonAlpha");
      v20 = v21;
    }
    -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v17, "setHidden:", 0);

    v19 = -[TVRUIDevicePickerViewController enabled](self, "enabled");
    if (v19)
    {
      v20 = 1.0;
    }
    else
    {
      -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "disabledButtonAlpha");
      v20 = v23;
    }
    -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v22;
  objc_msgSend(v22, "setAlpha:", v20);

  if (!v19)
  -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    v27 = -[TVRUIDevicePickerViewController contextMenuNeedsUpdate](self, "contextMenuNeedsUpdate");

    if (v27)
    {
      -[TVRUIDevicePickerViewController menuProvider](self, "menuProvider");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "actionButtonMenu");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setMenu:", v29);

      -[TVRUIDevicePickerViewController setContextMenuNeedsUpdate:](self, "setContextMenuNeedsUpdate:", 0);
    }
  }
}

- (void)_updateDevice
{
  TVRUIDevice *device;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  device = self->_device;
  if (device)
  {
    v4 = -[TVRUIDevice supportsMute](device, "supportsMute");
    -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v4);

    v6 = -[TVRUIDevice supportsPower](self->_device, "supportsPower");
    -[TVRUIDevicePickerViewController powerButton](self, "powerButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v6);

    -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 1);

    -[TVRUIDevicePickerViewController _updateTitleViewForDevice:](self, "_updateTitleViewForDevice:", self->_device);
    -[TVRUIDevice name](self->_device, "name");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TVRUIDevicePickerViewController _updateDeviceNameAutomationIdentifier:](self, "_updateDeviceNameAutomationIdentifier:", v9);

  }
  else
  {
    -[TVRUIDevicePickerViewController resetSelectedDevice](self, "resetSelectedDevice");
  }
}

- (void)resetSelectedDevice
{
  TVRUIDevice *device;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  device = self->_device;
  self->_device = 0;

  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[TVRUIDevicePickerViewController powerButton](self, "powerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[TVRUIDevicePickerViewController muteButtonOverride](self, "muteButtonOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[TVRUIDevicePickerViewController styleProvider](self, "styleProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultDeviceTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBDB00];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__TVRUIDevicePickerViewController_resetSelectedDevice__block_invoke;
  v11[3] = &unk_24DE2C830;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "performWithoutAnimation:", v11);
  -[TVRUIDevicePickerViewController _updateDeviceNameAutomationIdentifier:](self, "_updateDeviceNameAutomationIdentifier:", CFSTR("none"));
  -[TVRUITitleView setAlpha:](self->_deviceTitleView, "setAlpha:", 1.0);

}

void __54__TVRUIDevicePickerViewController_resetSelectedDevice__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceTitleView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTitleWithDeviceName:icon:", *(_QWORD *)(a1 + 40), 0);

}

- (void)_updateDeviceNameAutomationIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("selectedDevice=\"%@\"), a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UIA.TVRemoteService.%@"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (void)setDevice:(id)a3
{
  TVRUIDevice *v5;
  TVRUIDevice *v6;

  v5 = (TVRUIDevice *)a3;
  v6 = v5;
  if (self->_device != v5)
  {
    objc_storeStrong((id *)&self->_device, a3);
LABEL_4:
    -[TVRUIDevicePickerViewController _updateDevice](self, "_updateDevice");
    goto LABEL_5;
  }
  if (v5)
    goto LABEL_4;
LABEL_5:

}

- (void)setStyleProvider:(id)a3
{
  TVRUIStyleProvider *v5;
  TVRUIStyleProvider *v6;

  v5 = (TVRUIStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    v5 = v6;
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[TVRUIDevicePickerViewController _updateViewState](self, "_updateViewState");
  }
}

- (void)setVolumeControlAvailable:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (a3)
  {
    -[TVRUIDevicePickerViewController device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "supportsMute");
  }
  else
  {
    v6 = 0;
  }
  -[TVRUIDevicePickerViewController muteButton](self, "muteButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

  if (v4)
  -[TVRUIDevicePickerViewController setContextMenuNeedsUpdate:](self, "setContextMenuNeedsUpdate:", 1);
  -[TVRUIDevicePickerViewController _updateViewState](self, "_updateViewState");
}

- (id)_lastVisibleCellSupportingFindMy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[TVRUIDevicePickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("row"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
      -[TVRUIDevicePickerViewController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cellForRowAtIndexPath:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "supportsFindMyRemote");

      if ((v17 & 1) != 0)
        break;

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    if (v15)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  _TVRUIDevicePickerLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "Find my supported device is not visible in the list", v20, 2u);
  }

  v15 = 0;
LABEL_14:

  return v15;
}

- (UIView)tipSourceView
{
  void *v3;
  void *v4;

  if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
  {
    -[TVRUIDevicePickerViewController _lastVisibleCellSupportingFindMy](self, "_lastVisibleCellSupportingFindMy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "findMyButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TVRUIDevicePickerViewController deviceTitleView](self, "deviceTitleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIView *)v4;
}

- (CGRect)tipSourceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)permittedArrowDirections
{
  return 1;
}

- (BOOL)canPresentTip
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  NSObject *v9;
  const char *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TVRUIDevicePickerViewController showAnimator](self, "showAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRunning") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TVRUIDevicePickerViewController hideAnimator](self, "hideAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRunning");

    if ((v6 & 1) != 0)
    {
      v4 = 0;
      goto LABEL_10;
    }
    if (!-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
    {
      -[TVRUIDevicePickerViewController device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "supportsFindMyRemote");

      if ((v8 & 1) != 0)
      {
        v4 = 1;
        goto LABEL_10;
      }
    }
    -[TVRUIDevicePickerViewController _lastVisibleCellSupportingFindMy](self, "_lastVisibleCellSupportingFindMy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;
  }

LABEL_10:
  _TVRUIDevicePickerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "no";
    if (v4)
      v10 = "yes";
    v12 = 136315138;
    v13 = v10;
    _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Can present Tip: %s", (uint8_t *)&v12, 0xCu);
  }

  return v4;
}

- (BOOL)tipSourceSupportsSiri
{
  void *v3;
  void *v4;
  char v5;

  if (-[TVRUIDevicePickerViewController isDevicePickerShowing](self, "isDevicePickerShowing"))
  {
    -[TVRUIDevicePickerViewController _lastVisibleCellSupportingFindMy](self, "_lastVisibleCellSupportingFindMy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsSiri");

  }
  else
  {
    -[TVRUIDevicePickerViewController device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "supportsSiri");
  }

  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
}

- (void)setButtonEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonEventDelegate, a3);
}

- (NSArray)devices
{
  return self->_devices;
}

- (NSArray)suggestedDevices
{
  return self->_suggestedDevices;
}

- (BOOL)isDevicePickerShowing
{
  return self->_devicePickerShowing;
}

- (void)setDevicePickerShowing:(BOOL)a3
{
  self->_devicePickerShowing = a3;
}

- (TVRUIDevicePickerDelegate)delegate
{
  return (TVRUIDevicePickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRUIMenuProvider)menuProvider
{
  return (TVRUIMenuProvider *)objc_loadWeakRetained((id *)&self->_menuProvider);
}

- (TVRUIButton)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
{
  objc_storeStrong((id *)&self->_muteButton, a3);
}

- (TVRUIButton)powerButton
{
  return self->_powerButton;
}

- (void)setPowerButton:(id)a3
{
  objc_storeStrong((id *)&self->_powerButton, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIButton)muteButtonOverride
{
  return self->_muteButtonOverride;
}

- (void)setMuteButtonOverride:(id)a3
{
  objc_storeStrong((id *)&self->_muteButtonOverride, a3);
}

- (TVRUITitleView)deviceTitleView
{
  return self->_deviceTitleView;
}

- (void)setDeviceTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTitleView, a3);
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleButton, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (_TVRUITableViewWrapperView)tableViewWrapper
{
  return self->_tableViewWrapper;
}

- (void)setTableViewWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewWrapper, a3);
}

- (UIView)tableViewTopSeperator
{
  return self->_tableViewTopSeperator;
}

- (void)setTableViewTopSeperator:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewTopSeperator, a3);
}

- (UIView)tableViewBottomSeperator
{
  return self->_tableViewBottomSeperator;
}

- (void)setTableViewBottomSeperator:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewBottomSeperator, a3);
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (void)setBaseHeight:(double)a3
{
  self->_baseHeight = a3;
}

- (TVRUICubicSpringAnimator)showAnimator
{
  return self->_showAnimator;
}

- (void)setShowAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_showAnimator, a3);
}

- (TVRUICubicSpringAnimator)hideAnimator
{
  return self->_hideAnimator;
}

- (void)setHideAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_hideAnimator, a3);
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (void)setEventHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_eventHaptic, a3);
}

- (NSIndexPath)connectedDeviceIndex
{
  return self->_connectedDeviceIndex;
}

- (void)setConnectedDeviceIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (UIView)nearbySectionTitleView
{
  return self->_nearbySectionTitleView;
}

- (void)setNearbySectionTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_nearbySectionTitleView, a3);
}

- (NSString)deviceTitle
{
  return self->_deviceTitle;
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (BOOL)contextMenuNeedsUpdate
{
  return self->_contextMenuNeedsUpdate;
}

- (void)setContextMenuNeedsUpdate:(BOOL)a3
{
  self->_contextMenuNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceTitle, 0);
  objc_storeStrong((id *)&self->_nearbySectionTitleView, 0);
  objc_storeStrong((id *)&self->_connectedDeviceIndex, 0);
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_hideAnimator, 0);
  objc_storeStrong((id *)&self->_showAnimator, 0);
  objc_storeStrong((id *)&self->_tableViewBottomSeperator, 0);
  objc_storeStrong((id *)&self->_tableViewTopSeperator, 0);
  objc_storeStrong((id *)&self->_tableViewWrapper, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_deviceTitleView, 0);
  objc_storeStrong((id *)&self->_muteButtonOverride, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

- (void)tableView:(os_log_t)log cellForRowAtIndexPath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21B042000, log, OS_LOG_TYPE_ERROR, "Style provider is nil", v1, 2u);
}

@end
