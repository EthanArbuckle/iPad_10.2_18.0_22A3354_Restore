@implementation SBDynamicFlashlightActivityElementPackageLayerController

- (SBDynamicFlashlightActivityElementPackageLayerController)initWithPackageView:(id)a3
{
  id v6;
  SBDynamicFlashlightActivityElementPackageLayerController *v7;
  SBDynamicFlashlightActivityElementPackageLayerController *v8;
  uint64_t v9;
  CALayer *shadowLayer;
  uint64_t v11;
  CALayer *indicatorLayer;
  uint64_t v13;
  CALayer *circleLayer;
  uint64_t v15;
  CALayer *arcCropLeftLayer;
  uint64_t v17;
  CALayer *arcCropRightLayer;
  uint64_t v19;
  CALayer *tickLineLayer;
  uint64_t v21;
  CAReplicatorLayer *ticksRingLayer;
  uint64_t v23;
  CALayer *glyphHolderLayer;
  uint64_t v25;
  CALayer *glyphLayer;
  uint64_t v27;
  CALayer *maskContentsLayer;
  uint64_t v29;
  CALayer *wideRainbowLayer;
  uint64_t v31;
  CALayer *rainbowLeftLayer;
  uint64_t v33;
  CALayer *rainbowRightLayer;
  uint64_t v35;
  CALayer *spreadBeamImageLayer;
  uint64_t v37;
  CALayer *straightBeamImageLayer;
  uint64_t v39;
  CALayer *circleFlaresShifterLayer;
  uint64_t v41;
  CALayer *spreadBeamDimmerLayer;
  uint64_t v43;
  CALayer *straightBeamDimmerLayer;
  uint64_t v45;
  CALayer *rainbowLeftdimmerLayer;
  uint64_t v47;
  CALayer *rainbowRightdimmerLayer;
  uint64_t v49;
  CALayer *flashlightImageLayer;
  uint64_t v51;
  CALayer *wideRainbowDimmerLayer;
  uint64_t v53;
  CALayer *middleGlowDimmerLayer;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  objc_super v82;

  v6 = a3;
  v82.receiver = self;
  v82.super_class = (Class)SBDynamicFlashlightActivityElementPackageLayerController;
  v7 = -[SBDynamicFlashlightActivityElementPackageLayerController init](&v82, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_packageView, a3);
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("sensor hiding gradient"));
    v9 = objc_claimAutoreleasedReturnValue();
    shadowLayer = v8->_shadowLayer;
    v8->_shadowLayer = (CALayer *)v9;

    if (!v8->_shadowLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 81, CFSTR("Couldn't find layer %@"), CFSTR("sensor hiding gradient"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("indicator"));
    v11 = objc_claimAutoreleasedReturnValue();
    indicatorLayer = v8->_indicatorLayer;
    v8->_indicatorLayer = (CALayer *)v11;

    if (!v8->_indicatorLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 87, CFSTR("Couldn't find layer %@"), CFSTR("indicator"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("circle"));
    v13 = objc_claimAutoreleasedReturnValue();
    circleLayer = v8->_circleLayer;
    v8->_circleLayer = (CALayer *)v13;

    if (!v8->_circleLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 89, CFSTR("Couldn't find layer %@"), CFSTR("circle"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("arc_crop_left"));
    v15 = objc_claimAutoreleasedReturnValue();
    arcCropLeftLayer = v8->_arcCropLeftLayer;
    v8->_arcCropLeftLayer = (CALayer *)v15;

    if (!v8->_arcCropLeftLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 91, CFSTR("Couldn't find layer %@"), CFSTR("arc_crop_left"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("arc_crop_right"));
    v17 = objc_claimAutoreleasedReturnValue();
    arcCropRightLayer = v8->_arcCropRightLayer;
    v8->_arcCropRightLayer = (CALayer *)v17;

    if (!v8->_arcCropRightLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 92, CFSTR("Couldn't find layer %@"), CFSTR("arc_crop_right"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("tick"));
    v19 = objc_claimAutoreleasedReturnValue();
    tickLineLayer = v8->_tickLineLayer;
    v8->_tickLineLayer = (CALayer *)v19;

    if (!v8->_tickLineLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 94, CFSTR("Couldn't find layer %@"), CFSTR("tick"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("ticksring"));
    v21 = objc_claimAutoreleasedReturnValue();
    ticksRingLayer = v8->_ticksRingLayer;
    v8->_ticksRingLayer = (CAReplicatorLayer *)v21;

    if (!v8->_ticksRingLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 95, CFSTR("Couldn't find layer %@"), CFSTR("ticksring"));

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (objc_class *)objc_opt_class();
      NSStringFromClass(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 96, CFSTR("Wrong class: %@"), v65);

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("glyph_holder"));
    v23 = objc_claimAutoreleasedReturnValue();
    glyphHolderLayer = v8->_glyphHolderLayer;
    v8->_glyphHolderLayer = (CALayer *)v23;

    if (!v8->_glyphHolderLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 97, CFSTR("Couldn't find layer %@"), CFSTR("glyph_holder"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("glyph"));
    v25 = objc_claimAutoreleasedReturnValue();
    glyphLayer = v8->_glyphLayer;
    v8->_glyphLayer = (CALayer *)v25;

    if (!v8->_glyphLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 98, CFSTR("Couldn't find layer %@"), CFSTR("glyph"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("contents"));
    v27 = objc_claimAutoreleasedReturnValue();
    maskContentsLayer = v8->_maskContentsLayer;
    v8->_maskContentsLayer = (CALayer *)v27;

    if (!v8->_maskContentsLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 100, CFSTR("Couldn't find layer %@"), CFSTR("contents"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("wide rainbow"));
    v29 = objc_claimAutoreleasedReturnValue();
    wideRainbowLayer = v8->_wideRainbowLayer;
    v8->_wideRainbowLayer = (CALayer *)v29;

    if (!v8->_wideRainbowLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 102, CFSTR("Couldn't find layer %@"), CFSTR("wide rainbow"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("rainL"));
    v31 = objc_claimAutoreleasedReturnValue();
    rainbowLeftLayer = v8->_rainbowLeftLayer;
    v8->_rainbowLeftLayer = (CALayer *)v31;

    if (!v8->_rainbowLeftLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 103, CFSTR("Couldn't find layer %@"), CFSTR("rainL"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("rainR"));
    v33 = objc_claimAutoreleasedReturnValue();
    rainbowRightLayer = v8->_rainbowRightLayer;
    v8->_rainbowRightLayer = (CALayer *)v33;

    if (!v8->_rainbowRightLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 104, CFSTR("Couldn't find layer %@"), CFSTR("rainR"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("spreadBeamImage"));
    v35 = objc_claimAutoreleasedReturnValue();
    spreadBeamImageLayer = v8->_spreadBeamImageLayer;
    v8->_spreadBeamImageLayer = (CALayer *)v35;

    if (!v8->_spreadBeamImageLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 105, CFSTR("Couldn't find layer %@"), CFSTR("spreadBeamImage"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("straightBeamImage"));
    v37 = objc_claimAutoreleasedReturnValue();
    straightBeamImageLayer = v8->_straightBeamImageLayer;
    v8->_straightBeamImageLayer = (CALayer *)v37;

    if (!v8->_straightBeamImageLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 106, CFSTR("Couldn't find layer %@"), CFSTR("straightBeamImage"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("circle flares shifter"));
    v39 = objc_claimAutoreleasedReturnValue();
    circleFlaresShifterLayer = v8->_circleFlaresShifterLayer;
    v8->_circleFlaresShifterLayer = (CALayer *)v39;

    if (!v8->_circleFlaresShifterLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 107, CFSTR("Couldn't find layer %@"), CFSTR("circle flares shifter"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("spreadBeamDimmer"));
    v41 = objc_claimAutoreleasedReturnValue();
    spreadBeamDimmerLayer = v8->_spreadBeamDimmerLayer;
    v8->_spreadBeamDimmerLayer = (CALayer *)v41;

    if (!v8->_spreadBeamDimmerLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 109, CFSTR("Couldn't find layer %@"), CFSTR("spreadBeamDimmer"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("straightBeamDimmer"));
    v43 = objc_claimAutoreleasedReturnValue();
    straightBeamDimmerLayer = v8->_straightBeamDimmerLayer;
    v8->_straightBeamDimmerLayer = (CALayer *)v43;

    if (!v8->_straightBeamDimmerLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 110, CFSTR("Couldn't find layer %@"), CFSTR("straightBeamDimmer"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("rainLdimmer"));
    v45 = objc_claimAutoreleasedReturnValue();
    rainbowLeftdimmerLayer = v8->_rainbowLeftdimmerLayer;
    v8->_rainbowLeftdimmerLayer = (CALayer *)v45;

    if (!v8->_rainbowLeftdimmerLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 111, CFSTR("Couldn't find layer %@"), CFSTR("rainLdimmer"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("rainRdimmer"));
    v47 = objc_claimAutoreleasedReturnValue();
    rainbowRightdimmerLayer = v8->_rainbowRightdimmerLayer;
    v8->_rainbowRightdimmerLayer = (CALayer *)v47;

    if (!v8->_rainbowRightdimmerLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 112, CFSTR("Couldn't find layer %@"), CFSTR("rainRdimmer"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("flashlightImage"));
    v49 = objc_claimAutoreleasedReturnValue();
    flashlightImageLayer = v8->_flashlightImageLayer;
    v8->_flashlightImageLayer = (CALayer *)v49;

    if (!v8->_flashlightImageLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 113, CFSTR("Couldn't find layer %@"), CFSTR("flashlightImage"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("widerainbowdimmer"));
    v51 = objc_claimAutoreleasedReturnValue();
    wideRainbowDimmerLayer = v8->_wideRainbowDimmerLayer;
    v8->_wideRainbowDimmerLayer = (CALayer *)v51;

    if (!v8->_wideRainbowDimmerLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 114, CFSTR("Couldn't find layer %@"), CFSTR("widerainbowdimmer"));

    }
    -[BSUICAPackageView publishedObjectWithName:](v8->_packageView, "publishedObjectWithName:", CFSTR("middleglowDimmer"));
    v53 = objc_claimAutoreleasedReturnValue();
    middleGlowDimmerLayer = v8->_middleGlowDimmerLayer;
    v8->_middleGlowDimmerLayer = (CALayer *)v53;

    if (!v8->_middleGlowDimmerLayer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SBDynamicFlashlightActivityElementPackageLayerController.m"), 115, CFSTR("Couldn't find layer %@"), CFSTR("middleglowDimmer"));

    }
  }

  return v8;
}

- (id)sensorShadowPortalLayer
{
  CAPortalLayer *shadowPortalLayer;
  id v4;
  CAPortalLayer *v5;
  CGAffineTransform v7;

  shadowPortalLayer = self->_shadowPortalLayer;
  if (!shadowPortalLayer)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CD2800]);
    objc_msgSend(v4, "setSourceLayer:", self->_shadowLayer);
    objc_msgSend(v4, "setHidesSourceLayer:", 1);
    objc_msgSend(v4, "setGeometryFlipped:", 1);
    -[CALayer bounds](self->_shadowLayer, "bounds");
    SBRectWithSize();
    objc_msgSend(v4, "setBounds:");
    CGAffineTransformMakeScale(&v7, 0.333333333, 0.333333333);
    objc_msgSend(v4, "setAffineTransform:", &v7);
    v5 = self->_shadowPortalLayer;
    self->_shadowPortalLayer = (CAPortalLayer *)v4;

    shadowPortalLayer = self->_shadowPortalLayer;
  }
  return shadowPortalLayer;
}

- (void)updateIndicatorLayersForIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  long double v8;
  CALayer *arcCropLeftLayer;
  CALayer *arcCropRightLayer;
  double v11;
  CALayer *glyphHolderLayer;
  long double v13;
  long double v14;
  CAReplicatorLayer *ticksRingLayer;
  CAReplicatorLayer *v16;
  long double v17;
  __CFString *v18;
  NSString *v19;
  CATransform3D v20;
  CATransform3D v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v8 = 1.0 - a4;
  arcCropLeftLayer = self->_arcCropLeftLayer;
  CGAffineTransformMakeRotation(&v24, (a4 * 42.0 + (1.0 - a4) * 5.0) * 0.0174532925);
  -[CALayer setAffineTransform:](arcCropLeftLayer, "setAffineTransform:", &v24);
  arcCropRightLayer = self->_arcCropRightLayer;
  CGAffineTransformMakeRotation(&v23, (a4 * -35.0 + v8 * -5.0) * 0.0174532925);
  -[CALayer setAffineTransform:](arcCropRightLayer, "setAffineTransform:", &v23);
  v11 = 1.0 - a3;
  glyphHolderLayer = self->_glyphHolderLayer;
  CGAffineTransformMakeRotation(&v22, (a3 * 0.0 + (1.0 - a3) * -10.0) * 0.0174532925 + (a4 * -38.0 + v8 * -6.4) * 0.0174532925);
  -[CALayer setAffineTransform:](glyphHolderLayer, "setAffineTransform:", &v22);
  v13 = a4 + v8 * 1.35;
  -[CALayer setBounds:](self->_circleLayer, "setBounds:", 0.0, 0.0, (double)((a3 * 1000.0 + v11 * 180.0) * v13), (double)((a3 * 1000.0 + v11 * 180.0) * v13));
  -[CALayer setCornerRadius:](self->_circleLayer, "setCornerRadius:", (double)((a3 * 1000.0 + (1.0 - a3) * 180.0) * v13 * 0.5));
  v14 = (v13 * 641.0 + -641.0) * 0.5;
  -[CALayer setPosition:](self->_tickLineLayer, "setPosition:", 19.0, (double)(v14 + 822.1));
  ticksRingLayer = self->_ticksRingLayer;
  CATransform3DMakeRotation(&v21, (a4 * 3.8 + v8 * 2.5) * 0.0174532925, 0.0, 0.0, 1.0);
  -[CAReplicatorLayer setInstanceTransform:](ticksRingLayer, "setInstanceTransform:", &v21);
  v16 = self->_ticksRingLayer;
  CATransform3DMakeRotation(&v20, (a4 * 0.0 + v8 * 10.5) * 0.0174532925, 0.0, 0.0, 1.0);
  -[CAReplicatorLayer setTransform:](v16, "setTransform:", &v20);
  v17 = pow(v8, 3.0) * 12.0;
  -[CALayer setPosition:](self->_glyphLayer, "setPosition:", (double)(v8 * 10.0 * a3 + v11 * 20.0 + 276.1637), (double)(v11 * (a4 * -50.0 + v8 * 0.0) + v14 * a3 + v11 * -220.0 + v17 * pow(a4, 3.0) + 320.5));
  if (a3 >= 0.9)
    v18 = CFSTR("normal");
  else
    v18 = CFSTR("showing_max");
  v19 = v18;
  if (self->_maxLineState != v19)
  {
    objc_storeStrong((id *)&self->_maxLineState, v18);
    -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self->_packageView, "setState:onLayer:animated:transitionSpeed:completion:", self->_maxLineState, self->_maskContentsLayer, 1, 0, 1.0);
  }

}

- (void)updateBeamLayersForIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  double v5;
  long double v8;
  CALayer *wideRainbowLayer;
  long double v10;
  CALayer *spreadBeamImageLayer;
  long double v12;
  long double v13;
  CALayer *straightBeamImageLayer;
  long double v15;
  float v16;
  double v17;
  CALayer *v18;
  CALayer *rainbowLeftLayer;
  CALayer *rainbowRightLayer;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CATransform3D v37;
  CGAffineTransform v38;

  v5 = a4;
  v8 = 1.0 - a4;
  wideRainbowLayer = self->_wideRainbowLayer;
  CGAffineTransformMakeScale(&v38, a4 * 0.57 + (1.0 - a4) * 0.79, a4 * 1.11 + (1.0 - a4) * 0.79);
  -[CALayer setAffineTransform:](wideRainbowLayer, "setAffineTransform:", &v38);
  v10 = v5 * 0.53 + v8 * 0.25;
  *(float *)&v10 = v10;
  -[CALayer setOpacity:](self->_wideRainbowLayer, "setOpacity:", (double)v10);
  -[CALayer setPosition:](self->_wideRainbowLayer, "setPosition:", 237.6717, (double)(v5 * 312.0 + v8 * 390.0));
  spreadBeamImageLayer = self->_spreadBeamImageLayer;
  CATransform3DMakeScale(&v37, v5 * 3.749 + v8 * 1.969, 1.37, 1.81);
  -[CALayer setTransform:](spreadBeamImageLayer, "setTransform:", &v37);
  v12 = pow(v8, 3.0);
  v13 = v12 * 0.525 + (1.0 - v12) * 0.0;
  *(float *)&v13 = v13;
  -[CALayer setOpacity:](self->_straightBeamImageLayer, "setOpacity:", (double)v13);
  straightBeamImageLayer = self->_straightBeamImageLayer;
  CGAffineTransformMakeScale(&v36, v5 * 3.33 + v8 * 0.63, v5 + v8 * 2.96);
  -[CALayer setAffineTransform:](straightBeamImageLayer, "setAffineTransform:", &v36);
  v15 = v5 * 0.28 + v8 * 0.03;
  v16 = v15;
  *(float *)&v15 = v16;
  -[CALayer setOpacity:](self->_rainbowLeftLayer, "setOpacity:", (double)v15);
  *(float *)&v17 = v16;
  -[CALayer setOpacity:](self->_rainbowRightLayer, "setOpacity:", v17);
  v18 = self->_wideRainbowLayer;
  CGAffineTransformMakeScale(&v35, v5 + v8 * 0.3, v5 + v8 * 0.5);
  -[CALayer setAffineTransform:](v18, "setAffineTransform:", &v35);
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeRotation(&t1, (v5 * 0.0 + v8 * -50.9) * 0.0174532925);
  CGAffineTransformMakeScale(&t2, 3.56, 3.56);
  CGAffineTransformConcat(&v34, &t1, &t2);
  rainbowLeftLayer = self->_rainbowLeftLayer;
  v31 = v34;
  -[CALayer setAffineTransform:](rainbowLeftLayer, "setAffineTransform:", &v31);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeRotation(&v30, (v5 * 0.0 + v8 * 54.1) * 0.0174532925);
  CGAffineTransformMakeScale(&v29, 3.56, 3.56);
  CGAffineTransformConcat(&v31, &v30, &v29);
  rainbowRightLayer = self->_rainbowRightLayer;
  v28 = v31;
  -[CALayer setAffineTransform:](rainbowRightLayer, "setAffineTransform:", &v28);
  v21 = a3 * 0.0 + (1.0 - a3) * 0.7;
  *(float *)&v8 = v21;
  LODWORD(v21) = LODWORD(v8);
  -[CALayer setOpacity:](self->_spreadBeamDimmerLayer, "setOpacity:", v21);
  LODWORD(v22) = LODWORD(v8);
  -[CALayer setOpacity:](self->_straightBeamDimmerLayer, "setOpacity:", v22);
  v23 = a3 * 0.0 + (1.0 - a3) * 0.95;
  *(float *)&v5 = v23;
  LODWORD(v23) = LODWORD(v5);
  -[CALayer setOpacity:](self->_rainbowLeftdimmerLayer, "setOpacity:", v23);
  LODWORD(v24) = LODWORD(v5);
  -[CALayer setOpacity:](self->_rainbowRightdimmerLayer, "setOpacity:", v24);
  v25 = a3 * 0.419 + (1.0 - a3) * 0.25;
  *(float *)&v25 = v25;
  -[CALayer setOpacity:](self->_flashlightImageLayer, "setOpacity:", v25);
  LODWORD(v26) = LODWORD(v8);
  -[CALayer setOpacity:](self->_wideRainbowDimmerLayer, "setOpacity:", v26);
  v27 = 1.0 - a3 + a3 * 0.0;
  *(float *)&v27 = v27;
  -[CALayer setOpacity:](self->_middleGlowDimmerLayer, "setOpacity:", v27);
}

- (void)setBeamIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[SBDynamicFlashlightActivityElementPackageLayerController updateBeamLayersForIntensity:width:animated:](self, "updateBeamLayersForIntensity:width:animated:");
  -[SBDynamicFlashlightActivityElementPackageLayerController updateIndicatorLayersForIntensity:width:animated:](self, "updateIndicatorLayersForIntensity:width:animated:", v5, a3, a4);
}

- (void)setTouching:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  __CFString *v7;
  NSString *v8;
  NSObject *v9;

  v4 = a4;
  if (a3)
    v7 = CFSTR("touching");
  else
    v7 = CFSTR("normal");
  v8 = v7;
  if (self->_touchingState != v8)
  {
    SBLogFlashlightHUD();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBDynamicFlashlightActivityElementPackageLayerController setTouching:animated:].cold.1(a3, v9);

    objc_storeStrong((id *)&self->_touchingState, v7);
    -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self->_packageView, "setState:onLayer:animated:transitionSpeed:completion:", self->_touchingState, self->_indicatorLayer, v4, 0, 1.0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchingState, 0);
  objc_storeStrong((id *)&self->_maxLineState, 0);
  objc_storeStrong((id *)&self->_middleGlowDimmerLayer, 0);
  objc_storeStrong((id *)&self->_wideRainbowDimmerLayer, 0);
  objc_storeStrong((id *)&self->_flashlightImageLayer, 0);
  objc_storeStrong((id *)&self->_rainbowRightdimmerLayer, 0);
  objc_storeStrong((id *)&self->_rainbowLeftdimmerLayer, 0);
  objc_storeStrong((id *)&self->_straightBeamDimmerLayer, 0);
  objc_storeStrong((id *)&self->_spreadBeamDimmerLayer, 0);
  objc_storeStrong((id *)&self->_circleFlaresShifterLayer, 0);
  objc_storeStrong((id *)&self->_straightBeamImageLayer, 0);
  objc_storeStrong((id *)&self->_spreadBeamImageLayer, 0);
  objc_storeStrong((id *)&self->_rainbowRightLayer, 0);
  objc_storeStrong((id *)&self->_rainbowLeftLayer, 0);
  objc_storeStrong((id *)&self->_wideRainbowLayer, 0);
  objc_storeStrong((id *)&self->_maskContentsLayer, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphHolderLayer, 0);
  objc_storeStrong((id *)&self->_ticksRingLayer, 0);
  objc_storeStrong((id *)&self->_tickLineLayer, 0);
  objc_storeStrong((id *)&self->_arcCropRightLayer, 0);
  objc_storeStrong((id *)&self->_arcCropLeftLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_indicatorLayer, 0);
  objc_storeStrong((id *)&self->_shadowPortalLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
}

- (void)setTouching:(char)a1 animated:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Layer Touching -> %{BOOL}u", (uint8_t *)v2, 8u);
}

@end
