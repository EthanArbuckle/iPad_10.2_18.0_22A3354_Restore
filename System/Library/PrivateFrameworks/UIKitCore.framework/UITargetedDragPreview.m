@implementation UITargetedDragPreview

- (UITargetedDragPreview)initWithView:(id)a3
{
  id v4;
  UIDragPreviewParameters *v5;
  UITargetedDragPreview *v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_alloc_init(UIDragPreviewParameters);
  v8.receiver = self;
  v8.super_class = (Class)UITargetedDragPreview;
  v6 = -[UITargetedPreview initWithView:parameters:](&v8, sel_initWithView_parameters_, v4, v5);

  return v6;
}

- (UITargetedDragPreview)initWithView:(id)a3 parameters:(id)a4 target:(id)a5
{
  id v8;
  id v9;
  UITargetedDragPreview *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UITargetedDragPreview;
  v10 = -[UITargetedPreview initWithView:parameters:target:](&v18, sel_initWithView_parameters_target_, v8, v9, a5);
  objc_msgSend(v9, "visiblePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "visiblePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v8;
  }
  objc_msgSend(v12, "bounds");
  v10->_liftAnchorPoint.x = v14 + v13 * 0.5;
  v10->_liftAnchorPoint.y = v16 + v15 * 0.5;
  if (v11)

  v10->__preferredStackOrder = -1;
  v10->__initialBadgeLocation = (CGPoint)_UICGPointNull_1;

  return v10;
}

- (_DUIPreview)_duiPreview
{
  _DUIPreview *duiPreview;
  _DUIPreview *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DUIPreview *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _DUIPreview *v23;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;

  duiPreview = self->_duiPreview;
  if (!duiPreview)
  {
    v4 = [_DUIPreview alloc];
    -[UITargetedPreview view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview target](self, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview parameters](self, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview target](self, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v10 = -[_DUIPreview initWithView:container:parameters:center:](v4, "initWithView:container:parameters:center:", v5, v7, v8);

    -[UITargetedDragPreview _springboardParameters](self, "_springboardParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_UIPlatterViewSuppressMask"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    -[_DUIPreview setWantsSuppressedMask:](v10, "setWantsSuppressedMask:", v13);
    -[UITargetedPreview view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    -[UITargetedDragPreview liftAnchorPoint](self, "liftAnchorPoint");
    -[_DUIPreview setLiftAnchorPoint:](v10, "setLiftAnchorPoint:", v19 / v16, v20 / v18);
    if (-[UITargetedDragPreview _applyTargetTransformToFlock](self, "_applyTargetTransformToFlock"))
    {
      -[UITargetedPreview target](self, "target");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "transform");
      }
      else
      {
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
      }
      v25[0] = v26;
      v25[1] = v27;
      v25[2] = v28;
      -[_DUIPreview setOverrideStackTransform:](v10, "setOverrideStackTransform:", v25);

    }
    -[_DUIPreview setPreferredStackOrder:](v10, "setPreferredStackOrder:", -[UITargetedDragPreview _preferredStackOrder](self, "_preferredStackOrder"));
    -[UITargetedDragPreview _initialBadgeLocation](self, "_initialBadgeLocation");
    -[_DUIPreview setInitialBadgeLocation:](v10, "setInitialBadgeLocation:");
    v23 = self->_duiPreview;
    self->_duiPreview = v10;

    duiPreview = self->_duiPreview;
  }
  return duiPreview;
}

- (void)setLiftAnchorPoint:(CGPoint)a3
{
  self->_didSetLiftAnchorPoint = 1;
  self->_liftAnchorPoint = a3;
}

- (void)_setPreferredStackOrder:(int64_t)a3
{
  if (self->__preferredStackOrder != a3)
  {
    self->__preferredStackOrder = a3;
    -[_DUIPreview setPreferredStackOrder:](self->_duiPreview, "setPreferredStackOrder:");
  }
}

- (void)_setInitialBadgeLocation:(CGPoint)a3
{
  if (a3.x != self->__initialBadgeLocation.x || a3.y != self->__initialBadgeLocation.y)
  {
    self->__initialBadgeLocation = a3;
    -[_DUIPreview setInitialBadgeLocation:](self->_duiPreview, "setInitialBadgeLocation:");
  }
}

- (void)_setApplyTargetTransformToFlock:(BOOL)a3
{
  void *v4;
  void *v5;
  _DUIPreview *duiPreview;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (self->__applyTargetTransformToFlock != a3)
  {
    self->__applyTargetTransformToFlock = a3;
    if (-[UITargetedDragPreview _applyTargetTransformToFlock](self, "_applyTargetTransformToFlock"))
    {
      -[UITargetedPreview target](self, "target");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "transform");
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
        v8 = 0u;
      }
      duiPreview = self->_duiPreview;
      v7[0] = v8;
      v7[1] = v9;
      v7[2] = v10;
      -[_DUIPreview setOverrideStackTransform:](duiPreview, "setOverrideStackTransform:", v7);

    }
  }
}

- (id)imageComponent
{
  _UIDraggingImageComponent *imageComponent;
  void *v4;
  void *v5;
  uint64_t v6;
  _UIDraggingImageComponent *v7;
  _UIDraggingImageComponent *v8;
  void *v9;
  _UIDraggingImageComponent *v10;
  _UIDraggingImageComponent *v11;
  int v12;
  _BOOL4 CanBeRenderedAfterCommit;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIGraphicsImageRenderer *v33;
  _UIDraggingImageComponent *v34;
  _UIDraggingImageComponent *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[2];
  _QWORD v40[4];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  imageComponent = self->_imageComponent;
  if (!imageComponent)
  {
    -[UITargetedPreview view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview parameters](self, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_previewMode");

    if ((unint64_t)(v6 - 3) >= 2)
    {
      if (v6 == 2)
      {
        objc_msgSend(v4, "snapshotView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_UIDraggingImageComponent initWithView:]([_UIDraggingImageComponent alloc], "initWithView:", v9);
        v11 = self->_imageComponent;
        self->_imageComponent = v10;

      }
      else
      {
        if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
          v12 = 0;
        else
          v12 = !-[UITargetedDragPreview _preventAfterScreenUpdatesSnapshot](self, "_preventAfterScreenUpdatesSnapshot");
        CanBeRenderedAfterCommit = _UIViewCanBeRenderedAfterCommit(v4, v12);
        v14 = objc_msgSend(v4, "accessibilityIgnoresInvertColors");
        v15 = *MEMORY[0x1E0C9D538];
        v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[UITargetedDragPreview _duiPreview](self, "_duiPreview");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "contentSize");
        v19 = v18;
        v21 = v20;

        if (!CanBeRenderedAfterCommit)
          goto LABEL_14;
        v22 = v4;
        -[UITargetedPreview _viewToSnapshot](self, "_viewToSnapshot");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[UITargetedPreview _viewToSnapshot](self, "_viewToSnapshot");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "bounds");
          objc_msgSend(v22, "convertRect:fromView:", v24);
          v22 = v24;
        }
        else
        {
          v26 = v16;
          v27 = v19;
          v28 = v21;
          v25 = v15;
        }
        v41[0] = CFSTR("dst-rect");
        *(double *)v40 = v25;
        *(double *)&v40[1] = v26;
        *(double *)&v40[2] = v27;
        *(double *)&v40[3] = v28;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v40, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = CFSTR("dst-size");
        v42[0] = v29;
        *(double *)v39 = v19;
        *(double *)&v39[1] = v21;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v39, "{CGSize=dd}");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _UIRenderViewImageAfterCommit(v22, v31, v12);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
LABEL_14:
          v33 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v19, v21);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __39__UITargetedDragPreview_imageComponent__block_invoke;
          v37[3] = &unk_1E16B5018;
          v38 = v4;
          -[UIGraphicsImageRenderer imageWithActions:](v33, "imageWithActions:", v37);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v34 = -[_UIDraggingImageComponent initWithImage:frame:ignoreAccessibilityFilters:]([_UIDraggingImageComponent alloc], "initWithImage:frame:ignoreAccessibilityFilters:", v32, v14, v15, v16, v19, v21);
        v35 = self->_imageComponent;
        self->_imageComponent = v34;

      }
    }
    else
    {
      v7 = -[_UIDraggingImageComponent initWithView:]([_UIDraggingImageComponent alloc], "initWithView:", v4);
      v8 = self->_imageComponent;
      self->_imageComponent = v7;

    }
    imageComponent = self->_imageComponent;
  }
  return imageComponent;
}

void __39__UITargetedDragPreview_imageComponent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

- (void)_resetPreview
{
  _DUIPreview *duiPreview;

  duiPreview = self->_duiPreview;
  self->_duiPreview = 0;

}

- (void)takeLiftAnchorPoint:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double tx;
  double ty;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
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
  CGAffineTransform v40;
  CGAffineTransform v41;

  if (!self->_didSetLiftAnchorPoint)
  {
    y = a3.y;
    x = a3.x;
    v7 = a4;
    -[UITargetedPreview target](self, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", v7, x, y);
    v11 = v10;
    v13 = v12;

    -[UITargetedPreview target](self, "target");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "center");
    v16 = v15;
    v18 = v17;

    memset(&v41, 0, sizeof(v41));
    -[UITargetedPreview view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "transform");
    else
      memset(&v40, 0, sizeof(v40));
    CGAffineTransformInvert(&v41, &v40);

    tx = v41.tx;
    ty = v41.ty;
    v23 = v11 * v41.a + v13 * v41.c;
    v24 = v11 * v41.b + v13 * v41.d;
    v25 = v16 * v41.a + v18 * v41.c;
    v26 = v16 * v41.b + v18 * v41.d;
    -[UITargetedPreview parameters](self, "parameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "visiblePath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[UITargetedPreview parameters](self, "parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visiblePath");
    }
    else
    {
      -[UITargetedPreview view](self, "view");
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = tx + v23;
    v31 = ty + v24;
    v32 = tx + v25;
    v33 = ty + v26;
    objc_msgSend(v29, "bounds", *(_OWORD *)&v40.a, *(_OWORD *)&v40.c, *(_OWORD *)&v40.tx);
    v36 = v35 + v34 * 0.5;
    v39 = v38 + v37 * 0.5;
    if (v28)
    {

      v29 = v9;
    }

    -[UITargetedDragPreview setLiftAnchorPoint:](self, "setLiftAnchorPoint:", v30 - v32 + v36, v31 - v33 + v39);
    -[UITargetedDragPreview _resetPreview](self, "_resetPreview");
  }
}

- (UITargetedDragPreview)retargetedPreviewWithTarget:(UIDragPreviewTarget *)newTarget
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITargetedDragPreview;
  -[UITargetedPreview retargetedPreviewWithTarget:](&v7, sel_retargetedPreviewWithTarget_, newTarget);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedDragPreview _springboardParameters](self, "_springboardParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_springboardParameters:", v5);

  return (UITargetedDragPreview *)v4;
}

- (void)_setPreviewMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITargetedDragPreview;
  -[UITargetedPreview _setPreviewMode:](&v4, sel__setPreviewMode_, a3);
  -[UITargetedDragPreview _resetPreview](self, "_resetPreview");
}

- (void)_setPreviewContainer:(id)a3
{
  objc_storeStrong((id *)&self->__previewContainer, a3);
  -[UITargetedDragPreview _setPreviewMode:](self, "_setPreviewMode:", 6);
}

- (BOOL)_applyTargetTransformToFlock
{
  return self->__applyTargetTransformToFlock;
}

- (BOOL)_preventAfterScreenUpdatesSnapshot
{
  return self->_preventAfterScreenUpdatesSnapshot;
}

- (void)_setPreventAfterScreenUpdatesSnapshot:(BOOL)a3
{
  self->_preventAfterScreenUpdatesSnapshot = a3;
}

- (int64_t)_preferredStackOrder
{
  return self->__preferredStackOrder;
}

- (CGPoint)_initialBadgeLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->__initialBadgeLocation.x;
  y = self->__initialBadgeLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)_fenceHandler
{
  return self->__fenceHandler;
}

- (void)set_fenceHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
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

- (_UIDragPreviewContainer)_previewContainer
{
  return self->__previewContainer;
}

- (NSDictionary)_springboardParameters
{
  return self->__springboardParameters;
}

- (void)set_springboardParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__springboardParameters, 0);
  objc_storeStrong((id *)&self->__previewContainer, 0);
  objc_storeStrong(&self->__fenceHandler, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong((id *)&self->_duiPreview, 0);
}

+ (UITargetedDragPreview)previewForURL:(NSURL *)url target:(UIDragPreviewTarget *)target
{
  UIDragPreviewTarget *v5;
  void *v6;
  UITargetedDragPreview *v7;
  id v8;
  UIDragPreviewParameters *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  UIDragPreviewParameters *v21;
  UITargetedDragPreview *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = target;
  +[UIURLDragPreviewView viewWithURL:](UIURLDragPreviewView, "viewWithURL:", url);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [UITargetedDragPreview alloc];
  v8 = v6;
  v9 = [UIDragPreviewParameters alloc];
  v10 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v8, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v10, "valueWithCGRect:", v12, v14, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[UIPreviewParameters initWithTextLineRects:](v9, "initWithTextLineRects:", v20);

  v22 = -[UITargetedDragPreview initWithView:parameters:target:](v7, "initWithView:parameters:target:", v8, v21, v5);
  return v22;
}

+ (UITargetedDragPreview)previewForURL:(NSURL *)url title:(NSString *)title target:(UIDragPreviewTarget *)target
{
  UIDragPreviewTarget *v7;
  void *v8;
  UITargetedDragPreview *v9;
  id v10;
  UIDragPreviewParameters *v11;
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
  UIDragPreviewParameters *v23;
  UITargetedDragPreview *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = target;
  +[UIURLDragPreviewView viewWithTitle:URL:](UIURLDragPreviewView, "viewWithTitle:URL:", title, url);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [UITargetedDragPreview alloc];
  v10 = v8;
  v11 = [UIDragPreviewParameters alloc];
  v12 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v10, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v12, "valueWithCGRect:", v14, v16, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIPreviewParameters initWithTextLineRects:](v11, "initWithTextLineRects:", v22);

  v24 = -[UITargetedDragPreview initWithView:parameters:target:](v9, "initWithView:parameters:target:", v10, v23, v7);
  return v24;
}

@end
