@implementation UITargetedPreview

- (UITargetedPreview)initWithView:(UIView *)view parameters:(UIPreviewParameters *)parameters target:(UIPreviewTarget *)target
{
  UIView *v10;
  UIPreviewParameters *v11;
  UIPreviewTarget *v12;
  UITargetedPreview *v13;
  UITargetedPreview *v14;
  uint64_t v15;
  CALayer *layer;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  UITargetedPreview *v22;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v10 = view;
  v11 = parameters;
  v12 = target;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target != nil"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)UITargetedPreview;
  v13 = -[UITargetedPreview init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_view, view);
    -[UIView layer](v10, "layer");
    v15 = objc_claimAutoreleasedReturnValue();
    layer = v14->_layer;
    v14->_layer = (CALayer *)v15;

    -[UIView _cropInsets](v10, "_cropInsets");
    v14->_cropInsets.top = v17;
    v14->_cropInsets.left = v18;
    v14->_cropInsets.bottom = v19;
    v14->_cropInsets.right = v20;
    objc_storeStrong((id *)&v14->_parameters, parameters);
    objc_storeStrong((id *)&v14->_target, target);
    -[UIView window](v14->_view, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_sourceViewIsInViewHierarchy = v21 != 0;

    v14->_hasCustomTarget = 1;
    v22 = v14;
  }

  return v14;
}

- (UITargetedPreview)initWithView:(UIView *)view parameters:(UIPreviewParameters *)parameters
{
  UIView *v7;
  UIPreviewParameters *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v22;
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
  void *v34;
  UITargetedPreview *v35;
  void *v37;

  v7 = view;
  v8 = parameters;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

  }
  -[UIView _window](v7, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    -[UIView _conciseParentDescription](v7, "_conciseParentDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 199, CFSTR("This %@ initializer requires that the view is in a window, but it is not. Either fix that, or use the other initializer that takes a target. (view: %@)"), v11, v12);

  }
  -[UIView frame](v7, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UIPreviewParameters visiblePath](v8, "visiblePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[UIPreviewParameters visiblePath](v8, "visiblePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v25 = v24 + v23 * 0.5;
    v28 = v27 + v26 * 0.5;
    -[UIView superview](v7, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:toView:](v7, "convertPoint:toView:", v29, v25, v28);
    v31 = v30;
    v33 = v32;

  }
  else
  {
    v31 = v14 + v18 * 0.5;
    v33 = v16 + v20 * 0.5;
  }
  -[UITargetedPreview _defaultTargetForView:withCenter:version:](self, "_defaultTargetForView:withCenter:version:", v7, 983040, v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[UITargetedPreview initWithView:parameters:target:](self, "initWithView:parameters:target:", v7, v8, v34);
  v35->_hasCustomTarget = 0;

  return v35;
}

- (UITargetedPreview)initWithView:(UIView *)view
{
  UIView *v5;
  void *v6;
  UIPreviewParameters *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  UITargetedPreview *v13;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = view;
  -[UIView _window](v5, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    -[UIView _conciseParentDescription](v5, "_conciseParentDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 218, CFSTR("This %@ initializer requires that the view is in a window, but it is not. Please correct this or use -initWithView:parameters:target: to provide a target with an explicit container. (view: %@)"), v16, v17);

  }
  v7 = objc_alloc_init(UIPreviewParameters);
  -[UIView frame](v5, "frame");
  -[UITargetedPreview _defaultTargetForView:withCenter:version:](self, "_defaultTargetForView:withCenter:version:", v5, 852992, v9 + v8 * 0.5, v11 + v10 * 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UITargetedPreview initWithView:parameters:target:](self, "initWithView:parameters:target:", v5, v7, v12);
  v13->_hasCustomTarget = 0;

  return v13;
}

- (id)_defaultTargetForView:(id)a3 withCenter:(CGPoint)a4 version:(unsigned int)a5
{
  double y;
  double x;
  id v7;
  int v8;
  UIPreviewTarget *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _OWORD v14[3];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = dyld_program_sdk_at_least();
  v9 = [UIPreviewTarget alloc];
  objc_msgSend(v7, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(v14, 0, sizeof(v14));
    v11 = -[UIPreviewTarget initWithContainer:center:transform:](v9, "initWithContainer:center:transform:", v10, v14, x, y);
  }
  else
  {
    v11 = -[UIPreviewTarget initWithContainer:center:](v9, "initWithContainer:center:", v10, x, y);
  }
  v12 = (void *)v11;

  return v12;
}

- (UITargetedPreview)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 247, CFSTR("not implemented"));

  return 0;
}

+ (UITargetedPreview)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITargetedPreview.m"), 252, CFSTR("not implemented"));

  return 0;
}

- (BOOL)containsPoint:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  UIPreviewTarget *target;
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIView *view;
  double width;
  double height;
  double v31;
  double v32;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  y = a3.y;
  x = a3.x;
  target = self->_target;
  v8 = a4;
  -[UIPreviewTarget container](target, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  v11 = v10;
  v13 = v12;

  -[UIView bounds](self->_view, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[UIPreviewParameters visiblePath](self->_parameters, "visiblePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UIPreviewParameters visiblePath](self->_parameters, "visiblePath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v15 = v24;
    v17 = v25;
    v19 = v26;
    v21 = v27;

  }
  view = self->_view;
  if (view)
    -[UIView transform](view, "transform");
  else
    memset(&v34, 0, sizeof(v34));
  CGAffineTransformInvert(&v35, &v34);
  v37.origin.x = v15;
  v37.origin.y = v17;
  v37.size.width = v19;
  v37.size.height = v21;
  v38 = CGRectApplyAffineTransform(v37, &v35);
  width = v38.size.width;
  height = v38.size.height;
  -[UIPreviewTarget center](self->_target, "center", v38.origin.x, v38.origin.y);
  v39.origin.y = round(v31 - height * 0.5);
  v39.origin.x = round(v32 - width * 0.5);
  v39.size.width = width;
  v39.size.height = height;
  v36.x = v11;
  v36.y = v13;
  return CGRectContainsPoint(v39, v36);
}

- (CGSize)size
{
  void *v3;
  void *v4;
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
  CGSize result;

  if (dyld_program_sdk_at_least())
  {
    -[UITargetedPreview parameters](self, "parameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visiblePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UITargetedPreview _sizeUsingPresentationLayer:](self, "_sizeUsingPresentationLayer:", 0);
      goto LABEL_7;
    }
    -[UITargetedPreview parameters](self, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visiblePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    -[UITargetedPreview view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v8 = v11;
    v10 = v12;
  }

  v13 = v8;
  v14 = v10;
LABEL_7:
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_sizeUsingPresentationLayer:(BOOL)a3
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
  CALayer *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v3 = a3;
  -[UITargetedPreview parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visiblePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UITargetedPreview parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visiblePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v13 = self->_layer;
    v7 = v13;
    if (v3)
    {
      -[CALayer presentationLayer](v13, "presentationLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v7, "presentationLayer");
        v15 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v15;
      }
    }
    objc_msgSend(v7, "bounds");
    v10 = v16 - (self->_cropInsets.left + self->_cropInsets.right);
    v12 = v17 - (self->_cropInsets.top + self->_cropInsets.bottom);
  }

  v18 = v10;
  v19 = v12;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UITargetedPreview)retargetedPreviewWithTarget:(UIPreviewTarget *)newTarget
{
  UIPreviewTarget *v5;
  id v6;
  void *v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  void *v12;

  v5 = newTarget;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITargetedPreview.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newTarget != nil"));

  }
  v6 = objc_alloc((Class)objc_opt_class());
  -[UITargetedPreview view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_BYTE *)objc_msgSend(v6, "initWithView:parameters:target:", v7, v8, v5);

  objc_msgSend(v9, "_setDefaultPreview:", -[UITargetedPreview _isDefaultPreview](self, "_isDefaultPreview"));
  -[UITargetedPreview overridePositionTrackingView](self, "overridePositionTrackingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setOverridePositionTrackingView:", v10);

  v9[48] = self->_sourceViewIsInViewHierarchy;
  objc_msgSend(v9, "set_captureHierarchyBelowSourceView:", -[UITargetedPreview _captureHierarchyBelowSourceView](self, "_captureHierarchyBelowSourceView"));

  return (UITargetedPreview *)v9;
}

- (BOOL)_isVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[UITargetedPreview target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITargetedPreview view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(v4, "isHidden") & 1) != 0
    || (objc_msgSend(v4, "_isHiddenForReuse") & 1) != 0
    || (objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "_isHiddenForReuse") ^ 1;
  }

  return v7;
}

- (BOOL)_isLikelyOpaque
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  -[UITargetedPreview parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visiblePath");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UITargetedPreview parameters](self, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visiblePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isRoundedRect");

    if (!v8)
      return 0;
  }
  else
  {

  }
  -[UITargetedPreview parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolvedColorWithTraitCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_isOpaque");

  return v15;
}

- (CGRect)_frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UITargetedPreview size](self, "size");
  v4 = v3;
  v6 = v5;
  -[UITargetedPreview target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  v9 = round(v8 - v6 * 0.5);
  v11 = round(v10 - v4 * 0.5);

  v12 = v11;
  v13 = v9;
  v14 = v4;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (_UIShape)_outlineShape
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  -[UITargetedPreview view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "cornerRadii");
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
  }
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2380] + 16);
  v46 = *MEMORY[0x1E0CD2380];
  v47 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2380] + 48);
  v48 = *(_OWORD *)(MEMORY[0x1E0CD2380] + 32);
  v49 = v6;
  if ((CACornerRadiiEqualToRadii() & 1) != 0)
  {
    v7 = (id)*MEMORY[0x1E0CD2A60];
    -[UITargetedPreview parameters](self, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_previewMode") == 1)
    {
      v9 = v7;
      v10 = 13.0;
      v11 = 15;
      v7 = (id)*MEMORY[0x1E0CD2A68];
LABEL_24:

      if (v11)
        v36 = v11;
      else
        v36 = 15;
      if (!v11)
        v10 = 0.0;
      goto LABEL_29;
    }
    v16 = -[UITargetedPreview _mayInferCornerRadiusFromVisiblePath](self, "_mayInferCornerRadiusFromVisiblePath");
    objc_msgSend(v8, "visiblePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (v16)
    {
      if (objc_msgSend(v17, "_isRoundedRect"))
      {
        v11 = objc_msgSend(v9, "_cornerMask");
        objc_msgSend(v9, "_cornerRadius");
        v10 = v18;
        v19 = objc_msgSend(v9, "_hasContinuousCorners");
        v20 = (void *)*MEMORY[0x1E0CD2A68];
        if (!v19)
          v20 = v7;
        v21 = v20;

        v7 = v21;
      }
      else
      {
        v10 = 0.0;
        v11 = 15;
      }
      goto LABEL_24;
    }
    if (v17)
    {
      v23 = objc_msgSend(v8, "_previewMode");

      if (v23 != 5)
      {
        objc_msgSend(v8, "visiblePath");
        v40 = objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v41 = (void *)v40;
          +[_UIShape shapeWithPath:](_UIShape, "shapeWithPath:", v40);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
        v10 = 0.0;
        v36 = 15;
LABEL_29:
        -[UITargetedPreview size](self, "size");
        +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:", v7, v36, 0.0, 0.0, v37, v38, v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
    }
    -[UITargetedPreview _trueSourceViewIfPortal](self, "_trueSourceViewIfPortal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview view](self, "view");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (uint64_t)v9;
    if (v9 != (void *)v24)
    {
      v26 = (void *)v24;
      objc_msgSend(v9, "_cornerRadius");
      v28 = v27;
      -[UITargetedPreview view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_cornerRadius");
      v31 = v30;

      if (v28 > v31)
      {
LABEL_22:
        objc_msgSend(v9, "layer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v32, "maskedCorners");

        objc_msgSend(v9, "_cornerRadius");
        v10 = v33;
        objc_msgSend(v9, "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "cornerCurve");
        v35 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v35;
        goto LABEL_24;
      }
      -[UITargetedPreview view](self, "view");
      v25 = objc_claimAutoreleasedReturnValue();
    }

    v9 = (void *)v25;
    goto LABEL_22;
  }
  -[UITargetedPreview size](self, "size");
  v13 = v12;
  v15 = v14;
  if (v4)
  {
    objc_msgSend(v4, "cornerRadii");
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
  }
  objc_msgSend(v4, "cornerCurve", v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIShape shapeWithRoundedRect:cornerRadii:cornerCurve:](_UIShape, "shapeWithRoundedRect:cornerRadii:cornerCurve:", &v42, v7, 0.0, 0.0, v13, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return (_UIShape *)v22;
}

- (BOOL)_isRoughlyEqualToPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  BOOL v45;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  -[UITargetedPreview view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v45 = 1;
  }
  else
  {
    -[UITargetedPreview size](self, "size");
    v8 = v7;
    v10 = v9;
    -[UITargetedPreview target](self, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "center");
    v13 = round(v12 - v10 * 0.5);
    v15 = round(v14 - v8 * 0.5);

    -[UITargetedPreview target](self, "target");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "container");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toView:", 0, v15, v13, v8, v10);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v4, "size");
    v27 = v26;
    v29 = v28;
    objc_msgSend(v4, "target");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "center");
    v32 = round(v31 - v29 * 0.5);
    v34 = round(v33 - v27 * 0.5);

    objc_msgSend(v4, "target");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "container");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "convertRect:toView:", 0, v34, v32, v27, v29);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    v47.origin.x = v19;
    v47.origin.y = v21;
    v47.size.width = v23;
    v47.size.height = v25;
    v48.origin.x = v38;
    v48.origin.y = v40;
    v48.size.width = v42;
    v48.size.height = v44;
    v45 = CGRectIntersectsRect(v47, v48);
  }

  return v45;
}

- (void)_transferAnimationsToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITargetedPreview view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UITargetedPreview _transferrableAnimationKeys](self, "_transferrableAnimationKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "animationForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");

        if (v14)
        {
          objc_msgSend(v6, "removeAnimationForKey:", v12);
          objc_msgSend(v4, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addAnimation:forKey:", v14, v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)_setPrefersUnmaskedPlatterStyle:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 5;
  else
    v3 = 0;
  -[UITargetedPreview _setPreviewMode:](self, "_setPreviewMode:", v3);
}

- (BOOL)_prefersUnmaskedPlatterStyle
{
  return -[UITargetedPreview _previewMode](self, "_previewMode") == 5;
}

- (void)set_springboardPlatterStyle:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  -[UITargetedPreview _setPreviewMode:](self, "_setPreviewMode:", v3);
}

- (BOOL)_springboardPlatterStyle
{
  return -[UITargetedPreview _previewMode](self, "_previewMode") == 4;
}

- (void)_setPreviewMode:(int64_t)a3
{
  -[UIPreviewParameters _setPreviewMode:](self->_parameters, "_setPreviewMode:", a3);
}

- (int64_t)_previewMode
{
  return -[UIPreviewParameters _previewMode](self->_parameters, "_previewMode");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id WeakRetained;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    -[UITargetedPreview _internalIdentifier](self, "_internalIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_internalIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v5, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITargetedPreview view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11
        && (v12 = objc_msgSend(v5, "_isDefaultPreview"),
            v12 == -[UITargetedPreview _isDefaultPreview](self, "_isDefaultPreview"))
        && (v13 = objc_msgSend(v5, "_sourceViewIsInViewHierarchy"),
            v13 == -[UITargetedPreview _sourceViewIsInViewHierarchy](self, "_sourceViewIsInViewHierarchy"))
        && (v14 = objc_msgSend(v5, "hasCustomTarget"),
            v14 == -[UITargetedPreview hasCustomTarget](self, "hasCustomTarget"))
        && (v15 = objc_msgSend(v5, "_previewMode"), v15 == -[UITargetedPreview _previewMode](self, "_previewMode")))
      {
        objc_msgSend(v5, "overridePositionTrackingView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITargetedPreview overridePositionTrackingView](self, "overridePositionTrackingView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == v17)
        {
          WeakRetained = objc_loadWeakRetained(v5 + 10);
          v20 = objc_loadWeakRetained((id *)&self->_viewToSnapshot);
          if (WeakRetained == v20 && v5[11] == self->__PreviewProvider)
          {
            objc_msgSend(v5, "target");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITargetedPreview target](self, "target");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v21;
            if (objc_msgSend(v21, "isEqual:", v27))
            {
              objc_msgSend(v5, "parameters");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[UITargetedPreview parameters](self, "parameters");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v22;
              if (objc_msgSend(v22, "isEqual:", v25))
              {
                objc_msgSend(v5, "_accessoryViews");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[UITargetedPreview _accessoryViews](self, "_accessoryViews");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = objc_msgSend(v24, "isEqual:");

              }
              else
              {
                v9 = 0;
              }

            }
            else
            {
              v9 = 0;
            }

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  void *v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UITargetedPreview view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  -[UITargetedPreview parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("(nil)");
  }
  -[UITargetedPreview target](self, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; view = %@; parameters = %@; target = %@>"),
    v4,
    self,
    v9,
    v14,
    v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_trueSourceViewIfPortal
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UITargetedPreview view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "sourceView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;

      v2 = v5;
    }

  }
  return v2;
}

- (BOOL)_mayInferCornerRadiusFromVisiblePath
{
  void *v3;
  void *v4;
  void *v5;
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
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  BOOL v34;
  CGRect v36;
  CGRect v37;

  -[UITargetedPreview parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visiblePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UITargetedPreview _trueSourceViewIfPortal](self, "_trueSourceViewIfPortal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "_currentScreenScale");
    v15 = UIRectRoundToScale(v7, v9, v11, v13, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v4, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v5, "_currentScreenScale");
    v37.origin.x = UIRectRoundToScale(v23, v25, v27, v29, v30);
    v37.origin.y = v31;
    v37.size.width = v32;
    v37.size.height = v33;
    v36.origin.x = v15;
    v36.origin.y = v17;
    v36.size.width = v19;
    v36.size.height = v21;
    v34 = CGRectEqualToRect(v36, v37);

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)_sourceViewIsInViewHierarchy
{
  return self->_sourceViewIsInViewHierarchy;
}

- (UIPreviewTarget)target
{
  return self->_target;
}

- (UIView)view
{
  return self->_view;
}

- (UIPreviewParameters)parameters
{
  return self->_parameters;
}

- (BOOL)_isDefaultPreview
{
  return self->_defaultPreview;
}

- (void)_setDefaultPreview:(BOOL)a3
{
  self->_defaultPreview = a3;
}

- (UIView)_viewToSnapshot
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewToSnapshot);
}

- (void)_setViewToSnapshot:(id)a3
{
  objc_storeWeak((id *)&self->_viewToSnapshot, a3);
}

- (_UIPreviewProvider)_PreviewProvider
{
  return self->__PreviewProvider;
}

- (BOOL)hasCustomTarget
{
  return self->_hasCustomTarget;
}

- (NSCopying)_internalIdentifier
{
  return self->__internalIdentifier;
}

- (void)set_internalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__internalIdentifier, a3);
}

- (NSArray)_transferrableAnimationKeys
{
  return self->__transferrableAnimationKeys;
}

- (void)set_transferrableAnimationKeys:(id)a3
{
  objc_storeStrong((id *)&self->__transferrableAnimationKeys, a3);
}

- (NSArray)_matchableProperties
{
  return self->__matchableProperties;
}

- (void)set_matchableProperties:(id)a3
{
  objc_storeStrong((id *)&self->__matchableProperties, a3);
}

- (BOOL)_captureHierarchyBelowSourceView
{
  return self->__captureHierarchyBelowSourceView;
}

- (void)set_captureHierarchyBelowSourceView:(BOOL)a3
{
  self->__captureHierarchyBelowSourceView = a3;
}

- (NSArray)_overlayViews
{
  return self->__overlayViews;
}

- (void)set_overlayViews:(id)a3
{
  objc_storeStrong((id *)&self->__overlayViews, a3);
}

- (UIView)overridePositionTrackingView
{
  return self->_overridePositionTrackingView;
}

- (void)_setOverridePositionTrackingView:(id)a3
{
  objc_storeStrong((id *)&self->_overridePositionTrackingView, a3);
}

- (NSArray)_accessoryViews
{
  return self->__accessoryViews;
}

- (void)_setAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->__accessoryViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryViews, 0);
  objc_storeStrong((id *)&self->_overridePositionTrackingView, 0);
  objc_storeStrong((id *)&self->__overlayViews, 0);
  objc_storeStrong((id *)&self->__matchableProperties, 0);
  objc_storeStrong((id *)&self->__transferrableAnimationKeys, 0);
  objc_storeStrong((id *)&self->__internalIdentifier, 0);
  objc_storeStrong((id *)&self->__PreviewProvider, 0);
  objc_destroyWeak((id *)&self->_viewToSnapshot);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
