@implementation _DUIPreview

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultPreviewWithFrame:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBounds:outline:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.size.width, a3.size.height);
}

- (_DUIPreview)init
{
  void *v3;
  _DUIPreview *v4;

  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DUIPreview initWithBounds:outline:](self, "initWithBounds:outline:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v4;
}

- (_DUIPreview)initWithBounds:(CGRect)a3 outline:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  _DUIPreview *v8;
  uint64_t v9;
  UIColor *backgroundColor;
  UIBezierPath *v11;
  double v12;
  double v13;
  double v16;
  double v17;
  UIBezierPath *outline;
  uint64_t v24;
  __int128 v25;
  _DUIPreview *v26;
  CGAffineTransform v28;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_DUIPreview;
  v8 = -[_DUIPreview init](&v29, sel_init);
  if (v8)
  {
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (UIColor *)v9;

    v8->_contentSize.width = width;
    v8->_contentSize.height = height;
    v8->_contentSize.depth = 0.0;
    v8->_hidesSourceView = 1;
    v11 = (UIBezierPath *)objc_msgSend(v7, "copy");
    -[UIBezierPath bounds](v11, "bounds");
    if (v11)
    {
      v16 = v12;
      v17 = v13;
      if (!CGRectIsNull(*(CGRect *)&v12))
      {
        v8->_contentOffset.x = -v16;
        v8->_contentOffset.y = -v17;
        CGAffineTransformMakeTranslation(&v28, -v16, -v17);
        -[UIBezierPath applyTransform:](v11, "applyTransform:", &v28);
      }
    }
    __asm { FMOV            V0.2D, #1.0 }
    v8->_viewScaleFactor = _Q0;
    outline = v8->_outline;
    v8->_outline = v11;

    v24 = MEMORY[0x1E0C9BAA8];
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v8->_overrideStackTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v8->_overrideStackTransform.c = v25;
    *(_OWORD *)&v8->_overrideStackTransform.tx = *(_OWORD *)(v24 + 32);
    v8->_initialBadgeLocation = (CGPoint)_UICGPointNull;
    v8->_preferredStackOrder = -1;
    v26 = v8;
  }

  return v8;
}

- (_DUIPreview)initWithView:(id)a3 container:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _DUIPreview *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "frame");
  v15 = -[_DUIPreview initWithView:container:parameters:center:](self, "initWithView:container:parameters:center:", v10, v9, v8, v12 + v11 * 0.5, v14 + v13 * 0.5);

  return v15;
}

- (_DUIPreview)initWithView:(id)a3 container:(id)a4 parameters:(id)a5 center:(CGPoint)a6
{
  return (_DUIPreview *)-[_DUIPreview _initWithView:container:parameters:platformCenter:](self, "_initWithView:container:parameters:platformCenter:", a3, a4, a5, a6.x, a6.y, 0.0);
}

- (id)_initWithView:(id)a3 container:(id)a4 parameters:(id)a5 platformCenter:(CAPoint3D)a6
{
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  id v29;
  void *v30;
  long double a;
  long double b;
  long double c;
  long double d;
  long double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat Height;
  CGPoint *v42;
  double v43;
  double v44;
  double v45;
  _DUIPreview *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  UIColor *backgroundColor;
  uint64_t v54;
  _UIDragPreviewShadowProperties *shadowProperties;
  double RotationAngleFromViewToView;
  long double v57;
  long double v58;
  void *v59;
  id v60;
  double v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  _DUITargetLayerDescriptor *v71;
  _DUITargetLayerDescriptor *coordinateSpaceSourceLayerContext;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _DUIPreview *v80;
  void *v82;
  void *v83;
  id v84;
  double v85;
  void *v86;
  CGFloat sya;
  void *sy;
  CGAffineTransform t2;
  CGAffineTransform v90;
  CGAffineTransform t1;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  y = a6.y;
  x = a6.x;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (v12)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DUIPreview.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DUIPreview.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters != nil"));

LABEL_3:
  objc_msgSend(v15, "visiblePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  self->_hasCustomOutline = v17 != 0;
  objc_msgSend(v12, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDragAndDropGetPlatformMetrics(objc_msgSend(v18, "userInterfaceIdiom"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v19, "defaultPreviewOutlineProvider");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v20)[2](v20, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v86 = v19;
  objc_msgSend(v12, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = v12;
  v30 = v29;
  v85 = y;
  if (v12)
  {
    objc_msgSend(v29, "transform");
    a = v93.a;
    b = v93.b;
    c = v93.c;
    d = v93.d;
  }
  else
  {
    memset(&v93, 0, sizeof(v93));
    d = 0.0;
    b = 0.0;
    c = 0.0;
    a = 0.0;
  }
  v35 = hypot(a, c);
  v36 = hypot(b, d);
  objc_msgSend(v30, "superview");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = DUIPreviewConvertSizeFromViewToView(v37, 0, v35, v36);
  sya = v39;

  memset(&v93, 0, sizeof(v93));
  v94.origin.x = v22;
  v94.origin.y = v24;
  v94.size.width = v26;
  v94.size.height = v28;
  v40 = CGRectGetWidth(v94) * 0.5;
  v95.origin.x = v22;
  v95.origin.y = v24;
  v95.size.width = v26;
  v95.size.height = v28;
  Height = CGRectGetHeight(v95);
  CGAffineTransformMakeTranslation(&v93, v40, Height * 0.5);
  memset(&v92, 0, sizeof(v92));
  v90 = v93;
  CGAffineTransformScale(&t1, &v90, v38, sya);
  v90 = v93;
  CGAffineTransformInvert(&t2, &v90);
  CGAffineTransformConcat(&v92, &t1, &t2);
  v90 = v92;
  objc_msgSend(v17, "applyTransform:", &v90);
  v42 = (CGPoint *)MEMORY[0x1E0C9D538];
  v43 = *MEMORY[0x1E0C9D538];
  v44 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v96.origin.x = v22;
  v96.origin.y = v24;
  v96.size.width = v26;
  v96.size.height = v28;
  v45 = v38 * CGRectGetWidth(v96);
  v97.origin.x = v22;
  v97.origin.y = v24;
  v97.size.width = v26;
  v97.size.height = v28;
  v46 = -[_DUIPreview initWithBounds:outline:](self, "initWithBounds:outline:", v17, v43, v44, v45, sya * CGRectGetHeight(v97));
  if (v46)
  {
    if (v13)
      v47 = v13;
    else
      v47 = v30;
    v48 = v47;
    objc_msgSend(v15, "backgroundColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    sy = v48;
    objc_msgSend(v48, "traitCollection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "resolvedColorWithTraitCollection:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "copy");
    backgroundColor = v46->_backgroundColor;
    v46->_backgroundColor = (UIColor *)v52;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "_shadowProperties");
      v54 = objc_claimAutoreleasedReturnValue();
      shadowProperties = v46->_shadowProperties;
      v46->_shadowProperties = (_UIDragPreviewShadowProperties *)v54;

    }
    v46->_originalCenter = *v42;
    RotationAngleFromViewToView = DUIPreviewGetRotationAngleFromViewToView(v13, 0, 0);
    memset(&v90, 0, sizeof(v90));
    if (v12)
    {
      objc_msgSend(v30, "transform");
      v58 = v90.a;
      v57 = v90.b;
    }
    else
    {
      v58 = 0.0;
      v57 = 0.0;
    }
    v46->_originalRotation = RotationAngleFromViewToView + atan2(v57, v58);
    objc_msgSend(v13, "_window");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v60 = v13;
      v61 = v85;
    }
    else
    {
      objc_msgSend(v30, "_window");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v85;
      if (v62)
      {
        objc_msgSend(v30, "superview");
        v60 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v60 = 0;
      }

    }
    if (!v60)
      goto LABEL_32;
    v63 = v60;
    objc_msgSend(v63, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84 = v13;
      v65 = v63;
      do
      {
        v66 = v64;
        v67 = v65;
        objc_msgSend(v65, "superview");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "convertPoint:toView:", v68, x, v61);
        x = v69;
        v61 = v70;
        v65 = v68;

        objc_msgSend(v65, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
      }
      while ((objc_opt_isKindOfClass() & 1) != 0);

      v13 = v84;
      if (!v65)
        goto LABEL_31;
    }
    else
    {

      v65 = v63;
    }
    v46->_originalCenterInCoordinateSpace.x = x;
    v46->_originalCenterInCoordinateSpace.y = v61;
    v46->_originalCenterInCoordinateSpace.z = 0.0;
    v71 = objc_alloc_init(_DUITargetLayerDescriptor);
    coordinateSpaceSourceLayerContext = v46->_coordinateSpaceSourceLayerContext;
    v46->_coordinateSpaceSourceLayerContext = v71;

    objc_msgSend(v65, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "context");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DUITargetLayerDescriptor setContextID:](v46->_coordinateSpaceSourceLayerContext, "setContextID:", objc_msgSend(v74, "contextId"));

    objc_msgSend(v65, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DUITargetLayerDescriptor setRenderID:](v46->_coordinateSpaceSourceLayerContext, "setRenderID:", CALayerGetRenderId());

    objc_msgSend(v65, "window");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "windowScene");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "systemShellHostingEnvironment");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "systemShellHostingSpaceIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DUITargetLayerDescriptor setSystemShellHostingSpaceIdentifier:](v46->_coordinateSpaceSourceLayerContext, "setSystemShellHostingSpaceIdentifier:", v79);

LABEL_31:
LABEL_32:
    -[_DUIPreview _applyPropertiesFromPreviewParameters:](v46, "_applyPropertiesFromPreviewParameters:", v15);
    v80 = v46;

  }
  return v46;
}

- (UIDragPreviewParameters)parameters
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  id v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  v3 = (void *)-[UIBezierPath copy](self->_outline, "copy");
  objc_msgSend(v3, "bounds");
  if (!CGRectIsNull(v11))
  {
    CGAffineTransformMakeTranslation(&v10, -self->_contentOffset.x, -self->_contentOffset.y);
    objc_msgSend(v3, "applyTransform:", &v10);
    -[_DUIPreview viewScaleFactor](self, "viewScaleFactor");
    v5 = 1.0 / v4;
    -[_DUIPreview viewScaleFactor](self, "viewScaleFactor");
    CGAffineTransformMakeScale(&v9, v5, 1.0 / v6);
    objc_msgSend(v3, "applyTransform:", &v9);
  }
  v7 = -[UIPreviewParameters _initWithMode:visiblePath:backgroundColor:]([UIDragPreviewParameters alloc], "_initWithMode:visiblePath:backgroundColor:", self->_previewMode, v3, self->_backgroundColor);
  objc_msgSend(v7, "setShadowPath:", self->_shadowPath);

  return (UIDragPreviewParameters *)v7;
}

- (void)_applyPropertiesFromPreviewParameters:(id)a3
{
  id v4;
  UIBezierPath *v5;
  UIBezierPath *shadowPath;

  v4 = a3;
  self->_previewMode = objc_msgSend(v4, "_previewMode");
  objc_msgSend(v4, "shadowPath");
  v5 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();

  shadowPath = self->_shadowPath;
  self->_shadowPath = v5;

}

- (unsigned)coordinateSpaceSourceContextID
{
  void *v2;
  unsigned int v3;

  -[_DUIPreview coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contextID");

  return v3;
}

- (unint64_t)coordinateSpaceSourceLayerRenderID
{
  void *v2;
  unint64_t v3;

  -[_DUIPreview coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "renderID");

  return v3;
}

- (void)setCoordinateSpaceSourceLayerRenderID:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[_DUIPreview coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[_DUIPreview setCoordinateSpaceSourceLayerContext:](self, "setCoordinateSpaceSourceLayerContext:", v6);

  }
  -[_DUIPreview coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRenderID:", a3);

}

- (void)setCoordinateSpaceSourceContextID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[_DUIPreview coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[_DUIPreview setCoordinateSpaceSourceLayerContext:](self, "setCoordinateSpaceSourceLayerContext:", v6);

  }
  -[_DUIPreview coordinateSpaceSourceLayerContext](self, "coordinateSpaceSourceLayerContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContextID:", v3);

}

+ (double)defaultStackAlpha
{
  int v2;
  double result;
  int v4;

  v2 = _AXSEnhanceBackgroundContrastEnabled();
  result = 1.0;
  if (!v2)
  {
    v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterStackAlpha, (uint64_t)CFSTR("UIDragPlatterStackAlpha"));
    result = *(double *)&qword_1EDDA7F40;
    if (v4)
      return 0.8;
  }
  return result;
}

- (double)backAlpha
{
  int v2;
  double result;

  v2 = _AXSEnhanceBackgroundContrastEnabled();
  result = 1.0;
  if (!v2)
    return 0.5;
  return result;
}

- (UIColor)backgroundColor
{
  if ((unint64_t)(self->_previewMode - 3) >= 2)
    return self->_backgroundColor;
  else
    return (UIColor *)0;
}

- (CGSize)boundingSize
{
  double v2;
  double v3;
  CGSize result;

  if (-[_DUIPreview textMode](self, "textMode"))
    +[UIDragPreview textBoundingSize](UIDragPreview, "textBoundingSize");
  else
    +[UIDragPreview defaultBoundingSize](UIDragPreview, "defaultBoundingSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)liftAlpha
{
  return 1.0;
}

- (CGAffineTransform)liftTransform
{
  CGAffineTransform *v3;
  CGFloat c;
  uint64_t v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = self;
  c = self[2].c;
  if (*(_QWORD *)&c > 6uLL)
    goto LABEL_6;
  if (((1 << SLOBYTE(c)) & 0x46) != 0)
  {
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
    return self;
  }
  if (((1 << SLOBYTE(c)) & 0x18) != 0)
  {
    v8 = 1.001;
  }
  else
  {
LABEL_6:
    -[CGAffineTransform unscaledSize](self, "unscaledSize");
    v10 = v9;
    -[CGAffineTransform unscaledSize](v3, "unscaledSize");
    if (v10 >= v11)
      v12 = v10;
    else
      v12 = v11;
    v8 = _UIPlatterLiftScaleForEdgeDimensions(v12);
  }
  return CGAffineTransformMakeScale(retstr, v8, v8);
}

- (CGPoint)originalCenterInCoordinateSpace
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalCenterInCoordinateSpace.x;
  y = self->_originalCenterInCoordinateSpace.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalCenterInCoordinateSpace:(CGPoint)a3
{
  self->_originalCenterInCoordinateSpace.x = a3.x;
  self->_originalCenterInCoordinateSpace.y = a3.y;
  self->_originalCenterInCoordinateSpace.z = 0.0;
}

- (void)setLiftAnchorPoint:(CGPoint)a3
{
  self->_liftAnchorPoint = a3;
}

- (BOOL)isOversized
{
  int64_t previewMode;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;

  previewMode = self->_previewMode;
  if (previewMode == 2 || previewMode == 4)
    return 0;
  -[_DUIPreview unscaledSize](self, "unscaledSize");
  v6 = v5;
  v8 = v7;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = v6 * v8;
  v15 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterMaximumScreenFraction, (uint64_t)CFSTR("UIDragPlatterMaximumScreenFraction"));
  v16 = *(double *)&qword_1EDDA7F30;
  if (v15)
    v16 = 0.5;
  return v14 > v11 * v13 * v16;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)scaledSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_DUIPreview scaleFactor](self, "scaleFactor");
  v4 = v3;
  -[_DUIPreview unscaledSize](self, "unscaledSize");
  v6 = v4 * v5;
  v8 = v4 * v7;
  result.height = v8;
  result.width = v6;
  return result;
}

- (double)scaleFactor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  int64_t previewMode;
  double v20;
  double v21;
  _QWORD aBlock[9];

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDragAndDropGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "previewMinimumSize");
  v6 = v5;
  v8 = v7;
  -[_DUIPreview unscaledSize](self, "unscaledSize");
  v10 = v9;
  v12 = v11;
  +[UIDragPreview textBoundingSize](UIDragPreview, "textBoundingSize");
  v14 = v13;
  v16 = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __26___DUIPreview_scaleFactor__block_invoke;
  aBlock[3] = &unk_1E16C4408;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v10;
  *(double *)&aBlock[6] = v12;
  aBlock[7] = v6;
  aBlock[8] = v8;
  v17 = _Block_copy(aBlock);
  v18 = v17;
  previewMode = self->_previewMode;
  v20 = 1.0;
  if ((unint64_t)(previewMode - 3) >= 2 && previewMode != 6)
  {
    if (previewMode == 1 && v12 < v16)
    {
      if (v10 >= v14)
      {
        v21 = v14 / v10;
        if (v14 / v10 < 40.0 / v12)
          v21 = 40.0 / v12;
        v20 = fmax(fmin(v21, 1.0), 0.2);
      }
    }
    else
    {
      v20 = (*((double (**)(void *))v17 + 2))(v17);
    }
  }

  return v20;
}

- (double)stackAlpha
{
  int v3;
  double result;
  unint64_t v5;
  int v6;

  v3 = _AXSEnhanceBackgroundContrastEnabled();
  result = 1.0;
  if (!v3)
  {
    v5 = self->_previewMode - 2;
    if (v5 >= 5 || ((0x17u >> v5) & 1) == 0)
    {
      v6 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterStackAlpha, (uint64_t)CFSTR("UIDragPlatterStackAlpha"));
      result = *(double *)&qword_1EDDA7F40;
      if (v6)
        return 0.8;
    }
  }
  return result;
}

- (double)topAlpha
{
  _AXSEnhanceBackgroundContrastEnabled();
  return 1.0;
}

- (CGPoint)unscaledAnchorPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  if ((unint64_t)(self->_previewMode - 3) > 1)
  {
    -[_DUIPreview _topOffset](self, "_topOffset");
    v6 = v5;
    -[_DUIPreview unscaledSize](self, "unscaledSize");
    v4 = fmax(fmin(v6 / v7, 1.0), 0.0);
    v3 = 0.5;
  }
  else
  {
    -[_DUIPreview liftAnchorPoint](self, "liftAnchorPoint");
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)unscaledSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_DUIPreview outline](self, "outline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_DUIPreview outline](self, "outline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    -[_DUIPreview contentSize](self, "contentSize");
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)_topOffset
{
  int v2;
  double result;

  if (!-[_DUIPreview textMode](self, "textMode"))
    return 33.0;
  v2 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIDragPlatterTextModeTouchOffset, (uint64_t)CFSTR("UIDragPlatterTextModeTouchOffset"));
  result = *(double *)&qword_1EDDA7F50;
  if (v2)
    return 20.0;
  return result;
}

- (void)setTextMode:(BOOL)a3
{
  -[_DUIPreview setPreviewMode:](self, "setPreviewMode:", 1);
}

- (BOOL)textMode
{
  return -[_DUIPreview previewMode](self, "previewMode") == 1;
}

- (UIBezierPath)effectiveShadowPath
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_DUIPreview shadowPath](self, "shadowPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_DUIPreview outline](self, "outline");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIBezierPath *)v6;
}

- (_DUIPreview)initWithCoder:(id)a3
{
  id v4;
  _DUIPreview *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _DUIPreview *v10;
  uint64_t v11;
  UIColor *backgroundColor;
  _DUIPreview *v13;
  CGFloat v14;
  CGFloat v15;
  _DUIPreview *v16;
  double v17;
  double v18;
  double v19;
  _DUIPreview *v20;
  _DUIPreview *v21;
  CGFloat v22;
  CGFloat v23;
  _DUIPreview *v24;
  CGFloat v25;
  CGFloat v26;
  _DUIPreview *v27;
  double v28;
  _DUIPreview *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  _DUIPreview *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  _BYTE *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  _BYTE *v47;
  _BYTE *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  void *v52;
  _OWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[7];

  v63[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_DUIPreview init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    v63[2] = objc_opt_class();
    v63[3] = objc_opt_class();
    v63[4] = objc_opt_class();
    v63[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_class();
    v10 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("backgroundColor"));
    v11 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v11;

    v13 = v10;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("contentOffset"));
    v10->_contentOffset.x = v14;
    v13->_contentOffset.y = v15;
    v16 = v13;
    objc_msgSend(v4, "decodeUISize3DForKey:", CFSTR("contentSize"));
    v13->_contentSize.width = v17;
    v16->_contentSize.height = v18;
    v16->_contentSize.depth = v19;
    v20 = v16;
    v20->_hidesSourceView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidesSourceView"));
    v21 = v20;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("liftAnchorPoint"));
    v20->_liftAnchorPoint.x = v22;
    v21->_liftAnchorPoint.y = v23;
    v24 = v21;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("originalCenter"));
    v21->_originalCenter.x = v25;
    v24->_originalCenter.y = v26;
    v27 = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("originalRotation"));
    v27->_originalRotation = v28;
    v29 = v27;
    objc_msgSend(v4, "ui_decodeCAPoint3DForKey:", CFSTR("originalCenterInCoordinateSpace"));
    v27->_originalCenterInCoordinateSpace.x = v30;
    *(_QWORD *)&v29->_originalCenterInCoordinateSpace.y = v31;
    *(_QWORD *)&v29->_originalCenterInCoordinateSpace.z = v32;
    v33 = objc_opt_class();
    v34 = v29;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, CFSTR("coordinateSpaceSourceLayerContext"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v34[12];
    v34[12] = v35;

    v37 = objc_opt_class();
    v38 = v34;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, CFSTR("outline"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v38[9];
    v38[9] = v39;

    v41 = v38;
    v41[57] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCustomOutline"));
    v42 = objc_opt_class();
    v43 = v41;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, CFSTR("shadowPath"));
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v43[10];
    v43[10] = v44;

    v46 = v43;
    v46[14] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("previewMode"));
    v47 = v46;
    v47[58] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("avoidAnimation"));
    v48 = v47;
    v48[59] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsSuppressedMask"));
    v49 = objc_opt_class();
    v50 = v48;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v49, CFSTR("shadowProperties"));
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v50[11];
    v50[11] = v51;

    v53 = v50 + 26;
    v54 = v50;
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("overrideStackTransform"));
    }
    else
    {
      v61 = 0u;
      v62 = 0u;
      v60 = 0u;
    }
    *v53 = v60;
    v53[1] = v61;
    v53[2] = v62;
    v55 = v54;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("initialBadgeLocation"));
    v54[18] = v56;
    v55[19] = v57;
    v58 = v55;
    v58[15] = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredStackOrder"));

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong((id *)v4 + 8, self->_backgroundColor);
  *((_OWORD *)v4 + 8) = self->_contentOffset;
  v5 = *(_OWORD *)&self->_contentSize.width;
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_contentSize.depth;
  *(_OWORD *)(v4 + 8) = v5;
  v4[56] = self->_hidesSourceView;
  *((_OWORD *)v4 + 11) = self->_liftAnchorPoint;
  *((_OWORD *)v4 + 10) = self->_originalCenter;
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_originalRotation;
  v6 = *(_OWORD *)&self->_originalCenterInCoordinateSpace.x;
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_originalCenterInCoordinateSpace.z;
  *((_OWORD *)v4 + 2) = v6;
  v7 = -[_DUITargetLayerDescriptor copy](self->_coordinateSpaceSourceLayerContext, "copy");
  v8 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v7;

  v9 = -[UIBezierPath copy](self->_outline, "copy");
  v10 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v9;

  v4[57] = self->_hasCustomOutline;
  v11 = -[UIBezierPath copy](self->_shadowPath, "copy");
  v12 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v11;

  *((_QWORD *)v4 + 14) = self->_previewMode;
  v4[58] = self->_avoidAnimation;
  v4[59] = self->_wantsSuppressedMask;
  v13 = *(_OWORD *)&self->_overrideStackTransform.a;
  v14 = *(_OWORD *)&self->_overrideStackTransform.tx;
  *((_OWORD *)v4 + 14) = *(_OWORD *)&self->_overrideStackTransform.c;
  *((_OWORD *)v4 + 15) = v14;
  *((_OWORD *)v4 + 13) = v13;
  *((_OWORD *)v4 + 9) = self->_initialBadgeLocation;
  *((_QWORD *)v4 + 15) = self->_preferredStackOrder;
  v15 = -[_UIDragPreviewShadowProperties copy](self->_shadowProperties, "copy");
  v16 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *backgroundColor;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  backgroundColor = self->_backgroundColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("contentOffset"), self->_contentOffset.x, self->_contentOffset.y);
  objc_msgSend(v5, "encodeUISize3D:forKey:", CFSTR("contentSize"), self->_contentSize.width, self->_contentSize.height, self->_contentSize.depth);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hidesSourceView, CFSTR("hidesSourceView"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("liftAnchorPoint"), self->_liftAnchorPoint.x, self->_liftAnchorPoint.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("originalCenter"), self->_originalCenter.x, self->_originalCenter.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("originalRotation"), self->_originalRotation);
  objc_msgSend(v5, "ui_encodeCAPoint3D:forKey:", CFSTR("originalCenterInCoordinateSpace"), self->_originalCenterInCoordinateSpace.x, self->_originalCenterInCoordinateSpace.y, self->_originalCenterInCoordinateSpace.z);
  objc_msgSend(v5, "encodeObject:forKey:", self->_coordinateSpaceSourceLayerContext, CFSTR("coordinateSpaceSourceLayerContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_outline, CFSTR("outline"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCustomOutline, CFSTR("hasCustomOutline"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shadowPath, CFSTR("shadowPath"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_previewMode, CFSTR("previewMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_avoidAnimation, CFSTR("avoidAnimation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsSuppressedMask, CFSTR("wantsSuppressedMask"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shadowProperties, CFSTR("shadowProperties"));
  v6 = *(_OWORD *)&self->_overrideStackTransform.c;
  v7[0] = *(_OWORD *)&self->_overrideStackTransform.a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_overrideStackTransform.tx;
  objc_msgSend(v5, "encodeCGAffineTransform:forKey:", v7, CFSTR("overrideStackTransform"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("initialBadgeLocation"), self->_initialBadgeLocation.x, self->_initialBadgeLocation.y);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preferredStackOrder, CFSTR("preferredStackOrder"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  UIColor *backgroundColor;
  BOOL v8;
  BOOL v9;
  BOOL v11;
  UIBezierPath *outline;
  UIBezierPath *shadowPath;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v17;
  CGAffineTransform t1;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    backgroundColor = self->_backgroundColor;
    if ((backgroundColor == *((UIColor **)v5 + 8) || -[UIColor isEqual:](backgroundColor, "isEqual:"))
      && self->_contentOffset.x == *((double *)v5 + 16)
      && self->_contentOffset.y == *((double *)v5 + 17))
    {
      v8 = self->_contentSize.width == *((double *)v5 + 1) && self->_contentSize.height == *((double *)v5 + 2);
      v9 = v8 && self->_contentSize.depth == *((double *)v5 + 3);
      if (v9
        && !self->_hidesSourceView != v5[56]
        && self->_liftAnchorPoint.x == *((double *)v5 + 22)
        && self->_liftAnchorPoint.y == *((double *)v5 + 23))
      {
        v11 = 0;
        if (self->_originalCenter.x != *((double *)v5 + 20) || self->_originalCenter.y != *((double *)v5 + 21))
          goto LABEL_42;
        if (self->_originalRotation == *((double *)v5 + 13))
        {
          if (CAPoint3DEqualToPoint())
          {
            if (UIEqual(self->_coordinateSpaceSourceLayerContext, *((void **)v5 + 12)))
            {
              outline = self->_outline;
              if ((outline == *((UIBezierPath **)v5 + 9) || -[UIBezierPath isEqual:](outline, "isEqual:"))
                && self->_hasCustomOutline == v5[57])
              {
                shadowPath = self->_shadowPath;
                if ((shadowPath == *((UIBezierPath **)v5 + 10) || -[UIBezierPath isEqual:](shadowPath, "isEqual:"))
                  && self->_previewMode == *((_QWORD *)v5 + 14)
                  && self->_avoidAnimation == v5[58])
                {
                  if (UIEqual(self->_shadowProperties, *((void **)v5 + 11)))
                  {
                    v14 = *(_OWORD *)&self->_overrideStackTransform.c;
                    *(_OWORD *)&t1.a = *(_OWORD *)&self->_overrideStackTransform.a;
                    *(_OWORD *)&t1.c = v14;
                    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_overrideStackTransform.tx;
                    v15 = *((_OWORD *)v5 + 14);
                    *(_OWORD *)&v17.a = *((_OWORD *)v5 + 13);
                    *(_OWORD *)&v17.c = v15;
                    *(_OWORD *)&v17.tx = *((_OWORD *)v5 + 15);
                    if (CGAffineTransformEqualToTransform(&t1, &v17))
                    {
                      v11 = 0;
                      if (self->_initialBadgeLocation.x == *((double *)v5 + 18)
                        && self->_initialBadgeLocation.y == *((double *)v5 + 19))
                      {
                        v11 = self->_preferredStackOrder == *((_QWORD *)v5 + 15);
                      }
                      goto LABEL_42;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v11 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v11 = 0;
LABEL_43:

  return v11;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)hidesSourceView
{
  return self->_hidesSourceView;
}

- (void)setHidesSourceView:(BOOL)a3
{
  self->_hidesSourceView = a3;
}

- (UIBezierPath)outline
{
  return self->_outline;
}

- (void)setOutline:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (void)setShadowPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_UIDragPreviewShadowProperties)shadowProperties
{
  return self->_shadowProperties;
}

- (void)setShadowProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CGAffineTransform)overrideStackTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].a;
  return self;
}

- (void)setOverrideStackTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_overrideStackTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_overrideStackTransform.tx = v4;
  *(_OWORD *)&self->_overrideStackTransform.a = v3;
}

- (CGPoint)initialBadgeLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialBadgeLocation.x;
  y = self->_initialBadgeLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialBadgeLocation:(CGPoint)a3
{
  self->_initialBadgeLocation = a3;
}

- (CGPoint)originalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalCenter.x;
  y = self->_originalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->_originalCenter = a3;
}

- (_DUITargetLayerDescriptor)coordinateSpaceSourceLayerContext
{
  return self->_coordinateSpaceSourceLayerContext;
}

- (void)setCoordinateSpaceSourceLayerContext:(id)a3
{
  objc_storeStrong((id *)&self->_coordinateSpaceSourceLayerContext, a3);
}

- (double)originalRotation
{
  return self->_originalRotation;
}

- (void)setOriginalRotation:(double)a3
{
  self->_originalRotation = a3;
}

- (int64_t)previewMode
{
  return self->_previewMode;
}

- (void)setPreviewMode:(int64_t)a3
{
  self->_previewMode = a3;
}

- (CGPoint)liftAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_liftAnchorPoint.x;
  y = self->_liftAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)hasCustomOutline
{
  return self->_hasCustomOutline;
}

- (void)setHasCustomOutline:(BOOL)a3
{
  self->_hasCustomOutline = a3;
}

- (BOOL)avoidAnimation
{
  return self->_avoidAnimation;
}

- (void)setAvoidAnimation:(BOOL)a3
{
  self->_avoidAnimation = a3;
}

- (BOOL)wantsSuppressedMask
{
  return self->_wantsSuppressedMask;
}

- (void)setWantsSuppressedMask:(BOOL)a3
{
  self->_wantsSuppressedMask = a3;
}

- (int64_t)preferredStackOrder
{
  return self->_preferredStackOrder;
}

- (void)setPreferredStackOrder:(int64_t)a3
{
  self->_preferredStackOrder = a3;
}

- (CGSize)viewScaleFactor
{
  double width;
  double height;
  CGSize result;

  width = self->_viewScaleFactor.width;
  height = self->_viewScaleFactor.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpaceSourceLayerContext, 0);
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
