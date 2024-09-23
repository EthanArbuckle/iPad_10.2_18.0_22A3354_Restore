@implementation BCCardStackTransitionAnimator

- (BCCardStackTransitionAnimator)initWithType:(int64_t)a3 allowsCardExpansion:(BOOL)a4
{
  BCCardStackTransitionAnimator *v6;
  BCCardStackTransitionAnimator *v7;
  NSMutableArray *v8;
  NSMutableArray *additionalAnimations;
  uint64_t v10;
  NSMutableArray *viewsToBeCleanedUp;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BCCardStackTransitionAnimator;
  v6 = -[BCCardStackTransitionAnimator init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    v6->_animationType = a3;
    v8 = objc_opt_new(NSMutableArray);
    additionalAnimations = v7->_additionalAnimations;
    v7->_additionalAnimations = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    viewsToBeCleanedUp = v7->_viewsToBeCleanedUp;
    v7->_viewsToBeCleanedUp = (NSMutableArray *)v10;

    v7->_cardsCanExpand = a4;
  }
  return v7;
}

- (void)addAnimations:(id)a3
{
  NSMutableArray *additionalAnimations;
  id v4;

  additionalAnimations = self->_additionalAnimations;
  v4 = objc_retainBlock(a3);
  -[NSMutableArray addObject:](additionalAnimations, "addObject:", v4);

}

- (double)transitionDuration:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v4 = a3;
  if (-[BCCardStackTransitionAnimator _prefersCrossfade](self, "_prefersCrossfade"))
  {
    -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.3);
    v6 = v5;
  }
  else
  {
    switch(self->_animationType)
    {
      case 0:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _cardSlideUpSpring](self, "_cardSlideUpSpring"));
        goto LABEL_8;
      case 1:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverSpring](self, "_coverSpring"));
        goto LABEL_8;
      case 2:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _cardSlideDownSpringWithVelocity:](self, "_cardSlideDownSpringWithVelocity:", 0.0, 0.0));
LABEL_8:
        v8 = v7;
        objc_msgSend(v7, "settlingDuration");
        v6 = v9;

        break;
      case 3:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](self, "_coverSpringForDismissWithVelocity:isCompact:", objc_msgSend(v10, "im_isCompactWidth"), 0.0, 0.0));
        objc_msgSend(v11, "settlingDuration");
        v6 = v12;

        break;
      default:
        v6 = 0.0;
        break;
    }
  }

  return v6;
}

- (void)animateTransition:(id)a3
{
  unsigned int v4;
  id v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  switch(self->_animationType)
  {
    case 0:
      v4 = -[BCCardStackTransitionAnimator _prefersCrossfade](self, "_prefersCrossfade");
      v5 = v8;
      if (v4)
        goto LABEL_9;
      -[BCCardStackTransitionAnimator _animatePushBySliding:](self, "_animatePushBySliding:", v8);
      break;
    case 1:
      v6 = -[BCCardStackTransitionAnimator _prefersCrossfade](self, "_prefersCrossfade");
      v5 = v8;
      if (v6)
LABEL_9:
        -[BCCardStackTransitionAnimator _animatePushByCrossfading:](self, "_animatePushByCrossfading:", v5);
      else
        -[BCCardStackTransitionAnimator _animatePushByCoverTransitioning:](self, "_animatePushByCoverTransitioning:", v8);
      break;
    case 2:
      if (-[BCCardStackTransitionAnimator _prefersCrossfade](self, "_prefersCrossfade"))
        goto LABEL_7;
      -[BCCardStackTransitionAnimator _animatePopBySliding:](self, "_animatePopBySliding:", v8);
      break;
    case 3:
      if (-[BCCardStackTransitionAnimator _prefersCrossfade](self, "_prefersCrossfade"))
LABEL_7:
        -[BCCardStackTransitionAnimator _animatePopByCrossfading:](self, "_animatePopByCrossfading:", v8);
      else
        -[BCCardStackTransitionAnimator _animatePopByCoverTransitioning:](self, "_animatePopByCoverTransitioning:", v8);
      break;
    default:
      break;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("BCCardStackTransitionTestAnimationWillBeginNotification"), self);

}

- (void)animationEnded:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator viewsToBeCleanedUp](self, "viewsToBeCleanedUp", a3, 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "removeFromSuperview");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator viewsToBeCleanedUp](self, "viewsToBeCleanedUp"));
  objc_msgSend(v9, "removeAllObjects");

  -[BCCardStackTransitionAnimator setCoverControllers:](self, "setCoverControllers:", 0);
}

- (BOOL)_prefersCrossfade
{
  return -[BCCardStackTransitionAnimator prefersCrossfade](self, "prefersCrossfade")
      || UIAccessibilityIsReduceMotionEnabled();
}

- (void)_animatePushBySliding:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  BCViewPropertyAnimatorCounter *v22;
  id v23;
  id v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  double v36;
  double v37;
  NSMutableArray *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  id v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _BYTE v60[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextBackgroundViewKey")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextTitleLabelKey")));
  if (self->_cardsCanExpand || !v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    objc_msgSend(v9, "addSubview:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    objc_msgSend(v10, "addSubview:", v8);

  }
  v46 = v6;
  if (objc_msgSend(v6, "expanded"))
  {
    objc_msgSend(v7, "setAlpha:", 0.0);
    objc_msgSend(v8, "setAlpha:", 0.0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(v4, "initialFrameForViewController:", v5);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_A320C;
  v58[3] = &unk_28B960;
  v23 = v4;
  v59 = v23;
  -[BCViewPropertyAnimatorCounter setAnimationDidEnd:](v22, "setAnimationDidEnd:", v58);
  v24 = objc_alloc((Class)UIViewPropertyAnimator);
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.13);
  v26 = v25;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_A3218;
  v56[3] = &unk_28B960;
  v45 = v7;
  v57 = v45;
  v44 = objc_msgSend(v24, "initWithDuration:curve:animations:", 0, v56, v26);
  -[BCViewPropertyAnimatorCounter animate:](v22, "animate:");
  v27 = objc_alloc((Class)UIViewPropertyAnimator);
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.18);
  v29 = v28;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_A3224;
  v54[3] = &unk_28B960;
  v43 = v8;
  v55 = v43;
  v30 = objc_msgSend(v27, "initWithDuration:curve:animations:", 0, v54, v29);
  -[BCViewPropertyAnimatorCounter animate:](v22, "animate:", v30);
  v31 = objc_alloc((Class)UIViewPropertyAnimator);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _cardSlideUpSpring](self, "_cardSlideUpSpring"));
  v33 = objc_msgSend(v31, "initWithDuration:timingParameters:", v32, 0.0);

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_A3230;
  v51[3] = &unk_28B808;
  v34 = v5;
  v52 = v34;
  v35 = v23;
  v53 = v35;
  objc_msgSend(v33, "addAnimations:", v51);
  -[BCViewPropertyAnimatorCounter animate:](v22, "animate:", v33);
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.5);
  v37 = v36;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = self->_additionalAnimations;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v38);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i) + 16))(v37);
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v40);
  }

}

- (id)_cardSlideDownSpringWithVelocity:(CGVector)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 350.0, 30.0, a3.dx, a3.dy);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _adjustSpring:](self, "_adjustSpring:", v4));

  return v5;
}

- (CGAffineTransform)_translationForTitleLabel:(SEL)a3 cardSuperview:(id)a4 cardCurrentFrame:(id)a5 cardTargetFrame:(CGRect)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  id v13;
  id v14;
  uint64_t v15;
  double CenterNoRounding;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MidX;
  double MinY;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGAffineTransform *result;
  double x;
  double v47;
  double v48;
  double y;
  double width;
  double height;
  id v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  width = a7.size.width;
  height = a7.size.height;
  y = a7.origin.y;
  x = a7.origin.x;
  v7 = a6.size.height;
  v8 = a6.size.width;
  v9 = a6.origin.y;
  v10 = a6.origin.x;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v14, "frame");
  v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));

  CenterNoRounding = CGRectGetCenterNoRounding(v15);
  v47 = v17;
  v48 = CenterNoRounding;
  objc_msgSend(v52, "convertRect:fromView:", v13, v10, v9, v8, v7);
  v18 = v53.origin.x;
  v19 = v53.origin.y;
  v20 = v53.size.width;
  v21 = v53.size.height;
  MidX = CGRectGetMidX(v53);
  v54.origin.x = v18;
  v54.origin.y = v19;
  v54.size.width = v20;
  v54.size.height = v21;
  MinY = CGRectGetMinY(v54);
  v25 = CGRectGetCenterNoRounding(v24);
  v27 = CGPointSubtract(v25, v26, MidX, MinY);
  v29 = v28;
  objc_msgSend(v52, "convertRect:fromView:", v13, x, y, width, height);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v55.origin.x = v31;
  v55.origin.y = v33;
  v55.size.width = v35;
  v55.size.height = v37;
  v38 = CGRectGetMidX(v55);
  v56.origin.x = v31;
  v56.origin.y = v33;
  v56.size.width = v35;
  v56.size.height = v37;
  v39 = CGRectGetMinY(v56);
  v41 = CGPointAdd(v40, v38, v39, v27, v29);
  v43 = CGPointSubtract(v41, v42, v48, v47);
  CGAffineTransformMakeTranslation(retstr, v43, v44);

  return result;
}

- (void)_animatePopBySliding:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v8;
  void *v9;
  __int128 v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  CGFloat v31;
  double x;
  double y;
  double width;
  double height;
  uint64_t v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BCViewPropertyAnimatorCounter *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  double v55;
  double v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  void *k;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  double v73;
  double v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  void *m;
  NSMutableArray *v81;
  id v82;
  id v83;
  uint64_t v84;
  void *n;
  id v86;
  id v87;
  void *v88;
  BCViewPropertyAnimatorCounter *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  id v98;
  _BOOL4 v99;
  id obj;
  id obja;
  double MaxY;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[5];
  id v123;
  CGAffineTransform v124;
  BOOL v125;
  _QWORD v126[4];
  id v127;
  id v128;
  id v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  CGAffineTransform v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextBackgroundViewKey")));
  obj = v4;
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextTitleLabelKey")));
  v90 = (void *)v6;
  v8 = self->_cardsCanExpand || v6 == 0;
  v99 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v9, "bounds");
  MaxY = CGRectGetMaxY(v148);

  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v142.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v142.c = v10;
  *(_OWORD *)&v142.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator cardSlideItems](self, "cardSlideItems"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v139;
    v95 = 0.0;
    v97 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v139 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "card"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cardStackTransitioningCardView"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "superview"));
        -[BCCardStackTransitionAnimator _clearTranslationForView:](self, "_clearTranslationForView:", v18);
        objc_msgSend(v18, "frame");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
        objc_msgSend(v19, "convertPoint:fromView:", v28, 0.0, MaxY);
        v30 = v29;

        v149.origin.x = v21;
        v149.origin.y = v23;
        v149.size.width = v25;
        v149.size.height = v27;
        v31 = v30 - CGRectGetMinY(v149);
        v150.origin.x = v21;
        v150.origin.y = v23;
        v150.size.width = v25;
        v150.size.height = v27;
        v151 = CGRectOffset(v150, 0.0, v31);
        x = v151.origin.x;
        y = v151.origin.y;
        width = v151.size.width;
        height = v151.size.height;
        objc_msgSend(v16, "setCardToCenter:", CGRectGetCenterNoRounding(v36));
        if (objc_msgSend(v16, "isFocusedCard"))
        {
          -[BCCardStackTransitionAnimator _dismissSpringVelocityWithFromFrame:toFrame:](self, "_dismissSpringVelocityWithFromFrame:toFrame:", v21, v23, v25, v27, x, y, width, height);
          v95 = v37;
          v97 = v38;
          if (v99)
          {
            memset(&v137, 0, sizeof(v137));
            -[BCCardStackTransitionAnimator _translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:](self, "_translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:", v93, v19, v21, v23, v25, v27, x, y, width, height);
            if (v93)
              objc_msgSend(v93, "transform");
            else
              memset(&t2, 0, sizeof(t2));
            t1 = v137;
            CGAffineTransformConcat(&v142, &t1, &t2);
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
    }
    while (v13);
  }
  else
  {
    v95 = 0.0;
    v97 = 0.0;
  }
  v92 = v5;

  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](self, "coverFadeItems"));
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v132;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v132 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)j);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "key"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "viewForKey:", CFSTR("BCUITransitionContextClippedCoverContainerViewKey")));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "coverSource"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _addCoverForCoverSource:inView:](self, "_addCoverForCoverSource:inView:", v47, v46));
        objc_msgSend(v103, "setObject:forKeyedSubscript:", v48, v45);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
    }
    while (v41);
  }

  v49 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = sub_A3EB8;
  v126[3] = &unk_28FB98;
  v50 = v90;
  v127 = v50;
  v51 = v88;
  v128 = v51;
  v52 = v93;
  v129 = v52;
  v53 = obj;
  v130 = v53;
  -[BCViewPropertyAnimatorCounter setAnimationDidEnd:](v49, "setAnimationDidEnd:", v126);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _cardSlideDownSpringWithVelocity:](self, "_cardSlideDownSpringWithVelocity:", v95, v97));
  objc_msgSend(v54, "settlingDuration");
  v56 = v55 * 0.9;
  v96 = v54;
  v57 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v54, v55 * 0.9);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_A3F50;
  v122[3] = &unk_290090;
  v122[4] = self;
  v125 = v99;
  v98 = v52;
  v123 = v98;
  v124 = v142;
  objc_msgSend(v57, "addAnimations:", v122);
  v94 = v57;
  -[BCViewPropertyAnimatorCounter animate:](v49, "animate:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](self, "coverFadeItems"));
  v59 = objc_msgSend(v58, "count");

  if (v59)
  {
    v86 = v53;
    v87 = v51;
    v89 = v49;
    v91 = v50;
    v60 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.3);
    v61 = objc_msgSend(v60, "initWithDuration:curve:animations:", 0, 0);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    obja = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](self, "coverFadeItems"));
    v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v118, v145, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v119;
      do
      {
        for (k = 0; k != v63; k = (char *)k + 1)
        {
          if (*(_QWORD *)v119 != v64)
            objc_enumerationMutation(obja);
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)k), "key"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", v66));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "coverView"));

          objc_msgSend(v68, "setAlpha:", 0.0);
          v116[0] = _NSConcreteStackBlock;
          v116[1] = 3221225472;
          v116[2] = sub_A40B0;
          v116[3] = &unk_28B960;
          v117 = v68;
          v69 = v68;
          objc_msgSend(v61, "addAnimations:", v116);

        }
        v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v118, v145, 16);
      }
      while (v63);
    }

    v49 = v89;
    -[BCViewPropertyAnimatorCounter animate:](v89, "animate:", v61);

    v50 = v91;
    v53 = v86;
    v51 = v87;
  }
  if (v99)
  {
    v70 = objc_alloc((Class)UIViewPropertyAnimator);
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_A40BC;
    v114[3] = &unk_28B960;
    v115 = v51;
    v71 = objc_msgSend(v70, "initWithDuration:curve:animations:", 0, v114, v56);
    -[BCViewPropertyAnimatorCounter animate:](v49, "animate:", v71);

    v72 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.18);
    if (v56 >= v73)
      v74 = v73;
    else
      v74 = v56;
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_A40C8;
    v112[3] = &unk_28B960;
    v113 = v98;
    v75 = objc_msgSend(v72, "initWithDuration:curve:animations:", 0, v112, v74);
    -[BCViewPropertyAnimatorCounter animate:](v49, "animate:", v75);

  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "allValues"));
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v108, v144, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v109;
    do
    {
      for (m = 0; m != v78; m = (char *)m + 1)
      {
        if (*(_QWORD *)v109 != v79)
          objc_enumerationMutation(v76);
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)m), "setCounter:", v49);
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v108, v144, 16);
    }
    while (v78);
  }

  -[BCCardStackTransitionAnimator setCoverControllers:](self, "setCoverControllers:", v103);
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v81 = self->_additionalAnimations;
  v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v104, v143, 16);
  if (v82)
  {
    v83 = v82;
    v84 = *(_QWORD *)v105;
    do
    {
      for (n = 0; n != v83; n = (char *)n + 1)
      {
        if (*(_QWORD *)v105 != v84)
          objc_enumerationMutation(v81);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)n) + 16))(v56);
      }
      v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v104, v143, 16);
    }
    while (v83);
  }

}

- (double)_insetPercentageForAbsoluteCoverRect:(CGRect)a3
{
  return dbl_26A530[CGSizeScaleThatFitsInCGSize(self, a2, a3.size.width, a3.size.height, 170.0, 250.0) >= 1.0];
}

- (id)_coverSpring
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 350.0, 30.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _adjustSpring:](self, "_adjustSpring:", v3));

  return v4;
}

- (id)_coverSpringForDismissWithVelocity:(CGVector)a3 isCompact:(BOOL)a4
{
  _BOOL4 v4;
  double dy;
  double dx;
  id v8;
  double v9;
  id v10;
  void *v11;

  v4 = a4;
  dy = a3.dy;
  dx = a3.dx;
  v8 = objc_alloc((Class)UISpringTimingParameters);
  if (v4)
    v9 = 30.0;
  else
    v9 = 33.0;
  v10 = objc_msgSend(v8, "initWithMass:stiffness:damping:initialVelocity:", 1.0, 350.0, v9, dx, dy);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _adjustSpring:](self, "_adjustSpring:", v10));

  return v11;
}

- (id)_coverScaleSpring
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 350.0, 28.0, 0.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _adjustSpring:](self, "_adjustSpring:", v3));

  return v4;
}

- (id)_customCurve
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  LODWORD(v2) = 1051260355;
  LODWORD(v4) = 1045220557;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5));
  v7 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithCustomCurve:", v6);

  return v7;
}

- (void)_animatePushByCoverTransitioning:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *k;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  BCViewPropertyAnimatorCounter *v65;
  double v66;
  BCCardStackTransitionAnimator *v67;
  id v68;
  double v69;
  double v70;
  id v71;
  id v72;
  double v73;
  double v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  double v81;
  double v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *m;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  void *n;
  void *v99;
  void *v100;
  id v101;
  id v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  id *p_isa;
  void *v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  uint64_t v115;
  void *ii;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  uint64_t v124;
  void *jj;
  double v126;
  double v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  void *kk;
  BCViewPropertyAnimatorCounter *v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id obj;
  id v140;
  id v141;
  int v142;
  id v143;
  BCCardStackTransitionAnimator *v144;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  void *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _QWORD v171[4];
  id v172;
  void *v173;
  _QWORD v174[4];
  id v175;
  void *v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[4];
  id v182;
  _QWORD v183[4];
  id v184;
  _QWORD v185[4];
  id v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  CGAffineTransform v191;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v194;
  CGAffineTransform v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextBackgroundViewKey")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextTitleLabelKey")));
  v135 = (void *)v6;
  v9 = self->_cardsCanExpand || v6 == 0;
  v10 = !v9;
  v142 = v10;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    objc_msgSend(v11, "bringSubviewToFront:", v7);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    objc_msgSend(v12, "bringSubviewToFront:", v8);

  }
  v137 = (void *)v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  objc_msgSend(v13, "layoutIfNeeded");

  objc_msgSend(v4, "finalFrameForViewController:", v5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v23, "addSubview:", v24);

  v136 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v25, "layoutIfNeeded");

  v144 = self;
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator cardMoveItems](self, "cardMoveItems"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v208, v220, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v209;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v209 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * (_QWORD)i);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "card"));
        objc_msgSend(v32, "cardStackTransitioningCardExtraXOffset");
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "coverSource"));
        objc_msgSend(v35, "setCardStackTransitioningCoverSourceExtraXOffset:", v34);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v208, v220, 16);
    }
    while (v28);
  }

  v207 = 0u;
  v206 = 0u;
  v205 = 0u;
  v204 = 0u;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverMoveItems](v144, "coverMoveItems"));
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v204, v219, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v205;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v205 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * (_QWORD)j);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _addCoverForCoverMove:inView:isDismiss:fromFrame:toFrame:](v144, "_addCoverForCoverMove:inView:isDismiss:fromFrame:toFrame:", v41, v42, 0, 0, 0));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "key"));
        objc_msgSend(v145, "setObject:forKeyedSubscript:", v43, v44);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v204, v219, 16);
    }
    while (v38);
  }

  v203 = 0u;
  v202 = 0u;
  v201 = 0u;
  v200 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator cardMoveItems](v144, "cardMoveItems"));
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v200, v218, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v201;
    do
    {
      v49 = 0;
      v50 = 0uLL;
      do
      {
        if (*(_QWORD *)v201 != v48)
        {
          objc_enumerationMutation(v45);
          v50 = 0uLL;
        }
        v51 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)v49);
        v199 = v50;
        v198 = v50;
        v197 = v50;
        v196 = v50;
        -[BCCardStackTransitionAnimator _prepareCardForCardMove:isDismiss:fromFrame:toFrame:](v144, "_prepareCardForCardMove:isDismiss:fromFrame:toFrame:", v51, 0, &v198, &v196);
        if (((v142 | objc_msgSend(v51, "isFocusedCard") ^ 1) & 1) == 0)
        {
          memset(&v195, 0, sizeof(v195));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "card"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "cardStackTransitioningCardView"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "superview"));
          -[BCCardStackTransitionAnimator _translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:](v144, "_translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:", v8, v54, v196, v197, v198, v199);

          if (v8)
            objc_msgSend(v8, "transform");
          else
            memset(&t2, 0, sizeof(t2));
          t1 = v195;
          CGAffineTransformConcat(&v194, &t1, &t2);
          v191 = v194;
          objc_msgSend(v8, "setTransform:", &v191);
        }
        v49 = (char *)v49 + 1;
        v50 = 0uLL;
      }
      while (v47 != v49);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v200, v218, 16, 0.0);
    }
    while (v47);
  }
  v138 = v8;

  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](v144, "coverFadeItems"));
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v187, v217, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v188;
    do
    {
      for (k = 0; k != v57; k = (char *)k + 1)
      {
        if (*(_QWORD *)v188 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * (_QWORD)k);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "key"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextClippedCoverContainerViewKey")));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "coverSource"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _addCoverForCoverSource:inView:](v144, "_addCoverForCoverSource:inView:", v63, v62));
        objc_msgSend(v145, "setObject:forKeyedSubscript:", v64, v61);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v187, v217, 16);
    }
    while (v57);
  }

  v65 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v185[0] = _NSConcreteStackBlock;
  v185[1] = 3221225472;
  v185[2] = sub_A51C4;
  v185[3] = &unk_28B960;
  v134 = v4;
  v186 = v134;
  -[BCViewPropertyAnimatorCounter setAnimationDidEnd:](v65, "setAnimationDidEnd:", v185);
  v66 = 0.0;
  if (v142)
    v66 = 1.0;
  objc_msgSend(v137, "setAlpha:", v66);
  v133 = v65;
  if ((v142 & 1) != 0)
  {
    objc_msgSend(v138, "setAlpha:", 1.0);
    v67 = v144;
  }
  else
  {
    v68 = objc_alloc((Class)UIViewPropertyAnimator);
    v67 = v144;
    -[BCCardStackTransitionAnimator _adjustDuration:](v144, "_adjustDuration:", 0.13);
    v70 = v69;
    v183[0] = _NSConcreteStackBlock;
    v183[1] = 3221225472;
    v183[2] = sub_A51D0;
    v183[3] = &unk_28B960;
    v184 = v137;
    v71 = objc_msgSend(v68, "initWithDuration:curve:animations:", 0, v183, v70);
    -[BCViewPropertyAnimatorCounter animate:](v65, "animate:", v71);

    objc_msgSend(v138, "setAlpha:", 0.0);
    v72 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](v144, "_adjustDuration:", 0.18);
    v74 = v73;
    v181[0] = _NSConcreteStackBlock;
    v181[1] = 3221225472;
    v181[2] = sub_A51DC;
    v181[3] = &unk_28B960;
    v182 = v138;
    v75 = objc_msgSend(v72, "initWithDuration:curve:animations:", 0, v181, v74);
    -[BCViewPropertyAnimatorCounter animate:](v65, "animate:", v75);

  }
  v76 = objc_alloc((Class)UIViewPropertyAnimator);
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverSpring](v67, "_coverSpring"));
  v143 = objc_msgSend(v76, "initWithDuration:timingParameters:", v77, 0.0);

  v78 = objc_alloc((Class)UIViewPropertyAnimator);
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverScaleSpring](v67, "_coverScaleSpring"));
  v141 = objc_msgSend(v78, "initWithDuration:timingParameters:", v79, 0.0);

  v80 = objc_alloc((Class)UIViewPropertyAnimator);
  -[BCCardStackTransitionAnimator _adjustDuration:](v67, "_adjustDuration:", 0.05);
  v82 = v81;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _customCurve](v67, "_customCurve"));
  v140 = objc_msgSend(v80, "initWithDuration:timingParameters:", v83, v82);

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverMoveItems](v67, "coverMoveItems"));
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v216, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v178;
    do
    {
      for (m = 0; m != v85; m = (char *)m + 1)
      {
        if (*(_QWORD *)v178 != v86)
          objc_enumerationMutation(obj);
        v88 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * (_QWORD)m);
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "key"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", v89));
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "coverView"));

        v174[0] = _NSConcreteStackBlock;
        v174[1] = 3221225472;
        v174[2] = sub_A51E8;
        v174[3] = &unk_28B808;
        v92 = v91;
        v175 = v92;
        v176 = v88;
        objc_msgSend(v143, "addAnimations:", v174);
        v171[0] = _NSConcreteStackBlock;
        v171[1] = 3221225472;
        v171[2] = sub_A5210;
        v171[3] = &unk_28B808;
        v172 = v92;
        v173 = v88;
        v93 = v92;
        objc_msgSend(v141, "addAnimations:", v171);

      }
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v216, 16);
    }
    while (v85);
  }

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator cardMoveItems](v144, "cardMoveItems"));
  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v167, v215, 16);
  if (v95)
  {
    v96 = v95;
    v97 = *(_QWORD *)v168;
    do
    {
      for (n = 0; n != v96; n = (char *)n + 1)
      {
        if (*(_QWORD *)v168 != v97)
          objc_enumerationMutation(v94);
        v99 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)n);
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "card"));
        v164[0] = _NSConcreteStackBlock;
        v164[1] = 3221225472;
        v164[2] = sub_A5270;
        v164[3] = &unk_28B808;
        v101 = v100;
        v165 = v101;
        v166 = v99;
        objc_msgSend(v143, "addAnimations:", v164);
        objc_msgSend(v101, "setCardStackTransitioningCardContentAlpha:", 1.0);
        v162[0] = _NSConcreteStackBlock;
        v162[1] = 3221225472;
        v162[2] = sub_A5340;
        v162[3] = &unk_28B960;
        v163 = v101;
        v102 = v101;
        -[BCCardStackTransitionAnimator _adjustDuration:](v144, "_adjustDuration:", 0.08);
        v104 = v103;
        objc_msgSend(v140, "duration");
        objc_msgSend(v140, "addAnimations:delayFactor:", v162, v104 / v105);

      }
      v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v167, v215, 16);
    }
    while (v96);
  }

  v106 = v138;
  if ((v142 & 1) == 0)
  {
    v160[0] = _NSConcreteStackBlock;
    v160[1] = 3221225472;
    v160[2] = sub_A534C;
    v160[3] = &unk_28B960;
    v161 = v138;
    objc_msgSend(v143, "addAnimations:", v160);

  }
  -[BCViewPropertyAnimatorCounter animate:](v133, "animate:", v143);
  -[BCViewPropertyAnimatorCounter animate:](v133, "animate:", v141);
  -[BCViewPropertyAnimatorCounter animate:](v133, "animate:", v140);
  p_isa = (id *)&v144->super.isa;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](v144, "coverFadeItems"));
  v109 = objc_msgSend(v108, "count");

  if (v109)
  {
    v110 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](v144, "_adjustDuration:", 0.2);
    v111 = objc_msgSend(v110, "initWithDuration:curve:animations:", 0, 0);
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](v144, "coverFadeItems"));
    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v156, v214, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v157;
      do
      {
        for (ii = 0; ii != v114; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v157 != v115)
            objc_enumerationMutation(v112);
          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)ii), "key"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", v117));
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "coverView"));

          objc_msgSend(v119, "setAlpha:", 1.0);
          v154[0] = _NSConcreteStackBlock;
          v154[1] = 3221225472;
          v154[2] = sub_A5388;
          v154[3] = &unk_28B960;
          v155 = v119;
          v120 = v119;
          objc_msgSend(v111, "addAnimations:", v154);

        }
        v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v156, v214, 16);
      }
      while (v114);
    }

    -[BCViewPropertyAnimatorCounter animate:](v133, "animate:", v111);
    v106 = v138;
    p_isa = (id *)&v144->super.isa;
  }
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "allValues"));
  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v150, v213, 16);
  if (v122)
  {
    v123 = v122;
    v124 = *(_QWORD *)v151;
    do
    {
      for (jj = 0; jj != v123; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v151 != v124)
          objc_enumerationMutation(v121);
        objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)jj), "setCounter:", v133);
      }
      v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v150, v213, 16);
    }
    while (v123);
  }

  objc_msgSend(p_isa, "setCoverControllers:", v145);
  objc_msgSend(p_isa, "_adjustDuration:", 0.5);
  v127 = v126;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v128 = p_isa[1];
  v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v146, v212, 16);
  if (v129)
  {
    v130 = v129;
    v131 = *(_QWORD *)v147;
    do
    {
      for (kk = 0; kk != v130; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v147 != v131)
          objc_enumerationMutation(v128);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)kk) + 16))(v127);
      }
      v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v146, v212, 16);
    }
    while (v130);
  }

}

- (id)_addCoverForCoverSource:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BCCardStackTransitionCoverView *v25;
  void *v26;
  _BCCardStackTransitionCoverController *v27;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "cardStackTransitioningCoverSourceFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardStackTransitioningCoverSourceReferenceView"));
  objc_msgSend(v6, "convertRect:fromView:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = -[BCCardStackTransitionCoverView initWithFrame:]([BCCardStackTransitionCoverView alloc], "initWithFrame:", v18, v20, v22, v24);
  objc_msgSend(v6, "addSubview:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator viewsToBeCleanedUp](self, "viewsToBeCleanedUp"));
  objc_msgSend(v26, "addObject:", v25);

  v27 = objc_alloc_init(_BCCardStackTransitionCoverController);
  -[_BCCardStackTransitionCoverController setupWithCoverSource:coverView:](v27, "setupWithCoverSource:coverView:", v7, v25);

  return v27;
}

- (id)_addCoverForCoverMove:(id)a3 inView:(id)a4 isDismiss:(BOOL)a5 fromFrame:(CGRect *)a6 toFrame:(CGRect *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
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
  void *v24;
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double width;
  double v31;
  double height;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  BCCardStackTransitionCoverView *v56;
  void *v57;
  uint64_t v58;
  _BCCardStackTransitionCoverController *v59;
  double v61;
  double v62;
  double v63;
  double v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGRect v67;
  CGRect v68;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "coverSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardCoverSource"));
  objc_msgSend(v14, "cardStackTransitioningCoverSourceFrame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardStackTransitioningCoverSourceReferenceView"));
  objc_msgSend(v13, "convertRect:fromView:", v24, v17, v19, v21, v23);
  x = v25;
  y = v27;
  width = v29;
  height = v31;

  objc_msgSend(v15, "cardStackTransitioningCoverSourceFrame");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardStackTransitioningCoverSourceReferenceView"));
  objc_msgSend(v13, "convertRect:fromView:", v41, v34, v36, v38, v40);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  if (v9)
    v50 = v47;
  else
    v50 = width;
  if (v9)
    v51 = v49;
  else
    v51 = height;
  v63 = v51;
  v64 = v50;
  if (v9)
    v52 = v45;
  else
    v52 = y;
  if (v9)
    v53 = v43;
  else
    v53 = x;
  v61 = v53;
  v62 = v52;
  if (!v9)
  {
    objc_msgSend(v14, "cardStackTransitioningCoverSourceExtraXOffset");
    v55 = v54;
    v67.origin.x = v43;
    v67.origin.y = v45;
    v67.size.width = v47;
    v67.size.height = v49;
    v68 = CGRectOffset(v67, v55, 0.0);
    x = v68.origin.x;
    y = v68.origin.y;
    width = v68.size.width;
    height = v68.size.height;
  }
  v56 = -[BCCardStackTransitionCoverView initWithFrame:]([BCCardStackTransitionCoverView alloc], "initWithFrame:", v61, v62, v64, v63);
  objc_msgSend(v13, "addSubview:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator viewsToBeCleanedUp](self, "viewsToBeCleanedUp"));
  objc_msgSend(v57, "addObject:", v56);

  objc_msgSend(v12, "setCoverToCenter:", CGRectGetCenterNoRounding(v58));
  sub_A5758(&v66, v61, v62, v64, v63, x, y, width, height);
  v65 = v66;
  objc_msgSend(v12, "setCoverToTransform:", &v65);
  if (a6)
  {
    a6->origin.x = v61;
    a6->origin.y = v62;
    a6->size.width = v64;
    a6->size.height = v63;
  }
  if (a7)
  {
    a7->origin.x = x;
    a7->origin.y = y;
    a7->size.width = width;
    a7->size.height = height;
  }
  v59 = objc_alloc_init(_BCCardStackTransitionCoverController);
  -[_BCCardStackTransitionCoverController setupWithCoverSource:cardCoverSource:coverView:isDismiss:](v59, "setupWithCoverSource:cardCoverSource:coverView:isDismiss:", v14, v15, v56, v9);

  return v59;
}

- (void)_clearTranslationForView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = a3;
  v4 = v3;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (v3)
    objc_msgSend(v3, "transform");
  v5 = objc_msgSend(v4, "center");
  objc_msgSend(v4, "setCenter:", CGPointAdd(v5, v6, v7, *(double *)&v11, *((double *)&v11 + 1)));
  v11 = 0uLL;
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = 0uLL;
  objc_msgSend(v4, "setTransform:", v8);

}

- (void)_prepareCardForCardMove:(id)a3 isDismiss:(BOOL)a4 fromFrame:(CGRect *)a5 toFrame:(CGRect *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
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
  double v28;
  void *v29;
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
  CGFloat Width;
  CGFloat v41;
  CGFloat Height;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double CenterNoRounding;
  double v53;
  double v54;
  __int128 v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  _OWORD v62[3];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[3];
  CGAffineTransform v67;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "card"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coverSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardStackTransitioningCardView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));
  objc_msgSend(v11, "cardStackTransitioningCardFinalFrame");
  v57 = v16;
  v58 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "cardStackTransitioningCoverSourceFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardStackTransitioningCoverSourceReferenceView"));
  objc_msgSend(v14, "convertRect:fromView:", v29, v22, v24, v26, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  objc_msgSend(v14, "convertRect:toView:", 0, v31, v33, v35, v37);
  -[BCCardStackTransitionAnimator _insetPercentageForAbsoluteCoverRect:](self, "_insetPercentageForAbsoluteCoverRect:");
  v39 = v38;
  v71.origin.x = v31;
  v71.origin.y = v33;
  v71.size.width = v35;
  v71.size.height = v37;
  Width = CGRectGetWidth(v71);
  v41 = v39 * Width + v39 * Width;
  v72.origin.x = v31;
  v72.origin.y = v33;
  v72.size.width = v35;
  v72.size.height = v37;
  Height = CGRectGetHeight(v72);
  v43 = v39 * Height + v39 * Height;
  v73.origin.x = v31;
  v73.origin.y = v33;
  v73.size.width = v35;
  v73.size.height = v37;
  CGRectInset(v73, v41, v43);
  v44 = CGRectMakeWithSize(v18, v20);
  v45 = CGRectFitRectInRectAbsoluteNoRounding(v44);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  CenterNoRounding = CGRectGetCenterNoRounding(-[BCCardStackTransitionAnimator _clearTranslationForView:](self, "_clearTranslationForView:", v13));
  v54 = v53;
  memset(&v70, 0, sizeof(v70));
  sub_A5758(&t1, v58, v57, v18, v20, v45, v47, v49, v51);
  if (v13)
    objc_msgSend(v13, "transform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v70, &t1, &t2);
  if (a4)
  {
    objc_msgSend(v10, "setCardToCenter:", CenterNoRounding, v54);
    v67 = v70;
    objc_msgSend(v10, "setCardToTransform:", &v67);
    v55 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v66[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v66[1] = v55;
    v66[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v10, "setCardSuperviewToTransform:", v66);
    if (a5)
    {
      a5->origin.x = v58;
      a5->origin.y = v57;
      a5->size.width = v18;
      a5->size.height = v20;
    }
    v18 = v49;
    v20 = v51;
    if (!a6)
      goto LABEL_16;
LABEL_15:
    a6->origin.x = v45;
    a6->origin.y = v47;
    a6->size.width = v18;
    a6->size.height = v20;
    goto LABEL_16;
  }
  objc_msgSend(v13, "center");
  objc_msgSend(v10, "setCardToCenter:");
  if (v13)
  {
    objc_msgSend(v13, "transform");
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
    v63 = 0u;
  }
  v62[0] = v63;
  v62[1] = v64;
  v62[2] = v65;
  objc_msgSend(v10, "setCardToTransform:", v62);
  objc_msgSend(v11, "cardStackTransitioningCardExtraXOffset");
  CGAffineTransformMakeTranslation(&v61, v56, 0.0);
  v60 = v61;
  objc_msgSend(v10, "setCardSuperviewToTransform:", &v60);
  objc_msgSend(v13, "setCenter:", CenterNoRounding, v54);
  v59 = v70;
  objc_msgSend(v13, "setTransform:", &v59);
  if (a5)
  {
    a5->origin.x = v45;
    a5->origin.y = v47;
    a5->size.width = v49;
    a5->size.height = v51;
  }
  v47 = v57;
  v45 = v58;
  if (a6)
    goto LABEL_15;
LABEL_16:

}

- (CGVector)_dismissSpringVelocityWithFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidY;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGVector result;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidY = CGRectGetMidY(a4);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v10 = MidY - CGRectGetMidY(v18);
  v11 = fmin(v10, -1.0);
  v12 = fmax(v10, 1.0);
  if (v10 >= 0.0)
    v13 = v12;
  else
    v13 = v11;
  -[BCCardStackTransitionAnimator velocityForPop](self, "velocityForPop");
  v15 = fmin(fmax(v14 / v13, -35.0), 35.0);
  v16 = 0.0;
  result.dy = v15;
  result.dx = v16;
  return result;
}

- (void)_animatePopByCoverTransitioning:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v7;
  __int128 v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BCCardStackTransitionAnimator *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BCViewPropertyAnimatorCounter *v48;
  void **v49;
  id v50;
  id v51;
  double v52;
  double v53;
  id v54;
  id v55;
  double v56;
  double v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  double v67;
  double v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void **v73;
  void *m;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  void *n;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  BCViewPropertyAnimatorCounter *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  uint64_t v103;
  void *ii;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *jj;
  double v114;
  double v115;
  NSMutableArray *v116;
  id v117;
  id v118;
  uint64_t v119;
  void *kk;
  id v121;
  void *v122;
  id v123;
  id v124;
  BCViewPropertyAnimatorCounter *v125;
  id v126;
  void *v127;
  _BOOL4 v128;
  id obj;
  id v130;
  id v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  BCCardStackTransitionAnimator *v139;
  void *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[4];
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[4];
  id v156;
  CGAffineTransform v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[4];
  id v161;
  void *v162;
  _QWORD v163[4];
  id v164;
  void *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[4];
  id v171;
  _QWORD v172[4];
  id v173;
  void *v174;
  _QWORD v175[4];
  id v176;
  void *v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _QWORD v182[4];
  id v183;
  _QWORD v184[4];
  id v185;
  _QWORD v186[4];
  id v187;
  id v188;
  id v189;
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  CGAffineTransform v210;
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextBackgroundViewKey")));
  v135 = (void *)v5;
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextTitleLabelKey")));
  v7 = self->_cardsCanExpand || v5 == 0;
  v128 = v7;
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v210.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v210.c = v8;
  *(_OWORD *)&v210.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverMoveItems](self, "coverMoveItems"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v206, v218, 16);
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v139 = self;
  if (v10)
  {
    v14 = v10;
    v15 = *(_QWORD *)v207;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v207 != v15)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v17, "animatesInInnerContainerView") & 1) != 0)
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextClippedCoverContainerViewKey")));
        else
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
        v19 = (void *)v18;
        memset(&v197, 0, 32);
        memset(&t1, 0, 32);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _addCoverForCoverMove:inView:isDismiss:fromFrame:toFrame:](self, "_addCoverForCoverMove:inView:isDismiss:fromFrame:toFrame:", v17, v18, 1, &v197, &t1));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "key"));
        objc_msgSend(v140, "setObject:forKeyedSubscript:", v20, v21);

        self = v139;
        if (objc_msgSend(v17, "isFocusedCover"))
        {
          -[BCCardStackTransitionAnimator _dismissSpringVelocityWithFromFrame:toFrame:](v139, "_dismissSpringVelocityWithFromFrame:toFrame:", *(_OWORD *)&v197.a, *(_OWORD *)&v197.c, t1.a, t1.b, t1.c, t1.d);
          v13 = v22;
          v12 = v23;
        }

      }
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v206, v218, 16);
    }
    while (v14);
  }

  v205 = 0u;
  v204 = 0u;
  v203 = 0u;
  v202 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator cardMoveItems](self, "cardMoveItems"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v202, v217, 16);
  v26 = 0.0;
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v203;
    v11 = 0.0;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v203 != v28)
          objc_enumerationMutation(v24);
        v30 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * (_QWORD)j);
        v201 = 0u;
        v200 = 0u;
        v199 = 0u;
        v198 = 0u;
        -[BCCardStackTransitionAnimator _prepareCardForCardMove:isDismiss:fromFrame:toFrame:](self, "_prepareCardForCardMove:isDismiss:fromFrame:toFrame:", v30, 1, &v200, &v198);
        if (objc_msgSend(v30, "isFocusedCard"))
        {
          -[BCCardStackTransitionAnimator _dismissSpringVelocityWithFromFrame:toFrame:](self, "_dismissSpringVelocityWithFromFrame:toFrame:", v200, v201, v198, v199);
          v26 = v31;
          v11 = v32;
          if (v128)
          {
            memset(&v197, 0, sizeof(v197));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "card"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "cardStackTransitioningCardView"));
            v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "superview"));
            v36 = self;
            v37 = (void *)v35;
            -[BCCardStackTransitionAnimator _translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:](v36, "_translationForTitleLabel:cardSuperview:cardCurrentFrame:cardTargetFrame:", v137, v35, v200, v201, v198, v199);

            if (v137)
              objc_msgSend(v137, "transform");
            else
              memset(&t2, 0, sizeof(t2));
            t1 = v197;
            CGAffineTransformConcat(&v210, &t1, &t2);
            self = v139;
          }
        }
      }
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v202, v217, 16);
    }
    while (v27);
  }

  v194 = 0u;
  v193 = 0u;
  v191 = 0u;
  v192 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](self, "coverFadeItems"));
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v191, v216, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v192;
    do
    {
      for (k = 0; k != v40; k = (char *)k + 1)
      {
        if (*(_QWORD *)v192 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * (_QWORD)k);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "key"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextClippedCoverContainerViewKey")));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "coverSource"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _addCoverForCoverSource:inView:](v139, "_addCoverForCoverSource:inView:", v46, v45));
        objc_msgSend(v140, "setObject:forKeyedSubscript:", v47, v44);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v191, v216, 16);
    }
    while (v40);
  }

  v48 = objc_alloc_init(BCViewPropertyAnimatorCounter);
  v49 = _NSConcreteStackBlock;
  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = sub_A6CC4;
  v186[3] = &unk_28FB98;
  v123 = v135;
  v187 = v123;
  v50 = v133;
  v188 = v50;
  v126 = v137;
  v189 = v126;
  v121 = v4;
  v190 = v121;
  -[BCViewPropertyAnimatorCounter setAnimationDidEnd:](v48, "setAnimationDidEnd:", v186);
  if (v128)
  {
    v51 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.17);
    v53 = v52;
    v184[0] = _NSConcreteStackBlock;
    v184[1] = 3221225472;
    v184[2] = sub_A6D5C;
    v184[3] = &unk_28B960;
    v185 = v50;
    v54 = objc_msgSend(v51, "initWithDuration:curve:animations:", 0, v184, v53);
    -[BCViewPropertyAnimatorCounter animate:](v48, "animate:", v54);

    v55 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.18);
    v57 = v56;
    v182[0] = _NSConcreteStackBlock;
    v182[1] = 3221225472;
    v182[2] = sub_A6D68;
    v182[3] = &unk_28B960;
    v183 = v126;
    v58 = objc_msgSend(v55, "initWithDuration:curve:animations:", 0, v182, v57);
    -[BCViewPropertyAnimatorCounter animate:](v48, "animate:", v58);

  }
  v122 = v50;
  v125 = v48;
  v59 = objc_msgSend(v127, "im_isCompactWidth");
  v60 = objc_alloc((Class)UIViewPropertyAnimator);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](v139, "_coverSpringForDismissWithVelocity:isCompact:", v59, v13, v12));
  v134 = objc_msgSend(v60, "initWithDuration:timingParameters:", v61, 0.0);

  v62 = objc_alloc((Class)UIViewPropertyAnimator);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](v139, "_coverSpringForDismissWithVelocity:isCompact:", v59, v26, v11));
  v136 = objc_msgSend(v62, "initWithDuration:timingParameters:", v63, 0.0);

  v64 = objc_alloc((Class)UIViewPropertyAnimator);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _coverSpringForDismissWithVelocity:isCompact:](v139, "_coverSpringForDismissWithVelocity:isCompact:", v59, 0.0, 0.0));
  v138 = objc_msgSend(v64, "initWithDuration:timingParameters:", v65, 0.0);

  v66 = objc_alloc((Class)UIViewPropertyAnimator);
  -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.15);
  v68 = v67;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator _customCurve](v139, "_customCurve"));
  v132 = objc_msgSend(v66, "initWithDuration:timingParameters:", v69, v68);

  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverMoveItems](v139, "coverMoveItems"));
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v215, 16);
  if (v70)
  {
    v71 = v70;
    v72 = 0;
    v130 = *(id *)v179;
    do
    {
      v73 = v49;
      for (m = 0; m != v71; m = (char *)m + 1)
      {
        v75 = v72;
        if (*(id *)v179 != v130)
          objc_enumerationMutation(obj);
        v76 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * (_QWORD)m);
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "key"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKeyedSubscript:", v77));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "coverView"));

        v175[0] = v73;
        v175[1] = 3221225472;
        v175[2] = sub_A6D74;
        v175[3] = &unk_28B808;
        v80 = v79;
        v176 = v80;
        v177 = v76;
        objc_msgSend(v134, "addAnimations:", v175);
        v172[0] = v73;
        v172[1] = 3221225472;
        v172[2] = sub_A6D9C;
        v172[3] = &unk_28B808;
        v81 = v80;
        v173 = v81;
        v174 = v76;
        objc_msgSend(v138, "addAnimations:", v172);
        if (objc_msgSend(v76, "needsFadeInOnDismiss"))
        {
          v72 = v75;
          if (!v75)
          {
            v82 = objc_alloc((Class)UIViewPropertyAnimator);
            -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.15);
            v72 = objc_msgSend(v82, "initWithDuration:curve:animations:", 0, 0);
          }
          objc_msgSend(v81, "setAlpha:", 0.0);
          v170[0] = v73;
          v170[1] = 3221225472;
          v170[2] = sub_A6DFC;
          v170[3] = &unk_28B960;
          v171 = v81;
          objc_msgSend(v72, "addAnimations:", v170);

        }
        else
        {
          v72 = v75;
        }

      }
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v215, 16);
      v49 = v73;
    }
    while (v71);
  }
  else
  {
    v72 = 0;
  }
  v124 = v72;

  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v131 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator cardMoveItems](v139, "cardMoveItems"));
  v83 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v166, v214, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v167;
    do
    {
      for (n = 0; n != v84; n = (char *)n + 1)
      {
        if (*(_QWORD *)v167 != v85)
          objc_enumerationMutation(v131);
        v87 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * (_QWORD)n);
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "card"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "cardStackTransitioningCardView"));

        v163[0] = v49;
        v163[1] = 3221225472;
        v163[2] = sub_A6E08;
        v163[3] = &unk_28B808;
        v90 = v89;
        v164 = v90;
        v165 = v87;
        objc_msgSend(v136, "addAnimations:", v163);
        v160[0] = v49;
        v160[1] = 3221225472;
        v160[2] = sub_A6E30;
        v160[3] = &unk_28B808;
        v91 = v90;
        v161 = v91;
        v162 = v87;
        objc_msgSend(v138, "addAnimations:", v160);
        v158[0] = v49;
        v158[1] = 3221225472;
        v158[2] = sub_A6E90;
        v158[3] = &unk_28B960;
        v159 = v91;
        v92 = v91;
        objc_msgSend(v132, "addAnimations:", v158);

      }
      v84 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v166, v214, 16);
    }
    while (v84);
  }

  if (v128)
  {
    v155[0] = v49;
    v155[1] = 3221225472;
    v155[2] = sub_A6E9C;
    v155[3] = &unk_2900B8;
    v156 = v126;
    v157 = v210;
    objc_msgSend(v136, "addAnimations:", v155);

  }
  v93 = v48;
  -[BCViewPropertyAnimatorCounter animate:](v48, "animate:", v134);
  -[BCViewPropertyAnimatorCounter animate:](v48, "animate:", v136);
  -[BCViewPropertyAnimatorCounter animate:](v48, "animate:", v138);
  -[BCViewPropertyAnimatorCounter animate:](v48, "animate:", v132);
  v94 = v140;
  v95 = v124;
  if (v124)
  {
    -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.1);
    -[BCViewPropertyAnimatorCounter animate:afterDelay:](v125, "animate:afterDelay:", v124);
  }
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](v139, "coverFadeItems"));
  v97 = objc_msgSend(v96, "count");

  if (v97)
  {
    v98 = objc_alloc((Class)UIViewPropertyAnimator);
    -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.3);
    v99 = objc_msgSend(v98, "initWithDuration:curve:animations:", 0, 0);
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionAnimator coverFadeItems](v139, "coverFadeItems"));
    v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v151, v213, 16);
    if (v101)
    {
      v102 = v101;
      v103 = *(_QWORD *)v152;
      do
      {
        for (ii = 0; ii != v102; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v152 != v103)
            objc_enumerationMutation(v100);
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * (_QWORD)ii), "key"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKeyedSubscript:", v105));
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "coverView"));

          objc_msgSend(v107, "setAlpha:", 0.0);
          v149[0] = v49;
          v149[1] = 3221225472;
          v149[2] = sub_A6ED4;
          v149[3] = &unk_28B960;
          v150 = v107;
          v108 = v107;
          objc_msgSend(v99, "addAnimations:", v149);

        }
        v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v151, v213, 16);
      }
      while (v102);
    }

    v93 = v125;
    -[BCViewPropertyAnimatorCounter animate:](v125, "animate:", v99);

    v94 = v140;
    v95 = v124;
  }
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "allValues"));
  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v145, v212, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v146;
    do
    {
      for (jj = 0; jj != v111; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v146 != v112)
          objc_enumerationMutation(v109);
        objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)jj), "setCounter:", v93);
      }
      v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v145, v212, 16);
    }
    while (v111);
  }

  -[BCCardStackTransitionAnimator setCoverControllers:](v139, "setCoverControllers:", v94);
  -[BCCardStackTransitionAnimator _adjustDuration:](v139, "_adjustDuration:", 0.5);
  v115 = v114;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v116 = v139->_additionalAnimations;
  v117 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v116, "countByEnumeratingWithState:objects:count:", &v141, v211, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v142;
    do
    {
      for (kk = 0; kk != v118; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v142 != v119)
          objc_enumerationMutation(v116);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)kk) + 16))(v115);
      }
      v118 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v116, "countByEnumeratingWithState:objects:count:", &v141, v211, 16);
    }
    while (v118);
  }

}

- (void)_animatePushByCrossfading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 cardsCanExpand;
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
  BOOL v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE v43[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextBackgroundViewKey")));
  cardsCanExpand = self->_cardsCanExpand;
  objc_msgSend(v4, "finalFrameForViewController:", v5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v18, "addSubview:", v19);

  if (v6)
    v20 = !cardsCanExpand;
  else
    v20 = 0;
  v21 = 1.0;
  if (!v20)
    v21 = 0.0;
  objc_msgSend(v7, "setAlpha:", v21);
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.3);
  v23 = v22;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_A71BC;
  v40[3] = &unk_28B808;
  v24 = v7;
  v41 = v24;
  v25 = v5;
  v42 = v25;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_A7208;
  v38[3] = &unk_28D678;
  v26 = v4;
  v39 = v26;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v40, v38, v23);
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.3);
  v28 = v27;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = self->_additionalAnimations;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i) + 16))(v28);
      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v31);
  }

}

- (void)_animatePopByCrossfading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v9;
  double v10;
  double v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  BOOL v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", CFSTR("BCUITransitionContextBackgroundViewKey")));
  v9 = self->_cardsCanExpand || v5 == 0;
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.3);
  v11 = v10;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_A746C;
  v28[3] = &unk_28BDD0;
  v31 = v9;
  v12 = v7;
  v29 = v12;
  v13 = v6;
  v30 = v13;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_A74C0;
  v26[3] = &unk_28D678;
  v14 = v4;
  v27 = v14;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v26, v11);
  -[BCCardStackTransitionAnimator _adjustDuration:](self, "_adjustDuration:", 0.3);
  v16 = v15;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_additionalAnimations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v21) + 16))(v16);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v19);
  }

}

+ (BOOL)_isSlowModeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BCCardStackTransitionAnimatorSlowModeEnabled"));

  return v3;
}

- (double)_debugDragCoefficient
{
  double v2;

  if (objc_msgSend((id)objc_opt_class(self), "_isSlowModeEnabled"))
    v2 = 3.0;
  else
    v2 = 1.0;
  return v2 * UIAnimationDragCoefficient();
}

- (double)_adjustDuration:(double)a3
{
  double v4;

  -[BCCardStackTransitionAnimator _debugDragCoefficient](self, "_debugDragCoefficient");
  return v4 * a3;
}

- (id)_adjustSpring:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  -[BCCardStackTransitionAnimator _debugDragCoefficient](self, "_debugDragCoefficient");
  v6 = v5;
  v7 = objc_alloc((Class)UISpringTimingParameters);
  objc_msgSend(v4, "mass");
  v9 = v8;
  objc_msgSend(v4, "stiffness");
  v11 = v10 / (v6 * v6);
  objc_msgSend(v4, "damping");
  v13 = v12 / v6;
  objc_msgSend(v4, "initialVelocity");
  v15 = v14;
  v17 = v16;

  return objc_msgSend(v7, "initWithMass:stiffness:damping:initialVelocity:", v9, v11, v13, v15, v17);
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (BOOL)prefersCrossfade
{
  return self->_prefersCrossfade;
}

- (void)setPrefersCrossfade:(BOOL)a3
{
  self->_prefersCrossfade = a3;
}

- (NSArray)coverMoveItems
{
  return self->_coverMoveItems;
}

- (void)setCoverMoveItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)cardMoveItems
{
  return self->_cardMoveItems;
}

- (void)setCardMoveItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)cardSlideItems
{
  return self->_cardSlideItems;
}

- (void)setCardSlideItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)coverFadeItems
{
  return self->_coverFadeItems;
}

- (void)setCoverFadeItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)velocityForPop
{
  return self->_velocityForPop;
}

- (void)setVelocityForPop:(double)a3
{
  self->_velocityForPop = a3;
}

- (NSMutableArray)viewsToBeCleanedUp
{
  return self->_viewsToBeCleanedUp;
}

- (void)setViewsToBeCleanedUp:(id)a3
{
  objc_storeStrong((id *)&self->_viewsToBeCleanedUp, a3);
}

- (NSDictionary)coverControllers
{
  return self->_coverControllers;
}

- (void)setCoverControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverControllers, 0);
  objc_storeStrong((id *)&self->_viewsToBeCleanedUp, 0);
  objc_storeStrong((id *)&self->_coverFadeItems, 0);
  objc_storeStrong((id *)&self->_cardSlideItems, 0);
  objc_storeStrong((id *)&self->_cardMoveItems, 0);
  objc_storeStrong((id *)&self->_coverMoveItems, 0);
  objc_storeStrong((id *)&self->_additionalAnimations, 0);
}

@end
