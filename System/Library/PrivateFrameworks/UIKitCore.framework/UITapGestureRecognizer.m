@implementation UITapGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  int v13;

  if (objc_msgSend(a3, "_isGestureType:", 0))
  {
    v5 = a3;
    v6 = objc_msgSend(v5, "numberOfTouchesRequired");
    if (v6 == -[UITapGestureRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired"))
    {
      v7 = objc_msgSend(v5, "buttonMaskRequired");
      if (v7 == -[UITapGestureRecognizer buttonMaskRequired](self, "buttonMaskRequired"))
      {
        v8 = objc_msgSend(v5, "numberOfTapsRequired");
        v9 = v8 > -[UITapGestureRecognizer numberOfTapsRequired](self, "numberOfTapsRequired");
LABEL_9:

        return !v9;
      }
    }
    goto LABEL_8;
  }
  if (objc_msgSend(a3, "_isGestureType:", 1))
  {
    v5 = a3;
    v10 = objc_msgSend(v5, "numberOfTouchesRequired");
    if (v10 == -[UITapGestureRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired"))
    {
      v11 = objc_msgSend(v5, "numberOfTapsRequired");
      v9 = v11 >= -[UITapGestureRecognizer numberOfTapsRequired](self, "numberOfTapsRequired");
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(a3, "numberOfFullTaps");
    v9 = -[UITapGestureRecognizer numberOfTapsRequired](self, "numberOfTapsRequired") <= v13;
  }
  else
  {
    v9 = 0;
  }
  return !v9;
}

- (NSUInteger)numberOfTouchesRequired
{
  return -[UITapRecognizer numberOfTouchesRequired](self->_imp, "numberOfTouchesRequired");
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 0;
}

- (NSUInteger)numberOfTapsRequired
{
  return -[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired");
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  if (self->_delaysRecognitionForGreaterTapCounts)
  {
    if (objc_msgSend(a3, "_isGestureType:", 0))
    {
      v5 = objc_msgSend(a3, "numberOfTouchesRequired");
      if (v5 == -[UITapGestureRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired"))
      {
        v6 = objc_msgSend(a3, "buttonMaskRequired");
        if (v6 == -[UITapGestureRecognizer buttonMaskRequired](self, "buttonMaskRequired"))
        {
          v7 = objc_msgSend(a3, "numberOfTapsRequired");
          if (v7 > -[UITapGestureRecognizer numberOfTapsRequired](self, "numberOfTapsRequired"))
            return 1;
        }
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UITapGestureRecognizer;
  return -[UIGestureRecognizer shouldRequireFailureOfGestureRecognizer:](&v9, sel_shouldRequireFailureOfGestureRecognizer_, a3);
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UITapRecognizer _reset](self->_imp, "_reset");
  v3.receiver = self;
  v3.super_class = (Class)UITapGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imp, 0);
}

- (UITapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UITapGestureRecognizer *v4;
  UITapRecognizer *v5;
  UITapRecognizer *imp;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITapGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(UITapRecognizer);
    imp = v4->_imp;
    v4->_imp = v5;

    -[UITapRecognizer setDelegate:](v4->_imp, "setDelegate:", v4);
    v4->_buttonType = -1;
  }
  return v4;
}

- (int64_t)_buttonType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setAllowedPressTypes:(id)a3
{
  UITapRecognizer *imp;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)UITapGestureRecognizer;
  -[UIGestureRecognizer setAllowedPressTypes:](&v14, sel_setAllowedPressTypes_, a3);
  imp = self->_imp;
  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = -1;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "integerValue");
      if (v11 != v9 && v11 <= 3)
      {
        v13 = v9 == -1;
        v9 = v11;
        if (!v13)
          break;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
  }
  v9 = -1;
LABEL_16:
  -[UITapRecognizer setExclusiveDirectionalAxis:](imp, "setExclusiveDirectionalAxis:", v9);

}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return -[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (-[UITapGestureRecognizer _canHandleTouches](self, "_canHandleTouches"))
    -[UITapRecognizer touchesBegan:withEvent:](self->_imp, "touchesBegan:withEvent:", a3, a4);
  else
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[UITapGestureRecognizer _canHandleTouches](self, "_canHandleTouches"))
    -[UITapRecognizer touchesEnded:withEvent:](self->_imp, "touchesEnded:withEvent:", a3, a4);
}

- (BOOL)_canHandleTouches
{
  return -[UITapGestureRecognizer _buttonType](self, "_buttonType") == -1;
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  CGPoint *p_locationInView;
  void *v6;
  CGFloat v7;
  CGFloat v8;

  p_locationInView = &self->_locationInView;
  -[UIGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "locationInView:", v6);
  p_locationInView->x = v7;
  p_locationInView->y = v8;

  -[UIGestureRecognizer setState:](self, "setState:", -[UITapGestureRecognizer _finalStateForRecognition](self, "_finalStateForRecognition"));
}

- (int64_t)_finalStateForRecognition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  void *v9;
  void *v10;

  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 3;
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "isFrontBoard"))
  {
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isSystemGestureWindow") ^ 1;

  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(v5, "_focusSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_focusedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 3;
  if (v7 && v10)
  {
    if (objc_msgSend(v10, "isDescendantOfView:", v5))
      v8 = 3;
    else
      v8 = 5;
  }

  return v8;
}

- (double)_touchSloppinessFactor
{
  void *v2;
  double v3;
  double v4;

  -[UIGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_touchSloppinessFactor");
  v4 = v3;

  return v4;
}

- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired
{
  -[UITapRecognizer setNumberOfTapsRequired:](self->_imp, "setNumberOfTapsRequired:", numberOfTapsRequired);
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
  -[UITapRecognizer setNumberOfTouchesRequired:](self->_imp, "setNumberOfTouchesRequired:", numberOfTouchesRequired);
}

- (void)setAllowableMovement:(double)a3
{
  -[UITapRecognizer setAllowableMovement:](self->_imp, "setAllowableMovement:", a3);
}

- (void)setMaximumTapDuration:(double)a3
{
  -[UITapRecognizer setMaximumTapDuration:](self->_imp, "setMaximumTapDuration:", a3);
}

- (void)_setAllowableTouchTimeSeparation:(double)a3
{
  -[UITapRecognizer setAllowableTouchTimeSeparation:](self->_imp, "setAllowableTouchTimeSeparation:", a3);
}

- (void)_setAllowableSeparation:(double)a3
{
  -[UITapRecognizer setAllowableSeparation:](self->_imp, "setAllowableSeparation:", a3);
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)setMaximumIntervalBetweenSuccessiveTaps:(double)a3
{
  -[UITapRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self->_imp, "setMaximumIntervalBetweenSuccessiveTaps:", a3);
}

- (void)_appendSubclassDescription:(id)a3
{
  if (-[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired") != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; numberOfTapsRequired = %ld"),
      -[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired"));
  if (-[UITapRecognizer numberOfTouchesRequired](self->_imp, "numberOfTouchesRequired") != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; numberOfTouchesRequired = %ld"),
      -[UITapRecognizer numberOfTouchesRequired](self->_imp, "numberOfTouchesRequired"));
  if (-[UITapRecognizer buttonMaskRequired](self->_imp, "buttonMaskRequired") != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; buttonMaskRequired = %ld"),
      -[UITapRecognizer buttonMaskRequired](self->_imp, "buttonMaskRequired"));
}

- (void)dealloc
{
  objc_super v3;

  -[UITapRecognizer setDelegate:](self->_imp, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UITapGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)_setDelaysRecognitionForGreaterTapCounts:(BOOL)a3
{
  self->_delaysRecognitionForGreaterTapCounts = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITapGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_imp, CFSTR("UITapGestureRecognizer._imp"));
}

- (UITapGestureRecognizer)initWithCoder:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  uint64_t v6;
  UITapRecognizer *imp;
  UITapGestureRecognizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITapGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithCoder:](&v10, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    v4->_buttonType = -1;
    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITapGestureRecognizer._imp"));
    v6 = objc_claimAutoreleasedReturnValue();
    imp = v5->_imp;
    v5->_imp = (UITapRecognizer *)v6;

    -[UITapRecognizer setDelegate:](v5->_imp, "setDelegate:", v5);
    v8 = v5;
  }

  return v5;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (-[UITapGestureRecognizer _canHandleTouches](self, "_canHandleTouches"))
    -[UITapRecognizer touchesMoved:withEvent:](self->_imp, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (-[UITapGestureRecognizer _canHandleTouches](self, "_canHandleTouches"))
    -[UITapRecognizer touchesCancelled:withEvent:](self->_imp, "touchesCancelled:withEvent:", a3, a4);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (-[UITapGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:"))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  else
  {
    -[UITapRecognizer pressesBegan:withEvent:](self->_imp, "pressesBegan:withEvent:", a3, a4);
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  -[UITapRecognizer pressesChanged:withEvent:](self->_imp, "pressesChanged:withEvent:", a3, a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  -[UITapRecognizer pressesEnded:withEvent:](self->_imp, "pressesEnded:withEvent:", a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[UITapRecognizer pressesCancelled:withEvent:](self->_imp, "pressesCancelled:withEvent:", a3, a4);
}

- (BOOL)_shouldReceivePress:(id)a3
{
  BOOL v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITapGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v10, sel__shouldReceivePress_))
  {
    v5 = 1;
  }
  else
  {
    v6 = -[UITapGestureRecognizer _buttonType](self, "_buttonType");
    v5 = v6 == objc_msgSend(a3, "type");
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UITapGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:", v7, 0);

  return v5 || v8;
}

- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;

  if (self->_isSingleKeyPressGesture
    && (-[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes", a3, a4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _UIPressesOnlyContainsPressTypes(a3, v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (NSArray)touches
{
  return -[UITapRecognizer touches](self->_imp, "touches");
}

- (UIEventButtonMask)buttonMaskRequired
{
  return -[UITapRecognizer buttonMaskRequired](self->_imp, "buttonMaskRequired");
}

- (void)setButtonMaskRequired:(UIEventButtonMask)buttonMaskRequired
{
  void *v6;

  if (buttonMaskRequired <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITapGestureRecognizer.m"), 909, CFSTR("buttonMaskRequired must be greater than 0"));

  }
  -[UITapRecognizer setButtonMaskRequired:](self->_imp, "setButtonMaskRequired:", buttonMaskRequired);
}

- (double)allowableMovement
{
  double result;

  -[UITapRecognizer allowableMovement](self->_imp, "allowableMovement");
  return result;
}

- (double)_allowableSeparation
{
  double result;

  -[UITapRecognizer allowableSeparation](self->_imp, "allowableSeparation");
  return result;
}

- (double)_allowableTouchTimeSeparation
{
  double result;

  -[UITapRecognizer allowableTouchTimeSeparation](self->_imp, "allowableTouchTimeSeparation");
  return result;
}

- (double)maximumSingleTapDuration
{
  return 0.75;
}

- (double)maximumTapDuration
{
  double result;

  -[UITapRecognizer maximumTapDuration](self->_imp, "maximumTapDuration");
  return result;
}

- (double)maximumIntervalBetweenSuccessiveTaps
{
  double result;

  -[UITapRecognizer maximumIntervalBetweenSuccessiveTaps](self->_imp, "maximumIntervalBetweenSuccessiveTaps");
  return result;
}

- (BOOL)_delaysRecognitionForGreaterTapCounts
{
  return self->_delaysRecognitionForGreaterTapCounts != 0;
}

- (void)_setButtonType:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[UITapGestureRecognizer _buttonType](self, "_buttonType") != a3)
  {
    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITapGestureRecognizer.m"), 984, CFSTR("_buttonType can't be changed after a gesture recognizer is added to a view"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", v8);

  }
}

- (CGPoint)centroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInView.x;
  y = self->_locationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInView.x;
  y = self->_locationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UITapRecognizer locationInView:](self->_imp, "locationInView:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (unint64_t)numberOfTouches
{
  void *v2;
  unint64_t v3;

  -[UITapRecognizer touches](self->_imp, "touches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  CGPoint result;

  -[UITapRecognizer touches](self->_imp, "touches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a3)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("-[%@ %@]"), v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99858];
    -[UITapRecognizer touches](self->_imp, "touches");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise:format:", v21, CFSTR("%@: index (%ld) beyond bounds (%ld)."), v10, a3, objc_msgSend(v22, "count"));

    v13 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[UITapRecognizer touches](self->_imp, "touches");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", a4);
    v13 = v12;
    v15 = v14;

  }
  v23 = v13;
  v24 = v15;
  result.y = v24;
  result.x = v23;
  return result;
}

- (CGPoint)_digitizerLocation
{
  UITapRecognizer *imp;
  double x;
  double y;
  CGPoint result;

  imp = self->_imp;
  if (imp)
  {
    x = imp->_digitizerLocation.x;
    y = imp->_digitizerLocation.y;
  }
  else
  {
    y = 0.0;
    x = 0.0;
  }
  result.y = y;
  result.x = x;
  return result;
}

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (BOOL)isSingleKeyPressGesture
{
  return self->_isSingleKeyPressGesture;
}

- (void)setIsSingleKeyPressGesture:(BOOL)a3
{
  self->_isSingleKeyPressGesture = a3;
}

@end
