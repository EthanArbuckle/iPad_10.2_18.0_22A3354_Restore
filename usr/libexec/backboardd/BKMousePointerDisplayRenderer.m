@implementation BKMousePointerDisplayRenderer

- (BKMousePointerDisplayRenderer)initWithDisplayName:(id)a3
{
  id v4;
  BKMousePointerDisplayRenderer *v5;
  NSString *v6;
  NSString *displayName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMousePointerDisplayRenderer;
  v5 = -[BKMousePointerDisplayRenderer init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    displayName = v5->_displayName;
    v5->_displayName = v6;

  }
  return v5;
}

- (void)invalidate
{
  -[CAContext invalidate](self->_context, "invalidate");
}

- (void)setPointerLayer:(id)a3
{
  CALayer *v5;
  CALayer *pointerLayer;
  CALayer **p_pointerLayer;
  CALayer *v8;
  CALayer *transformLayer;
  CALayer *v10;

  v5 = (CALayer *)a3;
  p_pointerLayer = &self->_pointerLayer;
  pointerLayer = self->_pointerLayer;
  v10 = v5;
  if (pointerLayer != v5)
  {
    if (pointerLayer)
    {
      v8 = (CALayer *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](pointerLayer, "superlayer"));
      transformLayer = self->_transformLayer;

      if (v8 == transformLayer)
        -[CALayer removeFromSuperlayer](*p_pointerLayer, "removeFromSuperlayer");
    }
    objc_storeStrong((id *)&self->_pointerLayer, a3);
    if (*p_pointerLayer)
    {
      -[CALayer addSublayer:](self->_transformLayer, "addSublayer:");
      -[CALayer setPosition:](self->_pointerLayer, "setPosition:", self->_pointerPosition.x, self->_pointerPosition.y);
    }
  }

}

- (void)setPointerPosition:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if ((BSPointEqualToPoint(self->_pointerPosition.x, self->_pointerPosition.y, a3.x, a3.y) & 1) == 0)
  {
    self->_pointerPosition.x = x;
    self->_pointerPosition.y = y;
    -[CALayer setPosition:](self->_pointerLayer, "setPosition:", x, y);
  }
}

- (void)setRootLayerProperties:(BKMousePointerDisplayRendererRootLayerProperties *)a3
{
  __int128 v5;
  __int128 v6;
  BKMousePointerDisplayRendererRootLayerProperties *p_rootLayerProperties;
  int v8;
  __int128 v9;
  CGPoint origin;
  CGSize size;
  __int128 v12;
  int v13;
  CAContext *context;
  CALayer *v15;
  CALayer *rootLayer;
  CAContext *v17;
  NSString *displayName;
  void *v19;
  CAContext *v20;
  CAContext *v21;
  double v22;
  CALayer *v23;
  __int128 v24;
  __int128 v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CALayer *v30;
  double MidX;
  CGAffineTransform v32;
  CGAffineTransform t1;
  _QWORD v34[4];
  _QWORD v35[4];
  CGRect bounds;
  CGRect v37;
  CGRect v38;

  v5 = *(_OWORD *)&self->_rootLayerProperties.affineTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_rootLayerProperties.affineTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx;
  v6 = *(_OWORD *)&a3->affineTransform.c;
  *(_OWORD *)&v32.a = *(_OWORD *)&a3->affineTransform.a;
  *(_OWORD *)&v32.c = v6;
  *(_OWORD *)&v32.tx = *(_OWORD *)&a3->affineTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v32)
    || !BSRectEqualToRect(self->_rootLayerProperties.bounds.origin.x, self->_rootLayerProperties.bounds.origin.y, self->_rootLayerProperties.bounds.size.width, self->_rootLayerProperties.bounds.size.height, a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height)|| (BSFloatEqualToFloat(self->_rootLayerProperties.displayScale, a3->displayScale) & 1) == 0)
  {
    p_rootLayerProperties = &self->_rootLayerProperties;
    if ((BSFloatEqualToFloat(self->_rootLayerProperties.displayScale, 2.0) & 1) != 0)
      v8 = 1;
    else
      v8 = BSFloatEqualToFloat(self->_rootLayerProperties.displayScale, 2.0);
    v9 = *(_OWORD *)&a3->affineTransform.tx;
    origin = a3->bounds.origin;
    size = a3->bounds.size;
    self->_rootLayerProperties.displayScale = a3->displayScale;
    v12 = *(_OWORD *)&a3->affineTransform.c;
    *(_OWORD *)&p_rootLayerProperties->affineTransform.a = *(_OWORD *)&a3->affineTransform.a;
    *(_OWORD *)&self->_rootLayerProperties.affineTransform.c = v12;
    self->_rootLayerProperties.bounds.origin = origin;
    self->_rootLayerProperties.bounds.size = size;
    *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx = v9;
    if ((BSFloatEqualToFloat(self->_rootLayerProperties.displayScale, 2.0) & 1) != 0)
      v13 = 1;
    else
      v13 = BSFloatEqualToFloat(self->_rootLayerProperties.displayScale, 2.0);
    if (v13 != v8)
    {
      -[CAContext setLayer:](self->_context, "setLayer:", 0);
      -[CAContext invalidate](self->_context, "invalidate");
      context = self->_context;
      self->_context = 0;

    }
    if (!CGRectIsEmpty(self->_rootLayerProperties.bounds)
      && BSFloatGreaterThanFloat(self->_rootLayerProperties.displayScale, 0.0))
    {
      if (!self->_rootLayer)
      {
        v15 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
        rootLayer = self->_rootLayer;
        self->_rootLayer = v15;

      }
      if (self->_transformLayer)
        -[CALayer addSublayer:](self->_rootLayer, "addSublayer:");
      v17 = self->_context;
      if (!v17)
      {
        v34[0] = kCAContextDisplayable;
        v34[1] = kCAContextDisplayName;
        displayName = self->_displayName;
        v35[0] = &__kCFBooleanTrue;
        v35[1] = displayName;
        v34[2] = kCAContextIgnoresHitTest;
        v34[3] = kCAContextSecure;
        v35[2] = &__kCFBooleanTrue;
        v35[3] = &__kCFBooleanTrue;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 4));
        v20 = (CAContext *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v19));
        v21 = self->_context;
        self->_context = v20;

        LODWORD(v22) = 1173553152;
        -[CAContext setLevel:](self->_context, "setLevel:", v22);
        -[CAContext setSecure:](self->_context, "setSecure:", 1);

        v17 = self->_context;
      }
      -[CAContext setLayer:](v17, "setLayer:", self->_rootLayer);
    }
    v23 = self->_rootLayer;
    v24 = *(_OWORD *)&self->_rootLayerProperties.affineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_rootLayerProperties->affineTransform.a;
    *(_OWORD *)&t1.c = v24;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx;
    -[CALayer setAffineTransform:](v23, "setAffineTransform:", &t1);
    -[CALayer setRasterizationScale:](self->_rootLayer, "setRasterizationScale:", self->_rootLayerProperties.displayScale);
    -[CALayer setBounds:](self->_rootLayer, "setBounds:", self->_rootLayerProperties.bounds.origin.x, self->_rootLayerProperties.bounds.origin.y, self->_rootLayerProperties.bounds.size.width, self->_rootLayerProperties.bounds.size.height);
    bounds = self->_rootLayerProperties.bounds;
    v25 = *(_OWORD *)&self->_rootLayerProperties.affineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_rootLayerProperties->affineTransform.a;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx;
    v37 = CGRectApplyAffineTransform(bounds, &t1);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    v30 = self->_rootLayer;
    MidX = CGRectGetMidX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    -[CALayer setPosition:](v30, "setPosition:", MidX, CGRectGetMidY(v38));
    -[BKMousePointerDisplayRenderer _updateTransformLayerPosition](self, "_updateTransformLayerPosition");
  }
}

- (void)setTransformLayerProperties:(BKMousePointerDisplayRendererTransformLayerProperties *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize size;
  __int128 v10;
  CALayer *v11;
  CALayer *transformLayer;
  CALayer *rootLayer;
  CALayer *v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform t1;

  v5 = *(_OWORD *)&self->_transformLayerProperties.affineTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transformLayerProperties.affineTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transformLayerProperties.affineTransform.tx;
  v6 = *(_OWORD *)&a3->affineTransform.c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a3->affineTransform.a;
  *(_OWORD *)&v16.c = v6;
  *(_OWORD *)&v16.tx = *(_OWORD *)&a3->affineTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v16)
    || (BSRectEqualToRect(self->_transformLayerProperties.bounds.origin.x, self->_transformLayerProperties.bounds.origin.y, self->_transformLayerProperties.bounds.size.width, self->_transformLayerProperties.bounds.size.height, a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height) & 1) == 0)
  {
    v7 = *(_OWORD *)&a3->affineTransform.c;
    v8 = *(_OWORD *)&a3->affineTransform.tx;
    size = a3->bounds.size;
    self->_transformLayerProperties.bounds.origin = a3->bounds.origin;
    self->_transformLayerProperties.bounds.size = size;
    v10 = *(_OWORD *)&a3->affineTransform.a;
    *(_OWORD *)&self->_transformLayerProperties.affineTransform.c = v7;
    *(_OWORD *)&self->_transformLayerProperties.affineTransform.tx = v8;
    *(_OWORD *)&self->_transformLayerProperties.affineTransform.a = v10;
    *(CGFloat *)&v7 = self->_transformLayerProperties.bounds.origin.x;
    *(CGFloat *)&v8 = self->_transformLayerProperties.bounds.origin.y;
    *(CGFloat *)&v10 = self->_transformLayerProperties.bounds.size.width;
    size.width = self->_transformLayerProperties.bounds.size.height;
    if (!CGRectIsEmpty(*(CGRect *)&v7) && !self->_transformLayer)
    {
      v11 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      transformLayer = self->_transformLayer;
      self->_transformLayer = v11;

      if (self->_pointerLayer)
        -[CALayer addSublayer:](self->_transformLayer, "addSublayer:");
      rootLayer = self->_rootLayer;
      if (rootLayer)
        -[CALayer addSublayer:](rootLayer, "addSublayer:", self->_transformLayer);
    }
    -[CALayer setBounds:](self->_transformLayer, "setBounds:", self->_transformLayerProperties.bounds.origin.x, self->_transformLayerProperties.bounds.origin.y, self->_transformLayerProperties.bounds.size.width, self->_transformLayerProperties.bounds.size.height);
    v14 = self->_transformLayer;
    v15 = *(_OWORD *)&self->_transformLayerProperties.affineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_transformLayerProperties.affineTransform.a;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transformLayerProperties.affineTransform.tx;
    -[CALayer setAffineTransform:](v14, "setAffineTransform:", &t1);
    -[BKMousePointerDisplayRenderer _updateTransformLayerPosition](self, "_updateTransformLayerPosition");
  }
}

- (void)_updateTransformLayerPosition
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

  -[CALayer bounds](self->_rootLayer, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CALayer anchorPoint](self->_rootLayer, "anchorPoint");
  -[CALayer setPosition:](self->_transformLayer, "setPosition:", v4 + v11 * v8, v6 + v12 * v10);
}

- (CALayer)pointerLayer
{
  return self->_pointerLayer;
}

- (CGPoint)pointerPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_pointerPosition.x;
  y = self->_pointerPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BKMousePointerDisplayRendererRootLayerProperties)rootLayerProperties
{
  CGPoint v3;
  __int128 v4;

  v3 = *(CGPoint *)&self[2].affineTransform.c;
  *(_OWORD *)&retstr->affineTransform.tx = *(_OWORD *)&self[2].affineTransform.a;
  retstr->bounds.origin = v3;
  retstr->bounds.size = *(CGSize *)&self[2].affineTransform.tx;
  retstr->displayScale = self[2].bounds.origin.x;
  v4 = *(_OWORD *)&self[1].bounds.size.height;
  *(_OWORD *)&retstr->affineTransform.a = *(_OWORD *)&self[1].bounds.origin.y;
  *(_OWORD *)&retstr->affineTransform.c = v4;
  return self;
}

- (BKMousePointerDisplayRendererTransformLayerProperties)transformLayerProperties
{
  CGPoint v3;
  __int128 v4;

  v3 = *(CGPoint *)&self[1].affineTransform.tx;
  *(_OWORD *)&retstr->affineTransform.tx = *(_OWORD *)&self[1].affineTransform.c;
  retstr->bounds.origin = v3;
  retstr->bounds.size = (CGSize)self[1].bounds.origin;
  v4 = *(_OWORD *)&self[1].affineTransform.a;
  *(CGSize *)&retstr->affineTransform.a = self->bounds.size;
  *(_OWORD *)&retstr->affineTransform.c = v4;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BKMousePointerDisplayRendererRootLayerProperties)rootLayerPropertiesForDisplay:(SEL)a3 displayController:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BKMousePointerDisplayRendererRootLayerProperties *result;
  __int128 v13;
  __int128 v14;

  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueId"));
  if (v7)
  {
    objc_msgSend(v7, "geometryForDisplayUUID:", v8);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }

  v9 = *(double *)&v13;
  v10 = *(double *)&v14;
  if (BSFloatLessThanOrEqualToFloat(*(double *)&v14, 0.0))
    v10 = 1.0;
  if ((BYTE8(v14) & 0xFD) == 1)
    v11 = *((double *)&v13 + 1);
  else
    v11 = *(double *)&v13;
  if ((BYTE8(v14) & 0xFD) != 1)
    v9 = *((double *)&v13 + 1);
  CGAffineTransformMakeScale(&retstr->affineTransform, v10, v10);
  retstr->bounds.origin.x = 0.0;
  retstr->bounds.origin.y = 0.0;
  retstr->bounds.size.width = v11 / v10;
  retstr->bounds.size.height = v9 / v10;
  retstr->displayScale = v10;

  return result;
}

@end
