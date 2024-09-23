@implementation BKPageSlide

- (BKPageSlide)init
{
  BKPageSlide *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPageSlide;
  result = -[BKPageSlide init](&v3, "init");
  if (result)
    result->_ongoingAnimationCount = 0;
  return result;
}

- (void)setupSlideAnimationFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  double height;
  void *v48;
  void *v49;
  double v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *j;
  id v63;
  UIView *v64;
  UIView *scrimView;
  void *v66;
  void *v67;
  double v68;
  CGPoint *p_topViewToCenter;
  double Width;
  double v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BOOL4 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  -[BKPageAnimation setState:](self, "setState:", 0);
  v84 = v9;
  -[BKPageAnimation setIsGoingToNextPage:](self, "setIsGoingToNextPage:", v10 ^ v9);
  v17 = v14;
  objc_msgSend(v16, "setClipsToBounds:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
  v81 = (void *)v19;
  v82 = v18;
  if (v8)
  {
    v20 = (void *)v19;
    objc_msgSend(v18, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v20, "frame");
    objc_msgSend(v18, "setFrame:");
    objc_msgSend(v20, "setFrame:", v22, v24, v26, v28);
    v80 = v17;
  }
  else
  {
    objc_msgSend(v16, "bounds");
    objc_msgSend(v18, "setFrame:");
    if (objc_msgSend(v15, "count"))
    {
      if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage") && v9)
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
      else
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
      v30 = (void *)v29;
      v31 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v29));

      v15 = (id)v31;
    }
    if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage") && v9)
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    else
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
    v33 = (void *)v32;
    objc_msgSend(v16, "bounds");
    objc_msgSend(v33, "setFrame:");
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v33));

  }
  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    v34 = v17;
  else
    v34 = v15;
  v35 = v34;
  v83 = v17;
  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    v36 = v15;
  else
    v36 = v17;
  v37 = v36;
  v38 = objc_alloc((Class)UIView);
  objc_msgSend(v16, "bounds");
  v39 = objc_msgSend(v38, "initWithFrame:");
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v41 = objc_msgSend(v40, "CGColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  objc_msgSend(v42, "setShadowColor:", v41);

  objc_msgSend(v39, "bounds");
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
  v44 = objc_msgSend(v43, "CGPath");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  objc_msgSend(v45, "setShadowPath:", v44);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  objc_msgSend(v46, "setShadowRadius:", 50.0);

  height = CGSizeZero.height;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  objc_msgSend(v48, "setShadowOffset:", CGSizeZero.width, height);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layer"));
  LODWORD(v50) = 1060320051;
  objc_msgSend(v49, "setShadowOpacity:", v50);

  v51 = objc_alloc((Class)UIView);
  objc_msgSend(v16, "bounds");
  v52 = objc_msgSend(v51, "initWithFrame:");
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v53 = v35;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v90 != v56)
          objc_enumerationMutation(v53);
        objc_msgSend(v39, "addSubview:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i));
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    }
    while (v55);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v58 = v37;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v60; j = (char *)j + 1)
      {
        if (*(_QWORD *)v86 != v61)
          objc_enumerationMutation(v58);
        objc_msgSend(v52, "addSubview:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j));
      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    }
    while (v60);
  }

  objc_msgSend(v16, "addSubview:", v52);
  objc_msgSend(v16, "addSubview:", v39);
  objc_storeStrong((id *)&self->_topPagesView, v39);
  objc_storeStrong((id *)&self->_bottomPagesView, v52);
  v63 = objc_alloc((Class)UIView);
  objc_msgSend(v16, "bounds");
  v64 = (UIView *)objc_msgSend(v63, "initWithFrame:");
  scrimView = self->_scrimView;
  self->_scrimView = v64;

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_scrimView, "setBackgroundColor:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_scrimView, "layer"));
  LODWORD(v68) = 1050253722;
  objc_msgSend(v67, "setOpacity:", v68);

  objc_msgSend(v52, "addSubview:", self->_scrimView);
  p_topViewToCenter = &self->_topViewToCenter;
  if (v84)
  {
    objc_msgSend(v16, "bounds");
    Width = CGRectGetWidth(v95);
    objc_msgSend(v39, "bounds");
    v71 = Width + CGRectGetWidth(v96) * 0.5 + 50.0;
  }
  else
  {
    objc_msgSend(v39, "center");
    v71 = -50.0 - v72;
  }
  objc_msgSend(v39, "center");
  p_topViewToCenter->x = v71;
  self->_topViewToCenter.y = v73;
  objc_msgSend(v39, "center");
  self->_topViewFromCenter.x = v74;
  self->_topViewFromCenter.y = v75;
  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    objc_msgSend(v39, "setCenter:", p_topViewToCenter->x, self->_topViewToCenter.y);
  objc_msgSend(v52, "bounds");
  v76 = CGRectGetWidth(v97) * 0.25;
  objc_msgSend(v52, "center");
  self->_bottomViewToCenter.x = v77;
  self->_bottomViewToCenter.y = v78;
  if (!v84)
  {
    objc_msgSend(v16, "bounds");
    v76 = CGRectGetWidth(v98) - v76;
  }
  objc_msgSend(v39, "center");
  self->_bottomViewFromCenter.x = v76;
  self->_bottomViewFromCenter.y = v79;
  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    objc_msgSend(v52, "setCenter:", self->_bottomViewToCenter.x, self->_bottomViewToCenter.y);

}

- (id)springAnimationForKeyPath:(id)a3 stiffness:(double)a4 damping:(double)a5 from:(CGPoint)a6 to:(CGPoint)a7
{
  double y;
  double x;
  double v9;
  double v10;
  void *v14;
  void *v15;
  void *v16;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", a3));
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setMass:", 1.0);
  objc_msgSend(v14, "setStiffness:", a4);
  objc_msgSend(v14, "setDamping:", a5);
  objc_msgSend(v14, "setInitialVelocity:", 0.0);
  objc_msgSend(v14, "setRemovedOnCompletion:", 0);
  objc_msgSend(v14, "settlingDuration");
  objc_msgSend(v14, "setDuration:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v10, v9));
  objc_msgSend(v14, "setFromValue:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](NSValue, "valueWithPoint:", x, y));
  objc_msgSend(v14, "setToValue:", v16);

  if (!-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    objc_msgSend(v14, "ae_reverseValues");
  return v14;
}

- (void)autoSlideFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8 completion:(id)a9
{
  void *v10;
  void *v11;
  void *v12;
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
  id v23;

  -[BKPageSlide setupSlideAnimationFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:](self, "setupSlideAnimationFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:", a3, a4, a5, a6, a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageAnimation pageAnimationDelegate](self, "pageAnimationDelegate"));
  objc_msgSend(v10, "pageAnimationWillBegin:", self);

  +[CATransaction begin](CATransaction, "begin");
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BKPageSlide springAnimationForKeyPath:stiffness:damping:from:to:](self, "springAnimationForKeyPath:stiffness:damping:from:to:", CFSTR("position"), 250.0, 35.0, self->_topViewFromCenter.x, self->_topViewFromCenter.y, self->_topViewToCenter.x, self->_topViewToCenter.y));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide springAnimationForKeyPath:stiffness:damping:from:to:](self, "springAnimationForKeyPath:stiffness:damping:from:to:", CFSTR("position"), 350.0, 50.0, self->_bottomViewFromCenter.x, self->_bottomViewFromCenter.y, self->_bottomViewToCenter.x, self->_bottomViewToCenter.y));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setToValue:", &off_1CD6C8);
  objc_msgSend(v12, "setFromValue:", &off_1CD6D8);
  objc_msgSend(v11, "settlingDuration");
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setRemovedOnCompletion:", 0);
  objc_msgSend(v12, "setFillMode:", kCAFillModeForwards);
  LODWORD(v13) = 1051260355;
  LODWORD(v14) = 1059816735;
  LODWORD(v15) = 0;
  LODWORD(v16) = 1.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v13, v15, v14, v16));
  objc_msgSend(v12, "setTimingFunction:", v17);

  if (!-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    objc_msgSend(v12, "ae_reverseValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide topPagesView](self, "topPagesView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v19, "addAnimation:forKey:", v23, CFSTR("kPageSlideAnimationNameTopPages"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide bottomPagesView](self, "bottomPagesView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
  objc_msgSend(v21, "addAnimation:forKey:", v11, CFSTR("kPageSlideAnimationNameBottomPages"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_scrimView, "layer"));
  objc_msgSend(v22, "addAnimation:forKey:", v12, CFSTR("kPageSlideAnimationNameScrimView"));

  +[CATransaction commit](CATransaction, "commit");
}

- (CGPoint)contextualTopViewFromCenter
{
  double v3;
  double v4;
  CGPoint result;

  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    -[BKPageSlide topViewFromCenter](self, "topViewFromCenter");
  else
    -[BKPageSlide topViewToCenter](self, "topViewToCenter");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contextualTopViewToCenter
{
  double v3;
  double v4;
  CGPoint result;

  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    -[BKPageSlide topViewToCenter](self, "topViewToCenter");
  else
    -[BKPageSlide topViewFromCenter](self, "topViewFromCenter");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contextualBottomViewFromCenter
{
  double v3;
  double v4;
  CGPoint result;

  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    -[BKPageSlide bottomViewFromCenter](self, "bottomViewFromCenter");
  else
    -[BKPageSlide bottomViewToCenter](self, "bottomViewToCenter");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contextualBottomViewToCenter
{
  double v3;
  double v4;
  CGPoint result;

  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
    -[BKPageSlide bottomViewToCenter](self, "bottomViewToCenter");
  else
    -[BKPageSlide bottomViewFromCenter](self, "bottomViewFromCenter");
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)initiateManualAnimationFromPages:(id)a3 toPages:(id)a4 inContainer:(id)a5 isForwardAnimation:(BOOL)a6 isRTL:(BOOL)a7 isZoomedToSpread:(BOOL)a8
{
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;

  -[BKPageSlide setupSlideAnimationFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:](self, "setupSlideAnimationFromPages:toPages:inContainer:isForwardAnimation:isRTL:isZoomedToSpread:", a3, a4, a5, a6, a7, a8);
  -[BKPageAnimation setIsInteractive:](self, "setIsInteractive:", 1);
  if (-[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage"))
  {
    -[BKPageSlide topViewFromCenter](self, "topViewFromCenter");
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide topPagesView](self, "topPagesView"));
    objc_msgSend(v13, "setCenter:", v10, v12);

    -[BKPageSlide bottomViewFromCenter](self, "bottomViewFromCenter");
  }
  else
  {
    -[BKPageSlide topViewToCenter](self, "topViewToCenter");
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide topPagesView](self, "topPagesView"));
    objc_msgSend(v20, "setCenter:", v17, v19);

    -[BKPageSlide bottomViewToCenter](self, "bottomViewToCenter");
  }
  v21 = v14;
  v22 = v15;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BKPageSlide bottomPagesView](self, "bottomPagesView"));
  objc_msgSend(v23, "setCenter:", v21, v22);

}

- (void)beginManualAnimationAtLocation:(CGPoint)a3
{
  id v4;

  -[BKPageSlide setManualCurlStartPosition:](self, "setManualCurlStartPosition:", a3.x, a3.y);
  -[BKPageSlide setManualCurlCurrentTime:](self, "setManualCurlCurrentTime:", CFAbsoluteTimeGetCurrent());
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKPageAnimation pageAnimationDelegate](self, "pageAnimationDelegate"));
  objc_msgSend(v4, "pageAnimationWillBegin:", self);

}

- (void)updateManualAnimationToLocation:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unsigned int v21;
  double v22;
  float v23;
  double v24;
  id v25;
  CGRect v26;

  x = a3.x;
  self->_manualCurlCurrentTime = CFAbsoluteTimeGetCurrent();
  -[UIView bounds](self->_topPagesView, "bounds");
  v5 = CGRectGetWidth(v26) * 0.5;
  if (v5 != 0.0)
  {
    v6 = fmax(fmin(vabdd_f64(x, self->_manualCurlStartPosition.x) / v5, 1.0), 0.0);
    -[BKPageSlide contextualTopViewToCenter](self, "contextualTopViewToCenter");
    v8 = v7;
    -[BKPageSlide contextualTopViewFromCenter](self, "contextualTopViewFromCenter");
    v10 = v9;
    v12 = v11 - (v11 - v8) * v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide topPagesView](self, "topPagesView"));
    objc_msgSend(v13, "setCenter:", v12, v10);

    -[BKPageSlide contextualBottomViewToCenter](self, "contextualBottomViewToCenter");
    v15 = v14;
    -[BKPageSlide contextualBottomViewFromCenter](self, "contextualBottomViewFromCenter");
    v17 = v16;
    v19 = v18 - (v18 - v15) * v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageSlide bottomPagesView](self, "bottomPagesView"));
    objc_msgSend(v20, "setCenter:", v19, v17);

    v21 = -[BKPageAnimation isGoingToNextPage](self, "isGoingToNextPage");
    v22 = 1.0 - v6;
    if (!v21)
      v22 = v6;
    v23 = v22 * 0.300000012;
    v25 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_scrimView, "layer"));
    *(float *)&v24 = v23;
    objc_msgSend(v25, "setOpacity:", v24);

  }
}

- (void)finishManualAnimation
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B180C;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_B18DC;
  v2[3] = &unk_1BEA88;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, v2, 0.300000012);
}

- (void)cancelManualAnimation
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B19B8;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_B1A88;
  v2[3] = &unk_1BEA88;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, v2, 0.300000012);
}

- (void)animationDidStart:(id)a3
{
  -[BKPageAnimation setState:](self, "setState:", 1);
  -[BKPageSlide setOngoingAnimationCount:](self, "setOngoingAnimationCount:", (char *)-[BKPageSlide ongoingAnimationCount](self, "ongoingAnimationCount") + 1);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  UIView *scrimView;

  v4 = a4;
  v6 = a3;
  -[BKPageSlide setOngoingAnimationCount:](self, "setOngoingAnimationCount:", (char *)-[BKPageSlide ongoingAnimationCount](self, "ongoingAnimationCount") - 1);
  if (!-[BKPageSlide ongoingAnimationCount](self, "ongoingAnimationCount"))
  {
    if (v4)
      v7 = 2;
    else
      v7 = 4;
    -[BKPageAnimation setState:](self, "setState:", v7);
    -[BKPageAnimation setFinished:](self, "setFinished:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageAnimation pageAnimationDelegate](self, "pageAnimationDelegate"));
    objc_msgSend(v8, "pageAnimation:didFinish:", self, 1);

    v9 = objc_claimAutoreleasedReturnValue(-[BKPageSlide completionBlock](self, "completionBlock"));
    v10 = (void *)v9;
    if (v9)
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    -[BKPageSlide setCompletionBlock:](self, "setCompletionBlock:", 0);

    -[BKPageSlide _cleanup](self, "_cleanup");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_scrimView, "layer"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "animationForKey:", CFSTR("kPageSlideAnimationNameScrimView")));

  if (v12 == v6)
  {
    -[UIView removeFromSuperview](self->_scrimView, "removeFromSuperview");
    scrimView = self->_scrimView;
    self->_scrimView = 0;

  }
}

- (void)_cleanup
{
  -[BKPageAnimation setPageAnimationDelegate:](self, "setPageAnimationDelegate:", 0);
}

- (int64_t)ongoingAnimationCount
{
  return self->_ongoingAnimationCount;
}

- (void)setOngoingAnimationCount:(int64_t)a3
{
  self->_ongoingAnimationCount = a3;
}

- (UIView)topPagesView
{
  return self->_topPagesView;
}

- (void)setTopPagesView:(id)a3
{
  objc_storeStrong((id *)&self->_topPagesView, a3);
}

- (UIView)bottomPagesView
{
  return self->_bottomPagesView;
}

- (void)setBottomPagesView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomPagesView, a3);
}

- (CGPoint)bottomViewToCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomViewToCenter.x;
  y = self->_bottomViewToCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomViewToCenter:(CGPoint)a3
{
  self->_bottomViewToCenter = a3;
}

- (CGPoint)bottomViewFromCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomViewFromCenter.x;
  y = self->_bottomViewFromCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomViewFromCenter:(CGPoint)a3
{
  self->_bottomViewFromCenter = a3;
}

- (CGPoint)topViewToCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_topViewToCenter.x;
  y = self->_topViewToCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopViewToCenter:(CGPoint)a3
{
  self->_topViewToCenter = a3;
}

- (CGPoint)topViewFromCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_topViewFromCenter.x;
  y = self->_topViewFromCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopViewFromCenter:(CGPoint)a3
{
  self->_topViewFromCenter = a3;
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
  objc_storeStrong((id *)&self->_scrimView, a3);
}

- (CGPoint)manualCurlStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_manualCurlStartPosition.x;
  y = self->_manualCurlStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setManualCurlStartPosition:(CGPoint)a3
{
  self->_manualCurlStartPosition = a3;
}

- (double)manualCurlCurrentTime
{
  return self->_manualCurlCurrentTime;
}

- (void)setManualCurlCurrentTime:(double)a3
{
  self->_manualCurlCurrentTime = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);
  objc_storeStrong((id *)&self->_bottomPagesView, 0);
  objc_storeStrong((id *)&self->_topPagesView, 0);
}

@end
