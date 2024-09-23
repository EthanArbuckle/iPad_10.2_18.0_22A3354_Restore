@implementation VKQuadHighlightView

- (VKQuadHighlightView)initWithFrame:(CGRect)a3
{
  VKQuadHighlightView *v3;
  uint64_t v4;
  CAShapeLayer *shadowLayerMaskLayer;
  id v6;
  uint64_t v7;
  CAShapeLayer *shadowLayer;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  CAShapeLayer *highlightLayer;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VKQuadHighlightView;
  v3 = -[VKQuadHighlightView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    shadowLayerMaskLayer = v3->_shadowLayerMaskLayer;
    v3->_shadowLayerMaskLayer = (CAShapeLayer *)v4;

    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_shadowLayerMaskLayer, "setFillColor:", objc_msgSend(v6, "CGColor"));

    -[CAShapeLayer setFillRule:](v3->_shadowLayerMaskLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v7 = objc_claimAutoreleasedReturnValue();
    shadowLayer = v3->_shadowLayer;
    v3->_shadowLayer = (CAShapeLayer *)v7;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_shadowLayer, "setFillColor:", objc_msgSend(v9, "CGColor"));

    -[CAShapeLayer setShadowRadius:](v3->_shadowLayer, "setShadowRadius:", 3.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setShadowColor:](v3->_shadowLayer, "setShadowColor:", objc_msgSend(v10, "CGColor"));

    LODWORD(v11) = 0.5;
    -[CAShapeLayer setShadowOpacity:](v3->_shadowLayer, "setShadowOpacity:", v11);
    -[CAShapeLayer setShadowOffset:](v3->_shadowLayer, "setShadowOffset:", 2.0, 2.0);
    -[CAShapeLayer setMask:](v3->_shadowLayer, "setMask:", v3->_shadowLayerMaskLayer);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v12 = objc_claimAutoreleasedReturnValue();
    highlightLayer = v3->_highlightLayer;
    v3->_highlightLayer = (CAShapeLayer *)v12;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.2);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_highlightLayer, "setFillColor:", objc_msgSend(v15, "CGColor"));

    -[VKQuadHighlightView layer](v3, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v3->_shadowLayer);

    -[VKQuadHighlightView layer](v3, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v3->_highlightLayer);

  }
  return v3;
}

- (void)setQuad:(id)a3
{
  id v5;
  VKPointAnimatableProperty *v6;
  VKPointAnimatableProperty *topLeft;
  VKPointAnimatableProperty *v8;
  VKPointAnimatableProperty *topRight;
  VKPointAnimatableProperty *v10;
  VKPointAnimatableProperty *bottomRight;
  VKPointAnimatableProperty *v12;
  VKPointAnimatableProperty *bottomLeft;
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
  _QWORD v24[5];
  _QWORD v25[9];

  v25[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_quad, a3);
  if (self->_topLeft)
  {
    objc_msgSend(v5, "topLeft");
    -[VKPointAnimatableProperty setValue:](self->_topLeft, "setValue:");
    objc_msgSend(v5, "topRight");
    -[VKPointAnimatableProperty setValue:](self->_topRight, "setValue:");
    objc_msgSend(v5, "bottomRight");
    -[VKPointAnimatableProperty setValue:](self->_bottomRight, "setValue:");
    objc_msgSend(v5, "bottomLeft");
    -[VKPointAnimatableProperty setValue:](self->_bottomLeft, "setValue:");
    -[VKQuadHighlightView _drawHighlight](self, "_drawHighlight");
  }
  else
  {
    v6 = objc_alloc_init(VKPointAnimatableProperty);
    topLeft = self->_topLeft;
    self->_topLeft = v6;

    v8 = objc_alloc_init(VKPointAnimatableProperty);
    topRight = self->_topRight;
    self->_topRight = v8;

    v10 = objc_alloc_init(VKPointAnimatableProperty);
    bottomRight = self->_bottomRight;
    self->_bottomRight = v10;

    v12 = objc_alloc_init(VKPointAnimatableProperty);
    bottomLeft = self->_bottomLeft;
    self->_bottomLeft = v12;

    objc_msgSend(v5, "topLeft");
    -[VKPointAnimatableProperty setValue:](self->_topLeft, "setValue:");
    objc_msgSend(v5, "topRight");
    -[VKPointAnimatableProperty setValue:](self->_topRight, "setValue:");
    objc_msgSend(v5, "bottomRight");
    -[VKPointAnimatableProperty setValue:](self->_bottomRight, "setValue:");
    objc_msgSend(v5, "bottomLeft");
    -[VKPointAnimatableProperty setValue:](self->_bottomLeft, "setValue:");
    v22 = (void *)MEMORY[0x1E0CEABB0];
    -[VKPointAnimatableProperty x](self->_topLeft, "x");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v23;
    -[VKPointAnimatableProperty y](self->_topLeft, "y");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    -[VKPointAnimatableProperty x](self->_topRight, "x");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v15;
    -[VKPointAnimatableProperty y](self->_topRight, "y");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v16;
    -[VKPointAnimatableProperty x](self->_bottomLeft, "x");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v17;
    -[VKPointAnimatableProperty y](self->_bottomLeft, "y");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[5] = v18;
    -[VKPointAnimatableProperty x](self->_bottomRight, "x");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[6] = v19;
    -[VKPointAnimatableProperty y](self->_bottomRight, "y");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[7] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __31__VKQuadHighlightView_setQuad___block_invoke;
    v24[3] = &unk_1E94625B8;
    v24[4] = self;
    objc_msgSend(v22, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v21, v24);

  }
}

uint64_t __31__VKQuadHighlightView_setQuad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawHighlight");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VKQuadHighlightView;
  -[VKQuadHighlightView layoutSubviews](&v12, sel_layoutSubviews);
  -[VKQuadHighlightView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CAShapeLayer setFrame:](self->_shadowLayer, "setFrame:", v5, v7, v9, v11);
  -[CAShapeLayer setFrame:](self->_highlightLayer, "setFrame:", v5, v7, v9, v11);
  -[CAShapeLayer setFrame:](self->_shadowLayerMaskLayer, "setFrame:", v5, v7, v9, v11);
}

- (void)animateToQuad:(id)a3
{
  -[VKQuadHighlightView setQuad:](self, "setQuad:", a3);
  -[VKQuadHighlightView _drawHighlight](self, "_drawHighlight");
}

- (void)_drawHighlight
{
  VKQuad *v3;
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
  double v16;
  double v17;
  VKQuad *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = [VKQuad alloc];
  -[VKPointAnimatableProperty presentationValue](self->_topLeft, "presentationValue");
  v5 = v4;
  v7 = v6;
  -[VKPointAnimatableProperty presentationValue](self->_topRight, "presentationValue");
  v9 = v8;
  v11 = v10;
  -[VKPointAnimatableProperty presentationValue](self->_bottomLeft, "presentationValue");
  v13 = v12;
  v15 = v14;
  -[VKPointAnimatableProperty presentationValue](self->_bottomRight, "presentationValue");
  v18 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:](v3, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v5, v7, v9, v11, v13, v15, v16, v17);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nativeScale");
  v21 = v20;
  objc_msgSend(v19, "scale");
  v22 = (void *)MEMORY[0x1E0CEA390];
  v24 = v21 / v23;
  -[VKQuad path](v18, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "vk_groupAndRoundPaths:radius:offset:", v26, 4.0 / v24, 4.0 / v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_retainAutorelease(v27);
  -[CAShapeLayer setPath:](self->_shadowLayer, "setPath:", objc_msgSend(v28, "CGPath"));
  v29 = objc_retainAutorelease(v28);
  -[CAShapeLayer setPath:](self->_highlightLayer, "setPath:", objc_msgSend(v29, "CGPath"));
  v30 = (void *)MEMORY[0x1E0CEA390];
  -[VKQuadHighlightView bounds](self, "bounds");
  objc_msgSend(v30, "bezierPathWithRect:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendPath:", v29);
  objc_msgSend(v31, "setUsesEvenOddFillRule:", 1);
  v32 = objc_retainAutorelease(v31);
  -[CAShapeLayer setPath:](self->_shadowLayerMaskLayer, "setPath:", objc_msgSend(v32, "CGPath"));

}

- (VKQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayerMaskLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_bottomLeft, 0);
  objc_storeStrong((id *)&self->_bottomRight, 0);
  objc_storeStrong((id *)&self->_topRight, 0);
  objc_storeStrong((id *)&self->_topLeft, 0);
}

@end
