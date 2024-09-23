@implementation SFMagicHeadWheelView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFMagicHeadWheelView)initWithNumberOfDots:(unint64_t)a3 dotsRadius:(double)a4 isMagicHead:(BOOL)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  SFMagicHeadWheelView *v12;
  SFMagicHeadWheelView *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SFMagicHeadPlaceholderView *v25;
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
  _OWORD v48[5];
  uint64_t v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)SFMagicHeadWheelView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[SFMagicHeadWheelView initWithFrame:](&v53, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    -[SFMagicHeadWheelView loadSettings](v12, "loadSettings");
    v13->_magicHead = a5;
    v14 = (void *)objc_opt_new();
    -[SFMagicHeadWheelView setIdentifierToSelectionMarkerView:](v13, "setIdentifierToSelectionMarkerView:", v14);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView setBackgroundColor:](v13, "setBackgroundColor:", v15);

    if (-[SFMagicHeadWheelView guidanceStatesEnabled](v13, "guidanceStatesEnabled"))
    {
      -[SFMagicHeadWheelView layer](v13, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v48[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v48[3] = v17;
      v48[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v18 = *(_QWORD *)(MEMORY[0x24BDE5598] + 80);
      v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v48[0] = *MEMORY[0x24BDE5598];
      v48[1] = v19;
      v49 = v18;
      v50 = 0xBF40624DD2F1A9FCLL;
      v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v51 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v52 = v20;
      objc_msgSend(v16, "setSublayerTransform:", v48);

    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v8, v9, v10, v11);
    -[SFMagicHeadWheelView setContentView:](v13, "setContentView:", v21);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView contentView](v13, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v22);

    -[SFMagicHeadWheelView contentView](v13, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView addSubview:](v13, "addSubview:", v24);

    if (!-[SFMagicHeadWheelView isMagicHead](v13, "isMagicHead"))
    {
      v25 = -[SFMagicHeadPlaceholderView initWithFrame:]([SFMagicHeadPlaceholderView alloc], "initWithFrame:", v8, v9, v10, v11);
      -[SFMagicHeadWheelView setPlaceHolderView:](v13, "setPlaceHolderView:", v25);

      -[SFMagicHeadWheelView contentView](v13, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView placeHolderView](v13, "placeHolderView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v27);

    }
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v28, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v29);
    -[SFMagicHeadWheelView setDotsContainer:](v13, "setDotsContainer:", v30);

    -[SFMagicHeadWheelView contentView](v13, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView dotsContainer](v13, "dotsContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v32);

    v33 = (void *)objc_opt_new();
    -[SFMagicHeadWheelView setDots:](v13, "setDots:", v33);

    -[SFMagicHeadWheelView setNumberOfDots:](v13, "setNumberOfDots:", a3);
    -[SFMagicHeadWheelView setDotsRadius:](v13, "setDotsRadius:", a4);
    for (; a3; --a3)
    {
      v34 = (void *)objc_opt_new();
      objc_msgSend(v34, "setBounds:", 0.0, 0.0, a4 + a4, a4 + a4);
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setCornerRadius:", a4);

      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setBackgroundColor:", v36);

      objc_msgSend(v34, "setUserInteractionEnabled:", 0);
      objc_msgSend(v34, "setAlpha:", 0.0);
      -[SFMagicHeadWheelView dots](v13, "dots");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v34);

      -[SFMagicHeadWheelView dotsContainer](v13, "dotsContainer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addSubview:", v34);

    }
    if (!-[SFMagicHeadWheelView isMagicHead](v13, "isMagicHead"))
    {
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD510]), "initWithFrame:", v8, v9, v10, v11);
      -[SFMagicHeadWheelView setSelectedHeadControl:](v13, "setSelectedHeadControl:", v40);

      -[SFMagicHeadWheelView selectedHeadControl](v13, "selectedHeadControl");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addTarget:action:forControlEvents:", v13, sel_selectedHeadTapped, 64);

      -[SFMagicHeadWheelView selectedHeadControl](v13, "selectedHeadControl");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addTarget:action:forControlEvents:", v13, sel_selectedHeadHighlighted, 1);

      -[SFMagicHeadWheelView selectedHeadControl](v13, "selectedHeadControl");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addTarget:action:forControlEvents:", v13, sel_selectedHeadHightlightCancel, 256);

      -[SFMagicHeadWheelView selectedHeadControl](v13, "selectedHeadControl");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addTarget:action:forControlEvents:", v13, sel_selectedHeadHightlightCancel, 128);

      -[SFMagicHeadWheelView contentView](v13, "contentView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView selectedHeadControl](v13, "selectedHeadControl");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addSubview:", v46);

    }
    -[SFMagicHeadWheelView setRotatedAfterSelectionWasMade:](v13, "setRotatedAfterSelectionWasMade:", 1);
    -[SFMagicHeadWheelView setNoUWBCapableDevices:](v13, "setNoUWBCapableDevices:", 1);
    v13->_guidanceState = -1;
    -[SFMagicHeadWheelView transitionToGuidanceState:](v13, "transitionToGuidanceState:", 0);
    -[SFMagicHeadWheelView transitionToRotationState:bypassSampling:](v13, "transitionToRotationState:bypassSampling:", -[SFMagicHeadWheelView isMagicHead](v13, "isMagicHead") ^ 1, 1);
    -[SFMagicHeadWheelView updateVisibilityOfComponents](v13, "updateVisibilityOfComponents");

  }
  return v13;
}

- (void)loadSettings
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE901B8], "rootSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "magicHeadSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView setSettings:](self, "setSettings:", v3);

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[SFMagicHeadWheelView invalidated](self, "invalidated"))
  {
    -[SFMagicHeadWheelView setInvalidated:](self, "setInvalidated:", 1);
    -[SFMagicHeadWheelView stopSuppressGuidanceHapticsTimer](self, "stopSuppressGuidanceHapticsTimer");
    -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    -[SFMagicHeadWheelView pitchSpringProperty](self, "pitchSpringProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SFMagicHeadWheelView rollSpringProperty](self, "rollSpringProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[SFMagicHeadWheelView setSelectionAnimator:](self, "setSelectionAnimator:", 0);
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
    {
      -[SFMagicHeadWheelView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      self->_guidanceState = 0;
      self->_rotationState = 0;
    }
  }
}

- (void)setNoUWBCapableDevices:(BOOL)a3
{
  if (self->_noUWBCapableDevices != a3)
  {
    self->_noUWBCapableDevices = a3;
    -[SFMagicHeadWheelView updatePlaceHolderView](self, "updatePlaceHolderView");
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SFMagicHeadWheelView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadWheelView;
  -[SFMagicHeadWheelView dealloc](&v3, sel_dealloc);
}

- (void)createSprings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  __37__SFMagicHeadWheelView_createSprings__block_invoke();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView setRotationSpringProperty:](self, "setRotationSpringProperty:", v3);

  __37__SFMagicHeadWheelView_createSprings__block_invoke();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView setPitchSpringProperty:](self, "setPitchSpringProperty:", v4);

  __37__SFMagicHeadWheelView_createSprings__block_invoke();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView setRollSpringProperty:](self, "setRollSpringProperty:", v5);

  location = 0;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BEBDB00];
  -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  -[SFMagicHeadWheelView pitchSpringProperty](self, "pitchSpringProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  -[SFMagicHeadWheelView rollSpringProperty](self, "rollSpringProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__SFMagicHeadWheelView_createSprings__block_invoke_2;
  v11[3] = &unk_24CE0ECE8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __37__SFMagicHeadWheelView_createSprings__block_invoke()
{
  void *v0;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setDampingRatio:response:", 1.0, 0.55);
  objc_msgSend(v0, "setTrackingDampingRatio:response:", 0.86, 0.125);
  objc_msgSend(v0, "setTracking:", 1);
  return v0;
}

void __37__SFMagicHeadWheelView_createSprings__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

+ (double)rotationWithShortestDistanceFromDegrees:(double)a3 toDegrees:(double)a4
{
  float v5;

  v5 = a4 - a3 + 180.0;
  return fmodf(v5, 360.0) + a3 + -180.0;
}

- (void)deviceRotatedToDegrees:(double)a3 withPitch:(double)a4 andRoll:(double)a5
{
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  -[SFMagicHeadWheelView pitchSpringProperty](self, "pitchSpringProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[SFMagicHeadWheelView createSprings](self, "createSprings");
  v9 = a4;
  v10 = v9 * 57.2957795;
  v11 = v10;
  -[SFMagicHeadWheelView pitchSpringProperty](self, "pitchSpringProperty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInput:", v11);

  v13 = a5;
  v14 = v13 * 57.2957795;
  v15 = v14;
  -[SFMagicHeadWheelView rollSpringProperty](self, "rollSpringProperty");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInput:", v15);

  v17 = (void *)objc_opt_class();
  -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "input");
  objc_msgSend(v17, "rotationWithShortestDistanceFromDegrees:toDegrees:");
  v19 = v18;
  -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInput:", v19);

}

- (int64_t)triggerCountForCandidateRotationState:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v5 = -[SFMagicHeadWheelView isMagicHead](self, "isMagicHead");
  -[SFMagicHeadWheelView settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 1)
  {
    if (v5)
      v8 = objc_msgSend(v6, "rotationStartGatingResponsiveness");
    else
      v8 = objc_msgSend(v6, "rotationStartBigHeadGatingResponsiveness");
  }
  else if (v5)
  {
    v8 = objc_msgSend(v6, "rotationStopGatingResponsiveness");
  }
  else
  {
    v8 = objc_msgSend(v6, "rotationStopBigHeadGatingResponsiveness");
  }
  v9 = v8;

  return v9;
}

- (void)transitionToRotationState:(int64_t)a3 bypassSampling:(BOOL)a4
{
  unint64_t v5;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  id v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  int64_t v15;
  const char *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  if (-[SFMagicHeadWheelView proposedRotationState](self, "proposedRotationState") != a3)
  {
    -[SFMagicHeadWheelView setProposedRotationState:](self, "setProposedRotationState:", v5);
    -[SFMagicHeadWheelView setConsecutiveRotationChangeRequests:](self, "setConsecutiveRotationChangeRequests:", 0);
  }
  v7 = -[SFMagicHeadWheelView triggerCountForCandidateRotationState:](self, "triggerCountForCandidateRotationState:", -[SFMagicHeadWheelView proposedRotationState](self, "proposedRotationState"));
  if (v5 <= 1)
  {
    v8 = v7;
    v9 = -[SFMagicHeadWheelView proposedRotationState](self, "proposedRotationState");
    if (v9 != -[SFMagicHeadWheelView rotationState](self, "rotationState")
      && -[SFMagicHeadWheelView consecutiveRotationChangeRequests](self, "consecutiveRotationChangeRequests") < v8
      && !a4)
    {
      -[SFMagicHeadWheelView setConsecutiveRotationChangeRequests:](self, "setConsecutiveRotationChangeRequests:", -[SFMagicHeadWheelView consecutiveRotationChangeRequests](self, "consecutiveRotationChangeRequests") + 1);
      v5 = -[SFMagicHeadWheelView rotationState](self, "rotationState");
    }
  }
  if (-[SFMagicHeadWheelView rotationState](self, "rotationState") != v5)
  {
    v10 = -[SFMagicHeadWheelView rotationState](self, "rotationState");
    -[SFMagicHeadWheelView setRotationState:](self, "setRotationState:", v5);
    v18 = 0;
    -[SFMagicHeadWheelView canChangeSelectionWithDescription:](self, "canChangeSelectionWithDescription:", &v18);
    v11 = v18;
    magic_head_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v10 == 1)
        v13 = "Rotating";
      else
        v13 = "?";
      if (v10)
        v14 = v13;
      else
        v14 = "Resting";
      v15 = -[SFMagicHeadWheelView rotationState](self, "rotationState");
      if (v15 == 1)
        v16 = "Rotating";
      else
        v16 = "?";
      *(_DWORD *)buf = 136315650;
      v20 = v14;
      if (!v15)
        v16 = "Resting";
      v21 = 2080;
      v22 = v16;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_212728000, v12, OS_LOG_TYPE_DEFAULT, "Transitioning rotation state from %s to %s. %@", buf, 0x20u);
    }

    -[SFMagicHeadWheelView updateVisibilityOfComponents](self, "updateVisibilityOfComponents");
  }
  if (!-[SFMagicHeadWheelView rotatedAfterSelectionWasMade](self, "rotatedAfterSelectionWasMade")
    && -[SFMagicHeadWheelView rotationState](self, "rotationState") == 1)
  {
    -[SFMagicHeadWheelView setRotatedAfterSelectionWasMade:](self, "setRotatedAfterSelectionWasMade:", 1);
    magic_head_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212728000, v17, OS_LOG_TYPE_DEFAULT, "Re-enabled guidance UI due to rotating", buf, 2u);
    }

  }
}

- (void)updateVelocityWithCurrentAngle:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[SFMagicHeadWheelView settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rotationGateThresholdDegrees");
  v7 = v6;

  -[SFMagicHeadWheelView previousAngle](self, "previousAngle");
  v9 = a3 - v8;
  if (v9 < 0.0)
    v9 = -v9;
  -[SFMagicHeadWheelView transitionToRotationState:bypassSampling:](self, "transitionToRotationState:bypassSampling:", v9 >= v7, 0);
  -[SFMagicHeadWheelView setPreviousAngle:](self, "setPreviousAngle:", a3);
}

+ (double)clampedRotationDegrees:(double)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = 0.0;
  if (a3 < 0.0)
    v3 = -1.0;
  if (a3 <= 0.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (a3 < 0.0)
    a3 = -a3;
  v5 = a3;
  v6 = v4 * fmodf(v5, 360.0);
  if (v6 >= 0.0)
    return v6;
  else
    return v6 + 360.0;
}

- (BOOL)canChangeSelectionWhenInRotationState:(int64_t)a3 guidanceState:(int64_t)a4 description:(id *)a5 ignoreDisabling:(BOOL)a6
{
  void *v10;
  int v11;
  char v12;
  __CFString *v13;
  void *v14;
  int v15;
  _BOOL4 v16;

  if (a6
    || -[SFMagicHeadWheelView isMagicHead](self, "isMagicHead")
    || (-[SFMagicHeadWheelView settings](self, "settings"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "selectionDisabled"),
        v10,
        !v11))
  {
    if ((unint64_t)(a4 - 3) > 1)
    {
      -[SFMagicHeadWheelView settings](self, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "rotationGatedSelectionEnabled");
      v16 = a3 != 1;

      v12 = v16 & v15 ^ 1;
      v13 = CFSTR("Selection can change");
      if ((v16 & v15) != 0)
        v13 = CFSTR("Selection cannot change due to Not Rotating");
      if (a5)
        goto LABEL_12;
    }
    else
    {
      v12 = 0;
      if (a5)
      {
        v13 = CFSTR("Selection cannot change due to Tilted");
        goto LABEL_12;
      }
    }
  }
  else
  {
    v12 = 0;
    if (a5)
    {
      v13 = CFSTR("Selection cannot change due to being Disabled");
LABEL_12:
      *a5 = v13;
    }
  }
  return v12 & 1;
}

- (BOOL)canChangeSelectionWithDescription:(id *)a3 ignoreDisabling:(BOOL)a4
{
  return -[SFMagicHeadWheelView canChangeSelectionWhenInRotationState:guidanceState:description:ignoreDisabling:](self, "canChangeSelectionWhenInRotationState:guidanceState:description:ignoreDisabling:", -[SFMagicHeadWheelView rotationState](self, "rotationState"), -[SFMagicHeadWheelView guidanceState](self, "guidanceState"), a3, a4);
}

- (BOOL)canChangeSelectionWithDescription:(id *)a3
{
  return -[SFMagicHeadWheelView canChangeSelectionWithDescription:ignoreDisabling:](self, "canChangeSelectionWithDescription:ignoreDisabling:", a3, 0);
}

- (BOOL)inGuidanceStatesWhenInState:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (BOOL)inGuidanceStates
{
  return -[SFMagicHeadWheelView inGuidanceStatesWhenInState:](self, "inGuidanceStatesWhenInState:", -[SFMagicHeadWheelView guidanceState](self, "guidanceState"));
}

- (BOOL)guidanceStatesEnabled
{
  _BOOL4 v3;
  void *v4;

  if (-[SFMagicHeadWheelView isMagicHead](self, "isMagicHead"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[SFMagicHeadWheelView settings](self, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "guidanceEnabled")
      && -[SFMagicHeadWheelView rotatedAfterSelectionWasMade](self, "rotatedAfterSelectionWasMade"))
    {
      v3 = !-[SFMagicHeadWheelView noUWBCapableDevices](self, "noUWBCapableDevices");
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)transitionToGuidanceState:(int64_t)a3
{
  BOOL v5;
  int64_t v6;
  BOOL v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  unint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  _BOOL4 v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (-[SFMagicHeadWheelView guidanceState](self, "guidanceState") == a3)
    return 1;
  v6 = -[SFMagicHeadWheelView guidanceState](self, "guidanceState");
  v7 = a3 != 2 && v6 == 1;
  v5 = !v7;
  if (v7)
  {
    magic_head_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[SFMagicHeadWheelView guidanceState](self, "guidanceState");
      if (v13 > 4)
        v14 = "?";
      else
        v14 = off_24CE0EEB8[v13];
      if ((unint64_t)a3 > 4)
        v16 = "?";
      else
        v16 = off_24CE0EE90[a3];
      *(_DWORD *)buf = 136315394;
      v22 = v14;
      v23 = 2080;
      v24 = v16;
      _os_log_impl(&dword_212728000, v10, OS_LOG_TYPE_DEFAULT, "Cannot transition guidance state from %s to %s", buf, 0x16u);
    }
  }
  else
  {
    v8 = -[SFMagicHeadWheelView guidanceState](self, "guidanceState");
    -[SFMagicHeadWheelView setGuidanceState:](self, "setGuidanceState:", a3);
    if (-[SFMagicHeadWheelView rotatedAfterSelectionWasMade](self, "rotatedAfterSelectionWasMade")
      && -[SFMagicHeadWheelView guidanceState](self, "guidanceState") == 2)
    {
      -[SFMagicHeadWheelView transitionToRotationState:bypassSampling:](self, "transitionToRotationState:bypassSampling:", 0, 1);
      magic_head_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212728000, v9, OS_LOG_TYPE_DEFAULT, "Disabled guidance UI due to Selected", buf, 2u);
      }

      -[SFMagicHeadWheelView setRotatedAfterSelectionWasMade:](self, "setRotatedAfterSelectionWasMade:", 0);
    }
    v20 = 0;
    -[SFMagicHeadWheelView canChangeSelectionWithDescription:](self, "canChangeSelectionWithDescription:", &v20);
    v10 = v20;
    magic_head_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v8 > 4)
        v12 = "?";
      else
        v12 = off_24CE0EEB8[v8];
      if ((unint64_t)a3 > 4)
        v15 = "?";
      else
        v15 = off_24CE0EEB8[a3];
      *(_DWORD *)buf = 136315650;
      v22 = v12;
      v23 = 2080;
      v24 = v15;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_212728000, v11, OS_LOG_TYPE_DEFAULT, "Transitioning guidance state from %s to %s. %@", buf, 0x20u);
    }

    -[SFMagicHeadWheelView updateSelectionControlState](self, "updateSelectionControlState");
    -[SFMagicHeadWheelView updateVisibilityOfComponents](self, "updateVisibilityOfComponents");
    v17 = -[SFMagicHeadWheelView inGuidanceStatesWhenInState:](self, "inGuidanceStatesWhenInState:", v8);
    if (v17 != -[SFMagicHeadWheelView inGuidanceStatesWhenInState:](self, "inGuidanceStatesWhenInState:", a3))
    {
      -[SFMagicHeadWheelView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "magicHeadSelectedHeadRequestingDisabledState:", -[SFMagicHeadWheelView inGuidanceStatesWhenInState:](self, "inGuidanceStatesWhenInState:", a3));

    }
  }

  return v5;
}

- (void)updateVisibilityOfComponents
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL8 v9;
  void *v10;

  -[SFMagicHeadWheelView dots](self, "dots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;

  if (!-[SFMagicHeadWheelView isMagicHead](self, "isMagicHead"))
  {
    v7 = -[SFMagicHeadWheelView guidanceState](self, "guidanceState");
    if (fabs(v6) >= 0.00000011920929 == v7 > 2)
    {
      v8 = v7;
      v9 = v7 > 2;
      -[SFMagicHeadWheelView hideDots:withAnimationDuration:](self, "hideDots:withAnimationDuration:", v9, 0.2);
      -[SFMagicHeadWheelView scaleDots:](self, "scaleDots:", v9);
      -[SFMagicHeadWheelView window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        -[SFMagicHeadWheelView hapticsForHideDots:](self, "hapticsForHideDots:", v8 > 2);
      -[SFMagicHeadWheelView hideSelection:](self, "hideSelection:", v8 > 2);
    }
    -[SFMagicHeadWheelView updatePlaceHolderView](self, "updatePlaceHolderView");
  }
  -[SFMagicHeadWheelView updateCanChangeSelectionUI](self, "updateCanChangeSelectionUI");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFMagicHeadWheelView;
  -[SFMagicHeadWheelView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SFMagicHeadWheelView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)squareBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SFMagicHeadWheelView radius](self, "radius");
  v3 = v2 + v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.size.height = v6;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGPoint)centerOfContentBounds
{
  void *v3;
  CGFloat MidX;
  void *v5;
  CGFloat MidY;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[SFMagicHeadWheelView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v10);
  -[SFMagicHeadWheelView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v11);

  v7 = MidX;
  v8 = MidY;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  double Height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double MidX;
  double MidY;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  int64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  float v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  float v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  uint64_t v84;
  void *v85;
  CGFloat v86;
  void *v87;
  CGFloat v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  _QWORD v95[7];
  _QWORD v96[8];
  _QWORD block[6];
  objc_super v98;
  uint8_t buf[4];
  double v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  uint64_t v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v111 = *MEMORY[0x24BDAC8D0];
  v98.receiver = self;
  v98.super_class = (Class)SFMagicHeadWheelView;
  -[SFMagicHeadWheelView layoutSubviews](&v98, sel_layoutSubviews);
  -[SFMagicHeadWheelView settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView bounds](self, "bounds");
  Width = CGRectGetWidth(v112);
  -[SFMagicHeadWheelView bounds](self, "bounds");
  Height = CGRectGetHeight(v113);
  if (Width < Height)
    Height = Width;
  -[SFMagicHeadWheelView setRadius:](self, "setRadius:", Height * 0.5);
  -[SFMagicHeadWheelView squareBounds](self, "squareBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SFMagicHeadWheelView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBounds:", v7, v9, v11, v13);

  -[SFMagicHeadWheelView bounds](self, "bounds");
  MidX = CGRectGetMidX(v114);
  -[SFMagicHeadWheelView bounds](self, "bounds");
  MidY = CGRectGetMidY(v115);
  -[SFMagicHeadWheelView contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", MidX, MidY);

  -[SFMagicHeadWheelView centerOfContentBounds](self, "centerOfContentBounds");
  v19 = v18;
  v21 = v20;
  -[SFMagicHeadWheelView centerOfContentBounds](self, "centerOfContentBounds");
  v23 = v22;
  v25 = v24;
  -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCenter:", v23, v25);

  -[SFMagicHeadWheelView placeHolderView](self, "placeHolderView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBounds:", v7, v9, v11, v13);

  -[SFMagicHeadWheelView placeHolderView](self, "placeHolderView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCenter:", v19, v21);

  -[SFMagicHeadWheelView selectedHeadControl](self, "selectedHeadControl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBounds:", v7, v9, v11, v13);

  -[SFMagicHeadWheelView selectedHeadControl](self, "selectedHeadControl");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCenter:", v19, v21);

  -[SFMagicHeadWheelView dotsContainer](self, "dotsContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", v7, v9, v11, v13);

  -[SFMagicHeadWheelView dotsContainer](self, "dotsContainer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v19, v21);

  if (-[SFMagicHeadWheelView isEnabled](self, "isEnabled"))
  {
    v33 = -[SFMagicHeadWheelView guidanceStatesEnabled](self, "guidanceStatesEnabled");
    if (v33)
    {
      -[SFMagicHeadWheelView pitchSpringProperty](self, "pitchSpringProperty");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "primed"))
      {
        -[SFMagicHeadWheelView pitchSpringProperty](self, "pitchSpringProperty");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "output");
        v37 = v36;

      }
      else
      {
        v37 = 90.0;
      }

    }
    else
    {
      v37 = 90.0;
    }
    if (-[SFMagicHeadWheelView guidanceState](self, "guidanceState") == 4)
    {
      objc_msgSend(v3, "guidanceTooFarDegrees");
      v39 = v38;
      objc_msgSend(v3, "guidanceRecoveredDegreesDelta");
      if (v37 > v39 + v40)
      {
        v41 = 3;
        goto LABEL_22;
      }
LABEL_15:
      objc_msgSend(v3, "guidanceFadeHeadDegrees");
      v45 = v44;
      objc_msgSend(v3, "guidanceRestoreHeadDegreesDelta");
      if (v37 <= v45 + v46)
      {
LABEL_23:
        objc_msgSend(v3, "guidanceGoodAngleThreshold");
        v49 = v48;
        objc_msgSend(v3, "guidanceGoodAngleThreshold");
        v51 = v50;
        objc_msgSend(v3, "guidanceWorstAngleDegreesDelta");
        v53 = v51 - v52;
        objc_msgSend(v3, "guidanceDipSpeed");
        v55 = 0.0;
        v56 = SFMathMap(v37, v53, v49, -(v49 * v54), 0.0);
        if (v56 < v53)
          v53 = v56;
        objc_msgSend(v3, "guidanceRubberbandingStretchiness");
        v58 = fmin(SFMathRubberband(v53, v49, v49, v57, 0.0), 0.0);
        if (-[SFMagicHeadWheelView inGuidanceStates](self, "inGuidanceStates"))
        {
          -[SFMagicHeadWheelView contentView](self, "contentView");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "layer");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v58;
          v62 = v61 * 0.0174532925;
          *(float *)&v62 = v62;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setValue:forKeyPath:", v63, CFSTR("transform.rotation.x"));

        }
        if (objc_msgSend(v3, "rollEnabled"))
        {
          -[SFMagicHeadWheelView rollSpringProperty](self, "rollSpringProperty");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v64, "primed"))
          {
            -[SFMagicHeadWheelView rollSpringProperty](self, "rollSpringProperty");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "output");
            v55 = v66;

          }
        }
        objc_msgSend(v3, "rollMaxDegrees");
        v68 = -v67;
        objc_msgSend(v3, "rollMaxDegrees");
        v70 = v69;
        objc_msgSend(v3, "rollRubberbandingStretchiness");
        v72 = v71;
        objc_msgSend(v3, "rollRubberbandingStretchiness");
        v74 = SFMathRubberband(v55, v68, v70, v72, v73);
        if (v33)
        {
          -[SFMagicHeadWheelView contentView](self, "contentView");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "layer");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v74;
          v78 = v77 * 0.0174532925;
          *(float *)&v78 = v78;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setValue:forKeyPath:", v79, CFSTR("transform.rotation.y"));

        }
        -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0.0;
        if (objc_msgSend(v80, "primed"))
        {
          -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "output");
          v81 = v83;

        }
        v84 = MEMORY[0x24BDAC760];
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke;
        block[3] = &unk_24CE0ED10;
        block[4] = self;
        *(double *)&block[5] = v81;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        -[SFMagicHeadWheelView updateVelocityWithCurrentAngle:](self, "updateVelocityWithCurrentAngle:", v81);
        -[SFMagicHeadWheelView dotsContainer](self, "dotsContainer");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "bounds");
        v86 = CGRectGetMidX(v116);
        -[SFMagicHeadWheelView dotsContainer](self, "dotsContainer");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "bounds");
        v88 = CGRectGetMidY(v117);

        -[SFMagicHeadWheelView dots](self, "dots");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = v84;
        v96[1] = 3221225472;
        v96[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_2;
        v96[3] = &unk_24CE0ED38;
        *(CGFloat *)&v96[5] = v86;
        *(CGFloat *)&v96[6] = v88;
        v96[4] = self;
        *(double *)&v96[7] = v81;
        objc_msgSend(v89, "enumerateObjectsUsingBlock:", v96);

        -[SFMagicHeadWheelView identifierToSelectionMarkerView](self, "identifierToSelectionMarkerView");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "allValues");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = v84;
        v95[1] = 3221225472;
        v95[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_4;
        v95[3] = &__block_descriptor_56_e38_v32__0__SFMagicHeadMarkerView_8Q16_B24l;
        *(CGFloat *)&v95[4] = v86;
        *(CGFloat *)&v95[5] = v88;
        *(double *)&v95[6] = v81;
        objc_msgSend(v91, "enumerateObjectsUsingBlock:", v95);

        magic_head_log();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "input");
          *(_DWORD *)buf = 134219264;
          v100 = v81;
          v101 = 2048;
          v102 = v94;
          v103 = 2048;
          v104 = v58;
          v105 = 2048;
          v106 = v37;
          v107 = 2048;
          v108 = v74;
          v109 = 2048;
          v110 = v55;
          _os_log_debug_impl(&dword_212728000, v92, OS_LOG_TYPE_DEBUG, "Motion: (adjusted/raw) yaw: %f/%f, pitch: %f/%f, roll %f/%f", buf, 0x3Eu);

        }
        goto LABEL_38;
      }
      v41 = 0;
LABEL_22:
      -[SFMagicHeadWheelView transitionToGuidanceState:](self, "transitionToGuidanceState:", v41);
      goto LABEL_23;
    }
    v42 = -[SFMagicHeadWheelView guidanceState](self, "guidanceState");
    objc_msgSend(v3, "guidanceTooFarDegrees");
    if (v42 == 3)
    {
      if (v37 >= v43)
        goto LABEL_15;
    }
    else if (v37 >= v43)
    {
      objc_msgSend(v3, "guidanceFadeHeadDegrees");
      if (v37 >= v47)
        v41 = 0;
      else
        v41 = 3;
      goto LABEL_22;
    }
    v41 = 4;
    goto LABEL_22;
  }
LABEL_38:

}

void __38__SFMagicHeadWheelView_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magicHeadChangedFacingDegree:", *(double *)(a1 + 40));

}

void __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t *v15;
  double v16;
  int v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  _QWORD v35[4];
  id v36;
  double v37;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;

  v5 = a2;
  objc_msgSend(v5, "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v6 = *(double *)(a1 + 56)
     + (double)a3 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "numberOfDots") * 360.0;
  v7 = v6;
  v8 = v7 * 0.0174532925;
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeRotation(&v42, v8);
  memset(&v41, 0, sizeof(v41));
  objc_msgSend(*(id *)(a1 + 32), "radius");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "dotsRadius");
  CGAffineTransformMakeTranslation(&v41, 0.0, v11 - v10);
  t1 = v41;
  memset(&v40, 0, sizeof(v40));
  t2 = v42;
  CGAffineTransformConcat(&v40, &t1, &t2);
  objc_msgSend(*(id *)(a1 + 32), "selectedHead");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12, v14 = objc_msgSend(*(id *)(a1 + 32), "inGuidanceStates"), v13, (v14 & 1) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "clampedRotationDegrees:", v6);
    v17 = (int)v16;
    if ((int)v16 <= 180)
      v18 = 180.0 - (double)v17;
    else
      v18 = (double)v17 + -180.0;
    if (objc_msgSend(*(id *)(a1 + 32), "isMagicHead"))
    {
      v19 = objc_msgSend(*(id *)(a1 + 32), "rotationState");
      v20 = 1.0;
      v21 = 0.0;
      if (v19 != 1)
        v20 = 0.0;
      if (v18 + -20.0 > 0.0)
        v21 = (v18 + -20.0) / 20.0;
      if (v18 < 40.0 && v19 == 1)
        v23 = v21;
      else
        v23 = v20;
      v24 = (void *)MEMORY[0x24BEBDB00];
      objc_msgSend(*(id *)(a1 + 32), "settings", 40.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (fabs(v23) < 0.00000011920929)
        objc_msgSend(v25, "circlesFadeOutDurationS");
      else
        objc_msgSend(v25, "circlesFadeInDurationS");
      v29 = v27;
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_3;
      v35[3] = &unk_24CE0ED10;
      v36 = v5;
      v37 = v23;
      objc_msgSend(v24, "animateWithDuration:animations:", v35, v29);

    }
    else if (v18 < 40.0)
    {
      v28 = 0.0;
      memset(&t1.c, 0, 32);
      if (v18 + -30.0 > 0.0)
        v28 = (v18 + -30.0) / 10.0;
      *(_OWORD *)&t1.a = 0uLL;
      CGAffineTransformMakeScale(&t1, v28, v28);
      v34 = t1;
      v33 = v40;
      CGAffineTransformConcat(&t2, &v34, &v33);
      v40 = t2;
    }
    v15 = (uint64_t *)&v32;
  }
  else
  {
    v15 = &v31;
  }
  v30 = *(_OWORD *)&v40.c;
  *(_OWORD *)v15 = *(_OWORD *)&v40.a;
  *((_OWORD *)v15 + 1) = v30;
  *((_OWORD *)v15 + 2) = *(_OWORD *)&v40.tx;
  objc_msgSend(v5, "setTransform:");

}

uint64_t __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

void __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_4(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setCenter:", v3, v4);
  objc_msgSend(v5, "updateMarkerWithDegreeOffset:", a1[6]);

}

- (void)updateCanChangeSelectionUI
{
  void *v3;
  int v4;
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
  _BOOL8 v17;
  void *v18;
  id v19;

  if (IsAppleInternalBuild()
    && (-[SFMagicHeadWheelView settings](self, "settings"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "showSelectionGateLock"),
        v3,
        v4))
  {
    -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithSize:", 40.0, 40.0);
      -[SFMagicHeadWheelView setCanChangeSelectionView:](self, "setCanChangeSelectionView:", v6);

      -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setZPosition:", 9999.0);

      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v9);

      -[SFMagicHeadWheelView contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("lock.fill"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v13);

      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("lock.open.fill"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHighlightedImage:", v15);

    }
    v17 = -[SFMagicHeadWheelView canChangeSelectionWithDescription:ignoreDisabling:](self, "canChangeSelectionWithDescription:ignoreDisabling:", 0, 1);
    -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHighlighted:", v17);

  }
  else
  {
    -[SFMagicHeadWheelView canChangeSelectionView](self, "canChangeSelectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeFromSuperview");

    -[SFMagicHeadWheelView setCanChangeSelectionView:](self, "setCanChangeSelectionView:", 0);
  }
}

- (void)setMarkerViewForIdentifier:(id)a3 atPositionDegree:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  SFMagicHeadMarkerView *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFMagicHeadMarkerView *v15;

  v6 = a3;
  -[SFMagicHeadWheelView identifierToSelectionMarkerView](self, "identifierToSelectionMarkerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  v9 = [SFMagicHeadMarkerView alloc];
  -[SFMagicHeadWheelView radius](self, "radius");
  v15 = -[SFMagicHeadMarkerView initWithPositionDegree:containerRadius:](v9, "initWithPositionDegree:containerRadius:", a4, v10);
  -[SFMagicHeadWheelView settings](self, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadMarkerView setHidden:](v15, "setHidden:", objc_msgSend(v11, "showSelectionMarkers") ^ 1);

  -[SFMagicHeadWheelView dotsContainer](self, "dotsContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v15);

  -[SFMagicHeadWheelView identifierToSelectionMarkerView](self, "identifierToSelectionMarkerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

  -[SFMagicHeadWheelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)lostSelectedNode
{
  -[SFMagicHeadWheelView updateSelectedHead:](self, "updateSelectedHead:", 0);
}

- (BOOL)updateSelectedNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "realName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v9, "isEqual:", v10);
  }

  v13 = -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:](self, "configureSelectedHeadWithNode:slotNode:isSameAsSelected:", v4, 0, v12);
  return v13;
}

- (BOOL)updateSelectedSlotNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slotNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v9, "isEqual:", v10);
  }

  v13 = -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:](self, "configureSelectedHeadWithNode:slotNode:isSameAsSelected:", 0, v4, v12);
  return v13;
}

- (BOOL)configureSelectedHeadWithNode:(id)a3 slotNode:(id)a4 isSameAsSelected:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  SFMagicHead *v33;
  double v34;
  double v35;
  void *v36;
  SFMagicHead *v37;
  BOOL v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v47;
  uint8_t buf[16];

  v5 = a5;
  v8 = (uint64_t)a3;
  v9 = a4;
  v10 = (unint64_t)v9;
  if (!v9)
    v9 = (id)v8;
  v11 = objc_msgSend(v9, "selectionReason");
  if (v11 == 2)
  {
    if (!v5)
    {
      magic_head_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212728000, v12, OS_LOG_TYPE_DEFAULT, "Selection can change due to CozyUp", buf, 2u);
      }

    }
    v13 = 0;
    goto LABEL_16;
  }
  v47 = 0;
  v14 = -[SFMagicHeadWheelView canChangeSelectionWithDescription:](self, "canChangeSelectionWithDescription:", &v47);
  v13 = v47;
  if (v14)
  {
    if (v11 == 1)
    {
      if (v5)
      {
        -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "pointedAt");

        if ((v16 & 1) == 0)
        {
          magic_head_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:].cold.2(v8, v17, v18, v19, v20, v21, v22, v23);

          -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPointedAt:", 1);

          -[SFMagicHeadWheelView pulseSelectedHead](self, "pulseSelectedHead");
          -[SFMagicHeadWheelView triggerReSelectedHaptic](self, "triggerReSelectedHaptic");
          -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "nodeIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "input");
          -[SFMagicHeadWheelView setMarkerViewForIdentifier:atPositionDegree:](self, "setMarkerViewForIdentifier:atPositionDegree:", v26, -v28);

          -[SFMagicHeadWheelView transitionToGuidanceState:](self, "transitionToGuidanceState:", 2);
        }
      }
      goto LABEL_20;
    }
LABEL_16:
    -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "pointedAt");

    if (v30)
    {
      magic_head_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:].cold.1(v31);

      -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPointedAt:", 0);

    }
LABEL_20:
    if (v8 | v10)
    {
      v33 = [SFMagicHead alloc];
      -[SFMagicHeadWheelView radius](self, "radius");
      v35 = v34;
      -[SFMagicHeadWheelView settings](self, "settings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFMagicHead initWithNode:slotNode:containerRadius:delegate:settings:](v33, "initWithNode:slotNode:containerRadius:delegate:settings:", v8, v10, self, v36, v35);
      v38 = -[SFMagicHeadWheelView updateSelectedHead:](self, "updateSelectedHead:", v37);

    }
    else
    {
      v38 = !v5;
    }
    goto LABEL_26;
  }
  magic_head_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:].cold.3((uint64_t)v13, v39, v40, v41, v42, v43, v44, v45);

  v38 = 0;
LABEL_26:

  return v38;
}

- (void)pulseSelectedHead
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  _QWORD v19[5];
  _QWORD v20[6];

  -[SFMagicHeadWheelView settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedPulseEnabled");

  if (v4)
  {
    -[SFMagicHeadWheelView selectionAnimator](self, "selectionAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRunning");

    if ((v6 & 1) == 0)
    {
      -[SFMagicHeadWheelView settings](self, "settings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectedPulseScaleAmount");
      v9 = v8;

      v10 = (void *)MEMORY[0x24BEBDB00];
      -[SFMagicHeadWheelView settings](self, "settings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectedPulseDurationS");
      v12 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke;
      v20[3] = &unk_24CE0ED10;
      v20[4] = self;
      v20[5] = v9;
      objc_msgSend(v10, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v20, 0);

      v13 = (void *)MEMORY[0x24BEBDB00];
      -[SFMagicHeadWheelView settings](self, "settings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectedPulseDurationS");
      v16 = v15;
      -[SFMagicHeadWheelView settings](self, "settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectedPulseDurationS");
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke_2;
      v19[3] = &unk_24CE0ED80;
      v19[4] = self;
      objc_msgSend(v13, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v19, 0, v16, v18 * 0.5, 0.6, 0.0);

    }
  }
}

void __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "selectedHead");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "selectedHead");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

- (BOOL)updateSelectedHead:(id)a3
{
  id v5;
  SFMagicHead **p_selectedHead;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  SFMagicHead *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  SFMagicHead *v25;
  BOOL v26;
  SFMagicHeadWheelView *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_selectedHead = &self->_selectedHead;
  -[SFMagicHead nodeIdentifier](self->_selectedHead, "nodeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v9, "isEqual:", v10);
  }

  -[SFMagicHead slotNode](*p_selectedHead, "slotNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "avatarImageSlotID");
  objc_msgSend(v5, "slotNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "avatarImageSlotID");

  if ((!v12 || v14 != v16)
    && -[SFMagicHeadWheelView transitionToGuidanceState:](self, "transitionToGuidanceState:", 1))
  {
    v17 = *p_selectedHead;
    objc_storeStrong((id *)&self->_selectedHead, a3);
    magic_head_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[SFMagicHead node](*p_selectedHead, "node");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      v35 = v19;
      _os_log_impl(&dword_212728000, v18, OS_LOG_TYPE_DEFAULT, "Selecting %@", (uint8_t *)&v34, 0xCu);

    }
    if (*p_selectedHead)
    {
      objc_msgSend(v5, "nodeIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMagicHeadWheelView rotationSpringProperty](self, "rotationSpringProperty");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "input");
      -[SFMagicHeadWheelView setMarkerViewForIdentifier:atPositionDegree:](self, "setMarkerViewForIdentifier:atPositionDegree:", v20, -v22);

      -[SFMagicHead setUserInteractionEnabled:](*p_selectedHead, "setUserInteractionEnabled:", 0);
      -[SFMagicHeadWheelView contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSubview:", *p_selectedHead);

      -[SFMagicHeadWheelView centerOfContentBounds](self, "centerOfContentBounds");
      -[SFMagicHead setCenter:](*p_selectedHead, "setCenter:");
      -[SFMagicHead slotNode](*p_selectedHead, "slotNode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *p_selectedHead;
      if (v24)
        -[SFMagicHead slotNode](v25, "slotNode");
      else
        -[SFMagicHead node](v25, "node");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "selectionReason");

      if (v30 != 1)
      {
        -[SFMagicHeadWheelView settings](self, "settings");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "hapticForCozyUpSelectionEnabled");

        if (v32)
          -[SFMagicHeadWheelView triggerSelectedHaptic](self, "triggerSelectedHaptic");
        -[SFMagicHeadWheelView cozyUpAnimationForHead:](self, "cozyUpAnimationForHead:", v5);
        goto LABEL_23;
      }
      -[SFMagicHeadWheelView triggerSelectedHaptic](self, "triggerSelectedHaptic");
      v27 = self;
      v28 = v5;
    }
    else
    {
      v27 = self;
      v28 = 0;
    }
    -[SFMagicHeadWheelView selectAnimationForHead:withDismissHead:](v27, "selectAnimationForHead:withDismissHead:", v28, v17);
LABEL_23:

    v26 = 1;
    goto LABEL_24;
  }
  v26 = 0;
LABEL_24:

  return v26;
}

- (void)updateSelectionControlState
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[SFMagicHeadWheelView inGuidanceStates](self, "inGuidanceStates");
  -[SFMagicHeadWheelView selectedHeadControl](self, "selectedHeadControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setEnabled:", 0);

    -[SFMagicHeadWheelView selectedHeadHightlightCancel](self, "selectedHeadHightlightCancel");
  }
  else
  {
    objc_msgSend(v4, "setEnabled:", 1);

  }
}

- (void)selectedHeadHighlighted
{
  id v2;

  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlighted:", 1);

}

- (void)selectedHeadHightlightCancel
{
  id v2;

  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHighlighted:", 0);

}

- (void)selectedHeadTapped
{
  void *v3;
  void *v4;
  id v5;

  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "node");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SFMagicHeadWheelView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "magicHeadSelectedNodeTapped:", v5);

    -[SFMagicHeadWheelView selectedHeadHightlightCancel](self, "selectedHeadHightlightCancel");
  }

}

- (void)cozyUpAnimationForHead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  UIViewPropertyAnimator *selectionAnimator;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v4 = a3;
  -[SFMagicHeadWheelView settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPosition:", 1);
  if ((objc_msgSend(v5, "cozyUpAnimationEnabled") & 1) != 0)
  {
    objc_msgSend(v4, "setSize:", 0);
    v6 = (void *)objc_opt_new();
    -[SFMagicHeadWheelView setSelectionAnimator:](self, "setSelectionAnimator:", v6);

    -[SFMagicHeadWheelView placeHolderView](self, "placeHolderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView selectionAnimator](self, "selectionAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke;
    v19[3] = &unk_24CE0EDD0;
    v20 = v5;
    v21 = v4;
    v10 = v7;
    v22 = v10;
    objc_msgSend(v8, "addAnimations:", v19);

    location = 0;
    objc_initWeak(&location, self);
    selectionAnimator = self->_selectionAnimator;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_3;
    v16[3] = &unk_24CE0EDF8;
    objc_copyWeak(&v17, &location);
    -[UIViewPropertyAnimator addCompletion:](selectionAnimator, "addCompletion:", v16);
    -[SFMagicHeadWheelView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "node");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "magicHeadChangedSelectionToNode:", v14);

    -[SFMagicHeadWheelView selectionAnimator](self, "selectionAnimator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAnimation");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v4, "setSize:", 2);
  }

}

void __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke(id *a1)
{
  void *v2;
  double v3;
  double v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)MEMORY[0x24BEBDB00];
  objc_msgSend(a1[4], "cozyUpSelectDurationS");
  v4 = v3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_2;
  v5[3] = &unk_24CE0EDA8;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v2, "animateWithDuration:animations:", v5, v4);

}

uint64_t __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSize:", 2);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "transitionToGuidanceState:", 2);

  }
}

- (void)selectAnimationForHead:(id)a3 withDismissHead:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  UIViewPropertyAnimator *selectionAnimator;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  id location;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;

  v6 = a3;
  v7 = a4;
  -[SFMagicHeadWheelView settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SFMagicHeadWheelView identifierToSelectionMarkerView](self, "identifierToSelectionMarkerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentOffset");
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "setSize:", 1);
  objc_msgSend(v6, "setPosition:", 0);
  objc_msgSend(v6, "setAlpha:", 0.0);
  v14 = (void *)objc_opt_new();
  -[SFMagicHeadWheelView setSelectionAnimator:](self, "setSelectionAnimator:", v14);

  -[SFMagicHeadWheelView placeHolderView](self, "placeHolderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView selectionAnimator](self, "selectionAnimator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke;
  v33[3] = &unk_24CE0EE20;
  v18 = v6;
  v34 = v18;
  v38 = 0x4077D00000000000;
  v19 = v8;
  v35 = v19;
  v20 = v15;
  v36 = v20;
  v21 = v7;
  v37 = v21;
  v39 = v13;
  objc_msgSend(v16, "addAnimations:", v33);

  location = 0;
  objc_initWeak(&location, self);
  selectionAnimator = self->_selectionAnimator;
  v27 = v17;
  v28 = 3221225472;
  v29 = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_9;
  v30 = &unk_24CE0EDF8;
  objc_copyWeak(&v31, &location);
  -[UIViewPropertyAnimator addCompletion:](selectionAnimator, "addCompletion:", &v27);
  -[SFMagicHeadWheelView delegate](self, "delegate", v27, v28, v29, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "node");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "magicHeadChangedSelectionToNode:", v25);

  -[SFMagicHeadWheelView selectionAnimator](self, "selectionAnimator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "startAnimation");

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;

  v2 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x24BEBDB00];
    v4 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "selectionPositionFriction");
    v6 = v5;
    v46[0] = v2;
    v46[1] = 3221225472;
    v46[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_2;
    v46[3] = &unk_24CE0ED80;
    v47 = *(id *)(a1 + 48);
    objc_msgSend(v3, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v46, 0, v4, v6);
    v7 = (void *)MEMORY[0x24BEBDB00];
    v8 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "selectionScaleFriction");
    v10 = v9;
    v44[0] = v2;
    v44[1] = 3221225472;
    v44[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_3;
    v44[3] = &unk_24CE0ED80;
    v45 = *(id *)(a1 + 32);
    objc_msgSend(v7, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v44, 0, v8, v10);
    v11 = (void *)MEMORY[0x24BEBDB00];
    v12 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "selectionAlphaFriction");
    v14 = v13;
    v42[0] = v2;
    v42[1] = 3221225472;
    v42[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_4;
    v42[3] = &unk_24CE0ED80;
    v43 = *(id *)(a1 + 32);
    objc_msgSend(v11, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v42, 0, v12, v14);
    v15 = (void *)MEMORY[0x24BEBDB00];
    v16 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "selectionPositionFriction");
    v18 = v17;
    v40[0] = v2;
    v40[1] = 3221225472;
    v40[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_5;
    v40[3] = &unk_24CE0ED80;
    v41 = *(id *)(a1 + 32);
    objc_msgSend(v15, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v40, 0, v16, v18);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v19 = (void *)MEMORY[0x24BEBDB00];
    v20 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "dismissScaleFriction");
    v22 = v21;
    v38[0] = v2;
    v38[1] = 3221225472;
    v38[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_6;
    v38[3] = &unk_24CE0ED80;
    v39 = *(id *)(a1 + 56);
    objc_msgSend(v19, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v38, 0, v20, v22);
    v23 = (void *)MEMORY[0x24BEBDB00];
    v24 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "dismissAlphaFriction");
    v26 = v25;
    v34[0] = v2;
    v34[1] = 3221225472;
    v34[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_7;
    v34[3] = &unk_24CE0EDD0;
    v35 = *(id *)(a1 + 56);
    v36 = *(id *)(a1 + 32);
    v37 = *(id *)(a1 + 48);
    objc_msgSend(v23, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v34, 0, v24, v26);
    v27 = (void *)MEMORY[0x24BEBDB00];
    v28 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "dismissPositionFriction");
    v30 = v29;
    v31[0] = v2;
    v31[1] = 3221225472;
    v31[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_8;
    v31[3] = &unk_24CE0ED10;
    v32 = *(id *)(a1 + 56);
    v33 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v27, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v31, 0, v28, v30);

  }
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSize:", 2);
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:", 1);
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSize:", 0);
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  if (!*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  return result;
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPositionDegreeOffsetWithOffset:", *(double *)(a1 + 40));
}

void __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_9(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "transitionToGuidanceState:", 2);

  }
}

- (void)hideSelection:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__SFMagicHeadWheelView_hideSelection___block_invoke;
    v9[3] = &unk_24CE0EE48;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v9);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __38__SFMagicHeadWheelView_hideSelection___block_invoke_2;
    v7[3] = &unk_24CE0EE48;
    v7[4] = self;
    v8 = a3;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v7, 0.2);
  }
}

void __38__SFMagicHeadWheelView_hideSelection___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "placeHolderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __38__SFMagicHeadWheelView_hideSelection___block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "selectedHead");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)hideDots:(BOOL)a3 withAnimationDuration:(double)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SFMagicHeadWheelView_hideDots_withAnimationDuration___block_invoke;
  v4[3] = &unk_24CE0EE48;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, a4);
}

void __55__SFMagicHeadWheelView_hideDots_withAnimationDuration___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dots");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("alpha"));

}

- (void)scaleDots:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__SFMagicHeadWheelView_scaleDots___block_invoke;
  v3[3] = &unk_24CE0EE48;
  v4 = a3;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v3, 0, 0.7, 0.0, 0.6, 0.0);
}

void __34__SFMagicHeadWheelView_scaleDots___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  v2 = 0.5;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  CGAffineTransformMakeScale(&v5, v2, v2);
  objc_msgSend(*(id *)(a1 + 32), "dotsContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

- (void)updatePlaceHolderView
{
  int64_t v3;
  BOOL v4;
  void *v5;
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;

  v3 = -[SFMagicHeadWheelView guidanceState](self, "guidanceState");
  if (-[SFMagicHeadWheelView inGuidanceStates](self, "inGuidanceStates"))
  {
    v4 = 1;
  }
  else
  {
    -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SFMagicHeadWheelView_updatePlaceHolderView__block_invoke;
  v6[3] = &unk_24CE0EE70;
  v6[4] = self;
  v7 = v3 == 4;
  v8 = v4;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v6, 0.4);
}

void __45__SFMagicHeadWheelView_updatePlaceHolderView__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "placeHolderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTiltedTooFarColor:useRaiseLabel:useNoUWBCapableLabel:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), objc_msgSend(*(id *)(a1 + 32), "noUWBCapableDevices"));

}

- (void)magicHead:(id)a3 requestingSubtitleTextChangeForState:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;

  v6 = a3;
  -[SFMagicHeadWheelView selectedHead](self, "selectedHead");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v8 = v7;
  if (v8 == v10)
  {

  }
  else
  {
    if ((v10 == 0) == (v8 != 0))
    {

      goto LABEL_8;
    }
    v9 = objc_msgSend(v10, "isEqual:", v8);

    if (!v9)
      goto LABEL_9;
  }
  -[SFMagicHeadWheelView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "magicHeadSelectedHeadRequestingSubtitleTextChangeForState:", a4);
LABEL_8:

LABEL_9:
}

- (void)magicHeadDidStartTransferForHead:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SFMagicHeadWheelView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "magicHeadDidStartTransferForNode:", v5);
}

- (void)magicHeadDidTerminateTransferForHead:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SFMagicHeadWheelView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "magicHeadDidTerminateTransferForNode:", v5);
}

- (void)magicHeadDidFinishTransferForHead:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SFMagicHeadWheelView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "magicHeadDidFinishTransferForNode:", v5);
}

- (void)stopSuppressGuidanceHapticsTimer
{
  OS_dispatch_source *suppressGuidanceHapticsTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  suppressGuidanceHapticsTimer = self->_suppressGuidanceHapticsTimer;
  if (suppressGuidanceHapticsTimer)
  {
    v5 = suppressGuidanceHapticsTimer;
    dispatch_source_cancel(v5);
    v4 = self->_suppressGuidanceHapticsTimer;
    self->_suppressGuidanceHapticsTimer = 0;

  }
}

- (void)startSuppressGuidanceHapticsTimer
{
  dispatch_source_t v3;
  void *v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[5];

  -[SFMagicHeadWheelView stopSuppressGuidanceHapticsTimer](self, "stopSuppressGuidanceHapticsTimer");
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  -[SFMagicHeadWheelView setSuppressGuidanceHapticsTimer:](self, "setSuppressGuidanceHapticsTimer:", v3);

  -[SFMagicHeadWheelView settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guidanceSuppressHapticsDurationS");
  v6 = (unint64_t)v5;

  v7 = 1000000000 * v6;
  -[SFMagicHeadWheelView suppressGuidanceHapticsTimer](self, "suppressGuidanceHapticsTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, v7, v7 >> 2);

  -[SFMagicHeadWheelView suppressGuidanceHapticsTimer](self, "suppressGuidanceHapticsTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__SFMagicHeadWheelView_startSuppressGuidanceHapticsTimer__block_invoke;
  handler[3] = &unk_24CE0ED80;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);

  -[SFMagicHeadWheelView suppressGuidanceHapticsTimer](self, "suppressGuidanceHapticsTimer");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v11);

}

uint64_t __57__SFMagicHeadWheelView_startSuppressGuidanceHapticsTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSuppressGuidanceHapticsTimer");
}

- (void)hapticsForHideDots:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = a3;
  -[SFMagicHeadWheelView settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guidanceSuppressHapticsEnabled");
  v7 = v6;

  if (v7 == 0.0)
  {
    if (v3)
    {
LABEL_7:
      -[SFMagicHeadWheelView triggerContractDotsHaptic](self, "triggerContractDotsHaptic");
      return;
    }
LABEL_9:
    -[SFMagicHeadWheelView triggerExpandDotsHaptic](self, "triggerExpandDotsHaptic");
    return;
  }
  -[SFMagicHeadWheelView suppressGuidanceHapticsTimer](self, "suppressGuidanceHapticsTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (v3)
      goto LABEL_7;
    -[SFMagicHeadWheelView startSuppressGuidanceHapticsTimer](self, "startSuppressGuidanceHapticsTimer");
    goto LABEL_9;
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)noUWBCapableDevices
{
  return self->_noUWBCapableDevices;
}

- (SFMagicHeadSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (SFMagicHeadWheelViewDelegate)delegate
{
  return (SFMagicHeadWheelViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (SFMagicHead)selectedHead
{
  return self->_selectedHead;
}

- (void)setSelectedHead:(id)a3
{
  objc_storeStrong((id *)&self->_selectedHead, a3);
}

- (BOOL)isMagicHead
{
  return self->_magicHead;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (int64_t)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(int64_t)a3
{
  self->_guidanceState = a3;
}

- (int64_t)rotationState
{
  return self->_rotationState;
}

- (void)setRotationState:(int64_t)a3
{
  self->_rotationState = a3;
}

- (BOOL)rotatedAfterSelectionWasMade
{
  return self->_rotatedAfterSelectionWasMade;
}

- (void)setRotatedAfterSelectionWasMade:(BOOL)a3
{
  self->_rotatedAfterSelectionWasMade = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (UIView)contentView
{
  return (UIView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setContentView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (UIImageView)canChangeSelectionView
{
  return (UIImageView *)objc_getProperty(self, a2, 488, 1);
}

- (void)setCanChangeSelectionView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (UIVisualEffectView)dotsContainer
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 496, 1);
}

- (void)setDotsContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (unint64_t)numberOfDots
{
  return self->_numberOfDots;
}

- (void)setNumberOfDots:(unint64_t)a3
{
  self->_numberOfDots = a3;
}

- (double)dotsRadius
{
  return self->_dotsRadius;
}

- (void)setDotsRadius:(double)a3
{
  self->_dotsRadius = a3;
}

- (UIColor)dotsColor
{
  return (UIColor *)objc_getProperty(self, a2, 520, 1);
}

- (void)setDotsColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (UIControl)selectedHeadControl
{
  return (UIControl *)objc_getProperty(self, a2, 528, 1);
}

- (void)setSelectedHeadControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSMutableDictionary)identifierToSelectionMarkerView
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 536, 1);
}

- (void)setIdentifierToSelectionMarkerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (SFMagicHeadPlaceholderView)placeHolderView
{
  return (SFMagicHeadPlaceholderView *)objc_getProperty(self, a2, 544, 1);
}

- (void)setPlaceHolderView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (OS_dispatch_source)suppressGuidanceHapticsTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 552, 1);
}

- (void)setSuppressGuidanceHapticsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (int64_t)proposedRotationState
{
  return self->_proposedRotationState;
}

- (void)setProposedRotationState:(int64_t)a3
{
  self->_proposedRotationState = a3;
}

- (int64_t)consecutiveRotationChangeRequests
{
  return self->_consecutiveRotationChangeRequests;
}

- (void)setConsecutiveRotationChangeRequests:(int64_t)a3
{
  self->_consecutiveRotationChangeRequests = a3;
}

- (SFFloatSpringProperty)rotationSpringProperty
{
  return (SFFloatSpringProperty *)objc_getProperty(self, a2, 576, 1);
}

- (void)setRotationSpringProperty:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (SFFloatSpringProperty)pitchSpringProperty
{
  return (SFFloatSpringProperty *)objc_getProperty(self, a2, 584, 1);
}

- (void)setPitchSpringProperty:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (SFFloatSpringProperty)rollSpringProperty
{
  return (SFFloatSpringProperty *)objc_getProperty(self, a2, 592, 1);
}

- (void)setRollSpringProperty:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (double)previousAngle
{
  return self->_previousAngle;
}

- (void)setPreviousAngle:(double)a3
{
  self->_previousAngle = a3;
}

- (NSMutableArray)dots
{
  return (NSMutableArray *)objc_getProperty(self, a2, 608, 1);
}

- (void)setDots:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (UIViewPropertyAnimator)selectionAnimator
{
  return (UIViewPropertyAnimator *)objc_getProperty(self, a2, 616, 1);
}

- (void)setSelectionAnimator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionAnimator, 0);
  objc_storeStrong((id *)&self->_dots, 0);
  objc_storeStrong((id *)&self->_rollSpringProperty, 0);
  objc_storeStrong((id *)&self->_pitchSpringProperty, 0);
  objc_storeStrong((id *)&self->_rotationSpringProperty, 0);
  objc_storeStrong((id *)&self->_suppressGuidanceHapticsTimer, 0);
  objc_storeStrong((id *)&self->_placeHolderView, 0);
  objc_storeStrong((id *)&self->_identifierToSelectionMarkerView, 0);
  objc_storeStrong((id *)&self->_selectedHeadControl, 0);
  objc_storeStrong((id *)&self->_dotsColor, 0);
  objc_storeStrong((id *)&self->_dotsContainer, 0);
  objc_storeStrong((id *)&self->_canChangeSelectionView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_selectedHead, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)configureSelectedHeadWithNode:(os_log_t)log slotNode:isSameAsSelected:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_212728000, log, OS_LOG_TYPE_DEBUG, "No longer pointing at anyone", v1, 2u);
}

- (void)configureSelectedHeadWithNode:(uint64_t)a3 slotNode:(uint64_t)a4 isSameAsSelected:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212728000, a2, a3, "Re-pointing at selected person %@", a5, a6, a7, a8, 2u);
}

- (void)configureSelectedHeadWithNode:(uint64_t)a3 slotNode:(uint64_t)a4 isSameAsSelected:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212728000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

@end
