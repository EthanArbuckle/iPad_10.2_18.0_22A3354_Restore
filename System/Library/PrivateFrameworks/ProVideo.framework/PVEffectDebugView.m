@implementation PVEffectDebugView

- (PVEffectDebugView)initWithFrame:(CGRect)a3
{
  PVEffectDebugView *v3;
  PVEffectDebugView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugView;
  v3 = -[PVEffectDebugView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PVEffectDebugView setupViews](v3, "setupViews");
  return v4;
}

- (PVEffectDebugView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PVEffectDebugView *v10;
  PVEffectDebugView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVEffectDebugView;
  v10 = -[PVEffectDebugView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[PVEffectDebugView setDelegate:](v10, "setDelegate:", v9);
    -[PVEffectDebugView setupViews](v11, "setupViews");
  }

  return v11;
}

- (PVEffectDebugView)initWithCoder:(id)a3
{
  PVEffectDebugView *v3;
  PVEffectDebugView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVEffectDebugView;
  v3 = -[PVEffectDebugView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PVEffectDebugView setupViews](v3, "setupViews");
  return v4;
}

- (void)setupViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PVEffectDebugView setRootContainerView:](self, "setRootContainerView:", v4);

  -[PVEffectDebugView rootContainerView](self, "rootContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  -[PVEffectDebugView rootContainerView](self, "rootContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[PVEffectDebugView rootContainerView](self, "rootContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView addSubview:](self, "addSubview:", v7);

  -[PVEffectDebugView rootContainerView](self, "rootContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setRootLayer:](self, "setRootLayer:", v9);

  objc_msgSend(MEMORY[0x1E0CD28C8], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setRootTransformLayer:](self, "setRootTransformLayer:", v10);

  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnchorPoint:", v11, v12);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", v15);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setDocumentBoundingBoxLayer:](self, "setDocumentBoundingBoxLayer:", v16);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v18);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setOutputROILayer:](self, "setOutputROILayer:", v19);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView outputROILayer](self, "outputROILayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSublayer:", v21);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setObjectAlignedBoundingBoxLayer:](self, "setObjectAlignedBoundingBoxLayer:", v22);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSublayer:", v24);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setTextBoundingBoxesContainerLayer:](self, "setTextBoundingBoxesContainerLayer:", v25);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSublayer:", v27);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setHitAreaShapeLayer:](self, "setHitAreaShapeLayer:", v28);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView hitAreaShapeLayer](self, "hitAreaShapeLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSublayer:", v30);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setHitAreaMinimumSizeBoundingBoxLayer:](self, "setHitAreaMinimumSizeBoundingBoxLayer:", v31);

  -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setZPosition:", -1.0);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSublayer:", v34);

  -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = 1050253722;
  objc_msgSend(v35, "setOpacity:", v36);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setMidpointLayer:](self, "setMidpointLayer:", v37);

  -[PVEffectDebugView midpointLayer](self, "midpointLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setZPosition:", 10.0);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView midpointLayer](self, "midpointLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSublayer:", v40);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setOriginLayer:](self, "setOriginLayer:", v41);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView originLayer](self, "originLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSublayer:", v43);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setOriginCrosshairLayer:](self, "setOriginCrosshairLayer:", v44);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSublayer:", v46);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setCornerPointsLayer:](self, "setCornerPointsLayer:", v47);

  -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setZPosition:", 10.0);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSublayer:", v50);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setTextCornerPointsContainerLayer:](self, "setTextCornerPointsContainerLayer:", v51);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addSublayer:", v53);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setHitAreaPointsLayer:](self, "setHitAreaPointsLayer:", v54);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addSublayer:", v56);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setUserRectsLayer:](self, "setUserRectsLayer:", v57);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView userRectsLayer](self, "userRectsLayer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addSublayer:", v59);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setUserRectsTransformedLayer:](self, "setUserRectsTransformedLayer:", v60);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView userRectsTransformedLayer](self, "userRectsTransformedLayer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addSublayer:", v62);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setUserPointsLayer:](self, "setUserPointsLayer:", v63);

  -[PVEffectDebugView rootLayer](self, "rootLayer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView userPointsLayer](self, "userPointsLayer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addSublayer:", v65);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView setUserPointsTransformedLayer:](self, "setUserPointsTransformedLayer:", v66);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView userPointsTransformedLayer](self, "userPointsTransformedLayer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addSublayer:", v68);

  -[PVEffectDebugView delegate](self, "delegate");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v71, "pvEffectDebugViewOptions"), (v69 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[PVEffectDebugViewOptions options](PVEffectDebugViewOptions, "options");
    v69 = objc_claimAutoreleasedReturnValue();
  }
  v70 = (void *)v69;
  -[PVEffectDebugView setOptions:](self, "setOptions:", v69);

}

- (void)updateDottedBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a8;
  v17 = a6;
  v18 = a3;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  pv_CGRect_to_NSArray(v21);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v18, v20, v19, v17, v16, a7, a5);

}

- (void)updateBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  id v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a6;
  v13 = a3;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  pv_CGRect_to_NSArray(v16);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v13, v15, v14, v12, 0, 0.0, a5);

}

- (void)updatePolygonLayer:(id)a3 points:(id)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = (void *)MEMORY[0x1E0CEA478];
  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v13, "clearColor");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v17, v16, v18, v15, v14, a7, a5);

}

- (void)updateFilledPolygonLayer:(id)a3 path:(CGPath *)a4 fillColor:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CEA478];
  v9 = a5;
  objc_msgSend(v8, "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  v14 = v7;
  v12 = objc_msgSend(v11, "CGColor");

  objc_msgSend(v14, "setFillColor:", v12);
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v13, "CGColor"));
  objc_msgSend(v14, "setLineDashPhase:", 0.0);
  objc_msgSend(v14, "setLineDashPattern:", 0);
  objc_msgSend(v14, "setLineWidth:", 0.0);
  objc_msgSend(v14, "setPath:", a4);

}

- (void)updatePointsLayers:(id)a3 points:(id)a4 colors:(id)a5 size:(double)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PVEffectDebugView_updatePointsLayers_points_colors_size___block_invoke;
  v13[3] = &unk_1E64D4550;
  v16 = a6;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v13);

}

void __59__PVEffectDebugView_updatePointsLayers_points_colors_size___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  const CGPath *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  CGRect v18;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v11 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 % objc_msgSend(*(id *)(a1 + 40), "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18.origin.x = v8 - v11 * 0.5;
  v18.origin.y = v10 - v11 * 0.5;
  v18.size.width = v11;
  v18.size.height = v11;
  v13 = CGPathCreateWithEllipseInRect(v18, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v12);
  v17 = v5;
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v15, "CGColor"));
  v16 = objc_retainAutorelease(v14);
  objc_msgSend(v17, "setStrokeColor:", objc_msgSend(v16, "CGColor"));
  objc_msgSend(v17, "setLineDashPhase:", 0.0);
  objc_msgSend(v17, "setLineDashPattern:", 0);
  objc_msgSend(v17, "setLineWidth:", 0.0);
  objc_msgSend(v17, "setPath:", v13);

  CGPathRelease(v13);
}

- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6
{
  double y;
  double x;
  id v10;
  CGFloat v11;
  id v12;
  const CGPath *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  CGRect v19;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = a5 + a5;
  v12 = a6;
  v19.origin.x = x - v11 * 0.5;
  v19.origin.y = y - v11 * 0.5;
  v19.size.width = v11;
  v19.size.height = v11;
  v13 = CGPathCreateWithEllipseInRect(v19, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v12);
  v18 = v10;
  v16 = objc_msgSend(v15, "CGColor");

  objc_msgSend(v18, "setFillColor:", v16);
  v17 = objc_retainAutorelease(v14);
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  objc_msgSend(v18, "setLineDashPhase:", 0.0);
  objc_msgSend(v18, "setLineDashPattern:", 0);
  objc_msgSend(v18, "setLineWidth:", 0.0);
  objc_msgSend(v18, "setPath:", v13);

  CGPathRelease(v13);
}

- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6 borderWidth:(double)a7 borderColor:(id)a8 borderPhase:(double)a9 borderDashPattern:(id)a10
{
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  CGFloat v21;
  id v22;
  const CGPath *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  CGRect v31;

  y = a4.y;
  x = a4.x;
  v18 = a3;
  v19 = a8;
  v20 = a10;
  v21 = a5 + a5;
  v22 = a6;
  v31.origin.x = x - v21 * 0.5;
  v31.origin.y = y - v21 * 0.5;
  v31.size.width = v21;
  v31.size.height = v21;
  v23 = CGPathCreateWithEllipseInRect(v31, 0);
  v24 = objc_retainAutorelease(v22);
  v30 = v18;
  v25 = v19;
  v26 = v20;
  v27 = objc_msgSend(v24, "CGColor");

  objc_msgSend(v30, "setFillColor:", v27);
  v28 = objc_retainAutorelease(v25);
  v29 = objc_msgSend(v28, "CGColor");

  objc_msgSend(v30, "setStrokeColor:", v29);
  objc_msgSend(v30, "setLineDashPhase:", a9);
  objc_msgSend(v30, "setLineDashPattern:", v26);

  objc_msgSend(v30, "setLineWidth:", a7);
  objc_msgSend(v30, "setPath:", v23);

  CGPathRelease(v23);
}

- (void)updateCrosshairLayer:(id)a3 center:(CGPoint)a4 color:(id)a5 size:(CGSize)a6 thickness:(CGSize)a7
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  id v17;

  height = a7.height;
  width = a7.width;
  v9 = a6.height;
  v10 = a6.width;
  y = a4.y;
  x = a4.x;
  v14 = a5;
  v15 = a3;
  crosshairPointsWithSizeAndCenterPoint(v10, v9, width, height, x, y);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v15, v17, v14, v16, 0, 0.0, 0.0);

}

- (void)updateUserRects:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 rects:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;

  v15 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v15, "setHidden:", objc_msgSend(v10, "count") == 0);
  objc_msgSend(v9, "setHidden:", objc_msgSend(v15, "isHidden"));
  if ((objc_msgSend(v15, "isHidden") & 1) == 0)
  {
    objc_msgSend(v15, "sublayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_0);
    objc_msgSend(v9, "sublayers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_79);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke_3;
    v16[3] = &unk_1E64D45D8;
    v19 = a5;
    v17 = v15;
    v18 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  }
}

uint64_t __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

uint64_t __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

void __72__PVEffectDebugView_updateUserRects_transformedLayer_effectScale_rects___block_invoke_3(uint64_t x0_0, void *a2)
{
  char v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  CGRect v16;

  v15 = a2;
  v3 = objc_msgSend(v15, "ignoreTransform");
  objc_msgSend(v15, "strokeWidth");
  v5 = v4;
  if ((v3 & 1) == 0)
    v5 = v4 / *(double *)(x0_0 + 48);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  pv_CGRect_to_NSArray(v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "strokeColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineDashPhase");
  v11 = v10;
  objc_msgSend(v15, "lineDashPattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v6, v7, v8, v9, v12, v11, v5);

  v13 = objc_msgSend(v15, "ignoreTransform");
  v14 = 40;
  if (v13)
    v14 = 32;
  objc_msgSend(*(id *)(x0_0 + v14), "addSublayer:", v6);

}

- (void)updateUserPoints:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 points:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  double v20;

  v16 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v16, "setHidden:", objc_msgSend(v11, "count") == 0);
  objc_msgSend(v10, "setHidden:", objc_msgSend(v16, "isHidden"));
  if ((objc_msgSend(v16, "isHidden") & 1) == 0)
  {
    objc_msgSend(v16, "sublayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_81);
    objc_msgSend(v10, "sublayers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    objc_msgSend(v15, "enumerateObjectsUsingBlock:", &__block_literal_global_82);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_3;
    v17[3] = &unk_1E64D4668;
    v20 = a5;
    v17[4] = self;
    v18 = v16;
    v19 = v10;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

  }
}

uint64_t __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

uint64_t __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

void __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_3(uint64_t a1, void *a2)
{
  char v3;
  double v4;
  double v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;

  v26 = a2;
  v3 = objc_msgSend(v26, "ignoreTransform");
  objc_msgSend(v26, "radius");
  v5 = v4;
  if ((v3 & 1) == 0)
    v5 = v4 / *(double *)(a1 + 56);
  v6 = objc_msgSend(v26, "ignoreTransform");
  objc_msgSend(v26, "strokeWidth");
  v8 = v7;
  if ((v6 & 1) == 0)
    v8 = v7 / *(double *)(a1 + 56);
  objc_msgSend(v26, "lineDashPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "ignoreTransform") & 1) == 0 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_4;
    v27[3] = &unk_1E64D4640;
    v11 = v10;
    v28 = v11;
    v29 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v27);
    v12 = v11;

    v9 = v12;
  }
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  objc_msgSend(v26, "center");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v26, "fillColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "strokeColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lineDashPhase");
  v22 = v21;
  objc_msgSend(v26, "lineDashPattern");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateFilledCircleLayer:center:radius:fillColor:borderWidth:borderColor:borderPhase:borderDashPattern:", v13, v19, v20, v23, v16, v18, v5, v8, v22);

  v24 = objc_msgSend(v26, "ignoreTransform");
  v25 = 48;
  if (v24)
    v25 = 40;
  objc_msgSend(*(id *)(a1 + v25), "addSublayer:", v13);

}

void __74__PVEffectDebugView_updateUserPoints_transformedLayer_effectScale_points___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:", v6 / *(double *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v7, a3);

}

- (void)updateWithEffectFrame:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  double MidY;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  int v63;
  uint64_t v64;
  CGFloat v70;
  CGFloat v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
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
  int v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  uint64_t v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  uint64_t v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  int v189;
  uint64_t v190;
  void *v191;
  void *v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  int v203;
  uint64_t v204;
  void *v205;
  void *v206;
  double v207;
  double v208;
  double v209;
  double v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  void *v224;
  void *v225;
  void *v226;
  int v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  int v238;
  uint64_t v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  int v246;
  uint64_t v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  double v256;
  __int128 v257;
  double v258;
  __int128 v259;
  double v260;
  __int128 v261;
  CGFloat v262;
  double v263;
  __int128 v264;
  double v265;
  double v266;
  __int128 v267;
  double v268;
  double v269;
  _QWORD v270[4];
  id v271;
  PVCGPointQuad v272;
  _QWORD v273[5];
  id v274;
  uint64_t v275;
  uint64_t v276;
  double v277;
  double v278;
  _OWORD v279[20];
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  _OWORD v284[8];
  _OWORD v285[3];
  _OWORD v286[3];
  __int128 v287;
  __int128 v288;
  __int128 v289;
  CGAffineTransform v290;
  CGAffineTransform v291;
  CGAffineTransform v292;
  _QWORD v293[2];
  _QWORD v294[2];
  _QWORD v295[2];
  double v296;
  double v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  uint64_t v301;
  CGRect v302;
  CGRect v303;

  v301 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PVEffectDebugView options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if (!v4 || (v6 & 1) == 0)
  {
    -[PVEffectDebugView rootContainerView](self, "rootContainerView");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setHidden:", 1);

    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PVEffectDebugView rootContainerView](self, "rootContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  objc_msgSend(v4, "viewSize");
  v9 = v8;
  v11 = v10;
  v302.origin.x = 0.0;
  v302.origin.y = 0.0;
  v302.size.width = v9;
  v302.size.height = v11;
  MidX = CGRectGetMidX(v302);
  v303.origin.x = 0.0;
  v303.origin.y = 0.0;
  v303.size.width = v9;
  v303.size.height = v11;
  MidY = CGRectGetMidY(v303);
  v288 = 0u;
  v289 = 0u;
  v287 = 0u;
  -[PVEffectDebugView transform](self, "transform");
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v286[0] = *MEMORY[0x1E0C9BAA8];
  v286[1] = v14;
  v286[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PVEffectDebugView setTransform:](self, "setTransform:", v286);
  -[PVEffectDebugView setFrame:](self, "setFrame:", 0.0, 0.0, v9, v11);
  v285[0] = v287;
  v285[1] = v288;
  v285[2] = v289;
  -[PVEffectDebugView setTransform:](self, "setTransform:", v285);
  -[PVEffectDebugView rootContainerView](self, "rootContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v284[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v284[5] = v17;
  v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v284[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v284[7] = v18;
  v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v284[0] = *MEMORY[0x1E0CD2610];
  v284[1] = v19;
  v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v284[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v284[3] = v20;
  objc_msgSend(v16, "setTransform:", v284);

  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v9, v11);

  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v263 = v23;
  objc_msgSend(v24, "setPosition:", v22, v23);

  v282 = 0u;
  v283 = 0u;
  v280 = 0u;
  v281 = 0u;
  memset(&v279[16], 0, 64);
  objc_msgSend(v4, "transformInfo");
  v25 = fmax(fabs(*(double *)&v280), 0.001);
  objc_msgSend(v4, "transform");
  v264 = v279[11];
  v267 = v279[9];
  v255 = v279[10];
  v257 = v279[8];
  v259 = v279[15];
  v261 = v279[13];
  v253 = v279[14];
  v254 = v279[12];
  -[PVEffectDebugView rootTransformLayer](self, "rootTransformLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v279[0] = v257;
  v279[1] = v267;
  v279[2] = v255;
  v279[3] = v264;
  v279[4] = v254;
  v279[5] = v261;
  v279[6] = v253;
  v279[7] = v259;
  objc_msgSend(v26, "setTransform:", v279);

  -[PVEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPosition:", MidX, MidY);

  -[PVEffectDebugView outputROILayer](self, "outputROILayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView outputROILayer](self, "outputROILayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPosition:", MidX, MidY);

  -[PVEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPosition:", MidX, MidY);

  -[PVEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPosition:", MidX, MidY);

  -[PVEffectDebugView originLayer](self, "originLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView originLayer](self, "originLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setPosition:", MidX, MidY);

  -[PVEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPosition:", MidX, MidY);

  -[PVEffectDebugView midpointLayer](self, "midpointLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView midpointLayer](self, "midpointLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPosition:", MidX, MidY);

  -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setPosition:", MidX, MidY);

  -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPosition:", MidX, MidY);

  -[PVEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPosition:", MidX, MidY);

  -[PVEffectDebugView userRectsLayer](self, "userRectsLayer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView userRectsLayer](self, "userRectsLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPosition:", MidX, MidY);

  -[PVEffectDebugView userRectsTransformedLayer](self, "userRectsTransformedLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView userRectsTransformedLayer](self, "userRectsTransformedLayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setPosition:", MidX, MidY);

  -[PVEffectDebugView userPointsLayer](self, "userPointsLayer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView userPointsLayer](self, "userPointsLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPosition:", MidX, MidY);

  -[PVEffectDebugView userPointsTransformedLayer](self, "userPointsTransformedLayer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v260 = v9;
  v258 = v11;
  objc_msgSend(v53, "setBounds:", 0.0, 0.0, v9, v11);

  -[PVEffectDebugView userPointsTransformedLayer](self, "userPointsTransformedLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setPosition:", MidX, MidY);

  -[PVEffectDebugView options](self, "options");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "showDocumentBoundingBox");

  v57 = v56 ^ 1u;
  -[PVEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setHidden:", v57);

  if ((v57 & 1) == 0)
  {
    objc_msgSend(v4, "effectSize");
    v60 = v59;
    v62 = v61;
    v63 = objc_msgSend(v4, "effectOrigin");
    v64 = 0;
    v296 = 0.0;
    v297 = 0.0;
    __asm { FMOV            V1.2D, #1.0 }
    v298 = xmmword_1B304EED0;
    v299 = _Q1;
    v300 = xmmword_1B304EEE0;
    while (1)
    {
      v265 = *(double *)((char *)&v296 + v64);
      v268 = *(double *)((char *)&v296 + v64 + 8);
      if (v63 == 2)
        break;
      v70 = v23;
      v71 = v22;
      if (v63 != 1)
        goto LABEL_9;
      memset(&v290, 0, sizeof(v290));
      CGAffineTransformMakeScale(&v290, v60, v62);
      v291 = v290;
      CGAffineTransformTranslate(&v292, &v291, v22, 1.0);
      v290 = v292;
      v291 = v292;
      CGAffineTransformScale(&v292, &v291, 1.0, -1.0);
LABEL_10:
      v290 = v292;
      *(float64x2_t *)((char *)&v296 + v64) = vaddq_f64(*(float64x2_t *)&v292.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v292.a, v265), vmulq_n_f64(*(float64x2_t *)&v292.c, v268)));
      v64 += 16;
      if (v64 == 64)
      {
        v72 = 0;
        v73 = -1.79769313e308;
        v74 = 1.79769313e308;
        v75 = -1.79769313e308;
        v76 = 1.79769313e308;
        do
        {
          v77 = *(double *)((char *)&v296 + v72);
          v78 = *(double *)((char *)&v296 + v72 + 8);
          if (v77 < v76)
            v76 = *(double *)((char *)&v296 + v72);
          if (v77 > v75)
            v75 = *(double *)((char *)&v296 + v72);
          if (v78 > v73)
            v73 = *(double *)((char *)&v296 + v72 + 8);
          if (v78 < v74)
            v74 = *(double *)((char *)&v296 + v72 + 8);
          v72 += 16;
        }
        while (v72 != 64);
        v79 = v75 - v76;
        v80 = v73 - v74;
        -[PVEffectDebugView documentBoundingBoxLayer](self, "documentBoundingBoxLayer");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[PVEffectDebugView options](self, "options");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "documentBoundingBoxColor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0 / v25);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v295[0] = v84;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 5.0 / v25);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v295[1] = v85;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v295, 2);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[PVEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v81, v83, v86, v76, v74, v79, v80, 2.0 / v25, 0.0);

        goto LABEL_22;
      }
    }
    v70 = -0.5;
    v71 = -0.5;
LABEL_9:
    memset(&v290, 0, sizeof(v290));
    CGAffineTransformMakeScale(&v290, v60, v62);
    v291 = v290;
    CGAffineTransformTranslate(&v292, &v291, v71, v70);
    goto LABEL_10;
  }
LABEL_22:
  -[PVEffectDebugView options](self, "options");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "showOutputROI");

  v89 = v88 ^ 1u;
  -[PVEffectDebugView outputROILayer](self, "outputROILayer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setHidden:", v89);

  if ((v89 & 1) != 0)
    goto LABEL_41;
  v256 = v25;
  objc_msgSend(v4, "outputROI");
  v92 = v91;
  v94 = v93;
  v96 = v95;
  v98 = v97;
  objc_msgSend(v4, "effectSize");
  v100 = v99;
  v102 = v101;
  objc_msgSend(v4, "effectSize");
  v104 = v103;
  v262 = v22;
  v106 = v105;
  v107 = objc_msgSend(v4, "effectOrigin");
  v108 = 0;
  v296 = v92;
  v297 = v94;
  *(double *)&v298 = v92 + v96;
  *((double *)&v298 + 1) = v94;
  *(double *)&v299 = v92 + v96;
  *((double *)&v299 + 1) = v94 + v98;
  *(double *)&v300 = v92;
  *((double *)&v300 + 1) = v94 + v98;
  v109 = v104 / v100;
  v110 = v100 * -0.5;
  v111 = v106 / v102;
  do
  {
    v266 = *(double *)((char *)&v296 + v108);
    v269 = *(double *)((char *)&v296 + v108 + 8);
    if (v107 == 2)
    {
      v112 = v102 * -0.5;
      v113 = v110;
    }
    else
    {
      v112 = v263;
      v113 = v262;
      if (v107 == 1)
      {
        memset(&v290, 0, sizeof(v290));
        CGAffineTransformMakeScale(&v290, v109, v111);
        v291 = v290;
        CGAffineTransformTranslate(&v292, &v291, v262, v102);
        v290 = v292;
        v291 = v292;
        CGAffineTransformScale(&v292, &v291, 1.0, -1.0);
        goto LABEL_29;
      }
    }
    memset(&v290, 0, sizeof(v290));
    CGAffineTransformMakeScale(&v290, v109, v111);
    v291 = v290;
    CGAffineTransformTranslate(&v292, &v291, v113, v112);
LABEL_29:
    v290 = v292;
    *(float64x2_t *)((char *)&v296 + v108) = vaddq_f64(*(float64x2_t *)&v292.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v292.a, v266), vmulq_n_f64(*(float64x2_t *)&v292.c, v269)));
    v108 += 16;
  }
  while (v108 != 64);
  v114 = 0;
  v115 = -1.79769313e308;
  v116 = 1.79769313e308;
  v117 = -1.79769313e308;
  v118 = 1.79769313e308;
  do
  {
    v119 = *(double *)((char *)&v296 + v114);
    v120 = *(double *)((char *)&v296 + v114 + 8);
    if (v119 < v118)
      v118 = *(double *)((char *)&v296 + v114);
    if (v119 > v117)
      v117 = *(double *)((char *)&v296 + v114);
    if (v120 > v115)
      v115 = *(double *)((char *)&v296 + v114 + 8);
    if (v120 < v116)
      v116 = *(double *)((char *)&v296 + v114 + 8);
    v114 += 16;
  }
  while (v114 != 64);
  v121 = v117 - v118;
  v122 = v115 - v116;
  -[PVEffectDebugView outputROILayer](self, "outputROILayer");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v256;
  -[PVEffectDebugView options](self, "options");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "outputROIColor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 6.0 / v256);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v294[0] = v126;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0 / v256);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v294[1] = v127;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v294, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v123, v125, v128, v118, v116, v121, v122, 2.0 / v256, 10.0 / v256);

  v22 = v262;
LABEL_41:
  -[PVEffectDebugView options](self, "options");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(v129, "showObjectAlignedBoundingBox");

  v131 = v130 ^ 1u;
  -[PVEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setHidden:", v131);

  if ((v131 & 1) == 0)
  {
    -[PVEffectDebugView objectAlignedBoundingBoxLayer](self, "objectAlignedBoundingBoxLayer");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectBounds");
    v134 = v22;
    v136 = v135;
    v138 = v137;
    v140 = v139;
    v142 = v141;
    -[PVEffectDebugView options](self, "options");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "objectAlignedBoundingBoxColor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0 / v25);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v293[0] = v145;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0 / v25);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v293[1] = v146;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v293, 2);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v136;
    v22 = v134;
    -[PVEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v133, v144, v147, v148, v138, v140, v142, 2.0 / v25, 0.0);

  }
  -[PVEffectDebugView options](self, "options");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v149, "showTextBoundingBoxes"))
  {
    objc_msgSend(v4, "textFrames");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "count");

    -[PVEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setHidden:", v151 == 0);

    if (v151)
    {
      -[PVEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textFrames");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      ensureNSublayers(v153, objc_msgSend(v154, "count"));

      objc_msgSend(v4, "textFrames");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v273[0] = MEMORY[0x1E0C809B0];
      v273[1] = 3221225472;
      v273[2] = __43__PVEffectDebugView_updateWithEffectFrame___block_invoke;
      v273[3] = &unk_1E64D4690;
      v275 = 0;
      v276 = 0;
      v273[4] = self;
      v277 = v260;
      v278 = v258;
      v274 = v4;
      objc_msgSend(v155, "enumerateObjectsUsingBlock:", v273);

    }
  }
  else
  {

    -[PVEffectDebugView textBoundingBoxesContainerLayer](self, "textBoundingBoxesContainerLayer");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setHidden:", 1);

  }
  -[PVEffectDebugView options](self, "options");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend(v158, "showHitAreaShape");

  -[PVEffectDebugView hitAreaShapeLayer](self, "hitAreaShapeLayer");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v160;
  if (v159)
  {
    objc_msgSend(v160, "setHidden:", 0);

    -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "setHidden:", 0);

    -[PVEffectDebugView hitAreaShapeLayer](self, "hitAreaShapeLayer");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hitAreaPoints");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView options](self, "options");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "hitAreaShapeColor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updatePolygonLayer:points:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updatePolygonLayer:points:borderWidth:borderColor:borderPhase:borderDashPattern:", v163, v164, v166, &unk_1E6649740, 2.0, 0.0);

    -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    ensureNSublayers(v167, 1uLL);

    -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "sublayers");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "firstObject");
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    v171 = objc_msgSend(v4, "hitAreaPath");
    -[PVEffectDebugView options](self, "options");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "hitAreaShapeColor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateFilledPolygonLayer:path:fillColor:](self, "updateFilledPolygonLayer:path:fillColor:", v170, v171, v173);

    -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = objc_msgSend(v4, "expandedHitAreaPath");
    -[PVEffectDebugView options](self, "options");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "hitAreaShapeColor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateFilledPolygonLayer:path:fillColor:](self, "updateFilledPolygonLayer:path:fillColor:", v174, v175, v177);

  }
  else
  {
    objc_msgSend(v160, "setHidden:", 1);

    -[PVEffectDebugView hitAreaMinimumSizeBoundingBoxLayer](self, "hitAreaMinimumSizeBoundingBoxLayer");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "setHidden:", 1);
  }

  -[PVEffectDebugView options](self, "options");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = objc_msgSend(v178, "showCornerPoints");

  v180 = v179 ^ 1u;
  -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "setHidden:", v180);

  if ((v180 & 1) == 0)
  {
    -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    ensureNSublayers(v182, 4uLL);

    -[PVEffectDebugView cornerPointsLayer](self, "cornerPointsLayer");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "sublayers");
    v184 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "cornerPoints");
    PVCGPointQuad_to_NSArray(&v272);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView options](self, "options");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "cornerPointColors");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v184, v185, v187, 4.0);

  }
  -[PVEffectDebugView options](self, "options");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = objc_msgSend(v188, "showOrigin");

  v190 = v189 ^ 1u;
  -[PVEffectDebugView originLayer](self, "originLayer");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setHidden:", v190);

  if ((v190 & 1) == 0)
  {
    -[PVEffectDebugView originLayer](self, "originLayer");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v193 = v22;
    v195 = v194;
    v197 = v196;
    -[PVEffectDebugView options](self, "options");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "originColor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateFilledCircleLayer:center:radius:fillColor:](self, "updateFilledCircleLayer:center:radius:fillColor:", v192, v199, v195, v197, 6.0);

    -[PVEffectDebugView originCrosshairLayer](self, "originCrosshairLayer");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateCrosshairLayer:center:color:size:thickness:](self, "updateCrosshairLayer:center:color:size:thickness:", v200, v201, v193, v263, 10.0 / v25, 10.0 / v25, 2.0 / v25, 2.0 / v25);

  }
  -[PVEffectDebugView options](self, "options");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = objc_msgSend(v202, "showMidpoint");

  v204 = v203 ^ 1u;
  -[PVEffectDebugView midpointLayer](self, "midpointLayer");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "setHidden:", v204);

  if ((v204 & 1) == 0)
  {
    -[PVEffectDebugView midpointLayer](self, "midpointLayer");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "midpoint");
    v208 = v207;
    v210 = v209;
    -[PVEffectDebugView options](self, "options");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "midpointColor");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateFilledCircleLayer:center:radius:fillColor:](self, "updateFilledCircleLayer:center:radius:fillColor:", v206, v212, v208, v210, 1.5);

  }
  -[PVEffectDebugView options](self, "options");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v213, "showTextCornerPoints"))
  {
    objc_msgSend(v4, "textFrames");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v215 = objc_msgSend(v214, "count");

    -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "setHidden:", v215 == 0);

    if (v215)
    {
      -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textFrames");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      ensureNSublayers(v217, 4 * objc_msgSend(v218, "count"));

      -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "sublayers");
      v220 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v220, "count"));
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textFrames");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v270[0] = MEMORY[0x1E0C809B0];
      v270[1] = 3221225472;
      v270[2] = __43__PVEffectDebugView_updateWithEffectFrame___block_invoke_90;
      v270[3] = &unk_1E64D46B8;
      v271 = v221;
      v223 = v221;
      objc_msgSend(v222, "enumerateObjectsUsingBlock:", v270);

      -[PVEffectDebugView options](self, "options");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "textCornerPointColors");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v220, v223, v225, 4.0);

      goto LABEL_61;
    }
  }
  else
  {

    -[PVEffectDebugView textCornerPointsContainerLayer](self, "textCornerPointsContainerLayer");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "setHidden:", 1);
LABEL_61:

  }
  -[PVEffectDebugView options](self, "options");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = objc_msgSend(v226, "showHitAreaPoints");

  v228 = v227 ^ 1u;
  -[PVEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "setHidden:", v228);

  if ((v228 & 1) == 0)
  {
    -[PVEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hitAreaPoints");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    ensureNSublayers(v230, objc_msgSend(v231, "count"));

    -[PVEffectDebugView hitAreaPointsLayer](self, "hitAreaPointsLayer");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "sublayers");
    v233 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "hitAreaPoints");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView options](self, "options");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "hitAreaPointColors");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updatePointsLayers:points:colors:size:](self, "updatePointsLayers:points:colors:size:", v233, v234, v236, 4.0);

  }
  -[PVEffectDebugView options](self, "options");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = objc_msgSend(v237, "showUserRects");

  v239 = v238 ^ 1u;
  -[PVEffectDebugView userRectsLayer](self, "userRectsLayer");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setHidden:", v239);

  -[PVEffectDebugView userRectsTransformedLayer](self, "userRectsTransformedLayer");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "setHidden:", v239);

  if ((v239 & 1) == 0)
  {
    -[PVEffectDebugView userRectsLayer](self, "userRectsLayer");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView userRectsTransformedLayer](self, "userRectsTransformedLayer");
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView userRectsToDraw](self, "userRectsToDraw");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateUserRects:transformedLayer:effectScale:rects:](self, "updateUserRects:transformedLayer:effectScale:rects:", v242, v243, v244, v25);

  }
  -[PVEffectDebugView options](self, "options");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = objc_msgSend(v245, "showUserPoints");

  v247 = v246 ^ 1u;
  -[PVEffectDebugView userPointsLayer](self, "userPointsLayer");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v248, "setHidden:", v247);

  -[PVEffectDebugView userPointsTransformedLayer](self, "userPointsTransformedLayer");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "setHidden:", v247);

  if ((v247 & 1) == 0)
  {
    -[PVEffectDebugView userPointsLayer](self, "userPointsLayer");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView userPointsTransformedLayer](self, "userPointsTransformedLayer");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView userPointsToDraw](self, "userPointsToDraw");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVEffectDebugView updateUserPoints:transformedLayer:effectScale:points:](self, "updateUserPoints:transformedLayer:effectScale:points:", v250, v251, v252, v25);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
LABEL_69:

}

void __43__PVEffectDebugView_updateWithEffectFrame___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[8];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[8];
  _QWORD v56[3];

  v56[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "textBoundingBoxesContainerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ensureNSublayers(v8, 1uLL);
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v55[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v55[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v55[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v55[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v55[0] = *MEMORY[0x1E0CD2610];
  v55[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v55[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v55[3] = v12;
  objc_msgSend(v8, "setTransform:", v55);
  objc_msgSend(v8, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v8, "setPosition:", *MEMORY[0x1E0C9D538], v14);
  objc_msgSend(v8, "setAnchorPoint:", v13, v14);
  if (v5)
  {
    objc_msgSend(v5, "transform");
    v16 = v47;
    v15 = v48;
    v18 = v49;
    v17 = v50;
    v20 = v51;
    v19 = v52;
    v21 = v53;
    v22 = v54;
  }
  else
  {
    v21 = 0uLL;
    v53 = 0u;
    v54 = 0u;
    v22 = 0uLL;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v20 = 0uLL;
    v19 = 0uLL;
    v18 = 0uLL;
    v17 = 0uLL;
    v16 = 0uLL;
    v15 = 0uLL;
    v47 = 0u;
    v48 = 0u;
  }
  v46[0] = v16;
  v46[1] = v15;
  v46[2] = v18;
  v46[3] = v17;
  v46[4] = v20;
  v46[5] = v19;
  v46[6] = v21;
  v46[7] = v22;
  objc_msgSend(v8, "setTransform:", v46);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  if (v5)
    objc_msgSend(v5, "transformInfo", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  v23 = fmax(fabs(0.0), 0.001);
  objc_msgSend(v8, "sublayers", v42, v43, v44, v45);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "options");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "textBoundingBoxColors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textFrames");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", a3 % objc_msgSend(v28, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = *(void **)(a1 + 32);
  objc_msgSend(v5, "objectBounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 6.0 / v23);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.0 / v23);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v25, v29, v41, v32, v34, v36, v38, 2.0 / v23, 0.0);

}

void __43__PVEffectDebugView_updateWithEffectFrame___block_invoke_90(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  PVCGPointQuad v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    objc_msgSend(a2, "cornerPoints");
  else
    memset(&v4, 0, sizeof(v4));
  PVCGPointQuad_to_NSArray(&v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)userRectsToDraw
{
  void *v2;
  void *v3;

  -[PVEffectDebugView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "pvEffectDebugViewUserRectsToDraw");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)userPointsToDraw
{
  void *v2;
  void *v3;

  -[PVEffectDebugView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "pvEffectDebugViewUserPointsToDraw");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)documentBoundsLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MidX;
  double MidY;
  const CGPath *v20;
  void *v21;
  void *v22;
  id v23;
  CGPath *closed_CGPath_with_points;
  CGPath *MutableCopy;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E0CD2840];
  v9 = a4;
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);
  objc_msgSend(v10, "bounds");
  pv_CGRect_to_NSArray(v36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentBoundingBoxColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v10, v11, v12, v13, &unk_1E6649758, 0.0, 2.0);

  ensureNSublayers(v10, 2uLL);
  objc_msgSend(v10, "bounds");
  v14 = v37.origin.x;
  v15 = v37.origin.y;
  v16 = v37.size.width;
  v17 = v37.size.height;
  MidX = CGRectGetMidX(v37);
  v38.origin.x = v14;
  v38.origin.y = v15;
  v38.size.width = v16;
  v38.size.height = v17;
  MidY = CGRectGetMidY(v38);
  v39.origin.x = MidX + -6.0;
  v39.origin.y = MidY + -6.0;
  v39.size.width = 12.0;
  v39.size.height = 12.0;
  v20 = CGPathCreateWithEllipseInRect(v39, 0);
  crosshairPointsWithSizeAndCenterPoint(10.0, 10.0, 2.0, 2.0, MidX, MidY);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __makeCircleCrosshairWithSizeAndCenterPoint_block_invoke;
  v34[3] = &unk_1E64D4708;
  v35 = v22;
  v23 = v22;
  objc_msgSend(v21, "enumerateObjectsWithOptions:usingBlock:", 2, v34);
  closed_CGPath_with_points = pv_create_closed_CGPath_with_points(v23);
  MutableCopy = CGPathCreateMutableCopy(v20);
  CGPathAddPath(MutableCopy, 0, closed_CGPath_with_points);
  CGPathRelease(v20);
  CGPathRelease(closed_CGPath_with_points);

  objc_msgSend(v10, "sublayers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_retainAutorelease(v28);
  v31 = v27;
  objc_msgSend(v31, "setFillColor:", objc_msgSend(v30, "CGColor"));
  v32 = objc_retainAutorelease(v29);
  objc_msgSend(v31, "setStrokeColor:", objc_msgSend(v32, "CGColor"));
  objc_msgSend(v31, "setLineDashPhase:", 0.0);
  objc_msgSend(v31, "setLineDashPattern:", 0);
  objc_msgSend(v31, "setLineWidth:", 0.0);
  objc_msgSend(v31, "setPath:", MutableCopy);

  CGPathRelease(MutableCopy);
  return v10;
}

+ (id)outputROILayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E0CD2840];
  v9 = a4;
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);
  objc_msgSend(v10, "bounds");
  pv_CGRect_to_NSArray(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputROIColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  setShapeLayerPathFromPointsWithStyle(v10, v11, v12, v13, &unk_1E6649770, 10.0, 2.0);
  return v10;
}

+ (id)objectBoundsLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MidX;
  const CGPath *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, unint64_t);
  void *v33;
  id v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  objc_msgSend(v9, "bounds");
  pv_CGRect_to_NSArray(v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAlignedBoundingBoxColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v9, v10, v11, v12, &unk_1E6649788, 0.0, 2.0);

  ensureNSublayers(v9, objc_msgSend(v10, "count"));
  objc_msgSend(v9, "sublayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __56__PVEffectDebugView_objectBoundsLayerWithFrame_options___block_invoke;
  v33 = &unk_1E64D46E0;
  v34 = v10;
  v35 = v8;
  v14 = v8;
  v15 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v30);

  ensureNSublayers(v9, objc_msgSend(v15, "count", v30, v31, v32, v33) + 1);
  objc_msgSend(v9, "bounds");
  v16 = v37.origin.x;
  v17 = v37.origin.y;
  v18 = v37.size.width;
  v19 = v37.size.height;
  MidX = CGRectGetMidX(v37);
  v38.origin.x = v16;
  v38.origin.y = v17;
  v38.size.width = v18;
  v38.size.height = v19;
  v39.origin.y = CGRectGetMidY(v38) + -1.5;
  v39.size.width = 3.0;
  v39.size.height = 3.0;
  v39.origin.x = MidX + -1.5;
  v21 = CGPathCreateWithEllipseInRect(v39, 0);
  objc_msgSend(v9, "sublayers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "midpointColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_retainAutorelease(v24);
  v27 = v23;
  objc_msgSend(v27, "setFillColor:", objc_msgSend(v26, "CGColor"));
  v28 = objc_retainAutorelease(v25);
  objc_msgSend(v27, "setStrokeColor:", objc_msgSend(v28, "CGColor"));
  objc_msgSend(v27, "setLineDashPhase:", 0.0);
  objc_msgSend(v27, "setLineDashPattern:", 0);
  objc_msgSend(v27, "setLineWidth:", 0.0);
  objc_msgSend(v27, "setPath:", v21);

  CGPathRelease(v21);
  return v9;
}

void __56__PVEffectDebugView_objectBoundsLayerWithFrame_options___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const CGPath *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  CGRect v19;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v19.origin.x = v8 + -2.0;
  v19.origin.y = v10 + -2.0;
  v19.size.width = 4.0;
  v19.size.height = 4.0;
  v11 = CGPathCreateWithEllipseInRect(v19, 0);
  objc_msgSend(*(id *)(a1 + 40), "cornerPointColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cornerPointColors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3 % objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v14);
  v18 = v5;
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v16, "CGColor"));
  v17 = objc_retainAutorelease(v15);
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  objc_msgSend(v18, "setLineDashPhase:", 0.0);
  objc_msgSend(v18, "setLineDashPattern:", 0);
  objc_msgSend(v18, "setLineWidth:", 0.0);
  objc_msgSend(v18, "setPath:", v11);

  CGPathRelease(v11);
}

+ (id)textBoundsLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  objc_msgSend(v9, "bounds");
  pv_CGRect_to_NSArray(v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textBoundingBoxColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v9, v10, v11, v13, &unk_1E66497A0, 0.0, 2.0);

  ensureNSublayers(v9, objc_msgSend(v10, "count"));
  objc_msgSend(v9, "sublayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__PVEffectDebugView_textBoundsLayerWithFrame_options___block_invoke;
  v18[3] = &unk_1E64D46E0;
  v19 = v10;
  v20 = v8;
  v15 = v8;
  v16 = v10;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);

  return v9;
}

void __54__PVEffectDebugView_textBoundsLayerWithFrame_options___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const CGPath *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  CGRect v19;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v19.origin.x = v8 + -2.0;
  v19.origin.y = v10 + -2.0;
  v19.size.width = 4.0;
  v19.size.height = 4.0;
  v11 = CGPathCreateWithEllipseInRect(v19, 0);
  objc_msgSend(*(id *)(a1 + 40), "textCornerPointColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textCornerPointColors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3 % objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v14);
  v18 = v5;
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v16, "CGColor"));
  v17 = objc_retainAutorelease(v15);
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  objc_msgSend(v18, "setLineDashPhase:", 0.0);
  objc_msgSend(v18, "setLineDashPattern:", 0);
  objc_msgSend(v18, "setLineWidth:", 0.0);
  objc_msgSend(v18, "setPath:", v11);

  CGPathRelease(v11);
}

+ (id)hitAreaShapeLayerWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MidX;
  double MidY;
  void *v19;
  double v20;
  int v21;
  __double2 v22;
  __double2 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  double v31;
  const CGPath *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  const CGPath *expanded_closed_CGPath_with_CGPath;
  _QWORD v41[4];
  id v42;
  id v43;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  objc_msgSend(v8, "hitAreaShapeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v12 = (v11 + -8.0) * 0.5;
  objc_msgSend(v9, "bounds");
  v13 = v44.origin.x;
  v14 = v44.origin.y;
  v15 = v44.size.width;
  v16 = v44.size.height;
  MidX = CGRectGetMidX(v44);
  v45.origin.x = v13;
  v45.origin.y = v14;
  v45.size.width = v15;
  v45.size.height = v16;
  MidY = CGRectGetMidY(v45);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.0;
  v21 = 5;
  do
  {
    v22 = __sincos_stret(v20 * 1.25663706 + 3.14159265);
    v23 = __sincos_stret(v20 * 1.25663706 + 3.14159265 + 0.628318531);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX + v12 * v22.__sinval, MidY + v12 * v22.__cosval);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX + v12 * 0.5 * v23.__sinval, MidY + v12 * 0.5 * v23.__cosval);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v25);

    v20 = v20 + 1.0;
    --v21;
  }
  while (v21);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  setShapeLayerPathFromPointsWithStyle(v9, v19, v26, v10, &unk_1E66497B8, 0.0, 2.0);

  ensureNSublayers(v9, 0xAuLL);
  objc_msgSend(v9, "sublayers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __56__PVEffectDebugView_hitAreaShapeLayerWithFrame_options___block_invoke;
  v41[3] = &unk_1E64D46E0;
  v42 = v19;
  v43 = v8;
  v28 = v8;
  v29 = v19;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v41);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v31) = 1050253722;
  objc_msgSend(v30, "setOpacity:", v31);
  objc_msgSend(v30, "setZPosition:", -1.0);
  objc_msgSend(v9, "addSublayer:", v30);
  ensureNSublayers(v30, 2uLL);
  v32 = (const CGPath *)objc_msgSend(v9, "path");
  objc_msgSend(v30, "sublayers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_retainAutorelease(v10);
  objc_msgSend(v34, "setFillColor:", objc_msgSend(v35, "CGColor"));
  objc_msgSend(v34, "setPath:", v32);

  objc_msgSend(v30, "sublayers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_retainAutorelease(v35);
  objc_msgSend(v37, "setFillColor:", objc_msgSend(v38, "CGColor"));
  expanded_closed_CGPath_with_CGPath = pv_create_expanded_closed_CGPath_with_CGPath(v32, 8.0);
  objc_msgSend(v37, "setPath:", expanded_closed_CGPath_with_CGPath);
  CGPathRelease(expanded_closed_CGPath_with_CGPath);

  return v9;
}

void __56__PVEffectDebugView_hitAreaShapeLayerWithFrame_options___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const CGPath *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  CGRect v19;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;

  v19.origin.x = v8 + -1.5;
  v19.origin.y = v10 + -1.5;
  v19.size.width = 3.0;
  v19.size.height = 3.0;
  v11 = CGPathCreateWithEllipseInRect(v19, 0);
  objc_msgSend(*(id *)(a1 + 40), "hitAreaPointColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hitAreaPointColors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3 % objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v14);
  v18 = v5;
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v16, "CGColor"));
  v17 = objc_retainAutorelease(v15);
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v17, "CGColor"));
  objc_msgSend(v18, "setLineDashPhase:", 0.0);
  objc_msgSend(v18, "setLineDashPattern:", 0);
  objc_msgSend(v18, "setLineWidth:", 0.0);
  objc_msgSend(v18, "setPath:", v11);

  CGPathRelease(v11);
}

- (PVEffectDebugViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_rootContainerView, a3);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (CATransformLayer)rootTransformLayer
{
  return self->_rootTransformLayer;
}

- (void)setRootTransformLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootTransformLayer, a3);
}

- (CAShapeLayer)documentBoundingBoxLayer
{
  return self->_documentBoundingBoxLayer;
}

- (void)setDocumentBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_documentBoundingBoxLayer, a3);
}

- (CAShapeLayer)outputROILayer
{
  return self->_outputROILayer;
}

- (void)setOutputROILayer:(id)a3
{
  objc_storeStrong((id *)&self->_outputROILayer, a3);
}

- (CAShapeLayer)objectAlignedBoundingBoxLayer
{
  return self->_objectAlignedBoundingBoxLayer;
}

- (void)setObjectAlignedBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxLayer, a3);
}

- (CALayer)textBoundingBoxesContainerLayer
{
  return self->_textBoundingBoxesContainerLayer;
}

- (void)setTextBoundingBoxesContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_textBoundingBoxesContainerLayer, a3);
}

- (CAShapeLayer)hitAreaShapeLayer
{
  return self->_hitAreaShapeLayer;
}

- (void)setHitAreaShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaShapeLayer, a3);
}

- (CAShapeLayer)hitAreaMinimumSizeBoundingBoxLayer
{
  return self->_hitAreaMinimumSizeBoundingBoxLayer;
}

- (void)setHitAreaMinimumSizeBoundingBoxLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaMinimumSizeBoundingBoxLayer, a3);
}

- (CAShapeLayer)midpointLayer
{
  return self->_midpointLayer;
}

- (void)setMidpointLayer:(id)a3
{
  objc_storeStrong((id *)&self->_midpointLayer, a3);
}

- (CAShapeLayer)originLayer
{
  return self->_originLayer;
}

- (void)setOriginLayer:(id)a3
{
  objc_storeStrong((id *)&self->_originLayer, a3);
}

- (CAShapeLayer)originCrosshairLayer
{
  return self->_originCrosshairLayer;
}

- (void)setOriginCrosshairLayer:(id)a3
{
  objc_storeStrong((id *)&self->_originCrosshairLayer, a3);
}

- (CAShapeLayer)cornerPointsLayer
{
  return self->_cornerPointsLayer;
}

- (void)setCornerPointsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_cornerPointsLayer, a3);
}

- (CALayer)textCornerPointsContainerLayer
{
  return self->_textCornerPointsContainerLayer;
}

- (void)setTextCornerPointsContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_textCornerPointsContainerLayer, a3);
}

- (CAShapeLayer)hitAreaPointsLayer
{
  return self->_hitAreaPointsLayer;
}

- (void)setHitAreaPointsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaPointsLayer, a3);
}

- (CAShapeLayer)userRectsLayer
{
  return self->_userRectsLayer;
}

- (void)setUserRectsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_userRectsLayer, a3);
}

- (CAShapeLayer)userRectsTransformedLayer
{
  return self->_userRectsTransformedLayer;
}

- (void)setUserRectsTransformedLayer:(id)a3
{
  objc_storeStrong((id *)&self->_userRectsTransformedLayer, a3);
}

- (CAShapeLayer)userPointsLayer
{
  return self->_userPointsLayer;
}

- (void)setUserPointsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_userPointsLayer, a3);
}

- (CAShapeLayer)userPointsTransformedLayer
{
  return self->_userPointsTransformedLayer;
}

- (void)setUserPointsTransformedLayer:(id)a3
{
  objc_storeStrong((id *)&self->_userPointsTransformedLayer, a3);
}

- (PVEffectDebugOptionsView)optionsView
{
  return self->_optionsView;
}

- (void)setOptionsView:(id)a3
{
  objc_storeStrong((id *)&self->_optionsView, a3);
}

- (PVEffectDebugViewDelegate)delegate
{
  return (PVEffectDebugViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_optionsView, 0);
  objc_storeStrong((id *)&self->_userPointsTransformedLayer, 0);
  objc_storeStrong((id *)&self->_userPointsLayer, 0);
  objc_storeStrong((id *)&self->_userRectsTransformedLayer, 0);
  objc_storeStrong((id *)&self->_userRectsLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaPointsLayer, 0);
  objc_storeStrong((id *)&self->_textCornerPointsContainerLayer, 0);
  objc_storeStrong((id *)&self->_cornerPointsLayer, 0);
  objc_storeStrong((id *)&self->_originCrosshairLayer, 0);
  objc_storeStrong((id *)&self->_originLayer, 0);
  objc_storeStrong((id *)&self->_midpointLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaMinimumSizeBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaShapeLayer, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxesContainerLayer, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_outputROILayer, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_rootTransformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
