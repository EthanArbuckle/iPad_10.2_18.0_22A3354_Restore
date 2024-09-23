@implementation SBInteractiveScreenshotGestureCropsView

- (SBInteractiveScreenshotGestureCropsView)initWithFrame:(CGRect)a3
{
  SBInteractiveScreenshotGestureCropsView *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  uint64_t v6;
  UIColor *cornerColor;
  uint64_t v8;
  id cropsCompositingFilter;
  uint64_t v10;
  UIColor *lineGrabberColor;
  uint64_t v12;
  UIColor *lineColor;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  UIView *bottomLeftCornerHorizontalView;
  uint64_t v22;
  UIView *bottomLeftCornerVerticalView;
  uint64_t v24;
  UIView *bottomRightCornerHorizontalView;
  uint64_t v26;
  UIView *bottomRightCornerVerticalView;
  uint64_t v28;
  UIView *topLeftCornerHorizontalView;
  uint64_t v30;
  UIView *topLeftCornerVerticalView;
  uint64_t v32;
  UIView *topRightCornerHorizontalView;
  uint64_t v34;
  UIView *topRightCornerVerticalView;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  UIView *bottomLineView;
  uint64_t v46;
  UIView *leftLineView;
  uint64_t v48;
  UIView *rightLineView;
  uint64_t v50;
  UIView *topLineView;
  NSArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  UIView *bottomLineGrabberView;
  uint64_t v62;
  UIView *leftLineGrabberView;
  uint64_t v64;
  UIView *rightLineGrabberView;
  uint64_t v66;
  UIView *topLineGrabberView;
  NSArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  objc_super v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v89.receiver = self;
  v89.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  v3 = -[SBInteractiveScreenshotGestureCropsView initWithFrame:](&v89, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.SpringBoard.SBInteractiveScreenshotGestureCropsView.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.82);
    v6 = objc_claimAutoreleasedReturnValue();
    cornerColor = v3->_cornerColor;
    v3->_cornerColor = (UIColor *)v6;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v8 = objc_claimAutoreleasedReturnValue();
    cropsCompositingFilter = v3->_cropsCompositingFilter;
    v3->_cropsCompositingFilter = (id)v8;

    v3->_cornerEdgeLength = 20.0;
    v3->_cornerAlpha = 1.0;
    v3->_grabberLineWidth = 4.0;
    v3->_lineGrabberEdgeLength = v3->_cornerEdgeLength;
    v3->_lineGrabberAlpha = 1.0;
    v3->_lineWidth = 1.0;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.82);
    v10 = objc_claimAutoreleasedReturnValue();
    lineGrabberColor = v3->_lineGrabberColor;
    v3->_lineGrabberColor = (UIColor *)v10;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.82);
    v12 = objc_claimAutoreleasedReturnValue();
    lineColor = v3->_lineColor;
    v3->_lineColor = (UIColor *)v12;

    v3->_lineAlpha = 1.0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
    v15 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], v17, v18, v19);
    bottomLeftCornerHorizontalView = v3->_bottomLeftCornerHorizontalView;
    v3->_bottomLeftCornerHorizontalView = (UIView *)v20;

    objc_msgSend(v14, "addObject:", v3->_bottomLeftCornerHorizontalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_bottomLeftCornerHorizontalView);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    bottomLeftCornerVerticalView = v3->_bottomLeftCornerVerticalView;
    v3->_bottomLeftCornerVerticalView = (UIView *)v22;

    objc_msgSend(v14, "addObject:", v3->_bottomLeftCornerVerticalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_bottomLeftCornerVerticalView);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    bottomRightCornerHorizontalView = v3->_bottomRightCornerHorizontalView;
    v3->_bottomRightCornerHorizontalView = (UIView *)v24;

    objc_msgSend(v14, "addObject:", v3->_bottomRightCornerHorizontalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_bottomRightCornerHorizontalView);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    bottomRightCornerVerticalView = v3->_bottomRightCornerVerticalView;
    v3->_bottomRightCornerVerticalView = (UIView *)v26;

    objc_msgSend(v14, "addObject:", v3->_bottomRightCornerVerticalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_bottomRightCornerVerticalView);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    topLeftCornerHorizontalView = v3->_topLeftCornerHorizontalView;
    v3->_topLeftCornerHorizontalView = (UIView *)v28;

    objc_msgSend(v14, "addObject:", v3->_topLeftCornerHorizontalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_topLeftCornerHorizontalView);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    topLeftCornerVerticalView = v3->_topLeftCornerVerticalView;
    v3->_topLeftCornerVerticalView = (UIView *)v30;

    objc_msgSend(v14, "addObject:", v3->_topLeftCornerVerticalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_topLeftCornerVerticalView);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    topRightCornerHorizontalView = v3->_topRightCornerHorizontalView;
    v3->_topRightCornerHorizontalView = (UIView *)v32;

    objc_msgSend(v14, "addObject:", v3->_topRightCornerHorizontalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_topRightCornerHorizontalView);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    topRightCornerVerticalView = v3->_topRightCornerVerticalView;
    v3->_topRightCornerVerticalView = (UIView *)v34;

    objc_msgSend(v14, "addObject:", v3->_topRightCornerVerticalView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_topRightCornerVerticalView);
    v76 = v14;
    objc_storeStrong((id *)&v3->_cornerViews, v14);
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v36 = v3->_cornerViews;
    v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v86 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend(v41, "setBackgroundColor:", v3->_cornerColor);
          objc_msgSend(v41, "layer");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setCompositingFilter:", v3->_cropsCompositingFilter);

        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
      }
      while (v38);
    }

    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    bottomLineView = v3->_bottomLineView;
    v3->_bottomLineView = (UIView *)v44;

    objc_msgSend(v43, "addObject:", v3->_bottomLineView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_bottomLineView);
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    leftLineView = v3->_leftLineView;
    v3->_leftLineView = (UIView *)v46;

    objc_msgSend(v43, "addObject:", v3->_leftLineView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_leftLineView);
    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    rightLineView = v3->_rightLineView;
    v3->_rightLineView = (UIView *)v48;

    objc_msgSend(v43, "addObject:", v3->_rightLineView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_rightLineView);
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    topLineView = v3->_topLineView;
    v3->_topLineView = (UIView *)v50;

    objc_msgSend(v43, "addObject:", v3->_topLineView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_topLineView);
    objc_storeStrong((id *)&v3->_lineViews, v43);
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v52 = v3->_lineViews;
    v53 = -[NSArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v82 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
          objc_msgSend(v57, "setBackgroundColor:", v3->_lineColor);
          objc_msgSend(v57, "layer");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setCompositingFilter:", v3->_cropsCompositingFilter);

        }
        v54 = -[NSArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
      }
      while (v54);
    }

    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    bottomLineGrabberView = v3->_bottomLineGrabberView;
    v3->_bottomLineGrabberView = (UIView *)v60;

    objc_msgSend(v59, "addObject:", v3->_bottomLineGrabberView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_bottomLineGrabberView);
    v62 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    leftLineGrabberView = v3->_leftLineGrabberView;
    v3->_leftLineGrabberView = (UIView *)v62;

    objc_msgSend(v59, "addObject:", v3->_leftLineGrabberView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_leftLineGrabberView);
    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    rightLineGrabberView = v3->_rightLineGrabberView;
    v3->_rightLineGrabberView = (UIView *)v64;

    objc_msgSend(v59, "addObject:", v3->_rightLineGrabberView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_rightLineGrabberView);
    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v18, v19);
    topLineGrabberView = v3->_topLineGrabberView;
    v3->_topLineGrabberView = (UIView *)v66;

    objc_msgSend(v59, "addObject:", v3->_topLineGrabberView);
    -[SBInteractiveScreenshotGestureCropsView addSubview:](v3, "addSubview:", v3->_topLineGrabberView);
    objc_storeStrong((id *)&v3->_lineGrabberViews, v59);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v68 = v3->_lineGrabberViews;
    v69 = -[NSArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v70; ++k)
        {
          if (*(_QWORD *)v78 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          objc_msgSend(v73, "setBackgroundColor:", v3->_lineGrabberColor);
          objc_msgSend(v73, "layer");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setCompositingFilter:", v3->_cropsCompositingFilter);

        }
        v70 = -[NSArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      }
      while (v70);
    }

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  -[SBInteractiveScreenshotGestureCropsView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBInteractiveScreenshotGestureCropsView bounds](self, "bounds");
  -[SBInteractiveScreenshotGestureCropsView _updateGeometryForBounds:shouldUsePresentationValues:](self, "_updateGeometryForBounds:shouldUsePresentationValues:", 0);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  -[SBInteractiveScreenshotGestureCropsView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBInteractiveScreenshotGestureCropsView _updateGeometryOrDeferLayoutUsingModelBounds](self, "_updateGeometryOrDeferLayoutUsingModelBounds");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  -[SBInteractiveScreenshotGestureCropsView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBInteractiveScreenshotGestureCropsView _updateGeometryOrDeferLayoutUsingModelBounds](self, "_updateGeometryOrDeferLayoutUsingModelBounds");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *accessQueue;
  _QWORD v8[6];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
  -[SBInteractiveScreenshotGestureCropsView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[SBInteractiveScreenshotGestureCropsView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SBInteractiveScreenshotGestureCropsView_traitCollectionDidChange___block_invoke;
  v8[3] = &unk_1E8E9DE88;
  v8[4] = self;
  v8[5] = v6;
  dispatch_sync(accessQueue, v8);
}

double __68__SBInteractiveScreenshotGestureCropsView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 576) = result;
  return result;
}

- (void)_setPresentationValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("bounds")))
  {
    v34.receiver = self;
    v34.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
    -[SBInteractiveScreenshotGestureCropsView _setPresentationValue:forKey:](&v34, sel__setPresentationValue_forKey_, v6, v7);
    objc_msgSend(v6, "CGRectValue");
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryForBounds:shouldUsePresentationValues:](self, "_updateGeometryForBounds:shouldUsePresentationValues:", 1);
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("lineGrabberAlpha")))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v8 = self->_lineGrabberViews;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_setPresentationValue:forKey:", v6, CFSTR("opacity"));
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        }
        while (v10);
      }
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("lineAlpha")))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = self->_lineViews;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v27;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "_setPresentationValue:forKey:", v6, CFSTR("opacity"));
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        }
        while (v14);
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("cornerAlpha")))
      {
        v21.receiver = self;
        v21.super_class = (Class)SBInteractiveScreenshotGestureCropsView;
        -[SBInteractiveScreenshotGestureCropsView _setPresentationValue:forKey:](&v21, sel__setPresentationValue_forKey_, v6, v7);
        goto LABEL_30;
      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = self->_cornerViews;
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          for (k = 0; k != v18; ++k)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * k), "_setPresentationValue:forKey:", v6, CFSTR("opacity"));
          }
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
        }
        while (v18);
      }
    }

  }
LABEL_30:

}

- (void)setCornerAlpha:(double)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerAlpha = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_cornerViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", self->_cornerAlpha, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setCornerColor:(id)a3
{
  UIColor *v5;
  UIColor **p_cornerColor;
  UIColor *cornerColor;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  p_cornerColor = &self->_cornerColor;
  cornerColor = self->_cornerColor;
  if (cornerColor != v5 && (-[UIColor isEqual:](cornerColor, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cornerColor, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_cornerViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setBackgroundColor:", *p_cornerColor, (_QWORD)v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setCropsCompositingFilter:(id)a3
{
  id v5;
  id *p_cropsCompositingFilter;
  id cropsCompositingFilter;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_cropsCompositingFilter = &self->_cropsCompositingFilter;
  cropsCompositingFilter = self->_cropsCompositingFilter;
  if (cropsCompositingFilter != v5 && (objc_msgSend(cropsCompositingFilter, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong(&self->_cropsCompositingFilter, a3);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_cornerViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "layer", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCompositingFilter:", *p_cropsCompositingFilter);

        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)setCornerEdgeLength:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerEdgeLength = a3;
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryOrDeferLayoutUsingModelBounds](self, "_updateGeometryOrDeferLayoutUsingModelBounds");
  }
}

- (void)setGrabberLineWidth:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerEdgeLength = a3;
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryOrDeferLayoutUsingModelBounds](self, "_updateGeometryOrDeferLayoutUsingModelBounds");
  }
}

- (void)setLineAlpha:(double)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineAlpha = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_lineViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", self->_lineAlpha, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setLineColor:(id)a3
{
  UIColor *v5;
  UIColor **p_lineColor;
  UIColor *lineColor;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  p_lineColor = &self->_lineColor;
  lineColor = self->_lineColor;
  if (lineColor != v5 && (-[UIColor isEqual:](lineColor, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lineColor, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_lineViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setBackgroundColor:", *p_lineColor, (_QWORD)v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setLineWidth:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineWidth = a3;
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryOrDeferLayoutUsingModelBounds](self, "_updateGeometryOrDeferLayoutUsingModelBounds");
  }
}

- (void)setLineGrabberAlpha:(double)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineGrabberAlpha = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_lineGrabberViews;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", self->_lineGrabberAlpha, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setLineGrabberColor:(id)a3
{
  UIColor *v5;
  UIColor **p_lineGrabberColor;
  UIColor *lineGrabberColor;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  p_lineGrabberColor = &self->_lineGrabberColor;
  lineGrabberColor = self->_lineGrabberColor;
  if (lineGrabberColor != v5 && (-[UIColor isEqual:](lineGrabberColor, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lineGrabberColor, a3);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_lineGrabberViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setBackgroundColor:", *p_lineGrabberColor, (_QWORD)v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setLineGrabberEdgeLength:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_lineGrabberEdgeLength = a3;
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryOrDeferLayoutUsingModelBounds](self, "_updateGeometryOrDeferLayoutUsingModelBounds");
  }
}

- (void)_updateGeometryForBounds:(CGRect)a3 shouldUsePresentationValues:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *accessQueue;
  CGFloat MaxX;
  double v12;
  CGFloat v13;
  CGFloat MaxY;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  double v45;
  double v46;
  double v47;
  UIView *topLeftCornerHorizontalView;
  uint64_t v49;
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
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double lineWidth;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
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
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
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
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v128;
  double grabberLineWidth;
  double cornerEdgeLength;
  double MinY;
  double MinX;
  double v133;
  double v134;
  _QWORD block[6];
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v136 = 0;
  v137 = &v136;
  v138 = 0x2020000000;
  v139 = 0x3FF0000000000000;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SBInteractiveScreenshotGestureCropsView__updateGeometryForBounds_shouldUsePresentationValues___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  block[4] = self;
  block[5] = &v136;
  dispatch_sync(accessQueue, block);
  v140.origin.x = x;
  v140.origin.y = y;
  v140.size.width = width;
  v140.size.height = height;
  MinX = CGRectGetMinX(v140);
  v141.origin.x = x;
  v141.origin.y = y;
  v141.size.width = width;
  v141.size.height = height;
  MinY = CGRectGetMinY(v141);
  grabberLineWidth = self->_grabberLineWidth;
  cornerEdgeLength = self->_cornerEdgeLength;
  v142.origin.x = x;
  v142.origin.y = y;
  v142.size.width = width;
  v142.size.height = height;
  v134 = CGRectGetMinX(v142);
  v143.origin.x = x;
  v143.origin.y = y;
  v143.size.width = width;
  v143.size.height = height;
  v118 = CGRectGetMinY(v143);
  v133 = self->_grabberLineWidth;
  v116 = self->_cornerEdgeLength;
  v144.origin.x = x;
  v144.origin.y = y;
  v144.size.width = width;
  v144.size.height = height;
  MaxX = CGRectGetMaxX(v144);
  v12 = self->_cornerEdgeLength;
  v145.origin.x = x;
  v145.origin.y = y;
  v145.size.width = width;
  v145.size.height = height;
  v123 = CGRectGetMinY(v145);
  v121 = self->_cornerEdgeLength;
  v122 = self->_grabberLineWidth;
  v146.origin.x = x;
  v146.origin.y = y;
  v146.size.width = width;
  v146.size.height = height;
  v13 = CGRectGetMaxX(v146);
  v113 = self->_grabberLineWidth;
  v147.origin.x = x;
  v147.origin.y = y;
  v147.size.width = width;
  v147.size.height = height;
  v111 = CGRectGetMinY(v147);
  v128 = self->_grabberLineWidth;
  v109 = self->_cornerEdgeLength;
  v148.origin.x = x;
  v148.origin.y = y;
  v148.size.width = width;
  v148.size.height = height;
  rect_24 = CGRectGetMinX(v148);
  v149.origin.x = x;
  v149.origin.y = y;
  v149.size.width = width;
  v149.size.height = height;
  MaxY = CGRectGetMaxY(v149);
  v96 = v12;
  v98 = MaxX;
  rect_8 = self->_cornerEdgeLength;
  rect_16 = self->_grabberLineWidth;
  v150.origin.x = x;
  v150.origin.y = y;
  v150.size.width = width;
  v150.size.height = height;
  rect = CGRectGetMinX(v150);
  v151.origin.x = x;
  v151.origin.y = y;
  v151.size.width = width;
  v151.size.height = height;
  v15 = CGRectGetMaxY(v151);
  v103 = v13;
  v16 = self->_cornerEdgeLength;
  v120 = self->_grabberLineWidth;
  v152.origin.x = x;
  v152.origin.y = y;
  v152.size.width = width;
  v152.size.height = height;
  v89 = CGRectGetMaxX(v152);
  v87 = self->_cornerEdgeLength;
  v153.origin.x = x;
  v153.origin.y = y;
  v153.size.width = width;
  v153.size.height = height;
  v85 = CGRectGetMaxY(v153);
  v91 = MaxY;
  v107 = self->_cornerEdgeLength;
  v108 = self->_grabberLineWidth;
  v154.origin.x = x;
  v154.origin.y = y;
  v154.size.width = width;
  v154.size.height = height;
  v101 = CGRectGetMaxX(v154);
  v93 = self->_grabberLineWidth;
  v155.origin.x = x;
  v155.origin.y = y;
  v155.size.width = width;
  v155.size.height = height;
  v17 = CGRectGetMaxY(v155);
  v18 = self->_cornerEdgeLength;
  v115 = self->_grabberLineWidth;
  v156.origin.x = x;
  v156.origin.y = y;
  v156.size.width = width;
  v156.size.height = height;
  v83 = CGRectGetMinX(v156);
  v157.size.width = v133;
  v157.origin.y = v118 + v133;
  v157.size.height = v116 - v133;
  lineWidth = self->_lineWidth;
  v81 = self->_grabberLineWidth;
  v157.origin.x = v134;
  v117 = v118 + v133;
  v119 = v157.size.height;
  v106 = CGRectGetMaxY(v157);
  v19 = v15 - v16;
  v158.size.width = v120;
  v158.size.height = v16 - v120;
  v105 = self->_lineWidth;
  v158.origin.x = rect;
  v158.origin.y = v19;
  v71 = v16 - v120;
  v77 = CGRectGetMinY(v158);
  v159.size.width = v133;
  v159.origin.x = v134;
  v159.origin.y = v117;
  v159.size.height = v119;
  v75 = CGRectGetMaxY(v159);
  v160.origin.x = x;
  v160.origin.y = y;
  v160.size.width = width;
  v160.size.height = height;
  v74 = CGRectGetMaxX(v160);
  v161.origin.x = v103 - v113;
  v161.size.width = v128;
  v161.size.height = v109 - v128;
  v73 = self->_grabberLineWidth;
  v110 = v103 - v113;
  v112 = v111 + v128;
  v161.origin.y = v112;
  v114 = v161.size.height;
  v65 = CGRectGetMaxY(v161);
  v162.origin.y = v17 - v18;
  v162.size.width = v115;
  v162.size.height = v18 - v115;
  v64 = self->_lineWidth;
  v66 = v101 - v93;
  v67 = v17 - v18;
  v162.origin.x = v101 - v93;
  v69 = v18 - v115;
  v72 = CGRectGetMinY(v162);
  v163.origin.x = v110;
  v163.origin.y = v112;
  v163.size.width = v128;
  v163.size.height = v114;
  v70 = CGRectGetMaxY(v163);
  v68 = v19;
  v164.origin.y = MinY;
  v164.origin.x = MinX;
  v164.size.height = grabberLineWidth;
  v164.size.width = cornerEdgeLength;
  v102 = CGRectGetMaxX(v164);
  v165.origin.x = x;
  v165.origin.y = y;
  v165.size.width = width;
  v165.size.height = height;
  v94 = CGRectGetMinY(v165);
  v20 = self->_grabberLineWidth;
  v97 = v98 - v96;
  v166.origin.x = v97;
  v99 = self->_lineWidth;
  v166.size.height = v122;
  v166.origin.y = v123;
  v166.size.width = v121;
  v21 = CGRectGetMinX(v166);
  v167.origin.y = MinY;
  v167.origin.x = MinX;
  v167.size.height = grabberLineWidth;
  v167.size.width = cornerEdgeLength;
  v22 = CGRectGetMaxX(v167);
  v168.size.width = rect_8;
  v168.size.height = rect_16;
  v168.origin.y = v91 - rect_16;
  v23 = self->_lineWidth;
  v168.origin.x = rect_24;
  v104 = v91 - rect_16;
  v61 = CGRectGetMaxX(v168);
  v169.origin.x = x;
  v169.origin.y = y;
  v169.size.width = width;
  v169.size.height = height;
  v92 = CGRectGetMaxY(v169);
  v170.origin.x = v89 - v87;
  v170.size.height = v108;
  v170.origin.y = v85 - v108;
  v90 = self->_grabberLineWidth;
  v62 = v170.origin.x;
  v63 = v85 - v108;
  v170.size.width = v107;
  v88 = CGRectGetMinX(v170);
  v171.origin.x = rect_24;
  v171.origin.y = v104;
  v171.size.width = rect_8;
  v171.size.height = rect_16;
  v86 = CGRectGetMaxX(v171);
  v24 = v83 + v81 - lineWidth;
  v172.size.height = v77 - v75;
  v80 = self->_lineWidth;
  v82 = v24;
  v172.origin.x = v24;
  v172.size.width = v105;
  v172.origin.y = v106;
  v84 = v77 - v75;
  CGRectGetMinX(v172);
  UIRectCenteredYInRectScale();
  v59 = v25;
  v60 = v26;
  v76 = v27;
  v78 = v28;
  v173.origin.x = x;
  v173.origin.y = y;
  v173.size.width = width;
  v173.size.height = height;
  CGRectGetMaxX(v173);
  UIRectCenteredYInRectScale();
  v55 = v29;
  v56 = v30;
  v57 = v31;
  v58 = v32;
  v174.origin.y = v94 + v20 - v99;
  v174.size.width = v21 - v22;
  v174.origin.x = v102;
  v33 = v174.origin.y;
  v34 = v174.size.width;
  v174.size.height = v23;
  CGRectGetMinY(v174);
  UIRectCenteredXInRectScale();
  v100 = v35;
  v54 = v36;
  v95 = v37;
  v39 = v38;
  v175.origin.x = x;
  v175.origin.y = y;
  v175.size.width = width;
  v175.size.height = height;
  CGRectGetMaxY(v175);
  v49 = v137[3];
  UIRectCenteredXInRectScale();
  v50 = v40;
  v51 = v41;
  v52 = v42;
  v53 = v43;
  v44 = v74 - v73;
  v45 = v72 - v70;
  v46 = v92 - v90;
  v47 = v88 - v86;
  topLeftCornerHorizontalView = self->_topLeftCornerHorizontalView;
  if (v4)
  {
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](topLeftCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", MinX, MinY, cornerEdgeLength, grabberLineWidth, v49);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topLeftCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", v134, v117, v133, v119);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topRightCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", v97, v123, v121, v122);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topRightCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", v110, v112, v128, v114);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLeftCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", rect_24, v104, rect_8, rect_16);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLeftCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", rect, v68, v120, v71);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomRightCornerHorizontalView, "sb_setPresentationBoundsAndPositionFromFrame:", v62, v63, v107, v108);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomRightCornerVerticalView, "sb_setPresentationBoundsAndPositionFromFrame:", v66, v67, v115, v69);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_leftLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v82, v106, v105, v84);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v61, v46, v47, v80);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v102, v33, v34, v23);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_rightLineView, "sb_setPresentationBoundsAndPositionFromFrame:", v44, v65, v64, v45);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_leftLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v59, v60, v76, v78);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_bottomLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v50, v51, v52, v53);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_topLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v100, v39, v54, v95);
    -[UIView sb_setPresentationBoundsAndPositionFromFrame:](self->_rightLineGrabberView, "sb_setPresentationBoundsAndPositionFromFrame:", v55, v56, v57, v58);
  }
  else
  {
    -[UIView sb_setBoundsAndPositionFromFrame:](topLeftCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", MinX, MinY, cornerEdgeLength, grabberLineWidth, v49);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topLeftCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", v134, v117, v133, v119);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topRightCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", v97, v123, v121, v122);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topRightCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", v110, v112, v128, v114);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLeftCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", rect_24, v104, rect_8, rect_16);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLeftCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", rect, v68, v120, v71);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomRightCornerHorizontalView, "sb_setBoundsAndPositionFromFrame:", v62, v63, v107, v108);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomRightCornerVerticalView, "sb_setBoundsAndPositionFromFrame:", v66, v67, v115, v69);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_leftLineView, "sb_setBoundsAndPositionFromFrame:", v82, v106, v105, v84);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLineView, "sb_setBoundsAndPositionFromFrame:", v61, v46, v47, v80);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topLineView, "sb_setBoundsAndPositionFromFrame:", v102, v33, v34, v23);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_rightLineView, "sb_setBoundsAndPositionFromFrame:", v44, v65, v64, v45);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_leftLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v59, v60, v76, v78);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_bottomLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v50, v51, v52, v53);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_topLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v100, v39, v54, v95);
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_rightLineGrabberView, "sb_setBoundsAndPositionFromFrame:", v55, v56, v57, v58);
  }
  _Block_object_dispose(&v136, 8);
}

double __96__SBInteractiveScreenshotGestureCropsView__updateGeometryForBounds_shouldUsePresentationValues___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 576);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_updateGeometryOrDeferLayoutUsingModelBounds
{
  if ((objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0CEABB0], "_isInRetargetableAnimationBlock"))
  {
    -[SBInteractiveScreenshotGestureCropsView bounds](self, "bounds");
    -[SBInteractiveScreenshotGestureCropsView _updateGeometryForBounds:shouldUsePresentationValues:](self, "_updateGeometryForBounds:shouldUsePresentationValues:", 0);
  }
  else
  {
    -[SBInteractiveScreenshotGestureCropsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)cornerAlpha
{
  return self->_cornerAlpha;
}

- (double)cornerEdgeLength
{
  return self->_cornerEdgeLength;
}

- (UIColor)cornerColor
{
  return self->_cornerColor;
}

- (double)lineGrabberAlpha
{
  return self->_lineGrabberAlpha;
}

- (double)lineGrabberEdgeLength
{
  return self->_lineGrabberEdgeLength;
}

- (UIColor)lineGrabberColor
{
  return self->_lineGrabberColor;
}

- (double)grabberLineWidth
{
  return self->_grabberLineWidth;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (id)cropsCompositingFilter
{
  return self->_cropsCompositingFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cropsCompositingFilter, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_lineGrabberColor, 0);
  objc_storeStrong((id *)&self->_cornerColor, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_lineGrabberViews, 0);
  objc_storeStrong((id *)&self->_lineViews, 0);
  objc_storeStrong((id *)&self->_cornerViews, 0);
  objc_storeStrong((id *)&self->_topLineGrabberView, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);
  objc_storeStrong((id *)&self->_rightLineGrabberView, 0);
  objc_storeStrong((id *)&self->_rightLineView, 0);
  objc_storeStrong((id *)&self->_leftLineGrabberView, 0);
  objc_storeStrong((id *)&self->_leftLineView, 0);
  objc_storeStrong((id *)&self->_bottomLineGrabberView, 0);
  objc_storeStrong((id *)&self->_bottomLineView, 0);
  objc_storeStrong((id *)&self->_topRightCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_topRightCornerHorizontalView, 0);
  objc_storeStrong((id *)&self->_topLeftCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_topLeftCornerHorizontalView, 0);
  objc_storeStrong((id *)&self->_bottomRightCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_bottomRightCornerHorizontalView, 0);
  objc_storeStrong((id *)&self->_bottomLeftCornerVerticalView, 0);
  objc_storeStrong((id *)&self->_bottomLeftCornerHorizontalView, 0);
}

@end
