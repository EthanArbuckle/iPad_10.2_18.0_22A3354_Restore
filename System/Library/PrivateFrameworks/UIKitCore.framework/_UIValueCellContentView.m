@implementation _UIValueCellContentView

- (_UIValueCellContentView)initWithConfiguration:(id)a3
{
  id v5;
  _UIValueCellContentView *v6;
  _UIValueCellContentView *v7;
  void *v9;
  _QWORD v10[4];
  _UIValueCellContentView *v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIValueCellContentView.m"), 439, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIValueCellContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49___UIValueCellContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v11 = v6;
    v12 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  return v7;
}

- (_UIValueCellContentView)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UIValueCellContentView *v6;
  _UIValueCellContentView *v7;
  _QWORD v9[4];
  _UIValueCellContentView *v10;
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
  v12.super_class = (Class)_UIValueCellContentView;
  v6 = -[UIView initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41___UIValueCellContentView_initWithCoder___block_invoke;
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
  v5.super_class = (Class)_UIValueCellContentView;
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
  v6.super_class = (Class)_UIValueCellContentView;
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

- (_UIValueCellContentViewConfiguration)configuration
{
  _UIValueCellContentViewConfiguration *animatingToConfiguration;

  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration)
    animatingToConfiguration = self->_configuration;
  return (_UIValueCellContentViewConfiguration *)(id)-[_UIValueCellContentViewConfiguration copy](animatingToConfiguration, "copy");
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UIValueCellContentViewConfiguration *animatingToConfiguration;
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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIValueCellContentView.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!-[_UIValueCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UIValueCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
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
        v15[2] = __44___UIValueCellContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E16B42F8;
        objc_copyWeak(&v16, &location);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __44___UIValueCellContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E16B3F40;
        objc_copyWeak(&v14, &location);
        +[_UIContentViewAnimationStateUpdatingLayer layerForView:withUpdateHandler:completionHandler:](_UIContentViewAnimationStateUpdatingLayer, "layerForView:withUpdateHandler:completionHandler:", self, v15, v13);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __44___UIValueCellContentView_setConfiguration___block_invoke_3;
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
      -[_UIValueCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
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
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a2;
  if (a1)
  {
    v15 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__applyConfiguration_, a1, CFSTR("_UIValueCellContentView.m"), 548, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    objc_storeStrong(a1 + 55, a2);
    v5 = objc_msgSend(v15, "axesPreservingSuperviewLayoutMargins");
    if ((v5 & 2) != 0)
      v6 = (v5 << 63 >> 63) & 0xA | 5;
    else
      v6 = (v5 << 63 >> 63) & 0xA;
    objc_msgSend(a1, "setEdgesPreservingSuperviewLayoutMargins:", v6);
    objc_msgSend(v15, "directionalLayoutMargins");
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 56;
    objc_msgSend(v15, "imageView");
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

    objc_msgSend(v15, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UIUpdateLabelUsingConfiguration(v9, v9 + 57, v12);

    objc_msgSend(v15, "valueLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UIUpdateLabelUsingConfiguration(v9, v9 + 58, v13);

    v9[54] = (id)0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v9, "invalidateIntrinsicContentSize");
    objc_msgSend(v9, "setNeedsLayout");
    v4 = v15;
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

- (UILabel)valueLabel
{
  UILabel *valueLabel;

  if (-[UIView isHidden](self->_valueLabel, "isHidden"))
    valueLabel = 0;
  else
    valueLabel = self->_valueLabel;
  return valueLabel;
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if ((*(_QWORD *)&self->super._viewFlags & 0x20000000000000) == 0)
    return 0;
  -[_UIValueCellContentView textLabel](self, "textLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[_UIValueCellContentView valueLabel](self, "valueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 1;
  }
  -[_UIValueCellContentView textLabel](self, "textLabel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_UIValueCellContentView textLabel](self, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfLines");

    if (v10 != 1)
      return 1;
  }
  -[_UIValueCellContentView valueLabel](self, "valueLabel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    return 0;
  v12 = (void *)v11;
  -[_UIValueCellContentView valueLabel](self, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfLines");

  return v14 != 1;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)_UIValueCellContentView;
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
  v9.super_class = (Class)_UIValueCellContentView;
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
  -[_UIValueCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
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
  -[_UIValueCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0)
    v10 = width;
  if (a5 >= 1000.0)
    v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)_intrinsicSizeForLabel:(BOOL *)a3 inAvailableSpace:(double)a4 outRequiresMultipleLines:(double)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  BOOL v22;
  id v23;
  double v24;
  double v25;
  double v26;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  double v41;
  double v42;

  v9 = a2;
  v10 = objc_msgSend(v9, "numberOfLines");
  objc_msgSend(v9, "bounds");
  if (a3)
  {
    v15 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke;
    v38[3] = &unk_1E16B1E18;
    v40 = v10;
    v16 = v11;
    v17 = v12;
    v18 = v13;
    v28 = v14;
    v19 = v9;
    v39 = v19;
    v41 = a4;
    v42 = a5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v38);

    objc_msgSend(v19, "_intrinsicSizeWithinSize:", a4, a5);
    v21 = v20;
    *a3 = objc_msgSend(v19, "_measuredNumberOfLines") > 1;
    v22 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2;
    v29[3] = &unk_1E16C10D0;
    v23 = v19;
    v31 = a1;
    v32 = v10;
    v37 = v22;
    v30 = v23;
    v33 = v16;
    v34 = v17;
    v35 = v18;
    v36 = v28;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);
    if (v10 == 1)
    {
      objc_msgSend(v23, "_intrinsicSizeWithinSize:", a4, a5);
      v21 = v24;
    }

  }
  else
  {
    objc_msgSend(v9, "_intrinsicSizeWithinSize:", a4, a5);
    v21 = v25;
  }
  v26 = fmax(*MEMORY[0x1E0C9D820], fmin(v21, a4));

  return v26;
}

- (void)_computeSizesForAvailableSpace:(double)a3
{
  double *v7;
  float64x2_t v8;
  void *v9;
  void *v10;
  void *v11;
  float64_t v12;
  float64_t v13;
  uint64_t v14;
  void *v15;
  char ShouldUseAccessibilityTextWrappingLayout;
  int v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  _BOOL4 v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  _QWORD *v35;
  _BOOL8 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _OWORD *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  BOOL v49;
  char v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  _BOOL4 v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float64x2_t v66;
  double v67;
  double v68;
  BOOL v70;
  float64x2_t v71;

  if (a2)
  {
    v7 = (double *)(a1 + 8);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_QWORD *)(a1 + 48) = 0;
    v8 = *(float64x2_t *)MEMORY[0x1E0C9D820];
    *(_OWORD *)(a1 + 8) = *MEMORY[0x1E0C9D820];
    *(float64x2_t *)(a1 + 24) = v8;
    *(float64x2_t *)(a1 + 56) = v8;
    *(float64x2_t *)(a1 + 72) = v8;
    v66 = v8;
    *(float64x2_t *)(a1 + 88) = v8;
    objc_msgSend(a2, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2[55], "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maximumSize");
    v71.f64[0] = v12;
    v71.f64[1] = v13;

    v14 = 0;
    if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v9))
    {
      objc_msgSend(a2[55], "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v15, v10, &v71);

      if ((ShouldUseAccessibilityTextWrappingLayout & 1) != 0)
      {
        v14 = 2;
        *(_QWORD *)a1 = 2;
        if (!v10)
        {
          v68 = *v7;
          goto LABEL_26;
        }
        v17 = 1;
        goto LABEL_9;
      }
      v14 = 1;
      *(_QWORD *)a1 = 1;
    }
    if (!v10)
      goto LABEL_24;
    v17 = 0;
LABEL_9:
    objc_msgSend(v10, "_intrinsicSizeWithinSize:", a3, a4);
    v65 = v18;
    v67 = v19;
    objc_msgSend(v10, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2[55], "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reservedLayoutSize");
    v23 = _UIContentViewImageViewLayoutHeight(v20, v9, v67, v22, v71.f64[1]);
    *(double *)(a1 + 32) = v23;

    objc_msgSend(a2, "directionalLayoutMargins");
    v26 = v24 + v25;
    v27.f64[0] = a3;
    if (v23 >= v67)
      v26 = -0.0;
    v27.f64[1] = a4 + v26;
    v28.f64[0] = v65;
    v28.f64[1] = v67;
    v29 = vmaxnmq_f64(v66, vminnmq_f64(v28, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v71), vbslq_s8((int8x16_t)vcgtq_f64(v71, v27), (int8x16_t)v27, (int8x16_t)v71), (int8x16_t)v27)));
    v30 = v65 != v29.f64[0];
    if (v67 != v29.f64[1])
      v30 = 1;
    if (v65 > 0.0 && v30 && v67 > 0.0)
    {
      v29.f64[0] = v29.f64[0] / v65;
      v31 = v29.f64[1] / v67;
      if (v29.f64[0] < v29.f64[1] / v67)
        v31 = v29.f64[0];
      v29 = vmulq_n_f64(v28, v31);
    }
    *(float64x2_t *)v7 = v29;
    v68 = v29.f64[0];
    if (v17)
    {
      *(_QWORD *)(a1 + 40) = 0;
LABEL_26:
      objc_msgSend(a2[55], "imageToTextPadding");
      v40 = v68 + v41;
      v14 = 2;
LABEL_27:
      v42 = (_OWORD *)(a1 + 56);
      objc_msgSend(a2, "textLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2[55], "textLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v43, v44, v14, v40);

      objc_msgSend(a2, "valueLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2[55], "valueLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v45, v46, v14, 0.0);

      if (v43)
      {
        v70 = 0;
        v48 = -[_UIValueCellContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v43, &v70, a3, a4);
        *(double *)(a1 + 56) = v48;
        *(double *)(a1 + 64) = v47;
        *(_OWORD *)(a1 + 88) = *v42;
        if (v14)
          v49 = 0;
        else
          v49 = !v70;
        v50 = !v49;
        *(_BYTE *)(a1 + 48) = v50;
        if (!v45)
          goto LABEL_55;
        if ((v50 & 1) != 0)
          goto LABEL_52;
      }
      else
      {
        if (!v45)
        {
LABEL_55:

          return;
        }
        v48 = *(double *)v42;
      }
      objc_msgSend(a2[55], "textToValuePadding");
      v52 = a3 - v48 - v51;
      if (v52 >= 0.0)
      {
        v70 = 0;
        *(double *)(a1 + 72) = -[_UIValueCellContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v45, &v70, v52, a4);
        *(_QWORD *)(a1 + 80) = v57;
        v47 = *(double *)(a1 + 64);
        v58 = v48 != *MEMORY[0x1E0C9D820];
        if (v47 != *(double *)(MEMORY[0x1E0C9D820] + 8))
          v58 = 1;
        if (!v70)
          v58 = 0;
        *(_BYTE *)(a1 + 48) = v58;
        if (!v58)
          goto LABEL_43;
      }
      else
      {
        v47 = *(double *)(a1 + 64);
        v53 = v48 != *MEMORY[0x1E0C9D820];
        if (v47 != *(double *)(MEMORY[0x1E0C9D820] + 8))
          v53 = 1;
        *(_BYTE *)(a1 + 48) = v53;
        if (!v53)
        {
LABEL_43:
          objc_msgSend(a2[55], "textToValuePadding");
          v55 = *(double *)(a1 + 88) + v54 + *(double *)(a1 + 72);
          if (*(double *)(a1 + 96) >= *(double *)(a1 + 80))
            v56 = *(_QWORD *)(a1 + 96);
          else
            v56 = *(_QWORD *)(a1 + 80);
          *(double *)(a1 + 88) = v55;
          *(_QWORD *)(a1 + 96) = v56;
          goto LABEL_55;
        }
      }
LABEL_52:
      v59 = a4 - v47;
      objc_msgSend(a2[55], "textToValuePadding");
      v61 = -[_UIValueCellContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v45, 0, a3, v59 - v60);
      v63 = v62;
      *(double *)(a1 + 72) = v61;
      *(double *)(a1 + 80) = v62;
      if (*(double *)(a1 + 88) >= v61)
        v61 = *(double *)(a1 + 88);
      *(double *)(a1 + 88) = v61;
      objc_msgSend(a2[55], "textToValuePadding");
      *(double *)(a1 + 96) = *(double *)(a1 + 96) + v63 + v64;
      goto LABEL_55;
    }
    objc_msgSend(v10, "image");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2[55], "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reservedLayoutSize");
    v35 = a2[55];
    if (v35)
      v36 = v35[4] == 1;
    else
      v36 = 0;
    v37 = _UIContentViewImageViewHorizontalCenteringOffset(v32, v9, v36, v68, v34);
    *(double *)(a1 + 40) = v37;

    v38 = v68 + v37 + v37;
    *(double *)(a1 + 24) = v38;
    objc_msgSend(a2[55], "imageToTextPadding");
    a3 = a3 - (v38 + v39);
LABEL_24:
    v40 = 0.0;
    goto LABEL_27;
  }
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  _UIValueCellContentViewConfiguration *animatingToConfiguration;
  _UIValueCellContentViewConfiguration *configuration;
  _UIValueCellContentViewConfiguration *v8;
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
  __int128 v40;
  double v41;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    v8 = configuration;
    -[_UIValueCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
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
  v41 = 0.0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[_UIValueCellContentView _computeSizesForAvailableSpace:]((uint64_t)&v35, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v14 - v18, height - v12 - v16);
  v20 = v19 + v15 + *((double *)&v40 + 1);
  v21 = v17 + v13 + v41;
  if ((_QWORD)v35 != 2)
  {
    v22 = v20 + *((double *)&v36 + 1);
    if (*((double *)&v36 + 1) > 0.0 && v20 > 0.0)
    {
      -[_UIValueCellContentViewConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding", *((double *)&v36 + 1));
      v22 = v22 + v23;
    }
    if (v17 + v13 + *(double *)&v37 >= v21)
      v21 = v17 + v13 + *(double *)&v37;
    v20 = v22;
  }
  -[_UIValueCellContentView textLabel](self, "textLabel");
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
    -[_UIValueCellContentViewConfiguration textLabel](self->_configuration, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "font");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "minimumContentViewHeightForFont:traitCollection:", v27, v9);
  v30 = v29;
  if (v8)
    -[_UIValueCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
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
  v4.super_class = (Class)_UIValueCellContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
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
  double v23;
  void *v24;
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
  uint64_t v40;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  void *v46;
  void *v47;
  int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double MaxY;
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
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double LineOfLabel;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  double v119;
  double v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  double v124;
  double v125;
  CGFloat rect1;
  CGFloat v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  double v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  uint64_t v140;
  double v141;
  _OWORD v142[2];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  double v147;
  objc_super v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;

  v148.receiver = self;
  v148.super_class = (Class)_UIValueCellContentView;
  -[UIView layoutSubviews](&v148, sel_layoutSubviews);
  -[_UIValueCellContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
  v4 = v3;
  v127 = v6;
  v128 = v5;
  rect1 = v7;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v9 = v8;
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v19 = v18;
  v130 = v17;
  v131 = v15;
  v129 = v20;
  v22 = v17 - v20 - v21;
  v147 = 0.0;
  v145 = 0u;
  v146 = 0u;
  v120 = v23;
  v143 = 0u;
  v144 = 0u;
  memset(v142, 0, sizeof(v142));
  -[_UIValueCellContentView _computeSizesForAvailableSpace:]((uint64_t)v142, (id *)&self->super.super.super.isa, v15 - v18 - v23, v22);
  -[_UIValueCellContentView imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)&v142[0];
  v122 = v13;
  v123 = v11;
  if (!v24 || *(_QWORD *)&v142[0] == 2)
  {
    v40 = 2;
    v134 = v15;
    v135 = v17;
    v132 = v11;
    v133 = v13;
    v28 = v129;
  }
  else
  {
    v26 = *((double *)&v143 + 1);
    v136 = v11;
    v137 = v13;
    v138 = v15;
    v139 = v130;
    v140 = 2;
    v141 = v19 + *((double *)&v143 + 1);
    v27 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, 0.0, *((double *)v142 + 1));
    v28 = v129;
    v32 = UIRectCenteredYInRectScale(v27, v29, v30, v31, 0.0, v129, 0.0, v22, v9);
    v132 = UIRectIntegralWithScale(v32, v33, v34, v35, v9);
    v133 = v36;
    v134 = v37;
    v135 = v38;
    objc_msgSend(v24, "setFrame:");
    -[_UIValueCellContentViewConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding");
    v19 = v26 + v39;
    v40 = 8;
  }
  v149.origin.x = UIRectCenteredYInRectScale(0.0, 0.0, *((double *)&v146 + 1), v147, 0.0, v28, 0.0, v22, v9);
  x = v149.origin.x;
  y = v149.origin.y;
  width = v149.size.width;
  height = v149.size.height;
  MinY = CGRectGetMinY(v149);
  -[_UIValueCellContentView textLabel](self, "textLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIValueCellContentView valueLabel](self, "valueLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v48 = v144;
    v125 = v4;
    if (!(_BYTE)v144)
    {
      objc_msgSend(v46, "_firstBaselineOffsetFromTop");
      v49 = v19;
      v51 = v50;
      objc_msgSend(v47, "_firstBaselineOffsetFromTop");
      v53 = v51 < v52;
      v19 = v49;
      if (v53)
      {
        objc_msgSend(v47, "_firstBaselineOffsetFromTop");
        v55 = v54;
        objc_msgSend(v46, "_firstBaselineOffsetFromTop");
        v57 = v55 - v56;
        v19 = v49;
        MinY = MinY + v57;
      }
    }
    v136 = v132;
    v137 = v133;
    v138 = v134;
    v139 = v135;
    v140 = v40;
    v119 = v19;
    v141 = v19;
    v58 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, MinY, *((double *)&v144 + 1));
    v124 = v9;
    v62 = UIRectIntegralWithScale(v58, v59, v60, v61, v9);
    v64 = v63;
    v66 = v65;
    v68 = v67;
    objc_msgSend(v46, "setFrame:");
    if (v48)
    {
      v150.origin.x = v62;
      v150.origin.y = v64;
      v150.size.width = v66;
      v150.size.height = v68;
      MaxY = CGRectGetMaxY(v150);
      -[_UIValueCellContentViewConfiguration textToValuePadding](self->_configuration, "textToValuePadding");
      MinY = MaxY + v70;
      v9 = v124;
      v4 = v125;
      v19 = v119;
      if (!v25)
        goto LABEL_23;
      goto LABEL_16;
    }
    v151.origin.x = x;
    v151.origin.y = y;
    v151.size.width = width;
    v151.size.height = height;
    MinY = CGRectGetMinY(v151);
    objc_msgSend(v46, "_firstBaselineOffsetFromTop");
    v72 = v71;
    objc_msgSend(v47, "_firstBaselineOffsetFromTop");
    if (v72 > v73)
    {
      objc_msgSend(v46, "_firstBaselineOffsetFromTop");
      v75 = v74;
      objc_msgSend(v47, "_firstBaselineOffsetFromTop");
      MinY = MinY + v75 - v76;
    }
    v40 = 8;
    v19 = -v120 - *((double *)&v145 + 1);
    v134 = v131;
    v135 = v130;
    v132 = v123;
    v133 = v122;
    v9 = v124;
    v4 = v125;
    if (v25)
    {
LABEL_16:
      v121 = MinY;
      v77 = v19;
      objc_msgSend(v24, "frame");
      v79 = v78;
      v81 = v80;
      v83 = v82;
      v85 = v84;
      LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v46);
      v90 = v86;
      v91 = v87;
      if (v25 == 2)
      {
        v92 = v88;
        -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v24);
        v136 = v132;
        v137 = v133;
        v138 = v134;
        v139 = v135;
        v140 = v40;
        v19 = v77;
        v141 = v77;
        v93 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, 0.0, *((double *)v142 + 1));
        v9 = v124;
        v98 = UIRectCenteredYInRectScale(v93, v94, v95, v96, LineOfLabel, v90, v91, v92, v124);
        v100 = v99;
        v102 = v101;
      }
      else
      {
        v103 = v79;
        v9 = v124;
        v98 = UIRectCenteredYInRectScale(v103, v81, v83, v85, LineOfLabel, v86, v87, v88, v124);
        v105 = v104;
        v100 = v106;
        v102 = v107;
        v152.origin.y = v122;
        v152.origin.x = v123;
        v152.size.height = v130;
        v152.size.width = v131;
        v108 = v129 * 0.5 + CGRectGetMinY(v152);
        if (v105 >= v108)
          v97 = v105;
        else
          v97 = v108;
        v19 = v77;
      }
      objc_msgSend(v24, "setFrame:", UIRectIntegralWithScale(v98, v97, v100, v102, v9));
      v4 = v125;
      MinY = v121;
    }
  }
LABEL_23:
  if (v24)
  {
    -[_UIValueCellContentViewConfiguration imageView](self->_configuration, "imageView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "cornerRadius");
    _UIApplyCornerRadiusToView(v24, v110);

  }
  if (v47)
  {
    v136 = v132;
    v137 = v133;
    v138 = v134;
    v139 = v135;
    v140 = v40;
    v141 = v19;
    v111 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v136, 0.0, MinY, *((double *)&v145 + 1));
    objc_msgSend(v47, "setFrame:", UIRectIntegralWithScale(v111, v112, v113, v114, v9));
  }
  if (self)
  {
    if (self->_primaryTextFrameDidChangeHandler)
    {
      -[_UIValueCellContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
      v154.origin.x = v115;
      v154.origin.y = v116;
      v154.size.width = v117;
      v154.size.height = v118;
      v153.origin.x = v4;
      v153.size.width = v127;
      v153.origin.y = v128;
      v153.size.height = rect1;
      if (!CGRectEqualToRect(v153, v154))
        (*((void (**)(void))self->_primaryTextFrameDidChangeHandler + 2))();
    }
  }

}

- (NSLayoutRect)_primaryTextLayoutRect
{
  void *v2;
  void *v3;

  -[_UIValueCellContentView textLabel](self, "textLabel");
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

  -[_UIValueCellContentView textLabel](self, "textLabel");
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
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end
