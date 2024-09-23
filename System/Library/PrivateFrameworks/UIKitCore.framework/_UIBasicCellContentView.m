@implementation _UIBasicCellContentView

- (_UIBasicCellContentView)initWithConfiguration:(id)a3
{
  id v5;
  _UIBasicCellContentView *v6;
  _UIBasicCellContentView *v7;
  void *v9;
  _QWORD v10[4];
  _UIBasicCellContentView *v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBasicCellContentView.m"), 449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIBasicCellContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49___UIBasicCellContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v11 = v6;
    v12 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  return v7;
}

- (_UIBasicCellContentView)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UIBasicCellContentView *v6;
  _UIBasicCellContentView *v7;
  _QWORD v9[4];
  _UIBasicCellContentView *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIBasicCellContentView;
  v6 = -[UIView initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41___UIBasicCellContentView_initWithCoder___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v7 = v6;
  v10 = v7;
  v11 = v5;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

LABEL_6:
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBasicCellContentView;
  v4 = a3;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"), v5.receiver, v5.super_class);

}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBasicCellContentView;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    objc_msgSend(v4, "appendFormat:", CFSTR("; configuration = %@>"), self->_configuration);
  }
  return (NSString *)v4;
}

- (_UIBasicCellContentViewConfiguration)configuration
{
  _UIBasicCellContentViewConfiguration *animatingToConfiguration;

  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration)
    animatingToConfiguration = self->_configuration;
  return (_UIBasicCellContentViewConfiguration *)(id)-[_UIBasicCellContentViewConfiguration copy](animatingToConfiguration, "copy");
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UIBasicCellContentViewConfiguration *animatingToConfiguration;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBasicCellContentView.m"), 502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (-[_UIContentViewEditingController isDisplayingEditedText](self->_editingController, "isDisplayingEditedText")
    || !-[_UIBasicCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UIBasicCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      if (!animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, self->_configuration);
        objc_initWeak(&location, self);
        v8 = MEMORY[0x1E0C809B0];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __44___UIBasicCellContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E16B42F8;
        objc_copyWeak(&v16, &location);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __44___UIBasicCellContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E16B3F40;
        objc_copyWeak(&v14, &location);
        +[_UIContentViewAnimationStateUpdatingLayer layerForView:withUpdateHandler:completionHandler:](_UIContentViewAnimationStateUpdatingLayer, "layerForView:withUpdateHandler:completionHandler:", self, v15, v13);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __44___UIBasicCellContentView_setConfiguration___block_invoke_3;
        v11[3] = &unk_1E16B51A0;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v9;
        +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v11);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, v7);
        objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      }
      -[_UIBasicCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }

  }
}

- (void)_applyConfiguration:(id *)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  _QWORD *v8;
  id *v9;
  UIImageView *v10;
  UIImageView *v11;
  id *v12;
  _QWORD *v13;
  id *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  id v18;
  _UIContentViewEditingController *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;

  v4 = a2;
  if (a1)
  {
    v29 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__applyConfiguration_, a1, CFSTR("_UIBasicCellContentView.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    objc_storeStrong(a1 + 56, a2);
    v5 = objc_msgSend(v29, "axesPreservingSuperviewLayoutMargins");
    if ((v5 & 2) != 0)
      v6 = (v5 << 63 >> 63) & 0xA | 5;
    else
      v6 = (v5 << 63 >> 63) & 0xA;
    objc_msgSend(a1, "setEdgesPreservingSuperviewLayoutMargins:", v6);
    objc_msgSend(v29, "directionalLayoutMargins");
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 57;
    objc_msgSend(v29, "imageView");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v9 = a1;
    v10 = (UIImageView *)*v7;
    v11 = v10;
    if (v8 && (v8[2] || v8[6]))
    {
      if (v10)
      {
        if (-[UIView isHidden](v10, "isHidden"))
          -[UIImageView setHidden:](v11, "setHidden:", 0);
      }
      else
      {
        v11 = objc_alloc_init(UIImageView);
        objc_storeStrong(v7, v11);
        objc_msgSend(v9, "addSubview:", v11);
      }
      objc_msgSend(v8, "applyToImageView:", v11);
    }
    else if (v10 && !-[UIView isHidden](v10, "isHidden"))
    {
      -[UIImageView setHidden:](v11, "setHidden:", 1);
    }

    v12 = v9 + 58;
    objc_msgSend(v29, "textLabel");
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = (UILabel *)*v12;
    v16 = v15;
    if (v13 && (v13[2] || v13[7]))
    {
      if (v15)
      {
        if (-[UIView isHidden](v15, "isHidden"))
          -[UIView setHidden:](v16, "setHidden:", 0);
      }
      else
      {
        v16 = objc_alloc_init(UILabel);
        objc_storeStrong(v12, v16);
        objc_msgSend(v14, "addSubview:", v16);
      }
      objc_msgSend(v13, "applyToLabel:", v16);
    }
    else if (v15 && !-[UIView isHidden](v15, "isHidden"))
    {
      -[UIView setHidden:](v16, "setHidden:", 1);
    }

    objc_msgSend(v29, "_textLabelEditingConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v14[55];

      if (!v18)
      {
        v19 = [_UIContentViewEditingController alloc];
        objc_msgSend(v14, "textLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[_UIContentViewEditingController initWithContentView:editableLabel:](v19, "initWithContentView:editableLabel:", v14, v20);
        v22 = v14[55];
        v14[55] = (id)v21;

      }
    }
    v23 = v14[55];
    objc_msgSend(v29, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_textLabelEditingConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateLabelConfiguration:editingConfiguration:", v24, v25);

    objc_msgSend(v29, "_textLabelEditingConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = v14[55];
      v14[55] = 0;

    }
    v14[54] = (id)0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v14, "invalidateIntrinsicContentSize");
    objc_msgSend(v14, "setNeedsLayout");
    v4 = v29;
  }

}

- (UIImageView)imageView
{
  UIImageView *imageView;

  if (-[UIView isHidden](self->_imageView, "isHidden"))
    imageView = 0;
  else
    imageView = self->_imageView;
  return imageView;
}

- (UILabel)textLabel
{
  UILabel *textLabel;

  if (-[UIView isHidden](self->_textLabel, "isHidden"))
    textLabel = 0;
  else
    textLabel = self->_textLabel;
  return textLabel;
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  BOOL v2;
  void *v4;
  void *v5;

  if ((*(_QWORD *)&self->super._viewFlags & 0x20000000000000) == 0)
    return 0;
  -[_UIBasicCellContentView textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIBasicCellContentView textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "numberOfLines") != 1;

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)_UIBasicCellContentView;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v2, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)_UIBasicCellContentView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (double)_preferredMaxLayoutWidth
{
  double result;

  result = 0.0;
  if ((*(_QWORD *)&self->super._viewFlags & 0x4000000000000) == 0)
    return self->_preferredMaxLayoutWidth;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (a3.height <= 0.0)
    a3.height = 1.79769313e308;
  -[_UIBasicCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = 1.79769313e308;
  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (height > 0.0)
    v9 = height;
  -[_UIBasicCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0)
    v10 = width;
  if (a5 >= 1000.0)
    v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_computeSizesForAvailableSpace:(double)a3
{
  double *v7;
  double *v8;
  float64x2_t v9;
  void *v10;
  void *v11;
  void *v12;
  float64_t v13;
  float64_t v14;
  uint64_t v15;
  void *v16;
  char ShouldUseAccessibilityTextWrappingLayout;
  int v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  _BOOL4 v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  _QWORD *v36;
  _BOOL8 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  double v52;
  float64x2_t v53;
  double v54;
  double v55;
  float64x2_t v57;

  if (!a2)
  {
    *(_QWORD *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return;
  }
  v7 = (double *)(a1 + 8);
  *(_QWORD *)a1 = 0;
  v8 = (double *)MEMORY[0x1E0C9D820];
  v9 = *(float64x2_t *)MEMORY[0x1E0C9D820];
  *(_OWORD *)(a1 + 8) = *MEMORY[0x1E0C9D820];
  *(float64x2_t *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 40) = 0;
  *(float64x2_t *)(a1 + 48) = v9;
  *(float64x2_t *)(a1 + 64) = v9;
  v53 = v9;
  *(_QWORD *)(a1 + 80) = 0;
  objc_msgSend(a2, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maximumSize");
  v57.f64[0] = v13;
  v57.f64[1] = v14;

  v15 = 0;
  if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v10))
  {
    objc_msgSend(a2[56], "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v16, v11, &v57);

    if ((ShouldUseAccessibilityTextWrappingLayout & 1) != 0)
    {
      v15 = 2;
      *(_QWORD *)a1 = 2;
      if (!v11)
      {
        v55 = *v7;
        goto LABEL_26;
      }
      v18 = 1;
      goto LABEL_9;
    }
    v15 = 1;
    *(_QWORD *)a1 = 1;
  }
  if (!v11)
    goto LABEL_24;
  v18 = 0;
LABEL_9:
  objc_msgSend(v11, "_intrinsicSizeWithinSize:", a3, a4);
  v52 = v19;
  v54 = v20;
  objc_msgSend(v11, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reservedLayoutSize");
  v24 = _UIContentViewImageViewLayoutHeight(v21, v10, v54, v23, v57.f64[1]);
  *(double *)(a1 + 32) = v24;

  objc_msgSend(a2, "directionalLayoutMargins");
  v27 = v25 + v26;
  v28.f64[0] = a3;
  if (v24 >= v54)
    v27 = -0.0;
  v28.f64[1] = a4 + v27;
  v29.f64[0] = v52;
  v29.f64[1] = v54;
  v30 = vmaxnmq_f64(v53, vminnmq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v57), vbslq_s8((int8x16_t)vcgtq_f64(v57, v28), (int8x16_t)v28, (int8x16_t)v57), (int8x16_t)v28)));
  v31 = v52 != v30.f64[0];
  if (v54 != v30.f64[1])
    v31 = 1;
  if (v52 > 0.0 && v31 && v54 > 0.0)
  {
    v30.f64[0] = v30.f64[0] / v52;
    v32 = v30.f64[1] / v54;
    if (v30.f64[0] < v30.f64[1] / v54)
      v32 = v30.f64[0];
    v30 = vmulq_n_f64(v29, v32);
  }
  *(float64x2_t *)v7 = v30;
  v55 = v30.f64[0];
  if (v18)
  {
    *(_QWORD *)(a1 + 40) = 0;
    v8 = (double *)MEMORY[0x1E0C9D820];
LABEL_26:
    objc_msgSend(a2[56], "imageToTextPadding");
    v41 = v55 + v42;
    v15 = 2;
    goto LABEL_27;
  }
  objc_msgSend(v11, "image");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "imageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "reservedLayoutSize");
  v36 = a2[56];
  if (v36)
    v37 = (unint64_t)(v36[5] - 1) < 2;
  else
    v37 = 0;
  v8 = (double *)MEMORY[0x1E0C9D820];
  v38 = _UIContentViewImageViewHorizontalCenteringOffset(v33, v10, v37, v55, v35);
  *(double *)(a1 + 40) = v38;

  v39 = v55 + v38 + v38;
  *(double *)(a1 + 24) = v39;
  objc_msgSend(a2[56], "imageToTextPadding");
  a3 = a3 - (v39 + v40);
LABEL_24:
  v41 = 0.0;
LABEL_27:
  objc_msgSend(a2, "textLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "textLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v43, v44, v15, v41);

  *(double *)(a1 + 80) = v41;
  if (v43)
  {
    objc_msgSend(v43, "_intrinsicSizeWithinSize:", a3, a4);
    v47 = fmax(v8[1], fmin(v46, a4));
    *(double *)(a1 + 48) = fmax(*v8, fmin(v45, a3));
    *(double *)(a1 + 56) = v47;
  }
  objc_msgSend(a2[55], "textInputView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(a2, "textLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel__computeSizesForAvailableSpace_, a2, CFSTR("_UIBasicCellContentView.m"), 694, CFSTR("The text label should exist if there is a text input view"));

    }
    v50 = *(_QWORD *)(a1 + 56);
    *(double *)(a1 + 64) = a3 - v41;
    *(_QWORD *)(a1 + 72) = v50;
  }

}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  _UIBasicCellContentViewConfiguration *animatingToConfiguration;
  _UIBasicCellContentViewConfiguration *configuration;
  _UIBasicCellContentViewConfiguration *v8;
  void *v9;
  void *v10;
  double preferredMaxLayoutWidth;
  double v12;
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
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    v8 = configuration;
    -[_UIBasicCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
  }
  else
  {
    v8 = 0;
  }
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (width >= self->_preferredMaxLayoutWidth)
    preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  else
    preferredMaxLayoutWidth = width;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  -[_UIBasicCellContentView _computeSizesForAvailableSpace:]((uint64_t)&v35, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v14 - v18, height - v12 - v16);
  v20 = v19 + v15 + *(double *)&v38;
  v21 = v17 + v13 + *((double *)&v38 + 1);
  if ((_QWORD)v35 != 2)
  {
    v22 = v20 + *((double *)&v36 + 1);
    if (*((double *)&v36 + 1) > 0.0 && v20 > 0.0)
    {
      -[_UIBasicCellContentViewConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding", *((double *)&v36 + 1));
      v22 = v22 + v23;
    }
    if (v17 + v13 + *(double *)&v37 >= v21)
      v21 = v17 + v13 + *(double *)&v37;
    v20 = v22;
  }
  -[_UIBasicCellContentView textLabel](self, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    -[_UIBasicCellContentViewConfiguration textLabel](self->_configuration, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "font");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "minimumContentViewHeightForFont:traitCollection:", v27, v9);
  v30 = v29;
  if (v8)
    -[_UIBasicCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
  if (preferredMaxLayoutWidth >= v20)
    v31 = v20;
  else
    v31 = preferredMaxLayoutWidth;
  if (v30 >= v21)
    v32 = v30;
  else
    v32 = v21;
  if (height >= v32)
    height = v32;

  v33 = v31;
  v34 = height;
  result.height = v34;
  result.width = v33;
  return result;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBasicCellContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
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
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double LineOfLabel;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  CGFloat v116;
  double v117;
  double v118;
  double v119;
  uint64_t v120;
  double v121;
  _OWORD v122[2];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  double v126;
  objc_super v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v127.receiver = self;
  v127.super_class = (Class)_UIBasicCellContentView;
  -[UIView layoutSubviews](&v127, sel_layoutSubviews);
  -[_UIBasicCellContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
  v108 = v4;
  v109 = v3;
  v106 = v6;
  v107 = v5;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v8 = v7;
  -[UIView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v18 = v17;
  v20 = v19;
  v126 = 0.0;
  v124 = 0u;
  v125 = 0u;
  v123 = 0u;
  memset(v122, 0, sizeof(v122));
  v112 = v16 - v17 - v22;
  -[_UIBasicCellContentView _computeSizesForAvailableSpace:]((uint64_t)v122, (id *)&self->super.super.super.isa, v14 - v19 - v21, v112);
  -[_UIBasicCellContentView imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)&v122[0];
  v25 = 2;
  v110 = v12;
  v111 = v10;
  v26 = v16;
  if (v23)
  {
    v114 = v12;
    v115 = v14;
    v113 = v10;
    if (*(_QWORD *)&v122[0] != 2)
    {
      v27 = *((double *)&v123 + 1);
      v116 = v111;
      v117 = v12;
      v118 = v14;
      v119 = v16;
      v120 = 2;
      v121 = v20 + *((double *)&v123 + 1);
      v28 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *((double *)v122 + 1));
      v32 = UIRectCenteredYInRectScale(v28, v29, v30, v31, 0.0, v18, 0.0, v112, v8);
      v36 = UIRectIntegralWithScale(v32, v33, v34, v35, v8);
      v26 = v37;
      v113 = v36;
      v114 = v38;
      v115 = v39;
      objc_msgSend(v23, "setFrame:");
      -[_UIBasicCellContentViewConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding");
      v20 = v27 + v40;
      v25 = 8;
    }
  }
  else
  {
    v114 = v12;
    v115 = v14;
    v113 = v10;
  }
  -[_UIBasicCellContentView textLabel](self, "textLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v116 = v113;
    v117 = v114;
    v118 = v115;
    v119 = v26;
    v120 = v25;
    v121 = v20;
    v42 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *(double *)&v124);
    v46 = UIRectCenteredYInRectScale(v42, v43, v44, v45, 0.0, v18, 0.0, v112, v8);
    objc_msgSend(v41, "setFrame:", UIRectIntegralWithScale(v46, v47, v48, v49, v8));
    if (v24)
    {
      v104 = v26;
      v105 = v18;
      objc_msgSend(v23, "frame");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;
      LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v41);
      if (v24 == 2)
      {
        v62 = v61;
        v63 = v60;
        v64 = v59;
        v65 = LineOfLabel;
        -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v23);
        v116 = v113;
        v117 = v114;
        v118 = v115;
        v119 = v104;
        v120 = v25;
        v121 = v20;
        v66 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *((double *)v122 + 1));
        v71 = UIRectCenteredYInRectScale(v66, v67, v68, v69, v65, v64, v63, v62, v8);
        v73 = v72;
        v75 = v74;
      }
      else
      {
        v71 = UIRectCenteredYInRectScale(v51, v53, v55, v57, LineOfLabel, v59, v60, v61, v8);
        v77 = v76;
        v73 = v78;
        v75 = v79;
        v128.origin.y = v110;
        v128.origin.x = v111;
        v128.size.width = v14;
        v128.size.height = v16;
        v80 = v105 * 0.5 + CGRectGetMinY(v128);
        if (v77 >= v80)
          v70 = v77;
        else
          v70 = v80;
      }
      objc_msgSend(v23, "setFrame:", UIRectIntegralWithScale(v71, v70, v73, v75, v8));
      v26 = v104;
      v18 = v105;
    }
  }
  if (v23)
  {
    -[_UIBasicCellContentViewConfiguration imageView](self->_configuration, "imageView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "cornerRadius");
    _UIApplyCornerRadiusToView(v23, v82);

  }
  -[_UIContentViewEditingController textInputView](self->_editingController, "textInputView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v116 = v113;
    v117 = v114;
    v118 = v115;
    v119 = v26;
    v120 = v25;
    v121 = v20 + v126;
    v84 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v116, 0.0, 0.0, *(double *)&v125);
    v88 = UIRectCenteredYInRectScale(v84, v85, v86, v87, 0.0, v18, 0.0, v112, v8);
    v92 = UIRectIntegralWithScale(v88, v89, v90, v91, v8);
    v94 = v93;
    v96 = v95;
    v98 = v97;
    -[_UIContentViewEditingController textInputView](self->_editingController, "textInputView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setFrame:", v92, v94, v96, v98);

  }
  if (self->_primaryTextFrameDidChangeHandler)
  {
    -[_UIBasicCellContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
    v130.origin.x = v100;
    v130.origin.y = v101;
    v130.size.width = v102;
    v130.size.height = v103;
    v129.origin.y = v108;
    v129.origin.x = v109;
    v129.size.height = v106;
    v129.size.width = v107;
    if (!CGRectEqualToRect(v129, v130))
      (*((void (**)(void))self->_primaryTextFrameDidChangeHandler + 2))();
  }

}

- (BOOL)becomeFirstResponder
{
  _UIContentViewEditingController *editingController;
  objc_super v5;
  _QWORD v6[5];

  editingController = self->_editingController;
  if (editingController)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47___UIBasicCellContentView_becomeFirstResponder__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    return -[_UIContentViewEditingController makeTextInputFirstResponderWithInitialLayoutBlock:](editingController, "makeTextInputFirstResponderWithInitialLayoutBlock:", v6);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIBasicCellContentView;
    return -[UIView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  }
}

- (BOOL)_preventFocus
{
  return -[_UIContentViewEditingController isDisplayingEditedText](self->_editingController, "isDisplayingEditedText");
}

- (NSLayoutRect)_primaryTextLayoutRect
{
  void *v2;
  void *v3;

  -[_UIBasicCellContentView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layoutRect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLayoutRect *)v3;
}

- (CGRect)_primaryTextLayoutFrame
{
  void *v2;
  void *v3;
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
  CGRect result;

  -[_UIBasicCellContentView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_primaryTextFrameDidChangeHandler
{
  return self->_primaryTextFrameDidChangeHandler;
}

- (void)_setPrimaryTextFrameDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_primaryTextFrameDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_editingController, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end
