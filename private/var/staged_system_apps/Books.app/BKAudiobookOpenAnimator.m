@implementation BKAudiobookOpenAnimator

- (id)_zoomSpring
{
  id v3;
  double v4;
  double v5;
  id v6;
  void *v7;

  v3 = objc_alloc((Class)UISpringTimingParameters);
  if (-[BKBookOpenAnimator opening](self, "opening"))
    v4 = 300.0;
  else
    v4 = 325.0;
  if (-[BKBookOpenAnimator opening](self, "opening"))
    v5 = 35.0;
  else
    v5 = 30.0;
  v6 = objc_msgSend(v3, "initWithMass:stiffness:damping:initialVelocity:", 1.0, v4, v5, 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator adjustSpring:](self, "adjustSpring:", v6));

  return v7;
}

- (id)_customTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1051371084;
  LODWORD(v4) = 1045220557;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (double)duration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[BKAudiobookOpenAnimator zoomDuration](self, "zoomDuration");
  v4 = v3;
  -[BKAudiobookOpenAnimator controlsFadeInDelay](self, "controlsFadeInDelay");
  v6 = v5;
  -[BKAudiobookOpenAnimator controlsFadeDuration](self, "controlsFadeDuration");
  v8 = v6 + v7;
  if (-[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming") && v4 < v8)
    v4 = v8;
  -[BKAudiobookOpenAnimator toolbarFadeDuration](self, "toolbarFadeDuration");
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:");
  return v9 + v4;
}

- (BOOL)animatesCoverBounds
{
  return 1;
}

- (double)zoomDuration
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (-[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming"))
  {
    -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.7);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator _zoomSpring](self, "_zoomSpring"));
    objc_msgSend(v4, "settlingDuration");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)controlsFadeInDelay
{
  double result;

  if (!-[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming"))
    return 0.0;
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.23);
  return result;
}

- (double)controlsFadeDuration
{
  unsigned int v3;
  double v4;
  double result;

  if (-[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming"))
  {
    v3 = -[BKBookOpenAnimator opening](self, "opening");
    v4 = 0.2;
    if (v3)
      v4 = 0.47;
  }
  else
  {
    v4 = 0.16;
  }
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", v4);
  return result;
}

- (double)toolbarFadeDuration
{
  unsigned int v3;
  double v4;
  double result;

  v3 = -[BKBookOpenAnimator opening](self, "opening");
  v4 = 0.1;
  if (v3)
    v4 = 0.5;
  -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", v4);
  return result;
}

- (BKAudiobookOpenTransitioning)audiobookViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (-[BKBookOpenAnimator opening](self, "opening"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator toViewController](self, "toViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator fromViewController](self, "fromViewController"));
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAudiobookOpenTransitioning));
  v6 = objc_opt_class(UIViewController);
  v7 = BUClassAndProtocolCast(v5, v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (BKAudiobookOpenTransitioning *)v8;
}

- (double)animationScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
  objc_msgSend(v3, "transitionCoverFrame");
  v5 = v4;
  v7 = v6;

  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  return CGSizeScaleThatFitsInCGSize(v5, v7, v8, v9);
}

- (CAMediaTimingFunction)zoomTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1052602532;
  LODWORD(v4) = 1041865114;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (CAMediaTimingFunction)fadeTimingFunction
{
  return +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut);
}

- (void)_setControlsAlpha:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionControlsViews"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setAlpha:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_setLayerShadowOpacity:(float)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator coverControlView](self, "coverControlView"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));

  *(float *)&v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  objc_msgSend(v7, "setValue:forKeyPath:", v6, CFSTR("shadowOpacity"));

}

- (void)_setToolbarAlpha:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionToolbarViews"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setAlpha:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_setupViews
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;
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
  id v22;
  void *v23;
  void *v24;
  id v25;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
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
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double CenterNoRounding;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  id v91;
  double v92;
  CGFloat v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  CGAffineTransform *v107;
  __int128 v108;
  CGAffineTransform *v109;
  void *v110;
  __int128 v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  _OWORD v133[3];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _OWORD v137[3];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v143;
  CGAffineTransform v144;

  v3 = -[BKBookOpenAnimator opening](self, "opening");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v7 = objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);

    v8 = 0.0;
    v9 = 1.0;
  }
  else
  {
    v8 = 1.0;
    v9 = 0.0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionBackgroundImageView"));
  v11 = objc_alloc((Class)UIImageView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
  objc_msgSend(v10, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
  v22 = objc_msgSend(v11, "initWithFrame:");
  -[BKAudiobookOpenAnimator setBackgroundView:](self, "setBackgroundView:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator backgroundView](self, "backgroundView"));
  objc_msgSend(v24, "setBackgroundColor:", v23);

  v25 = objc_msgSend(v10, "contentMode");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator backgroundView](self, "backgroundView"));
  objc_msgSend(v26, "setContentMode:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator backgroundView](self, "backgroundView"));
  objc_msgSend(v28, "setImage:", v27);

  objc_msgSend(v10, "setAlpha:", 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator backgroundView](self, "backgroundView"));
  objc_msgSend(v29, "addSubview:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
  objc_msgSend(v31, "addSubview:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v33, "addSubview:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator backgroundView](self, "backgroundView"));
  v132 = v8;
  objc_msgSend(v35, "setAlpha:", v8);

  v131 = v9;
  -[BKAudiobookOpenAnimator setBackgroundToAlpha:](self, "setBackgroundToAlpha:", v9);
  objc_msgSend(v5, "transitionCoverFrame");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "superview"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v45, "convertRect:fromView:", v46, v37, v39, v41, v43);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;

  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v57 = v55;
  v58 = v56;
  v60 = v59;
  v62 = v61;
  if (!v3)
  {
    v55 = v48;
    v56 = v50;
  }
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v55, v56);
  v63 = v52;
  v64 = v50;
  v65 = v48;
  v66 = v54;
  if ((v3 & 1) == 0)
  {
    v63 = v60;
    v64 = v58;
    v65 = v57;
    v66 = v62;
  }
  CenterNoRounding = CGRectGetCenterNoRounding(-[BKAudiobookOpenAnimator setCoverToFrame:](self, "setCoverToFrame:", v65, v64, v63, v66), v57, v58, v60, v62);
  v69 = v68;
  CGRectGetCenterNoRounding(v70, v48, v50, v52, v54);
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v71, "frame");
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v79 = v78;

  v81 = CGRectGetCenterNoRounding(v80, v73, v75, v77, v79);
  v83 = v82;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "superview"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "superview"));
  v88 = CGPointSubtract(objc_msgSend(v85, "convertPoint:toView:", v87, v81, v83));
  v90 = v89;

  v91 = -[BKAudiobookOpenAnimator animationScale](self, "animationScale");
  v93 = v92;
  CGPointMultiply(v91, v88, v90, v92);
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "superview"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "superview"));
  v98 = CGPointAdd(objc_msgSend(v95, "convertPoint:fromView:", v97, CenterNoRounding, v69));
  v100 = v99;

  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v102 = v101;
  if (v3)
    v103 = v100;
  else
    v103 = v83;
  if (v3)
    v104 = v98;
  else
    v104 = v81;
  if (v3)
  {
    v100 = v83;
    v98 = v81;
  }
  objc_msgSend(v101, "setCenter:", v104, v103);

  -[BKAudiobookOpenAnimator setAudiobookToCenter:](self, "setAudiobookToCenter:", v98, v100);
  memset(&v144, 0, sizeof(v144));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v106 = v105;
  if (v105)
    objc_msgSend(v105, "transform");
  else
    memset(&v144, 0, sizeof(v144));

  memset(&v143, 0, sizeof(v143));
  CGAffineTransformMakeScale(&t2, v93, v93);
  t1 = v144;
  CGAffineTransformConcat(&v143, &t1, &t2);
  if (v3)
    v107 = &v143;
  else
    v107 = &v144;
  v108 = *(_OWORD *)&v107->c;
  v138 = *(_OWORD *)&v107->a;
  v139 = v108;
  v140 = *(_OWORD *)&v107->tx;
  if (v3)
    v109 = &v144;
  else
    v109 = &v143;
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v137[0] = v138;
  v137[1] = v139;
  v137[2] = v140;
  objc_msgSend(v110, "setTransform:", v137);

  v111 = *(_OWORD *)&v109->c;
  v134 = *(_OWORD *)&v109->a;
  v135 = v111;
  v136 = *(_OWORD *)&v109->tx;
  v133[0] = v134;
  v133[1] = v111;
  v133[2] = v136;
  -[BKAudiobookOpenAnimator setAudiobookToTransform:](self, "setAudiobookToTransform:", v133);
  v112 = 1.0;
  v113 = 1.0;
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    if (-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
      v113 = 0.0;
    else
      v113 = 1.0;
  }
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
  objc_msgSend(v114, "setAlpha:", v113);

  if (!-[BKBookOpenAnimator opening](self, "opening"))
  {
    if (-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
      v112 = 0.0;
    else
      v112 = 1.0;
  }
  -[BKAudiobookOpenAnimator setBookContainerToAlpha:](self, "setBookContainerToAlpha:", v112);
  -[BKAudiobookOpenAnimator _setControlsAlpha:](self, "_setControlsAlpha:", v132);
  -[BKAudiobookOpenAnimator setControlsToAlpha:](self, "setControlsToAlpha:", v131);
  if (v3)
  {
    v115 = 0.0;
    -[BKAudiobookOpenAnimator _setToolbarAlpha:](self, "_setToolbarAlpha:", 0.0);
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
    objc_msgSend(v116, "transitionToolbarAlpha");
    -[BKAudiobookOpenAnimator setToolbarToAlpha:](self, "setToolbarToAlpha:");

    if (-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
      v117 = 0.0;
    else
      v117 = 1.0;
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v118, "setAlpha:", v117);

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImageView](self, "coverImageView"));
    objc_msgSend(v119, "_setContinuousCornerRadius:", 0.0);

    objc_msgSend(v5, "coverCornerRadius");
    -[BKAudiobookOpenAnimator setCoverToCornerRadius:](self, "setCoverToCornerRadius:");
  }
  else
  {
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoverImagePlayControl"));
    -[BKAudiobookOpenAnimator setCoverControlView:](self, "setCoverControlView:", v120);

    v121 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
    objc_msgSend(v121, "transitionCoverImagePlayControlShadowOpacityValue");
    *(float *)&v122 = v122;
    -[BKAudiobookOpenAnimator _setLayerShadowOpacity:](self, "_setLayerShadowOpacity:", v122);

    LODWORD(v123) = 0;
    -[BKAudiobookOpenAnimator setCoverControlViewToShadowOpacity:](self, "setCoverControlViewToShadowOpacity:", v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator coverControlView](self, "coverControlView"));
    objc_msgSend(v124, "addAnimatablePropertyWithKey:", CFSTR("shadowOpacity"));

    v125 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
    objc_msgSend(v125, "transitionToolbarAlpha");
    -[BKAudiobookOpenAnimator _setToolbarAlpha:](self, "_setToolbarAlpha:");

    -[BKAudiobookOpenAnimator setToolbarToAlpha:](self, "setToolbarToAlpha:", 0.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    objc_msgSend(v126, "setAlpha:", 0.0);

    objc_msgSend(v5, "coverCornerRadius");
    v128 = v127;
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImageView](self, "coverImageView"));
    objc_msgSend(v129, "_setContinuousCornerRadius:", v128);

    -[BKAudiobookOpenAnimator setCoverToCornerRadius:](self, "setCoverToCornerRadius:", 0.0);
    if (-[BKBookOpenAnimator fadeInCover](self, "fadeInCover"))
      v115 = 0.0;
    else
      v115 = 1.0;
  }
  -[BKAudiobookOpenAnimator setCoverToAlpha:](self, "setCoverToAlpha:", v115);
  if ((objc_msgSend(v5, "transitionHasCustomArtwork") & 1) == 0)
  {
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
    objc_msgSend(v130, "setAlpha:", v131);

    -[BKAudiobookOpenAnimator setCoverShadowToAlpha:](self, "setCoverShadowToAlpha:", v132);
  }

}

- (void)animateNonInteractive
{
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  unsigned __int8 v19;
  double v20;
  id v21;
  _QWORD *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  double v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  _QWORD v38[5];
  _QWORD v39[5];
  unsigned __int8 v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  unsigned __int8 v44;
  char v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  _QWORD v49[6];
  char v50;
  _QWORD v51[5];
  _QWORD v52[5];

  v3 = -[BKBookOpenAnimator opening](self, "opening");
  if (v3 && !-[BKAudiobookOpenAnimator contentLoaded](self, "contentLoaded"))
  {
    -[BKAudiobookOpenAnimator setWaitingForContentLoaded:](self, "setWaitingForContentLoaded:", 1);
  }
  else
  {
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v52[3] = 0;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000E4DA0;
    v51[3] = &unk_1008E7BE8;
    v51[4] = v52;
    v4 = objc_retainBlock(v51);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000E4DB8;
    v49[3] = &unk_1008EA928;
    v49[4] = self;
    v49[5] = v52;
    v50 = v3;
    v5 = objc_retainBlock(v49);
    -[BKAudiobookOpenAnimator _setupViews](self, "_setupViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
    v37 = objc_msgSend(v6, "transitionHasCustomArtwork");
    -[BKAudiobookOpenAnimator zoomDuration](self, "zoomDuration");
    v8 = v7;
    -[BKAudiobookOpenAnimator toolbarFadeDuration](self, "toolbarFadeDuration");
    v10 = v9;
    -[BKAudiobookOpenAnimator controlsFadeInDelay](self, "controlsFadeInDelay");
    v12 = v11;
    -[BKAudiobookOpenAnimator controlsFadeDuration](self, "controlsFadeDuration");
    v14 = v13;
    if (v3)
      v15 = 0.0;
    else
      v15 = v10;
    if (-[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming"))
      v16 = objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator zoomTimingFunction](self, "zoomTimingFunction"));
    else
      v16 = objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator _customTimingFunction](self, "_customTimingFunction"));
    v17 = (void *)v16;
    -[BKBookOpenAnimator animateNavigationBarPrepare](self, "animateNavigationBarPrepare");
    v18 = v8 * 0.25;
    if (v3)
      v18 = 0.0;
    -[BKBookOpenAnimator animateNavigationBarWithDuration:delay:](self, "animateNavigationBarWithDuration:delay:", v8 * 0.5, v18);
    ((void (*)(_QWORD *))v4[2])(v4);
    v19 = -[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming");
    v20 = v8;
    if ((v19 & 1) == 0)
      -[BKBookOpenAnimator adjustDuration:](self, "adjustDuration:", 0.3);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000E4E84;
    v48[3] = &unk_1008E72C0;
    v48[4] = self;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v17, 0, v48, v5, v20, v15);
    ((void (*)(_QWORD *))v4[2])(v4);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000E4ED8;
    v46[3] = &unk_1008E7338;
    v46[4] = self;
    v21 = v6;
    v47 = v21;
    v22 = objc_retainBlock(v46);
    if (-[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator zoomTimingFunction](self, "zoomTimingFunction"));
      +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v23, 0, v22, v5, v8, v15);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator _zoomSpring](self, "_zoomSpring"));
      objc_msgSend(v23, "mass");
      v25 = v24;
      objc_msgSend(v23, "stiffness");
      v27 = v26;
      objc_msgSend(v23, "damping");
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v22, v5, v8, v15, v25, v27, v28, 0.0);
    }

    ((void (*)(_QWORD *))v4[2])(v4);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000E4F94;
    v43[3] = &unk_1008E7F28;
    v43[4] = self;
    v44 = v37;
    v45 = v3;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v17, 0, v43, v5, v8, v15);
    ((void (*)(_QWORD *))v4[2])(v4);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000E507C;
    v42[3] = &unk_1008E72C0;
    v42[4] = self;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v17, 0, v42, v5, v8, v15);
    ((void (*)(_QWORD *))v4[2])(v4);
    if (v3)
      v29 = v12;
    else
      v29 = v10;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000E50D0;
    v41[3] = &unk_1008E72C0;
    v41[4] = self;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v17, 0, v41, v5, v14, v29);
    ((void (*)(_QWORD *))v4[2])(v4);
    v30 = 0.0;
    if (v3)
    {
      v31 = -[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming");
      v32 = 0.7;
      if (v31)
        v32 = 1.0;
      v30 = v8 * v32;
    }
    v33 = -[BKAudiobookOpenAnimator useLegacyTiming](self, "useLegacyTiming");
    v34 = v17;
    if (v33)
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator fadeTimingFunction](self, "fadeTimingFunction"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000E50F8;
    v39[3] = &unk_1008E83C0;
    v40 = v37;
    v39[4] = self;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v34, 0, v39, v5, v10, v30);
    if (v33)

    ((void (*)(_QWORD *))v4[2])(v4);
    -[BKBookOpenAnimator minibarKeyFrameAnimationWithDuration:hide:show:completion:](self, "minibarKeyFrameAnimationWithDuration:hide:show:completion:", v5, v8, 0.2, 0.2);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000E515C;
    v38[3] = &unk_1008E72C0;
    v38[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v38, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v35, "postEvent:sender:", kBETestDriverOpenAnimationSetupEnd, self);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v36, "postEvent:sender:", kBETestDriverOpenAnimationZoomStart, self);

    kdebug_trace(725353052, 0, 0, 0, 0);
    _Block_object_dispose(v52, 8);
  }
}

- (void)animationsDidFinish
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  objc_super v7;
  _OWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionBackgroundImageView"));
  objc_msgSend(v4, "setAlpha:", 1.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v5, "setTransform:", v8);

  -[BKAudiobookOpenAnimator _setControlsAlpha:](self, "_setControlsAlpha:", 1.0);
  -[BKAudiobookOpenAnimator toolbarToAlpha](self, "toolbarToAlpha");
  -[BKAudiobookOpenAnimator _setToolbarAlpha:](self, "_setToolbarAlpha:");
  v7.receiver = self;
  v7.super_class = (Class)BKAudiobookOpenAnimator;
  -[BKBookOpenAnimator animationsDidFinish](&v7, "animationsDidFinish");

}

- (void)_teardownLocalViews
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator backgroundView](self, "backgroundView"));
  objc_msgSend(v3, "removeFromSuperview");

  -[BKAudiobookOpenAnimator setBackgroundView:](self, "setBackgroundView:", 0);
}

- (void)teardownViews:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKAudiobookOpenAnimator _teardownLocalViews](self, "_teardownLocalViews");
  v5.receiver = self;
  v5.super_class = (Class)BKAudiobookOpenAnimator;
  -[BKBookOpenAnimator teardownViews:](&v5, "teardownViews:", v3);
}

- (int64_t)coverContentMode
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookOpenAnimator audiobookViewController](self, "audiobookViewController"));
    v5 = (int64_t)objc_msgSend(v4, "coverContentMode");

  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (void)bookContentDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookOpenAnimator;
  -[BKBookOpenAnimator bookContentDidLoad](&v3, "bookContentDidLoad");
  if (!-[BKAudiobookOpenAnimator contentLoaded](self, "contentLoaded"))
  {
    -[BKAudiobookOpenAnimator setContentLoaded:](self, "setContentLoaded:", 1);
    if (-[BKAudiobookOpenAnimator waitingForContentLoaded](self, "waitingForContentLoaded"))
    {
      -[BKAudiobookOpenAnimator setWaitingForContentLoaded:](self, "setWaitingForContentLoaded:", 0);
      -[BKAudiobookOpenAnimator animateNonInteractive](self, "animateNonInteractive");
    }
  }
}

- (BOOL)useLegacyTiming
{
  return self->_useLegacyTiming;
}

- (void)setUseLegacyTiming:(BOOL)a3
{
  self->_useLegacyTiming = a3;
}

- (BOOL)contentLoaded
{
  return self->_contentLoaded;
}

- (void)setContentLoaded:(BOOL)a3
{
  self->_contentLoaded = a3;
}

- (BOOL)waitingForContentLoaded
{
  return self->_waitingForContentLoaded;
}

- (void)setWaitingForContentLoaded:(BOOL)a3
{
  self->_waitingForContentLoaded = a3;
}

- (UIImageView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)coverControlView
{
  return self->_coverControlView;
}

- (void)setCoverControlView:(id)a3
{
  objc_storeStrong((id *)&self->_coverControlView, a3);
}

- (double)backgroundToAlpha
{
  return self->_backgroundToAlpha;
}

- (void)setBackgroundToAlpha:(double)a3
{
  self->_backgroundToAlpha = a3;
}

- (CGRect)coverToFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_coverToFrame.origin.x;
  y = self->_coverToFrame.origin.y;
  width = self->_coverToFrame.size.width;
  height = self->_coverToFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCoverToFrame:(CGRect)a3
{
  self->_coverToFrame = a3;
}

- (CGPoint)audiobookToCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_audiobookToCenter.x;
  y = self->_audiobookToCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAudiobookToCenter:(CGPoint)a3
{
  self->_audiobookToCenter = a3;
}

- (CGAffineTransform)audiobookToTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].b;
  return self;
}

- (void)setAudiobookToTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_audiobookToTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_audiobookToTransform.c = v4;
  *(_OWORD *)&self->_audiobookToTransform.tx = v3;
}

- (double)controlsToAlpha
{
  return self->_controlsToAlpha;
}

- (void)setControlsToAlpha:(double)a3
{
  self->_controlsToAlpha = a3;
}

- (float)coverControlViewToShadowOpacity
{
  return self->_coverControlViewToShadowOpacity;
}

- (void)setCoverControlViewToShadowOpacity:(float)a3
{
  self->_coverControlViewToShadowOpacity = a3;
}

- (double)toolbarToAlpha
{
  return self->_toolbarToAlpha;
}

- (void)setToolbarToAlpha:(double)a3
{
  self->_toolbarToAlpha = a3;
}

- (double)coverToAlpha
{
  return self->_coverToAlpha;
}

- (void)setCoverToAlpha:(double)a3
{
  self->_coverToAlpha = a3;
}

- (double)coverToCornerRadius
{
  return self->_coverToCornerRadius;
}

- (void)setCoverToCornerRadius:(double)a3
{
  self->_coverToCornerRadius = a3;
}

- (double)coverShadowToAlpha
{
  return self->_coverShadowToAlpha;
}

- (void)setCoverShadowToAlpha:(double)a3
{
  self->_coverShadowToAlpha = a3;
}

- (double)bookContainerToAlpha
{
  return self->_bookContainerToAlpha;
}

- (void)setBookContainerToAlpha:(double)a3
{
  self->_bookContainerToAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverControlView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
