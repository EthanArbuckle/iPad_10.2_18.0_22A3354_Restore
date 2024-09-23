@implementation SUIAShockwaveViewController

- (SUIAShockwaveViewController)initWithStyle:(id)a3 overlay:(id)a4
{
  id v7;
  id v8;
  SUIAShockwaveViewController *v9;
  SUIAShockwaveViewController *v10;
  void *v11;
  uint64_t v12;
  SUIAShockwavePrototypeSettings *prototypeSettings;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUIAShockwaveViewController;
  v9 = -[SUIAShockwaveViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_edgeLightOverlay, a4);
    +[SUIAnimationKitPrototypeSettingsDomain rootSettings](SUIAnimationKitPrototypeSettingsDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shockwaveSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    prototypeSettings = v10->_prototypeSettings;
    v10->_prototypeSettings = (SUIAShockwavePrototypeSettings *)v12;

  }
  return v10;
}

- (SUIAShockwaveViewController)initWithStyle:(id)a3
{
  return -[SUIAShockwaveViewController initWithStyle:overlay:](self, "initWithStyle:overlay:", a3, 0);
}

- (void)setState:(int64_t)a3
{
  -[SUIAShockwaveViewController setState:animated:recommendedNextAction:completion:](self, "setState:animated:recommendedNextAction:completion:", a3, 0, 0, 0);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 recommendedNextAction:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, int64_t);
  void (**v11)(id, uint64_t, _QWORD);
  BSAbsoluteMachTimer *transitionToNextStateTimer;
  double v13;
  double v14;
  BSAbsoluteMachTimer *v15;
  BSAbsoluteMachTimer *v16;
  BSAbsoluteMachTimer *v17;
  _QWORD v18[5];
  void (**v19)(id, int64_t);
  int64_t v20;

  v7 = a4;
  v10 = (void (**)(id, int64_t))a5;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  if (self->_state == a3)
  {
    if (a3 <= 2 && v10)
      v10[2](v10, a3 + 1);
    if (v11)
      v11[2](v11, 1, 0);
  }
  else
  {
    self->_state = a3;
    -[BSAbsoluteMachTimer cancel](self->_transitionToNextStateTimer, "cancel");
    -[BSAbsoluteMachTimer invalidate](self->_transitionToNextStateTimer, "invalidate");
    transitionToNextStateTimer = self->_transitionToNextStateTimer;
    self->_transitionToNextStateTimer = 0;

    -[SUIAShockwaveViewController _invalidateAndLayoutIfNeeded:completion:](self, "_invalidateAndLayoutIfNeeded:completion:", v7, v11);
    -[SUIAShockwaveStyle recommendedPresentationDurationForState:](self->_style, "recommendedPresentationDurationForState:", a3);
    if (a3 <= 2)
    {
      if (v10)
      {
        v14 = v13;
        if ((BSFloatEqualToFloat() & 1) == 0)
        {
          v15 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", CFSTR("SUIAShockwave-Transition-to-next-state"));
          v16 = self->_transitionToNextStateTimer;
          self->_transitionToNextStateTimer = v15;

          v17 = self->_transitionToNextStateTimer;
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __82__SUIAShockwaveViewController_setState_animated_recommendedNextAction_completion___block_invoke;
          v18[3] = &unk_251945138;
          v18[4] = self;
          v19 = v10;
          v20 = a3;
          -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v17, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v18, v14, 0.000001);

        }
      }
    }
  }

}

uint64_t __82__SUIAShockwaveViewController_setState_animated_recommendedNextAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1008);
  *(_QWORD *)(v2 + 1008) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUIAShockwaveViewController;
  -[SUIAShockwaveViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SUIAShockwaveViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SUIAShockwaveViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_251945160;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v4);
}

uint64_t __42__SUIAShockwaveViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupChromaticAberrationIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setupFillLightIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setupMeshIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_setupEdgeLightIfNecessary");
}

- (void)viewWillLayoutSubviews
{
  _SUIAShockwaveLayoutContext *nextLayoutContext;
  _SUIAShockwaveLayoutContext *v4;
  _SUIAShockwaveLayoutContext *v5;
  SUIAShockwaveStyle *style;
  void *v7;
  _SUIAShockwaveLayoutContext *v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  SUIAShockwaveViewController *v14;
  _SUIAShockwaveLayoutContext *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUIAShockwaveViewController;
  -[SUIAShockwaveViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  nextLayoutContext = self->_nextLayoutContext;
  if (nextLayoutContext)
  {
    v4 = nextLayoutContext;
    v5 = self->_nextLayoutContext;
    self->_nextLayoutContext = 0;

    ++self->_layoutGeneration;
    style = self->_style;
    -[SUIAShockwaveViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[SUIAShockwaveStyle setShockwaveBounds:](style, "setShockwaveBounds:");

    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke;
    v13 = &unk_2519451B0;
    v14 = self;
    v8 = v4;
    v15 = v8;
    v9 = (void (**)(_QWORD))_Block_copy(&v10);
    if (-[_SUIAShockwaveLayoutContext animated](v8, "animated", v10, v11, v12, v13, v14))
      v9[2](v9);
    else
      objc_msgSend(MEMORY[0x24BEBDB00], "_performWithoutRetargetingAnimations:", v9);

  }
}

void __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke_2;
  v4[3] = &unk_251945188;
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v4[4] = v2;
  objc_msgSend(v1, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUIAC2GroupCompletion perform:finalCompletion:options:delegate:](SUIAC2GroupCompletion, "perform:finalCompletion:options:delegate:", v4, v3, 0, 0);

}

void __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyRootViewConfigurationForState:completionGenerator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "usesChromaticAberation"))
    objc_msgSend(*(id *)(a1 + 32), "_applyChromaticAberrationForState:completionGenerator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "usesFillLight"))
    objc_msgSend(*(id *)(a1 + 32), "_applyFillLightForState:completionGenerator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "usesMeshTransform"))
    objc_msgSend(*(id *)(a1 + 32), "_applyMeshForState:completionGenerator:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976), v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "usesEdgeLight"))
    objc_msgSend(*(id *)(a1 + 32), "_applyEdgeLightOverlayForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));

}

- (void)_setupChromaticAberrationIfNecessary
{
  void *v3;
  SUIARadialGradientView *v4;
  SUIARadialGradientView *v5;
  SUIARadialGradientView *chromaticAberrationDonutMaskView;
  SUIARadialGradientView *v7;
  void *v8;
  SUIARadialGradientView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _SUIABackdropView *v27;
  _SUIABackdropView *chromaticAberrationEffectView;
  void *v29;
  _SUIABackdropView *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  float v59;
  void *v60;
  void *v61;
  SUIARadialGradientView *v62;
  SUIARadialGradientView *v63;
  SUIARadialGradientView *v64;
  SUIARadialGradientView *v65;
  void *v66;
  SUIARadialGradientView *v67;
  void *v68;
  SUIARadialGradientView *v69;
  void *v70;
  SUIARadialGradientView *v71;
  float v72;
  __int128 v73;
  int v74;
  float v75;
  __int128 v76;
  int v77;
  float v78;
  _BYTE v79[28];
  _QWORD v80[2];
  _QWORD v81[4];

  v81[2] = *MEMORY[0x24BDAC8D0];
  if (-[SUIAShockwaveStyle usesChromaticAberation](self->_style, "usesChromaticAberation"))
  {
    -[SUIAShockwaveStyle chromaticAberrationConfigurationForState:](self->_style, "chromaticAberrationConfigurationForState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUIAShockwavePrototypeSettings visualizeEffectMasks](self->_prototypeSettings, "visualizeEffectMasks"))
    {
      v4 = [SUIARadialGradientView alloc];
      objc_msgSend(v3, "donutMaskFrame");
      v5 = -[SUIARadialGradientView initWithFrame:](v4, "initWithFrame:");
      chromaticAberrationDonutMaskView = self->_chromaticAberrationDonutMaskView;
      self->_chromaticAberrationDonutMaskView = v5;

      v7 = self->_chromaticAberrationDonutMaskView;
      objc_msgSend(v3, "donutGradientLocations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setLocations:](v7, "setLocations:", v8);

      v9 = self->_chromaticAberrationDonutMaskView;
      objc_msgSend(v3, "donutGradientColors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setColors:](v9, "setColors:", v10);

      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59F0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorWithAlphaComponent:", 0.5);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v14, "CGColor"), CFSTR("inputColor"));

      -[SUIARadialGradientView layer](self->_chromaticAberrationDonutMaskView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v11;
      v80[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFilters:", v16);

      -[SUIAShockwaveViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_chromaticAberrationDonutMaskView);
    }
    else
    {
      -[SUIAShockwaveViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v27 = -[_SUIABackdropView initWithFrame:]([_SUIABackdropView alloc], "initWithFrame:", v20, v22, v24, v26);
      chromaticAberrationEffectView = self->_chromaticAberrationEffectView;
      self->_chromaticAberrationEffectView = v27;

      -[_SUIABackdropView setAutoresizingMask:](self->_chromaticAberrationEffectView, "setAutoresizingMask:", 18);
      -[_SUIABackdropView backdropLayer](self->_chromaticAberrationEffectView, "backdropLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setGroupName:", CFSTR("spherochromatism"));
      objc_msgSend(v11, "setScale:", 0.25);
      objc_msgSend(v11, "setAllowsGroupBlending:", 0);
      UIRectInset();
      objc_msgSend(v11, "setBackdropRect:");
      -[SUIAShockwaveViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addSubview:", self->_chromaticAberrationEffectView);

      v30 = self->_chromaticAberrationEffectView;
      -[SUIAShockwaveViewController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bounds");
      -[_SUIABackdropView setFrame:](v30, "setFrame:");

      objc_msgSend(v3, "aberrationEDRGain");
      v33 = v32;
      if ((BSFloatIsZero() & 1) == 0)
      {
        -[_SUIABackdropView layer](self->_chromaticAberrationEffectView, "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v35 = v33;
        objc_msgSend(v34, "setGain:", v35);

      }
      v36 = *MEMORY[0x24BDE59B0];
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59B0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setName:", v36);
      objc_msgSend(v3, "aberrationMagnitude");
      v38 = v37;
      v40 = v39;
      objc_msgSend(MEMORY[0x24BDD1968], "bs_valueWithCGPoint:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKey:", v41, *MEMORY[0x24BDE5AC0]);

      objc_msgSend(MEMORY[0x24BDD1968], "bs_valueWithCGPoint:", *MEMORY[0x24BDBEFB0] - v38, *(double *)(MEMORY[0x24BDBEFB0] + 8) - v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKey:", v42, *MEMORY[0x24BDE5B20]);

      v43 = *MEMORY[0x24BDE5A78];
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setName:", v43);
      v44 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v3, "aberrationBlurRadius");
      objc_msgSend(v44, "numberWithDouble:");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v45, *MEMORY[0x24BDE5B18]);

      objc_msgSend(v17, "setValue:forKey:", CFSTR("low"), *MEMORY[0x24BDE5B10]);
      v81[0] = v12;
      v81[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v46, "mutableCopy");

      objc_msgSend(v3, "aberrationColorSaturateAmount");
      v49 = v48;
      if ((BSFloatIsZero() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A10]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setValue:forKey:", v51, *MEMORY[0x24BDE5AA8]);

        objc_msgSend(v47, "addObject:", v50);
      }
      objc_msgSend(v3, "aberrationColorBrightnessFactor");
      v53 = v52;
      if ((BSFloatIsZero() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59D0]);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setValue:forKey:", v55, *MEMORY[0x24BDE5AA8]);

        objc_msgSend(v47, "addObject:", v54);
      }
      objc_msgSend(v3, "aberrationMultiplyFactor");
      v57 = v56;
      if ((BSFloatIsZero() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v57;
        v72 = v59;
        v73 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 4);
        v74 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 20);
        v75 = v59;
        v76 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 28);
        v77 = *(_DWORD *)(MEMORY[0x24BDE53E8] + 44);
        v78 = v59;
        *(_OWORD *)v79 = *(_OWORD *)(MEMORY[0x24BDE53E8] + 52);
        *(_OWORD *)&v79[12] = *(_OWORD *)(MEMORY[0x24BDE53E8] + 64);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", &v72);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setValue:forKey:", v60, *MEMORY[0x24BDE5AD8]);

        objc_msgSend(v47, "addObject:", v58);
      }
      -[_SUIABackdropView layer](self->_chromaticAberrationEffectView, "layer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setFilters:", v47);

      v62 = [SUIARadialGradientView alloc];
      objc_msgSend(v3, "donutMaskFrame");
      v63 = -[SUIARadialGradientView initWithFrame:](v62, "initWithFrame:");
      v64 = self->_chromaticAberrationDonutMaskView;
      self->_chromaticAberrationDonutMaskView = v63;

      v65 = self->_chromaticAberrationDonutMaskView;
      objc_msgSend(v3, "donutGradientLocations");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setLocations:](v65, "setLocations:", v66);

      v67 = self->_chromaticAberrationDonutMaskView;
      objc_msgSend(v3, "donutGradientColors");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setColors:](v67, "setColors:", v68);

      -[_SUIABackdropView setMaskView:](self->_chromaticAberrationEffectView, "setMaskView:", self->_chromaticAberrationDonutMaskView);
      v69 = self->_chromaticAberrationDonutMaskView;
      objc_msgSend(v3, "donutGradientLocations");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setLocations:](v69, "setLocations:", v70);

      v71 = self->_chromaticAberrationDonutMaskView;
      objc_msgSend(v3, "aberrationIntensity");
      -[SUIARadialGradientView setAlpha:](v71, "setAlpha:");

    }
  }
}

- (void)_setupMeshIfNecessary
{
  void *v3;
  _SUIABackdropView *v4;
  _SUIABackdropView *v5;
  _SUIABackdropView *meshedBackdrop;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SUIABackdropView *v13;
  void *v14;
  _OWORD v15[8];

  if (-[SUIAShockwaveStyle usesMeshTransform](self->_style, "usesMeshTransform"))
  {
    -[SUIAShockwaveStyle meshConfigurationForState:](self->_style, "meshConfigurationForState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [_SUIABackdropView alloc];
    objc_msgSend(v3, "meshFrame");
    v5 = -[_SUIABackdropView initWithFrame:](v4, "initWithFrame:");
    meshedBackdrop = self->_meshedBackdrop;
    self->_meshedBackdrop = v5;

    -[_SUIABackdropView layer](self->_meshedBackdrop, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "meshTransform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMeshTransform:", v8);

    -[_SUIABackdropView layer](self->_meshedBackdrop, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIAShockwaveViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayScale");
    objc_msgSend(v9, "setRasterizationScale:");

    -[_SUIABackdropView layer](self->_meshedBackdrop, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWantsExtendedDynamicRangeContent:", 1);

    v13 = self->_meshedBackdrop;
    if (v3)
      objc_msgSend(v3, "viewTransform");
    else
      memset(v15, 0, sizeof(v15));
    -[_SUIABackdropView setTransform3D:](v13, "setTransform3D:", v15);
    -[SUIAShockwaveViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_meshedBackdrop);

  }
}

- (void)_setupFillLightIfNecessary
{
  void *v3;
  SUIARadialGradientView *v4;
  SUIARadialGradientView *v5;
  SUIARadialGradientView *fillLightCircleMaskView;
  SUIARadialGradientView *v7;
  void *v8;
  SUIARadialGradientView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  SUIARadialGradientView *v27;
  SUIARadialGradientView *v28;
  SUIARadialGradientView *v29;
  uint64_t v30;
  UIView *v31;
  UIView *v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  SUIAShockwaveIntelligenceSystemLightView *v40;
  UIView *fillLightView;
  void *v42;
  SUIARadialGradientView *v43;
  void *v44;
  SUIARadialGradientView *v45;
  void *v46;
  char isKindOfClass;
  UIView *v48;
  SUIARadialGradientView *v49;
  id v50;
  void *v51;
  UIImageView *v52;
  UIImageView *fillSideLightMaskView;
  UIImageView *v54;
  void *v55;
  void *v56;
  char v57;
  UIView *v58;
  UIImageView *v59;
  UIView *v60;
  double v61;
  double v62;
  char IsZero;
  _QWORD *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[2];
  _QWORD v84[2];

  v84[1] = *MEMORY[0x24BDAC8D0];
  if (-[SUIAShockwaveStyle usesFillLight](self->_style, "usesFillLight"))
  {
    -[SUIAShockwaveStyle fillLightConfigurationForState:](self->_style, "fillLightConfigurationForState:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUIAShockwavePrototypeSettings visualizeEffectMasks](self->_prototypeSettings, "visualizeEffectMasks"))
    {
      v4 = [SUIARadialGradientView alloc];
      objc_msgSend(v3, "circleMaskFrame");
      v5 = -[SUIARadialGradientView initWithFrame:](v4, "initWithFrame:");
      fillLightCircleMaskView = self->_fillLightCircleMaskView;
      self->_fillLightCircleMaskView = v5;

      v7 = self->_fillLightCircleMaskView;
      objc_msgSend(v3, "circleGradientLocations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setLocations:](v7, "setLocations:", v8);

      v9 = self->_fillLightCircleMaskView;
      objc_msgSend(v3, "circleGradientColors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setColors:](v9, "setColors:", v10);

      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59F0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorWithAlphaComponent:", 0.5);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v14, "CGColor"), CFSTR("inputColor"));

      -[SUIARadialGradientView layer](self->_fillLightCircleMaskView, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = v11;
      v83[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFilters:", v16);

      -[SUIAShockwaveViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_fillLightCircleMaskView);

LABEL_26:
      return;
    }
    -[SUIAShockwaveViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27 = [SUIARadialGradientView alloc];
    objc_msgSend(v3, "circleMaskFrame");
    v28 = -[SUIARadialGradientView initWithFrame:](v27, "initWithFrame:");
    v29 = self->_fillLightCircleMaskView;
    self->_fillLightCircleMaskView = v28;

    v30 = objc_msgSend(v3, "lightType");
    if (v30 == 1)
    {
      v40 = -[SUIAShockwaveIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:]([SUIAShockwaveIntelligenceSystemLightView alloc], "initWithFrame:preferringAudioReactivity:", 0, v20, v22, v24, v26);
      fillLightView = self->_fillLightView;
      self->_fillLightView = &v40->super.super.super;

      -[SUIARadialGradientView layer](self->_fillLightCircleMaskView, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A40]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setCompositingFilter:", v38);
    }
    else
    {
      if (v30 != 2
        || (v31 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v20, v22, v24, v26),
            v32 = self->_fillLightView,
            self->_fillLightView = v31,
            v32,
            objc_msgSend(v3, "whiteValue"),
            v34 = v33,
            v33 == 1.0))
      {
LABEL_10:
        -[UIView setAutoresizingMask:](self->_fillLightView, "setAutoresizingMask:", 18);
        -[SUIAShockwaveViewController view](self, "view");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addSubview:", self->_fillLightView);

        v43 = self->_fillLightCircleMaskView;
        objc_msgSend(v3, "circleGradientLocations");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUIARadialGradientView setLocations:](v43, "setLocations:", v44);

        v45 = self->_fillLightCircleMaskView;
        objc_msgSend(v3, "circleGradientColors");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUIARadialGradientView setColors:](v45, "setColors:", v46);

        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v48 = self->_fillLightView;
        v49 = self->_fillLightCircleMaskView;
        if ((isKindOfClass & 1) != 0)
          -[UIView setCircleMaskView:](v48, "setCircleMaskView:", v49);
        else
          -[UIView addSubview:](v48, "addSubview:", v49);
        v50 = objc_alloc(MEMORY[0x24BEBD668]);
        objc_msgSend(v3, "sideLightMaskImage");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (UIImageView *)objc_msgSend(v50, "initWithImage:", v51);
        fillSideLightMaskView = self->_fillSideLightMaskView;
        self->_fillSideLightMaskView = v52;

        v54 = self->_fillSideLightMaskView;
        if (v3)
        {
          objc_msgSend(v3, "sideLightMaskTransform");
        }
        else
        {
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
        }
        -[UIImageView setTransform3D:](v54, "setTransform3D:", &v75);
        -[UIImageView setFrame:](self->_fillSideLightMaskView, "setFrame:", v20, v22, v24, v26);
        -[UIImageView setAutoresizingMask:](self->_fillSideLightMaskView, "setAutoresizingMask:", 18);
        -[UIImageView layer](self->_fillSideLightMaskView, "layer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A48]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setCompositingFilter:", v56);

        objc_opt_class();
        v57 = objc_opt_isKindOfClass();
        v58 = self->_fillLightView;
        v59 = self->_fillSideLightMaskView;
        if ((v57 & 1) != 0)
          -[UIView setSideLightMaskView:](v58, "setSideLightMaskView:", v59);
        else
          -[UIView addSubview:](v58, "addSubview:", v59);
        v60 = self->_fillLightView;
        objc_msgSend(v3, "lightIntensity", v75, v76, v77, v78, v79, v80, v81, v82);
        -[UIView setAlpha:](v60, "setAlpha:");
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lightColorBrightnessAmount");
        v62 = v61;
        IsZero = BSFloatIsZero();
        v64 = (_QWORD *)MEMORY[0x24BDE5AA8];
        if ((IsZero & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59D0]);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v62);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setValue:forKey:", v66, *v64);

          objc_msgSend(v11, "addObject:", v65);
        }
        objc_msgSend(v3, "lightColorSaturateAmount");
        v68 = v67;
        if ((BSFloatIsOne() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A10]);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v68);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setValue:forKey:", v70, *v64);

          objc_msgSend(v11, "addObject:", v69);
        }
        objc_msgSend(v3, "lightColorContrastAmount");
        v72 = v71;
        if ((BSFloatIsOne() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59E0]);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v72);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setValue:forKey:", v74, *v64);

          objc_msgSend(v11, "addObject:", v73);
        }
        -[UIView layer](self->_fillLightView, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFilters:", v11);
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v34, 1.0);
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v37 = objc_msgSend(v36, "CGColor");
      objc_msgSend(v35, "setValue:forKey:", v37, *MEMORY[0x24BDE5AD0]);

      -[SUIARadialGradientView layer](self->_fillLightCircleMaskView, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFilters:", v39);

    }
    goto LABEL_10;
  }
}

- (void)_setupEdgeLightIfNecessary
{
  SUIARadialGradientView *v3;
  SUIARadialGradientView *v4;
  SUIARadialGradientView *edgeLightDebugMaskView;
  SUIARadialGradientView *v6;
  void *v7;
  SUIARadialGradientView *v8;
  void *v9;
  SUIARadialGradientView *v10;
  void *v11;
  id v12;

  if (-[SUIAShockwaveStyle usesEdgeLight](self->_style, "usesEdgeLight"))
  {
    -[SUIAShockwaveStyle edgeLightOverlayConfigurationForState:](self->_style, "edgeLightOverlayConfigurationForState:", 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[SUIAShockwaveEdgeLightOverlay applyConfiguration:forState:](self->_edgeLightOverlay, "applyConfiguration:forState:");
    if (-[SUIAShockwavePrototypeSettings visualizeEffectMasks](self->_prototypeSettings, "visualizeEffectMasks"))
    {
      v3 = [SUIARadialGradientView alloc];
      objc_msgSend(v12, "edgeLightMaskFrame");
      v4 = -[SUIARadialGradientView initWithFrame:](v3, "initWithFrame:");
      edgeLightDebugMaskView = self->_edgeLightDebugMaskView;
      self->_edgeLightDebugMaskView = v4;

      v6 = self->_edgeLightDebugMaskView;
      objc_msgSend(v12, "edgeLightMaskGradientLocations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setLocations:](v6, "setLocations:", v7);

      v8 = self->_edgeLightDebugMaskView;
      objc_msgSend(v12, "edgeLightMaskGradientColors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIARadialGradientView setColors:](v8, "setColors:", v9);

      v10 = self->_edgeLightDebugMaskView;
      objc_msgSend(v12, "edgeLightIntensity");
      -[SUIARadialGradientView setAlpha:](v10, "setAlpha:");
      -[SUIAShockwaveViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_edgeLightDebugMaskView);

    }
  }
}

- (void)_invalidateAndLayoutIfNeeded:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  _SUIAShockwaveLayoutContext *v6;
  _SUIAShockwaveLayoutContext *nextLayoutContext;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (self->_nextLayoutContext)
  {
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v6 = objc_alloc_init(_SUIAShockwaveLayoutContext);
    nextLayoutContext = self->_nextLayoutContext;
    self->_nextLayoutContext = v6;

    -[_SUIAShockwaveLayoutContext setAnimated:](self->_nextLayoutContext, "setAnimated:", v4);
    -[_SUIAShockwaveLayoutContext setCompletion:](self->_nextLayoutContext, "setCompletion:", v10);
  }
  -[SUIAShockwaveViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  -[SUIAShockwaveViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

}

- (void)_applyRootViewConfigurationForState:(int64_t)a3 completionGenerator:(id)a4
{
  SUIAShockwaveStyle *style;
  id v7;
  void *v8;
  id v9;

  style = self->_style;
  v7 = a4;
  -[SUIAShockwaveStyle rootViewConfigurationForState:](style, "rootViewConfigurationForState:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v9, CFSTR("hidden"), v8, CFSTR("hidden"), a3, v7);

}

- (void)_applyChromaticAberrationForState:(int64_t)a3 completionGenerator:(id)a4
{
  SUIAShockwaveStyle *style;
  id v7;
  id v8;

  style = self->_style;
  v7 = a4;
  -[SUIAShockwaveStyle chromaticAberrationConfigurationForState:](style, "chromaticAberrationConfigurationForState:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:state:subcompletionGenerator:", v8, CFSTR("aberrationMagnitude"), self->_chromaticAberrationEffectView, CFSTR("layer.filters.chromaticAberration.inputRedOffset"), &__block_literal_global, a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("aberrationMagnitude"), self->_chromaticAberrationEffectView, CFSTR("layer.filters.chromaticAberration.inputBlueOffset"), a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("aberrationBlurRadius"), self->_chromaticAberrationEffectView, CFSTR("layer.filters.gaussianBlur.inputRadius"), a3, v7);
  -[SUIAShockwaveViewController _applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("donutMaskFrame"), self->_chromaticAberrationDonutMaskView, CFSTR("frame"), a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("donutGradientLocations"), self->_chromaticAberrationDonutMaskView, CFSTR("locations"), a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("donutGradientColors"), self->_chromaticAberrationDonutMaskView, CFSTR("colors"), a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("aberrationIntensity"), self->_chromaticAberrationDonutMaskView, CFSTR("alpha"), a3, v7);

}

uint64_t __85__SUIAShockwaveViewController__applyChromaticAberrationForState_completionGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "valueForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_CGPointValue");

  return BSValueWithPoint();
}

- (void)_applyFillLightForState:(int64_t)a3 completionGenerator:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  UIImageView *fillSideLightMaskView;
  void *v10;
  id v11;

  v11 = a4;
  -[SUIAShockwaveStyle fillLightConfigurationForState:](self->_style, "fillLightConfigurationForState:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v6, CFSTR("lightIntensity"), self->_fillLightView, CFSTR("alpha"), a3, v11);
  -[UIImageView image](self->_fillSideLightMaskView, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sideLightMaskImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    fillSideLightMaskView = self->_fillSideLightMaskView;
    objc_msgSend(v6, "sideLightMaskImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](fillSideLightMaskView, "setImage:", v10);

  }
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v6, CFSTR("sideLightMaskTransform"), self->_fillSideLightMaskView, CFSTR("transform3D"), a3, v11);
  -[SUIAShockwaveViewController _applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v6, CFSTR("circleMaskFrame"), self->_fillLightCircleMaskView, CFSTR("frame"), a3, v11);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v6, CFSTR("circleGradientLocations"), self->_fillLightCircleMaskView, CFSTR("locations"), a3, v11);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v6, CFSTR("circleGradientColors"), self->_fillLightCircleMaskView, CFSTR("colors"), a3, v11);

}

- (void)_applyMeshForState:(int64_t)a3 completionGenerator:(id)a4
{
  SUIAShockwaveStyle *style;
  id v7;
  id v8;

  style = self->_style;
  v7 = a4;
  -[SUIAShockwaveStyle meshConfigurationForState:](style, "meshConfigurationForState:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveViewController _applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("meshFrame"), self->_meshedBackdrop, CFSTR("frame"), a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("meshTransform"), self->_meshedBackdrop, CFSTR("layer.meshTransform"), a3, v7);
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v8, CFSTR("viewTransform"), self->_meshedBackdrop, CFSTR("transform3D"), a3, v7);

}

- (void)_applyEdgeLightOverlayForState:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];
  id v7;
  int64_t v8;

  -[SUIAShockwaveStyle edgeLightOverlayConfigurationForState:](self->_style, "edgeLightOverlayConfigurationForState:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveEdgeLightOverlay applyConfiguration:forState:](self->_edgeLightOverlay, "applyConfiguration:forState:", v5, a3);
  if (-[SUIAShockwavePrototypeSettings visualizeEffectMasks](self->_prototypeSettings, "visualizeEffectMasks"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__SUIAShockwaveViewController__applyEdgeLightOverlayForState___block_invoke;
    v6[3] = &unk_251945218;
    v6[4] = self;
    v7 = v5;
    v8 = a3;
    +[SUIAC2GroupCompletion perform:finalCompletion:](SUIAC2GroupCompletion, "perform:finalCompletion:", v6, 0);

  }
}

void __62__SUIAShockwaveViewController__applyEdgeLightOverlayForState___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3[137];
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v3, "_applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", v4, CFSTR("edgeLightMaskFrame"), v5, CFSTR("frame"), v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", *(_QWORD *)(a1 + 40), CFSTR("edgeLightMaskGradientLocations"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096), CFSTR("locations"), *(_QWORD *)(a1 + 48), v7);
  objc_msgSend(*(id *)(a1 + 32), "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", *(_QWORD *)(a1 + 40), CFSTR("edgeLightMaskGradientColors"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096), CFSTR("colors"), *(_QWORD *)(a1 + 48), v7);
  objc_msgSend(*(id *)(a1 + 32), "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:state:subcompletionGenerator:", *(_QWORD *)(a1 + 40), CFSTR("edgeLightIntensity"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096), CFSTR("alpha"), *(_QWORD *)(a1 + 48), v7);

}

+ (id)_propertyKeyPathToAnimatableKeyPathMap
{
  if (_propertyKeyPathToAnimatableKeyPathMap_sOnceToken[0] != -1)
    dispatch_once(_propertyKeyPathToAnimatableKeyPathMap_sOnceToken, &__block_literal_global_102);
  return (id)_propertyKeyPathToAnimatableKeyPathMap_sPropertyKeyPathToAnimatableKeyPathMap;
}

void __69__SUIAShockwaveViewController__propertyKeyPathToAnimatableKeyPathMap__block_invoke()
{
  void *v0;

  v0 = (void *)_propertyKeyPathToAnimatableKeyPathMap_sPropertyKeyPathToAnimatableKeyPathMap;
  _propertyKeyPathToAnimatableKeyPathMap_sPropertyKeyPathToAnimatableKeyPathMap = (uint64_t)&unk_25194B788;

}

- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 state:(int64_t)a8 subcompletionGenerator:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v24[0] = a6;
  v16 = (void *)MEMORY[0x24BDBCE30];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v16, "arrayWithObjects:count:", v24, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:valueApplyBlock:animatableKeyPaths:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:valueApplyBlock:animatableKeyPaths:state:subcompletionGenerator:", v22, v21, v20, v19, v18, &__block_literal_global_113, v23, a8, v17);

}

uint64_t __137__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_state_subcompletionGenerator___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "setValue:forKeyPath:", a4, a3);
}

- (void)_applyFrameConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 state:(int64_t)a8 subcompletionGenerator:(id)a9
{
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:valueApplyBlock:animatableKeyPaths:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:valueApplyBlock:animatableKeyPaths:state:subcompletionGenerator:", a3, a4, a5, a6, a7, &__block_literal_global_114, &unk_25194B7B0, a8, a9);
}

void __142__SUIAShockwaveViewController__applyFrameConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_state_subcompletionGenerator___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;

  v5 = a2;
  objc_msgSend(a4, "CGRectValue");
  objc_msgSend(v5, "suia_setBoundsAndPositionFromFrame:");

}

- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 valueApplyBlock:(id)a8 animatableKeyPaths:(id)a9 state:(int64_t)a10 subcompletionGenerator:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  unint64_t layoutGeneration;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void (**v38)(_QWORD);
  dispatch_time_t v39;
  id v40;
  id v41;
  _QWORD aBlock[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  unint64_t v52;

  v16 = a3;
  v17 = a4;
  v41 = a5;
  v18 = a6;
  v40 = a7;
  v19 = a8;
  v20 = a9;
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = a11;
  v23 = objc_msgSend((id)objc_opt_class(), "configurationType");
  SUIAStringFromShockwaveConfigurationType(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("(%@)-%@"), v24, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a11 + 2))(v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "delayForApplicationOfKeypath:", v17);
  v28 = v27;
  layoutGeneration = self->_layoutGeneration;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke;
  aBlock[3] = &unk_251945308;
  aBlock[4] = self;
  v44 = v16;
  v45 = v17;
  v46 = v41;
  v49 = v40;
  v50 = v19;
  v47 = v20;
  v48 = v18;
  v51 = v26;
  v52 = layoutGeneration;
  v30 = v26;
  v31 = v18;
  v32 = v19;
  v33 = v20;
  v34 = v41;
  v35 = v17;
  v36 = v16;
  v37 = v40;
  v38 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (BSFloatIsZero())
  {
    v38[2](v38);
  }
  else
  {
    v39 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
    dispatch_after(v39, MEMORY[0x24BDAC9B8], v38);
  }

}

void __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 104) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000))
  {
    v2 = *(_QWORD *)(a1 + 80);
    if (v2)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "behaviorSettingsForKeypath:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = 3;
    else
      v7 = 2;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v4;
        objc_msgSend((id)objc_opt_class(), "_propertyKeyPathToAnimatableKeyPathMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v9 = *(id *)(a1 + 64);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKey:", v14);
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)v15;
              if (v15)
                v17 = (void *)v15;
              else
                v17 = v14;
              v18 = v17;

              objc_msgSend(*(id *)(a1 + 56), "suia_replaceInProcessAnimationForKeyPath:settings:mode:", v18, v6, v7);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v11);
        }

        v4 = v22;
      }
    }
    v19 = (void *)MEMORY[0x24BEBDB00];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke_2;
    v23[3] = &unk_2519452E0;
    v27 = *(id *)(a1 + 88);
    v24 = *(id *)(a1 + 56);
    v25 = *(id *)(a1 + 72);
    v26 = v4;
    v20 = *(_QWORD *)(a1 + 96);
    v21 = v4;
    objc_msgSend(v19, "suia_animateWithSettings:mode:animations:completion:", v6, v7, v23, v20);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 96);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }
}

uint64_t __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 state:(int64_t)a7 subcompletionGenerator:(id)a8
{
  -[SUIAShockwaveViewController _applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:state:subcompletionGenerator:](self, "_applyConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:state:subcompletionGenerator:", a3, a4, a5, a6, 0, a7, a8);
}

- (void)_applyFrameConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 state:(int64_t)a7 subcompletionGenerator:(id)a8
{
  -[SUIAShockwaveViewController _applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:state:subcompletionGenerator:](self, "_applyFrameConfig:configPropertyKey:object:objectPropertyKeyPath:transformerBlock:state:subcompletionGenerator:", a3, a4, a5, a6, 0, a7, a8);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeLightDebugMaskView, 0);
  objc_storeStrong((id *)&self->_edgeLightOverlay, 0);
  objc_storeStrong((id *)&self->_meshedBackdrop, 0);
  objc_storeStrong((id *)&self->_fillLightCircleMaskView, 0);
  objc_storeStrong((id *)&self->_fillSideLightMaskView, 0);
  objc_storeStrong((id *)&self->_fillLightFullscreenMaskView, 0);
  objc_storeStrong((id *)&self->_fillLightOverallMaskView, 0);
  objc_storeStrong((id *)&self->_fillLightView, 0);
  objc_storeStrong((id *)&self->_chromaticAberrationDonutMaskView, 0);
  objc_storeStrong((id *)&self->_chromaticAberrationEffectView, 0);
  objc_storeStrong(&self->_pendingTransitionToEndCompletionBlock, 0);
  objc_storeStrong((id *)&self->_transitionToNextStateTimer, 0);
  objc_storeStrong((id *)&self->_nextLayoutContext, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
