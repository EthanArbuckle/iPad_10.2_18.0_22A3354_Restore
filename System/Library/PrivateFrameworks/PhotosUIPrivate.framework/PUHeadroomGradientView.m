@implementation PUHeadroomGradientView

- (PUHeadroomGradientView)initWithFrame:(CGRect)a3
{
  PUHeadroomGradientView *v3;
  PUHeadroomVariableBlurView *v4;
  PUHeadroomVariableBlurView *blurView;
  uint64_t v6;
  CAGradientLayer *bottomGradientLayer;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CAGradientLayer *topGradientLayer;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PUHeadroomGradientView;
  v3 = -[PUHeadroomGradientView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PUHeadroomVariableBlurView);
    blurView = v3->_blurView;
    v3->_blurView = v4;

    -[PUHeadroomVariableBlurView setAlpha:](v3->_blurView, "setAlpha:", 0.0);
    -[PUHeadroomGradientView addSubview:](v3, "addSubview:", v3->_blurView);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    bottomGradientLayer = v3->_bottomGradientLayer;
    v3->_bottomGradientLayer = (CAGradientLayer *)v6;

    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[CAGradientLayer setAnchorPoint:](v3->_bottomGradientLayer, "setAnchorPoint:", *MEMORY[0x1E0C9D538], v9);
    v25[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = CFSTR("opacity");
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setActions:](v3->_bottomGradientLayer, "setActions:", v12);

    -[PUHeadroomGradientView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v3->_bottomGradientLayer);

    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v14 = objc_claimAutoreleasedReturnValue();
    topGradientLayer = v3->_topGradientLayer;
    v3->_topGradientLayer = (CAGradientLayer *)v14;

    -[CAGradientLayer setAnchorPoint:](v3->_topGradientLayer, "setAnchorPoint:", v8, v9);
    v23[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("opacity");
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setActions:](v3->_topGradientLayer, "setActions:", v18);

    -[PUHeadroomGradientView layer](v3, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v3->_topGradientLayer);

    -[PUHeadroomGradientView setAlpha:](v3, "setAlpha:", 0.0);
    -[PUHeadroomGradientView _updateBlurEffect](v3, "_updateBlurEffect");
    -[PUHeadroomGradientView _updateGradientProperties](v3, "_updateGradientProperties");
    +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addDeferredKeyPathObserver:", v3);

  }
  return v3;
}

- (void)_updateBlurEffect
{
  id v2;

  -[PUHeadroomGradientView blurView](self, "blurView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateBlurProperties");

}

- (void)_updateGradientProperties
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  float v22;
  void *v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  float v36;
  void *v37;
  double v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _OWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUHeadroomGradientView usesHighKeyStyle](self, "usesHighKeyStyle"))
    objc_msgSend(v3, "highKeyGradientWhite");
  else
    objc_msgSend(v3, "gradientWhite");
  v5 = v4;
  -[PUHeadroomGradientView primaryGradientColor](self, "primaryGradientColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v5, 1.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "colorWithAlphaComponent:", 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  v60[0] = objc_msgSend(v11, "CGColor");
  v12 = objc_retainAutorelease(v10);
  v60[1] = objc_msgSend(v12, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColors:", v13);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "bottomGradientTopLocation");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v16;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "bottomGradientBottomLocation");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLocations:", v19);

  objc_msgSend(v3, "bottomGradientAlpha");
  v22 = v21;
  -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = v22;
  objc_msgSend(v23, "setOpacity:", v24);

  v25 = objc_retainAutorelease(v11);
  v58[0] = objc_msgSend(v25, "CGColor");
  v26 = objc_retainAutorelease(v12);
  v58[1] = objc_msgSend(v26, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setColors:", v27);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "topGradientTopLocation");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v30;
  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "topGradientBottomLocation");
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLocations:", v33);

  objc_msgSend(v3, "topGradientAlpha");
  v36 = v35;
  -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v38 = v36;
  objc_msgSend(v37, "setOpacity:", v38);

  v39 = objc_msgSend(v3, "useSoftLightBlendingModeForTopGradient");
  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EB8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
  -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setCompositingFilter:", v40);

  if (v39)
  if (-[PUHeadroomGradientView isInactive](self, "isInactive"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setName:", CFSTR("colorMatrix"));
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    PUColorMatrixMakeInactive(&v50);
    v49[2] = v52;
    v49[3] = v53;
    v49[4] = v54;
    v49[0] = v50;
    v49[1] = v51;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v49);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setValue:forKey:", v43, *MEMORY[0x1E0CD2D20]);

    v56 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFilters:", v44);

    v55 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFilters:", v46);

  }
  else
  {
    -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFilters:", 0);

    -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFilters:", 0);
  }

}

- (void)setFrame:(CGRect)a3
{
  -[PUHeadroomGradientView setFrame:animated:](self, "setFrame:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setFrame:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUHeadroomGradientView frame](self, "frame");
  v10.receiver = self;
  v10.super_class = (Class)PUHeadroomGradientView;
  -[PUHeadroomGradientView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
    -[PUHeadroomGradientView _layoutBlurAndGradientsAnimated:](self, "_layoutBlurAndGradientsAnimated:", v4);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUHeadroomGradientView bounds](self, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)PUHeadroomGradientView;
  -[PUHeadroomGradientView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
    -[PUHeadroomGradientView _layoutBlurAndGradientsAnimated:](self, "_layoutBlurAndGradientsAnimated:", 0);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUHeadroomGradientView;
  -[PUHeadroomGradientView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PUHeadroomGradientView _layoutBlurAndGradientsAnimated:](self, "_layoutBlurAndGradientsAnimated:", 0);
}

- (void)_layoutBlurAndGradientsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
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
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
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
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  _QWORD *v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;

  v3 = a3;
  -[PUHeadroomGradientView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  if (v8 > 0.0)
  {
    -[PUHeadroomGradientView bounds](self, "bounds");
    PXRectRoundToPixel();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    PXSizeGetAspectRatio();
    +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "gradientHeight");
    PFSizeWithAspectRatioFittingSize();

    -[PUHeadroomGradientView blurView](self, "blurView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v66 = v21;
    v67 = v22;
    v68 = v23;
    v69 = v24;

    PXRectWithSizeAlignedToRectEdges();
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v26;
    v35 = v19;
    v36 = v14;
    v37 = v12;
    v38 = v28;
    v39 = v16;
    objc_msgSend(v33, "setBounds:", v34, v38, v30, v32);

    v40 = v36;
    PXRectWithSizeAlignedToRectEdges();
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setBounds:", v42, v44, v46, v48);

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
      v70 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
      objc_msgSend(v70, "setDuration:");
      switch(objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationCurve"))
      {
        case 0:
          v54 = (void *)MEMORY[0x1E0CD27D0];
          v55 = (_QWORD *)MEMORY[0x1E0CD3048];
          goto LABEL_10;
        case 1:
          v54 = (void *)MEMORY[0x1E0CD27D0];
          v55 = (_QWORD *)MEMORY[0x1E0CD3040];
          goto LABEL_10;
        case 2:
          v54 = (void *)MEMORY[0x1E0CD27D0];
          v55 = (_QWORD *)MEMORY[0x1E0CD3050];
          goto LABEL_10;
        case 3:
          v54 = (void *)MEMORY[0x1E0CD27D0];
          v55 = (_QWORD *)MEMORY[0x1E0CD3058];
          goto LABEL_10;
        case 4:
          LODWORD(v50) = 1059648963;
          LODWORD(v52) = 1051260355;
          LODWORD(v51) = 0;
          LODWORD(v53) = 1.0;
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v50, v51, v52, v53);
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        default:
          v54 = (void *)MEMORY[0x1E0CD27D0];
          v55 = (_QWORD *)MEMORY[0x1E0CD3038];
LABEL_10:
          objc_msgSend(v54, "functionWithName:", *v55, *(_QWORD *)&v66, *(_QWORD *)&v67, *(_QWORD *)&v68, *(_QWORD *)&v69);
          v56 = objc_claimAutoreleasedReturnValue();
LABEL_11:
          v57 = (void *)v56;
          v59 = v68;
          v58 = v69;
          v61 = v66;
          v60 = v67;
          objc_msgSend(v70, "setTimingFunction:", v56, *(_QWORD *)&v66, *(_QWORD *)&v67, *(_QWORD *)&v68, *(_QWORD *)&v69);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v35, v37, v40, v39);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setToValue:", v62);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v61, v60, v59, v58);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setFromValue:", v63);

          -[PUHeadroomGradientView bottomGradientLayer](self, "bottomGradientLayer");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addAnimation:forKey:", v70, CFSTR("boundsAnimation"));

          -[PUHeadroomGradientView topGradientLayer](self, "topGradientLayer");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addAnimation:forKey:", v70, CFSTR("boundsAnimation"));

          break;
      }
    }
  }
}

- (void)setVisibilityAmount:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_visibilityAmount = a3;
    +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blurVisibilityFraction");
    v7 = a3 / v6;

    -[PUHeadroomGradientView blurView](self, "blurView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", fmin(v7, 1.0));

    -[PUHeadroomGradientView visibilityAmount](self, "visibilityAmount");
    -[PUHeadroomGradientView setAlpha:](self, "setAlpha:");
  }
}

- (void)setUsesHighKeyStyle:(BOOL)a3
{
  if (self->_usesHighKeyStyle != a3)
  {
    self->_usesHighKeyStyle = a3;
    -[PUHeadroomGradientView _updateGradientProperties](self, "_updateGradientProperties");
  }
}

- (void)setPrimaryGradientColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v5 = self->_primaryGradientColor;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_primaryGradientColor, a3);
      -[PUHeadroomGradientView _updateGradientProperties](self, "_updateGradientProperties");
    }
  }

}

- (void)setIsInactive:(BOOL)a3
{
  if (self->_isInactive != a3)
  {
    self->_isInactive = a3;
    -[PUHeadroomGradientView _updateGradientProperties](self, "_updateGradientProperties");
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[PUHeadroomGradientView _updateBlurEffect](self, "_updateBlurEffect", a3, a4);
  -[PUHeadroomGradientView _updateGradientProperties](self, "_updateGradientProperties");
}

- (double)visibilityAmount
{
  return self->_visibilityAmount;
}

- (BOOL)usesHighKeyStyle
{
  return self->_usesHighKeyStyle;
}

- (UIColor)primaryGradientColor
{
  return self->_primaryGradientColor;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (CAGradientLayer)bottomGradientLayer
{
  return self->_bottomGradientLayer;
}

- (CAGradientLayer)topGradientLayer
{
  return self->_topGradientLayer;
}

- (PUHeadroomVariableBlurView)blurView
{
  return self->_blurView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_topGradientLayer, 0);
  objc_storeStrong((id *)&self->_bottomGradientLayer, 0);
  objc_storeStrong((id *)&self->_primaryGradientColor, 0);
}

@end
