@implementation SXClippingLayer

- (void)layoutSublayers
{
  unint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXClippingLayer;
  -[SXClippingLayer layoutSublayers](&v4, sel_layoutSublayers);
  v3 = -[SXClippingLayer clippingMode](self, "clippingMode");
  if (v3 == 1)
  {
    -[SXClippingLayer layoutForContentsRect](self, "layoutForContentsRect");
  }
  else if (!v3)
  {
    -[SXClippingLayer layoutForMasking](self, "layoutForMasking");
  }
}

- (void)layoutForContentsRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  double MinY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double MidY;
  double MidX;
  double v40;
  double v41;
  id v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  -[SXClippingLayer contentFrame](self, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXClippingLayer bounds](self, "bounds");
  v57.origin.x = v11;
  v57.origin.y = v12;
  v57.size.width = v13;
  v57.size.height = v14;
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  v44 = CGRectIntersection(v43, v57);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;
  MidX = CGRectGetMidX(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MidY = CGRectGetMidY(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v40 = CGRectGetWidth(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v19 = CGRectGetHeight(v47);
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  if (CGRectIsEmpty(v48))
  {
    v20 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
    v23 = 0.0;
  }
  else
  {
    v49.origin.x = v4;
    v49.origin.y = v6;
    v49.size.width = v8;
    v49.size.height = v10;
    MinX = CGRectGetMinX(v49);
    v25 = -fmin(MinX, 0.0);
    v41 = v19;
    if (MinX >= 0.0)
      v26 = 0.0;
    else
      v26 = v25;
    v50.origin.x = v4;
    v50.origin.y = v6;
    v50.size.width = v8;
    v50.size.height = v10;
    v37 = v26 / CGRectGetWidth(v50);
    v51.origin.x = v4;
    v51.origin.y = v6;
    v51.size.width = v8;
    v51.size.height = v10;
    MinY = CGRectGetMinY(v51);
    v28 = -fmin(MinY, 0.0);
    if (MinY >= 0.0)
      v29 = 0.0;
    else
      v29 = v28;
    v52.origin.x = v4;
    v52.origin.y = v6;
    v52.size.width = v8;
    v52.size.height = v10;
    v36 = v29 / CGRectGetHeight(v52);
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    v53.size.height = v41;
    v53.size.width = v40;
    v30 = CGRectGetWidth(v53);
    v54.origin.x = v4;
    v54.origin.y = v6;
    v54.size.width = v8;
    v54.size.height = v10;
    v31 = v30 / CGRectGetWidth(v54);
    v55.origin.x = 0.0;
    v55.origin.y = 0.0;
    v55.size.width = v40;
    v19 = v41;
    v55.size.height = v41;
    v32 = CGRectGetHeight(v55);
    v56.origin.x = v4;
    v56.origin.y = v6;
    v56.size.width = v8;
    v56.size.height = v10;
    v33 = v32 / CGRectGetHeight(v56);
    v23 = v37;
    if (v31 >= 1.0 - v37)
      v21 = 1.0 - v37;
    else
      v21 = v31;
    v22 = v36;
    if (v33 >= 1.0 - v36)
      v20 = 1.0 - v36;
    else
      v20 = v33;
  }
  -[SXClippingLayer contentLayer](self, "contentLayer", *(_QWORD *)&v36);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[SXClippingLayer contentLayer](self, "contentLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPosition:", MidX, MidY);

  -[SXClippingLayer contentLayer](self, "contentLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBounds:", 0.0, 0.0, v40, v19);

  objc_msgSend(v42, "setContentsRect:", v23, v22, v21, v20);
}

- (void)layoutForMasking
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[SXClippingLayer contentFrame](self, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXClippingLayer contentLayer](self, "contentLayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrameUsingCenterAndBounds:", v4, v6, v8, v10);

}

- (void)setContentLayer:(id)a3
{
  CALayer *v4;
  CALayer *contentLayer;
  CALayer *v6;
  CALayer *v7;

  v4 = (CALayer *)a3;
  contentLayer = self->_contentLayer;
  if (contentLayer != v4)
    -[CALayer removeFromSuperlayer](contentLayer, "removeFromSuperlayer");
  v6 = self->_contentLayer;
  self->_contentLayer = v4;
  v7 = v4;

  -[SXClippingLayer addSublayer:](self, "addSublayer:", self->_contentLayer);
  -[SXClippingLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
  -[SXClippingLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setClippingMode:(unint64_t)a3
{
  self->_clippingMode = a3;
  -[SXClippingLayer setMasksToBounds:](self, "setMasksToBounds:", a3 == 0);
  -[SXClippingLayer setNeedsLayout](self, "setNeedsLayout");
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (unint64_t)clippingMode
{
  return self->_clippingMode;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end
