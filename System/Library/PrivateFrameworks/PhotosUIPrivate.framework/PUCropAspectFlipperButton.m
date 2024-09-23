@implementation PUCropAspectFlipperButton

- (PUCropAspectFlipperButton)init
{
  PUCropAspectFlipperButton *v2;
  void *v3;
  id v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PUCropAspectFlipperButton;
  v2 = -[PUCropAspectFlipperButton init](&v6, sel_init);
  if (v2)
  {
    v7[0] = objc_opt_class();
    v7[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)-[PUCropAspectFlipperButton registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v3, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v2;
}

- (void)layoutSubviews
{
  CALayer *v3;
  CALayer *pageLayer;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  CALayer *v10;
  CALayer *selectionCheckboxLayer;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  if (!self->_pageLayer)
  {
    -[PUCropAspectFlipperButton orientation](self, "orientation");
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    pageLayer = self->_pageLayer;
    self->_pageLayer = v3;

    -[CALayer setCornerRadius:](self->_pageLayer, "setCornerRadius:", 4.0);
    PXRectWithCenterAndSize();
    -[CALayer setBounds:](self->_pageLayer, "setBounds:");
    -[PUCropAspectFlipperButton bounds](self, "bounds");
    v6 = v5 * 0.5;
    -[PUCropAspectFlipperButton bounds](self, "bounds");
    -[CALayer setPosition:](self->_pageLayer, "setPosition:", v6, v7 * 0.5);
    -[CALayer setBorderWidth:](self->_pageLayer, "setBorderWidth:", 2.0);
    -[PUCropAspectFlipperButton layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", self->_pageLayer);

  }
  if (!self->_selectionCheckboxLayer)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    selectionCheckboxLayer = self->_selectionCheckboxLayer;
    self->_selectionCheckboxLayer = v10;

    v12 = objc_retainAutorelease(v9);
    -[CALayer setContents:](self->_selectionCheckboxLayer, "setContents:", objc_msgSend(v12, "CGImage"));
    PXRectWithCenterAndSize();
    -[CALayer setBounds:](self->_selectionCheckboxLayer, "setBounds:");

  }
  if (-[PUCropAspectFlipperButton isEnabled](self, "isEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_pageLayer, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_pageLayer, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
  }
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBorderColor:](self->_pageLayer, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  if (-[PUCropAspectFlipperButton isSelected](self, "isSelected")
    && -[PUCropAspectFlipperButton isEnabled](self, "isEnabled"))
  {
    -[CALayer superlayer](self->_selectionCheckboxLayer, "superlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      -[CALayer addSublayer:](self->_pageLayer, "addSublayer:", self->_selectionCheckboxLayer);
  }
  else
  {
    -[CALayer superlayer](self->_selectionCheckboxLayer, "superlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[CALayer removeFromSuperlayer](self->_selectionCheckboxLayer, "removeFromSuperlayer");
  }
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCropAspectFlipperButton;
  -[PUCropAspectFlipperButton setSelected:](&v4, sel_setSelected_, a3);
  -[PUCropAspectFlipperButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCropAspectFlipperButton;
  -[PUCropAspectFlipperButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[PUCropAspectFlipperButton setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionCheckboxLayer, 0);
  objc_storeStrong((id *)&self->_pageLayer, 0);
}

@end
