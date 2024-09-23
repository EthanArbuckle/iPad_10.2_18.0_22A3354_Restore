@implementation PUTransitionViewAnimator

- (PUTransitionViewAnimator)initWithView:(id)a3 sourceFrame:(CGRect)a4 targetFrame:(CGRect)a5 anchorPoint:(CGPoint)a6 shouldUseTargetAspectRatio:(BOOL)a7 rampUpDuration:(double)a8 direction:(unint64_t)a9
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  PUTransitionViewAnimator *v20;
  PUTransitionViewAnimator *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL IsEmpty;
  double v37;
  double v38;
  double v39;
  double v40;
  PUMaximumChangeRateValueFilter *v41;
  float v42;
  PUClampValueFilter *v43;
  PUMaximumChangeRateValueFilter *v44;
  float v45;
  PUGroupValueFilter *v46;
  void *v47;
  PUClampValueFilter *v48;
  PUChangeDirectionValueFilter *v49;
  PUGroupValueFilter *v50;
  void *v51;
  CGFloat v53;
  CGFloat v54;
  CGFloat rect;
  double v56;
  CGFloat v57;
  CGFloat v58;
  objc_super v59;
  _QWORD v60[2];
  _QWORD v61[4];
  double v62;
  double v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  y = a6.y;
  x = a6.x;
  height = a5.size.height;
  width = a5.size.width;
  v13 = a5.origin.y;
  v14 = a5.origin.x;
  v15 = a4.size.height;
  v16 = a4.size.width;
  v17 = a4.origin.y;
  v56 = a4.origin.x;
  v61[2] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PUTransitionViewAnimator;
  v20 = -[PUTransitionViewAnimator init](&v59, sel_init);
  v21 = v20;
  if (v20)
  {
    v58 = v13;
    v57 = v14;
    -[PUTransitionViewAnimator setAutoUpdates:](v20, "setAutoUpdates:", 1);
    -[PUTransitionViewAnimator setAppliesScaleViaTransform:](v21, "setAppliesScaleViaTransform:", 1);
    -[PUTransitionViewAnimator _setView:](v21, "_setView:", v19);
    -[PUTransitionViewAnimator _setSourceFrame:](v21, "_setSourceFrame:", v56, v17, v16, v15);
    -[PUTransitionViewAnimator _setTargetFrame:](v21, "_setTargetFrame:", v14, v13, width, height);
    -[PUTransitionViewAnimator _setAnchorPoint:](v21, "_setAnchorPoint:", a8, v62);
    -[PUTransitionViewAnimator _setShouldUseTargetAspectRatio:](v21, "_setShouldUseTargetAspectRatio:", *(_QWORD *)&x);
    -[PUTransitionViewAnimator _setRampUpDuration:](v21, "_setRampUpDuration:", v63);
    -[PUTransitionViewAnimator _setDirection:](v21, "_setDirection:", *(_QWORD *)&y);
    -[PUTransitionViewAnimator _setCurrentScale:](v21, "_setCurrentScale:", 1.0);
    -[PUTransitionViewAnimator _setShouldFinish:](v21, "_setShouldFinish:", 1);
    v22 = 0.0;
    if (LODWORD(x))
      v22 = 1.0;
    -[PUTransitionViewAnimator _setDesiredSizeMixFactor:](v21, "_setDesiredSizeMixFactor:", v22);
    v64.origin.x = v14;
    v64.origin.y = v13;
    v64.size.width = width;
    v64.size.height = height;
    v53 = v16;
    v54 = v15;
    rect = height;
    if (CGRectIsEmpty(v64))
    {
      v23 = v15;
      v24 = v16;
      v25 = v17;
      v26 = v56;
      v27 = v17;
      v28 = height;
      v29 = width;
    }
    else
    {
      v65.origin.x = v14;
      v65.origin.y = v13;
      v65.size.width = width;
      v65.size.height = height;
      v30 = CGRectGetWidth(v65);
      v66.origin.x = v14;
      v66.origin.y = v13;
      v66.size.width = width;
      v66.size.height = height;
      v31 = v30 / CGRectGetHeight(v66);
      v29 = width;
      if (y == 0.0)
        v32 = PURectWithAspectRatioFillingRect(v31, v56, v17, v16, v15);
      else
        v32 = PURectWithAspectRatioFittingRect(v31, v56, v17, v16, v15);
      v26 = v32;
      v25 = v33;
      v24 = v34;
      v23 = v35;
      v27 = v17;
      v28 = rect;
    }
    -[PUTransitionViewAnimator _setTargetAspectRatioSourceFrame:](v21, "_setTargetAspectRatioSourceFrame:", v26, v25, v24, v23);
    v67.origin.x = v57;
    v67.origin.y = v58;
    v67.size.width = v29;
    v67.size.height = v28;
    IsEmpty = CGRectIsEmpty(v67);
    v37 = 1.0;
    if (!IsEmpty)
    {
      v68.origin.x = v26;
      v68.origin.y = v25;
      v68.size.width = v24;
      v68.size.height = v23;
      v38 = CGRectGetWidth(v68);
      v69.origin.x = v56;
      v69.origin.y = v27;
      v69.size.width = v53;
      v69.size.height = v54;
      if (v38 == CGRectGetWidth(v69))
      {
        v70.origin.x = v57;
        v70.origin.y = v58;
        v70.size.width = v29;
        v70.size.height = rect;
        v39 = CGRectGetWidth(v70);
        v71.origin.x = v56;
        v71.origin.y = v27;
        v71.size.width = v53;
        v71.size.height = v54;
        v40 = CGRectGetWidth(v71);
      }
      else
      {
        v72.origin.x = v57;
        v72.origin.y = v58;
        v72.size.width = v29;
        v72.size.height = rect;
        v39 = CGRectGetHeight(v72);
        v73.origin.x = v56;
        v73.origin.y = v27;
        v73.size.width = v53;
        v73.size.height = v54;
        v40 = CGRectGetHeight(v73);
      }
      v37 = v39 / v40;
    }
    -[PUTransitionViewAnimator _setTargetScale:](v21, "_setTargetScale:", v37);
    if (v63 <= 0.0)
    {
      v41 = objc_alloc_init(PUValueFilter);
    }
    else
    {
      v41 = objc_alloc_init(PUMaximumChangeRateValueFilter);
      UIAnimationDragCoefficient();
      -[PUMaximumChangeRateValueFilter setMaximumChangeRate:](v41, "setMaximumChangeRate:", 1.0 / (v42 * v63));
    }
    -[PUDynamicValueFilter setInputValue:](v41, "setInputValue:", 1.0);
    -[PUTransitionViewAnimator _setRampUpFilter:](v21, "_setRampUpFilter:", v41);
    v43 = objc_alloc_init(PUClampValueFilter);
    -[PUClampValueFilter setMinimumValue:](v43, "setMinimumValue:", 0.0);
    -[PUClampValueFilter setMaximumValue:](v43, "setMaximumValue:", 1.0);
    v44 = objc_alloc_init(PUMaximumChangeRateValueFilter);
    UIAnimationDragCoefficient();
    -[PUMaximumChangeRateValueFilter setMaximumChangeRate:](v44, "setMaximumChangeRate:", 3.33333333 / v45);
    v46 = objc_alloc_init(PUGroupValueFilter);
    v61[0] = v43;
    v61[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUGroupValueFilter setFilters:](v46, "setFilters:", v47);

    -[PUTransitionViewAnimator _setProgressFilter:](v21, "_setProgressFilter:", v46);
    v48 = objc_alloc_init(PUClampValueFilter);
    -[PUClampValueFilter setMinimumValue:](v48, "setMinimumValue:", 0.0);
    -[PUClampValueFilter setMaximumValue:](v48, "setMaximumValue:", 1.0);
    v49 = objc_alloc_init(PUChangeDirectionValueFilter);
    -[PUChangeDirectionValueFilter setMinimumChangeValue:](v49, "setMinimumChangeValue:", 0.05);
    v50 = objc_alloc_init(PUGroupValueFilter);
    v60[0] = v48;
    v60[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUGroupValueFilter setFilters:](v50, "setFilters:", v51);

    -[PUTransitionViewAnimator _setShouldFinishFilter:](v21, "_setShouldFinishFilter:", v50);
  }

  return v21;
}

- (void)setDelegate:(id)a3
{
  PUTransitionViewAnimatorDelegate **p_delegate;
  id v5;
  char v6;
  char v7;
  char v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v8;
}

- (void)updateWithTranslation:(CGPoint)a3 rotation:(double)a4 scale:(double)a5
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (!-[PUTransitionViewAnimator _isEnding](self, "_isEnding"))
  {
    -[PUTransitionViewAnimator _setDesiredTranslation:](self, "_setDesiredTranslation:", x, y);
    -[PUTransitionViewAnimator _setDesiredRotation:](self, "_setDesiredRotation:", a4);
    -[PUTransitionViewAnimator _setDesiredScale:](self, "_setDesiredScale:", a5);
    if (!-[PUTransitionViewAnimator _isAutoUpdating](self, "_isAutoUpdating"))
      -[PUTransitionViewAnimator _update](self, "_update");
  }
}

- (void)finishWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6
{
  -[PUTransitionViewAnimator _endWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:finish:animated:](self, "_endWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:finish:animated:", a6, 1, 1, a3.x, a3.y, a4, a5);
}

- (void)cancelWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6
{
  -[PUTransitionViewAnimator _endWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:finish:animated:](self, "_endWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:finish:animated:", a6, 0, 1, a3.x, a3.y, a4, a5);
}

- (void)cancelWithoutAnimation
{
  -[PUTransitionViewAnimator _endWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:finish:animated:](self, "_endWithTranslationVelocity:rotationVelocity:scaleVelocity:shouldBounce:finish:animated:", 0, 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0, 0.0);
}

- (void)_update
{
  _BOOL4 v3;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double width;
  double v29;
  double height;
  double x;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  _BOOL8 v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  double y;
  _OWORD v48[3];
  CGAffineTransform v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGRect v53;
  CGRect v54;

  v3 = -[PUTransitionViewAnimator appliesScaleViaTransform](self, "appliesScaleViaTransform");
  -[PUTransitionViewAnimator _desiredTranslation](self, "_desiredTranslation");
  v5 = v4;
  v7 = v6;
  -[PUTransitionViewAnimator _desiredRotation](self, "_desiredRotation");
  v9 = v8;
  -[PUTransitionViewAnimator _desiredScale](self, "_desiredScale");
  v11 = v10;
  -[PUTransitionViewAnimator _desiredSizeMixFactor](self, "_desiredSizeMixFactor");
  v13 = v12;
  -[PUTransitionViewAnimator _rampUpFilter](self, "_rampUpFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outputValue");
  v46 = *MEMORY[0x1E0C9D538];
  y = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v45 = v15;
  if (v15 < 1.0)
  {
    v5 = v5 * v15 + (1.0 - v15) * *MEMORY[0x1E0C9D538];
    v7 = v7 * v15 + (1.0 - v15) * *(double *)(MEMORY[0x1E0C9D538] + 8);
    v9 = v9 * v15 + (1.0 - v15) * 0.0;
    v11 = 1.0 - v15 + v11 * v15;
    v13 = v13 * v15 + (1.0 - v15) * 0.0;
  }
  -[PUTransitionViewAnimator _setCurrentTranslation:](self, "_setCurrentTranslation:", v5, v7);
  -[PUTransitionViewAnimator _setCurrentRotation:](self, "_setCurrentRotation:", v9);
  -[PUTransitionViewAnimator _setCurrentScale:](self, "_setCurrentScale:", v11);
  -[PUTransitionViewAnimator _setCurrentSizeMixFactor:](self, "_setCurrentSizeMixFactor:", v13);
  -[PUTransitionViewAnimator anchorPoint](self, "anchorPoint");
  v17 = v16;
  v19 = v18;
  -[PUTransitionViewAnimator sourceFrame](self, "sourceFrame");
  UIRectGetCenter();
  if (v3)
    v22 = v11;
  else
    v22 = 1.0;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  -[PUTransitionViewAnimator sourceFrame](self, "sourceFrame", PUAffineTransformWithAnchorPointTranslationRotationScale((uint64_t)&v50, v17 - v20, v19 - v21, v5, v7, v9, v22));
  v24 = v23;
  v26 = v25;
  -[PUTransitionViewAnimator _targetAspectRatioSourceFrame](self, "_targetAspectRatioSourceFrame");
  width = v27 * v13 + (1.0 - v13) * v24;
  height = v29 * v13 + (1.0 - v13) * v26;
  if (v3)
  {
    x = v46;
  }
  else
  {
    CGAffineTransformMakeScale(&v49, v11, v11);
    v53.origin.x = v46;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    v54 = CGRectApplyAffineTransform(v53, &v49);
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
  }
  -[PUTransitionViewAnimator _targetScale](self, "_targetScale");
  if (v32 == 1.0)
  {
    v34 = -[PUTransitionViewAnimator direction](self, "direction");
    v35 = 0.0;
    if (v11 <= 1.0)
      v36 = 0.0;
    else
      v36 = 1.0;
    if (v11 < 1.0)
      v35 = 1.0;
    if (v34)
      v33 = v35;
    else
      v33 = v36;
  }
  else
  {
    v33 = (v11 + -1.0) / (v32 + -1.0);
  }
  -[PUTransitionViewAnimator _progressFilter](self, "_progressFilter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setInputValue:", v33);
  objc_msgSend(v37, "outputValue");
  v39 = v38;
  -[PUTransitionViewAnimator _setProgress:](self, "_setProgress:");
  -[PUTransitionViewAnimator _setUnfilteredProgress:](self, "_setUnfilteredProgress:", v33);
  v40 = v39 != v33 || v45 < 1.0;
  -[PUTransitionViewAnimator _shouldFinishFilter](self, "_shouldFinishFilter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setInputValue:", v33);
  objc_msgSend(v41, "outputValue");
  -[PUTransitionViewAnimator _setShouldFinish:](self, "_setShouldFinish:", v42 >= 0.0);
  -[PUTransitionViewAnimator view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBounds:", x, y, width, height);
  v48[0] = v50;
  v48[1] = v51;
  v48[2] = v52;
  objc_msgSend(v43, "setTransform:", v48);
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    -[PUTransitionViewAnimator delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "transitionViewAnimatorDidUpdate:", self);

  }
  if (!v40 || -[PUTransitionViewAnimator autoUpdates](self, "autoUpdates"))
    -[PUTransitionViewAnimator _setAutoUpdating:](self, "_setAutoUpdating:", v40);

}

- (void)_setAutoUpdating:(BOOL)a3
{
  if (*(&self->__isEnding + 3) != a3)
  {
    *(&self->__isEnding + 3) = a3;
    -[PUTransitionViewAnimator _updateAutoUpdateDisplayLink](self, "_updateAutoUpdateDisplayLink");
  }
}

- (void)_updateAutoUpdateDisplayLink
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v3 = -[PUTransitionViewAnimator _isAutoUpdating](self, "_isAutoUpdating");
  -[PUTransitionViewAnimator _autoUpdateDisplayLink](self, "_autoUpdateDisplayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !v3;
  if (v3 && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__autoUpdate_);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUTransitionViewAnimator _setAutoUpdateDisplayLink:](self, "_setAutoUpdateDisplayLink:", v7);
    objc_msgSend(v7, "setPaused:", 0);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

LABEL_8:
    v4 = v7;
    goto LABEL_9;
  }
  if (!v4)
    v5 = 0;
  if (v5 == 1)
  {
    v7 = v4;
    objc_msgSend(v4, "setPaused:", 1);
    objc_msgSend(v7, "invalidate");
    -[PUTransitionViewAnimator _setAutoUpdateDisplayLink:](self, "_setAutoUpdateDisplayLink:", 0);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_endWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6 finish:(BOOL)a7 animated:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  double y;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double Height;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  double v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  PUThresholdCrossingCountValueFilter *v60;
  void *v61;
  PUThresholdCrossingCountValueFilter *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  double Width;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  BOOL v78;
  double v79;
  void *v80;
  double v81;
  double x;
  void *v83;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  PUThresholdCrossingCountValueFilter *v94;
  PUTransitionViewAnimator *v95;
  id v96;
  __int128 v97;
  double v98;
  BOOL v99;
  _QWORD aBlock[5];
  id v101;
  BOOL v102;
  __int128 v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v8 = a8;
  v9 = a7;
  x = a3.x;
  y = a3.y;
  if (!-[PUTransitionViewAnimator _isEnding](self, "_isEnding"))
  {
    -[PUTransitionViewAnimator _setEnding:](self, "_setEnding:", 1);
    -[PUTransitionViewAnimator _setAutoUpdating:](self, "_setAutoUpdating:", 0);
    v13 = -[PUTransitionViewAnimator appliesScaleViaTransform](self, "appliesScaleViaTransform");
    v14 = objc_alloc_init(MEMORY[0x1E0DC4128]);
    -[PUTransitionViewAnimator progress](self, "progress");
    objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:", v15);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;

    -[PUTransitionViewAnimator currentTranslation](self, "currentTranslation");
    v81 = v19;
    v79 = v20;
    if (v9)
    {
      -[PUTransitionViewAnimator anchorPoint](self, "anchorPoint");
      v22 = v21;
      v74 = v23;
      v75 = v21;
      -[PUTransitionViewAnimator _targetAspectRatioSourceFrame](self, "_targetAspectRatioSourceFrame");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v76 = y;
      v31 = v30;
      -[PUTransitionViewAnimator targetFrame](self, "targetFrame");
      v33 = v32;
      v70 = v34;
      v71 = v32;
      v69 = v35;
      v77 = v36;
      v104.origin.x = v25;
      v104.origin.y = v27;
      v104.size.width = v29;
      v104.size.height = v31;
      v37 = v22 - CGRectGetMinX(v104);
      v105.origin.x = v25;
      v105.origin.y = v27;
      v105.size.width = v29;
      v105.size.height = v31;
      v72 = v37 / CGRectGetWidth(v105);
      v106.origin.x = v33;
      v106.origin.y = v70;
      v106.size.width = v69;
      v106.size.height = v77;
      Width = CGRectGetWidth(v106);
      v107.origin.x = v33;
      v107.origin.y = v70;
      v107.size.width = v69;
      v107.size.height = v77;
      v73 = CGRectGetMinX(v107) + v72 * Width;
      v108.origin.x = v25;
      v108.origin.y = v27;
      v108.size.width = v29;
      v108.size.height = v31;
      v38 = v74 - CGRectGetMinY(v108);
      v109.origin.x = v25;
      v109.origin.y = v27;
      v109.size.width = v29;
      v109.size.height = v31;
      y = v76;
      v39 = v38 / CGRectGetHeight(v109);
      v110.origin.x = v71;
      v110.origin.y = v70;
      v110.size.width = v69;
      v110.size.height = v77;
      Height = CGRectGetHeight(v110);
      v111.origin.x = v71;
      v111.origin.y = v70;
      v111.size.width = v69;
      v111.size.height = v77;
      *(double *)&v103 = v73 - v75;
      *((double *)&v103 + 1) = CGRectGetMinY(v111) + v39 * Height - v74;
    }
    else
    {
      v103 = *MEMORY[0x1E0C9D538];
    }
    -[PUTransitionViewAnimator delegate](self, "delegate", *(_QWORD *)&Width);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
      objc_msgSend(v41, "transitionViewAnimatorWillEnd:withTargetTranslation:", self, &v103);
    v43 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke;
    aBlock[3] = &unk_1E58AA878;
    aBlock[4] = self;
    v44 = v42;
    v101 = v44;
    v102 = v9;
    v45 = _Block_copy(aBlock);
    v46 = v45;
    if (v8)
    {
      v78 = v13;
      v47 = 0.5 / v18;
      objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", v79, x, *(double *)&v103, 200.0, 1.0, v47);
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", v81, y, *((double *)&v103 + 1), 200.0, 1.0, v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)v48;
      objc_msgSend(v14, "addAnimation:", v48);
      objc_msgSend(v14, "addAnimation:", v49);
      -[PUTransitionViewAnimator _currentRotation](self, "_currentRotation");
      for (; v50 > 3.14159265; v50 = v50 + -6.28318531)
        ;
      for (; v50 < -3.14159265; v50 = v50 + 6.28318531)
        ;
      v83 = v15;
      v51 = 1.0;
      objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAnimation:", v52);
      -[PUTransitionViewAnimator _currentScale](self, "_currentScale");
      v54 = v53;
      v55 = 1.0;
      if (v9)
      {
        -[PUTransitionViewAnimator _targetScale](self, "_targetScale");
        v55 = v56;
      }
      if (a6 && v55 > v54)
        v51 = 0.67;
      -[PUTransitionViewAnimator sourceFrame](self, "sourceFrame");
      v57 = CGRectGetWidth(v112);
      -[PUTransitionViewAnimator sourceFrame](self, "sourceFrame");
      v58 = CGRectGetHeight(v113);
      if (v57 >= v58)
        v58 = v57;
      objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", v54, a5, v55, 200.0, v51, v47 / v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAnimation:", v59);
      v60 = objc_alloc_init(PUThresholdCrossingCountValueFilter);
      -[PUThresholdCrossingCountValueFilter setThresholdValue:](v60, "setThresholdValue:", v55);
      -[PUThresholdCrossingCountValueFilter setMaximumCrossingCount:](v60, "setMaximumCrossingCount:", 2);
      -[PUTransitionViewAnimator _currentSizeMixFactor](self, "_currentSizeMixFactor");
      objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAnimation:", v61);
      v87[0] = v43;
      v87[1] = 3221225472;
      v87[2] = __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_2;
      v87[3] = &unk_1E58AA048;
      v88 = v83;
      v89 = v80;
      v90 = v49;
      v91 = v52;
      v92 = v59;
      v93 = v61;
      v97 = v103;
      v98 = v55;
      v94 = v60;
      v95 = self;
      v99 = v78;
      v96 = v44;
      v85[0] = v43;
      v85[1] = 3221225472;
      v85[2] = __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_3;
      v85[3] = &unk_1E58AA518;
      v86 = v46;
      v62 = v60;
      v63 = v61;
      v64 = v59;
      v65 = v52;
      v66 = v49;
      v67 = v80;
      objc_msgSend(v14, "runWithGroupApplier:completion:", v87, v85);

      v15 = v83;
    }
    else
    {
      (*((void (**)(void *))v45 + 2))(v45);
    }

  }
}

- (BOOL)autoUpdates
{
  return self->__isAutoUpdating;
}

- (void)setAutoUpdates:(BOOL)a3
{
  self->__isAutoUpdating = a3;
}

- (BOOL)appliesScaleViaTransform
{
  return self->__isEnding;
}

- (void)setAppliesScaleViaTransform:(BOOL)a3
{
  self->__isEnding = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)_setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (PUTransitionViewAnimatorDelegate)delegate
{
  return (PUTransitionViewAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)progress
{
  return self->_progress;
}

- (void)_setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)unfilteredProgress
{
  return self->_unfilteredProgress;
}

- (void)_setUnfilteredProgress:(double)a3
{
  self->_unfilteredProgress = a3;
}

- (BOOL)shouldFinish
{
  return *(&self->__isEnding + 1);
}

- (void)_setShouldFinish:(BOOL)a3
{
  *(&self->__isEnding + 1) = a3;
}

- (CGPoint)currentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setCurrentTranslation:(CGPoint)a3
{
  self->_currentTranslation = a3;
}

- (UIView)view
{
  return self->_view;
}

- (void)_setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (CGRect)sourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceFrame.origin.x;
  y = self->_sourceFrame.origin.y;
  width = self->_sourceFrame.size.width;
  height = self->_sourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (BOOL)shouldUseTargetAspectRatio
{
  return *(&self->__isEnding + 2);
}

- (void)_setShouldUseTargetAspectRatio:(BOOL)a3
{
  *(&self->__isEnding + 2) = a3;
}

- (double)rampUpDuration
{
  return self->_rampUpDuration;
}

- (void)_setRampUpDuration:(double)a3
{
  self->_rampUpDuration = a3;
}

- (CGPoint)_desiredTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->__desiredTranslation.x;
  y = self->__desiredTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setDesiredTranslation:(CGPoint)a3
{
  self->__desiredTranslation = a3;
}

- (double)_desiredRotation
{
  return self->__desiredRotation;
}

- (void)_setDesiredRotation:(double)a3
{
  self->__desiredRotation = a3;
}

- (double)_desiredScale
{
  return self->__desiredScale;
}

- (void)_setDesiredScale:(double)a3
{
  self->__desiredScale = a3;
}

- (double)_desiredSizeMixFactor
{
  return self->__desiredSizeMixFactor;
}

- (void)_setDesiredSizeMixFactor:(double)a3
{
  self->__desiredSizeMixFactor = a3;
}

- (double)_currentRotation
{
  return self->__currentRotation;
}

- (void)_setCurrentRotation:(double)a3
{
  self->__currentRotation = a3;
}

- (double)_currentScale
{
  return self->__currentScale;
}

- (void)_setCurrentScale:(double)a3
{
  self->__currentScale = a3;
}

- (double)_currentSizeMixFactor
{
  return self->__currentSizeMixFactor;
}

- (void)_setCurrentSizeMixFactor:(double)a3
{
  self->__currentSizeMixFactor = a3;
}

- (CGRect)_targetAspectRatioSourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__targetAspectRatioSourceFrame.origin.x;
  y = self->__targetAspectRatioSourceFrame.origin.y;
  width = self->__targetAspectRatioSourceFrame.size.width;
  height = self->__targetAspectRatioSourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setTargetAspectRatioSourceFrame:(CGRect)a3
{
  self->__targetAspectRatioSourceFrame = a3;
}

- (double)_targetScale
{
  return self->__targetScale;
}

- (void)_setTargetScale:(double)a3
{
  self->__targetScale = a3;
}

- (BOOL)_isAutoUpdating
{
  return *(&self->__isEnding + 3);
}

- (CADisplayLink)_autoUpdateDisplayLink
{
  return self->__autoUpdateDisplayLink;
}

- (void)_setAutoUpdateDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->__autoUpdateDisplayLink, a3);
}

- (PUValueFilter)_rampUpFilter
{
  return self->__rampUpFilter;
}

- (void)_setRampUpFilter:(id)a3
{
  objc_storeStrong((id *)&self->__rampUpFilter, a3);
}

- (PUValueFilter)_progressFilter
{
  return self->__progressFilter;
}

- (void)_setProgressFilter:(id)a3
{
  objc_storeStrong((id *)&self->__progressFilter, a3);
}

- (PUValueFilter)_shouldFinishFilter
{
  return self->__shouldFinishFilter;
}

- (void)_setShouldFinishFilter:(id)a3
{
  objc_storeStrong((id *)&self->__shouldFinishFilter, a3);
}

- (BOOL)_isEnding
{
  return *(&self->__isEnding + 4);
}

- (void)_setEnding:(BOOL)a3
{
  *(&self->__isEnding + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shouldFinishFilter, 0);
  objc_storeStrong((id *)&self->__progressFilter, 0);
  objc_storeStrong((id *)&self->__rampUpFilter, 0);
  objc_storeStrong((id *)&self->__autoUpdateDisplayLink, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke(uint64_t result)
{
  if ((*(_BYTE *)(*(_QWORD *)(result + 32) + 8) & 4) != 0)
    return objc_msgSend(*(id *)(result + 40), "transitionViewAnimatorDidEnd:finished:");
  return result;
}

void __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double width;
  double v29;
  double height;
  double x;
  double y;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  void *v37;
  _OWORD v38[3];
  CGAffineTransform v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGRect v43;
  CGRect v44;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "value");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 48), "value");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 56), "value");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 64), "value");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 72), "value");
  v13 = v12;
  if (objc_msgSend(*(id *)(a1 + 40), "state") == 3)
    v5 = *(double *)(a1 + 104);
  if (objc_msgSend(*(id *)(a1 + 48), "state") == 3)
    v7 = *(double *)(a1 + 112);
  if (objc_msgSend(*(id *)(a1 + 64), "state") == 3)
  {
    v14 = *(double *)(a1 + 120);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "setInputValue:", v11);
    objc_msgSend(*(id *)(a1 + 80), "outputValue");
    v14 = v15;
  }
  objc_msgSend(*(id *)(a1 + 88), "sourceFrame");
  UIRectGetCenter();
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 88), "anchorPoint");
  if (*(_BYTE *)(a1 + 128))
    v22 = v14;
  else
    v22 = 1.0;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 88), "sourceFrame", PUAffineTransformWithAnchorPointTranslationRotationScale((uint64_t)&v40, v20 - v17, v21 - v19, v5, v7, v9, v22));
  v24 = v23;
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 88), "_targetAspectRatioSourceFrame");
  width = v27 * v13 + (1.0 - v13) * v24;
  height = v29 * v13 + (1.0 - v13) * v26;
  x = *MEMORY[0x1E0C9D538];
  y = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!*(_BYTE *)(a1 + 128))
  {
    CGAffineTransformMakeScale(&v39, v14, v14);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v44 = CGRectApplyAffineTransform(v43, &v39);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
  }
  objc_msgSend(*(id *)(a1 + 88), "_setProgress:", v3);
  objc_msgSend(*(id *)(a1 + 88), "_targetScale");
  if (v33 == 1.0)
  {
    v35 = objc_msgSend(*(id *)(a1 + 88), "direction");
    v34 = 1.0;
    if (v14 <= 1.0)
      v36 = 0.0;
    else
      v36 = 1.0;
    if (v14 >= 1.0)
      v34 = 0.0;
    if (!v35)
      v34 = v36;
  }
  else
  {
    v34 = (v14 + -1.0) / (v33 + -1.0);
  }
  objc_msgSend(*(id *)(a1 + 88), "_setUnfilteredProgress:", v34);
  objc_msgSend(*(id *)(a1 + 88), "_setCurrentTranslation:", v5, v7);
  objc_msgSend(*(id *)(a1 + 88), "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBounds:", x, y, width, height);
  v38[0] = v40;
  v38[1] = v41;
  v38[2] = v42;
  objc_msgSend(v37, "setTransform:", v38);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 88) + 8) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 96), "transitionViewAnimatorDidUpdate:");

}

uint64_t __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
