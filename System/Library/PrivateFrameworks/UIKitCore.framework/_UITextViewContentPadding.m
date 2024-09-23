@implementation _UITextViewContentPadding

- (_UITextViewContentPadding)initWithDelegate:(id)a3
{
  id v4;
  _UITextViewContentPadding *v5;
  _UITextViewContentPadding *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewContentPadding;
  v5 = -[_UITextViewContentPadding init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (double)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 != self->_targetValue)
  {
    self->_targetValue = a3;
    -[_UITextViewContentPadding _checkNewCurrentValue](self, "_checkNewCurrentValue");
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[_UITextViewContentPadding _checkNewCurrentValue](self, "_checkNewCurrentValue");
  }
}

- (_UITextViewContentPaddingDelegate)delegate
{
  return (_UITextViewContentPaddingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_checkNewCurrentValue
{
  double targetValue;
  double currentValue;
  id v5;

  targetValue = self->_targetValue;
  currentValue = self->_currentValue;
  if (self->_mode != 1)
  {
    if (currentValue == targetValue)
      return;
LABEL_7:
    self->_currentValue = targetValue;
    -[_UITextViewContentPadding delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_textViewContentPaddingDidChange:", self);

    return;
  }
  if (currentValue < targetValue)
    targetValue = self->_currentValue;
  if (currentValue > targetValue)
    goto LABEL_7;
}

- (void)increaseToValue:(double)targetValue
{
  id v4;

  if (self->_mode == 1)
  {
    if (self->_targetValue <= targetValue)
      targetValue = self->_targetValue;
    if (targetValue > self->_currentValue)
    {
      self->_currentValue = targetValue;
      -[_UITextViewContentPadding delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_textViewContentPaddingDidChange:", self);

    }
  }
}

- (void)resetCurrentValue
{
  id v3;

  if (self->_mode == 1 && self->_currentValue != 0.0)
  {
    self->_currentValue = 0.0;
    -[_UITextViewContentPadding delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_textViewContentPaddingDidChange:", self);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_mode)
    v5 = CFSTR("flexible");
  else
    v5 = CFSTR("fixed");
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("mode"), v5);
  NSStringFromSelector(sel_currentValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  NSStringFromSelector(sel_targetValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendKeys:", v9);

  objc_msgSend(v4, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end
