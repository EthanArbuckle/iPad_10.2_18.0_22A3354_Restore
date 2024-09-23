@implementation _UITextInputSessionKeyboardDockItemButtonPressAction

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UITextInputSessionKeyboardDockItemButtonPressAction;
  -[_UITextInputSessionAction description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonType:](UITextInputSessionActionAnalytics, "stringForKeyboardDockItemButtonType:", -[_UITextInputSessionKeyboardDockItemButtonPressAction buttonType](self, "buttonType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("buttonType=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  +[UITextInputSessionActionAnalytics stringForKeyboardDockItemButtonPressResult:](UITextInputSessionActionAnalytics, "stringForKeyboardDockItemButtonPressResult:", -[_UITextInputSessionKeyboardDockItemButtonPressAction buttonPressResult](self, "buttonPressResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("buttonPressResult=%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uiOrientation=%lu"), -[_UITextInputSessionKeyboardDockItemButtonPressAction uiOrientation](self, "uiOrientation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)inputActionCount
{
  unint64_t v3;
  int64_t result;

  v3 = -[_UITextInputSessionKeyboardDockItemButtonPressAction buttonPressResult](self, "buttonPressResult");
  result = -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions");
  if (v3 != 2)
    ++result;
  return result;
}

- (unint64_t)buttonPressResult
{
  return self->_buttonPressResult;
}

- (void)setButtonPressResult:(unint64_t)a3
{
  self->_buttonPressResult = a3;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)uiOrientation
{
  return self->_uiOrientation;
}

- (void)setUiOrientation:(int64_t)a3
{
  self->_uiOrientation = a3;
}

- (CGSize)buttonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonSize.width;
  height = self->_buttonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (CGPoint)touchDownPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchDownPoint.x;
  y = self->_touchDownPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchDownPoint:(CGPoint)a3
{
  self->_touchDownPoint = a3;
}

- (CGPoint)touchUpPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchUpPoint.x;
  y = self->_touchUpPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchUpPoint:(CGPoint)a3
{
  self->_touchUpPoint = a3;
}

- (double)touchDuration
{
  return self->_touchDuration;
}

- (void)setTouchDuration:(double)a3
{
  self->_touchDuration = a3;
}

@end
