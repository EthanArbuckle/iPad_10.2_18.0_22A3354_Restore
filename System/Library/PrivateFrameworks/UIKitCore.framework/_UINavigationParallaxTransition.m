@implementation _UINavigationParallaxTransition

- (void)_setShouldReverseLayoutDirection:(BOOL)a3
{
  self->__shouldReverseLayoutDirection = a3;
}

- (_UINavigationParallaxTransition)initWithCurrentOperation:(int64_t)a3
{
  _UINavigationParallaxTransition *v4;
  _UINavigationParallaxTransition *v5;
  _UIParallaxOverlayView *v6;
  UIView *fromOverlayView;
  _UIParallaxOverlayView *v8;
  UIView *toOverlayView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UINavigationParallaxTransition;
  v4 = -[_UINavigationParallaxTransition init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_operation = a3;
    v4->__shouldReverseLayoutDirection = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection") == 1;
    v6 = objc_alloc_init(_UIParallaxOverlayView);
    fromOverlayView = v5->_fromOverlayView;
    v5->_fromOverlayView = &v6->super;

    v8 = objc_alloc_init(_UIParallaxOverlayView);
    toOverlayView = v5->_toOverlayView;
    v5->_toOverlayView = &v8->super;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toOverlayView, 0);
  objc_storeStrong((id *)&self->_fromOverlayView, 0);
  objc_storeStrong((id *)&self->_preemptionHandoffData, 0);
  objc_storeStrong((id *)&self->_overrideDimmingColor, 0);
  objc_storeStrong((id *)&self->_clipUnderView, 0);
  objc_storeStrong((id *)&self->_containerToView, 0);
  objc_storeStrong((id *)&self->_containerFromView, 0);
  objc_storeStrong((id *)&self->_contentDimmingView, 0);
  objc_storeStrong((id *)&self->_borderDimmingView, 0);
  objc_destroyWeak((id *)&self->_interactionController);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutGuideTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_currentTrackingAnimatorsAnimationsUUID, 0);
  objc_storeStrong((id *)&self->_currentRunningAnimationsUUID, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
}

- (id)resizedToContainerView
{
  void *v3;
  int has_internal_diagnostics;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UIView *v9;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(v3, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Container view is expected to be populated at this point", buf, 2u);
      }

    }
  }
  else if (!v5)
  {
    v12 = resizedToContainerView___s_category;
    if (!resizedToContainerView___s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&resizedToContainerView___s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Container view is expected to be populated at this point", v14, 2u);
    }
  }
  objc_msgSend(v3, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");

  -[UIView frame](self->_containerToView, "frame");
  v8 = v7;
  -[UIView frame](self->_containerToView, "frame");
  -[UIView setFrame:](self->_toOverlayView, "setFrame:", v8);
  v9 = self->_toOverlayView;

  return v9;
}

- (id)resizedFromContainerView
{
  void *v3;
  int has_internal_diagnostics;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UIView *v9;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(v3, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Container view is expected to be populated at this point", buf, 2u);
      }

    }
  }
  else if (!v5)
  {
    v12 = resizedFromContainerView___s_category;
    if (!resizedFromContainerView___s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&resizedFromContainerView___s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Container view is expected to be populated at this point", v14, 2u);
    }
  }
  objc_msgSend(v3, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");

  -[UIView frame](self->_containerFromView, "frame");
  v8 = v7;
  -[UIView frame](self->_containerFromView, "frame");
  -[UIView setFrame:](self->_fromOverlayView, "setFrame:", v8);
  v9 = self->_fromOverlayView;

  return v9;
}

+ (void)setDefaultSlidingTransitionDuration:(double)a3
{
  defaultSlidingTransitionDuration = *(_QWORD *)&a3;
}

+ (double)defaultSlidingTransitionDuration
{
  return *(double *)&defaultSlidingTransitionDuration;
}

- (double)transitionDuration:(id)a3
{
  return *(double *)&defaultSlidingTransitionDuration;
}

- (void)animationEnded:(BOOL)a3
{
  _UIViewControllerAnimatedTransitionHandoffData *preemptionHandoffData;
  void *v5;

  preemptionHandoffData = self->_preemptionHandoffData;
  self->_preemptionHandoffData = 0;

  -[_UINavigationParallaxTransition interactionController](self, "interactionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_resetInteractionController");

  -[UIView removeFromSuperview](self->_fromOverlayView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_toOverlayView, "removeFromSuperview");
}

- (double)gapBetweenViews
{
  if (self->_transitionStyle)
    return self->_transitionGap;
  else
    return 0.0;
}

- (double)parallaxOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = 0.7;
  if (self->_transitionStyle)
    v5 = 0.0;
  v6 = round(v4 * v5);

  return v6;
}

- (BOOL)_shouldUseInterruptibleAnimator
{
  return +[UIView _interruptibleParallaxTransitionsEnabled]();
}

- (void)animatePreemptionSnapshotsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  int64_t operation;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _UINavigationParallaxTransition *v26;

  v4 = a3;
  if (self->_preemptionHandoffData)
  {
    -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerAnimatedTransitionHandoffData fromViewControllerHandoffData](self->_preemptionHandoffData, "fromViewControllerHandoffData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v5 || v8 == v6)
      goto LABEL_15;
    -[_UIViewControllerAnimatedTransitionHandoffData fromViewControllerHandoffData](self->_preemptionHandoffData, "fromViewControllerHandoffData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    -[_UIViewControllerAnimatedTransitionHandoffData fromViewControllerHandoffData](self->_preemptionHandoffData, "fromViewControllerHandoffData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v11);

    v15 = -[_UIViewControllerAnimatedTransitionHandoffData isPush](self->_preemptionHandoffData, "isPush");
    operation = self->_operation;
    objc_msgSend(v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15)
    {
      if (operation == 1)
      {
        objc_msgSend(v17, "insertSubview:atIndex:", v13, 0);
LABEL_13:

        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke;
        v24[3] = &unk_1E16B1B50;
        v25 = v13;
        v26 = self;
        v22[0] = v20;
        v22[1] = 3221225472;
        v22[2] = __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke_2;
        v22[3] = &unk_1E16B2588;
        v23 = v25;
        v21 = v25;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v19, 0, v24, v22);

        goto LABEL_14;
      }
    }
    else if (operation == 1)
    {
      objc_msgSend(v17, "insertSubview:belowSubview:", v13, self->_containerToView);
      goto LABEL_13;
    }
    objc_msgSend(v17, "addSubview:", v13);
    goto LABEL_13;
  }
LABEL_16:

}

- (void)animateTransition:(id)a3
{
  void *v3;
  id v4;

  -[_UINavigationParallaxTransition _animateOrCreatePropertyAnimatorForTransition:](self, "_animateOrCreatePropertyAnimatorForTransition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "startAnimation");
    v3 = v4;
  }

}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[_UINavigationParallaxTransition _shouldUseInterruptibleAnimator](self, "_shouldUseInterruptibleAnimator"))
  {
    -[_UINavigationParallaxTransition _animateOrCreatePropertyAnimatorForTransition:](self, "_animateOrCreatePropertyAnimatorForTransition:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_animateOrCreatePropertyAnimatorForTransition:(id)a3
{
  id v4;
  void *v5;
  UIViewImplicitlyAnimating *propertyAnimator;
  UIViewImplicitlyAnimating *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _UIParallaxTransitionCardView *v16;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  UIView *p_super;
  void *v23;
  void *v24;
  _UIParallaxTransitionCardView *v25;
  UIView *v26;
  UIView *containerFromView;
  UIView *v28;
  UIView *containerToView;
  UIView *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  id v61;
  NSUUID *v62;
  id v63;
  id v64;
  NSUUID *currentTrackingAnimatorsAnimationsUUID;
  UIViewPropertyAnimator *v66;
  UIViewPropertyAnimator *v67;
  UIViewImplicitlyAnimating *v68;
  UIViewPropertyAnimator *v69;
  NSUUID *v70;
  uint64_t v71;
  void *v72;
  UIView *v73;
  void *v74;
  void *v75;
  UIView *v76;
  UIView *v77;
  UIViewImplicitlyAnimating *v78;
  id v79;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  UIView *v88;
  UIView *v89;
  UIView *v90;
  void *v91;
  id v92;
  _QWORD v93[5];
  id v94;
  _QWORD v95[5];
  id v96;
  uint64_t v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  UIView *v101;
  id v102;
  _QWORD v103[4];
  UIView *v104;
  _QWORD v105[15];
  _QWORD v106[4];
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  _UINavigationParallaxTransition *v113;
  _QWORD *v114;
  _QWORD *v115;
  _QWORD aBlock[5];
  id v117;
  _QWORD *v118;
  _QWORD *v119;
  _QWORD *v120;
  _QWORD v121[4];
  id v122;
  id v123;
  _UINavigationParallaxTransition *v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  UIView *v130;
  UIView *v131;
  _QWORD *v132;
  _QWORD *v133;
  _QWORD *v134;
  _QWORD *v135;
  _QWORD *v136;
  _QWORD *v137;
  _QWORD *v138;
  _QWORD *v139;
  _QWORD *v140;
  _QWORD *v141;
  _QWORD *v142;
  _QWORD *v143;
  _QWORD *v144;
  _QWORD *v145;
  _QWORD *v146;
  BOOL v147;
  char v148;
  _QWORD v149[4];
  _QWORD v150[4];
  _QWORD v151[4];
  _QWORD v152[4];
  _QWORD v153[4];
  __int128 v154;
  __int128 v155;
  _QWORD v156[4];
  __int128 v157;
  __int128 v158;
  _QWORD v159[4];
  _QWORD v160[4];
  __int128 v161;
  __int128 v162;
  _QWORD v163[4];
  __int128 v164;
  __int128 v165;
  _QWORD v166[4];
  __int128 v167;
  __int128 v168;
  _QWORD v169[4];
  __int128 v170;
  __int128 v171;
  _QWORD v172[4];
  __int128 v173;
  __int128 v174;
  _QWORD v175[4];
  __int128 v176;
  __int128 v177;
  _QWORD v178[5];
  id v179;
  _QWORD v180[5];
  id v181;

  v4 = a3;
  v5 = v4;
  propertyAnimator = self->_propertyAnimator;
  if (propertyAnimator)
  {
    v7 = propertyAnimator;
  }
  else
  {
    v85 = v4;
    v86 = v4;
    -[_UINavigationParallaxTransition setTransitionContext:](self, "setTransitionContext:");
    -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UIView _fluidParallaxTransitionsEnabled]())
    {
      -[_UINavigationParallaxTransition preemptionHandoffData](self, "preemptionHandoffData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handoffDataForViewController:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UINavigationParallaxTransition preemptionHandoffData](self, "preemptionHandoffData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handoffDataForViewController:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "containerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = objc_alloc_init(_UIParallaxTransitionCardView);
      p_super = &v16->super;

      objc_msgSend(v13, "containerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        v25 = v23;
      else
        v25 = objc_alloc_init(_UIParallaxTransitionCardView);
      v26 = &v25->super;

      containerFromView = self->_containerFromView;
      self->_containerFromView = p_super;
      v28 = p_super;

      containerToView = self->_containerToView;
      self->_containerToView = v26;
      v30 = v26;

      -[UIView contentView](v28, "contentView");
      v21 = (UIView *)objc_claimAutoreleasedReturnValue();

      -[UIView contentView](v30, "contentView");
      v89 = (UIView *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = objc_alloc_init(UIView);
      v18 = self->_containerFromView;
      self->_containerFromView = v17;

      v19 = objc_alloc_init(UIView);
      v20 = self->_containerToView;
      self->_containerToView = v19;

      v21 = self->_containerFromView;
      v89 = self->_containerToView;
      v13 = 0;
      v11 = 0;
    }
    -[UIViewControllerContextTransitioning viewForKey:](self->_transitionContext, "viewForKey:", CFSTR("UITransitionContextToView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      objc_msgSend(v9, "view");
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = v33;

    -[UIViewControllerContextTransitioning viewForKey:](self->_transitionContext, "viewForKey:", CFSTR("UITransitionContextFromView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      objc_msgSend(v8, "view");
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v37;
    v91 = v13;

    v180[0] = 0;
    v180[1] = v180;
    v180[2] = 0x3032000000;
    v180[3] = __Block_byref_object_copy__63;
    v180[4] = __Block_byref_object_dispose__63;
    v181 = 0;
    v178[0] = 0;
    v178[1] = v178;
    v178[2] = 0x3032000000;
    v178[3] = __Block_byref_object_copy__63;
    v178[4] = __Block_byref_object_dispose__63;
    v179 = 0;
    -[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v11;
    v175[0] = 0;
    v175[1] = v175;
    v175[2] = 0x4010000000;
    v175[3] = &unk_18685B0AF;
    v176 = 0u;
    v177 = 0u;
    v172[0] = 0;
    v172[1] = v172;
    v172[2] = 0x4010000000;
    v172[3] = &unk_18685B0AF;
    v173 = 0u;
    v174 = 0u;
    v169[0] = 0;
    v169[1] = v169;
    v169[2] = 0x4010000000;
    v169[3] = &unk_18685B0AF;
    v170 = 0u;
    v171 = 0u;
    v166[0] = 0;
    v166[1] = v166;
    v166[2] = 0x4010000000;
    v166[3] = &unk_18685B0AF;
    v167 = 0u;
    v168 = 0u;
    v163[0] = 0;
    v163[1] = v163;
    v163[2] = 0x4010000000;
    v163[3] = &unk_18685B0AF;
    v164 = 0u;
    v165 = 0u;
    v160[0] = 0;
    v160[1] = v160;
    v160[2] = 0x4010000000;
    v160[3] = &unk_18685B0AF;
    v161 = 0u;
    v162 = 0u;
    v159[0] = 0;
    v159[1] = v159;
    v159[2] = 0x2020000000;
    v159[3] = 0;
    v156[0] = 0;
    v156[1] = v156;
    v156[2] = 0x4010000000;
    v156[3] = &unk_18685B0AF;
    v157 = 0u;
    v158 = 0u;
    v153[0] = 0;
    v153[1] = v153;
    v153[2] = 0x4010000000;
    v153[3] = &unk_18685B0AF;
    v154 = 0u;
    v155 = 0u;
    v152[0] = 0;
    v152[1] = v152;
    v152[2] = 0x2020000000;
    v152[3] = 0;
    v151[0] = 0;
    v151[1] = v151;
    v151[2] = 0x2020000000;
    v151[3] = 0;
    v150[0] = 0;
    v150[1] = v150;
    v150[2] = 0x2020000000;
    v150[3] = 0;
    v149[0] = 0;
    v149[1] = v149;
    v149[2] = 0x2020000000;
    v149[3] = 0;
    v41 = -[_UINavigationParallaxTransition _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UIView setBackgroundColor:](self->_containerToView, "setBackgroundColor:", 0);
    -[UIView setBackgroundColor:](self->_containerFromView, "setBackgroundColor:", 0);
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke;
    v121[3] = &unk_1E16C2AF0;
    v42 = v8;
    v122 = v42;
    v43 = v9;
    v123 = v43;
    v124 = self;
    v132 = v156;
    v44 = v38;
    v125 = v44;
    v133 = v153;
    v45 = v34;
    v126 = v45;
    v134 = v169;
    v46 = v39;
    v127 = v46;
    v135 = v172;
    v147 = v41;
    v136 = v159;
    v137 = v166;
    v138 = v175;
    v84 = v40;
    v128 = v84;
    v92 = v91;
    v129 = v92;
    v139 = v152;
    v140 = v151;
    v141 = v150;
    v142 = v149;
    v143 = v180;
    v144 = v178;
    v90 = v89;
    v130 = v90;
    v148 = 0;
    v88 = v21;
    v131 = v88;
    v145 = v163;
    v146 = v160;
    objc_msgSend(v46, "_window");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "windowScene");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v121, v48);

    v49 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_3;
    aBlock[3] = &unk_1E16C2B18;
    aBlock[4] = self;
    v118 = v172;
    v119 = v166;
    v120 = v160;
    v50 = v43;
    v117 = v50;
    v51 = _Block_copy(aBlock);
    v106[0] = v49;
    v106[1] = 3221225472;
    v106[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_5;
    v106[3] = &unk_1E16C2B40;
    v52 = v86;
    v107 = v52;
    v82 = v44;
    v108 = v82;
    v114 = v156;
    v53 = v45;
    v109 = v53;
    v115 = v153;
    v87 = v42;
    v110 = v87;
    v83 = v50;
    v111 = v83;
    v54 = v46;
    v112 = v54;
    v113 = self;
    v55 = _Block_copy(v106);
    if ((objc_msgSend(v52, "isInteractive") & 1) != 0)
      v56 = 3;
    else
      v56 = objc_msgSend(v52, "_completionCurve");
    if (-[_UINavigationParallaxTransition _shouldUseInterruptibleAnimator](self, "_shouldUseInterruptibleAnimator"))
    {
      if (+[UIView _fluidParallaxTransitionsEnabled]())
      {
        if (-[_UIViewControllerAnimatedTransitionHandoffData isPush](self->_preemptionHandoffData, "isPush")
          && self->_operation == 2)
        {
          -[_UIViewControllerAnimatedTransitionHandoffData progressValue](self->_preemptionHandoffData, "progressValue");
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = 1;
        }
        else
        {
          v57 = 0;
          v58 = 0;
        }
        -[_UINavigationParallaxTransition transitionDuration:](self, "transitionDuration:", v52);
        +[UIView _makeHybridPropertyAnimatorWithDuration:progressValue:progressValueReversed:progressValueUpdateReason:springAnimationBehavior:](UIView, "_makeHybridPropertyAnimatorWithDuration:progressValue:progressValueReversed:progressValueUpdateReason:springAnimationBehavior:", v57, v58, 1048616, 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_7;
        v105[3] = &unk_1E16C2B90;
        v105[4] = self;
        v105[5] = v175;
        v105[6] = v172;
        v105[7] = v169;
        v105[8] = v166;
        v105[9] = v163;
        v105[10] = v160;
        v105[11] = v152;
        v105[12] = v151;
        v105[13] = v150;
        v105[14] = v149;
        objc_msgSend(v72, "addInProcessProgressAnimations:", v105);
        v81 = (void *)v57;
        v73 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
        +[UIColor clearColor](UIColor, "clearColor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v73, "setBackgroundColor:", v74);

        objc_msgSend(v52, "containerView");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "insertSubview:atIndex:", v73, 0);

        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_9;
        v103[3] = &unk_1E16B1B28;
        v76 = v73;
        v104 = v76;
        objc_msgSend(v72, "addAnimations:", v103);
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_11;
        v100[3] = &unk_1E16C2BB8;
        v77 = v76;
        v101 = v77;
        v102 = v55;
        objc_msgSend(v72, "addCompletion:", v100);
        v78 = self->_propertyAnimator;
        self->_propertyAnimator = (UIViewImplicitlyAnimating *)v72;
        v79 = v72;

      }
      else
      {
        v66 = [UIViewPropertyAnimator alloc];
        -[_UINavigationParallaxTransition transitionDuration:](self, "transitionDuration:", v52);
        v67 = -[UIViewPropertyAnimator initWithDuration:curve:animations:](v66, "initWithDuration:curve:animations:", v56, 0);
        -[UIViewPropertyAnimator setUserInteractionEnabled:](v67, "setUserInteractionEnabled:", objc_msgSend(v52, "_allowUserInteraction"));
        -[UIViewPropertyAnimator setScrubsLinearly:](v67, "setScrubsLinearly:", 0);
        -[UIViewPropertyAnimator _setShouldLayoutSubviews:](v67, "_setShouldLayoutSubviews:", 0);
        -[UIViewPropertyAnimator _setShouldBeginFromCurrentState:](v67, "_setShouldBeginFromCurrentState:", 0);
        -[UIViewPropertyAnimator addAnimations:](v67, "addAnimations:", v51);
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_12;
        v98[3] = &unk_1E16BDBD8;
        v99 = v55;
        -[UIViewPropertyAnimator addCompletion:](v67, "addCompletion:", v98);
        v68 = self->_propertyAnimator;
        self->_propertyAnimator = (UIViewImplicitlyAnimating *)v67;
        v69 = v67;

      }
    }
    else
    {
      v81 = v52;
      if (objc_msgSend(v52, "_allowUserInteraction"))
        v59 = (v56 << 16) | 2;
      else
        v59 = v56 << 16;
      if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
      {
        v60 = +[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled");
        if (!v60)
        {
          v61 = +[UIViewPropertyAnimator _startTrackingAnimations](UIViewPropertyAnimator, "_startTrackingAnimations");
          +[UIViewPropertyAnimator _setTrackedAnimationsUserInteractionEnabled:](UIViewPropertyAnimator, "_setTrackedAnimationsUserInteractionEnabled:", objc_msgSend(v52, "_allowUserInteraction"));
        }
        +[UIViewPropertyAnimator _currentTrackedAnimationsUUID](UIViewPropertyAnimator, "_currentTrackedAnimationsUUID");
        v62 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        v63 = v54;
        v64 = v53;
        currentTrackingAnimatorsAnimationsUUID = self->_currentTrackingAnimatorsAnimationsUUID;
        self->_currentTrackingAnimatorsAnimationsUUID = v62;
      }
      else
      {
        v60 = +[UIView _isAnimationTracking](UIView, "_isAnimationTracking");
        +[UIView _startAnimationTracking](UIView, "_startAnimationTracking");
        v70 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        v63 = v54;
        v64 = v53;
        currentTrackingAnimatorsAnimationsUUID = self->_currentRunningAnimationsUUID;
        self->_currentRunningAnimationsUUID = v70;
      }

      v71 = MEMORY[0x1E0C809B0];
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_13;
      v95[3] = &unk_1E16C2BE0;
      v95[4] = self;
      v96 = v52;
      v97 = v59;
      v93[0] = v71;
      v93[1] = 3221225472;
      v93[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_15;
      v93[3] = &unk_1E16BC218;
      v93[4] = self;
      v94 = v55;
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", 1, v95, v51, v93);
      v53 = v64;
      v54 = v63;
      if (!v60)
      {
        if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
        {
          +[UIViewPropertyAnimator _finishTrackingAnimations](UIViewPropertyAnimator, "_finishTrackingAnimations");
        }
        else
        {
          +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
        }
      }

    }
    -[_UINavigationParallaxTransition animatePreemptionSnapshotsWithContext:](self, "animatePreemptionSnapshotsWithContext:", v52, v81);
    v7 = self->_propertyAnimator;

    _Block_object_dispose(v149, 8);
    _Block_object_dispose(v150, 8);
    _Block_object_dispose(v151, 8);
    _Block_object_dispose(v152, 8);
    _Block_object_dispose(v153, 8);
    _Block_object_dispose(v156, 8);
    _Block_object_dispose(v159, 8);
    _Block_object_dispose(v160, 8);
    _Block_object_dispose(v163, 8);
    _Block_object_dispose(v166, 8);
    _Block_object_dispose(v169, 8);
    _Block_object_dispose(v172, 8);
    _Block_object_dispose(v175, 8);

    _Block_object_dispose(v178, 8);
    _Block_object_dispose(v180, 8);

    v5 = v85;
  }

  return v7;
}

- (void)_animationWillEnd:(id)a3 didComplete:(BOOL)a4
{
  UIViewImplicitlyAnimating *propertyAnimator;

  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = 0;

}

- (id)shadowContainerForKeyboardTransition:(id)a3
{
  void *v3;
  void *v4;

  if (self->_operation == 2)
    objc_msgSend(a3, "toKeyboard");
  else
    objc_msgSend(a3, "fromKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)resizeShadow:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "frame");
  v5 = v4;
  objc_msgSend(v13, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  v11 = -[_UINavigationParallaxTransition _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v12 = v8 - v5;
  if (v11)
    v12 = 0.0;
  objc_msgSend(v13, "setFrame:", v12, 0.0, v5, v10);

}

- (void)prepareToAnimateKeyboard:(id)a3
{
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
  double v16;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  UIView *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIView *v29;
  void *v30;
  UIView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int64_t operation;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int64_t v66;
  uint64_t v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  _UIInvalidatable *v72;
  _UIInvalidatable *keyboardLayoutGuideTransitionAssertion;
  void *v74;
  _UIVerticalEdgeShadowView *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  id v83;

  v83 = a3;
  objc_msgSend(v83, "fromKeyboardFrame");
  v81 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v83, "toKeyboardFrame");
  v12 = v11;
  v80 = v13;
  v15 = v14;
  v82 = v16;
  v17 = -[_UINavigationParallaxTransition _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v18 = v17;
  v19 = -v15;
  if (v17)
    v20 = v15;
  else
    v20 = -v15;
  if (!v17)
    v19 = v15;
  if (self->_operation == 2)
    v19 = v20;
  v21 = v12 + v19;
  v22 = [UIView alloc];
  objc_msgSend(v83, "fromKeyboard");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v24 = -[UIView initWithFrame:](v22, "initWithFrame:");

  objc_msgSend(v83, "fromKeyboard");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v24);

  objc_msgSend(v83, "fromKeyboard");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v24, "addSubview:", v27);

  objc_msgSend(v83, "fromKeyboard");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrameOrigin:", 0.0, 0.0);

  v29 = [UIView alloc];
  objc_msgSend(v83, "toKeyboard");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frame");
  v31 = -[UIView initWithFrame:](v29, "initWithFrame:");

  objc_msgSend(v83, "toKeyboard");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "superview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v31);

  objc_msgSend(v83, "toKeyboard");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v31, "addSubview:", v34);

  objc_msgSend(v83, "toKeyboard");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrameOrigin:", 0.0, 0.0);

  -[UIView bounds](v31, "bounds");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v78 = v42;
  operation = self->_operation;
  objc_msgSend(v83, "fromKeyboard");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  v79 = v39;
  if (operation == 2)
  {
    if (!v44
      || (objc_msgSend(v83, "toKeyboard"),
          v46 = (void *)objc_claimAutoreleasedReturnValue(),
          v46,
          v45,
          v46))
    {
      objc_msgSend(v83, "toKeyboard");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v77 = 1.0;
        -[_UINavigationParallaxTransition parallaxOffset](self, "parallaxOffset");
        v48 = v6;
        v50 = v49;
        -[_UINavigationParallaxTransition gapBetweenViews](self, "gapBetweenViews");
        v52 = v50 - v51;
        v6 = v48;
        v53 = -0.0;
        if (v18)
          v54 = v52;
        else
          v54 = -0.0;
        v37 = v37 + v54;
        if (!v18)
          v53 = v52;
        v21 = v21 + v53;
        if (v18 && v52 > 0.0)
          v55 = v52;
        else
          v55 = 0.0;
        v41 = v41 - v55;
        v15 = v15 - fmax(v52, 0.0);
        -[UIView setClipsToBounds:](v31, "setClipsToBounds:", 1);
        goto LABEL_28;
      }
    }
    v56 = 1.0;
LABEL_27:
    v77 = v56;
LABEL_28:
    v58 = v83;
    v59 = v80;
    goto LABEL_29;
  }

  if (v45)
  {
    -[UIView setClipsToBounds:](v24, "setClipsToBounds:", 1);
LABEL_26:
    v56 = 0.0;
    goto LABEL_27;
  }
  objc_msgSend(v83, "fromKeyboard");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {

    goto LABEL_26;
  }
  objc_msgSend(v83, "toKeyboard");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v80;
  if (v68)
  {
    v77 = 0.0;
    -[_UINavigationParallaxTransition gapBetweenViews](self, "gapBetweenViews");
    v70 = v37 + v69;
    v71 = v21 + v69;
    if (v18)
      v37 = v70;
    else
      v21 = v71;
  }
  else
  {
    v77 = 0.0;
  }
  v58 = v83;
LABEL_29:
  objc_msgSend(v58, "mainContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "containerView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "window");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v62, "isTrackingKeyboard"))
    goto LABEL_44;
  objc_msgSend(v83, "fromKeyboard");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    objc_msgSend(v83, "toKeyboard");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      v66 = self->_operation;
      if (v66 == 1)
      {
        v67 = 4;
LABEL_42:
        objc_msgSend(v62, "moveKeyboardLayoutGuideOverEdge:layoutViews:", v67, 1);
        goto LABEL_43;
      }
      if (v66 == 2)
      {
        if (v18)
          v67 = 2;
        else
          v67 = 8;
        goto LABEL_42;
      }
    }
  }
LABEL_43:
  objc_msgSend(v62, "_obtainKeyboardLayoutGuideTransitionAssertionForReason:", CFSTR("UINavigationController parallax transition"));
  v72 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
  keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
  self->_keyboardLayoutGuideTransitionAssertion = v72;

LABEL_44:
  -[UIView setFrame:](v24, "setFrame:", v81, v6, v8, v10);
  -[UIView setFrame:](v31, "setFrame:", v21, v59, v15, v82);
  if (v18)
    -[UIView setBounds:](v31, "setBounds:", v37, v79, v41, v78);
  if (!self->_transitionStyle)
  {
    -[_UINavigationParallaxTransition shadowContainerForKeyboardTransition:](self, "shadowContainerForKeyboardTransition:", v83);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      v75 = -[_UIVerticalEdgeShadowView initWithWidth:edge:]([_UIVerticalEdgeShadowView alloc], "initWithWidth:edge:", 2, 9.0);
      -[UIView setOpaque:](v75, "setOpaque:", 0);
      -[UIView setAlpha:](v75, "setAlpha:", v77);
      objc_msgSend(v74, "subviews");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "insertSubview:atIndex:", v75, objc_msgSend(v76, "count"));

      -[_UINavigationParallaxTransition resizeShadow:](self, "resizeShadow:", v75);
    }

  }
}

- (void)animateKeyboard:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
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
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;

  v85 = a3;
  -[_UINavigationParallaxTransition shadowContainerForKeyboardTransition:](self, "shadowContainerForKeyboardTransition:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  v7 = -[_UINavigationParallaxTransition _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(v85, "fromKeyboardFrame");
  v81 = v11;
  v82 = v10;
  v12 = v9;
  v13 = -v9;
  if (v7)
  {
    v9 = -v9;
    v13 = v12;
  }
  if (self->_operation == 2)
    v13 = v9;
  v14 = v8 + v13;
  objc_msgSend(v85, "fromKeyboard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v83 = v18;
  v84 = v17;
  v78 = v20;
  v79 = v19;

  objc_msgSend(v85, "toKeyboardFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v85, "toKeyboard");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v80 = v31;
  v76 = v33;
  v77 = v32;
  v35 = v34;

  if (self->_operation == 2)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
    objc_msgSend(v85, "fromKeyboard");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36
      && (v37 = (void *)v36,
          objc_msgSend(v85, "toKeyboard"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v38,
          v37,
          !v38))
    {
      -[_UINavigationParallaxTransition gapBetweenViews](self, "gapBetweenViews");
      v63 = v84;
      v65 = v84 + v64;
      v66 = v14 + v64;
      if (v7)
        v63 = v65;
      v84 = v63;
      if (!v7)
        v14 = v66;
    }
    else
    {
      objc_msgSend(v85, "toKeyboard");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39 && v7)
      {
        -[_UINavigationParallaxTransition parallaxOffset](self, "parallaxOffset");
        v75 = v22;
        v40 = v24;
        v41 = v26;
        v42 = v28;
        v44 = v43;
        -[_UINavigationParallaxTransition gapBetweenViews](self, "gapBetweenViews");
        v46 = v44 - v45;
        v28 = v42;
        v26 = v41;
        v24 = v40;
        v22 = v75;
        v35 = v35 + v46;
        v80 = 0.0;
      }
    }
  }
  else
  {
    objc_msgSend(v6, "setAlpha:", 1.0);
    objc_msgSend(v85, "fromKeyboard");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      -[_UINavigationParallaxTransition parallaxOffset](self, "parallaxOffset");
      v48 = v22;
      v49 = v24;
      v50 = v26;
      v51 = v28;
      v53 = v52;
      -[_UINavigationParallaxTransition gapBetweenViews](self, "gapBetweenViews");
      v55 = v53 - v54;
      v28 = v51;
      v26 = v50;
      v24 = v49;
      v22 = v48;
      v56 = -0.0;
      if (v7)
        v57 = v55;
      else
        v57 = -0.0;
      v58 = v84 + v57;
      if (!v7)
        v56 = v55;
      v14 = v14 + v56;
      v59 = 0.0;
      if (v7)
        v59 = v55;
      v60 = v83;
      v61 = v83 - v59;
      if (v55 > 0.0)
        v60 = v61;
      v83 = v60;
      v84 = v58;
      if (v55 > 0.0)
        v12 = v12 - v55;
    }
    else
    {
      objc_msgSend(v85, "fromKeyboard");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v62)
      {
        objc_msgSend(v85, "toKeyboard");

      }
    }
  }
  objc_msgSend(v85, "fromKeyboard");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "superview");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFrame:", v14, v82, v12, v81);

  if (v7)
  {
    objc_msgSend(v85, "fromKeyboard");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "superview");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setBounds:", v84, v79, v83, v78);

    objc_msgSend(v85, "toKeyboard");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "superview");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFrame:", v22, v24, v26, v28);

    objc_msgSend(v85, "toKeyboard");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "superview");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setBounds:", v80, v77, v35, v76);
  }
  else
  {
    objc_msgSend(v85, "toKeyboard");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "superview");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", v22, v24, v26, v28);
  }

  -[_UINavigationParallaxTransition resizeShadow:](self, "resizeShadow:", v6);
}

- (void)completeKeyboard:(id)a3
{
  _UIInvalidatable *keyboardLayoutGuideTransitionAssertion;
  _UIInvalidatable *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
  if (keyboardLayoutGuideTransitionAssertion)
  {
    -[_UIInvalidatable _invalidate](keyboardLayoutGuideTransitionAssertion, "_invalidate");
    v5 = self->_keyboardLayoutGuideTransitionAssertion;
    self->_keyboardLayoutGuideTransitionAssertion = 0;

  }
  objc_msgSend(v10, "fromKeyboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(v10, "toKeyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

}

- (void)_stopTransitionImmediately
{
  UIViewImplicitlyAnimating *propertyAnimator;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  propertyAnimator = self->_propertyAnimator;
  if (propertyAnimator)
  {
    -[UIViewImplicitlyAnimating stopAnimation:](propertyAnimator, "stopAnimation:", 0);
    -[UIViewImplicitlyAnimating finishAnimationAtPosition:](self->_propertyAnimator, "finishAnimationAtPosition:", 0);
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[_UINavigationParallaxTransition interactionController](self, "interactionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_parent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "navigationBar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_animationIds");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v4, "addObjectsFromArray:", v9);

      }
      objc_msgSend(v6, "cancelInteractiveTransition");

    }
    if (self->_currentTrackingAnimatorsAnimationsUUID)
      objc_msgSend(v4, "addObject:");
    v18 = v6;
    if (self->_currentRunningAnimationsUUID)
      objc_msgSend(v4, "addObject:", v6);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (+[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_containsAnimatorForTrackedAnimationsUUID:", v15, v18))
          {
            +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stopAnimation:", 0);
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __61___UINavigationParallaxTransition__stopTransitionImmediately__block_invoke;
            v19[3] = &unk_1E16B1B28;
            v20 = v16;
            v17 = v16;
            +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v19);

          }
          else
          {
            +[UIView _stopAnimationWithUUID:](UIView, "_stopAnimationWithUUID:", v15);
            +[UIView _finalizeStoppedAnimationWithUUID:reverseAnimation:state:performCompletionsImmediately:](UIView, "_finalizeStoppedAnimationWithUUID:reverseAnimation:state:performCompletionsImmediately:", v15, 0, 0, 1);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

  }
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (_UINavigationInteractiveTransitionBase)interactionController
{
  return (_UINavigationInteractiveTransitionBase *)objc_loadWeakRetained((id *)&self->_interactionController);
}

- (void)setInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_interactionController, a3);
}

- (_UIParallaxDimmingView)borderDimmingView
{
  return self->_borderDimmingView;
}

- (void)setBorderDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_borderDimmingView, a3);
}

- (_UIParallaxDimmingView)contentDimmingView
{
  return self->_contentDimmingView;
}

- (void)setContentDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_contentDimmingView, a3);
}

- (UIView)containerFromView
{
  return self->_containerFromView;
}

- (void)setContainerFromView:(id)a3
{
  objc_storeStrong((id *)&self->_containerFromView, a3);
}

- (UIView)containerToView
{
  return self->_containerToView;
}

- (void)setContainerToView:(id)a3
{
  objc_storeStrong((id *)&self->_containerToView, a3);
}

- (UIView)clipUnderView
{
  return self->_clipUnderView;
}

- (void)setClipUnderView:(id)a3
{
  objc_storeStrong((id *)&self->_clipUnderView, a3);
}

- (BOOL)clipUnderlapWhileTransitioning
{
  return self->_clipUnderlapWhileTransitioning;
}

- (void)setClipUnderlapWhileTransitioning:(BOOL)a3
{
  self->_clipUnderlapWhileTransitioning = a3;
}

- (int64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (double)transitionGap
{
  return self->_transitionGap;
}

- (void)setTransitionGap:(double)a3
{
  self->_transitionGap = a3;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return self->__shouldReverseLayoutDirection;
}

- (UIColor)overrideDimmingColor
{
  return self->_overrideDimmingColor;
}

- (void)setOverrideDimmingColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDimmingColor, a3);
}

- (_UIViewControllerAnimatedTransitionHandoffData)preemptionHandoffData
{
  return self->_preemptionHandoffData;
}

- (void)setPreemptionHandoffData:(id)a3
{
  objc_storeStrong((id *)&self->_preemptionHandoffData, a3);
}

- (UIView)fromOverlayView
{
  return self->_fromOverlayView;
}

- (void)setFromOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_fromOverlayView, a3);
}

- (UIView)toOverlayView
{
  return self->_toOverlayView;
}

- (void)setToOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_toOverlayView, a3);
}

- (BOOL)shouldPreemptWithContext:(id)a3
{
  return +[UIView _fluidParallaxTransitionsEnabled]();
}

- (id)preemptWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t operation;
  double v8;
  double v9;
  double v10;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v11;
  UIView *containerFromView;
  void *v13;
  void *v14;
  void *v15;
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
  double v28;
  double v29;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v30;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v31;
  UIView *containerToView;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v47;
  void *v48;
  _UIViewControllerAnimatedTransitionHandoffData *v49;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextFromViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  operation = self->_operation;
  -[_UIParallaxDimmingView presentationDimmingAmount](self->_contentDimmingView, "presentationDimmingAmount");
  if (operation == 2)
    v9 = v8;
  else
    v9 = 0.0;
  if (operation == 2)
    v10 = 0.0;
  else
    v10 = v8;
  v11 = [_UIViewControllerAnimatedTransitionViewControllerHandoffData alloc];
  containerFromView = self->_containerFromView;
  -[UIView snapshotViewAfterScreenUpdates:](containerFromView, "snapshotViewAfterScreenUpdates:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_containerFromView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentationLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UIView frame](self->_containerFromView, "frame");
  v28 = v27;
  v29 = 1.0;
  if (self->_operation != 2)
    v29 = 0.0;
  v30 = -[_UIViewControllerAnimatedTransitionViewControllerHandoffData initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:](v11, "initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:", v5, containerFromView, v13, v17, v19, v21, v23, v28, v24, v25, v26, *(_QWORD *)&v10, *(_QWORD *)&v29);

  v31 = [_UIViewControllerAnimatedTransitionViewControllerHandoffData alloc];
  containerToView = self->_containerToView;
  -[UIView layer](containerToView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presentationLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[UIView frame](self->_containerToView, "frame");
  v47 = -[_UIViewControllerAnimatedTransitionViewControllerHandoffData initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:](v31, "initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:", v6, containerToView, 0, v36, v38, v40, v42, v43, v44, v45, v46, *(_QWORD *)&v9, 0);

  v48 = 0;
  if (-[UIViewImplicitlyAnimating conformsToProtocol:](self->_propertyAnimator, "conformsToProtocol:", &unk_1EDE00E80))
  {
    -[UIViewImplicitlyAnimating progressValue](self->_propertyAnimator, "progressValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_UINavigationParallaxTransition _stopTransitionImmediately](self, "_stopTransitionImmediately");
  v49 = -[_UIViewControllerAnimatedTransitionHandoffData initWithFromViewControllerHandoffData:toViewControllerHandoffData:progressValue:isPush:]([_UIViewControllerAnimatedTransitionHandoffData alloc], "initWithFromViewControllerHandoffData:toViewControllerHandoffData:progressValue:isPush:", v30, v47, v48, self->_operation == 1);

  return v49;
}

- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4
{
  objc_storeStrong((id *)&self->_preemptionHandoffData, a4);
}

@end
