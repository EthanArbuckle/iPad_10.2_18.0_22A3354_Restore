@implementation BKMinibarRevealAnimator

- (BKMinibarRevealAnimator)initWithOpening:(BOOL)a3
{
  BKMinibarRevealAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKMinibarRevealAnimator;
  result = -[BKMinibarRevealAnimator init](&v5, "init");
  if (result)
    result->_opening = a3;
  return result;
}

- (double)duration
{
  unsigned int v2;
  double result;

  v2 = -[BKMinibarRevealAnimator interactive](self, "interactive");
  result = 0.7;
  if (!v2)
    return 0.5;
  return result;
}

- (void)_loadStateFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BKMinibarRevealAnimator setTransitionContext:](self, "setTransitionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  -[BKMinibarRevealAnimator setFromViewController:](self, "setFromViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  -[BKMinibarRevealAnimator setToViewController:](self, "setToViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  -[BKMinibarRevealAnimator setContainerView:](self, "setContainerView:", v7);

  v8 = objc_msgSend(v4, "isInteractive");
  -[BKMinibarRevealAnimator setInteractive:](self, "setInteractive:", v8);
}

- (double)transitionDuration:(id)a3
{
  double result;

  -[BKMinibarRevealAnimator _loadStateFromContext:](self, "_loadStateFromContext:", a3);
  -[BKMinibarRevealAnimator duration](self, "duration");
  return result;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double MaxY;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  CGFloat Height;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  CGFloat v76;
  CGFloat v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD v118[13];
  _QWORD v119[5];
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  -[BKMinibarRevealAnimator _loadStateFromContext:](self, "_loadStateFromContext:", a3);
  -[BKMinibarRevealAnimator _setupViews](self, "_setupViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator tabBarView](self, "tabBarView"));
  objc_msgSend(v4, "frame");
  v115 = v5;
  v116 = v6;
  v8 = v7;
  v117 = v9;

  if (-[BKMinibarRevealAnimator opening](self, "opening"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarView](self, "minibarView"));
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
    objc_msgSend(v19, "bounds");
    v113 = v21;
    v114 = v20;
    v23 = v22;
    v25 = v24;

    v120.origin.x = v12;
    v120.origin.y = v14;
    v120.size.width = v16;
    v120.size.height = v18;
    v112 = v23 - CGRectGetHeight(v120);
    v121.origin.x = v12;
    v121.origin.y = v14;
    v121.size.width = v16;
    v121.size.height = v18;
    v26 = v25 + CGRectGetHeight(v121);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
    objc_msgSend(v27, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarView](self, "minibarView"));
    objc_msgSend(v34, "frame");
    MaxY = CGRectGetMaxY(v122);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
    objc_msgSend(v36, "setFrame:", v29, MaxY, v31, v33);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator blackBottomView](self, "blackBottomView"));
    objc_msgSend(v37, "frame");
    v39 = v38;
    v41 = v40;
    v43 = v42;

    v123.origin.x = v29;
    v123.origin.y = MaxY;
    v123.size.width = v31;
    v123.size.height = v33;
    v44 = CGRectGetMaxY(v123);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator blackBottomView](self, "blackBottomView"));
    objc_msgSend(v45, "setFrame:", v39, v44, v41, v43);

    v124.origin.x = v39;
    v124.origin.y = v44;
    v124.size.width = v41;
    v124.size.height = v43;
    v46 = v26 + CGRectGetHeight(v124);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
    objc_msgSend(v47, "bounds");
    Height = CGRectGetHeight(v125);
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minifiedBarAnimator](self, "minifiedBarAnimator"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
    objc_msgSend(v49, "minifiedBarAnimatorAnimateShowIfNeededToViewController:force:", v50, 1);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minifiedBarAnimator](self, "minifiedBarAnimator"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "minifiedBarAnimatorContainerView"));
    objc_msgSend(v52, "frame");
    v113 = v54;
    v114 = v53;
    v112 = v55;
    v110 = v56;

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
    objc_msgSend(v57, "frame");
    v111 = v8;
    v59 = v58;
    v109 = v60;
    v62 = v61;
    v64 = v63;

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarView](self, "minibarView"));
    objc_msgSend(v65, "frame");
    v67 = v66;
    v106 = v68;
    v107 = v66;
    v69 = v68;
    v71 = v70;

    v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarView](self, "minibarView"));
    objc_msgSend(v72, "setFrame:", v67, 0.0, v69, v71);

    v126.origin.y = 0.0;
    v126.origin.x = v67;
    v126.size.width = v69;
    v126.size.height = v71;
    v73 = CGRectGetHeight(v126);
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
    v108 = v59;
    v75 = v62;
    v76 = v62;
    v104 = v64;
    v105 = v62;
    v77 = v64;
    objc_msgSend(v74, "setFrame:", v59, v73, v75, v64);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator blackBottomView](self, "blackBottomView"));
    objc_msgSend(v78, "frame");
    v80 = v79;
    v82 = v81;
    v84 = v83;

    v127.origin.x = v59;
    v127.origin.y = v73;
    v127.size.width = v76;
    v127.size.height = v77;
    v85 = CGRectGetMaxY(v127);
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator blackBottomView](self, "blackBottomView"));
    v87 = v82;
    objc_msgSend(v86, "setFrame:", v80, v85, v82, v84);

    v128.origin.y = 0.0;
    v128.origin.x = v107;
    v128.size.width = v106;
    v128.size.height = v71;
    v88 = v109 - CGRectGetHeight(v128);
    v129.origin.y = 0.0;
    v129.origin.x = v107;
    v129.size.width = v106;
    v129.size.height = v71;
    v89 = v104 + CGRectGetHeight(v129);
    v130.origin.x = v80;
    v130.origin.y = v85;
    v130.size.width = v87;
    v130.size.height = v84;
    v90 = v89 + CGRectGetHeight(v130);
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
    objc_msgSend(v91, "setFrame:", v108, v88, v105, v90);

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator tabBarView](self, "tabBarView"));
    objc_msgSend(v92, "frame");
    v94 = v93;
    v96 = v95;
    v98 = v97;

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
    objc_msgSend(v99, "bounds");
    v100 = CGRectGetHeight(v131);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator tabBarView](self, "tabBarView"));
    v101 = v96;
    v102 = v98;
    v46 = v110;
    Height = v111;
    objc_msgSend(v47, "setFrame:", v94, v100, v101, v102);
  }

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_10009758C;
  v119[3] = &unk_1008E77C8;
  v119[4] = self;
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[IMAnimationTracker animationTrackerWithCompletion:](IMAnimationTracker, "animationTrackerWithCompletion:", v119));
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_1000975F4;
  v118[3] = &unk_1008E8478;
  v118[4] = self;
  v118[5] = v114;
  *(double *)&v118[6] = v112;
  v118[7] = v113;
  *(double *)&v118[8] = v46;
  v118[9] = v115;
  *(CGFloat *)&v118[10] = Height;
  v118[11] = v117;
  v118[12] = v116;
  objc_msgSend(v103, "addAnimationWithBlock:", v118);

}

- (void)_animationDidFinish
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
  v4 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetPresenting, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue(v4);

  if ((objc_opt_respondsToSelector(v8, "transitionContextWillCompleteTransitionInContainerView:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
    objc_msgSend(v8, "transitionContextWillCompleteTransitionInContainerView:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator transitionContext](self, "transitionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator transitionContext](self, "transitionContext"));
  objc_msgSend(v6, "completeTransition:", objc_msgSend(v7, "transitionWasCancelled") ^ 1);

}

- (void)animationEnded:(BOOL)a3
{
  -[BKMinibarRevealAnimator _teardownViews:](self, "_teardownViews:", a3);
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  if (-[BKMinibarRevealAnimator opening](self, "opening"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator fromViewController](self, "fromViewController"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  -[BKMinibarRevealAnimator setContentView:](self, "setContentView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMViewState saveStateForView:flags:](IMViewState, "saveStateForView:flags:", v6, 8));
  -[BKMinibarRevealAnimator setContentViewState:](self, "setContentViewState:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
  objc_msgSend(v8, "setAutoresizingMask:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v45 = (id)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minifiedBarAnimator](self, "minifiedBarAnimator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "minifiedBarAnimatorContainerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "minifiedBarAnimatorMinibarView"));
  -[BKMinibarRevealAnimator setMinibarView:](self, "setMinibarView:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarView](self, "minibarView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMViewState saveStateForView:flags:](IMViewState, "saveStateForView:flags:", v21, 1));
  -[BKMinibarRevealAnimator setMinibarViewState:](self, "setMinibarViewState:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "minifiedBarAnimatorTabBarView"));
  -[BKMinibarRevealAnimator setTabBarView:](self, "setTabBarView:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator tabBarView](self, "tabBarView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMViewState saveStateForView:flags:](IMViewState, "saveStateForView:flags:", v24, 16));
  -[BKMinibarRevealAnimator setTabBarViewState:](self, "setTabBarViewState:", v25);

  v26 = objc_alloc((Class)UIView);
  objc_msgSend(v19, "frame");
  v27 = objc_msgSend(v26, "initWithFrame:");
  -[BKMinibarRevealAnimator setClipView:](self, "setClipView:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
  objc_msgSend(v28, "setClipsToBounds:", 1);

  if (!-[BKMinibarRevealAnimator opening](self, "opening"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
    objc_msgSend(v29, "addSubview:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
  objc_msgSend(v32, "addSubview:", v33);

  v34 = objc_alloc((Class)UIView);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
  objc_msgSend(v35, "frame");
  v36 = objc_msgSend(v34, "initWithFrame:", 0.0, 0.0);
  -[BKMinibarRevealAnimator setBlackBottomView:](self, "setBlackBottomView:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator blackBottomView](self, "blackBottomView"));
  objc_msgSend(v38, "setBackgroundColor:", v37);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarView](self, "minibarView"));
  objc_msgSend(v39, "addSubview:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
  objc_msgSend(v41, "addSubview:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator blackBottomView](self, "blackBottomView"));
  objc_msgSend(v43, "addSubview:", v44);

}

- (void)_teardownViews:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentViewState](self, "contentViewState"));
  objc_msgSend(v5, "restore");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator minibarViewState](self, "minibarViewState"));
  objc_msgSend(v6, "restore");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator tabBarViewState](self, "tabBarViewState"));
  objc_msgSend(v7, "restore");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator contentView](self, "contentView"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator containerView](self, "containerView"));
  if (v3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    objc_msgSend(v18, "addSubview:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator fromViewController](self, "fromViewController"));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator fromViewController](self, "fromViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
    objc_msgSend(v18, "addSubview:", v23);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
  }
  v24 = v21;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v25, "removeFromSuperview");

  v26 = (id)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator clipView](self, "clipView"));
  objc_msgSend(v26, "removeFromSuperview");

}

- (id)minifiedBarAnimator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMinibarRevealAnimator toViewController](self, "toViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKMinifiedBarAnimating));

  return v3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (void)setFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewController, a3);
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)opening
{
  return self->_opening;
}

- (void)setOpening:(BOOL)a3
{
  self->_opening = a3;
}

- (IMViewState)minibarViewState
{
  return self->_minibarViewState;
}

- (void)setMinibarViewState:(id)a3
{
  objc_storeStrong((id *)&self->_minibarViewState, a3);
}

- (IMViewState)contentViewState
{
  return self->_contentViewState;
}

- (void)setContentViewState:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewState, a3);
}

- (IMViewState)tabBarViewState
{
  return self->_tabBarViewState;
}

- (void)setTabBarViewState:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarViewState, a3);
}

- (UIView)clipView
{
  return self->_clipView;
}

- (void)setClipView:(id)a3
{
  objc_storeStrong((id *)&self->_clipView, a3);
}

- (UIView)minibarView
{
  return self->_minibarView;
}

- (void)setMinibarView:(id)a3
{
  objc_storeStrong((id *)&self->_minibarView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)tabBarView
{
  return self->_tabBarView;
}

- (void)setTabBarView:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarView, a3);
}

- (UIView)blackBottomView
{
  return self->_blackBottomView;
}

- (void)setBlackBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_blackBottomView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blackBottomView, 0);
  objc_storeStrong((id *)&self->_tabBarView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_minibarView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_storeStrong((id *)&self->_tabBarViewState, 0);
  objc_storeStrong((id *)&self->_contentViewState, 0);
  objc_storeStrong((id *)&self->_minibarViewState, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
