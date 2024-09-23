@implementation TVRUIChannelButton

- (TVRUIChannelButton)initWithTitle:(id)a3 styleProvider:(id)a4
{
  id v6;
  id v7;
  TVRUIChannelButton *v8;
  TVRUIChannelButton *v9;
  UIView *v10;
  UIView *contentView;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  TVRUIPageButton *v18;
  TVRUIPageButton *topButton;
  void *v20;
  TVRUIPageButton *v21;
  TVRUIPageButton *bottomButton;
  void *v23;
  void *v24;
  UILabel *v25;
  UILabel *titleLabel;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CATransform3D v33;
  CATransform3D v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)TVRUIChannelButton;
  v8 = -[TVRUIChannelButton initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    -[TVRUIChannelButton setStyleProvider:](v8, "setStyleProvider:", v7);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    contentView = v9->_contentView;
    v9->_contentView = v10;

    -[UIView setClipsToBounds:](v9->_contentView, "setClipsToBounds:", 1);
    objc_msgSend(v7, "mediaControlsButtonSize");
    v13 = v12 * 0.5;
    -[UIView layer](v9->_contentView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", v13);

    v15 = *MEMORY[0x24BDE58E8];
    -[UIView layer](v9->_contentView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", v15);

    -[UIView layer](v9->_contentView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 1.0);

    -[TVRUIChannelButton addSubview:](v9, "addSubview:", v9->_contentView);
    v18 = -[TVRUIPageButton initWithType:hasTapAction:]([TVRUIPageButton alloc], "initWithType:hasTapAction:", 26, 0);
    topButton = v9->_topButton;
    v9->_topButton = v18;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPageButton setBackgroundColor:](v9->_topButton, "setBackgroundColor:", v20);

    -[TVRUIButton setDisableHighlightEffect:](v9->_topButton, "setDisableHighlightEffect:", 1);
    -[UIView addSubview:](v9->_contentView, "addSubview:", v9->_topButton);
    v21 = -[TVRUIPageButton initWithType:hasTapAction:]([TVRUIPageButton alloc], "initWithType:hasTapAction:", 27, 0);
    bottomButton = v9->_bottomButton;
    v9->_bottomButton = v21;

    CATransform3DMakeRotation(&v34, 3.14159265, 0.0, 0.0, 1.0);
    -[TVRUIPageButton contentLayer](v9->_bottomButton, "contentLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v34;
    objc_msgSend(v23, "setTransform:", &v33);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIPageButton setBackgroundColor:](v9->_bottomButton, "setBackgroundColor:", v24);

    -[TVRUIButton setDisableHighlightEffect:](v9->_bottomButton, "setDisableHighlightEffect:", 1);
    -[UIView addSubview:](v9->_contentView, "addSubview:", v9->_bottomButton);
    v25 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v25;

    -[UILabel setText:](v9->_titleLabel, "setText:", v6);
    objc_msgSend(v7, "buttonTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_titleLabel, "setTextColor:", v27);

    objc_msgSend(v7, "pagingButtonFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_titleLabel, "setFont:", v28);

    -[UILabel setTextAlignment:](v9->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v9->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UIView addSubview:](v9->_contentView, "addSubview:", v9->_titleLabel);
    -[UILabel sizeToFit](v9->_titleLabel, "sizeToFit");
    -[TVRUIPageButton addTarget:action:forControlEvents:](v9->_topButton, "addTarget:action:forControlEvents:", v9, sel__buttonPressed_, 1);
    -[TVRUIPageButton addTarget:action:forControlEvents:](v9->_topButton, "addTarget:action:forControlEvents:", v9, sel__buttonReleased_, 448);
    -[TVRUIPageButton addTarget:action:forControlEvents:](v9->_bottomButton, "addTarget:action:forControlEvents:", v9, sel__buttonPressed_, 1);
    -[TVRUIPageButton addTarget:action:forControlEvents:](v9->_bottomButton, "addTarget:action:forControlEvents:", v9, sel__buttonReleased_, 448);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v9, sel__darkenSystemColorsChanged_, *MEMORY[0x24BEBDDE8], 0);

    -[TVRUIChannelButton setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 1);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v9, sel_expand);
    -[TVRUIChannelButton addGestureRecognizer:](v9, "addGestureRecognizer:", v30);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIChannelButton setBackgroundColor:](v9, "setBackgroundColor:", v31);

    -[TVRUIButton setEnabled:](v9->_topButton, "setEnabled:", 0);
    -[TVRUIButton setEnabled:](v9->_bottomButton, "setEnabled:", 0);

  }
  return v9;
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  self->_enabled = a3;
  if (a3)
  {
    -[TVRUIChannelButton topButton](self, "topButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

    -[TVRUIChannelButton styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 1.0;
  }
  else
  {
    -[TVRUIChannelButton styleProvider](self, "styleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disabledButtonAlpha");
    v8 = v10;

    -[TVRUIChannelButton topButton](self, "topButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", 0);

    -[TVRUIChannelButton styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tintColorForButtonDisabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TVRUIChannelButton titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v7);

  -[TVRUIChannelButton setAlpha:](self, "setAlpha:", v8);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  double MidX;
  void *v15;
  double MidY;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double MaxY;
  double v22;
  double v23;
  void *v24;
  void *v25;
  CGFloat v26;
  void *v27;
  double v28;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v30.receiver = self;
  v30.super_class = (Class)TVRUIChannelButton;
  -[TVRUIChannelButton layoutSubviews](&v30, sel_layoutSubviews);
  -[TVRUIChannelButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[TVRUIChannelButton isExpanded](self, "isExpanded");
  -[TVRUIChannelButton contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setBounds:", 0.0, 0.0, v8, 144.0);

    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    MidX = CGRectGetMidX(v31);
    -[TVRUIChannelButton contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    MidY = CGRectGetMidY(v32);
    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCenter:", MidX, MidY);

    -[TVRUIChannelButton topButton](self, "topButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 72.0;
    objc_msgSend(v18, "setFrame:", 0.0, 0.0, v8, 72.0);

    -[TVRUIChannelButton contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    MaxY = CGRectGetMidY(v33);
  }
  else
  {
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    v22 = CGRectGetMidX(v34);
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    v23 = CGRectGetMidY(v35);
    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCenter:", v22, v23);

    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v26 = CGRectGetMinY(v36) + -10.0;
    -[TVRUIChannelButton topButton](self, "topButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 10.0;
    objc_msgSend(v27, "setFrame:", 0.0, v26, v8, 10.0);

    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    MaxY = CGRectGetMaxY(v37);
  }
  v28 = MaxY;
  -[TVRUIChannelButton bottomButton](self, "bottomButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", 0.0, v28, v8, v19);

}

- (void)expand
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double MidY;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  CGFloat v70;
  void *v71;
  void *v72;
  id v73;
  CGFloat Width;
  void *v75;
  _QWORD v76[5];
  id v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  uint64_t v81;
  CGFloat v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  if (!-[TVRUIChannelButton isExpanded](self, "isExpanded") && !-[TVRUIChannelButton isAnimating](self, "isAnimating"))
  {
    -[TVRUIChannelButton contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v70 = v8;

    v88.origin.x = v5;
    v88.origin.y = v7;
    v88.size.width = v9;
    v88.size.height = 144.0;
    Width = CGRectGetWidth(v88);
    v89.origin.x = v5;
    v89.origin.y = v7;
    v89.size.width = v9;
    v89.size.height = 144.0;
    MidY = CGRectGetMidY(v89);
    v11 = MidY + -36.0;
    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = 36.0 - v13 * 0.5;

    v15 = MidY + 36.0;
    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17 * 0.5 + 36.0;

    -[TVRUIChannelButton styleProvider](self, "styleProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pagingButtonBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 1.0);
    v21 = (void *)MEMORY[0x24BDE57D8];
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __28__TVRUIChannelButton_expand__block_invoke;
    v76[3] = &unk_24DE2CAC0;
    v78 = v5;
    v79 = v7;
    v80 = v70;
    v81 = 0x4062000000000000;
    v82 = Width;
    v83 = 0x4052000000000000;
    v84 = v11;
    v85 = v14;
    v86 = v15;
    v87 = v18;
    v76[4] = self;
    v77 = v20;
    v73 = v20;
    objc_msgSend(v21, "setCompletionBlock:", v76);
    v22 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v22, "setKeyPath:", CFSTR("position.y"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v22;
    objc_msgSend(v22, "setToValue:", v23);

    -[TVRUIChannelButton topButton](self, "topButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAnimation:forKey:", v22, CFSTR("topChevronContentLayerPositionAnim"));

    -[TVRUIChannelButton topButton](self, "topButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leftWing");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIChannelButton chevronLeftWingAnimationExpand:](self, "chevronLeftWingAnimationExpand:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAnimation:forKey:", v28, CFSTR("transform.rotate"));

    -[TVRUIChannelButton topButton](self, "topButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rightWing");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIChannelButton chevronRightWingAnimationExpand:](self, "chevronRightWingAnimationExpand:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAnimation:forKey:", v31, CFSTR("transform.rotate"));

    v32 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v32, "setKeyPath:", CFSTR("bounds.size.height"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 72.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v32;
    objc_msgSend(v32, "setToValue:", v33);

    -[TVRUIChannelButton topButton](self, "topButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAnimation:forKey:", v32, CFSTR("topChevronBoundsAnim"));

    v36 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v36, "setKeyPath:", CFSTR("position.y"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v36;
    objc_msgSend(v36, "setToValue:", v37);

    -[TVRUIChannelButton topButton](self, "topButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAnimation:forKey:", v36, CFSTR("topChevronPositionAnim"));

    v40 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v40, "setKeyPath:", CFSTR("position.y"));
    v90.origin.x = v5;
    v90.origin.y = v7;
    v90.size.width = v70;
    v90.size.height = 144.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMidY(v90));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setToValue:", v41);

    -[TVRUIChannelButton titleLabel](self, "titleLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addAnimation:forKey:", v40, CFSTR("channelPosAnim"));

    v44 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v44, "setKeyPath:", CFSTR("position.y"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setToValue:", v45);

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contentLayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addAnimation:forKey:", v44, CFSTR("bottomChevronContentLayerPositionAnim"));

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leftWing");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIChannelButton chevronLeftWingAnimationExpand:](self, "chevronLeftWingAnimationExpand:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addAnimation:forKey:", v50, CFSTR("transform.rotate"));

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "rightWing");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIChannelButton chevronRightWingAnimationExpand:](self, "chevronRightWingAnimationExpand:", 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addAnimation:forKey:", v53, CFSTR("transform.rotate"));

    v54 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v54, "setKeyPath:", CFSTR("bounds.size.height"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 72.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setToValue:", v55);

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addAnimation:forKey:", v54, CFSTR("bottomChevronBoundsAnim"));

    v58 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v58, "setKeyPath:", CFSTR("position.y"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setToValue:", v59);

    -[TVRUIChannelButton bottomButton](self, "bottomButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addAnimation:forKey:", v58, CFSTR("bottomChevronPositionAnim"));

    v62 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v62, "setKeyPath:", CFSTR("backgroundColor"));
    v63 = objc_retainAutorelease(v73);
    objc_msgSend(v62, "setToValue:", objc_msgSend(v63, "CGColor"));
    -[TVRUIChannelButton contentView](self, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addAnimation:forKey:", v62, CFSTR("backgroundColorAnimation"));

    v66 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
    objc_msgSend(v66, "setKeyPath:", CFSTR("bounds.size.height"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 144.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setToValue:", v67);

    -[TVRUIChannelButton contentView](self, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addAnimation:forKey:", v66, CFSTR("contentLayerBoundsAnim"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[TVRUIChannelButton setIsAnimating:](self, "setIsAnimating:", 1);

  }
}

uint64_t __28__TVRUIChannelButton_expand__block_invoke(uint64_t a1)
{
  double MidX;
  double MidY;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _OWORD v91[8];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _OWORD v100[8];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _OWORD v109[8];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD v118[8];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;

  objc_msgSend(*(id *)(a1 + 32), "setIsExpanded:", 1);
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  MidY = CGRectGetMidY(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", MidX, MidY);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v9);

  v12 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  v13 = *(double *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPosition:", v12, v13);

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "position");
  v21 = v20;
  v22 = *(double *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPosition:", v21, v22);

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contentLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllAnimations");

  v27 = *(void **)(a1 + 32);
  v28 = objc_msgSend(v27, "isExpanded");
  if (v27)
  {
    objc_msgSend(v27, "_transformForLeftWingExpanded:", v28);
  }
  else
  {
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leftWing");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v123;
  v118[5] = v124;
  v118[6] = v125;
  v118[7] = v126;
  v118[0] = v119;
  v118[1] = v120;
  v118[2] = v121;
  v118[3] = v122;
  objc_msgSend(v30, "setTransform:", v118);

  v31 = *(void **)(a1 + 32);
  v32 = objc_msgSend(v31, "isExpanded");
  if (v31)
  {
    objc_msgSend(v31, "_transformForRightWingExpanded:", v32);
  }
  else
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightWing");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v114;
  v109[5] = v115;
  v109[6] = v116;
  v109[7] = v117;
  v109[0] = v110;
  v109[1] = v111;
  v109[2] = v112;
  v109[3] = v113;
  objc_msgSend(v34, "setTransform:", v109);

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftWing");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rightWing");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "removeAllAnimations");

  v39 = *(double *)(a1 + 80);
  v40 = *(double *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v39, v40);

  v43 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  v44 = *(double *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPosition:", v43, v44);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "removeAllAnimations");

  v49 = *(void **)(a1 + 32);
  v50 = objc_msgSend(v49, "isExpanded");
  if (v49)
  {
    objc_msgSend(v49, "_transformForLeftWingExpanded:", v50);
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leftWing");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v105;
  v100[5] = v106;
  v100[6] = v107;
  v100[7] = v108;
  v100[0] = v101;
  v100[1] = v102;
  v100[2] = v103;
  v100[3] = v104;
  objc_msgSend(v52, "setTransform:", v100);

  v53 = *(void **)(a1 + 32);
  v54 = objc_msgSend(v53, "isExpanded");
  if (v53)
  {
    objc_msgSend(v53, "_transformForRightWingExpanded:", v54);
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rightWing");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v96;
  v91[5] = v97;
  v91[6] = v98;
  v91[7] = v99;
  v91[0] = v92;
  v91[1] = v93;
  v91[2] = v94;
  v91[3] = v95;
  objc_msgSend(v56, "setTransform:", v91);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leftWing");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "rightWing");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "contentLayer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "position");
  v64 = v63;
  v65 = *(double *)(a1 + 120);
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "contentLayer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setPosition:", v64, v65);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "contentLayer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "layer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "position");
  v73 = v72;
  v75 = v74;

  v76 = *(double *)(a1 + 48);
  v77 = *(double *)(a1 + 56);
  v78 = *(double *)(a1 + 64);
  v79 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "layer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setFrame:", v76, v77, v78, v79);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "layer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setPosition:", v73, v75);

  v84 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setBackgroundColor:", v84);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "layer");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
}

- (id)_newSpringAnimation
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDE5760]);
  objc_msgSend(v2, "setMass:", 2.0);
  objc_msgSend(v2, "setStiffness:", 300.0);
  objc_msgSend(v2, "setDamping:", 50.0);
  objc_msgSend(v2, "settlingDuration");
  objc_msgSend(v2, "setDuration:");
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

- (CATransform3D)_transformForLeftWingExpanded:(SEL)a3
{
  double v4;

  v4 = -0.279253;
  if (a4)
    v4 = -0.785398;
  return CATransform3DMakeRotation(retstr, v4, 0.0, 0.0, 1.0);
}

- (CATransform3D)_transformForRightWingExpanded:(SEL)a3
{
  double v4;

  v4 = 0.279253;
  if (a4)
    v4 = 0.785398;
  return CATransform3DMakeRotation(retstr, v4, 0.0, 0.0, 1.0);
}

- (id)chevronLeftWingAnimationExpand:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
  objc_msgSend(v4, "setKeyPath:", CFSTR("transform.rotation.z"));
  if (v3)
    v5 = &unk_24DE4DD78;
  else
    v5 = &unk_24DE4DD88;
  objc_msgSend(v4, "setToValue:", v5);
  return v4;
}

- (id)chevronRightWingAnimationExpand:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
  objc_msgSend(v4, "setKeyPath:", CFSTR("transform.rotation.z"));
  if (v3)
    v5 = &unk_24DE4DD98;
  else
    v5 = &unk_24DE4DDA8;
  objc_msgSend(v4, "setToValue:", v5);
  return v4;
}

- (void)collapse
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat Width;
  double MidY;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  _QWORD v74[5];
  id v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  uint64_t v79;
  CGFloat v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  double v84;
  CGRect v85;
  CGRect v86;

  if (-[TVRUIChannelButton isExpanded](self, "isExpanded"))
  {
    if (!-[TVRUIChannelButton isAnimating](self, "isAnimating"))
    {
      -[TVRUIChannelButton contentView](self, "contentView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;

      v85.origin.x = v5;
      v85.origin.y = v7;
      v85.size.width = v9;
      v85.size.height = 64.0;
      Width = CGRectGetWidth(v85);
      v86.origin.x = v5;
      v86.origin.y = v7;
      v86.size.width = v9;
      v86.size.height = 64.0;
      MidY = CGRectGetMidY(v86);
      -[TVRUIChannelButton titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = MidY - v14 * 0.5 + -5.0;

      -[TVRUIChannelButton titleLabel](self, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v19 = MidY + v18 * 0.5 + 5.0;

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 1.0);
      v21 = (void *)MEMORY[0x24BDE57D8];
      v74[0] = MEMORY[0x24BDAC760];
      v74[1] = 3221225472;
      v74[2] = __30__TVRUIChannelButton_collapse__block_invoke;
      v74[3] = &unk_24DE2CAE8;
      v76 = v5;
      v77 = v7;
      v78 = v9;
      v79 = 0x4050000000000000;
      v80 = Width;
      v81 = 0x4024000000000000;
      v82 = v15;
      v83 = 0x4014000000000000;
      v84 = v19;
      v74[4] = self;
      v75 = v20;
      v72 = v20;
      objc_msgSend(v21, "setCompletionBlock:", v74);
      v22 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v22, "setKeyPath:", CFSTR("position.y"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 5.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v22;
      objc_msgSend(v22, "setToValue:", v23);

      -[TVRUIChannelButton topButton](self, "topButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentLayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAnimation:forKey:", v22, CFSTR("topChevronContentLayerPositionAnim"));

      -[TVRUIChannelButton topButton](self, "topButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leftWing");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIChannelButton chevronLeftWingAnimationExpand:](self, "chevronLeftWingAnimationExpand:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addAnimation:forKey:", v28, CFSTR("transform.rotate"));

      -[TVRUIChannelButton topButton](self, "topButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "rightWing");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIChannelButton chevronRightWingAnimationExpand:](self, "chevronRightWingAnimationExpand:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addAnimation:forKey:", v31, CFSTR("transform.rotate"));

      v32 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v32, "setKeyPath:", CFSTR("bounds.size.height"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 10.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v32;
      objc_msgSend(v32, "setToValue:", v33);

      -[TVRUIChannelButton topButton](self, "topButton");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addAnimation:forKey:", v32, CFSTR("topChevronBoundsAnim"));

      v36 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v36, "setKeyPath:", CFSTR("position.y"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v36;
      objc_msgSend(v36, "setToValue:", v37);

      -[TVRUIChannelButton topButton](self, "topButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addAnimation:forKey:", v36, CFSTR("topChevronPositionAnim"));

      v40 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v40, "setKeyPath:", CFSTR("position.y"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", MidY);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setToValue:", v41);

      -[TVRUIChannelButton titleLabel](self, "titleLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAnimation:forKey:", v40, CFSTR("channelPosAnim"));

      v44 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v44, "setKeyPath:", CFSTR("position.y"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 5.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setToValue:", v45);

      -[TVRUIChannelButton bottomButton](self, "bottomButton");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "contentLayer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addAnimation:forKey:", v44, CFSTR("bottomChevronContentLayerPositionAnim"));

      -[TVRUIChannelButton bottomButton](self, "bottomButton");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "leftWing");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIChannelButton chevronLeftWingAnimationExpand:](self, "chevronLeftWingAnimationExpand:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addAnimation:forKey:", v50, CFSTR("transform.rotate"));

      -[TVRUIChannelButton bottomButton](self, "bottomButton");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "rightWing");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIChannelButton chevronRightWingAnimationExpand:](self, "chevronRightWingAnimationExpand:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addAnimation:forKey:", v53, CFSTR("transform.rotate"));

      v54 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v54, "setKeyPath:", CFSTR("bounds.size.height"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 10.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setToValue:", v55);

      -[TVRUIChannelButton bottomButton](self, "bottomButton");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addAnimation:forKey:", v54, CFSTR("bottomChevronBoundsAnim"));

      v58 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v58, "setKeyPath:", CFSTR("position.y"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setToValue:", v59);

      -[TVRUIChannelButton bottomButton](self, "bottomButton");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "layer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addAnimation:forKey:", v58, CFSTR("bottomChevronPositionAnim"));

      v62 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v62, "setKeyPath:", CFSTR("backgroundColor"));
      v63 = objc_retainAutorelease(v72);
      objc_msgSend(v62, "setToValue:", objc_msgSend(v63, "CGColor"));
      -[TVRUIChannelButton contentView](self, "contentView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "layer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addAnimation:forKey:", v62, CFSTR("backgroundColorAnimation"));

      v66 = -[TVRUIChannelButton _newSpringAnimation](self, "_newSpringAnimation");
      objc_msgSend(v66, "setKeyPath:", CFSTR("bounds.size.height"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 64.0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setToValue:", v67);

      -[TVRUIChannelButton contentView](self, "contentView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "layer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addAnimation:forKey:", v66, CFSTR("contentLayerBoundsAnim"));

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      -[TVRUIChannelButton setIsAnimating:](self, "setIsAnimating:", 1);

    }
  }
}

uint64_t __30__TVRUIChannelButton_collapse__block_invoke(uint64_t a1)
{
  double MidX;
  double MidY;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _OWORD v91[8];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _OWORD v100[8];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _OWORD v109[8];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD v118[8];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;

  objc_msgSend(*(id *)(a1 + 32), "setIsExpanded:", 0);
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 48));
  MidY = CGRectGetMidY(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", MidX, MidY);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v9);

  v12 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  v13 = *(double *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPosition:", v12, v13);

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "position");
  v21 = v20;
  v22 = *(double *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPosition:", v21, v22);

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contentLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllAnimations");

  v27 = *(void **)(a1 + 32);
  v28 = objc_msgSend(v27, "isExpanded");
  if (v27)
  {
    objc_msgSend(v27, "_transformForLeftWingExpanded:", v28);
  }
  else
  {
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leftWing");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v123;
  v118[5] = v124;
  v118[6] = v125;
  v118[7] = v126;
  v118[0] = v119;
  v118[1] = v120;
  v118[2] = v121;
  v118[3] = v122;
  objc_msgSend(v30, "setTransform:", v118);

  v31 = *(void **)(a1 + 32);
  v32 = objc_msgSend(v31, "isExpanded");
  if (v31)
  {
    objc_msgSend(v31, "_transformForRightWingExpanded:", v32);
  }
  else
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightWing");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v114;
  v109[5] = v115;
  v109[6] = v116;
  v109[7] = v117;
  v109[0] = v110;
  v109[1] = v111;
  v109[2] = v112;
  v109[3] = v113;
  objc_msgSend(v34, "setTransform:", v109);

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leftWing");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rightWing");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "removeAllAnimations");

  v39 = *(double *)(a1 + 80);
  v40 = *(double *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v39, v40);

  v43 = CGRectGetMidX(*(CGRect *)(a1 + 48));
  v44 = *(double *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPosition:", v43, v44);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "removeAllAnimations");

  v49 = *(void **)(a1 + 32);
  v50 = objc_msgSend(v49, "isExpanded");
  if (v49)
  {
    objc_msgSend(v49, "_transformForLeftWingExpanded:", v50);
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leftWing");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v105;
  v100[5] = v106;
  v100[6] = v107;
  v100[7] = v108;
  v100[0] = v101;
  v100[1] = v102;
  v100[2] = v103;
  v100[3] = v104;
  objc_msgSend(v52, "setTransform:", v100);

  v53 = *(void **)(a1 + 32);
  v54 = objc_msgSend(v53, "isExpanded");
  if (v53)
  {
    objc_msgSend(v53, "_transformForRightWingExpanded:", v54);
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rightWing");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v96;
  v91[5] = v97;
  v91[6] = v98;
  v91[7] = v99;
  v91[0] = v92;
  v91[1] = v93;
  v91[2] = v94;
  v91[3] = v95;
  objc_msgSend(v56, "setTransform:", v91);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leftWing");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "rightWing");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "contentLayer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "position");
  v64 = v63;
  v65 = *(double *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "contentLayer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setPosition:", v64, v65);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "contentLayer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "layer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "position");
  v73 = v72;
  v75 = v74;

  v76 = *(double *)(a1 + 48);
  v77 = *(double *)(a1 + 56);
  v78 = *(double *)(a1 + 64);
  v79 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "layer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setFrame:", v76, v77, v78, v79);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "layer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setPosition:", v73, v75);

  v84 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setBackgroundColor:", v84);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "layer");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 32), "topButton");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "bottomButton");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setEnabled:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TVRUIChannelButton _darkenSystemColorsChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[TVRUIChannelButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIChannelButton setBackgroundColor:](self, "setBackgroundColor:", v6);

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
  -[TVRUIChannelButton buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIChannelButton buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIChannelButton buttonEventDelegate](self, "buttonEventDelegate");
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
  -[TVRUIChannelButton buttonEventDelegate](self, "buttonEventDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVRUIChannelButton buttonEventDelegate](self, "buttonEventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TVRUIChannelButton buttonEventDelegate](self, "buttonEventDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "generatedButtonEvent:", v9);

    }
  }

}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
}

- (void)setButtonEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonEventDelegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (TVRUIPageButton)topButton
{
  return self->_topButton;
}

- (void)setTopButton:(id)a3
{
  objc_storeStrong((id *)&self->_topButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TVRUIPageButton)bottomButton
{
  return self->_bottomButton;
}

- (void)setBottomButton:(id)a3
{
  objc_storeStrong((id *)&self->_bottomButton, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_bottomButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_topButton, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

@end
