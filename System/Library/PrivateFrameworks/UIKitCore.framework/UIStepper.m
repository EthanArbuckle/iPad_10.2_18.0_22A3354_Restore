@implementation UIStepper

- (UIStepper)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  UIStepper *v8;
  UIStepper *v9;
  objc_super v11;

  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialSize");
  v11.receiver = self;
  v11.super_class = (Class)UIStepper;
  v8 = -[UIControl initWithFrame:](&v11, sel_initWithFrame_, x, y, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[UIStepper _commonStepperInit](v8, "_commonStepperInit");
    -[UIStepper _refreshVisualElement](v9, "_refreshVisualElement");
  }
  return v9;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStepper;
  v4 = a3;
  -[UIView _populateArchivedSubviews:](&v6, sel__populateArchivedSubviews_, v4);
  -[UIStepper visualElement](self, "visualElement", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

}

- (void)setFrame:(CGRect)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v8;

  y = a3.origin.y;
  x = a3.origin.x;
  -[UIStepper sizeThatFits:](self, "sizeThatFits:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)UIStepper;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, v6, v7);
}

- (void)setValue:(double)value
{
  double maximumValue;
  id v4;

  if (self->_minimumValue > value)
    value = self->_minimumValue;
  if (value >= self->_maximumValue)
    maximumValue = self->_maximumValue;
  else
    maximumValue = value;
  if (maximumValue != self->_value)
  {
    self->_value = maximumValue;
    -[UIStepper visualElement](self, "visualElement");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:", maximumValue);

  }
}

- (void)setMinimumValue:(double)minimumValue
{
  double value;
  id v6;

  if (self->_minimumValue != minimumValue)
  {
    if (self->_maximumValue < minimumValue)
      -[UIStepper setMaximumValue:](self, "setMaximumValue:", minimumValue);
    self->_minimumValue = minimumValue;
    value = self->_value;
    if (value < minimumValue)
      value = minimumValue;
    -[UIStepper setValue:](self, "setValue:", value);
    -[UIStepper visualElement](self, "visualElement");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumValue:", minimumValue);

  }
}

- (void)setMaximumValue:(double)maximumValue
{
  double value;
  id v6;

  if (self->_maximumValue != maximumValue)
  {
    if (self->_minimumValue > maximumValue)
      -[UIStepper setMinimumValue:](self, "setMinimumValue:", maximumValue);
    self->_maximumValue = maximumValue;
    value = self->_value;
    if (value >= maximumValue)
      value = maximumValue;
    -[UIStepper setValue:](self, "setValue:", value);
    -[UIStepper visualElement](self, "visualElement");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumValue:", maximumValue);

  }
}

- (void)setStepValue:(double)stepValue
{
  id v5;

  if (self->_stepValue != stepValue)
  {
    if (stepValue <= 0.0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("stepValue must be greater than 0"));
    self->_stepValue = stepValue;
    -[UIStepper visualElement](self, "visualElement");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStepValue:", stepValue);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[UIControl isEnabled](self, "isEnabled") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStepper;
    -[UIControl setEnabled:](&v6, sel_setEnabled_, v3);
    -[UIStepper visualElement](self, "visualElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIStepper visualElement](self, "visualElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "sizeThatFits:forControl:", self, width, height);
  else
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialSize");
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIStepper visualElement](self, "visualElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "intrinsicSizeWithinSize:forControl:", self, width, height);
  else
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialIntrinsicSize");
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
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
  UIEdgeInsets result;

  -[UIStepper visualElement](self, "visualElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "alignmentRectInsetsForControl:", self);
  else
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialAlignmentRectInsets");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setContinuous:(BOOL)continuous
{
  _BOOL8 v3;
  id v4;

  if (self->_continuous != continuous)
  {
    v3 = continuous;
    self->_continuous = continuous;
    -[UIStepper visualElement](self, "visualElement");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContinuous:", v3);

  }
}

- (void)setAutorepeat:(BOOL)autorepeat
{
  _BOOL8 v3;
  id v4;

  if (self->_autorepeat != autorepeat)
  {
    v3 = autorepeat;
    self->_autorepeat = autorepeat;
    -[UIStepper visualElement](self, "visualElement");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAutorepeat:", v3);

  }
}

- (void)setWraps:(BOOL)wraps
{
  _BOOL8 v3;
  id v4;

  if (self->_wraps != wraps)
  {
    v3 = wraps;
    self->_wraps = wraps;
    -[UIStepper visualElement](self, "visualElement");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWraps:", v3);

  }
}

- (UIStepper)initWithCoder:(id)a3
{
  id v4;
  UIStepper *v5;
  UIStepper *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIStepper;
  v5 = -[UIControl initWithCoder:](&v12, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIStepper _commonStepperInit](v5, "_commonStepperInit");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIValue")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIValue"));
      v6->_value = v7;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMinimumValue")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIMinimumValue"));
      v6->_minimumValue = v8;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMaximumValue")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIMaximumValue"));
      v6->_maximumValue = v9;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIStepValue")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIStepValue"));
      v6->_stepValue = v10;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIContinuous")))
      v6->_continuous = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIContinuous"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAutorepeat")))
      v6->_autorepeat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAutorepeat"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIWraps")))
      v6->_wraps = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIWraps"));
    -[UIStepper _refreshVisualElement](v6, "_refreshVisualElement");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStepper;
  -[UIControl encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_value != 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIValue"));
  if (self->_minimumValue != 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIMinimumValue"));
  if (self->_maximumValue != 100.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIMaximumValue"));
  if (self->_stepValue != 1.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIStepValue"));
  if (!self->_continuous)
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIContinuous"));
  if (!self->_autorepeat)
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIAutorepeat"));
  if (self->_wraps)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIWraps"));

}

- (void)_commonStepperInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *dividerImages;
  NSMutableDictionary *v5;
  NSMutableDictionary *backgroundImages;
  NSMutableDictionary *v7;
  NSMutableDictionary *incrementImages;
  NSMutableDictionary *v9;
  NSMutableDictionary *decrementImages;

  self->_maximumValue = 100.0;
  self->_stepValue = 1.0;
  self->_continuous = 1;
  self->_autorepeat = 1;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  dividerImages = self->_dividerImages;
  self->_dividerImages = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  backgroundImages = self->_backgroundImages;
  self->_backgroundImages = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  incrementImages = self->_incrementImages;
  self->_incrementImages = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  decrementImages = self->_decrementImages;
  self->_decrementImages = v9;

}

+ (void)_registerVisualElementClass:(Class)a3 forIdiom:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = (void *)__stepperIdiomsToVisualElementClasses;
  if (!__stepperIdiomsToVisualElementClasses)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__stepperIdiomsToVisualElementClasses;
    __stepperIdiomsToVisualElementClasses = v7;

    v6 = (void *)__stepperIdiomsToVisualElementClasses;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", a3, v9);

}

+ (Class)_fallbackVisualElementClass
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  +[UITraitCollection _fallbackTraitCollection]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualElementClassForTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (Class)visualElementClassForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  v5 = (void *)__stepperIdiomsToVisualElementClasses;
  if (__stepperIdiomsToVisualElementClasses
    && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "userInterfaceIdiom")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v6),
        v6,
        v7))
  {
    v8 = v7;
  }
  else
  {
    objc_opt_self();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return (Class)v9;
}

+ (id)visualElementForTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "visualElementClassForTraitCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "alloc"), "init");

  return v4;
}

- (void)_refreshVisualElement
{
  id v3;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStepper _refreshVisualElementForTraitCollection:populatingAPIProperties:](self, "_refreshVisualElementForTraitCollection:populatingAPIProperties:", v3, 0);

}

- (void)_refreshVisualElementForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *dividerImages;
  uint64_t v13;
  id v14;
  NSMutableDictionary *incrementImages;
  id v16;
  NSMutableDictionary *decrementImages;
  id v18;
  NSMutableDictionary *backgroundImages;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "visualElementForTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStepper.m"), 314, CFSTR("Nil UIStepper visual element"));

  }
  -[UIStepper visualElement](self, "visualElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[UIStepper visualElement](self, "visualElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStepperControl:", 0);

  -[UIStepper setVisualElement:](self, "setVisualElement:", v8);
  objc_msgSend(v8, "setStepperControl:", self);
  -[UIView addSubview:](self, "addSubview:", v8);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  objc_msgSend(v8, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
  -[UIStepper minimumValue](self, "minimumValue");
  objc_msgSend(v8, "setMinimumValue:");
  -[UIStepper maximumValue](self, "maximumValue");
  objc_msgSend(v8, "setMaximumValue:");
  -[UIStepper value](self, "value");
  objc_msgSend(v8, "setValue:");
  -[UIStepper stepValue](self, "stepValue");
  objc_msgSend(v8, "setStepValue:");
  objc_msgSend(v8, "setContinuous:", -[UIStepper isContinuous](self, "isContinuous"));
  objc_msgSend(v8, "setWraps:", -[UIStepper wraps](self, "wraps"));
  objc_msgSend(v8, "setAutorepeat:", -[UIStepper autorepeat](self, "autorepeat"));
  if (v4)
  {
    -[UIView tintColor](self, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v11);

  }
  dividerImages = self->_dividerImages;
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke;
  v28[3] = &unk_1E16C3410;
  v14 = v8;
  v29 = v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dividerImages, "enumerateKeysAndObjectsUsingBlock:", v28);
  incrementImages = self->_incrementImages;
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_2;
  v26[3] = &unk_1E16C3438;
  v16 = v14;
  v27 = v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](incrementImages, "enumerateKeysAndObjectsUsingBlock:", v26);
  decrementImages = self->_decrementImages;
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_3;
  v24[3] = &unk_1E16C3438;
  v18 = v16;
  v25 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](decrementImages, "enumerateKeysAndObjectsUsingBlock:", v24);
  backgroundImages = self->_backgroundImages;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_4;
  v22[3] = &unk_1E16C3438;
  v23 = v18;
  v21 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](backgroundImages, "enumerateKeysAndObjectsUsingBlock:", v22);

}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v5 = a3;
  objc_msgSend(a2, "getValue:size:", &v6, 16);
  objc_msgSend(*(id *)(a1 + 32), "setDividerImage:forLeftSegmentState:rightSegmentState:", v5, v6, v7);

}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setIncrementImage:forState:", v5, objc_msgSend(a2, "unsignedIntegerValue"));

}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setDecrementImage:forState:", v5, objc_msgSend(a2, "unsignedIntegerValue"));

}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setBackgroundImage:forState:", v5, objc_msgSend(a2, "unsignedIntegerValue"));

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIStepper *v5;
  UIStepper *v6;
  UIStepper *v7;
  UIStepper *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIStepper;
  -[UIControl hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIStepper *)objc_claimAutoreleasedReturnValue();
  -[UIStepper visualElement](self, "visualElement");
  v6 = (UIStepper *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = self;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[UIStepper visualElement](self, "visualElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "beginTrackingWithTouch:withEvent:", v7, v6);

  return v9;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[UIStepper visualElement](self, "visualElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "continueTrackingWithTouch:withEvent:", v7, v6);

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIStepper visualElement](self, "visualElement");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endTrackingWithTouch:withEvent:", v7, v6);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIStepper visualElement](self, "visualElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelTrackingWithEvent:", v4);

}

- (void)visualElementDidSetValue:(id)a3
{
  double v4;

  objc_msgSend(a3, "value");
  self->_value = v4;
}

- (void)_emitValueChanged
{
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIStepper visualElement](self, "visualElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EDDF7040);

  if (v12)
  {
    -[UIStepper visualElement](self, "visualElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pointerInteraction:regionForRequest:defaultRegion:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[UIStepper visualElement](self, "visualElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EDDF7040))
  {
    -[UIStepper visualElement](self, "visualElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[UIStepper visualElement](self, "visualElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointerInteraction:styleForRegion:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[UIStepper visualElement](self, "visualElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EDDF7040))
    goto LABEL_4;
  -[UIStepper visualElement](self, "visualElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[UIStepper visualElement](self, "visualElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointerInteraction:willEnterRegion:animator:", v13, v8, v9);
LABEL_4:

  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[UIStepper visualElement](self, "visualElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EDDF7040))
    goto LABEL_4;
  -[UIStepper visualElement](self, "visualElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[UIStepper visualElement](self, "visualElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointerInteraction:willExitRegion:animator:", v13, v8, v9);
LABEL_4:

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  UIStepper *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (UIStepper *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || !objc_msgSend(v4, "_isGestureType:", 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
  NSMutableDictionary *backgroundImages;
  void *v7;
  UIImage *v8;
  void *v9;
  id v10;

  backgroundImages = self->_backgroundImages;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = image;
  objc_msgSend(v7, "numberWithUnsignedInteger:", state);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](backgroundImages, "setObject:forKeyedSubscript:", v8, v9);

  -[UIStepper visualElement](self, "visualElement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundImage:forState:", v8, state);

}

- (UIImage)backgroundImageForState:(UIControlState)state
{
  void *v4;
  void *v5;

  -[UIStepper visualElement](self, "visualElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundImageForState:", state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setDividerImage:(UIImage *)image forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState
{
  NSMutableDictionary *dividerImages;
  void *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  UIControlState v13;
  UIControlState v14;

  dividerImages = self->_dividerImages;
  v13 = leftState;
  v14 = rightState;
  v9 = (void *)MEMORY[0x1E0CB3B18];
  v10 = image;
  objc_msgSend(v9, "valueWithBytes:objCType:", &v13, "{?=QQ}");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](dividerImages, "setObject:forKeyedSubscript:", v10, v11, v13, v14);

  -[UIStepper visualElement](self, "visualElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDividerImage:forLeftSegmentState:rightSegmentState:", v10, leftState, rightState);

}

- (UIImage)dividerImageForLeftSegmentState:(UIControlState)state rightSegmentState:(UIControlState)a4
{
  void *v6;
  void *v7;

  -[UIStepper visualElement](self, "visualElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dividerImageForLeftSegmentState:rightSegmentState:", state, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

- (void)setIncrementImage:(UIImage *)image forState:(UIControlState)state
{
  NSMutableDictionary *incrementImages;
  void *v7;
  UIImage *v8;
  void *v9;
  id v10;

  incrementImages = self->_incrementImages;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = image;
  objc_msgSend(v7, "numberWithUnsignedInteger:", state);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](incrementImages, "setObject:forKeyedSubscript:", v8, v9);

  -[UIStepper visualElement](self, "visualElement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncrementImage:forState:", v8, state);

}

- (UIImage)incrementImageForState:(UIControlState)state
{
  void *v4;
  void *v5;

  -[UIStepper visualElement](self, "visualElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementImageForState:", state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setDecrementImage:(UIImage *)image forState:(UIControlState)state
{
  NSMutableDictionary *decrementImages;
  void *v7;
  UIImage *v8;
  void *v9;
  id v10;

  decrementImages = self->_decrementImages;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = image;
  objc_msgSend(v7, "numberWithUnsignedInteger:", state);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](decrementImages, "setObject:forKeyedSubscript:", v8, v9);

  -[UIStepper visualElement](self, "visualElement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDecrementImage:forState:", v8, state);

}

- (UIImage)decrementImageForState:(UIControlState)state
{
  void *v4;
  void *v5;

  -[UIStepper visualElement](self, "visualElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decrementImageForState:", state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStepper;
  v4 = a3;
  -[UIView setTintColor:](&v6, sel_setTintColor_, v4);
  -[UIStepper visualElement](self, "visualElement", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStepper;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UIStepper visualElement](self, "visualElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorDidChange");

}

- (double)value
{
  return self->_value;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)stepValue
{
  return self->_stepValue;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (BOOL)autorepeat
{
  return self->_autorepeat;
}

- (BOOL)wraps
{
  return self->_wraps;
}

- (UIStepperVisualElement)visualElement
{
  return self->_visualElement;
}

- (void)setVisualElement:(id)a3
{
  objc_storeStrong((id *)&self->_visualElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualElement, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
  objc_storeStrong((id *)&self->_decrementImages, 0);
  objc_storeStrong((id *)&self->_incrementImages, 0);
  objc_storeStrong((id *)&self->_dividerImages, 0);
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xFD | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 1) & 1;
}

@end
