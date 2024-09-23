@implementation UIPercentDrivenInteractiveTransition

- (UIPercentDrivenInteractiveTransition)init
{
  objc_super v3;

  self->_duration = 0.0;
  self->_completionSpeed = 1.0;
  self->_completionCurve = 7;
  self->_wantsInteractiveStart = 1;
  self->__clampsPercentComplete = 1;
  v3.receiver = self;
  v3.super_class = (Class)UIPercentDrivenInteractiveTransition;
  return -[UIPercentDrivenInteractiveTransition init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->__originalFillMode, 0);
  objc_storeStrong((id *)&self->_timingCurve, 0);
  objc_storeStrong((id *)&self->_animationTrackingAnimatorUUID, 0);
  objc_storeStrong((id *)&self->_interruptibleAnimator, 0);
}

- (CGFloat)percentComplete
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_previousPercentComplete");
  v5 = v4;

  return v5;
}

- (CGFloat)duration
{
  return self->_duration;
}

- (void)_setDuration:(double)a3
{
  self->_duration = a3;
}

- (CGFloat)completionSpeed
{
  CGFloat result;

  result = self->_completionSpeed;
  if (result <= 0.0)
    return 1.0;
  return result;
}

- (double)_durationFactorForPercentComplete:(double)a3 reversed:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;

  v4 = a4;
  -[UIPercentDrivenInteractiveTransition completionSpeed](self, "completionSpeed");
  if (v6 == 0.0)
    return 0.0;
  v7 = 1.0 - a3;
  if (v4)
    v7 = a3;
  return v7 / v6;
}

- (void)_continueInterruptibleTransitionFromPercentComplete:(double)a3 reversed:(BOOL)a4
{
  _BOOL8 v4;
  UIViewImplicitlyAnimating *interruptibleAnimator;
  void *v8;
  double v9;
  uint64_t v10;
  UIViewImplicitlyAnimating *v11;
  void *v13;
  id v14;

  v4 = a4;
  interruptibleAnimator = self->_interruptibleAnimator;
  if (!interruptibleAnimator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewControllerTransitioning.m"), 684, CFSTR("Expected an interruptible animator for %@"), self);

    interruptibleAnimator = self->_interruptibleAnimator;
  }
  -[UIViewImplicitlyAnimating setReversed:](interruptibleAnimator, "setReversed:", v4);
  -[UIPercentDrivenInteractiveTransition timingCurve](self, "timingCurve");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_6:
    v10 = dyld_program_sdk_at_least() & v4;
    v11 = self->_interruptibleAnimator;
    -[UIPercentDrivenInteractiveTransition timingCurve](self, "timingCurve");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPercentDrivenInteractiveTransition _durationFactorForPercentComplete:reversed:](self, "_durationFactorForPercentComplete:reversed:", v10, a3);
    -[UIViewImplicitlyAnimating continueAnimationWithTimingParameters:durationFactor:](v11, "continueAnimationWithTimingParameters:durationFactor:", v14);

    return;
  }
  -[UIPercentDrivenInteractiveTransition completionSpeed](self, "completionSpeed");
  if (v9 != 1.0)
    goto LABEL_6;
  -[UIViewImplicitlyAnimating startAnimation](self->_interruptibleAnimator, "startAnimation");
}

- (BOOL)_useAnimatorTrackingToDriveTransition
{
  if (self->_animationTrackingAnimatorUUID)
    return 1;
  if (self->_interruptibleAnimator)
    return 0;
  return +[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators");
}

- (void)_updateInteractiveTransition:(id)a3 percent:(double)a4 isFinished:(BOOL)a5 didComplete:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v11;
  UIViewImplicitlyAnimating *interruptibleAnimator;
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
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  UICubicTimingParameters *v37;
  void *v38;
  double v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  uint64_t m;
  void *v59;
  double v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  double v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  float v73;
  uint64_t n;
  void *v75;
  double v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  SEL v84;
  void *v85;
  void *v86;
  _QWORD v87[5];
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  SEL v93;
  _QWORD aBlock[4];
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v6 = a6;
  v7 = a5;
  v121 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  interruptibleAnimator = self->_interruptibleAnimator;
  if (!interruptibleAnimator)
  {
    v84 = a2;
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_containerViews");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_auxContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v11, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_auxContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_alongsideAnimationViews");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v85 = 0;
    }

    if (!v7)
    {
      v30 = (void *)v15;
      if (-[UIPercentDrivenInteractiveTransition _useAnimatorTrackingToDriveTransition](self, "_useAnimatorTrackingToDriveTransition"))
      {
        +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", self->_animationTrackingAnimatorUUID);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pauseAnimation");
        v32 = v17;
        v33 = v86;
        if (self->__usesPacedFractionComplete && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v31, "setPacedFractionComplete:", a4);
        else
          objc_msgSend(v31, "setFractionComplete:", a4);
        v38 = v85;

      }
      else
      {
        v32 = v17;
        v33 = v86;
        if (objc_msgSend(v11, "count") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", v84, self, CFSTR("UIViewControllerTransitioning.m"), 736, CFSTR("Unsupported path when one interactor is driving multiple (%lu) transitions."), objc_msgSend(v11, "count"));

        }
        v39 = self->_duration * a4;
        if (v86)
        {
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v40 = v86;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v113;
            do
            {
              for (i = 0; i != v42; ++i)
              {
                if (*(_QWORD *)v113 != v43)
                  objc_enumerationMutation(v40);
                v45 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
                objc_msgSend(v45, "layer");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setTimeOffset:", v39);

                objc_msgSend(v45, "layoutBelowIfNeeded");
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
            }
            while (v42);
          }

        }
        else
        {
          objc_msgSend(v30, "setTimeOffset:", v39);
          objc_msgSend(v17, "layoutBelowIfNeeded");
        }
        v38 = v85;
        if (v85)
        {
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          v61 = v85;
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
          if (v62)
          {
            v63 = v62;
            v64 = *(_QWORD *)v109;
            do
            {
              for (j = 0; j != v63; ++j)
              {
                if (*(_QWORD *)v109 != v64)
                  objc_enumerationMutation(v61);
                v66 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
                objc_msgSend(v66, "layer");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "setTimeOffset:", v39);
                objc_msgSend(v66, "layoutBelowIfNeeded");

              }
              v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
            }
            while (v63);
          }

          v38 = v85;
        }
      }
      goto LABEL_80;
    }
    if (-[UIPercentDrivenInteractiveTransition _isTransitionInterrupted](self, "_isTransitionInterrupted"))
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v24 = v11;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v105;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v105 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * k), "setTransitionWasCancelled:", !v6);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
        }
        while (v26);
      }

      if (-[UIPercentDrivenInteractiveTransition _useAnimatorTrackingToDriveTransition](self, "_useAnimatorTrackingToDriveTransition"))
      {
        +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", self->_animationTrackingAnimatorUUID);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stopAnimation:", 0);
        objc_msgSend(v29, "finishAnimationAtPosition:", !v6);
      }
      else
      {
        -[UIPercentDrivenInteractiveTransition _uuid](self, "_uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIView _finalizeStoppedAnimationWithUUID:reverseAnimation:](UIView, "_finalizeStoppedAnimationWithUUID:reverseAnimation:", v29, !v6);
      }
      v30 = (void *)v15;
      v33 = v86;

      -[UIPercentDrivenInteractiveTransition _setTransitionInterrupted:](self, "_setTransitionInterrupted:", 0);
      v32 = v17;
      v38 = v85;
      goto LABEL_79;
    }
    -[UIPercentDrivenInteractiveTransition completionSpeed](self, "completionSpeed");
    v35 = v34;
    v30 = (void *)v15;
    if (-[UIPercentDrivenInteractiveTransition _useAnimatorTrackingToDriveTransition](self, "_useAnimatorTrackingToDriveTransition"))
    {
      +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", self->_animationTrackingAnimatorUUID);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", -[UIPercentDrivenInteractiveTransition completionCurve](self, "completionCurve"));
      objc_msgSend(v36, "setReversed:", !v6);
      -[UIPercentDrivenInteractiveTransition _durationFactorForPercentComplete:reversed:](self, "_durationFactorForPercentComplete:reversed:", !v6, a4);
      objc_msgSend(v36, "continueAnimationWithTimingParameters:durationFactor:", v37);

      v32 = v17;
      v38 = v85;
      v33 = v86;
LABEL_79:
      v77 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      v78 = v11;
      v95 = v78;
      v79 = _Block_copy(aBlock);
      objc_msgSend(v78, "firstObject");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v77;
      v87[1] = 3221225472;
      v87[2] = __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke_2;
      v87[3] = &unk_1E16C2768;
      v87[4] = self;
      v88 = v78;
      v93 = v84;
      v89 = v33;
      v90 = v32;
      v91 = v38;
      v92 = v79;
      v81 = v79;
      objc_msgSend(v80, "_setPostInteractiveCompletionHandler:", v87);

LABEL_80:
      goto LABEL_81;
    }
    v32 = v17;
    v33 = v86;
    if (objc_msgSend(v11, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", v84, self, CFSTR("UIViewControllerTransitioning.m"), 783, CFSTR("Unsupported path when one interactor is driving multiple (%lu) transitions."), objc_msgSend(v11, "count"));

    }
    v38 = v85;
    if (v86)
    {
      objc_msgSend(v86, "objectAtIndex:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "timeOffset");
      v50 = v49;

      if (!v6)
      {
LABEL_48:
        -[UIPercentDrivenInteractiveTransition _uuid](self, "_uuid");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIView _completeAnimationWithUUID:duration:curve:reverse:](UIView, "_completeAnimationWithUUID:duration:curve:reverse:", v51, -[UIPercentDrivenInteractiveTransition completionCurve](self, "completionCurve"), !v6, v50);

        if (v86)
        {
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v53 = v86;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v101;
            do
            {
              for (m = 0; m != v55; ++m)
              {
                if (*(_QWORD *)v101 != v56)
                  objc_enumerationMutation(v53);
                objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * m), "layer");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v35;
                *(float *)&v60 = v57;
                objc_msgSend(v59, "setSpeed:", v60);

              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
            }
            while (v55);
          }

          v33 = v86;
        }
        else
        {
          *(float *)&v52 = v35;
          objc_msgSend(v30, "setSpeed:", v52);
        }
        if (v85)
        {
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v69 = v85;
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
          if (v70)
          {
            v71 = v70;
            v72 = *(_QWORD *)v97;
            do
            {
              for (n = 0; n != v71; ++n)
              {
                if (*(_QWORD *)v97 != v72)
                  objc_enumerationMutation(v69);
                objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * n), "layer");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v35;
                *(float *)&v76 = v73;
                objc_msgSend(v75, "setSpeed:", v76);

              }
              v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
            }
            while (v71);
          }

          v33 = v86;
        }
        goto LABEL_79;
      }
    }
    else
    {
      objc_msgSend(v30, "timeOffset");
      v50 = v68;
      if (!v6)
        goto LABEL_48;
    }
    v50 = self->_duration - v50;
    goto LABEL_48;
  }
  if (v7)
  {
    -[UIPercentDrivenInteractiveTransition _continueInterruptibleTransitionFromPercentComplete:reversed:](self, "_continueInterruptibleTransitionFromPercentComplete:reversed:", !v6, a4);
  }
  else if (self->__usesPacedFractionComplete
         && (v23 = objc_opt_respondsToSelector(), interruptibleAnimator = self->_interruptibleAnimator, (v23 & 1) != 0))
  {
    -[UIViewImplicitlyAnimating setPacedFractionComplete:](interruptibleAnimator, "setPacedFractionComplete:", a4);
  }
  else
  {
    -[UIViewImplicitlyAnimating setFractionComplete:](interruptibleAnimator, "setFractionComplete:", a4);
  }
LABEL_81:

}

void __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "_auxContext", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setAlongsideAnimations:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_useAnimatorTrackingToDriveTransition") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("UIViewControllerTransitioning.m"), 819, CFSTR("Unsupported path when one interactor is driving multiple (%lu) transitions."), objc_msgSend(*(id *)(a1 + 40), "count"));

    }
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v3 = v2;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v29;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v29 != v6)
              objc_enumerationMutation(v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v7), "layer");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setTimeOffset:", 0.0);
            LODWORD(v9) = 1.0;
            objc_msgSend(v8, "setSpeed:", v9);

            ++v7;
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v5);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeOffset:", 0.0);

    objc_msgSend(*(id *)(a1 + 56), "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1.0;
    objc_msgSend(v11, "setSpeed:", v12);

    v13 = *(void **)(a1 + 64);
    if (v13)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "layer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setTimeOffset:", 0.0);
            LODWORD(v20) = 1.0;
            objc_msgSend(v19, "setSpeed:", v20);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v16);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 32);
  *(_QWORD *)(v21 + 32) = 0;

}

- (void)_stopInteractiveTransition:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  double v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UIPercentDrivenInteractiveTransition _setTransitionInterrupted:](self, "_setTransitionInterrupted:", 1);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "_setState:", 4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v8);
  }

  if (-[UIPercentDrivenInteractiveTransition _useAnimatorTrackingToDriveTransition](self, "_useAnimatorTrackingToDriveTransition"))
  {
    +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", self->_animationTrackingAnimatorUUID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopAnimation:", 1);
  }
  else
  {
    if (objc_msgSend(v6, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewControllerTransitioning.m"), 860, CFSTR("Unsupported path when one interactor is driving multiple (%lu) transitions."), objc_msgSend(v6, "count"));

    }
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPercentDrivenInteractiveTransition _uuid](self, "_uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _stopAnimationWithUUID:](UIView, "_stopAnimationWithUUID:", v12);
    objc_msgSend(v11, "_containerViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v11, "_containerViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v50 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "layer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v20) = 1.0;
            objc_msgSend(v19, "setSpeed:", v20);
            objc_msgSend(v19, "setTimeOffset:", 0.0);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v16);
      }
    }
    else
    {
      objc_msgSend(v11, "containerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v22) = 1.0;
      objc_msgSend(v14, "setSpeed:", v22);
      objc_msgSend(v14, "setTimeOffset:", 0.0);
    }

    objc_msgSend(v11, "_auxContext");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v11, "_auxContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_alongsideAnimationViews");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v46;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v46 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "layer");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v33) = 1.0;
              objc_msgSend(v32, "setSpeed:", v33);
              objc_msgSend(v32, "setTimeOffset:", 0.0);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
          }
          while (v29);
        }

        objc_msgSend(v11, "_auxContext");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_setAlongsideAnimations:", 0);

      }
    }

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v35 = v6;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v42;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * m), "_stopInteractiveTransition");
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v37);
  }

}

- (void)_stopInteractiveTransition
{
  id v3;

  +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPercentDrivenInteractiveTransition _stopInteractiveTransition:](self, "_stopInteractiveTransition:", v3);

}

- (BOOL)_startInterruptibleTransition:(id)a3
{
  id v5;
  void *v6;
  UIViewImplicitlyAnimating *v7;
  UIViewImplicitlyAnimating *interruptibleAnimator;
  UIViewImplicitlyAnimating *v9;
  int v10;
  UIViewImplicitlyAnimating *v11;
  objc_class *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a3;
  objc_msgSend(v5, "_animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewControllerTransitioning.m"), 904, CFSTR("%@ requires an animator that implements interruptibleAnimatorForTransition:"), v16);

  }
  objc_msgSend(v6, "interruptibleAnimatorForTransition:", v5);
  v7 = (UIViewImplicitlyAnimating *)objc_claimAutoreleasedReturnValue();
  interruptibleAnimator = self->_interruptibleAnimator;
  self->_interruptibleAnimator = v7;

  v9 = self->_interruptibleAnimator;
  if (v9)
  {
    v10 = objc_msgSend(v5, "_initiallyInteractive");
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__UIPercentDrivenInteractiveTransition__startInterruptibleTransition___block_invoke;
    v17[3] = &unk_1E16B3F40;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v5, "_setPostInteractiveCompletionHandler:", v17);
    v11 = self->_interruptibleAnimator;
    if (v10)
      -[UIViewImplicitlyAnimating pauseAnimation](v11, "pauseAnimation");
    else
      -[UIViewImplicitlyAnimating startAnimation](v11, "startAnimation");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[%@ interruptibleAnimatorForTransition:] returned nil. Falling back to old interactive transition logic."), v13);

  }
  return v9 != 0;
}

void __70__UIPercentDrivenInteractiveTransition__startInterruptibleTransition___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)startInteractiveTransition:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  NSUUID *v9;
  NSUUID *animationTrackingAnimatorUUID;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSUUID *v17;
  NSUUID *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  double v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "_animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    objc_msgSend(v6, "transitionDuration:", v5);
    self->_duration = v8;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || !-[UIPercentDrivenInteractiveTransition _startInterruptibleTransition:](self, "_startInterruptibleTransition:", v5))
      {
        if (-[UIPercentDrivenInteractiveTransition _useAnimatorTrackingToDriveTransition](self, "_useAnimatorTrackingToDriveTransition"))
        {
          if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
          {
            +[UIViewPropertyAnimator _currentTrackedAnimationsUUID](UIViewPropertyAnimator, "_currentTrackedAnimationsUUID");
            v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            animationTrackingAnimatorUUID = self->_animationTrackingAnimatorUUID;
            self->_animationTrackingAnimatorUUID = v9;

            if (self->_wantsInteractiveStart
              && !+[UIViewPropertyAnimator _trackedAnimationsStartPaused](UIViewPropertyAnimator, "_trackedAnimationsStartPaused")&& dyld_program_sdk_at_least())
            {
              +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", 1);
              objc_msgSend(v6, "animateTransition:", v5);
              +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", 0);
            }
            else
            {
              objc_msgSend(v6, "animateTransition:", v5);
            }
          }
          else
          {
            +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewControllerTransitioning.m"), 955, CFSTR("Detected animation state before starting interactive transition. This means we MAY need to support implicit start/finish animator tracking."));

            }
            v16 = +[UIViewPropertyAnimator _startTrackingAnimations](UIViewPropertyAnimator, "_startTrackingAnimations");
            +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", self->_wantsInteractiveStart);
            +[UIViewPropertyAnimator _currentTrackedAnimationsUUID](UIViewPropertyAnimator, "_currentTrackedAnimationsUUID");
            v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            v18 = self->_animationTrackingAnimatorUUID;
            self->_animationTrackingAnimatorUUID = v17;

            objc_msgSend(v6, "animateTransition:", v5);
            +[UIViewPropertyAnimator _finishTrackingAnimations](UIViewPropertyAnimator, "_finishTrackingAnimations");
          }
          if (+[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_containsAnimatorForTrackedAnimationsUUID:", self->_animationTrackingAnimatorUUID))
          {
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke;
            v36[3] = &unk_1E16B1B28;
            v36[4] = self;
            objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v36);
          }
          else
          {
            self->_didCommitAnimations = 1;
          }
        }
        else
        {
          objc_msgSend(v5, "_auxContext");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "_auxContext");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_alongsideAnimationViews");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v14 = 0;
          }

          objc_msgSend(v5, "containerView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          +[UIView _enableAnimationTracking](UIView, "_enableAnimationTracking");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPercentDrivenInteractiveTransition _setUuid:](self, "_setUuid:", v21);
          objc_msgSend(v6, "animateTransition:", v5);
          self->_didCommitAnimations = 0;
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke_2;
          v35[3] = &unk_1E16B1B28;
          v35[4] = self;
          objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v35);
          LODWORD(v22) = 0;
          objc_msgSend(v20, "setSpeed:", v22);
          objc_msgSend(v20, "setTimeOffset:", 0.0);
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v23 = v14;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v32 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "layer", (_QWORD)v31);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v29) = 0;
                objc_msgSend(v28, "setSpeed:", v29);
                objc_msgSend(v28, "setTimeOffset:", 0.0);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
            }
            while (v25);
          }

        }
      }
    }
    else
    {
      v11 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempt to start a percent driven interactive transition but there is no animator!"), 0);
    }
  }
  else
  {
    objc_msgSend(v6, "animateTransition:", v5);
  }

}

uint64_t __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 1;
  return result;
}

uint64_t __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = 1;
  return result;
}

- (void)startInteractiveTransition:(id)a3 containerViews:(id)a4 animation:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (-[UIPercentDrivenInteractiveTransition _useAnimatorTrackingToDriveTransition](self, "_useAnimatorTrackingToDriveTransition"))
  {
    -[UIPercentDrivenInteractiveTransition startInteractiveTransition:](self, "startInteractiveTransition:", v8);
  }
  else
  {
    v11 = v8;
    objc_msgSend(v11, "_animator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transitionDuration:", v11);
    self->_duration = v13;
    if (v12)
    {
      objc_msgSend(v11, "_auxContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v11, "_auxContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_alongsideAnimationViews");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = 0;
      }

      objc_msgSend(v11, "_setContainerViews:", v9);
      +[UIView _enableAnimationTracking](UIView, "_enableAnimationTracking");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPercentDrivenInteractiveTransition _setUuid:](self, "_setUuid:");
      v10[2](v10, v11);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = v9;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v38 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "layer", v31);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v23) = 0;
            objc_msgSend(v22, "setSpeed:", v23);
            objc_msgSend(v22, "setTimeOffset:", 0.0);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v19);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v24 = v31;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v34 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "layer", v31);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v30) = 0;
            objc_msgSend(v29, "setSpeed:", v30);
            objc_msgSend(v29, "setTimeOffset:", 0.0);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v26);
      }

    }
    else
    {
      v16 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempt to start a percent driven interactive transition but there is no animator!"), 0);
    }

  }
}

- (void)pauseInteractiveTransition
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_interruptibleAnimator)
  {
    +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_state");

    if (v5 == 1)
    {
      -[UIViewImplicitlyAnimating pauseAnimation](self->_interruptibleAnimator, "pauseAnimation");
      if (dyld_program_sdk_at_least())
        -[UIViewImplicitlyAnimating setReversed:](self->_interruptibleAnimator, "setReversed:", 0);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = v3;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            if (self->__usesPacedFractionComplete && (objc_opt_respondsToSelector() & 1) != 0)
              -[UIViewImplicitlyAnimating pacedFractionComplete](self->_interruptibleAnimator, "pacedFractionComplete");
            else
              -[UIViewImplicitlyAnimating fractionComplete](self->_interruptibleAnimator, "fractionComplete", (_QWORD)v12);
            objc_msgSend(v11, "_setPreviousPercentComplete:", (_QWORD)v12);
            objc_msgSend(v11, "pauseInteractiveTransition");
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
  }
}

- (void)updateInteractiveTransition:(CGFloat)percentComplete
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  CGFloat v18;

  +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_state");

  if (v7 == 1)
  {
    if (-[UIPercentDrivenInteractiveTransition _clampsPercentComplete](self, "_clampsPercentComplete"))
    {
      if (percentComplete < 0.0)
        percentComplete = 0.0;
      if (percentComplete > 1.0)
        percentComplete = 1.0;
    }
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke;
    aBlock[3] = &unk_1E16B1C28;
    aBlock[4] = self;
    v9 = v5;
    v17 = v9;
    v18 = percentComplete;
    v10 = _Block_copy(aBlock);
    v11 = v10;
    if (self->_didCommitAnimations)
    {
      (*((void (**)(void *))v10 + 2))(v10);
    }
    else
    {
      v12 = (void *)UIApp;
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke_2;
      v13[3] = &unk_1E16B1D18;
      v14 = v9;
      v15 = v11;
      objc_msgSend(v12, "_performBlockAfterCATransactionCommits:", v13);

    }
  }

}

void __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "_updateInteractiveTransition:percent:isFinished:didComplete:", *(_QWORD *)(a1 + 40), 0, 0, *(double *)(a1 + 48));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateInteractiveTransition:", *(double *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentlyInteractive");

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cancelInteractiveTransition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_state") == 1)
  {

    goto LABEL_4;
  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_state");

  if (v6 == 4)
  {
LABEL_4:
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_previousPercentComplete");
    -[UIPercentDrivenInteractiveTransition _updateInteractiveTransition:percent:isFinished:didComplete:](self, "_updateInteractiveTransition:percent:isFinished:didComplete:", v3, 1, 0);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "cancelInteractiveTransition", (_QWORD)v18);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v10);
    }
    goto LABEL_19;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "_setState:", 2);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }
LABEL_19:

}

- (void)finishInteractiveTransition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:](_UIViewControllerTransitionContext, "_associatedTransitionContextsForInteractionController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_state") == 1)
  {

    goto LABEL_4;
  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_state");

  if (v6 == 4)
  {
LABEL_4:
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_previousPercentComplete");
    -[UIPercentDrivenInteractiveTransition _updateInteractiveTransition:percent:isFinished:didComplete:](self, "_updateInteractiveTransition:percent:isFinished:didComplete:", v3, 1, 1);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "finishInteractiveTransition", (_QWORD)v18);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v10);
    }
    goto LABEL_19;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "_setState:", 3);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }
LABEL_19:

}

- (void)setCompletionSpeed:(CGFloat)completionSpeed
{
  self->_completionSpeed = completionSpeed;
}

- (UIViewAnimationCurve)completionCurve
{
  return self->_completionCurve;
}

- (void)setCompletionCurve:(UIViewAnimationCurve)completionCurve
{
  self->_completionCurve = completionCurve;
}

- (id)timingCurve
{
  return self->_timingCurve;
}

- (void)setTimingCurve:(id)timingCurve
{
  objc_storeStrong((id *)&self->_timingCurve, timingCurve);
}

- (BOOL)wantsInteractiveStart
{
  return self->_wantsInteractiveStart;
}

- (void)setWantsInteractiveStart:(BOOL)wantsInteractiveStart
{
  self->_wantsInteractiveStart = wantsInteractiveStart;
}

- (NSString)_originalFillMode
{
  return self->__originalFillMode;
}

- (void)_setOriginalFillMode:(id)a3
{
  objc_storeStrong((id *)&self->__originalFillMode, a3);
}

- (NSUUID)_uuid
{
  return self->__uuid;
}

- (void)_setUuid:(id)a3
{
  objc_storeStrong((id *)&self->__uuid, a3);
}

- (BOOL)_isTransitionInterrupted
{
  return self->__transitionInterrupted;
}

- (void)_setTransitionInterrupted:(BOOL)a3
{
  self->__transitionInterrupted = a3;
}

- (BOOL)_usesPacedFractionComplete
{
  return self->__usesPacedFractionComplete;
}

- (void)_setUsesPacedFractionComplete:(BOOL)a3
{
  self->__usesPacedFractionComplete = a3;
}

- (BOOL)_clampsPercentComplete
{
  return self->__clampsPercentComplete;
}

- (void)_setClampsPercentComplete:(BOOL)a3
{
  self->__clampsPercentComplete = a3;
}

@end
