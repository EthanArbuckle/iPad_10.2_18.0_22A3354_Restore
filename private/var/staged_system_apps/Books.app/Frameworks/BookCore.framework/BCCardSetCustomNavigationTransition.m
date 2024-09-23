@implementation BCCardSetCustomNavigationTransition

- (void)animateTransition:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition interruptibleAnimatorForTransition:](self, "interruptibleAnimatorForTransition:", a3));
  objc_msgSend(v3, "startAnimation");

}

- (void)initalizeAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char *v17;
  double MinX;
  CGFloat Width;
  double v20;
  double v21;
  double v22;
  double MinY;
  double v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
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
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double y;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  char *v80;
  void *v81;
  char *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _QWORD v142[5];
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  _QWORD v148[4];
  id v149;
  BCCardSetCustomNavigationTransition *v150;
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _OWORD v158[6];
  _OWORD v159[4];
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition transitioningContext](self, "transitioningContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForKey:", UITransitionContextFromViewKey));
  -[BCCardSetCustomNavigationTransition setFromView:](self, "setFromView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForKey:", UITransitionContextToViewKey));
  -[BCCardSetCustomNavigationTransition setToView:](self, "setToView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  -[BCCardSetCustomNavigationTransition setToViewController:](self, "setToViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  objc_msgSend(v3, "initialFrameForViewController:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[BCCardSetCustomNavigationTransition setOnScreen:](self, "setOnScreen:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  v17 = (char *)objc_msgSend(v16, "layoutDirection");

  v160.origin.x = v9;
  v160.origin.y = v11;
  v160.size.width = v13;
  v160.size.height = v15;
  MinX = CGRectGetMinX(v160);
  v161.origin.x = v9;
  v161.origin.y = v11;
  v161.size.width = v13;
  v161.size.height = v15;
  Width = CGRectGetWidth(v161);
  v20 = MinX - Width + -1.0;
  v21 = MinX + Width + 1.0;
  if (v17 == (_BYTE *)&dword_0 + 1)
    v22 = v20;
  else
    v22 = v21;
  v162.origin.x = v9;
  v162.origin.y = v11;
  v162.size.width = v13;
  v162.size.height = v15;
  MinY = CGRectGetMinY(v162);
  v163.origin.x = v9;
  v163.origin.y = v11;
  v163.size.width = v13;
  v163.size.height = v15;
  v24 = CGRectGetWidth(v163);
  v164.origin.x = v9;
  v164.origin.y = v11;
  v164.size.width = v13;
  v164.size.height = v15;
  -[BCCardSetCustomNavigationTransition setOffScreen:](self, "setOffScreen:", v22, MinY, v24, CGRectGetHeight(v164));
  -[BCCardSetCustomNavigationTransition setSnapshotFrame:](self, "setSnapshotFrame:", v9, v11, v13, v15);
  v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v9, v11, v13, v15);
  -[BCCardSetCustomNavigationTransition setSnapshotContainerView:](self, "setSnapshotContainerView:", v25);

  -[BCCardSetCustomNavigationTransition setup](self, "setup");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toView](self, "toView"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSnapshot](self, "viewToSnapshot"));
  objc_msgSend(v28, "frame");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSnapshot](self, "viewToSnapshot"));
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  v46 = objc_opt_class(UIScrollView);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSnapshot](self, "viewToSnapshot"));
  v48 = BUDynamicCast(v46, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

  objc_msgSend(v49, "contentOffset");
  v51 = v50;
  v53 = v52;
  y = CGPointZero.y;
  objc_msgSend(v49, "setContentOffset:", CGPointZero.x, y);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSnapshot](self, "viewToSnapshot"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "snapshotViewAfterScreenUpdates:", -[BCCardSetCustomNavigationTransition afterScreenUpdates](self, "afterScreenUpdates")));

  v140 = v49;
  objc_msgSend(v49, "setContentOffset:", v51, v53);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSnapshot](self, "viewToSnapshot"));
  objc_msgSend(v57, "setFrame:", v30, v32, v34, v36);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "currentCardViewController"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "auxiliaryNavigationBarView"));
  objc_msgSend(v60, "setHidden:", 1);

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  objc_msgSend(v56, "setBackgroundColor:", v61);

  v141 = v7;
  if (_os_feature_enabled_impl("Books", "unifiedProductPage"))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "auxiliaryNavigationBarViewForAnimation"));
    objc_msgSend(v56, "addSubview:", v62);
    objc_msgSend(v59, "anchorAuxiliaryNavigationBarView:toView:", v62, v56);
  }
  else
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardGripperView cardGripperViewWithStyle:](BCCardGripperView, "cardGripperViewWithStyle:", 0));
    objc_msgSend(v56, "addSubview:", v62);
    objc_msgSend(v59, "anchorGripperView:toView:", v62, v56);
  }
  -[BCCardSetCustomNavigationTransition gripperStartingAlpha](self, "gripperStartingAlpha");
  v139 = v62;
  objc_msgSend(v62, "setAlpha:");
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToHide](self, "viewToHide"));
  objc_msgSend(v63, "setAlpha:", 0.0);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSlide](self, "viewToSlide"));
  v65 = objc_alloc((Class)UIView);
  -[BCCardSetCustomNavigationTransition startingRect](self, "startingRect");
  v66 = objc_msgSend(v65, "initWithFrame:");
  objc_msgSend(v66, "bounds");
  objc_msgSend(v64, "setFrame:");
  v138 = v64;
  objc_msgSend(v66, "addSubview:", v64);
  v67 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v159[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v68 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v159[1] = v67;
  v159[2] = v68;
  objc_msgSend(v56, "setTransform:", v159);
  -[BCCardSetCustomNavigationTransition snapshotAnchorPoint](self, "snapshotAnchorPoint");
  if (v70 != CGPointZero.x || v69 != y)
  {
    -[BCCardSetCustomNavigationTransition snapshotAnchorPoint](self, "snapshotAnchorPoint");
    v72 = v71;
    v74 = v73;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "layer"));
    objc_msgSend(v75, "setAnchorPoint:", v72, v74);

  }
  -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
  objc_msgSend(v56, "setFrame:");
  objc_msgSend(v59, "setRoundedCorners:", 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "cardView"));
  objc_msgSend(v76, "_cornerRadius");
  objc_msgSend(v56, "_setContinuousCornerRadius:");

  objc_msgSend(v56, "setClipsToBounds:", 1);
  -[BCCardSetCustomNavigationTransition startingTransform](self, "startingTransform");
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition snapshotContainerView](self, "snapshotContainerView"));
  v158[0] = v158[3];
  v158[1] = v158[4];
  v158[2] = v158[5];
  objc_msgSend(v77, "setTransform:", v158);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition snapshotContainerView](self, "snapshotContainerView"));
  objc_msgSend(v78, "addSubview:", v56);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v80 = (char *)objc_msgSend(v79, "focusedIndex");

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v82 = (char *)objc_msgSend(v81, "cardCount");

  if (v80)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "cardViewControllerAtIndex:", v80 - 1));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "cardView"));

  }
  else
  {
    v85 = 0;
  }
  if (v80 >= v82)
  {
    v88 = 0;
    if (!v85)
      goto LABEL_18;
    goto LABEL_17;
  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "cardViewControllerAtIndex:", v80 + 1));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "cardView"));

  if (v85)
  {
LABEL_17:
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "snapshotViewAfterScreenUpdates:", -[BCCardSetCustomNavigationTransition afterScreenUpdates](self, "afterScreenUpdates")));
    -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
    v91 = v90;
    v93 = v92;
    v95 = v94;
    v97 = v96;
    -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
    v99 = v98;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    objc_msgSend(v100, "_cardSeparation");
    v102 = v91 - (v99 + v101);

    objc_msgSend(v89, "setFrame:", v102, v93, v95, v97);
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition snapshotContainerView](self, "snapshotContainerView"));
    objc_msgSend(v103, "addSubview:", v89);

  }
LABEL_18:
  v137 = v85;
  if (v88)
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "snapshotViewAfterScreenUpdates:", -[BCCardSetCustomNavigationTransition afterScreenUpdates](self, "afterScreenUpdates")));
    -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
    v106 = v105;
    v108 = v107;
    v110 = v109;
    v112 = v111;
    -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
    v114 = v113;
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    objc_msgSend(v115, "_cardSeparation");
    v117 = v106 + v114 + v116;

    objc_msgSend(v104, "setFrame:", v117, v108, v110, v112);
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition snapshotContainerView](self, "snapshotContainerView"));
    objc_msgSend(v118, "addSubview:", v104);

  }
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "navigationSkrimView"));
  objc_msgSend(v120, "removeFromSuperview");

  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition snapshotContainerView](self, "snapshotContainerView"));
  objc_msgSend(v121, "addSubview:", v122);

  v123 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "navigationSkrimView"));
  objc_msgSend(v121, "addSubview:", v124);

  objc_msgSend(v121, "addSubview:", v66);
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "delegate"));
  v136 = v88;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v126, "cardSetViewController:prepareForNavigationTransitionWithContext:", v127, v3);

  -[BCCardSetCustomNavigationTransition updateAnimator](self, "updateAnimator");
  v157 = 0u;
  v156 = 0u;
  v155 = 0u;
  -[BCCardSetCustomNavigationTransition targetTransform](self, "targetTransform");
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));
  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472;
  v148[2] = sub_9040C;
  v148[3] = &unk_28FC58;
  v129 = v66;
  v149 = v129;
  v150 = self;
  v152 = v155;
  v153 = v156;
  v154 = v157;
  v151 = v139;
  v130 = v139;
  objc_msgSend(v128, "addAnimations:", v148);
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472;
  v142[2] = sub_90480;
  v142[3] = &unk_28FC80;
  v142[4] = self;
  v143 = v121;
  v144 = v138;
  v145 = v129;
  v146 = v3;
  v147 = v59;
  v131 = v59;
  v132 = v3;
  v133 = v129;
  v134 = v138;
  v135 = v121;
  objc_msgSend(v128, "addCompletion:", v142);
  -[BCCardSetCustomNavigationTransition setAnimatorInitialized:](self, "setAnimatorInitialized:", 1);

}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));

  if (!v5)
  {
    -[BCCardSetCustomNavigationTransition setTransitioningContext:](self, "setTransitioningContext:", v4);
    -[BCCardSetCustomNavigationTransition createAnimator](self, "createAnimator");
  }
  if (!-[BCCardSetCustomNavigationTransition animatorInitialized](self, "animatorInitialized"))
    -[BCCardSetCustomNavigationTransition initalizeAnimation](self, "initalizeAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));

  return v6;
}

- (void)createAnimator
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "percentDrivenInteractiveTransition"));
  if (v4)
    v5 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithAnimationCurve:", 3);
  else
    v5 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 250.0, 35.0, 0.0, 0.0);
  v7 = v5;

  v6 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v7, 0.35);
  -[BCCardSetCustomNavigationTransition setAnimator:](self, "setAnimator:", v6);

}

- (double)transitionDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));

  if (!v5)
  {
    -[BCCardSetCustomNavigationTransition setTransitioningContext:](self, "setTransitioningContext:", v4);
    -[BCCardSetCustomNavigationTransition createAnimator](self, "createAnimator");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));
  objc_msgSend(v6, "duration");
  v8 = v7;

  return v8;
}

- (void)updateAnimator
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetCustomNavigationTransition updateAnimator]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v2, 0));

  objc_exception_throw(v3);
}

- (void)animationCompleteWithFinished:(BOOL)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetCustomNavigationTransition animationCompleteWithFinished:]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v3, 0));

  objc_exception_throw(v4);
}

- (void)setup
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetCustomNavigationTransition setup]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v2, 0));

  objc_exception_throw(v3);
}

- (BCCardSetNavigationSource)cardSetViewController
{
  return (BCCardSetNavigationSource *)objc_loadWeakRetained((id *)&self->_cardSetViewController);
}

- (void)setCardSetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cardSetViewController, a3);
}

- (UIViewControllerContextTransitioning)transitioningContext
{
  return self->_transitioningContext;
}

- (void)setTransitioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningContext, a3);
}

- (UIViewPropertyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UIView)toView
{
  return self->_toView;
}

- (void)setToView:(id)a3
{
  objc_storeStrong((id *)&self->_toView, a3);
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
}

- (UIView)fromView
{
  return self->_fromView;
}

- (void)setFromView:(id)a3
{
  objc_storeStrong((id *)&self->_fromView, a3);
}

- (CGRect)onScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_onScreen.origin.x;
  y = self->_onScreen.origin.y;
  width = self->_onScreen.size.width;
  height = self->_onScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOnScreen:(CGRect)a3
{
  self->_onScreen = a3;
}

- (CGRect)offScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_offScreen.origin.x;
  y = self->_offScreen.origin.y;
  width = self->_offScreen.size.width;
  height = self->_offScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOffScreen:(CGRect)a3
{
  self->_offScreen = a3;
}

- (CGRect)snapshotFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshotFrame.origin.x;
  y = self->_snapshotFrame.origin.y;
  width = self->_snapshotFrame.size.width;
  height = self->_snapshotFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSnapshotFrame:(CGRect)a3
{
  self->_snapshotFrame = a3;
}

- (CGPoint)snapshotAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_snapshotAnchorPoint.x;
  y = self->_snapshotAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSnapshotAnchorPoint:(CGPoint)a3
{
  self->_snapshotAnchorPoint = a3;
}

- (UIView)viewToSlide
{
  return self->_viewToSlide;
}

- (void)setViewToSlide:(id)a3
{
  objc_storeStrong((id *)&self->_viewToSlide, a3);
}

- (CGRect)startingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startingRect.origin.x;
  y = self->_startingRect.origin.y;
  width = self->_startingRect.size.width;
  height = self->_startingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStartingRect:(CGRect)a3
{
  self->_startingRect = a3;
}

- (CGRect)endingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endingRect.origin.x;
  y = self->_endingRect.origin.y;
  width = self->_endingRect.size.width;
  height = self->_endingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEndingRect:(CGRect)a3
{
  self->_endingRect = a3;
}

- (UIView)snapshotContainerView
{
  return self->_snapshotContainerView;
}

- (void)setSnapshotContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotContainerView, a3);
}

- (UIView)viewToSnapshot
{
  return self->_viewToSnapshot;
}

- (void)setViewToSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_viewToSnapshot, a3);
}

- (UIView)viewToHide
{
  return self->_viewToHide;
}

- (void)setViewToHide:(id)a3
{
  objc_storeStrong((id *)&self->_viewToHide, a3);
}

- (CGAffineTransform)startingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].tx;
  return self;
}

- (void)setStartingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_startingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_startingTransform.tx = v4;
  *(_OWORD *)&self->_startingTransform.a = v3;
}

- (CGAffineTransform)targetTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].tx;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransform.tx = v4;
  *(_OWORD *)&self->_targetTransform.a = v3;
}

- (double)gripperStartingAlpha
{
  return self->_gripperStartingAlpha;
}

- (void)setGripperStartingAlpha:(double)a3
{
  self->_gripperStartingAlpha = a3;
}

- (double)gripperEndingAlpha
{
  return self->_gripperEndingAlpha;
}

- (void)setGripperEndingAlpha:(double)a3
{
  self->_gripperEndingAlpha = a3;
}

- (BOOL)animatorInitialized
{
  return self->_animatorInitialized;
}

- (void)setAnimatorInitialized:(BOOL)a3
{
  self->_animatorInitialized = a3;
}

- (BOOL)afterScreenUpdates
{
  return self->_afterScreenUpdates;
}

- (void)setAfterScreenUpdates:(BOOL)a3
{
  self->_afterScreenUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewToHide, 0);
  objc_storeStrong((id *)&self->_viewToSnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, 0);
  objc_storeStrong((id *)&self->_viewToSlide, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_toView, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitioningContext, 0);
  objc_destroyWeak((id *)&self->_cardSetViewController);
}

@end
