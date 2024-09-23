@implementation _UIBasicHeaderFooterContentView

- (_UIBasicHeaderFooterContentView)initWithConfiguration:(id)a3
{
  id v5;
  _UIBasicHeaderFooterContentView *v6;
  _UIBasicHeaderFooterContentView *v7;
  void *v9;
  _QWORD v10[4];
  _UIBasicHeaderFooterContentView *v11;
  id v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBasicHeaderFooterContentView.m"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIBasicHeaderFooterContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57___UIBasicHeaderFooterContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v11 = v6;
    v12 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  return v7;
}

- (_UIBasicHeaderFooterContentView)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UIBasicHeaderFooterContentView *v6;
  _UIBasicHeaderFooterContentView *v7;
  _QWORD v9[4];
  _UIBasicHeaderFooterContentView *v10;
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
  v12.super_class = (Class)_UIBasicHeaderFooterContentView;
  v6 = -[UIView initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49___UIBasicHeaderFooterContentView_initWithCoder___block_invoke;
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
  v5.super_class = (Class)_UIBasicHeaderFooterContentView;
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
  v6.super_class = (Class)_UIBasicHeaderFooterContentView;
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

- (_UIBasicHeaderFooterContentViewConfiguration)configuration
{
  _UIBasicHeaderFooterContentViewConfiguration *animatingToConfiguration;

  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration)
    animatingToConfiguration = self->_configuration;
  return (_UIBasicHeaderFooterContentViewConfiguration *)(id)-[_UIBasicHeaderFooterContentViewConfiguration copy](animatingToConfiguration, "copy");
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UIBasicHeaderFooterContentViewConfiguration *animatingToConfiguration;
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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBasicHeaderFooterContentView.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!-[_UIBasicHeaderFooterContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)|| animatingToConfiguration&& (-[_UIBasicHeaderFooterContentViewConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
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
        v15[2] = __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E16B42F8;
        objc_copyWeak(&v16, &location);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E16B3F40;
        objc_copyWeak(&v14, &location);
        +[_UIContentViewAnimationStateUpdatingLayer layerForView:withUpdateHandler:completionHandler:](_UIContentViewAnimationStateUpdatingLayer, "layerForView:withUpdateHandler:completionHandler:", self, v15, v13);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_3;
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
      -[_UIBasicHeaderFooterContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
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
  UILabel *v10;
  UILabel *v11;
  void *v12;
  id v13;

  v4 = a2;
  if (a1)
  {
    v13 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__applyConfiguration_, a1, CFSTR("_UIBasicHeaderFooterContentView.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    objc_storeStrong(a1 + 55, a2);
    v5 = objc_msgSend(v13, "axesPreservingSuperviewLayoutMargins");
    if ((v5 & 2) != 0)
      v6 = (v5 << 63 >> 63) & 0xA | 5;
    else
      v6 = (v5 << 63 >> 63) & 0xA;
    objc_msgSend(a1, "setEdgesPreservingSuperviewLayoutMargins:", v6);
    objc_msgSend(v13, "directionalLayoutMargins");
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    v7 = a1 + 56;
    objc_msgSend(v13, "textLabel");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v9 = a1;
    v10 = (UILabel *)*v7;
    v11 = v10;
    if (v8 && (v8[2] || v8[7]))
    {
      if (v10)
      {
        if (-[UIView isHidden](v10, "isHidden"))
          -[UIView setHidden:](v11, "setHidden:", 0);
      }
      else
      {
        v11 = objc_alloc_init(UILabel);
        objc_storeStrong(v7, v11);
        objc_msgSend(v9, "addSubview:", v11);
      }
      objc_msgSend(v8, "applyToLabel:", v11);
    }
    else if (v10 && !-[UIView isHidden](v10, "isHidden"))
    {
      -[UIView setHidden:](v11, "setHidden:", 1);
    }

    v9[54] = (id)0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v9, "invalidateIntrinsicContentSize");
    objc_msgSend(v9, "setNeedsLayout");
    v4 = v13;
  }

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
  -[_UIBasicHeaderFooterContentView textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIBasicHeaderFooterContentView textLabel](self, "textLabel");
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
  v2.super_class = (Class)_UIBasicHeaderFooterContentView;
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
  v9.super_class = (Class)_UIBasicHeaderFooterContentView;
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
  -[_UIBasicHeaderFooterContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
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
  -[_UIBasicHeaderFooterContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0)
    v10 = width;
  if (a5 >= 1000.0)
    v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)_computeSizesForAvailableSpace:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;

  if (!a1)
    return 0.0;
  v5 = *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_intrinsicSizeWithinSize:", a2, a3);
    v5 = fmax(v5, fmin(v8, a2));
  }

  return v5;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  _UIBasicHeaderFooterContentViewConfiguration *animatingToConfiguration;
  _UIBasicHeaderFooterContentViewConfiguration *configuration;
  _UIBasicHeaderFooterContentViewConfiguration *v8;
  double preferredMaxLayoutWidth;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    v8 = configuration;
    -[_UIBasicHeaderFooterContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
  }
  else
  {
    v8 = 0;
  }
  if (width >= self->_preferredMaxLayoutWidth)
    preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  else
    preferredMaxLayoutWidth = width;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[_UIBasicHeaderFooterContentView _computeSizesForAvailableSpace:](self, preferredMaxLayoutWidth - v12 - v16, height - v10 - v14);
  v20 = v19;
  if (v8)
    -[_UIBasicHeaderFooterContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
  if (preferredMaxLayoutWidth >= v17 + v13 + v18)
    v21 = v17 + v13 + v18;
  else
    v21 = preferredMaxLayoutWidth;
  if (height >= v15 + v11 + v20)
    height = v15 + v11 + v20;

  v22 = v21;
  v23 = height;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIBasicHeaderFooterContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30[6];
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)_UIBasicHeaderFooterContentView;
  -[UIView layoutSubviews](&v31, sel_layoutSubviews);
  -[_UIBasicHeaderFooterContentView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v5 = v4;
    -[UIView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
    v15 = v14;
    v17 = v16;
    v20 = v13 - v14 - v19;
    v21 = -[_UIBasicHeaderFooterContentView _computeSizesForAvailableSpace:](self, v11 - v16 - v18, v20);
    v30[0] = v7;
    v30[1] = v9;
    v30[2] = v11;
    v30[3] = v13;
    *(_QWORD *)&v30[4] = 2;
    v30[5] = v17;
    v22 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, v30, 0.0, 0.0, v21);
    v26 = UIRectCenteredYInRectScale(v22, v23, v24, v25, 0.0, v15, 0.0, v20, v5);
    objc_msgSend(v3, "setFrame:", UIRectIntegralWithScale(v26, v27, v28, v29, v5));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

@end
