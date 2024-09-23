@implementation _UIAbstractDynamicButtonGestureRecognizer

- (_UIAbstractDynamicButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIAbstractDynamicButtonGestureRecognizer *v4;
  _UIAbstractDynamicButtonGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_UIAbstractDynamicButtonGestureRecognizer setDelaysTouchesBegan:](v4, "setDelaysTouchesBegan:", 0);
    -[_UIAbstractDynamicButtonGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[_UIAbstractDynamicButtonGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
  }
  return v5;
}

- (void)setDelaysTouchesBegan:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIAbstractDynamicButtonGestureRecognizer *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  objc_super v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = setDelaysTouchesBegan____s_category;
    if (!setDelaysTouchesBegan____s_category)
    {
      v4 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&setDelaysTouchesBegan____s_category);
    }
    v5 = *(id *)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = self;
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "delaysTouchesBegan was called on %@ with an unsupported value of true. This gesture currently does not support delaying touches. This value will be ignored.", buf, 0xCu);

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
    -[UIGestureRecognizer setDelaysTouchesBegan:](&v11, sel_setDelaysTouchesBegan_);
  }
}

- (void)setDelaysTouchesEnded:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIAbstractDynamicButtonGestureRecognizer *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  objc_super v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = setDelaysTouchesEnded____s_category;
    if (!setDelaysTouchesEnded____s_category)
    {
      v4 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&setDelaysTouchesEnded____s_category);
    }
    v5 = *(id *)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = self;
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "delaysTouchesEnded was called on %@ with an unsupported value of true. This gesture currently does not support delaying touches. This value will be ignored.", buf, 0xCu);

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
    -[UIGestureRecognizer setDelaysTouchesEnded:](&v11, sel_setDelaysTouchesEnded_);
  }
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIAbstractDynamicButtonGestureRecognizer *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  objc_super v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = setCancelsTouchesInView____s_category;
    if (!setCancelsTouchesInView____s_category)
    {
      v4 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&setCancelsTouchesInView____s_category);
    }
    v5 = *(id *)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = self;
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "cancelsTouchesInView was called on %@ with an unsupported value of true. This gesture currently does not support cancelling touches. This value will be ignored.", buf, 0xCu);

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
    -[UIGestureRecognizer setCancelsTouchesInView:](&v11, sel_setCancelsTouchesInView_);
  }
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 16 && -[UIGestureRecognizer shouldReceiveEvent:](self, "shouldReceiveEvent:", a3);
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAbstractDynamicButtonGestureRecognizer.m"), 90, CFSTR("Must be overridden by subclasses"));

  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  unsigned int v4;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
  v4 = -[UIGestureRecognizer _affectedByGesture:](&v7, sel__affectedByGesture_);
  isKindOfClass = 0;
  if (a3 && v4)
  {
    if ((*((_QWORD *)a3 + 1) & 0x4000000000000000) != 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (unint64_t)_allowedPhysicalButtons
{
  return self->_allowedPhysicalButtons;
}

- (void)_setAllowedPhysicalButtons:(unint64_t)a3
{
  self->_allowedPhysicalButtons = a3;
}

@end
