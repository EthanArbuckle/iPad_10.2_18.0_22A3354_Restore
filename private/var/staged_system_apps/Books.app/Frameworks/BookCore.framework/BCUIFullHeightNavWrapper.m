@implementation BCUIFullHeightNavWrapper

- (BCUIFullHeightNavWrapper)initWithView:(id)a3
{
  id v4;
  BCUIFullHeightNavWrapper *v5;
  UIPointerInteraction *v6;
  UIPointerInteraction *pointerInteraction;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *heightConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[4];

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BCUIFullHeightNavWrapper;
  v5 = -[BCUIFullHeightNavWrapper initWithFrame:](&v22, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (UIPointerInteraction *)objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", v5);
    pointerInteraction = v5->_pointerInteraction;
    v5->_pointerInteraction = v6;

    -[BCUIFullHeightNavWrapper addInteraction:](v5, "addInteraction:", v5->_pointerInteraction);
    -[BCUIFullHeightNavWrapper addSubview:](v5, "addSubview:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper heightAnchor](v5, "heightAnchor"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 44.0));
    heightConstraint = v5->_heightConstraint;
    v5->_heightConstraint = (NSLayoutConstraint *)v9;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper widthAnchor](v5, "widthAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:multiplier:constant:", v20, 1.0, 0.0));
    v23[0] = v11;
    v23[1] = v5->_heightConstraint;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper centerYAnchor](v5, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v23[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper leadingAnchor](v5, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v23[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  return v5;
}

- (void)didMoveToSuperview
{
  NSLayoutConstraint *heightConstraint;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *v9;
  void *v10;
  NSLayoutConstraint *v11;

  if (self->_heightConstraint)
  {
    -[BCUIFullHeightNavWrapper removeConstraint:](self, "removeConstraint:");
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = 0;

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper superview](self, "superview"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper heightAnchor](self, "heightAnchor"));
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:multiplier:", v7, 1.0));
    v9 = self->_heightConstraint;
    self->_heightConstraint = v8;

    v11 = self->_heightConstraint;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id *v6;
  void *v7;
  const UIEdgeInsets *p_cursorInsets;
  double left;
  double top;
  double right;
  double bottom;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  v5 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", self);
  if (self->_lift)
    v6 = (id *)UIPointerLiftEffect_ptr;
  else
    v6 = (id *)UIPointerHighlightEffect_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "effectWithPreview:", v5));
  if (self->_lift)
    p_cursorInsets = &UIEdgeInsetsZero;
  else
    p_cursorInsets = &self->_cursorInsets;
  top = p_cursorInsets->top;
  left = p_cursorInsets->left;
  bottom = p_cursorInsets->bottom;
  right = p_cursorInsets->right;
  -[BCUIFullHeightNavWrapper bounds](self, "bounds");
  v14 = left + v13;
  v16 = top + v15;
  v18 = v17 - (left + right);
  v20 = v19 - (top + bottom);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCUIFullHeightNavWrapper superview](self, "superview"));
  -[BCUIFullHeightNavWrapper convertRect:toView:](self, "convertRect:toView:", v21, v14, v16, v18, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  if (self->_lift)
    v30 = 0;
  else
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v23, v25, v27, v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v7, v30));

  return v31;
}

- (void)setCursorInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_cursorInsets.left
    || a3.top != self->_cursorInsets.top
    || a3.right != self->_cursorInsets.right
    || a3.bottom != self->_cursorInsets.bottom)
  {
    self->_cursorInsets = a3;
    -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
  }
}

- (void)setLift:(BOOL)a3
{
  if (self->_lift != a3)
  {
    self->_lift = a3;
    -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
  }
}

- (CGSize)intrinsicContentSize
{
  double specifiedWidth;
  double v3;
  objc_super v4;
  CGSize result;

  specifiedWidth = self->_specifiedWidth;
  v3 = -1.0;
  if (vabdd_f64(0.0, specifiedWidth) < 0.00999999978)
  {
    v4.receiver = self;
    v4.super_class = (Class)BCUIFullHeightNavWrapper;
    -[BCUIFullHeightNavWrapper intrinsicContentSize](&v4, "intrinsicContentSize");
  }
  result.height = v3;
  result.width = specifiedWidth;
  return result;
}

- (UIEdgeInsets)cursorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cursorInsets.top;
  left = self->_cursorInsets.left;
  bottom = self->_cursorInsets.bottom;
  right = self->_cursorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)lift
{
  return self->_lift;
}

- (double)specifiedWidth
{
  return self->_specifiedWidth;
}

- (void)setSpecifiedWidth:(double)a3
{
  self->_specifiedWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
