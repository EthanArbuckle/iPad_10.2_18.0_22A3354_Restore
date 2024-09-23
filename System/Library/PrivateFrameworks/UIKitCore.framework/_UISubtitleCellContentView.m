@implementation _UISubtitleCellContentView

- (_UISubtitleCellContentView)initWithConfiguration:(id)a3
{
  id v5;
  _UISubtitleCellContentView *v6;
  _UISubtitleCellContentView *v7;
  void *v9;
  _QWORD v10[4];
  _UISubtitleCellContentView *v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISubtitleCellContentView.m"), 443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UISubtitleCellContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52___UISubtitleCellContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v11 = v6;
    v12 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  return v7;
}

- (_UISubtitleCellContentView)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UISubtitleCellContentView *v6;
  _UISubtitleCellContentView *v7;
  _QWORD v9[4];
  _UISubtitleCellContentView *v10;
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
  v12.super_class = (Class)_UISubtitleCellContentView;
  v6 = -[UIView initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44___UISubtitleCellContentView_initWithCoder___block_invoke;
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
  v5.super_class = (Class)_UISubtitleCellContentView;
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
  v6.super_class = (Class)_UISubtitleCellContentView;
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

- (_UISubtitleCellContentViewConfiguration)configuration
{
  _UISubtitleCellContentViewConfiguration *animatingToConfiguration;

  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration)
    animatingToConfiguration = self->_configuration;
  return (_UISubtitleCellContentViewConfiguration *)(id)-[_UISubtitleCellContentViewConfiguration copy](animatingToConfiguration, "copy");
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UISubtitleCellContentViewConfiguration *animatingToConfiguration;
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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISubtitleCellContentView.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (-[_UIContentViewEditingController isDisplayingEditedText](self->_editingController, "isDisplayingEditedText")
    || !-[_UISubtitleCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UISubtitleCellContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
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
        v15[2] = __47___UISubtitleCellContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E16B42F8;
        objc_copyWeak(&v16, &location);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __47___UISubtitleCellContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E16B3F40;
        objc_copyWeak(&v14, &location);
        +[_UIContentViewAnimationStateUpdatingLayer layerForView:withUpdateHandler:completionHandler:](_UIContentViewAnimationStateUpdatingLayer, "layerForView:withUpdateHandler:completionHandler:", self, v15, v13);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __47___UISubtitleCellContentView_setConfiguration___block_invoke_3;
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
      -[_UISubtitleCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
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
  _UIContentViewEditingController *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v4 = a2;
  if (a1)
  {
    v26 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__applyConfiguration_, a1, CFSTR("_UISubtitleCellContentView.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    objc_storeStrong(a1 + 56, a2);
    v5 = objc_msgSend(v26, "axesPreservingSuperviewLayoutMargins");
    if ((v5 & 2) != 0)
      v6 = (v5 << 63 >> 63) & 0xA | 5;
    else
      v6 = (v5 << 63 >> 63) & 0xA;
    objc_msgSend(a1, "setEdgesPreservingSuperviewLayoutMargins:", v6);
    objc_msgSend(v26, "directionalLayoutMargins");
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 57;
    objc_msgSend(v26, "imageView");
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

    objc_msgSend(v26, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UIUpdateLabelUsingConfiguration(v9, v9 + 58, v12);

    objc_msgSend(v26, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _UIUpdateLabelUsingConfiguration(v9, v9 + 59, v13);

    objc_msgSend(v26, "_textLabelEditingConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v9[55];

      if (!v15)
      {
        v16 = [_UIContentViewEditingController alloc];
        objc_msgSend(v9, "textLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[_UIContentViewEditingController initWithContentView:editableLabel:](v16, "initWithContentView:editableLabel:", v9, v17);
        v19 = v9[55];
        v9[55] = (id)v18;

      }
    }
    v20 = v9[55];
    objc_msgSend(v26, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_textLabelEditingConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateLabelConfiguration:editingConfiguration:", v21, v22);

    objc_msgSend(v26, "_textLabelEditingConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = v9[55];
      v9[55] = 0;

    }
    v9[54] = (id)0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v9, "invalidateIntrinsicContentSize");
    objc_msgSend(v9, "setNeedsLayout");
    v4 = v26;
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

- (UILabel)subtitleLabel
{
  UILabel *subtitleLabel;

  if (-[UIView isHidden](self->_subtitleLabel, "isHidden"))
    subtitleLabel = 0;
  else
    subtitleLabel = self->_subtitleLabel;
  return subtitleLabel;
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  void *v2;
  BOOL v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if ((*(_QWORD *)&self->super._viewFlags & 0x20000000000000) != 0)
  {
    -[_UISubtitleCellContentView textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5
      || (-[_UISubtitleCellContentView textLabel](self, "textLabel"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "numberOfLines") == 1))
    {
      -[_UISubtitleCellContentView subtitleLabel](self, "subtitleLabel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[_UISubtitleCellContentView subtitleLabel](self, "subtitleLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v8, "numberOfLines") != 1;

        if (!v5)
        {
LABEL_9:

          return v3;
        }
      }
      else
      {
        v3 = 0;
        if (!v5)
          goto LABEL_9;
      }
    }
    else
    {
      v3 = 1;
    }

    goto LABEL_9;
  }
  return 0;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)_UISubtitleCellContentView;
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
  v9.super_class = (Class)_UISubtitleCellContentView;
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
  -[_UISubtitleCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
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
  -[_UISubtitleCellContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
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
  void *v45;
  void *v46;
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
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  float64x2_t v62;
  double v63;
  double v64;
  float64x2_t v66;

  if (!a2)
  {
    *(_QWORD *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
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
  *(float64x2_t *)(a1 + 80) = v9;
  *(float64x2_t *)(a1 + 96) = v9;
  v62 = v9;
  *(_QWORD *)(a1 + 112) = 0;
  objc_msgSend(a2, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maximumSize");
  v66.f64[0] = v13;
  v66.f64[1] = v14;

  v15 = 0;
  if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v10))
  {
    objc_msgSend(a2[56], "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v16, v11, &v66);

    if ((ShouldUseAccessibilityTextWrappingLayout & 1) != 0)
    {
      v15 = 2;
      *(_QWORD *)a1 = 2;
      if (!v11)
      {
        v64 = *v7;
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
  v61 = v19;
  v63 = v20;
  objc_msgSend(v11, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reservedLayoutSize");
  v24 = _UIContentViewImageViewLayoutHeight(v21, v10, v63, v23, v66.f64[1]);
  *(double *)(a1 + 32) = v24;

  objc_msgSend(a2, "directionalLayoutMargins");
  v27 = v25 + v26;
  v28.f64[0] = a3;
  if (v24 >= v63)
    v27 = -0.0;
  v28.f64[1] = a4 + v27;
  v29.f64[0] = v61;
  v29.f64[1] = v63;
  v30 = vmaxnmq_f64(v62, vminnmq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v66), vbslq_s8((int8x16_t)vcgtq_f64(v66, v28), (int8x16_t)v28, (int8x16_t)v66), (int8x16_t)v28)));
  v31 = v61 != v30.f64[0];
  if (v63 != v30.f64[1])
    v31 = 1;
  if (v61 > 0.0 && v31 && v63 > 0.0)
  {
    v30.f64[0] = v30.f64[0] / v61;
    v32 = v30.f64[1] / v63;
    if (v30.f64[0] < v30.f64[1] / v63)
      v32 = v30.f64[0];
    v30 = vmulq_n_f64(v29, v32);
  }
  *(float64x2_t *)v7 = v30;
  v64 = v30.f64[0];
  if (v18)
  {
    *(_QWORD *)(a1 + 40) = 0;
    v8 = (double *)MEMORY[0x1E0C9D820];
LABEL_26:
    objc_msgSend(a2[56], "imageToTextPadding");
    v41 = v64 + v42;
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
    v37 = v36[6] == 1;
  else
    v37 = 0;
  v8 = (double *)MEMORY[0x1E0C9D820];
  v38 = _UIContentViewImageViewHorizontalCenteringOffset(v33, v10, v37, v64, v35);
  *(double *)(a1 + 40) = v38;

  v39 = v64 + v38 + v38;
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

  objc_msgSend(a2, "subtitleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2[56], "subtitleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v45, v46, v15, 0.0);

  *(double *)(a1 + 112) = v41;
  if (v43)
  {
    objc_msgSend(v43, "_intrinsicSizeWithinSize:", a3, a4);
    v49 = fmax(v8[1], fmin(v48, a4));
    *(double *)(a1 + 48) = fmax(*v8, fmin(v47, a3));
    *(double *)(a1 + 56) = v49;
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a1 + 48);
  }
  if (v45)
  {
    v50 = *(double *)(a1 + 88);
    objc_msgSend(a2[56], "textToSubtitlePadding");
    v52 = a4 - (v50 + v51);
    objc_msgSend(v45, "_intrinsicSizeWithinSize:", a3, v52);
    v54 = fmax(*v8, fmin(v53, a3));
    v56 = fmax(v8[1], fmin(v55, v52));
    *(double *)(a1 + 64) = v54;
    *(double *)(a1 + 72) = v56;
    if (*(double *)(a1 + 80) >= v54)
      v54 = *(double *)(a1 + 80);
    *(double *)(a1 + 80) = v54;
    objc_msgSend(a2[56], "textToSubtitlePadding");
    *(double *)(a1 + 88) = v50 + v56 + v57;
  }
  objc_msgSend(a2[55], "textInputView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    if (!v43 || objc_msgSend(v43, "isHidden"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", sel__computeSizesForAvailableSpace_, a2, CFSTR("_UISubtitleCellContentView.m"), 708, CFSTR("The text label should exist if there is a text input view"));

    }
    v59 = *(_QWORD *)(a1 + 56);
    *(double *)(a1 + 96) = a3 - v41;
    *(_QWORD *)(a1 + 104) = v59;
  }

}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  _UISubtitleCellContentViewConfiguration *animatingToConfiguration;
  _UISubtitleCellContentViewConfiguration *configuration;
  _UISubtitleCellContentViewConfiguration *v8;
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
  __int128 v41;
  uint64_t v42;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    v8 = configuration;
    -[_UISubtitleCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
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
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  -[_UISubtitleCellContentView _computeSizesForAvailableSpace:]((uint64_t)&v35, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v14 - v18, height - v12 - v16);
  v20 = v19 + v15 + *(double *)&v40;
  v21 = v17 + v13 + *((double *)&v40 + 1);
  if ((_QWORD)v35 != 2)
  {
    v22 = v20 + *((double *)&v36 + 1);
    if (*((double *)&v36 + 1) > 0.0 && v20 > 0.0)
    {
      -[_UISubtitleCellContentViewConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding", *((double *)&v36 + 1));
      v22 = v22 + v23;
    }
    if (v17 + v13 + *(double *)&v37 >= v21)
      v21 = v17 + v13 + *(double *)&v37;
    v20 = v22;
  }
  -[_UISubtitleCellContentView textLabel](self, "textLabel");
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
    -[_UISubtitleCellContentViewConfiguration textLabel](self->_configuration, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "font");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "minimumContentViewHeightForFont:traitCollection:", v27, v9);
  v30 = v29;
  if (v8)
    -[_UISubtitleCellContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
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
  v4.super_class = (Class)_UISubtitleCellContentView;
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
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
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
  CGFloat v39;
  uint64_t v40;
  double MinY;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double MaxY;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double LineOfLabel;
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
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
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
  void *v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  double v116;
  double v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  double v130;
  uint64_t v131;
  double v132;
  _OWORD v133[2];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  double v139;
  objc_super v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  v140.receiver = self;
  v140.super_class = (Class)_UISubtitleCellContentView;
  -[UIView layoutSubviews](&v140, sel_layoutSubviews);
  -[_UISubtitleCellContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
  v120 = v4;
  v121 = v3;
  v118 = v6;
  v119 = v5;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v8 = v7;
  -[UIView bounds](self, "bounds");
  v122 = v10;
  v123 = v9;
  v12 = v11;
  v14 = v13;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v16 = v15;
  v18 = v17;
  v139 = 0.0;
  v21 = v14 - v15 - v20;
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v134 = 0u;
  memset(v133, 0, sizeof(v133));
  -[_UISubtitleCellContentView _computeSizesForAvailableSpace:]((uint64_t)v133, (id *)&self->super.super.super.isa, v12 - v17 - v19, v21);
  -[_UISubtitleCellContentView imageView](self, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)&v133[0];
  v126 = v8;
  v113 = v14;
  v114 = v12;
  if (!v22 || *(_QWORD *)&v133[0] == 2)
  {
    v40 = 2;
    v39 = v122;
    v125 = v123;
  }
  else
  {
    v24 = *((double *)&v134 + 1);
    v127 = v123;
    v128 = v122;
    v129 = v12;
    v130 = v14;
    v131 = 2;
    v132 = v18 + *((double *)&v134 + 1);
    v25 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, 0.0, *((double *)v133 + 1));
    v29 = UIRectCenteredYInRectScale(v25, v26, v27, v28, 0.0, v16, 0.0, v21, v8);
    v33 = UIRectIntegralWithScale(v29, v30, v31, v32, v8);
    v35 = v34;
    v12 = v36;
    v14 = v37;
    v125 = v33;
    objc_msgSend(v22, "setFrame:");
    -[_UISubtitleCellContentViewConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding");
    v18 = v24 + v38;
    v39 = v35;
    v8 = v126;
    v40 = 8;
  }
  v141.origin.x = UIRectCenteredYInRectScale(0.0, 0.0, *(double *)&v137, *((double *)&v137 + 1), 0.0, v16, 0.0, v21, v8);
  MinY = CGRectGetMinY(v141);
  -[_UISubtitleCellContentView textLabel](self, "textLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = MinY;
  v43 = v125;
  if (v42)
  {
    v127 = v125;
    v128 = v39;
    v115 = v39;
    v116 = v12;
    v129 = v12;
    v130 = v14;
    v117 = v14;
    v131 = v40;
    v132 = v18;
    v44 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, MinY, *(double *)&v135);
    v48 = UIRectIntegralWithScale(v44, v45, v46, v47, v126);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    objc_msgSend(v42, "setFrame:");
    v142.origin.x = v48;
    v142.origin.y = v50;
    v142.size.width = v52;
    v142.size.height = v54;
    MaxY = CGRectGetMaxY(v142);
    -[_UISubtitleCellContentViewConfiguration textToSubtitlePadding](self->_configuration, "textToSubtitlePadding");
    MinY = MaxY + v56;
    if (v23)
    {
      objc_msgSend(v22, "frame");
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;
      LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v42);
      if (v23 == 2)
      {
        v69 = v68;
        v70 = v67;
        v71 = v66;
        v72 = LineOfLabel;
        -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v22);
        v127 = v125;
        v128 = v115;
        v129 = v116;
        v130 = v117;
        v131 = v40;
        v132 = v18;
        v73 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, 0.0, *((double *)v133 + 1));
        v74 = v126;
        v79 = UIRectCenteredYInRectScale(v73, v75, v76, v77, v72, v71, v70, v69, v126);
        v81 = v80;
        v83 = v82;
      }
      else
      {
        v74 = v126;
        v79 = UIRectCenteredYInRectScale(v58, v60, v62, v64, LineOfLabel, v66, v67, v68, v126);
        v85 = v84;
        v81 = v86;
        v83 = v87;
        v143.origin.y = v122;
        v143.origin.x = v123;
        v143.size.height = v113;
        v143.size.width = v114;
        v88 = v16 * 0.5 + CGRectGetMinY(v143);
        if (v85 >= v88)
          v78 = v85;
        else
          v78 = v88;
      }
      objc_msgSend(v22, "setFrame:", UIRectIntegralWithScale(v79, v78, v81, v83, v74));
      v12 = v116;
      v14 = v117;
      v39 = v115;
      v43 = v125;
    }
    else
    {
      v12 = v116;
      v39 = v115;
    }
  }
  if (v22)
  {
    -[_UISubtitleCellContentViewConfiguration imageView](self->_configuration, "imageView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "cornerRadius");
    _UIApplyCornerRadiusToView(v22, v90);

  }
  -[_UISubtitleCellContentView subtitleLabel](self, "subtitleLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v127 = v43;
    v128 = v39;
    v129 = v12;
    v130 = v14;
    v131 = v40;
    v132 = v18;
    v92 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, MinY, *(double *)&v136);
    objc_msgSend(v91, "setFrame:", UIRectIntegralWithScale(v92, v93, v94, v95, v126));
  }
  -[_UIContentViewEditingController textInputView](self->_editingController, "textInputView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    v127 = v43;
    v128 = v39;
    v129 = v12;
    v130 = v14;
    v131 = v40;
    v132 = v18 + v139;
    v97 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v127, 0.0, v124, *(double *)&v138);
    v101 = UIRectIntegralWithScale(v97, v98, v99, v100, v126);
    v103 = v102;
    v105 = v104;
    v107 = v106;
    -[_UIContentViewEditingController textInputView](self->_editingController, "textInputView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

  }
  if (self->_primaryTextFrameDidChangeHandler)
  {
    -[_UISubtitleCellContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
    v145.origin.x = v109;
    v145.origin.y = v110;
    v145.size.width = v111;
    v145.size.height = v112;
    v144.origin.y = v120;
    v144.origin.x = v121;
    v144.size.height = v118;
    v144.size.width = v119;
    if (!CGRectEqualToRect(v144, v145))
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
    v6[2] = __50___UISubtitleCellContentView_becomeFirstResponder__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    return -[_UIContentViewEditingController makeTextInputFirstResponderWithInitialLayoutBlock:](editingController, "makeTextInputFirstResponderWithInitialLayoutBlock:", v6);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UISubtitleCellContentView;
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

  -[_UISubtitleCellContentView textLabel](self, "textLabel");
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

  -[_UISubtitleCellContentView textLabel](self, "textLabel");
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_primaryTextFrameDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_editingController, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end
