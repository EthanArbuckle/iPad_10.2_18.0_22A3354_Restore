@implementation SBUIPoseidonIconView

- (SBUIPoseidonIconView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  SBUILegibilityLabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  SBUILegibilityLabel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _QWORD v56[2];
  _QWORD v57[5];

  v57[3] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)SBUIPoseidonIconView;
  v3 = -[SBUIPoseidonIconView initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

    v5 = objc_alloc_init(MEMORY[0x1E0CEADF8]);
    v6 = (void *)*((_QWORD *)v3 + 52);
    *((_QWORD *)v3 + 52) = v5;

    objc_msgSend(*((id *)v3 + 52), "setStrength:", 0.25);
    v7 = (void *)*((_QWORD *)v3 + 52);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 52));
    objc_msgSend(v3, "setClipsToBounds:", 1);
    objc_msgSend(*((id *)v3 + 52), "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCornerRadius:", 5.0);
    objc_msgSend(v51, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    v9 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v10 = (void *)*((_QWORD *)v3 + 55);
    *((_QWORD *)v3 + 55) = v9;

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 55));
    v11 = (void *)*((_QWORD *)v3 + 55);
    v12 = *(_OWORD *)(v3 + 584);
    v13 = *(_OWORD *)(v3 + 616);
    v53 = *(_OWORD *)(v3 + 600);
    v54 = v13;
    v52 = v12;
    objc_msgSend(v11, "setTransform:", &v52);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v3 + 62);
    *((_QWORD *)v3 + 62) = v14;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v3 + 62);
    v19 = objc_retainAutorelease(v17);
    v57[0] = objc_msgSend(v19, "CGColor");
    v20 = objc_retainAutorelease(v16);
    v57[1] = objc_msgSend(v20, "CGColor");
    v21 = objc_retainAutorelease(v19);
    v57[2] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColors:", v22);

    objc_msgSend(*((id *)v3 + 62), "setStartPoint:", 0.0, 0.5);
    objc_msgSend(*((id *)v3 + 62), "setEndPoint:", 1.0, 0.5);
    objc_msgSend(*((id *)v3 + 62), "setLocations:", &unk_1E4C7AFD0);
    v23 = [SBUILegibilityLabel alloc];
    objc_msgSend(v3, "legibilitySettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices-j307"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "_fontSize");
    objc_msgSend(v27, "systemFontOfSize:weight:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[SBUILegibilityLabel initWithSettings:strength:string:font:](v23, "initWithSettings:strength:string:font:", v24, v26, v28, 0.25);
    v30 = (void *)*((_QWORD *)v3 + 53);
    *((_QWORD *)v3 + 53) = v29;

    objc_msgSend(*((id *)v3 + 53), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v3 + 55), "addSubview:", *((_QWORD *)v3 + 53));
    v31 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v32 = (void *)*((_QWORD *)v3 + 56);
    *((_QWORD *)v3 + 56) = v31;

    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 56));
    v33 = (void *)*((_QWORD *)v3 + 56);
    v34 = *(_OWORD *)(v3 + 584);
    v35 = *(_OWORD *)(v3 + 616);
    v53 = *(_OWORD *)(v3 + 600);
    v54 = v35;
    v52 = v34;
    objc_msgSend(v33, "setTransform:", &v52);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v3 + 58);
    *((_QWORD *)v3 + 58) = v36;

    v38 = (void *)*((_QWORD *)v3 + 58);
    v39 = objc_retainAutorelease(v20);
    v56[0] = objc_msgSend(v39, "CGColor");
    v40 = objc_retainAutorelease(v21);
    v56[1] = objc_msgSend(v40, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setColors:", v41);

    objc_msgSend(*((id *)v3 + 58), "setStartPoint:", 0.0, 0.5);
    objc_msgSend(*((id *)v3 + 58), "setEndPoint:", 1.0, 0.5);
    objc_msgSend(*((id *)v3 + 58), "setLocations:", &unk_1E4C7AFE8);
    v42 = [SBUILegibilityLabel alloc];
    objc_msgSend(v3, "legibilitySettings");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("REST_TO_OPEN"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices-j307"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "_fontSize");
    objc_msgSend(v46, "systemFontOfSize:weight:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[SBUILegibilityLabel initWithSettings:strength:string:font:](v42, "initWithSettings:strength:string:font:", v43, v45, v47, 0.25);
    v49 = (void *)*((_QWORD *)v3 + 54);
    *((_QWORD *)v3 + 54) = v48;

    objc_msgSend(*((id *)v3 + 54), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v3 + 56), "addSubview:", *((_QWORD *)v3 + 54));
    objc_msgSend(*((id *)v3 + 52), "setAlpha:", 0.0);
    objc_msgSend(*((id *)v3 + 55), "setAlpha:", 0.0);
    objc_msgSend(*((id *)v3 + 56), "setAlpha:", 0.0);
    objc_msgSend(v3, "setNeedsLayout");

  }
  return (SBUIPoseidonIconView *)v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[_UILegibilityView updateForChangedSettings:](self->_coachingButton, "updateForChangedSettings:", v5);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_coachingLabel, "setLegibilitySettings:", v5);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_restToOpenLabel, "setLegibilitySettings:", v5);
  }

}

- (void)setState:(int64_t)a3
{
  -[SBUIPoseidonIconView setState:forIdleTimeout:withCompletion:](self, "setState:forIdleTimeout:withCompletion:", a3, 0, 0);
}

- (void)setState:(int64_t)a3 forIdleTimeout:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[9];

  v5 = a4;
  v8 = a5;
  if (self->_state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 2:
        -[SBUIPoseidonIconView _stopShimmer](self, "_stopShimmer");
        -[SBUIPoseidonIconView delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "poseidonIconViewCoachingStateDidChange:", self);

        v18 = (void *)MEMORY[0x1E0CEABB0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_7;
        v21[3] = &unk_1E4C3E408;
        v21[4] = self;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_8;
        v19[3] = &unk_1E4C40BC0;
        v19[4] = self;
        v20 = v8;
        objc_msgSend(v18, "animateWithDuration:animations:completion:", v21, v19, 0.15);

        break;
      case 1:
        v9 = (void *)MEMORY[0x1E0CEABB0];
        v22[4] = self;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_5;
        v23[3] = &unk_1E4C3E408;
        v23[4] = self;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_6;
        v22[3] = &unk_1E4C3E510;
        v14 = 0.0;
        v15 = v23;
        v16 = v22;
LABEL_10:
        objc_msgSend(v9, "animateWithDuration:animations:completion:", v15, v16, v14);
        break;
      case 0:
        -[SBUIPoseidonIconView _stopShimmer](self, "_stopShimmer");
        -[SBUIPoseidonIconView _cancelRestToOpenIdleTimer](self, "_cancelRestToOpenIdleTimer");
        if (v5)
        {
          -[_UILegibilityView frame](self->_coachingButton, "frame");
          v9 = (void *)MEMORY[0x1E0CEABB0];
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke;
          v27[3] = &unk_1E4C40B98;
          v27[4] = self;
          v27[5] = v10;
          v27[6] = v11;
          v27[7] = v12;
          v27[8] = v13;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_2;
          v26[3] = &unk_1E4C3E510;
          v26[4] = self;
          v14 = 0.5;
          v15 = v27;
          v16 = v26;
        }
        else
        {
          v9 = (void *)MEMORY[0x1E0CEABB0];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_3;
          v25[3] = &unk_1E4C3E408;
          v25[4] = self;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_4;
          v24[3] = &unk_1E4C3E510;
          v24[4] = self;
          v14 = 0.15;
          v15 = v25;
          v16 = v24;
        }
        goto LABEL_10;
    }
    -[SBUIPoseidonIconView _cancelRestToOpenProgress](self, "_cancelRestToOpenProgress");
    -[SBUIPoseidonIconView setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), -*(double *)(a1 + 64), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

void __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "poseidonIconViewCoachingStateDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

void __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "poseidonIconViewCoachingStateDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.7);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
}

void __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "poseidonIconViewCoachingStateDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.7);
}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_startRestToOpenIdleTimer");
}

- (void)fillRestToOpenWithDuration:(double)a3
{
  CAGradientLayer *progressFillGradient;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  -[SBUIPoseidonIconView _cancelRestToOpenIdleTimer](self, "_cancelRestToOpenIdleTimer");
  if (a3 > 0.0)
  {
    -[UIView alpha](self->_restToOpenLabelRotationView, "alpha");
    if (BSFloatGreaterThanFloat())
      -[UIView setAlpha:](self->_restToOpenLabelRotationView, "setAlpha:", 1.0);
    progressFillGradient = self->_progressFillGradient;
    -[UIView bounds](self->_restToOpenLabelRotationView, "bounds");
    v7 = v6 * 1.2;
    -[UIView bounds](self->_restToOpenLabelRotationView, "bounds");
    -[CAGradientLayer setFrame:](progressFillGradient, "setFrame:", 0.0, 0.0, v7);
    -[UIView layer](self->_restToOpenLabelRotationView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMask:", self->_progressFillGradient);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("locations"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer locations](self->_progressFillGradient, "locations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v9);

    objc_msgSend(v11, "setToValue:", &unk_1E4C7B000);
    LODWORD(v10) = 1.0;
    objc_msgSend(v11, "setRepeatCount:", v10);
    objc_msgSend(v11, "setDuration:", a3);
    objc_msgSend(v11, "setDelegate:", self);
    -[CAGradientLayer removeAllAnimations](self->_progressFillGradient, "removeAllAnimations");
    -[CAGradientLayer addAnimation:forKey:](self->_progressFillGradient, "addAnimation:forKey:", v11, CFSTR("fillGradient"));
    self->_fullProgressFillDuration = a3;
    self->_startProgressFillTime = CACurrentMediaTime();
    self->_isFilling = 1;

  }
}

- (void)resetRestToOpen
{
  -[SBUIPoseidonIconView _cancelRestToOpenProgress](self, "_cancelRestToOpenProgress");
  -[SBUIPoseidonIconView _startRestToOpenIdleTimer](self, "_startRestToOpenIdleTimer");
  -[SBUIPoseidonIconView setNeedsLayout](self, "setNeedsLayout");
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
  id *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t state;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  SBUILegibilityLabel *coachingLabel;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  _BOOL4 containsFirstRowIcons;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  UIView *restToOpenLabelRotationView;
  SBUILegibilityLabel *restToOpenLabel;
  objc_super v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v71.receiver = self;
  v71.super_class = (Class)SBUIPoseidonIconView;
  -[SBUIPoseidonIconView layoutSubviews](&v71, sel_layoutSubviews);
  if ((unint64_t)(self->_state - 1) <= 1)
  {
    -[SBUIPoseidonIconView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[SBUIPoseidonIconView frame](self, "frame");
    v8 = v7;
    v10 = v9;
    v11 = (id *)MEMORY[0x1E0CEB258];
    if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 1) >= 2)
      v8 = v10;
    -[SBUIPoseidonIconView _physicalButtonNormalizedFrame](self, "_physicalButtonNormalizedFrame");
    -[_UILegibilityView setFrame:](self->_coachingButton, "setFrame:", v4 * v12, v6 * v13 + -18.0, v8 * v14, 24.0);
    -[_UILegibilityView center](self->_coachingButton, "center");
    v16 = v15;
    -[_UILegibilityView frame](self->_coachingButton, "frame");
    v17 = v4 - CGRectGetMaxX(v72);
    state = self->_state;
    if (state == 1)
    {
      -[SBUILegibilityLabel sizeThatFits:](self->_coachingLabel, "sizeThatFits:", 250.0, v6);
      v20 = v19;
      v22 = v21;
      v23 = objc_msgSend(*v11, "activeInterfaceOrientation") - 3;
      -[_UILegibilityView frame](self->_coachingButton, "frame");
      v24 = CGRectGetMaxY(v73) + 10.0;
      v25 = 0;
      v26 = 0;
      v27 = v20;
      v28 = v22;
      if (v23 > 1)
      {
        v30 = v24 + CGRectGetHeight(*(CGRect *)&v25) * 0.5;
        -[SBUILegibilityLabel baselineOffset](self->_coachingLabel, "baselineOffset");
        v29 = v30 - v31;
        if (v20 >= 82.0)
          v16 = v4 - v17 + v20 * -0.5;
      }
      else
      {
        v29 = v24 + CGRectGetWidth(*(CGRect *)&v25) * 0.5;
      }
      if (objc_msgSend(*v11, "activeInterfaceOrientation") == 1)
        v32 = 2;
      else
        v32 = 2 * (objc_msgSend(*v11, "activeInterfaceOrientation") == 4);
      -[SBUILegibilityLabel setTextAlignment:](self->_coachingLabel, "setTextAlignment:", v32);
      -[UIView setBounds:](self->_coachingLabelRotationView, "setBounds:", 0.0, 0.0, v20, v22);
      -[UIView setCenter:](self->_coachingLabelRotationView, "setCenter:", v16, v29);
      coachingLabel = self->_coachingLabel;
      -[UIView bounds](self->_coachingLabelRotationView, "bounds");
      -[SBUILegibilityLabel setFrame:](coachingLabel, "setFrame:");
      if (objc_msgSend(*v11, "activeInterfaceOrientation") == 3 && self->_containsFirstRowIcons)
      {
        -[UIView setHidden:](self->_coachingLabelRotationView, "setHidden:", 1);
      }
      else
      {
        -[UIView setHidden:](self->_coachingLabelRotationView, "setHidden:", 0);
        -[SBUIPoseidonIconView _startShimmer](self, "_startShimmer");
      }
      state = self->_state;
    }
    if (state == 2)
    {
      -[SBUILegibilityLabel sizeThatFits:](self->_restToOpenLabel, "sizeThatFits:", 250.0, v6);
      v35 = v34;
      v37 = v36;
      v38 = objc_msgSend(*v11, "activeInterfaceOrientation") - 3;
      -[_UILegibilityView frame](self->_coachingButton, "frame");
      v39 = CGRectGetMaxY(v74) + 10.0;
      v40 = 0;
      v41 = 0;
      v42 = v35;
      v43 = v37;
      if (v38 > 1)
      {
        v45 = v39 + CGRectGetHeight(*(CGRect *)&v40) * 0.5;
        -[SBUILegibilityLabel baselineOffset](self->_restToOpenLabel, "baselineOffset");
        v44 = v45 - v46;
        if (v35 >= 82.0)
          v16 = v4 - v17 + v35 * -0.5;
      }
      else
      {
        v44 = v39 + CGRectGetWidth(*(CGRect *)&v40) * 0.5;
      }
      if (objc_msgSend(*v11, "activeInterfaceOrientation") == 1)
        v47 = 2;
      else
        v47 = 2 * (objc_msgSend(*v11, "activeInterfaceOrientation") == 4);
      -[SBUILegibilityLabel setTextAlignment:](self->_restToOpenLabel, "setTextAlignment:", v47);
      if (objc_msgSend(*v11, "activeInterfaceOrientation") == 3)
      {
        containsFirstRowIcons = self->_containsFirstRowIcons;
        if (self->_containsFirstRowIcons)
          v16 = v16 + 10.0;
      }
      else
      {
        containsFirstRowIcons = 0;
      }
      -[UIView setBounds:](self->_restToOpenLabelRotationView, "setBounds:", 0.0, 0.0, v35, v37);
      -[UIView setCenter:](self->_restToOpenLabelRotationView, "setCenter:", v16, v44);
      if (containsFirstRowIcons)
      {
        -[UIView frame](self->_restToOpenLabelRotationView, "frame");
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v56 = v55;
        -[SBUIPoseidonIconView superview](self, "superview");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUIPoseidonIconView convertRect:toView:](self, "convertRect:toView:", v57, v50, v52, v54, v56);
        v59 = v58;
        v61 = v60;
        v63 = v62;
        v65 = v64;

        v75.origin.x = v59;
        v75.origin.y = v61;
        v75.size.width = v63;
        v75.size.height = v65;
        if (CGRectIntersectsRect(self->_sidebarFrame, v75))
        {
          v66 = v61 + v65 - self->_sidebarFrame.origin.y;
          -[UIView center](self->_restToOpenLabelRotationView, "center");
          v68 = v66 + v67 + 3.0;
          restToOpenLabelRotationView = self->_restToOpenLabelRotationView;
          -[UIView center](restToOpenLabelRotationView, "center");
          -[UIView setCenter:](restToOpenLabelRotationView, "setCenter:", v68);
        }
      }
      restToOpenLabel = self->_restToOpenLabel;
      -[UIView bounds](self->_restToOpenLabelRotationView, "bounds");
      -[SBUILegibilityLabel setFrame:](restToOpenLabel, "setFrame:");
    }
  }
}

- (void)setLocalTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_localTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  UIView *coachingLabelRotationView;
  __int128 v11;
  UIView *restToOpenLabelRotationView;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform t1;

  p_localTransform = &self->_localTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_localTransform.c;
  *(_OWORD *)&v14.a = *(_OWORD *)&self->_localTransform.a;
  *(_OWORD *)&v14.c = v7;
  *(_OWORD *)&v14.tx = *(_OWORD *)&self->_localTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v14))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_localTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_localTransform->tx = v9;
    *(_OWORD *)&p_localTransform->a = v8;
    coachingLabelRotationView = self->_coachingLabelRotationView;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    -[UIView setTransform:](coachingLabelRotationView, "setTransform:", &t1);
    restToOpenLabelRotationView = self->_restToOpenLabelRotationView;
    v13 = *(_OWORD *)&p_localTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_localTransform->a;
    *(_OWORD *)&t1.c = v13;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_localTransform->tx;
    -[UIView setTransform:](restToOpenLabelRotationView, "setTransform:", &t1);
  }
}

- (double)_fontSize
{
  void *v2;
  NSString *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB3C0])
    || UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB3C8])
    || UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB3D0])
    || UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB3D8]))
  {
    v4 = 32.0;
  }
  else
  {
    v4 = 28.0;
    if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB3E0]))
    {
      v4 = 24.0;
      if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB3F8]))
      {
        v4 = 22.0;
        if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB400]))
        {
          v4 = 20.0;
          if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB408]))
          {
            v4 = 19.0;
            if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB420]))
            {
              v4 = 18.0;
              if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB428])
                && !UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB438]))
              {
                if (UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E0CEB410]))
                  v4 = 16.0;
                else
                  v4 = 18.0;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (CGRect)_physicalButtonNormalizedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (_physicalButtonNormalizedFrame_onceToken != -1)
    dispatch_once(&_physicalButtonNormalizedFrame_onceToken, &__block_literal_global_41);
  v3 = *((double *)&_physicalButtonNormalizedFrame_frame + 1);
  v2 = *(double *)&_physicalButtonNormalizedFrame_frame;
  v4 = *(double *)&qword_1EE763F50;
  v5 = unk_1EE763F58;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void __54__SBUIPoseidonIconView__physicalButtonNormalizedFrame__block_invoke()
{
  const __CFData *v0;
  const __CFData *v1;
  CFTypeID v2;
  __int128 *BytePtr;
  __int128 v4;

  v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = (__int128 *)CFDataGetBytePtr(v1);
      v4 = BytePtr[1];
      _physicalButtonNormalizedFrame_frame = *BytePtr;
      *(_OWORD *)&qword_1EE763F50 = v4;
    }
    CFRelease(v1);
  }
}

- (void)_contentSizeCategoryDidChange
{
  SBUILegibilityLabel *coachingLabel;
  void *v4;
  void *v5;
  SBUILegibilityLabel *restToOpenLabel;
  void *v7;
  void *v8;

  coachingLabel = self->_coachingLabel;
  v4 = (void *)MEMORY[0x1E0CEA5E8];
  -[SBUIPoseidonIconView _fontSize](self, "_fontSize");
  objc_msgSend(v4, "systemFontOfSize:weight:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setFont:](coachingLabel, "setFont:", v5);

  restToOpenLabel = self->_restToOpenLabel;
  v7 = (void *)MEMORY[0x1E0CEA5E8];
  -[SBUIPoseidonIconView _fontSize](self, "_fontSize");
  objc_msgSend(v7, "systemFontOfSize:weight:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setFont:](restToOpenLabel, "setFont:", v8);

  -[SBUIPoseidonIconView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_cancelRestToOpenProgress
{
  void *v3;
  CFTimeInterval v4;
  CFTimeInterval v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[CAGradientLayer animationForKey:](self->_progressFillGradient, "animationForKey:", CFSTR("fillGradient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self->_isFilling = 0;
    v4 = CACurrentMediaTime() - self->_startProgressFillTime;
    v5 = v4 / self->_fullProgressFillDuration;
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("locations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 + -0.05);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 + 0.05);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromValue:", v9);

    -[CAGradientLayer locations](self->_progressFillGradient, "locations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setToValue:", v10);

    LODWORD(v11) = 1.0;
    objc_msgSend(v6, "setRepeatCount:", v11);
    objc_msgSend(v6, "setDuration:", v4 * 0.5);
    objc_msgSend(v6, "setDelegate:", self);
    -[CAGradientLayer removeAllAnimations](self->_progressFillGradient, "removeAllAnimations");
    -[CAGradientLayer addAnimation:forKey:](self->_progressFillGradient, "addAnimation:forKey:", v6, CFSTR("unfillGradient"));

  }
}

- (void)_startShimmer
{
  NSTimer *v3;
  NSTimer *idleUntilShimmerTimer;
  _QWORD v5[5];

  if (!self->_idleUntilShimmerTimer)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__SBUIPoseidonIconView__startShimmer__block_invoke;
    v5[3] = &unk_1E4C40BE8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 2.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    idleUntilShimmerTimer = self->_idleUntilShimmerTimer;
    self->_idleUntilShimmerTimer = v3;

  }
}

void __37__SBUIPoseidonIconView__startShimmer__block_invoke(uint64_t a1)
{
  _BOOL4 IsReduceMotionEnabled;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = *(_QWORD *)(a1 + 32);
  if (IsReduceMotionEnabled && !*(_QWORD *)(v3 + 512))
  {
    objc_msgSend((id)v3, "_startReduceMotionShimmer");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__SBUIPoseidonIconView__startShimmer__block_invoke_2;
    v17[3] = &unk_1E4C40BE8;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v17, 3.5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 512);
    *(_QWORD *)(v14 + 512) = v13;

  }
  else
  {
    objc_msgSend(*(id *)(v3 + 440), "alpha");
    if (BSFloatGreaterThanFloat())
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 496);
    objc_msgSend(*(id *)(v4 + 440), "bounds");
    v7 = -v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "bounds");
    v9 = v8 * 3.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "bounds");
    objc_msgSend(v5, "setFrame:", v7, 0.0, v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("locations"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "locations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFromValue:", v11);

    objc_msgSend(v16, "setToValue:", &unk_1E4C7B018);
    LODWORD(v12) = 2139095040;
    objc_msgSend(v16, "setRepeatCount:", v12);
    objc_msgSend(v16, "setDuration:", 2.5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "addAnimation:forKey:", v16, CFSTR("animateGradient"));

  }
}

uint64_t __37__SBUIPoseidonIconView__startShimmer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startReduceMotionShimmer");
}

- (void)_startReduceMotionShimmer
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke;
  v3[3] = &unk_1E4C3E408;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_2;
  v2[3] = &unk_1E4C3E510;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 1.5);
}

uint64_t __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 544) == 1)
    return objc_msgSend(*(id *)(v1 + 440), "setAlpha:", 1.0);
  return result;
}

uint64_t __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_3;
  v3[3] = &unk_1E4C3E408;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_4;
  v2[3] = &unk_1E4C3E510;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v2, 1.5);
}

uint64_t __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 544) == 1)
    return objc_msgSend(*(id *)(v1 + 440), "setAlpha:", 0.7);
  return result;
}

void __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllAnimations");

}

- (void)_stopShimmer
{
  void *v3;
  NSTimer *idleUntilShimmerTimer;
  NSTimer *v5;
  void *v6;
  NSTimer *reduceMotionShimmerTimer;
  NSTimer *v8;

  -[UIView alpha](self->_coachingLabelRotationView, "alpha");
  if (BSFloatGreaterThanFloat())
    -[UIView setAlpha:](self->_coachingLabelRotationView, "setAlpha:", 0.7);
  -[UIView layer](self->_coachingLabelRotationView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMask:", 0);

  idleUntilShimmerTimer = self->_idleUntilShimmerTimer;
  if (idleUntilShimmerTimer)
  {
    -[NSTimer invalidate](idleUntilShimmerTimer, "invalidate");
    v5 = self->_idleUntilShimmerTimer;
    self->_idleUntilShimmerTimer = 0;

  }
  -[UIView layer](self->_coachingLabelRotationView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  reduceMotionShimmerTimer = self->_reduceMotionShimmerTimer;
  if (reduceMotionShimmerTimer)
  {
    -[NSTimer invalidate](reduceMotionShimmerTimer, "invalidate");
    v8 = self->_reduceMotionShimmerTimer;
    self->_reduceMotionShimmerTimer = 0;

  }
}

- (void)_startRestToOpenIdleTimer
{
  NSTimer *v3;
  NSTimer *restToOpenIdleTimer;
  _QWORD v5[5];

  -[SBUIPoseidonIconView _cancelRestToOpenIdleTimer](self, "_cancelRestToOpenIdleTimer");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SBUIPoseidonIconView__startRestToOpenIdleTimer__block_invoke;
  v5[3] = &unk_1E4C40BE8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 3.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  restToOpenIdleTimer = self->_restToOpenIdleTimer;
  self->_restToOpenIdleTimer = v3;

}

uint64_t __49__SBUIPoseidonIconView__startRestToOpenIdleTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:forIdleTimeout:withCompletion:", 0, 1, 0);
}

- (void)_cancelRestToOpenIdleTimer
{
  NSTimer *restToOpenIdleTimer;
  NSTimer *v4;

  restToOpenIdleTimer = self->_restToOpenIdleTimer;
  if (restToOpenIdleTimer)
  {
    -[NSTimer invalidate](restToOpenIdleTimer, "invalidate");
    v4 = self->_restToOpenIdleTimer;
    self->_restToOpenIdleTimer = 0;

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;

  if (a4)
  {
    -[UIView layer](self->_restToOpenLabelRotationView, "layer", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", 0);

    if (!self->_isFilling)
    {
      -[UIView alpha](self->_restToOpenLabelRotationView, "alpha");
      if (BSFloatGreaterThanFloat())
        -[UIView setAlpha:](self->_restToOpenLabelRotationView, "setAlpha:", 0.7);
    }
    -[SBUIPoseidonIconView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (SBUIPoseidonIconViewDelegate)delegate
{
  return (SBUIPoseidonIconViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (int64_t)state
{
  return self->_state;
}

- (CGAffineTransform)localTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[12].ty;
  return self;
}

- (BOOL)containsFirstRowIcons
{
  return self->_containsFirstRowIcons;
}

- (void)setContainsFirstRowIcons:(BOOL)a3
{
  self->_containsFirstRowIcons = a3;
}

- (CGRect)sidebarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sidebarFrame.origin.x;
  y = self->_sidebarFrame.origin.y;
  width = self->_sidebarFrame.size.width;
  height = self->_sidebarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSidebarFrame:(CGRect)a3
{
  self->_sidebarFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reduceMotionShimmerTimer, 0);
  objc_storeStrong((id *)&self->_idleUntilShimmerTimer, 0);
  objc_storeStrong((id *)&self->_shimmerGradient, 0);
  objc_storeStrong((id *)&self->_progressFillGradient, 0);
  objc_storeStrong((id *)&self->_restToOpenIdleTimer, 0);
  objc_storeStrong((id *)&self->_restToOpenLabelRotationView, 0);
  objc_storeStrong((id *)&self->_coachingLabelRotationView, 0);
  objc_storeStrong((id *)&self->_restToOpenLabel, 0);
  objc_storeStrong((id *)&self->_coachingLabel, 0);
  objc_storeStrong((id *)&self->_coachingButton, 0);
}

@end
