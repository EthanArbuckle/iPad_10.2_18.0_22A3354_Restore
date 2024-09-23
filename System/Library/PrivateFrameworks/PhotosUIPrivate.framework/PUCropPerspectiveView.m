@implementation PUCropPerspectiveView

- (PUCropPerspectiveView)initWithFrame:(CGRect)a3
{
  PUCropPerspectiveView *v3;
  CALayer *v4;
  CALayer *imageLayer;
  void *v6;
  CALayer *v7;
  CALayer *mediaSuperlayer;
  void *v9;
  CALayer *mediaLayer;
  void *v11;
  CALayer *v12;
  CALayer *debugLayer;
  void *v14;
  CAShapeLayer *v15;
  CAShapeLayer *debugCropRectLayer;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  CAShapeLayer *v24;
  CAShapeLayer *debugQuadLayer;
  id v26;
  id v27;
  id v28;
  double v29;
  CAShapeLayer *v30;
  CAShapeLayer *debugViewRectLayer;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  NUCropModel *cropModel;
  void *v38;
  void *v39;
  objc_super v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)PUCropPerspectiveView;
  v3 = -[PUCropPerspectiveView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageLayer = v3->_imageLayer;
    v3->_imageLayer = v4;

    -[PUCropPerspectiveView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v3->_imageLayer);

    v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    mediaSuperlayer = v3->_mediaSuperlayer;
    v3->_mediaSuperlayer = v7;

    -[CALayer setZPosition:](v3->_mediaSuperlayer, "setZPosition:", 0.1);
    -[PUCropPerspectiveView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v3->_mediaSuperlayer);

    mediaLayer = v3->_mediaLayer;
    v3->_mediaLayer = 0;

    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isDebugging = objc_msgSend(v11, "perspectiveViewDebugCropEnabled");

    if (v3->_isDebugging)
    {
      v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      debugLayer = v3->_debugLayer;
      v3->_debugLayer = v12;

      -[PUCropPerspectiveView layer](v3, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSublayer:", v3->_debugLayer);

      v15 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      debugCropRectLayer = v3->_debugCropRectLayer;
      v3->_debugCropRectLayer = v15;

      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setBorderColor:](v3->_debugCropRectLayer, "setBorderColor:", objc_msgSend(v17, "CGColor"));

      -[CAShapeLayer setBorderWidth:](v3->_debugCropRectLayer, "setBorderWidth:", 2.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setBackgroundColor:](v3->_debugCropRectLayer, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](v3->_debugCropRectLayer, "setStrokeColor:", objc_msgSend(v19, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v3->_debugCropRectLayer, "setFillColor:", objc_msgSend(v20, "CGColor"));

      LODWORD(v21) = 1059648963;
      -[CAShapeLayer setOpacity:](v3->_debugCropRectLayer, "setOpacity:", v21);
      v22 = *MEMORY[0x1E0C9D538];
      v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[CAShapeLayer setAnchorPoint:](v3->_debugCropRectLayer, "setAnchorPoint:", *MEMORY[0x1E0C9D538], v23);
      -[CALayer addSublayer:](v3->_debugLayer, "addSublayer:", v3->_debugCropRectLayer);
      v24 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      debugQuadLayer = v3->_debugQuadLayer;
      v3->_debugQuadLayer = v24;

      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setBorderColor:](v3->_debugQuadLayer, "setBorderColor:", objc_msgSend(v26, "CGColor"));

      -[CAShapeLayer setBorderWidth:](v3->_debugQuadLayer, "setBorderWidth:", 3.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](v3->_debugQuadLayer, "setStrokeColor:", objc_msgSend(v27, "CGColor"));

      -[CAShapeLayer setLineWidth:](v3->_debugQuadLayer, "setLineWidth:", 3.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v3->_debugQuadLayer, "setFillColor:", objc_msgSend(v28, "CGColor"));

      LODWORD(v29) = 1064514355;
      -[CAShapeLayer setOpacity:](v3->_debugQuadLayer, "setOpacity:", v29);
      -[CAShapeLayer setAnchorPoint:](v3->_debugQuadLayer, "setAnchorPoint:", v22, v23);
      -[CALayer addSublayer:](v3->_debugLayer, "addSublayer:", v3->_debugQuadLayer);
      v30 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      debugViewRectLayer = v3->_debugViewRectLayer;
      v3->_debugViewRectLayer = v30;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setBorderColor:](v3->_debugViewRectLayer, "setBorderColor:", objc_msgSend(v32, "CGColor"));

      -[CAShapeLayer setBorderWidth:](v3->_debugViewRectLayer, "setBorderWidth:", 3.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setBackgroundColor:](v3->_debugViewRectLayer, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](v3->_debugViewRectLayer, "setStrokeColor:", objc_msgSend(v34, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v3->_debugViewRectLayer, "setFillColor:", objc_msgSend(v35, "CGColor"));

      LODWORD(v36) = 1058642330;
      -[CAShapeLayer setOpacity:](v3->_debugViewRectLayer, "setOpacity:", v36);
      -[CAShapeLayer setAnchorPoint:](v3->_debugViewRectLayer, "setAnchorPoint:", v22, v23);
      -[CALayer addSublayer:](v3->_debugLayer, "addSublayer:", v3->_debugViewRectLayer);
    }
    cropModel = v3->_cropModel;
    v3->_cropModel = 0;

    v41.receiver = v3;
    v41.super_class = (Class)PUCropPerspectiveView;
    -[PUCropTransformedImageView setOrientation:](&v41, sel_setOrientation_, 1);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel_handlePanGesture_);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", v3, sel_handlePinchGesture_);
    objc_msgSend(v38, "setDelegate:", v3);
    objc_msgSend(v39, "setDelegate:", v3);
    -[PUCropPerspectiveView addGestureRecognizer:](v3, "addGestureRecognizer:", v38);
    -[PUCropPerspectiveView addGestureRecognizer:](v3, "addGestureRecognizer:", v39);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PUCropPerspectiveView;
  -[PUCropPerspectiveView dealloc](&v3, sel_dealloc);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (CATransform3D)_imageOrientationTransformWithoutTranslation
{
  PLImageGeometry *imageGeometry;
  CGAffineTransform v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  imageGeometry = self->_imageGeometry;
  if (imageGeometry)
  {
    -[PLImageGeometry appliedTransform](imageGeometry, "appliedTransform");
  }
  else
  {
    v7 = 0uLL;
    v8 = 0uLL;
  }
  v9 = 0uLL;
  *(_OWORD *)&v6.a = v7;
  *(_OWORD *)&v6.c = v8;
  *(_OWORD *)&v6.tx = 0uLL;
  return CATransform3DMakeAffineTransform(retstr, &v6);
}

- (CATransform3D)_imageOrientationTransform
{
  PLImageGeometry *imageGeometry;
  CGAffineTransform v6[2];

  memset(&v6[1], 0, sizeof(CGAffineTransform));
  imageGeometry = self->_imageGeometry;
  if (imageGeometry)
    -[PLImageGeometry appliedTransform](imageGeometry, "appliedTransform");
  v6[0] = v6[1];
  return CATransform3DMakeAffineTransform(retstr, v6);
}

- (CGSize)masterImageSize
{
  double v2;
  double v3;
  CGSize result;

  -[NUCropModel masterImageSize](self->_cropModel, "masterImageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_animateValueFromValue:(double)a3 toValue:(double)a4 interpolation:(id)a5 completion:(id)a6
{
  void (**v9)(_QWORD, double);
  void (**v10)(id, uint64_t);
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  void (**v15)(_QWORD, double);
  void (**v16)(id, uint64_t);
  double v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, double);

  v9 = (void (**)(_QWORD, double))a5;
  v10 = (void (**)(id, uint64_t))a6;
  if (a3 == a4)
  {
    v9[2](v9, a4);
    if (v10)
      v10[2](v10, 1);
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC4130], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", a3, 0.0, a4, 300.0, 1.0, 0.01);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke;
    v18[3] = &unk_1E589E600;
    v19 = v9;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke_2;
    v14[3] = &unk_1E589E628;
    v15 = v19;
    v17 = a4;
    v16 = v10;
    objc_msgSend(v11, "runWithValueApplier:completion:", v18, v14);

  }
  return v11;
}

- (void)updateLayerTransformsAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  self->_needsUpdateLayerTransforms = 1;
  self->_needsUpdateLayerTransformsAnimated |= a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PUCropPerspectiveView_updateLayerTransformsAnimated___block_invoke;
  v3[3] = &unk_1E58AAD68;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)updateLayerTransformsAnimated:(BOOL)a3 viewCropRect:(CGRect)a4 modelCropRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  BOOL v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
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
  const char *v42;
  id v43;
  const char *v44;
  id v45;
  const char *v46;
  id v47;
  const char *v48;
  id v49;
  const char *v50;
  id v51;
  _UIDynamicAnimation *currentAnimation;
  _UIDynamicAnimation *v53;
  double v54;
  _UIDynamicAnimation *v55;
  _UIDynamicAnimation *v56;
  NUCropModel *cropModel;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGPoint v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  CGPath *Mutable;
  float64x2_t v68;
  CGFloat v69;
  CAShapeLayer *debugQuadLayer;
  const CGPath *v76;
  CAShapeLayer *debugCropRectLayer;
  const CGPath *v78;
  CAShapeLayer *debugViewRectLayer;
  CALayer *debugLayer;
  const char *v81;
  const char *v82;
  id v83;
  BOOL v84;
  CGFloat v85;
  CGFloat v86;
  float64x2_t v87;
  uint64_t x;
  float64x2_t xa;
  uint64_t v90;
  float64x2_t v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  float64x2_t v98;
  CGFloat point;
  CGPoint pointa;
  double v101;
  double v102;
  CATransform3D v103;
  CATransform3D v104;
  CATransform3D v105;
  CATransform3D v106;
  CATransform3D v107;
  CATransform3D v108;
  CATransform3D v109;
  CATransform3D v110;
  _QWORD v111[11];
  _QWORD v112[18];
  CGPoint v113;
  CGPoint v114;
  CGPoint v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  if (self->_needsUpdateLayerTransforms)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    v8 = a4.size.height;
    v9 = a4.size.width;
    v10 = a4.origin.y;
    v11 = a4.origin.x;
    v13 = self->_layerTransformUpdateAnimated || a3;
    self->_needsUpdateLayerTransforms = 0;
    v102 = a5.origin.x;
    -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
    PLRectGetCenter();
    v92 = v15;
    v93 = v14;
    PLRectGetCenter();
    v90 = v16;
    x = v17;
    -[NUCropModel masterImageRect](self->_cropModel, "masterImageRect");
    PLRectGetCenter();
    point = v18;
    v86 = v19;
    PLRectGetCenter();
    v85 = v20;
    v97 = v21;
    -[PUCropTransformedImageView imageSize](self, "imageSize");
    -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:");
    v101 = width;
    v24 = v11;
    v25 = v10;
    if (v22 < 1.0)
      v22 = 1.0;
    v26 = v9 / v22;
    if (v23 < 1.0)
      v23 = 1.0;
    v27 = v8 / v23;
    v28 = height;
    if (v26 >= v27)
      v29 = v26;
    else
      v29 = v27;
    -[PUCropTransformedImageView imageSize](self, "imageSize");
    v95 = v9;
    v96 = v8;
    v94 = v10;
    v31 = v30;
    v33 = v32;
    -[NUCropModel masterImageSize](self->_cropModel, "masterImageSize");
    if (v34 < 1.0)
      v34 = 1.0;
    v36 = v31 / v34;
    if (v35 < 1.0)
      v35 = 1.0;
    v37 = v33 / v35;
    if (v36 >= v37)
      v38 = v36;
    else
      v38 = v37;
    v39 = v38;
    -[PUCropPerspectiveView _viewScaleWithModelCropRect:](self, "_viewScaleWithModelCropRect:", v102, y, v101, v28);
    v41 = v40;
    if (self->_isDebugging)
    {
      v42 = "YES";
      if (!v13)
        v42 = "NO";
      v82 = v42;
      -[PUCropTransformedImageView orientation](self, "orientation");
      PLOrientationName();
      v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v81 = (const char *)objc_msgSend(v83, "UTF8String");
      v116.origin.x = v102;
      v116.origin.y = y;
      v116.size.width = v101;
      v116.size.height = v28;
      NSStringFromCGRect(v116);
      v84 = v13;
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = (const char *)objc_msgSend(v43, "UTF8String");
      v117.origin.x = v24;
      v117.origin.y = v25;
      v117.size.width = v95;
      v117.size.height = v96;
      NSStringFromCGRect(v117);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v46 = (const char *)objc_msgSend(v45, "UTF8String");
      v113.y = v92;
      v113.x = v93;
      NSStringFromCGPoint(v113);
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v48 = (const char *)objc_msgSend(v47, "UTF8String");
      v114.x = point;
      v114.y = v86;
      NSStringFromCGPoint(v114);
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v50 = (const char *)objc_msgSend(v49, "UTF8String");
      v115.x = v85;
      v115.y = v97;
      NSStringFromCGPoint(v115);
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf(" updateLayerTransformsAnimated: %s\n  - orientation = %s\n  - modelCropRect: = %s\n  - croppingRect: = %s\n  - canvasFrameCenter: = %s\n  - imageCenter: = %s\n  - modelCropCenter: = %s\n  - uiCroppingRectToImageScale: = %f\n  - uiImageToMasterImageScale: = %f\n  - imageZoomScale: = %f\n\n", v82, v81, v44, v46, v48, v50, (const char *)objc_msgSend(v51, "UTF8String"), v29,
        v39,
        v41);

      v13 = v84;
    }
    currentAnimation = self->_currentAnimation;
    if (currentAnimation)
    {
      -[_UIDynamicAnimation stop](currentAnimation, "stop");
      v53 = self->_currentAnimation;
      self->_currentAnimation = 0;

    }
    v54 = 0.0;
    v112[0] = MEMORY[0x1E0C809B0];
    if (!v13)
      v54 = 1.0;
    v112[1] = 3221225472;
    v112[2] = __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke;
    v112[3] = &unk_1E589E650;
    v112[4] = self;
    *(double *)&v112[5] = v41;
    *(CGFloat *)&v112[6] = v85;
    *(CGFloat *)&v112[7] = v97;
    v112[8] = v90;
    v112[9] = x;
    *(double *)&v112[10] = v29;
    *(double *)&v112[11] = v39;
    *(CGFloat *)&v112[12] = point;
    *(CGFloat *)&v112[13] = v86;
    v112[14] = 0x3FF0000000000000;
    *(CGFloat *)&v112[15] = point;
    *(CGFloat *)&v112[16] = v86;
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke_2;
    v111[3] = &unk_1E589E678;
    v111[4] = self;
    *(double *)&v111[5] = v41;
    *(CGFloat *)&v111[6] = v85;
    *(CGFloat *)&v111[7] = v97;
    v111[8] = v90;
    v111[9] = x;
    *(double *)&v111[10] = v29;
    -[PUCropPerspectiveView _animateValueFromValue:toValue:interpolation:completion:](self, "_animateValueFromValue:toValue:interpolation:completion:", v112, v111, v54, 1.0);
    v55 = (_UIDynamicAnimation *)objc_claimAutoreleasedReturnValue();
    v56 = self->_currentAnimation;
    self->_currentAnimation = v55;

    if (self->_debugLayer)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", !v13);
      cropModel = self->_cropModel;
      -[NUCropModel pitchRadians](cropModel, "pitchRadians");
      v59 = v58;
      -[NUCropModel yawRadians](self->_cropModel, "yawRadians");
      v61 = v60;
      -[NUCropModel rollRadians](self->_cropModel, "rollRadians");
      -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:withExpansionTol:](cropModel, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:", v59, v61, v62, 0.00001);
      v98 = v64;
      pointa = v63;
      xa = v65;
      v91 = v66;
      Mutable = CGPathCreateMutable();
      v68 = vsubq_f64(vmaxnmq_f64(vmaxnmq_f64((float64x2_t)pointa, xa), vmaxnmq_f64(v98, v91)), vminnmq_f64(vminnmq_f64((float64x2_t)pointa, xa), vminnmq_f64(v98, v91)));
      v69 = 400.0 / sqrt(vaddvq_f64(vmulq_f64(v68, v68)));
      __asm { FMOV            V1.2D, #0.25 }
      v87 = vmulq_f64(vaddq_f64(v91, vaddq_f64(v98, vaddq_f64((float64x2_t)pointa, xa))), _Q1);
      CGPathMoveToPoint(Mutable, 0, pointa.x, pointa.y);
      CGPathAddLineToPoint(Mutable, 0, xa.f64[0], xa.f64[1]);
      CGPathAddLineToPoint(Mutable, 0, v91.f64[0], v91.f64[1]);
      CGPathAddLineToPoint(Mutable, 0, v98.f64[0], v98.f64[1]);
      CGPathAddLineToPoint(Mutable, 0, pointa.x, pointa.y);
      CGPathCloseSubpath(Mutable);
      -[CAShapeLayer setPath:](self->_debugQuadLayer, "setPath:", Mutable);
      -[CAShapeLayer setPosition:](self->_debugQuadLayer, "setPosition:", -v87.f64[0], 300.0 - v87.f64[1]);
      CATransform3DMakeScale(&v110, 1.0, -1.0, 1.0);
      debugQuadLayer = self->_debugQuadLayer;
      v109 = v110;
      -[CAShapeLayer setTransform:](debugQuadLayer, "setTransform:", &v109);
      CGPathRelease(Mutable);
      v118.size.width = v101;
      v118.origin.x = v102;
      v118.origin.y = y;
      v118.size.height = v28;
      v76 = CGPathCreateWithRect(v118, 0);
      -[CAShapeLayer setPath:](self->_debugCropRectLayer, "setPath:", v76);
      -[CAShapeLayer setPosition:](self->_debugCropRectLayer, "setPosition:", -v87.f64[0], 300.0 - v87.f64[1]);
      CATransform3DMakeScale(&v108, 1.0, -1.0, 1.0);
      debugCropRectLayer = self->_debugCropRectLayer;
      v107 = v108;
      -[CAShapeLayer setTransform:](debugCropRectLayer, "setTransform:", &v107);
      CGPathRelease(v76);
      v119.origin.x = v24;
      v119.origin.y = v94;
      v119.size.width = v95;
      v119.size.height = v96;
      v78 = CGPathCreateWithRect(v119, 0);
      -[CAShapeLayer setPath:](self->_debugViewRectLayer, "setPath:", v78);
      -[CAShapeLayer setPosition:](self->_debugViewRectLayer, "setPosition:", -v93 / v69, -v92 / v69);
      CATransform3DMakeScale(&v106, 1.0 / v69, 1.0 / v69, 1.0);
      debugViewRectLayer = self->_debugViewRectLayer;
      v105 = v106;
      -[CAShapeLayer setTransform:](debugViewRectLayer, "setTransform:", &v105);
      CGPathRelease(v78);
      -[CALayer setPosition:](self->_debugLayer, "setPosition:", v93, v92);
      -[CALayer setZPosition:](self->_debugLayer, "setZPosition:", 6000.0);
      CATransform3DMakeScale(&v104, v69, v69, 1.0);
      debugLayer = self->_debugLayer;
      v103 = v104;
      -[CALayer setTransform:](debugLayer, "setTransform:", &v103);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (void)_resetCropRect
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = -[NUCropModel aspectRatio](self->_cropModel, "aspectRatio");
  v5 = v4;
  -[NUCropModel reset](self->_cropModel, "reset");
  -[NUCropModel setAspectRatio:](self->_cropModel, "setAspectRatio:", v3, v5);
  v8.receiver = self;
  v8.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setPitchAngle:](&v8, sel_setPitchAngle_, 0.0);
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setYawAngle:](&v7, sel_setYawAngle_, 0.0);
  v6.receiver = self;
  v6.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setStraightenAngle:](&v6, sel_setStraightenAngle_, 0.0);
  -[PUCropGestureHandler reset](self->_gestureHandler, "reset");
}

- (void)setModelCropRect:(CGRect)a3 viewCropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  const char *v14;
  id v15;
  objc_super v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (self->_isDebugging)
  {
    NSStringFromCGRect(a3);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    NSStringFromCGRect(v17);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf(" setModelCropRect:%s viewCropRect:%s\n", v14, (const char *)objc_msgSend(v15, "UTF8String"));

  }
  -[NUCropModel setCropRect:](self->_cropModel, "setCropRect:", v11, v10, v9, v8);
  v16.receiver = self;
  v16.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setModelCropRect:viewCropRect:](&v16, sel_setModelCropRect_viewCropRect_, v11, v10, v9, v8, x, y, width, height);
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (void)setCanvasFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  self->_needsLayerTransformUpdate |= !CGRectEqualToRect(v9, v10);
  v8.receiver = self;
  v8.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setCanvasFrame:](&v8, sel_setCanvasFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCropPerspectiveView;
  -[PUCropPerspectiveView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_needsLayerTransformUpdate)
  {
    self->_needsLayerTransformUpdate = 0;
    -[PUCropPerspectiveView updateLayerTransformsAnimated:](self, "updateLayerTransformsAnimated:", self->_layerTransformUpdateAnimated);
  }
}

- (void)setPitchAngle:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[PUCropTransformedImageView pitchAngle](self, "pitchAngle");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setPitchAngle:](&v7, sel_setPitchAngle_, a3);
  if (v6 != a3
    && (!-[PUCropGestureHandler gesture](self->_gestureHandler, "gesture")
     || -[PUCropGestureHandler gesture](self->_gestureHandler, "gesture") == 1))
  {
    -[PUCropGestureHandler setPitchAngle:](self->_gestureHandler, "setPitchAngle:", a3);
  }
}

- (void)setYawAngle:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[PUCropTransformedImageView yawAngle](self, "yawAngle");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setYawAngle:](&v7, sel_setYawAngle_, a3);
  if (v6 != a3
    && (!-[PUCropGestureHandler gesture](self->_gestureHandler, "gesture")
     || -[PUCropGestureHandler gesture](self->_gestureHandler, "gesture") == 3))
  {
    -[PUCropGestureHandler setYawAngle:](self->_gestureHandler, "setYawAngle:", a3);
  }
}

- (void)setStraightenAngle:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[PUCropTransformedImageView straightenAngle](self, "straightenAngle");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setStraightenAngle:](&v7, sel_setStraightenAngle_, a3);
  if (v6 != a3
    && (!-[PUCropGestureHandler gesture](self->_gestureHandler, "gesture")
     || -[PUCropGestureHandler gesture](self->_gestureHandler, "gesture") == 2))
  {
    -[PUCropGestureHandler setRollAngle:](self->_gestureHandler, "setRollAngle:", a3);
  }
}

- (void)setNeedsLayerTransformsUpdateAnimated:(BOOL)a3
{
  self->_needsLayerTransformUpdate = 1;
  self->_layerTransformUpdateAnimated |= a3;
  -[PUCropPerspectiveView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setOrientation:(int64_t)a3
{
  int64_t v6;
  int64_t v7;
  PLImageGeometry *imageGeometry;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  if ((PLOrientationIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropPerspectiveView.m"), 459, CFSTR("Orientation must be valid"));

  }
  v6 = -[PUCropTransformedImageView orientation](self, "orientation");
  if (v6 != a3)
  {
    v7 = v6;
    v24.receiver = self;
    v24.super_class = (Class)PUCropPerspectiveView;
    -[PUCropTransformedImageView setOrientation:](&v24, sel_setOrientation_, a3);
    -[PLImageGeometry setAppliedOrientation:](self->_imageGeometry, "setAppliedOrientation:", a3);
    if ((a3 != 5 || v7 != 6) && (a3 != 6 || v7 != 5) && (a3 != 7 || v7 != 8) && (a3 != 8 || v7 != 7))
    {
      memset(&v23, 0, sizeof(v23));
      imageGeometry = self->_imageGeometry;
      if (imageGeometry)
        -[PLImageGeometry transformFromOrientation:](imageGeometry, "transformFromOrientation:", v7);
      else
        memset(&v23, 0, 32);
      *(_OWORD *)&v23.tx = 0uLL;
      -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
      v22 = v23;
      v26 = CGRectApplyAffineTransform(v25, &v22);
      v17 = PURectWithSizeThatFitsInRect(v26.size.width, v26.size.height, v10, v12, v14, v16);
      PURoundRectToPixel(v17, v18, v19, v20);
      -[NUCropModel cropRect](self->_cropModel, "cropRect");
      -[PUCropPerspectiveView setModelCropRect:viewCropRect:](self, "setModelCropRect:viewCropRect:");
    }
    -[PUCropPerspectiveView setNeedsLayerTransformsUpdateAnimated:](self, "setNeedsLayerTransformsUpdateAnimated:", 0);
  }
}

- (void)_setCropModel:(id)a3
{
  PUCropGestureHandler *v5;
  PUCropGestureHandler *gestureHandler;
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
  NUCropModel *v17;

  v17 = (NUCropModel *)a3;
  if (self->_cropModel != v17)
  {
    objc_storeStrong((id *)&self->_cropModel, a3);
    v5 = -[PUCropGestureHandler initWithCropModel:]([PUCropGestureHandler alloc], "initWithCropModel:", v17);
    gestureHandler = self->_gestureHandler;
    self->_gestureHandler = v5;

    -[PUCropGestureHandler setDelegate:](self->_gestureHandler, "setDelegate:", self);
    -[PUCropPerspectiveView masterImageSize](self, "masterImageSize");
    v8 = v7;
    v10 = v9;
    -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
    -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:", v11, v12);
    if (v13 < 1.0)
      v13 = 1.0;
    v15 = v8 / v13;
    if (v14 < 1.0)
      v14 = 1.0;
    v16 = v10 / v14;
    if (v15 >= v16)
      v15 = v16;
    -[PUCropGestureHandler setMaximumZoomScale:](self->_gestureHandler, "setMaximumZoomScale:", v15);
    if (self->_isDebugging)
      -[PUCropGestureHandler setLoggingEnabled:](self->_gestureHandler, "setLoggingEnabled:", 1);
  }

}

- (id)cropModel
{
  return self->_cropModel;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGImage *v16;
  CGColorSpace *ColorSpace;
  _BOOL4 v18;
  void *v19;
  double v20;
  double v21;
  PLImageGeometry *v22;
  PLImageGeometry *imageGeometry;
  objc_super v24;

  v4 = a3;
  -[PUCropTransformedImageView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)PUCropPerspectiveView;
    -[PUCropTransformedImageView setImage:](&v24, sel_setImage_, v4);
    v6 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[PUCropTransformedImageView _imageBounds](self, "_imageBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_retainAutorelease(v4);
    v16 = (CGImage *)objc_msgSend(v15, "CGImage");
    -[CALayer setContents:](self->_imageLayer, "setContents:", v16);
    -[CALayer setBounds:](self->_imageLayer, "setBounds:", v8, v10, v12, v14);
    ColorSpace = CGImageGetColorSpace(v16);
    v18 = CGColorSpaceUsesITUR_2100TF(ColorSpace);
    -[CALayer setWantsExtendedDynamicRangeContent:](self->_imageLayer, "setWantsExtendedDynamicRangeContent:", v18 | CGColorSpaceUsesExtendedRange(ColorSpace));
    v19 = (void *)MEMORY[0x1E0D717B0];
    objc_msgSend(v15, "size");
    objc_msgSend(v19, "geometryWithInputSize:initialOrientation:", -[PUCropTransformedImageView orientation](self, "orientation"), v20, v21);
    v22 = (PLImageGeometry *)objc_claimAutoreleasedReturnValue();
    imageGeometry = self->_imageGeometry;
    self->_imageGeometry = v22;

    -[PUCropPerspectiveView setNeedsLayerTransformsUpdateAnimated:](self, "setNeedsLayerTransformsUpdateAnimated:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v6);
    -[PUCropPerspectiveView _updateImageModulation](self, "_updateImageModulation");
  }

}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  PLImageGeometry *v7;
  PLImageGeometry *imageGeometry;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setImageSize:](&v9, sel_setImageSize_);
  v6 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PUCropTransformedImageView _imageBounds](self, "_imageBounds");
  -[CALayer setBounds:](self->_imageLayer, "setBounds:");
  objc_msgSend(MEMORY[0x1E0D717B0], "geometryWithInputSize:initialOrientation:", -[PUCropTransformedImageView orientation](self, "orientation"), width, height);
  v7 = (PLImageGeometry *)objc_claimAutoreleasedReturnValue();
  imageGeometry = self->_imageGeometry;
  self->_imageGeometry = v7;

  -[PUCropPerspectiveView setNeedsLayerTransformsUpdateAnimated:](self, "setNeedsLayerTransformsUpdateAnimated:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v6);
  -[PUCropPerspectiveView _updateImageModulation](self, "_updateImageModulation");
}

- (void)setAutoloopComposition:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCropPerspectiveView;
  v4 = a3;
  -[PUCropTransformedImageView setAutoloopComposition:](&v6, sel_setAutoloopComposition_, v4);
  -[PUCropPerspectiveView _setupMediaWithComposition:](self, "_setupMediaWithComposition:", v4, v6.receiver, v6.super_class);

  -[PUCropTransformedImageView videoMediaView](self, "videoMediaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoopsVideoPlayback:", 1);

}

- (void)setVideoComposition:(id)a3 withSeekTime:(id *)a4
{
  id v6;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCropPerspectiveView;
  v8 = *a4;
  v6 = a3;
  -[PUCropTransformedImageView setVideoComposition:withSeekTime:](&v9, sel_setVideoComposition_withSeekTime_, v6, &v8);
  -[PUCropPerspectiveView _setupMediaWithComposition:](self, "_setupMediaWithComposition:", v6, *(_OWORD *)&v8.var0, v8.var3);

  var3 = a4->var3;
  *(_OWORD *)&self->_cachedVideoSeekTime.value = *(_OWORD *)&a4->var0;
  self->_cachedVideoSeekTime.epoch = var3;
}

- (void)tearDownMediaViewAndLayers
{
  void *v3;
  void *v4;
  void *v5;
  CALayer *mediaLayer;

  -[PUCropGestureHandler tearDown](self->_gestureHandler, "tearDown");
  -[PUCropTransformedImageView videoMediaView](self, "videoMediaView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUCropTransformedImageView videoMediaView](self, "videoMediaView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_videoPlayerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dispose");

    -[PUCropTransformedImageView setVideoMediaView:](self, "setVideoMediaView:", 0);
    -[CALayer removeFromSuperlayer](self->_mediaLayer, "removeFromSuperlayer");
    mediaLayer = self->_mediaLayer;
    self->_mediaLayer = 0;

  }
}

- (void)_setupMediaWithComposition:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CALayer *v11;
  CALayer *mediaLayer;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUCropPerspectiveView tearDownMediaViewAndLayers](self, "tearDownMediaViewAndLayers");
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D523E0]);
    -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
    v6 = (void *)objc_msgSend(v5, "initWithFrame:");
    -[PUCropTransformedImageView setVideoMediaView:](self, "setVideoMediaView:", v6);
    objc_msgSend(v6, "_renderer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayType:", 2);

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[PUCropPerspectiveView addSubview:](self, "addSubview:", v6);
    objc_msgSend(v6, "setZoomScale:", 1.0);
    objc_msgSend(v6, "setVideoEnabled:animated:", 1, 0);
    objc_msgSend(MEMORY[0x1E0D71268], "preGeometryFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPipelineFilters:", v9);

    objc_msgSend(v6, "setComposition:", v4);
    objc_msgSend(v6, "setMuted:", self->_muted);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "_videoPlayerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer removeFromSuperlayer](self->_mediaLayer, "removeFromSuperlayer");
    objc_msgSend(v10, "layer");
    v11 = (CALayer *)objc_claimAutoreleasedReturnValue();
    mediaLayer = self->_mediaLayer;
    self->_mediaLayer = v11;

    -[CALayer addSublayer:](self->_mediaSuperlayer, "addSublayer:", self->_mediaLayer);
    -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
    objc_msgSend(v10, "setFrame:");
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[PUCropPerspectiveView setNeedsLayerTransformsUpdateAnimated:](self, "setNeedsLayerTransformsUpdateAnimated:", 0);

}

- (void)setShouldEnableImageModulation:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setShouldEnableImageModulation:](&v4, sel_setShouldEnableImageModulation_, a3);
  -[PUCropPerspectiveView _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
  -[PUCropPerspectiveView _updateImageModulation](self, "_updateImageModulation");
}

- (void)setImageModulationOptions:(id)a3
{
  uint64_t v3;
  int64_t var0;
  float v6;
  objc_super v7;

  v3 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  if (a3.var0 != -[PUCropTransformedImageView imageModulationOptions](self, "imageModulationOptions")
    || *(float *)&v3 != v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUCropPerspectiveView;
    -[PUCropTransformedImageView setImageModulationOptions:](&v7, sel_setImageModulationOptions_, var0, v3);
    -[PUCropPerspectiveView _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
    -[PUCropPerspectiveView _updateImageModulation](self, "_updateImageModulation");
  }
}

- (void)mediaViewDidFinishRendering:(id)a3
{
  id v4;
  unsigned int flags;
  int64_t epoch;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int v11;
  unsigned int v12;
  int64_t v13;
  int64_t value;
  int timescale;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  value = self->_cachedVideoSeekTime.value;
  flags = self->_cachedVideoSeekTime.flags;
  timescale = self->_cachedVideoSeekTime.timescale;
  if ((flags & 1) != 0)
  {
    epoch = self->_cachedVideoSeekTime.epoch;
    -[PUCropTransformedImageView videoMediaView](self, "videoMediaView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = value;
    v11 = timescale;
    v12 = flags;
    v13 = epoch;
    objc_msgSend(v8, "seekToTime:exact:", &v10, 1);

    v9 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_cachedVideoSeekTime.value = *MEMORY[0x1E0CA2E18];
    self->_cachedVideoSeekTime.epoch = *(_QWORD *)(v9 + 16);

  }
  if (objc_msgSend(v4, "loopsVideoPlayback"))
    objc_msgSend(v4, "_startVideoPlayback");
  -[PUCropPerspectiveView updateLayerTransformsAnimated:](self, "updateLayerTransformsAnimated:", 1);

}

- (CGSize)_sizeRotatedIfNeeded:(CGSize)a3
{
  double height;
  double width;
  int v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = -[PLImageGeometry isSizeInverted](self->_imageGeometry, "isSizeInverted");
  if (v5)
    v6 = height;
  else
    v6 = width;
  if (v5)
    v7 = width;
  else
    v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_invalidateImageModulationManager
{
  PXImageModulationManager *imageModulationManager;

  -[PUCropPerspectiveView _invalidateImageLayerModulator](self, "_invalidateImageLayerModulator");
  imageModulationManager = self->_imageModulationManager;
  self->_imageModulationManager = 0;

}

- (void)_invalidateImageLayerModulator
{
  PXImageLayerModulator *imageLayerModulator;
  PXImageModulationManager *imageModulationManager;
  PXImageLayerModulator *v5;
  PXImageLayerModulator *v6;

  imageLayerModulator = self->_imageLayerModulator;
  if (imageLayerModulator)
  {
    imageModulationManager = self->_imageModulationManager;
    v6 = imageLayerModulator;
    -[PXImageModulationManager checkInImageLayerModulator:](imageModulationManager, "checkInImageLayerModulator:", v6);
    v5 = self->_imageLayerModulator;
    self->_imageLayerModulator = 0;

  }
}

- (void)_updateImageModulation
{
  PUCropPerspectiveView *v2;
  PXImageModulationManager *v3;
  void *v4;
  PXImageLayerModulator *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v2 = self;
  if (-[PUCropTransformedImageView shouldEnableImageModulation](v2, "shouldEnableImageModulation"))
  {
    v3 = v2->_imageModulationManager;
    if (!v3)
    {
      -[PUCropPerspectiveView window](v2, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_imageModulationManager");
      v3 = (PXImageModulationManager *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v2->_imageModulationManager, v3);
    }
    v5 = v2->_imageLayerModulator;
    if (!v5)
    {
      v6 = -[PUCropTransformedImageView imageModulationOptions](v2, "imageModulationOptions");
      -[PXImageModulationManager checkoutImageLayerModulatorWithOptions:](v3, "checkoutImageLayerModulatorWithOptions:", v6, v7);
      v5 = (PXImageLayerModulator *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v2->_imageLayerModulator, v5);
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PUCropPerspectiveView__updateImageModulation__block_invoke;
    v8[3] = &unk_1E58A9E78;
    v8[4] = v2;
    -[PXImageLayerModulator performChanges:](v5, "performChanges:", v8);

  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  CGImage *gainMapImage;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
    -[PUCropPerspectiveView _updateImageModulation](self, "_updateImageModulation");
  }
}

- (CGRect)_fullCropRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[PUCropTransformedImageView _imageBounds](self, "_imageBounds");
  v4 = v3;
  v6 = v5;
  -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:", v4, v6);
  v17 = PURectWithSizeThatFitsInRect(v15, v16, v8, v10, v12, v14);
  v21 = PURoundRectToPixel(v17, v18, v19, v20);
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)_zoomScaleForModelCropRect:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;
  double v10;

  height = a3.size.height;
  width = a3.size.width;
  -[PUCropPerspectiveView masterImageSize](self, "masterImageSize", a3.origin.x, a3.origin.y);
  v7 = 1.0;
  if (width >= 1.0)
    v8 = width;
  else
    v8 = 1.0;
  result = v5 / v8;
  if (height >= 1.0)
    v7 = height;
  v10 = v6 / v7;
  if (result >= v10)
    return v10;
  return result;
}

- (double)_zoomScaleForCurrentCropRectAndModelRect
{
  double result;

  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  -[PUCropPerspectiveView _zoomScaleForModelCropRect:](self, "_zoomScaleForModelCropRect:");
  return result;
}

- (double)_viewScaleWithModelCropRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;

  -[PUCropPerspectiveView _zoomScaleForModelCropRect:](self, "_zoomScaleForModelCropRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[PUCropGestureHandler zoomOverflow](self->_gestureHandler, "zoomOverflow");
  return v5 + v6;
}

- (CGAffineTransform)_modelSpaceToViewSpaceTransformWithModelCropRect:(SEL)a3 currentViewCropRect:(CGRect)a4
{
  double width;
  double v6;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CGFloat v49;
  __int128 v50;
  __int128 v51;
  CGAffineTransform *result;
  __int128 v53;
  double v54;
  double y;
  CGFloat v56;
  CGFloat v57;
  double height;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGAffineTransform v65;
  CGAffineTransform v66;

  height = a5.size.height;
  width = a5.size.width;
  y = a4.origin.y;
  v6 = a4.size.height;
  v54 = a4.size.width;
  x = a4.origin.x;
  -[PUCropTransformedImageView _imageBounds](self, "_imageBounds");
  v11 = v10;
  v13 = v12;
  -[PUCropTransformedImageView _imageBounds](self, "_imageBounds");
  PLRectGetCenter();
  v59 = v15;
  v60 = v14;
  -[PUCropPerspectiveView masterImageSize](self, "masterImageSize");
  PLRectGetCenter();
  v63 = v16;
  v64 = v17;
  PLRectGetCenter();
  v61 = v18;
  v62 = v19;
  PLRectGetCenter();
  v56 = v21;
  v57 = v20;
  if (v11 >= 1.0)
    v22 = v11;
  else
    v22 = 1.0;
  v23 = width / v22;
  if (v13 >= 1.0)
    v24 = v13;
  else
    v24 = 1.0;
  v25 = height / v24;
  if (v23 >= v25)
    v26 = v23;
  else
    v26 = v25;
  -[PUCropPerspectiveView masterImageSize](self, "masterImageSize");
  if (v27 < 1.0)
    v27 = 1.0;
  v29 = v11 / v27;
  if (v28 < 1.0)
    v28 = 1.0;
  v30 = v13 / v28;
  if (v29 >= v30)
    v31 = v29;
  else
    v31 = v30;
  -[PUCropPerspectiveView _viewScaleWithModelCropRect:](self, "_viewScaleWithModelCropRect:", x, y, v54, v6);
  v33 = v32;
  v34 = MEMORY[0x1E0C9BAA8];
  v35 = *MEMORY[0x1E0C9BAA8];
  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v36;
  v37 = *(_OWORD *)(v34 + 32);
  *(_OWORD *)&retstr->tx = v37;
  *(_OWORD *)&v66.a = v35;
  *(_OWORD *)&v66.c = v36;
  *(_OWORD *)&v66.tx = v37;
  CGAffineTransformTranslate(retstr, &v66, v57, v56);
  v38 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v38;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v66, &v65, v33, v33);
  v39 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v39;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  v40 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v40;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v66, &v65, v26, v26);
  v41 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v41;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  v42 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v42;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v66, &v65, -v60, -v59);
  v43 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v43;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  v44 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v44;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v66, &v65, v31, v31);
  v45 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v45;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  v46 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v46;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v66, &v65, -(v61 - v63), v62 - v64);
  v47 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v47;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  -[PUCropPerspectiveView masterImageSize](self, "masterImageSize");
  v48 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v48;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v66, &v65, 0.0, v49);
  v50 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v50;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  v51 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v51;
  *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v66, &v65, 1.0, -1.0);
  v53 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v53;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  return result;
}

- (CGAffineTransform)imageOrientedViewCropTransform
{
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double MidY;
  CGAffineTransform *result;
  __int128 v13;
  __int128 v14;
  __int128 *p_t1;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
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
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[6];
  _QWORD v45[6];
  CGAffineTransform t1;
  _QWORD v47[6];
  CGAffineTransform t2;
  _QWORD v49[6];
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  v5 = MEMORY[0x1E0C9BAA8];
  v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v33 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v32;
  v31 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v31;
  -[PUCropTransformedImageView canvasFrame](self, "canvasFrame");
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  MidX = CGRectGetMidX(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  MidY = CGRectGetMidY(v52);
  result = -[PUCropTransformedImageView orientation](self, "orientation");
  switch((unint64_t)result)
  {
    case 2uLL:
      v13 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v13;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v45[0] = 0xBFF0000000000000;
      v45[1] = 0;
      v45[2] = 0;
      v45[3] = 0x3FF0000000000000;
      v45[4] = 0;
      v45[5] = 0;
      v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v14;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = (__int128 *)v45;
      goto LABEL_9;
    case 3uLL:
      v16 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v16;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v47[0] = 0xBFF0000000000000;
      v47[1] = 0;
      v47[2] = 0;
      v47[3] = 0xBFF0000000000000;
      v47[4] = 0;
      v47[5] = 0;
      v17 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v17;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = (__int128 *)v47;
      goto LABEL_9;
    case 4uLL:
      v18 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v18;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v44[0] = 0x3FF0000000000000;
      v44[1] = 0;
      v44[2] = 0;
      v44[3] = 0xBFF0000000000000;
      v44[4] = 0;
      v44[5] = 0;
      v19 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v19;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = (__int128 *)v44;
      goto LABEL_9;
    case 5uLL:
      v20 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v20;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v34 = xmmword_1AB0EF2E0;
      v35 = 0x3FF0000000000000;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v21 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v21;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = &v34;
      goto LABEL_9;
    case 6uLL:
      *(_OWORD *)&v50.a = v33;
      *(_OWORD *)&v50.c = v32;
      *(_OWORD *)&v50.tx = v31;
      v22 = width / height;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v49[0] = 0;
      *(double *)&v49[1] = -v22;
      *(double *)&v49[2] = v22;
      memset(&v49[3], 0, 24);
      v23 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v23;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = (__int128 *)v49;
      goto LABEL_9;
    case 7uLL:
      v24 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v24;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v39 = xmmword_1AB0EF2D0;
      v40 = 0xBFF0000000000000;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v25 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v25;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = &v39;
      goto LABEL_9;
    case 8uLL:
      v26 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v26;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      t1.a = 0.0;
      t1.b = width / height;
      t1.c = -(width / height);
      memset(&t1.d, 0, 24);
      v27 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v27;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      p_t1 = (__int128 *)&t1;
LABEL_9:
      CGAffineTransformConcat(&v50, (CGAffineTransform *)p_t1, &t2);
      v28 = *(_OWORD *)&v50.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v50.a;
      *(_OWORD *)&retstr->c = v28;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v50.tx;
      v29 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v29;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      result = CGAffineTransformTranslate(&v50, &t2, -MidX, -MidY);
      v30 = *(_OWORD *)&v50.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v50.a;
      *(_OWORD *)&retstr->c = v30;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v50.tx;
      break;
    default:
      return result;
  }
  return result;
}

- (CGRect)viewOrientedViewCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v9, 0, sizeof(v9));
  -[PUCropPerspectiveView imageOrientedViewCropTransform](self, "imageOrientedViewCropTransform");
  CGAffineTransformInvert(&v9, &v8);
  v7 = v9;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return CGRectApplyAffineTransform(v10, &v7);
}

- (CGRect)imageOrientedViewCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7[2];
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v7[1], 0, sizeof(CGAffineTransform));
  -[PUCropPerspectiveView imageOrientedViewCropTransform](self, "imageOrientedViewCropTransform");
  v7[0] = v7[1];
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, v7);
}

- (CGRect)viewCropRectForImageRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MinY = CGRectGetMinY(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MaxX = CGRectGetMaxX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxY = CGRectGetMaxY(v18);
  -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
  -[PUCropPerspectiveView imageOrientedViewCropRect:](self, "imageOrientedViewCropRect:");
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  -[PUCropPerspectiveView _modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:](self, "_modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:");
  -[PUCropPerspectiveView viewOrientedViewCropRect:](self, "viewOrientedViewCropRect:", MinY * 0.0 + 0.0 * MinX + 0.0, MaxY * 0.0 + 0.0 * MaxX + 0.0, MaxY * 0.0 + 0.0 * MaxX + 0.0 - (MinY * 0.0 + 0.0 * MinX + 0.0), MinY * 0.0 + 0.0 * MinX + 0.0 - (MaxY * 0.0 + 0.0 * MaxX + 0.0));
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)imageCropRectForViewRect:(CGRect)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxY;
  double MaxX;
  double MinY;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[PUCropPerspectiveView imageOrientedViewCropRect:](self, "imageOrientedViewCropRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MinX = CGRectGetMinX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxY = CGRectGetMaxY(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MaxX = CGRectGetMaxX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinY = CGRectGetMinY(v21);
  -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
  -[PUCropPerspectiveView imageOrientedViewCropRect:](self, "imageOrientedViewCropRect:");
  memset(&v17, 0, sizeof(v17));
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  -[PUCropPerspectiveView _modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:](self, "_modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:");
  CGAffineTransformInvert(&v17, &v16);
  v12 = v17.tx + MaxY * v17.c + v17.a * MinX;
  v13 = v17.ty + MaxY * v17.d + v17.b * MinX;
  v14 = v17.tx + MinY * v17.c + v17.a * MaxX - v12;
  v15 = v17.ty + MinY * v17.d + v17.b * MaxX - v13;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)imagePointForViewPoint:(CGPoint)a3
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
  float64x2_t v16;
  double v17;
  double y;
  double x;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  memset(&v21, 0, sizeof(v21));
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
  -[PUCropPerspectiveView _modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:](self, "_modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:", v5, v7, v9, v11, v12, v13, v14, v15);
  CGAffineTransformInvert(&v21, &v20);
  v16 = vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, y), *(float64x2_t *)&v21.a, x));
  v17 = v16.f64[1];
  result.x = v16.f64[0];
  result.y = v17;
  return result;
}

- (CGRect)validateViewCropRectAgainstModelCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
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
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
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
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect result;
  CGRect v76;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_isDebugging)
  {
    NSStringFromCGRect(a3);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    -[PUCropTransformedImageView orientation](self, "orientation");
    PLOrientationName();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    -[NUCropModel cropRect](self->_cropModel, "cropRect");
    NSStringFromCGRect(v69);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
    NSStringFromCGRect(v70);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf(" validateViewCropRectAgainstModelCropRect: %s\n  - orientation = %s\n  - imageRect = %s\n  - croppingRect = %s\n", v9, v11, v13, (const char *)objc_msgSend(v14, "UTF8String"));

  }
  -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  v76 = CGRectInset(v71, 0.25, 0.25);
  v72.origin.x = v16;
  v72.origin.y = v18;
  v72.size.width = v20;
  v72.size.height = v22;
  if (!CGRectContainsRect(v72, v76))
  {
    -[NUCropModel cropRect](self->_cropModel, "cropRect");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[PUCropPerspectiveView imageCropRectForViewRect:](self, "imageCropRectForViewRect:", x, y, width, height);
    v67 = v32;
    v68 = v31;
    v65 = v34;
    v66 = v33;
    if ((-[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:") & 1) == 0)
    {
      v57 = v26;
      v58 = v24;
      v73.origin.x = v24;
      v73.origin.y = v26;
      v55 = v30;
      v56 = v28;
      v73.size.width = v28;
      v73.size.height = v30;
      v74 = CGRectInset(v73, 0.1, 0.1);
      v61 = v74.origin.y;
      v62 = v74.origin.x;
      v59 = v74.size.height;
      v60 = v74.size.width;
      v35 = 0.0;
      v36 = 1;
      v37 = 1.0;
      v38 = 1.0;
      v39 = 0.0;
      while (1)
      {
        v40 = (v39 + v38) * 0.5;
        v41 = (v36 & 1) != 0 ? (v39 + v38) * 0.5 : v39;
        v42 = v37;
        v43 = (v35 + v37) * 0.5;
        v44 = (v36 & 1) != 0 ? v35 : (v35 + v37) * 0.5;
        v45 = v66 * v41 + (1.0 - v41) * v60;
        v46 = v65 * v44 + (1.0 - v44) * v59;
        v63 = v67 * v44 + (1.0 - v44) * v61;
        v64 = v68 * v41 + (1.0 - v41) * v62;
        if (-[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:", v64))break;
        if ((v36 & 1) != 0)
        {
          v38 = v40 * 0.1 + v38 * 0.9;
LABEL_18:
          v37 = v42;
          goto LABEL_20;
        }
        v37 = v43 * 0.1 + v42 * 0.9;
LABEL_20:
        v36 ^= 1u;
        if (v38 - v39 < 0.000000953674316 && v37 - v35 < 0.000000953674316)
        {
          if (v38 < 0.000000953674316 && v37 < 0.000000953674316)
          {
            v45 = v56;
            v63 = v57;
            v64 = v58;
            v46 = v55;
          }
          if (self->_isDebugging)
            printf("  - mixX = (%f, %f)\n  - mixY = (%f, %f)\n", v39, v38, v35, v37);
          -[PUCropPerspectiveView viewCropRectForImageRect:](self, "viewCropRectForImageRect:", v64, v63, v45, v46);
          x = v47;
          y = v48;
          width = v49;
          height = v50;
          goto LABEL_28;
        }
      }
      if ((v36 & 1) != 0)
        v39 = v40 * 0.1 + v39 * 0.9;
      else
        v35 = v43 * 0.1 + v35 * 0.9;
      goto LABEL_18;
    }
  }
LABEL_28:
  v51 = x;
  v52 = y;
  v53 = width;
  v54 = height;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (void)setImageCropRectFromViewCropRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t *v19;
  os_log_t *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  const char *v49;
  double MidX;
  double MidY;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  id v58;
  const char *v59;
  id v60;
  const char *v61;
  id v62;
  const char *v63;
  id v64;
  NSObject *v66;
  os_log_t v67;
  void *specific;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  os_log_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  id v84;
  _BYTE v85[32];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v90 = *MEMORY[0x1E0C80C00];
  -[PUCropPerspectiveView imageCropRectForViewRect:](self, "imageCropRectForViewRect:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = v10;
  if (v15 <= 1.0 || v10 <= 1.0)
  {
    v19 = (uint64_t *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_24834);
    v20 = (os_log_t *)MEMORY[0x1E0D52380];
    v21 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = v21;
      objc_msgSend(v22, "stringWithFormat:", CFSTR("invalid imageRect"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v87 = v24;
      _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v25 = *v19;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v25 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_24834);
        goto LABEL_36;
      }
      if (v25 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_24834);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
LABEL_36:
      v67 = *v20;
      if (!os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
        goto LABEL_41;
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v69 = (void *)MEMORY[0x1E0CB3978];
      v70 = specific;
      v71 = v67;
      objc_msgSend(v69, "callStackSymbols");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "componentsJoinedByString:", CFSTR("\n"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = specific;
      v88 = 2114;
      v89 = v73;
      _os_log_error_impl(&dword_1AAB61000, v71, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_46;
    }
    v74 = *v20;
    if (!os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    v77 = (void *)MEMORY[0x1E0CB3978];
    v71 = v74;
    objc_msgSend(v77, "callStackSymbols");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "componentsJoinedByString:", CFSTR("\n"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v87 = v79;
    _os_log_error_impl(&dword_1AAB61000, v71, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_46:
LABEL_41:
    _NUAssertContinueHandler();
    PLPhotoEditGetLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.width = width;
      v95.size.height = height;
      NSStringFromCGRect(v95);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v96.origin.x = v12;
      v96.origin.y = v14;
      v96.size.width = v16;
      v96.size.height = v17;
      NSStringFromCGRect(v96);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v87 = v75;
      v88 = 2112;
      v89 = v76;
      _os_log_impl(&dword_1AAB61000, v66, OS_LOG_TYPE_INFO, "imageRect is near zero size. \nviewCropRect: %@ imageRect: %@", buf, 0x16u);

    }
LABEL_43:

    return;
  }
  *(CGFloat *)v85 = x;
  *(CGFloat *)&v85[8] = y;
  *(CGFloat *)&v85[16] = width;
  *(CGFloat *)&v85[24] = height;
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v30 = PURoundRectToPixel(v26, v27, v28, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = PURoundRectToPixel(v12, v14, v16, v17);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = v30;
  v45 = v32;
  v46 = v34;
  v47 = v36;
  if (!CGRectEqualToRect(*(CGRect *)&v44, *(CGRect *)&v37))
  {
    v48 = -[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:", v12, v14, v16, v17, 0.000000953674316);
    v49 = "YES";
    if ((v48 & 1) == 0)
    {
      v91.origin.x = v12;
      v91.origin.y = v14;
      v91.size.width = v16;
      v91.size.height = v17;
      MidX = CGRectGetMidX(v91);
      v92.origin.x = v12;
      v92.origin.y = v14;
      v92.size.width = v16;
      v92.size.height = v17;
      MidY = CGRectGetMidY(v92);
      v52 = 1.0;
      v53 = 0.0;
      do
      {
        if (-[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:", MidX - v16 * ((v52 + v53) * 0.5) * 0.5, MidY - v17 * ((v52 + v53) * 0.5) * 0.5, v16 * ((v52 + v53) * 0.5), v17 * ((v52 + v53) * 0.5), 0.000000953674316))v53 = (v52 + v53) * 0.5;
        else
          v52 = (v52 + v53) * 0.5;
      }
      while (v52 - v53 >= 0.0000152587891);
      v54 = (v52 + v53) * 0.5;
      v16 = v16 * v54;
      v17 = v17 * v54;
      v12 = MidX - v16 * 0.5;
      v14 = MidY - v17 * 0.5;
      v49 = "NO";
    }
    if (self->_isDebugging)
    {
      v83 = v49;
      NSStringFromCGRect(*(CGRect *)v85);
      v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v55 = objc_msgSend(v84, "UTF8String");
      if (v4)
        v56 = "YES";
      else
        v56 = "NO";
      v81 = v56;
      v82 = (const char *)v55;
      if (-[PUCropTransformedImageView isTracking](self, "isTracking"))
        v57 = "YES";
      else
        v57 = "NO";
      v80 = v57;
      -[PUCropTransformedImageView orientation](self, "orientation");
      PLOrientationName();
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v59 = (const char *)objc_msgSend(v58, "UTF8String");
      v93.origin.x = v12;
      v93.origin.y = v14;
      v93.size.width = v16;
      v93.size.height = v17;
      NSStringFromCGRect(v93);
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v61 = (const char *)objc_msgSend(v60, "UTF8String");
      -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
      NSStringFromCGRect(v94);
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v63 = (const char *)objc_msgSend(v62, "UTF8String");
      NSStringFromCGRect(*(CGRect *)v85);
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf(" setImageCropRectFromViewCropRect: %s animated: %s\n  - isTracking = %s\n  - orientation = %s\n  - imageRect = %s\n  - croppingRect = %s\n  - cropRect = %s\n  - contained = %s\n", v82, v81, v80, v59, v61, v63, (const char *)objc_msgSend(v64, "UTF8String"), v83);

    }
    if (v16 > 1.0 && v17 > 1.0)
    {
      -[PUCropPerspectiveView updateLayerTransformsAnimated:viewCropRect:modelCropRect:](self, "updateLayerTransformsAnimated:viewCropRect:modelCropRect:", v4, *(double *)v85, *(double *)&v85[8], *(double *)&v85[16], *(double *)&v85[24], v12, v14, v16, v17);
      -[NUCropModel makeCurrentAspectRatioFreeForm](self->_cropModel, "makeCurrentAspectRatioFreeForm");
      -[NUCropModel setCropRect:](self->_cropModel, "setCropRect:", v12, v14, v16, v17);
      -[NUCropModel makeCurrentFreeFormAspectFixed](self->_cropModel, "makeCurrentFreeFormAspectFixed");
      return;
    }
    PLUIGetLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v66, OS_LOG_TYPE_FAULT, "imageRect ended up empty", buf, 2u);
    }
    goto LABEL_43;
  }
}

- (CGRect)_croppingRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  -[PUCropTransformedImageView cropRect](self, "cropRect");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  if (CGRectIsEmpty(v15))
  {
    -[PUCropPerspectiveView _fullCropRect](self, "_fullCropRect");
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  v11 = PURoundRectToPixel(x, y, width, height);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_modelCropRectUnorientedInUICoords
{
  double v3;
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
  CGRect result;

  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUCropTransformedImageView _imageBounds](self, "_imageBounds");
  v12 = v11 - v10 - v6;
  v13 = v4;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (void)willBeginTrackingWithCropGestureHandler:(id)a3
{
  -[PUCropTransformedImageView _setTracking:](self, "_setTracking:", 1);
}

- (void)didBeginTrackingWithCropGestureHandler:(id)a3
{
  -[PUCropTransformedImageView _setTracking:](self, "_setTracking:", 1);
}

- (void)didTrackWithCropGestureHandler:(id)a3
{
  id v4;

  -[PUCropTransformedImageView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropPerspectiveView updateLayerTransformsAnimated:](self, "updateLayerTransformsAnimated:", 0);
  -[PUCropTransformedImageView _setTracking:](self, "_setTracking:", 1);
  objc_msgSend(v4, "cropTransformedImageViewDidTrack:", self);

}

- (void)didEndTrackingWithCropGestureHandler:(id)a3
{
  -[PUCropTransformedImageView _setTracking:](self, "_setTracking:", 0);
}

- (void)didChangeIsPerformingLiveInteraction:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PUCropTransformedImageView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cropTransformedImageView:didChangeIsPerformingLiveInteraction:", self, v3);

}

- (void)handlePanGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  PUCropPerspectiveView *v42;
  uint64_t v43;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v46;
  CATransform3D v47;

  v4 = a3;
  objc_msgSend(v4, "translationInView:", self);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "velocityInView:", self);
  v10 = v9;
  v12 = v11;
  if (self->_isDebugging)
    printf(" handlePanGesture:%.1f, %.1f\n", v6, v8);
  v13 = objc_msgSend(v4, "state");
  -[PUCropPerspectiveView _croppingRect](self, "_croppingRect");
  v15 = v14;
  v17 = v16;
  -[PUCropTransformedImageView imageSize](self, "imageSize");
  -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:");
  if (v18 < 1.0)
    v18 = 1.0;
  v20 = v15 / v18;
  if (v19 < 1.0)
    v19 = 1.0;
  v21 = v17 / v19;
  if (v20 >= v21)
    v22 = v20;
  else
    v22 = v21;
  -[PUCropTransformedImageView imageSize](self, "imageSize");
  v24 = v23;
  v26 = v25;
  -[PUCropPerspectiveView masterImageSize](self, "masterImageSize");
  if (v27 < 1.0)
    v27 = 1.0;
  v29 = v24 / v27;
  if (v28 < 1.0)
    v28 = 1.0;
  v30 = v26 / v28;
  if (v29 >= v30)
    v31 = v29;
  else
    v31 = v30;
  -[NUCropModel cropRect](self->_cropModel, "cropRect");
  -[PUCropPerspectiveView _viewScaleWithModelCropRect:](self, "_viewScaleWithModelCropRect:");
  v32 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v47.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v47.m33 = v32;
  v33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v47.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v47.m43 = v33;
  v34 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v47.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v47.m13 = v34;
  v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v47.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v47.m23 = v35;
  *(_OWORD *)&v46.m31 = *(_OWORD *)&v47.m31;
  *(_OWORD *)&v46.m33 = v32;
  *(_OWORD *)&v46.m41 = *(_OWORD *)&v47.m41;
  *(_OWORD *)&v46.m43 = v33;
  *(_OWORD *)&v46.m11 = *(_OWORD *)&v47.m11;
  *(_OWORD *)&v46.m13 = v34;
  *(_OWORD *)&v46.m21 = *(_OWORD *)&v47.m21;
  *(_OWORD *)&v46.m23 = v35;
  CATransform3DScale(&v47, &v46, v36, v36, 1.0);
  -[PUCropPerspectiveView _imageOrientationTransform](self, "_imageOrientationTransform");
  b = v47;
  CATransform3DConcat(&v46, &a, &b);
  v47 = v46;
  b = v46;
  CATransform3DScale(&v46, &b, v22, v22, 1.0);
  v47 = v46;
  b = v46;
  CATransform3DScale(&v46, &b, v31, v31, 1.0);
  v47 = v46;
  memset(&v46, 0, sizeof(v46));
  b = v47;
  CATransform3DInvert(&v46, &b);
  v37 = -(v8 * v46.m21) - v6 * v46.m11;
  v38 = v8 * v46.m22 + v6 * v46.m12;
  v39 = -(v12 * v46.m21) - v10 * v46.m11;
  v40 = v12 * v46.m22 + v10 * v46.m12;
  if ((unint64_t)(v13 - 3) < 3)
  {
    -[PUCropTransformedImageView delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cropTransformedImageViewWillEndTracking:", self);

    -[PUCropGestureHandler endPanWithTranslation:velocity:](self->_gestureHandler, "endPanWithTranslation:velocity:", v37, v38, v39, v40);
    v42 = self;
    v43 = 0;
LABEL_22:
    -[PUCropPerspectiveView didChangeIsPerformingLiveInteraction:](v42, "didChangeIsPerformingLiveInteraction:", v43);
    goto LABEL_24;
  }
  if (v13 == 2)
  {
    -[PUCropGestureHandler panWithTranslation:velocity:](self->_gestureHandler, "panWithTranslation:velocity:", v37, v38, -(v12 * v46.m21) - v10 * v46.m11, v12 * v46.m22 + v10 * v46.m12);
    goto LABEL_24;
  }
  if (v13 == 1)
  {
    -[PUCropGestureHandler beginPan](self->_gestureHandler, "beginPan");
    v42 = self;
    v43 = 1;
    goto LABEL_22;
  }
LABEL_24:

}

- (void)handlePinchGesture:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_isDebugging)
  {
    objc_msgSend(v4, "scale");
    printf(" handlePinchGesture:%.2f\n", v5);
    v4 = v10;
  }
  v6 = objc_msgSend(v4, "state");
  objc_msgSend(v10, "scale");
  v8 = v7;
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 == 2)
    {
      -[PUCropGestureHandler zoomWithScale:](self->_gestureHandler, "zoomWithScale:", v7);
    }
    else if (v6 == 1)
    {
      -[PUCropPerspectiveView didChangeIsPerformingLiveInteraction:](self, "didChangeIsPerformingLiveInteraction:", 1);
      -[PUCropGestureHandler beginZoom](self->_gestureHandler, "beginZoom");
    }
  }
  else
  {
    -[PUCropTransformedImageView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cropTransformedImageViewWillEndTracking:", self);

    -[PUCropGestureHandler endZoomWithScale:](self->_gestureHandler, "endZoomWithScale:", v8);
    -[PUCropPerspectiveView didChangeIsPerformingLiveInteraction:](self, "didChangeIsPerformingLiveInteraction:", 0);
  }

}

- (CGRect)imageCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageCropRect.origin.x;
  y = self->_imageCropRect.origin.y;
  width = self->_imageCropRect.size.width;
  height = self->_imageCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (void)setGainMapValue:(float)a3
{
  self->_gainMapValue = a3;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_currentAnimation, 0);
  objc_storeStrong((id *)&self->_cropModel, 0);
  objc_storeStrong((id *)&self->_debugQuadLayer, 0);
  objc_storeStrong((id *)&self->_debugCropRectLayer, 0);
  objc_storeStrong((id *)&self->_debugViewRectLayer, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_mediaLayer, 0);
  objc_storeStrong((id *)&self->_mediaSuperlayer, 0);
  objc_storeStrong((id *)&self->_gestureHandler, 0);
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_storeStrong((id *)&self->_imageModulationManager, 0);
  objc_storeStrong((id *)&self->_imageGeometry, 0);
}

void __47__PUCropPerspectiveView__updateImageModulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 824);
  v4 = a2;
  objc_msgSend(v4, "setLayer:", v3);
  objc_msgSend(v4, "setGainMapImage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 816));
  objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
  objc_msgSend(v4, "setGainMapValue:");
  objc_msgSend(v4, "setDisplayingOpaqueContent:", 0);

}

uint64_t __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke(uint64_t a1, double a2)
{
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v51;
  double v52;
  double v53;
  CATransform3D v54;
  CATransform3D v55[2];
  CATransform3D v56;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v59;
  CATransform3D v60;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(double *)(v4 + 720);
  objc_msgSend(*(id *)(v4 + 704), "pitchRadians");
  v51 = v5 + a2 * (v6 - v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(double *)(v7 + 728);
  objc_msgSend(*(id *)(v7 + 704), "yawRadians");
  v10 = v8 + a2 * (v9 - v8);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(double *)(v11 + 736);
  objc_msgSend(*(id *)(v11 + 704), "rollRadians");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v12 + a2 * (v13 - v12);
  v16 = *(double *)(v14 + 744) + a2 * (*(double *)(a1 + 40) - *(double *)(v14 + 744));
  v17 = *(double *)(v14 + 752);
  objc_msgSend(*(id *)(v14 + 640), "panRubberBandOffset");
  v19 = v17 + a2 * (v18 - v17);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(double *)(v20 + 760);
  objc_msgSend(*(id *)(v20 + 640), "panRubberBandOffset");
  v23 = v21 + a2 * (v22 - v21);
  v24 = *(double **)(a1 + 32);
  v25 = v24[96] + a2 * (*(double *)(a1 + 48) - v24[96]);
  v26 = v24[97] + a2 * (*(double *)(a1 + 56) - v24[97]);
  v52 = v24[99] + a2 * (*(double *)(a1 + 72) - v24[99]);
  v53 = v24[98] + a2 * (*(double *)(a1 + 64) - v24[98]);
  v27 = v24[100] + a2 * (*(double *)(a1 + 80) - v24[100]);
  v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v60.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v60.m33 = v28;
  v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v60.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v60.m43 = v29;
  v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v60.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v60.m13 = v30;
  v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v60.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v60.m23 = v31;
  *(_OWORD *)&v59.m31 = *(_OWORD *)&v60.m31;
  *(_OWORD *)&v59.m33 = v28;
  *(_OWORD *)&v59.m41 = *(_OWORD *)&v60.m41;
  *(_OWORD *)&v59.m43 = v29;
  *(_OWORD *)&v59.m11 = *(_OWORD *)&v60.m11;
  *(_OWORD *)&v59.m13 = v30;
  *(_OWORD *)&v59.m21 = *(_OWORD *)&v60.m21;
  *(_OWORD *)&v59.m23 = v31;
  CATransform3DScale(&v60, &v59, v16, v16, 1.0);
  v32 = *(void **)(a1 + 32);
  if (v32)
    objc_msgSend(v32, "_imageOrientationTransformWithoutTranslation");
  else
    memset(&a, 0, sizeof(a));
  b = v60;
  CATransform3DConcat(&v59, &a, &b);
  v60 = v59;
  b = v59;
  CATransform3DScale(&v59, &b, v27, v27, 1.0);
  v60 = v59;
  v33 = *(double *)(a1 + 88);
  b = v59;
  CATransform3DScale(&v59, &b, v33, v33, 1.0);
  v60 = v59;
  v34 = *(double *)(a1 + 112);
  v35 = v34 * (-(v25 - *(double *)(a1 + 96)) - v19);
  v36 = v34 * (v23 + v26 - *(double *)(a1 + 104));
  b = v59;
  CATransform3DTranslate(&v59, &b, v35, v36, 0.0);
  v60 = v59;
  b = v59;
  CATransform3DScale(&v59, &b, 1.0, -1.0, 1.0);
  v60 = v59;
  v37 = -*(double *)(a1 + 120);
  v38 = -*(double *)(a1 + 128);
  b = v59;
  CATransform3DTranslate(&v59, &b, v37, v38, 0.0);
  v60 = v59;
  v39 = (void *)MEMORY[0x1E0D52080];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "masterImageRect");
  objc_msgSend(v39, "_imageTransformFromPitch:yaw:roll:imageRect:", v51, v10, v15, v40, v41, v42, v43);
  v56 = v55[1];
  b = v60;
  CATransform3DConcat(&v59, &v56, &b);
  v60 = v59;
  v44 = *(double *)(a1 + 120);
  v45 = *(double *)(a1 + 128);
  b = v59;
  CATransform3DTranslate(&v59, &b, v44, v45, 0.0);
  v60 = v59;
  b = v59;
  CATransform3DScale(&v59, &b, 1.0, -1.0, 1.0);
  v60 = v59;
  v46 = 1.0 / *(double *)(a1 + 88);
  b = v59;
  CATransform3DScale(&v59, &b, v46, v46, 1.0);
  v60 = v59;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v47 = *(void **)(*(_QWORD *)(a1 + 32) + 824);
  v55[0] = v60;
  objc_msgSend(v47, "setTransform:", v55);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "setPosition:", v53, v52);
  v48 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v48 + 664))
  {
    objc_msgSend(*(id *)(v48 + 824), "bounds");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setBounds:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v48 = *(_QWORD *)(a1 + 32);
  }
  v49 = *(void **)(v48 + 656);
  v54 = v60;
  objc_msgSend(v49, "setTransform:", &v54);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "setPosition:", v53, v52);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

double __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "pitchRadians");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 720) = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "yawRadians");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 728) = v3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "rollRadians");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736) = v4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744) = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (_QWORD *)(v5 + 752);
  objc_msgSend(*(id *)(v5 + 640), "panRubberBandOffset");
  *v6 = v7;
  v6[1] = v8;
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 768) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 784) = *(_OWORD *)(a1 + 64);
  result = *(double *)(a1 + 80);
  *(double *)(*(_QWORD *)(a1 + 32) + 800) = result;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 652) = 0;
  return result;
}

uint64_t __55__PUCropPerspectiveView_updateLayerTransformsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
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

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(v2, "_croppingRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "cropRect");
  return objc_msgSend(v2, "updateLayerTransformsAnimated:viewCropRect:modelCropRect:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
}

uint64_t __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke(uint64_t a1, double a2, double a3)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
}

uint64_t __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
