@implementation SBUIFaceIDCameraGlyphView

- (SBUIFaceIDCameraGlyphView)initWithFrame:(CGRect)a3
{
  SBUIFaceIDCameraGlyphView *v3;
  SBUIFaceIDCameraGlyphView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UIView *arrowContainer;
  uint64_t v9;
  MTMaterialView *arrowBackgroundView;
  CALayer *v11;
  CALayer *maskTopLayer;
  id v13;
  CALayer *v14;
  CALayer *maskLeftLayer;
  id v16;
  CALayer *v17;
  CALayer *maskRightLayer;
  id v19;
  CALayer *v20;
  CALayer *maskContainerLayer;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  _UILegibilityView *arrowTail;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  _UILegibilityView *arrowHead;
  UIView *v42;
  UIView *localRotationView;
  UIView *v44;
  __int128 v45;
  __int128 v46;
  SBUILegibilityLabel *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  SBUILegibilityLabel *callToActionLabel;
  void *v54;
  _OWORD v56[3];
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)SBUIFaceIDCameraGlyphView;
  v3 = -[SBUIFaceIDCameraGlyphView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBUIFaceIDCameraGlyphView bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__updateCallToActionLabelFont, *MEMORY[0x1E0CEB3F0], 0);

    v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    arrowContainer = v4->_arrowContainer;
    v4->_arrowContainer = (UIView *)v7;

    -[SBUIFaceIDCameraGlyphView addSubview:](v4, "addSubview:", v4->_arrowContainer);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    arrowBackgroundView = v4->_arrowBackgroundView;
    v4->_arrowBackgroundView = (MTMaterialView *)v9;

    -[MTMaterialView _setCornerRadius:](v4->_arrowBackgroundView, "_setCornerRadius:", 15.0);
    -[MTMaterialView setWeighting:](v4->_arrowBackgroundView, "setWeighting:", 1.0);
    -[UIView addSubview:](v4->_arrowContainer, "addSubview:", v4->_arrowBackgroundView);
    v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskTopLayer = v4->_maskTopLayer;
    v4->_maskTopLayer = v11;

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_maskTopLayer, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

    v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskLeftLayer = v4->_maskLeftLayer;
    v4->_maskLeftLayer = v14;

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_maskLeftLayer, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

    v17 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskRightLayer = v4->_maskRightLayer;
    v4->_maskRightLayer = v17;

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_maskRightLayer, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

    v20 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskContainerLayer = v4->_maskContainerLayer;
    v4->_maskContainerLayer = v20;

    -[CALayer addSublayer:](v4->_maskContainerLayer, "addSublayer:", v4->_maskTopLayer);
    -[CALayer addSublayer:](v4->_maskContainerLayer, "addSublayer:", v4->_maskLeftLayer);
    -[CALayer addSublayer:](v4->_maskContainerLayer, "addSublayer:", v4->_maskRightLayer);
    v22 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CameraCoveredTail"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sbf_imageUsingContextType:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_alloc(MEMORY[0x1E0CEADF8]);
    -[SBUIFaceIDCameraGlyphView legibilitySettings](v4, "legibilitySettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithSettings:strength:image:", v29, v27, 0.25);
    arrowTail = v4->_arrowTail;
    v4->_arrowTail = (_UILegibilityView *)v30;

    -[_UILegibilityView setContentMode:](v4->_arrowTail, "setContentMode:", 4);
    -[MTMaterialView addSubview:](v4->_arrowBackgroundView, "addSubview:", v4->_arrowTail);
    v32 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CameraCovered"), v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sbf_imageUsingContextType:", 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_alloc(MEMORY[0x1E0CEADF8]);
    -[SBUIFaceIDCameraGlyphView legibilitySettings](v4, "legibilitySettings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "initWithSettings:strength:image:", v39, v37, 0.25);
    arrowHead = v4->_arrowHead;
    v4->_arrowHead = (_UILegibilityView *)v40;

    -[_UILegibilityView setContentMode:](v4->_arrowHead, "setContentMode:", 4);
    -[MTMaterialView addSubview:](v4->_arrowBackgroundView, "addSubview:", v4->_arrowHead);
    v42 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    localRotationView = v4->_localRotationView;
    v4->_localRotationView = v42;

    -[SBUIFaceIDCameraGlyphView addSubview:](v4, "addSubview:", v4->_localRotationView);
    v44 = v4->_localRotationView;
    v45 = *(_OWORD *)&v4->_localTransform.a;
    v46 = *(_OWORD *)&v4->_localTransform.tx;
    v56[1] = *(_OWORD *)&v4->_localTransform.c;
    v56[2] = v46;
    v56[0] = v45;
    -[UIView setTransform:](v44, "setTransform:", v56);
    v47 = [SBUILegibilityLabel alloc];
    -[SBUIFaceIDCameraGlyphView legibilitySettings](v4, "legibilitySettings");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CAMERA_COVERED_CALL_TO_ACTION"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices_Late_Fall_2018_iOS"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    SBUICurrentPreferredFontForCoachingText();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[SBUILegibilityLabel initWithSettings:strength:string:font:](v47, "initWithSettings:strength:string:font:", v48, v50, v51, 0.25);
    callToActionLabel = v4->_callToActionLabel;
    v4->_callToActionLabel = (SBUILegibilityLabel *)v52;

    -[SBUILegibilityLabel setNumberOfLines:](v4->_callToActionLabel, "setNumberOfLines:", 3);
    -[UIView addSubview:](v4->_localRotationView, "addSubview:", v4->_callToActionLabel);
    -[MTMaterialView layer](v4->_arrowBackgroundView, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAllowsGroupOpacity:", 1);

    -[UIView setAlpha:](v4->_arrowContainer, "setAlpha:", 0.0);
    -[SBUILegibilityLabel setAlpha:](v4->_callToActionLabel, "setAlpha:", 0.0);
    -[SBUIFaceIDCameraGlyphView _installMask](v4, "_installMask");

  }
  return v4;
}

- (void)_installMask
{
  CALayer *maskContainerLayer;
  void *v4;
  void *v5;
  CALayer *v6;
  void *v7;
  void *v8;

  maskContainerLayer = self->_maskContainerLayer;
  -[_UILegibilityView shadowImageView](self->_arrowHead, "shadowImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mask");
  v6 = (CALayer *)objc_claimAutoreleasedReturnValue();

  if (maskContainerLayer != v6)
  {
    -[_UILegibilityView shadowImageView](self->_arrowHead, "shadowImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMask:", self->_maskContainerLayer);

    -[SBUIFaceIDCameraGlyphView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setState:(unint64_t)a3
{
  -[SBUIFaceIDCameraGlyphView setState:delay:](self, "setState:delay:", a3, 0.0);
}

- (void)setState:(unint64_t)a3 delay:(double)a4
{
  unint64_t state;
  void *v6;
  UIView *arrowContainer;
  uint64_t *v8;
  SBUIFaceIDCameraGlyphView *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  SBUIFaceIDCameraGlyphView *v15;
  _QWORD v16[2];
  SBUILegibilityLabel *callToActionLabel;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    if (!state)
    {
      -[SBUIFaceIDCameraGlyphView _flyInWithText:delay:](self, "_flyInWithText:delay:", a3 == 2, a4);
      return;
    }
    if (a3)
    {
      if (a3 != 1)
      {
        if (a3 != 2)
          return;
        v18[0] = self->_callToActionLabel;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, a4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBUIFaceIDCameraGlyphView _fadeComponentsIn:completion:](self, "_fadeComponentsIn:completion:", v6, 0);
        goto LABEL_11;
      }
      callToActionLabel = self->_callToActionLabel;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &callToActionLabel, 1, a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self;
      v10 = v6;
      v8 = 0;
    }
    else
    {
      arrowContainer = self->_arrowContainer;
      v16[0] = self->_callToActionLabel;
      v16[1] = arrowContainer;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2, a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __44__SBUIFaceIDCameraGlyphView_setState_delay___block_invoke;
      v14 = &unk_1E4C3E510;
      v15 = self;
      v8 = &v11;
      v9 = self;
      v10 = v6;
    }
    -[SBUIFaceIDCameraGlyphView _fadeComponentsOut:completion:](v9, "_fadeComponentsOut:completion:", v10, v8, v11, v12, v13, v14, v15);
LABEL_11:

  }
}

uint64_t __44__SBUIFaceIDCameraGlyphView_setState_delay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAnimations");
}

- (void)_flyInWithText:(BOOL)a3 delay:(double)a4
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  SBUILegibilityLabel *callToActionLabel;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  UIView *arrowContainer;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  CGAffineTransform v40;
  _QWORD v41[5];
  _QWORD v42[5];
  CGAffineTransform v43;

  v6 = 0x1E0D01000uLL;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 0x1E0D01000uLL;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D017D8], "settingsWithMass:stiffness:damping:", 3.0, 200.0, 38.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v9;
    objc_msgSend(v9, "setDelay:", a4 + 0.045);
    -[SBUIFaceIDCameraGlyphView window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "interfaceOrientation");

    v12 = 300.0;
    if (v11 != 3)
      v12 = 0.0;
    if (v11 == 4)
      v12 = -300.0;
    callToActionLabel = self->_callToActionLabel;
    CGAffineTransformMakeTranslation(&v43, v12, 0.0);
    -[SBUILegibilityLabel setTransform:](callToActionLabel, "setTransform:", &v43);
    v42[0] = v7;
    v42[1] = 3221225472;
    v42[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke;
    v42[3] = &unk_1E4C3E408;
    v42[4] = self;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v9, v42);
    v14 = (void *)MEMORY[0x1E0D016B0];
    v15 = *MEMORY[0x1E0CD3048];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settingsWithDuration:delay:timingFunction:", v16, 0.5, a4 + 0.265);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2;
    v41[3] = &unk_1E4C3E408;
    v41[4] = self;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v17, v41);
    objc_msgSend(MEMORY[0x1E0CD2798], "animation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDuration:", 0.7);
    objc_msgSend(v18, "setRemovedOnCompletion:", 1);
    objc_msgSend(v18, "setBeginTime:", CACurrentMediaTime() + 0.335 + a4);
    objc_msgSend(v18, "setValues:", &unk_1E4C7B030);
    objc_msgSend(v18, "setKeyTimes:", &unk_1E4C7B048);
    -[_UILegibilityView layer](self->_arrowTail, "layer");
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAnimation:forKey:", v18, CFSTR("transform.translation.y"));

    v7 = v19;
    v21 = v15;

    v8 = 0x1E0D01000;
    v6 = 0x1E0D01000;
  }
  else
  {
    v21 = *MEMORY[0x1E0CD3048];
  }
  objc_msgSend(*(id *)(v6 + 2008), "settingsWithMass:stiffness:damping:", 3.0, 250.0, 50.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = a4 + -0.005;
  if (a4 + -0.005 < 0.0)
    v24 = 0.0;
  objc_msgSend(v22, "setDelay:", v24);
  arrowContainer = self->_arrowContainer;
  CGAffineTransformMakeTranslation(&v40, 0.0, 300.0);
  -[UIView setTransform:](arrowContainer, "setTransform:", &v40);
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_38;
  v39[3] = &unk_1E4C3E408;
  v39[4] = self;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v23, v39);
  v26 = *(void **)(v8 + 1712);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "settingsWithDuration:delay:timingFunction:", v27, 0.5, a4 + 0.04);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2_39;
  v38[3] = &unk_1E4C3E408;
  v38[4] = self;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", v28, v38);
  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDuration:", 0.75);
  objc_msgSend(v29, "setBeginTime:", CACurrentMediaTime() + 0.7464 + a4);
  objc_msgSend(v29, "setRemovedOnCompletion:", 0);
  objc_msgSend(v29, "setAutoreverses:", 1);
  LODWORD(v30) = 2139095040;
  objc_msgSend(v29, "setRepeatCount:", v30);
  objc_msgSend(v29, "setKeyPath:", CFSTR("transform.translation.y"));
  objc_msgSend(v29, "setFromValue:", &unk_1E4C7AD28);
  objc_msgSend(v29, "setToValue:", &unk_1E4C7AEA0);
  LODWORD(v31) = 0.5;
  LODWORD(v32) = 0;
  LODWORD(v33) = 0.5;
  LODWORD(v34) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTimingFunction:", v35);

  -[_UILegibilityView layer](self->_arrowHead, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addAnimation:forKey:", v29, CFSTR("transform.translation.y"));

}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_38(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

- (void)_fadeComponentsIn:(id)a3 completion:(id)a4
{
  -[SBUIFaceIDCameraGlyphView _setAlpha:onComponents:completion:](self, "_setAlpha:onComponents:completion:", a3, a4, 1.0);
}

- (void)_fadeComponentsOut:(id)a3 completion:(id)a4
{
  -[SBUIFaceIDCameraGlyphView _setAlpha:onComponents:completion:](self, "_setAlpha:onComponents:completion:", a3, a4, 0.0);
}

- (void)_setAlpha:(double)a3 onComponents:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  double v17;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D01908];
  v14 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke;
  v15[3] = &unk_1E4C3E678;
  v16 = v7;
  v17 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke_2;
  v13[3] = &unk_1E4C3E4E8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "animateWithSettings:actions:completion:", v9, v15, v13);

}

void __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke(uint64_t a1)
{
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

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeAnimations
{
  _UILegibilityView *arrowTail;
  _UILegibilityView *arrowHead;
  UIView *arrowContainer;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  arrowTail = self->_arrowTail;
  v15[0] = self->_callToActionLabel;
  v15[1] = arrowTail;
  arrowHead = self->_arrowHead;
  arrowContainer = self->_arrowContainer;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15[2] = arrowHead;
  v15[3] = arrowContainer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAllAnimations");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)layoutSubviews
{
  void *v2;
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  int v11;
  char v12;
  int v13;
  char v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  SBUILegibilityLabel *callToActionLabel;
  CGSize v57;
  CGPoint origin;
  CGFloat v59;
  CGFloat v60;
  CGFloat recta;
  double v62;
  CGRect v63;
  CGRect remainder;
  CGRect slice;
  objc_super v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v66.receiver = self;
  v66.super_class = (Class)SBUIFaceIDCameraGlyphView;
  -[SBUIFaceIDCameraGlyphView layoutSubviews](&v66, sel_layoutSubviews);
  -[SBUIFaceIDCameraGlyphView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[_UILegibilityView image](self->_arrowHead, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");

  -[UIView setFrame:](self->_arrowContainer, "setFrame:", 0.0, 0.0, 80.0, 80.0);
  -[MTMaterialView setFrame:](self->_arrowBackgroundView, "setFrame:", 0.0, 0.0, 80.0, 80.0);
  v10 = SBUIFaceIDCameraOrientationForDevice();
  v11 = __sb__runningInSpringBoard();
  v12 = v11;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1 || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_14:

      goto LABEL_15;
    }
  }
  v13 = __sb__runningInSpringBoard();
  v14 = v13;
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if ((v14 & 1) == 0)

  if ((v12 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  if (v6 >= v8)
    v15 = v6;
  else
    v15 = v8;
  if (v6 >= v8)
    v16 = v8;
  else
    v16 = v6;
  if (v10 != 2)
    v15 = v16;
  v62 = v15 * 0.5;
  -[UIView setCenter:](self->_arrowContainer, "setCenter:");
  -[_UILegibilityView image](self->_arrowHead, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = (80.0 - v18) * 0.5;

  -[UIView bounds](self->_arrowContainer, "bounds");
  v68 = CGRectInset(v67, v19, 14.0);
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  v57 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  origin = slice.origin;
  slice.size = v57;
  remainder.origin = slice.origin;
  remainder.size = v57;
  -[_UILegibilityView image](self->_arrowHead, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  v26 = v25;
  v69.origin.x = x;
  v69.origin.y = y;
  v59 = y;
  v60 = width;
  v69.size.width = width;
  recta = height;
  v69.size.height = height;
  CGRectDivide(v69, &slice, &remainder, v26, CGRectMinYEdge);

  -[_UILegibilityView setFrame:](self->_arrowHead, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v63.origin = origin;
  v63.size = v57;
  -[_UILegibilityView image](self->_arrowTail, "image");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "size");
  v29 = v28;
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  CGRectDivide(v70, &v63, &remainder, v29, CGRectMaxYEdge);

  -[_UILegibilityView setFrame:](self->_arrowTail, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
  -[_UILegibilityView shadowImageView](self->_arrowHead, "shadowImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[CALayer setFrame:](self->_maskContainerLayer, "setFrame:", v32, v34, v36, v38);
  v39 = v38 * 0.5 + slice.size.height * 0.5;
  -[_UILegibilityView image](self->_arrowTail, "image");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "size");
  v42 = (v36 - v41) * 0.5;
  v43 = v38 - v39;

  -[_UILegibilityView image](self->_arrowTail, "image");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "size");
  v46 = (v36 + v45) * 0.5;
  -[_UILegibilityView image](self->_arrowTail, "image");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "size");
  v49 = (v36 - v48) * 0.5;

  -[CALayer setFrame:](self->_maskTopLayer, "setFrame:", 0.0, 0.0, v36, v39);
  -[CALayer setFrame:](self->_maskLeftLayer, "setFrame:", 0.0, v39, v42, v43);
  -[CALayer setFrame:](self->_maskRightLayer, "setFrame:", v46, v39, v49, v43);
  -[SBUILegibilityLabel sizeThatFits:](self->_callToActionLabel, "sizeThatFits:", 165.0, 1.79769313e308);
  v51 = v50;
  v53 = v52;
  v71.origin.x = 0.0;
  v71.origin.y = 0.0;
  v71.size.width = v51;
  v71.size.height = v53;
  v54 = CGRectGetWidth(v71) * 0.5;
  v72.origin.x = x;
  v72.origin.y = v59;
  v72.size.width = v60;
  v72.size.height = recta;
  v55 = v54 + CGRectGetMaxY(v72) + 20.0;
  -[UIView setBounds:](self->_localRotationView, "setBounds:", 0.0, 0.0, v51, v53);
  -[UIView setCenter:](self->_localRotationView, "setCenter:", v62, v55);
  callToActionLabel = self->_callToActionLabel;
  -[UIView bounds](self->_localRotationView, "bounds");
  -[SBUILegibilityLabel setFrame:](callToActionLabel, "setFrame:");
  -[MTMaterialView setWeighting:](self->_arrowBackgroundView, "setWeighting:", 1.0);
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  id v6;

  p_legibilitySettings = &self->_legibilitySettings;
  v6 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[_UILegibilityView updateForChangedSettings:](self->_arrowHead, "updateForChangedSettings:", *p_legibilitySettings);
    -[_UILegibilityView updateForChangedSettings:](self->_arrowTail, "updateForChangedSettings:", *p_legibilitySettings);
    -[SBUILegibilityLabel setLegibilitySettings:](self->_callToActionLabel, "setLegibilitySettings:", *p_legibilitySettings);
    -[SBUIFaceIDCameraGlyphView _installMask](self, "_installMask");
  }

}

- (void)setLocalTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_localTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  UIView *localRotationView;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform t1;

  p_localTransform = &self->_localTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_localTransform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&self->_localTransform.a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&self->_localTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_localTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_localTransform->tx = v9;
    *(_OWORD *)&p_localTransform->a = v8;
    localRotationView = self->_localRotationView;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    -[UIView setTransform:](localRotationView, "setTransform:", &t1);
  }
}

- (void)_updateCallToActionLabelFont
{
  id v3;

  SBUICurrentPreferredFontForCoachingText();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setFont:](self->_callToActionLabel, "setFont:", v3);
  -[SBUIFaceIDCameraGlyphView setNeedsLayout](self, "setNeedsLayout");

}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (CGAffineTransform)localTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].c;
  return self;
}

- (UIView)arrowContainer
{
  return self->_arrowContainer;
}

- (void)setArrowContainer:(id)a3
{
  objc_storeStrong((id *)&self->_arrowContainer, a3);
}

- (SBUILegibilityLabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (void)setCallToActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_callToActionLabel, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (_UILegibilityView)arrowHead
{
  return self->_arrowHead;
}

- (void)setArrowHead:(id)a3
{
  objc_storeStrong((id *)&self->_arrowHead, a3);
}

- (_UILegibilityView)arrowTail
{
  return self->_arrowTail;
}

- (void)setArrowTail:(id)a3
{
  objc_storeStrong((id *)&self->_arrowTail, a3);
}

- (MTMaterialView)arrowBackgroundView
{
  return self->_arrowBackgroundView;
}

- (void)setArrowBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_arrowBackgroundView, a3);
}

- (CALayer)maskContainerLayer
{
  return self->_maskContainerLayer;
}

- (void)setMaskContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskContainerLayer, a3);
}

- (CALayer)maskTopLayer
{
  return self->_maskTopLayer;
}

- (void)setMaskTopLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskTopLayer, a3);
}

- (CALayer)maskLeftLayer
{
  return self->_maskLeftLayer;
}

- (void)setMaskLeftLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLeftLayer, a3);
}

- (CALayer)maskRightLayer
{
  return self->_maskRightLayer;
}

- (void)setMaskRightLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskRightLayer, a3);
}

- (UIView)localRotationView
{
  return self->_localRotationView;
}

- (void)setLocalRotationView:(id)a3
{
  objc_storeStrong((id *)&self->_localRotationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRotationView, 0);
  objc_storeStrong((id *)&self->_maskRightLayer, 0);
  objc_storeStrong((id *)&self->_maskLeftLayer, 0);
  objc_storeStrong((id *)&self->_maskTopLayer, 0);
  objc_storeStrong((id *)&self->_maskContainerLayer, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
  objc_storeStrong((id *)&self->_arrowTail, 0);
  objc_storeStrong((id *)&self->_arrowHead, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_arrowContainer, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
