@implementation _UIDropInteractionHighlightEffect

- (_UIDropInteractionHighlightEffect)init
{
  _UIDropInteractionHighlightEffect *v2;
  _UIDropInteractionHighlightEffect *v3;
  uint64_t v4;
  UIColor *highlightColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDropInteractionHighlightEffect;
  v2 = -[_UIDropInteractionHighlightEffect init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_highlightWidth = xmmword_18667AE90;
    v2->_highlightInset = -3.0;
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v4 = objc_claimAutoreleasedReturnValue();
    highlightColor = v3->_highlightColor;
    v3->_highlightColor = (UIColor *)v4;

  }
  return v3;
}

- (id)updateShapeLayerForFrame:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CAShapeLayer *shapeLayer;
  CAShapeLayer *v32;
  void *v33;
  CAShapeLayer *v34;
  double v35;
  CGFloat v36;
  id v37;
  CAShapeLayer *v38;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "keyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:fromView:", v9, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v12, "convertRect:toView:", v11, v14, v16, v18, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = *MEMORY[0x1E0C9D538];
  v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v32 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setAllowsHitTesting:](v32, "setAllowsHitTesting:", 0);
    -[CAShapeLayer setFillColor:](v32, "setFillColor:", 0);
    objc_msgSend(v11, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSublayer:", v32);

    v34 = self->_shapeLayer;
    self->_shapeLayer = v32;

    shapeLayer = self->_shapeLayer;
  }
  -[CAShapeLayer setLineWidth:](shapeLayer, "setLineWidth:", self->_highlightWidth);
  -[CAShapeLayer setStrokeColor:](self->_shapeLayer, "setStrokeColor:", -[UIColor CGColor](self->_highlightColor, "CGColor"));
  -[CAShapeLayer bounds](self->_shapeLayer, "bounds");
  v43.origin.x = v29;
  v43.origin.y = v30;
  v43.size.width = v26;
  v43.size.height = v28;
  if (!CGRectEqualToRect(v40, v43))
  {
    -[CAShapeLayer lineWidth](self->_shapeLayer, "lineWidth");
    v36 = v35 * 0.5 + -1.0;
    v41.origin.x = v29;
    v41.origin.y = v30;
    v41.size.width = v26;
    v41.size.height = v28;
    v42 = CGRectInset(v41, v36, v36);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height, self->_cornerRadius);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", objc_msgSend(v37, "CGPath"));

  }
  -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:", v22, v24, v26, v28);
  v38 = self->_shapeLayer;

  return v38;
}

- (void)removeShapeLayer
{
  CAShapeLayer *shapeLayer;

  -[CAShapeLayer removeFromSuperlayer](self->_shapeLayer, "removeFromSuperlayer");
  shapeLayer = self->_shapeLayer;
  self->_shapeLayer = 0;

}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  int64_t visualState;
  int64_t v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 IsNull;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v28 = a3;
  v6 = a4;
  visualState = self->_visualState;
  if (visualState != objc_msgSend(v6, "state"))
  {
    v8 = objc_msgSend(v6, "state");
    self->_visualState = v8;
    if (!v8 || v8 == 3)
    {
      -[_UIDropInteractionHighlightEffect removeShapeLayer](self, "removeShapeLayer");
    }
    else if (v8 == 1)
    {
      objc_msgSend(v28, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDropInteractionHighlightEffect highlightRectInView:forDragInteraction:withContext:](self, "highlightRectInView:forDragInteraction:withContext:", v9, v28, v6);
      v30 = CGRectInset(v29, self->_highlightInset - self->_highlightWidth, self->_highlightInset - self->_highlightWidth);
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
      -[_UIDropInteractionHighlightEffect clippingRectInView:forView:](self, "clippingRectInView:forView:", v9, v9);
      v33.origin.x = v14;
      v33.origin.y = v15;
      v33.size.width = v16;
      v33.size.height = v17;
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v32 = CGRectIntersection(v31, v33);
      v18 = v32.origin.x;
      v19 = v32.origin.y;
      v20 = v32.size.width;
      v21 = v32.size.height;
      IsNull = CGRectIsNull(v32);
      if (IsNull)
        v23 = x;
      else
        v23 = v18;
      if (IsNull)
        v24 = y;
      else
        v24 = v19;
      if (IsNull)
        v25 = width;
      else
        v25 = v20;
      if (IsNull)
        v26 = height;
      else
        v26 = v21;
      v27 = -[_UIDropInteractionHighlightEffect updateShapeLayerForFrame:inView:](self, "updateShapeLayerForFrame:inView:", v9, v23, v24, v25, v26);

    }
  }

}

- (CGRect)clippingRectInView:(id)a3 forView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect result;
  CGRect v45;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v7);
  x = v8;
  y = v10;
  width = v12;
  height = v14;
  objc_msgSend(v6, "_viewControllerForAncestor");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    do
    {
      if ((objc_msgSend(v17, "_isHostedRootViewController") & 1) != 0)
        break;
      if (!objc_msgSend(v6, "_isMemberOfViewControllerHierarchy:", v17))
        break;
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safeAreaLayoutGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "layoutFrame");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      objc_msgSend(v19, "owningView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertRect:fromView:", v28, v21, v23, v25, v27);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      v42.origin.x = v30;
      v42.origin.y = v32;
      v42.size.width = v34;
      v42.size.height = v36;
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v43 = CGRectIntersection(v42, v45);
      x = v43.origin.x;
      y = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
      objc_msgSend(v17, "parentViewController");
      v37 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v37;
    }
    while (v37);

  }
  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (CGRect)highlightRectInView:(id)a3 forDragInteraction:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
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
  CGRect result;

  v6 = a3;
  objc_msgSend(a4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "convertRect:fromView:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIDropInteractionHighlightEffect removeShapeLayer](self, "removeShapeLayer");
  v3.receiver = self;
  v3.super_class = (Class)_UIDropInteractionHighlightEffect;
  -[_UIDropInteractionHighlightEffect dealloc](&v3, sel_dealloc);
}

- (double)highlightWidth
{
  return self->_highlightWidth;
}

- (void)setHighlightWidth:(double)a3
{
  self->_highlightWidth = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)highlightInset
{
  return self->_highlightInset;
}

- (void)setHighlightInset:(double)a3
{
  self->_highlightInset = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end
