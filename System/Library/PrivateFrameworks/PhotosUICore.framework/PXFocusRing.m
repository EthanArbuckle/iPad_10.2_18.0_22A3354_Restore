@implementation PXFocusRing

- (PXFocusRing)initWithFrame:(CGRect)a3
{
  PXFocusRing *v3;
  PXFocusRing *v4;
  uint64_t v5;
  CALayer *focusLayer;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXFocusRing;
  v3 = -[PXFocusRing initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXFocusRing setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v5 = objc_claimAutoreleasedReturnValue();
    focusLayer = v4->_focusLayer;
    v4->_focusLayer = (CALayer *)v5;

    -[PXFocusRing layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v4->_focusLayer);

  }
  return v4;
}

- (void)_updateColors
{
  void *v3;
  _QWORD v4[5];

  -[PXFocusRing traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PXFocusRing__updateColors__block_invoke;
  v4[3] = &unk_1E5149198;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

- (void)_updateWithView:(id)a3 focusRect:(CGRect)a4 cornerRadius:(double)a5 innerBorderWidth:(double)a6 outerBorderWidth:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v15;
  CALayer *innerLayer;
  CALayer *v17;
  CALayer *v18;
  double v19;
  void *v20;
  CALayer *outerLayer;
  CALayer *v22;
  CALayer *v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25 = a3;
  -[PXFocusRing superview](self, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_23;
  objc_msgSend(v25, "bounds");
  objc_msgSend(v15, "convertRect:fromView:", v25);
  -[PXFocusRing setFrame:](self, "setFrame:");
  -[CALayer setFrame:](self->_focusLayer, "setFrame:", x, y, width, height);
  -[CALayer setBorderWidth:](self->_focusLayer, "setBorderWidth:", 3.0);
  -[CALayer setCornerRadius:](self->_focusLayer, "setCornerRadius:", a5);
  innerLayer = self->_innerLayer;
  if (a6 > 0.0 && !innerLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v17 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v18 = self->_innerLayer;
    self->_innerLayer = v17;

    -[CALayer setBorderWidth:](self->_innerLayer, "setBorderWidth:", 1.0);
    v19 = a5 + -3.0;
    if (a5 + -3.0 < 0.0)
      v19 = 0.0;
    -[CALayer setCornerRadius:](self->_innerLayer, "setCornerRadius:", v19);
    -[PXFocusRing layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", self->_innerLayer);
    goto LABEL_10;
  }
  if (a6 <= 0.0 && innerLayer)
  {
    -[CALayer removeFromSuperlayer](innerLayer, "removeFromSuperlayer");
    v20 = self->_innerLayer;
    self->_innerLayer = 0;
LABEL_10:

    innerLayer = self->_innerLayer;
  }
  if (innerLayer)
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectInset(v26, 3.0, 3.0);
    -[CALayer setFrame:](self->_innerLayer, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  }
  outerLayer = self->_outerLayer;
  if (a7 <= 0.0 || outerLayer)
  {
    if (a7 > 0.0 || !outerLayer)
      goto LABEL_20;
    -[CALayer removeFromSuperlayer](outerLayer, "removeFromSuperlayer");
    v24 = self->_outerLayer;
    self->_outerLayer = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v22 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v23 = self->_outerLayer;
    self->_outerLayer = v22;

    -[CALayer setBorderWidth:](self->_outerLayer, "setBorderWidth:", 1.0);
    -[CALayer setCornerRadius:](self->_outerLayer, "setCornerRadius:", a5 + 1.0);
    -[PXFocusRing layer](self, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", self->_outerLayer);
  }

  outerLayer = self->_outerLayer;
LABEL_20:
  if (outerLayer)
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v29 = CGRectInset(v28, -1.0, -1.0);
    -[CALayer setFrame:](self->_outerLayer, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  }
  -[PXFocusRing _updateColors](self, "_updateColors");
LABEL_23:

}

- (void)_updateWithView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");

  objc_msgSend(v5, "bounds");
  -[PXFocusRing _updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:](self, "_updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:", v5);

}

- (void)_updateWithInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend(v4, "cornerRadius");
  v6 = v5 + 4.0;
  v7 = 0.0;
  if (v6 >= 0.0)
    v8 = v6;
  else
    v8 = 0.0;
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v17 = CGRectInset(v16, -4.0, -4.0);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;

  if (objc_msgSend(v4, "wantsInnerBorder"))
    v14 = 1.0;
  else
    v14 = 0.0;
  if (objc_msgSend(v4, "wantsOuterBorder"))
    v7 = 1.0;
  objc_msgSend(v4, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PXFocusRing _updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:](self, "_updateWithView:focusRect:cornerRadius:innerBorderWidth:outerBorderWidth:", v15, x, y, width, height, v8, v14, v7);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[PXFocusRing traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXFocusRing _updateColors](self, "_updateColors");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerLayer, 0);
  objc_storeStrong((id *)&self->_focusLayer, 0);
  objc_storeStrong((id *)&self->_outerLayer, 0);
}

void __28__PXFocusRing__updateColors__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setBorderColor:", objc_msgSend(v2, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setBorderColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setBorderColor:", objc_msgSend(v4, "CGColor"));

}

+ (void)updateView:(id)a3 infoProviderBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXFocusRing *v17;
  int v18;
  int v19;
  PXFocusRing *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v21, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = v13;
    else
      v14 = v21;
    v12 = v14;

  }
  NSStringFromClass((Class)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  objc_msgSend(v12, "viewWithTag:", v16);
  v17 = (PXFocusRing *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v21, "isFocused");
  v19 = v18;
  if (!v17 && v18)
  {
    v20 = [PXFocusRing alloc];
    objc_msgSend(v21, "bounds");
    v17 = -[PXFocusRing initWithFrame:](v20, "initWithFrame:");
    -[PXFocusRing setTag:](v17, "setTag:", v16);
  }
  if (v19)
  {
    objc_msgSend(v12, "addSubview:", v17);
    if (v8)
      -[PXFocusRing _updateWithInfo:](v17, "_updateWithInfo:", v8);
    else
      -[PXFocusRing _updateWithView:](v17, "_updateWithView:", v21);
  }
  else
  {
    -[PXFocusRing removeFromSuperview](v17, "removeFromSuperview");
  }

}

@end
