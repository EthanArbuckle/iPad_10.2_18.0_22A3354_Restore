@implementation _UIConstraintBasedLayoutHostingView

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[UIView _baselineOffsetsAtSize:](self->_hostedView, "_baselineOffsetsAtSize:", a3.width, a3.height);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)willRemoveSubview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView willRemoveSubview:](&v5, sel_willRemoveSubview_);
  if (self->_hostedView == a3)
    self->_hostedView = 0;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void)setHostedView:(id)a3
{
  UIView *hostedView;

  hostedView = self->_hostedView;
  if (hostedView != a3)
  {
    if (hostedView)
      -[UIView removeFromSuperview](hostedView, "removeFromSuperview");
    self->_hostedView = (UIView *)a3;
    self->_hasAddedConstraints = 0;
    if (a3)
    {
      -[UIView bounds](self, "bounds");
      objc_msgSend(a3, "setFrame:");
      objc_msgSend(a3, "setAutoresizingMask:", 18);
      -[UIView addSubview:](self, "addSubview:", a3);
    }
  }
}

- (_UIConstraintBasedLayoutHostingView)initWithHostedView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _UIConstraintBasedLayoutHostingView *v9;
  _UIConstraintBasedLayoutHostingView *v10;
  objc_super v12;

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(a3, "size");
  v12.receiver = self;
  v12.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  v9 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, v5, v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[UIView _setHostsLayoutEngine:](v9, "_setHostsLayoutEngine:", 1);
    -[_UIConstraintBasedLayoutHostingView setHostedView:](v10, "setHostedView:", a3);
  }
  return v10;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v5, sel__intrinsicContentSizeInvalidatedForChildView_);
  if (self->_hostedView == a3 && (*((_QWORD *)&self->super._viewFlags + 1) & 0x1000) == 0)
    -[_UIConstraintBasedLayoutHostingView _layoutMetricsInvalidatedForHostedView](self, "_layoutMetricsInvalidatedForHostedView");
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView updateConstraints](&v4, sel_updateConstraints);
  if (!self->_hasAddedConstraints)
  {
    if (-[UIView _wantsConstraintBasedLayout](self->_hostedView, "_wantsConstraintBasedLayout"))
    {
      self->_hasAddedConstraints = 1;
      v3 = (void *)MEMORY[0x1E0D156E0];
      v5[0] = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView topAnchor](self, "topAnchor"), "constraintEqualToAnchor:", -[UIView topAnchor](self->_hostedView, "topAnchor"));
      v5[1] = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView bottomAnchor](self, "bottomAnchor"), "constraintEqualToAnchor:", -[UIView bottomAnchor](self->_hostedView, "bottomAnchor"));
      v5[2] = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView leadingAnchor](self, "leadingAnchor"), "constraintEqualToAnchor:", -[UIView leadingAnchor](self->_hostedView, "leadingAnchor"));
      v5[3] = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView trailingAnchor](self, "trailingAnchor"), "constraintEqualToAnchor:", -[UIView trailingAnchor](self->_hostedView, "trailingAnchor"));
      objc_msgSend(v3, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4));
    }
  }
}

- (void)_setFrameWithAlignmentRect:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView _setFrameWithAlignmentRect:](&v3, sel__setFrameWithAlignmentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)constraintsDidChangeInEngine:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView constraintsDidChangeInEngine:](&v4, sel_constraintsDidChangeInEngine_, a3);
  if ((*((_QWORD *)&self->super._viewFlags + 1) & 4) == 0)
    -[_UIConstraintBasedLayoutHostingView _layoutMetricsInvalidatedForHostedView](self, "_layoutMetricsInvalidatedForHostedView");
}

- (void)_scheduleUpdateConstraintsPassAsEngineHostNeedingLayout:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView _scheduleUpdateConstraintsPassAsEngineHostNeedingLayout:](&v5, sel__scheduleUpdateConstraintsPassAsEngineHostNeedingLayout_);
  if (v3 && (*((_QWORD *)&self->super._viewFlags + 1) & 0x1000) == 0)
    -[_UIConstraintBasedLayoutHostingView _layoutMetricsInvalidatedForHostedView](self, "_layoutMetricsInvalidatedForHostedView");
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIView alignmentRectInsets](self->_hostedView, "alignmentRectInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return -[UIView _layoutHeightDependsOnWidth](self->_hostedView, "_layoutHeightDependsOnWidth");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  CGSize result;

  height = 1.79769313e308;
  if (a3.width == 0.0)
    width = 1.79769313e308;
  else
    width = a3.width;
  if (a3.height != 0.0)
    height = a3.height;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  v7 = v6;
  v9 = v8;
  -[_UIConstraintBasedLayoutHostingView _layoutSizeThatFits:fixedAxes:](self, "_layoutSizeThatFits:fixedAxes:", 0, v10, v11);
  -[UIView frameForAlignmentRect:](self, "frameForAlignmentRect:", v7, v9, v12, v13);
  v15 = v14;
  v17 = v16;
  result.height = v17;
  result.width = v15;
  return result;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  const __CFString *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  const __CFString *v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[6];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((*((_QWORD *)&self->super._viewFlags + 1) & 4) == 0)
    -[UIView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
  if (-[UIView _wantsConstraintBasedLayout](self->_hostedView, "_wantsConstraintBasedLayout"))
  {
    v8 = fmax(fmin(width, 50000.0), 0.0);
    v9 = fmin(height, 50000.0);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if ((a4 & 1) != 0)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", self, 7, 0, v8);
      LODWORD(v20) = 1144586240;
      objc_msgSend(v13, "setPriority:", v20);
      v15 = CFSTR("_UI-fixedSizeH");
    }
    else
    {
      if (v8 > 0.0)
      {
        v11 = (void *)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", self, 7, -1, v8);
        LODWORD(v12) = 1144586240;
        objc_msgSend(v11, "setPriority:", v12);
        objc_msgSend(v11, "setIdentifier:", CFSTR("_UI-fittingSizeHLimit"));
        objc_msgSend(v10, "addObject:", v11);
      }
      v13 = (void *)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", self, 7, 0, 0.0);
      LODWORD(v14) = 1112014848;
      objc_msgSend(v13, "setPriority:", v14);
      v15 = CFSTR("_UI-fittingSizeHCompression");
    }
    objc_msgSend(v13, "setIdentifier:", v15);
    v21 = fmax(v9, 0.0);
    objc_msgSend(v10, "addObject:", v13);
    if ((a4 & 2) != 0)
    {
      v25 = (void *)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", self, 8, 0, v21);
      LODWORD(v28) = 1144586240;
      objc_msgSend(v25, "setPriority:", v28);
      v27 = CFSTR("_UI-fixedSizeV");
    }
    else
    {
      if (v21 > 0.0)
      {
        v22 = (void *)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", self, 8, -1, v21);
        LODWORD(v23) = 1144586240;
        objc_msgSend(v22, "setPriority:", v23);
        objc_msgSend(v22, "setIdentifier:", CFSTR("_UI-fittingSizeVLimit"));
        objc_msgSend(v10, "addObject:", v22);
      }
      v24 = (void *)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", self, 8, 0, 0.0);
      v25 = v24;
      LODWORD(v26) = 1112014848;
      if (v21 == 0.0)
        *(float *)&v26 = 740.0;
      objc_msgSend(v24, "setPriority:", v26);
      v27 = CFSTR("_UI-fittingSizeVCompression");
    }
    objc_msgSend(v25, "setIdentifier:", v27);
    objc_msgSend(v10, "addObject:", v25);
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x3010000000;
    v36 = 0;
    v37 = 0;
    v35 = &unk_18685B0AF;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __69___UIConstraintBasedLayoutHostingView__layoutSizeThatFits_fixedAxes___block_invoke;
    v31[3] = &unk_1E16D52C0;
    v31[4] = self;
    v31[5] = &v32;
    -[UIView _measureViewWithSize:temporaryConstraints:suspendingSystemConstraints:withOptimizedEngineBlock:](self, "_measureViewWithSize:temporaryConstraints:suspendingSystemConstraints:withOptimizedEngineBlock:", v10, 1, v31, v8, v21);
    v17 = v33[4];
    v19 = v33[5];
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    *((_QWORD *)&self->super._viewFlags + 1) &= ~0x1000uLL;
    -[UIView _layoutSizeThatFits:fixedAxes:](self->_hostedView, "_layoutSizeThatFits:fixedAxes:", a4, width, height);
    v17 = v16;
    v19 = v18;
  }
  v29 = v17;
  v30 = v19;
  result.height = v30;
  result.width = v29;
  return result;
}

@end
