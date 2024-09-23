@implementation TPSlidingButton

- (TPSlidingButton)initWithSlidingButtonType:(int)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  TPSlidingButton *v8;
  TPSlidingButton *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UIActionSlider *acceptButton;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  UIImageView *dialImageView;
  uint64_t v38;
  UIButton *sideButtonRight;
  UIButton *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)TPSlidingButton;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[TPSlidingButton initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v10 = (void *)MEMORY[0x1E0DC4480];
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    objc_msgSend(MEMORY[0x1E0DC4270], "sharedInstanceForStyle:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:", v11, v13, 0.3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3FF0]), "initWithFrame:vibrantSettings:", v14, v4, v5, v6, v7);
    acceptButton = v9->_acceptButton;
    v9->_acceptButton = (_UIActionSlider *)v15;

    v17 = (void *)MEMORY[0x1E0DC3870];
    TelephonyUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:", CFSTR("phone_dial"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSlider setKnobImage:](v9->_acceptButton, "setKnobImage:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSlider setTintColor:](v9->_acceptButton, "setTintColor:", v21);

    -[_UIActionSlider setDelegate:](v9->_acceptButton, "setDelegate:", v9);
    if (a3 > 6 || ((1 << a3) & 0x46) == 0)
      v12 = a3 == 3;
    -[_UIActionSlider setStyle:](v9->_acceptButton, "setStyle:", v12);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentMode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "size");
    v25 = v24;

    if (v25 >= 2208.0)
    {
      -[_UIActionSlider trackSize](v9->_acceptButton, "trackSize");
      -[_UIActionSlider setTrackSize:](v9->_acceptButton, "setTrackSize:", 300.0);
    }
    TelephonyUIBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if ((a3 - 5) >= 2)
      v28 = CFSTR("SLIDE_TO_ANSWER");
    else
      v28 = CFSTR("SLIDE_TO_UNLOCK");
    objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E75FDD38, CFSTR("General"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIActionSlider setTrackText:](v9->_acceptButton, "setTrackText:", v29);
    v30 = objc_alloc(MEMORY[0x1E0DC3890]);
    v31 = (void *)MEMORY[0x1E0DC3870];
    TelephonyUIBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageNamed:inBundle:", CFSTR("phone_dial"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_flatImageWithColor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v30, "initWithImage:", v35);
    dialImageView = v9->_dialImageView;
    v9->_dialImageView = (UIImageView *)v36;

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v38 = objc_claimAutoreleasedReturnValue();
    sideButtonRight = v9->_sideButtonRight;
    v9->_sideButtonRight = (UIButton *)v38;

    v40 = v9->_sideButtonRight;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v40, "setBackgroundColor:", v41);

    +[TPButton defaultWidthForSideButton](TPButton, "defaultWidthForSideButton");
    v43 = v42 * 0.5;
    -[UIButton layer](v9->_sideButtonRight, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCornerRadius:", v43);

    -[UIButton setUserInteractionEnabled:](v9->_sideButtonRight, "setUserInteractionEnabled:", 0);
    -[UIImageView setClipsToBounds:](v9->_dialImageView, "setClipsToBounds:", 0);
    -[UIImageView setContentMode:](v9->_dialImageView, "setContentMode:", 4);
    -[_UIActionSlider setAlpha:](v9->_acceptButton, "setAlpha:", 1.0);
    -[TPSlidingButton addSubview:](v9, "addSubview:", v9->_acceptButton);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)TPSlidingButton;
  -[TPSlidingButton dealloc](&v2, sel_dealloc);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSlidingButton;
  -[TPSlidingButton layoutSubviews](&v3, sel_layoutSubviews);
  -[TPSlidingButton bounds](self, "bounds");
  -[_UIActionSlider setFrame:](self->_acceptButton, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TPSlidingButton acceptButton](self, "acceptButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)actionSlider:(id)a3 didUpdateSlideWithValue:(double)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  -[TPSlidingButton delegate](self, "delegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[TPSlidingButton delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[TPSlidingButton delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "slidingButton:didSlideToProportion:", self, a4);

    }
  }
}

- (void)actionSliderDidCompleteSlide:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _UIActionSlider *acceptButton;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIActionSlider *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  double v35;
  double v36;
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
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
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
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[6];

  -[TPSlidingButton delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TPSlidingButton delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[TPSlidingButton delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "slidingButtonWillFinishSlide");

    }
  }
  if (self->_type == 4)
  {
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke;
    v85[3] = &unk_1E75FD2A8;
    v85[4] = self;
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_2;
    v84[3] = &unk_1E75FD6A0;
    v84[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v85, v84, 0.300000012);
  }
  else
  {
    acceptButton = self->_acceptButton;
    -[_UIActionSlider knobRect](acceptButton, "knobRect");
    -[_UIActionSlider convertRect:toView:](acceptButton, "convertRect:toView:", self);
    -[UIButton setFrame:](self->_sideButtonRight, "setFrame:");
    -[UIButton center](self->_sideButtonRight, "center");
    -[UIImageView setCenter:](self->_dialImageView, "setCenter:");
    -[TPSlidingButton insertSubview:above:](self, "insertSubview:above:", self->_dialImageView, self->_sideButtonRight);
    -[TPSlidingButton insertSubview:above:](self, "insertSubview:above:", self->_sideButtonRight, self->_acceptButton);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", &unk_1E760A0A0);
    objc_msgSend(v10, "setToValue:", &unk_1E760A0B0);
    objc_msgSend(v10, "setDuration:", 0.115000002);
    v11 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v82 = v10;
    objc_msgSend(v10, "setRemovedOnCompletion:", 0);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSlidingButton acceptButton](self, "acceptButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "position");
    objc_msgSend(v12, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_acceptButton;
    if (self->_type == 3)
    {
      -[_UIActionSlider layer](v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "position");
      v20 = v19 + -3.0;

    }
    else
    {
      -[_UIActionSlider knobRect](v17, "knobRect");
      v22 = v21;
      -[_UIActionSlider center](self->_acceptButton, "center");
      v20 = v22 - v23;
    }
    if (-[TPSlidingButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      objc_msgSend(v15, "doubleValue");
      v20 = v24 - v20;
    }
    objc_msgSend(v16, "setMass:", 2.0);
    objc_msgSend(v16, "setStiffness:", 300.0);
    objc_msgSend(v16, "setDamping:", 50.0);
    objc_msgSend(v16, "setFromValue:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setToValue:", v25);

    objc_msgSend(v16, "setDuration:", 0.50999999);
    objc_msgSend(v16, "setFillMode:", v11);
    v80 = v16;
    objc_msgSend(v16, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMass:", 2.0);
    objc_msgSend(v26, "setStiffness:", 300.0);
    objc_msgSend(v26, "setDamping:", 50.0);
    objc_msgSend(v26, "setToValue:", &unk_1E760A090);
    objc_msgSend(v26, "setDuration:", 0.50999999);
    objc_msgSend(v26, "setFillMode:", v11);
    v79 = v26;
    objc_msgSend(v26, "setRemovedOnCompletion:", 0);
    v81 = v15;
    if (self->_type == 3)
    {
      +[TPSuperBottomBar defaultSideMarginForDoubleButton](TPSuperBottomBar, "defaultSideMarginForDoubleButton");
      v28 = v27;
      +[TPSuperBottomBarButton defaultWidth](TPSuperBottomBarButton, "defaultWidth");
      v30 = v28 + v29 * 0.5;
      -[TPSlidingButton frame](self, "frame");
      v32 = floor(v30 - v31);
    }
    else
    {
      -[TPSlidingButton bounds](self, "bounds");
      v32 = v33 * 0.5;
    }
    v34 = -[TPSlidingButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v35 = -1.0;
    if (v34)
      v35 = 1.0;
    v36 = v32 + v35;
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSlidingButton sideButtonRight](self, "sideButtonRight");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "position");
    objc_msgSend(v37, "numberWithDouble:");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setMass:", 2.0);
    objc_msgSend(v76, "setStiffness:", 300.0);
    objc_msgSend(v76, "setDamping:", 50.0);
    objc_msgSend(v76, "setFromValue:", v78);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setToValue:", v40);

    objc_msgSend(v76, "setDuration:", 0.50999999);
    objc_msgSend(v76, "setFillMode:", v11);
    objc_msgSend(v76, "setRemovedOnCompletion:", 0);
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSlidingButton dialImageView](self, "dialImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "position");
    objc_msgSend(v41, "numberWithDouble:");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setMass:", 2.0);
    objc_msgSend(v44, "setStiffness:", 300.0);
    objc_msgSend(v44, "setDamping:", 50.0);
    v73 = v44;
    objc_msgSend(v44, "setFromValue:", v77);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setToValue:", v45);

    objc_msgSend(v44, "setDuration:", 0.50999999);
    objc_msgSend(v44, "setFillMode:", v11);
    objc_msgSend(v44, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0CB3B18];
    +[TPSuperBottomBarButton defaultHeight](TPSuperBottomBarButton, "defaultHeight");
    v48 = v47;
    +[TPSuperBottomBarButton defaultHeight](TPSuperBottomBarButton, "defaultHeight");
    objc_msgSend(v46, "valueWithCGRect:", 0.0, 0.0, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setToValue:", v50);

    objc_msgSend(v75, "setDuration:", 0.150000006);
    objc_msgSend(v75, "setFillMode:", v11);
    objc_msgSend(v75, "setRemovedOnCompletion:", 0);
    +[TPSuperBottomBarButton defaultHeight](TPSuperBottomBarButton, "defaultHeight");
    v52 = v51 * 0.5;
    -[UIButton layer](self->_sideButtonRight, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCornerRadius:", v52);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("backgroundColor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDuration:", 0.144999996);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v54, "setFromValue:", objc_msgSend(v55, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v54, "setToValue:", objc_msgSend(v56, "CGColor"));

    objc_msgSend(v54, "setFillMode:", v11);
    objc_msgSend(v54, "setRemovedOnCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setType:", *MEMORY[0x1E0CD3170]);
    v74 = v57;
    objc_msgSend(v57, "setDuration:", 0.115000002);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_77;
    v83[3] = &unk_1E75FD2A8;
    v83[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v83);
    -[UIImageView layer](self->_dialImageView, "layer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addAnimation:forKey:", v57, *MEMORY[0x1E0CD3168]);

    v59 = (void *)MEMORY[0x1E0DC3870];
    TelephonyUIBundle();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "imageNamed:inBundle:", CFSTR("phone_dial"), v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "_flatImageWithColor:", v62);
    v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v64 = objc_msgSend(v63, "CGImage");
    -[UIImageView layer](self->_dialImageView, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setContents:", v64);

    -[UIButton layer](self->_sideButtonRight, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addAnimation:forKey:", v54, CFSTR("backgroundColor"));

    -[UIButton layer](self->_sideButtonRight, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addAnimation:forKey:", v75, CFSTR("bounds"));

    -[UIButton layer](self->_sideButtonRight, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addAnimation:forKey:", v76, CFSTR("position"));

    -[UIImageView layer](self->_dialImageView, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addAnimation:forKey:", v79, CFSTR("transform"));

    -[_UIActionSlider layer](self->_acceptButton, "layer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addAnimation:forKey:", v82, CFSTR("opacity"));

    -[_UIActionSlider layer](self->_acceptButton, "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addAnimation:forKey:", v80, CFSTR("position"));

    -[UIImageView layer](self->_dialImageView, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addAnimation:forKey:", v73, CFSTR("position"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

uint64_t __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "slidingButtonDidFinishSlide");

    }
  }
}

void __48__TPSlidingButton_actionSliderDidCompleteSlide___block_invoke_77(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "slidingButtonDidFinishSlide");

    }
  }
}

- (UIButton)sideButtonRight
{
  return (UIButton *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSideButtonRight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (TPSlidingButtonDelegateProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPSlidingButtonDelegateProtocol *)a3;
}

- (UIImageView)dialImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setDialImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (_UIActionSlider)acceptButton
{
  return (_UIActionSlider *)objc_getProperty(self, a2, 448, 1);
}

- (void)setAcceptButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_dialImageView, 0);
  objc_storeStrong((id *)&self->_sideButtonRight, 0);
}

@end
