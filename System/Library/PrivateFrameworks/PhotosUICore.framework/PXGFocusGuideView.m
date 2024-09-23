@implementation PXGFocusGuideView

- (PXGFocusGuideView)initWithFrame:(CGRect)a3
{
  PXGFocusGuideView *v3;
  UIFocusGuide *v4;
  UIFocusGuide *focusGuide;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *constraints;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PXGFocusGuideView;
  v3 = -[PXGFocusGuideView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E0DC37D0]);
    focusGuide = v3->_focusGuide;
    v3->_focusGuide = v4;

    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide setIdentifier:](v3->_focusGuide, "setIdentifier:", v7);

    -[UIFocusGuide leadingAnchor](v3->_focusGuide, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGFocusGuideView leadingAnchor](v3, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[UIFocusGuide widthAnchor](v3->_focusGuide, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGFocusGuideView widthAnchor](v3, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    -[UIFocusGuide topAnchor](v3->_focusGuide, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGFocusGuideView topAnchor](v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v13;
    -[UIFocusGuide heightAnchor](v3->_focusGuide, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGFocusGuideView heightAnchor](v3, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v17 = objc_claimAutoreleasedReturnValue();
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v17;

  }
  return v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (void)willMoveToSuperview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGFocusGuideView;
  -[PXGFocusGuideView willMoveToSuperview:](&v5, sel_willMoveToSuperview_, a3);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  -[PXGFocusGuideView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLayoutGuide:", self->_focusGuide);

}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PXGFocusGuideView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXGFocusGuideView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addLayoutGuide:", self->_focusGuide);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXGFocusGuideView;
  -[PXGFocusGuideView didMoveToSuperview](&v5, sel_didMoveToSuperview);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGFocusGuideView;
  -[PXGFocusGuideView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXGFocusGuideView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFocusEnvironments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusGuide setPreferredFocusEnvironments:](self->_focusGuide, "setPreferredFocusEnvironments:", v4);

}

- (void)setUserData:(id)a3
{
  PXGFocusGuideViewConfiguration *v5;
  PXGFocusGuideViewConfiguration *v6;
  BOOL v7;
  PXGFocusGuideViewConfiguration *v8;

  v8 = (PXGFocusGuideViewConfiguration *)a3;
  v5 = self->_userData;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXGFocusGuideViewConfiguration isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      -[PXGFocusGuideView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)prepareForReuse
{
  -[PXGFocusGuideView setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGFocusGuideViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

@end
