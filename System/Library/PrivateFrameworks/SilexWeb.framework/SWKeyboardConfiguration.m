@implementation SWKeyboardConfiguration

- (SWKeyboardConfiguration)initWithKeyboardFrame:(CGRect)a3 inputAccessoryViewFrame:(CGRect)a4 isKeyboardSplit:(BOOL)a5 isKeyboardFloating:(BOOL)a6 isHardwareKeyboard:(BOOL)a7 isKeyboardVisible:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  SWKeyboardConfiguration *v20;
  SWKeyboardConfiguration *v21;
  objc_super v23;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3.size.height;
  v17 = a3.size.width;
  v18 = a3.origin.y;
  v19 = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)SWKeyboardConfiguration;
  v20 = -[SWKeyboardConfiguration init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[SWKeyboardConfiguration setKeyboardFrame:](v20, "setKeyboardFrame:", v19, v18, v17, v16);
    -[SWKeyboardConfiguration setInputAccessoryViewFrame:](v21, "setInputAccessoryViewFrame:", x, y, width, height);
    -[SWKeyboardConfiguration setIsKeyboardSplit:](v21, "setIsKeyboardSplit:", v11);
    -[SWKeyboardConfiguration setIsKeyboardFloating:](v21, "setIsKeyboardFloating:", v10);
    -[SWKeyboardConfiguration setIsHardwareKeyboard:](v21, "setIsHardwareKeyboard:", v9);
    -[SWKeyboardConfiguration setIsKeyboardVisible:](v21, "setIsKeyboardVisible:", v8);
  }
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SWKeyboardConfiguration initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:]([SWKeyboardConfiguration alloc], "initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:", self->_isKeyboardSplit, self->_isKeyboardFloating, self->_isHardwareKeyboard, self->_isKeyboardVisible, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height, self->_inputAccessoryViewFrame.origin.x, self->_inputAccessoryViewFrame.origin.y, self->_inputAccessoryViewFrame.size.width, self->_inputAccessoryViewFrame.size.height);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  int v30;
  int v31;
  int v32;
  int v33;
  _BOOL4 v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!v5)
      goto LABEL_8;
    -[SWKeyboardConfiguration keyboardFrame](self, "keyboardFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "keyboardFrame");
    v38.origin.x = v14;
    v38.origin.y = v15;
    v38.size.width = v16;
    v38.size.height = v17;
    v36.origin.x = v7;
    v36.origin.y = v9;
    v36.size.width = v11;
    v36.size.height = v13;
    if (!CGRectEqualToRect(v36, v38))
      goto LABEL_8;
    -[SWKeyboardConfiguration inputAccessoryViewFrame](self, "inputAccessoryViewFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v5, "inputAccessoryViewFrame");
    v39.origin.x = v26;
    v39.origin.y = v27;
    v39.size.width = v28;
    v39.size.height = v29;
    v37.origin.x = v19;
    v37.origin.y = v21;
    v37.size.width = v23;
    v37.size.height = v25;
    if (!CGRectEqualToRect(v37, v39))
      goto LABEL_8;
    v30 = -[SWKeyboardConfiguration isKeyboardSplit](self, "isKeyboardSplit");
    if (v30 == objc_msgSend(v5, "isKeyboardSplit")
      && (v31 = -[SWKeyboardConfiguration isKeyboardFloating](self, "isKeyboardFloating"),
          v31 == objc_msgSend(v5, "isKeyboardFloating"))
      && (v32 = -[SWKeyboardConfiguration isHardwareKeyboard](self, "isHardwareKeyboard"),
          v32 == objc_msgSend(v5, "isHardwareKeyboard")))
    {
      v35 = -[SWKeyboardConfiguration isKeyboardVisible](self, "isKeyboardVisible");
      v33 = v35 ^ objc_msgSend(v5, "isKeyboardVisible") ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v33) = 0;
    }

  }
  else
  {
    LOBYTE(v33) = 0;
  }

  return v33;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  CGRect v7;
  CGRect v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWKeyboardConfiguration keyboardFrame](self, "keyboardFrame");
  NSStringFromCGRect(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardFrame: %@"), v4);

  -[SWKeyboardConfiguration inputAccessoryViewFrame](self, "inputAccessoryViewFrame");
  NSStringFromCGRect(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputAccessoryViewFrame: %@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("; isKeyboardSplit: %d"),
    -[SWKeyboardConfiguration isKeyboardSplit](self, "isKeyboardSplit"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; isKeyboardFloating: %d"),
    -[SWKeyboardConfiguration isKeyboardFloating](self, "isKeyboardFloating"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; isHardwareKeyboard: %d"),
    -[SWKeyboardConfiguration isHardwareKeyboard](self, "isHardwareKeyboard"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; isKeyboardVisible: %d"),
    -[SWKeyboardConfiguration isKeyboardVisible](self, "isKeyboardVisible"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (CGRect)inputAccessoryViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputAccessoryViewFrame.origin.x;
  y = self->_inputAccessoryViewFrame.origin.y;
  width = self->_inputAccessoryViewFrame.size.width;
  height = self->_inputAccessoryViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputAccessoryViewFrame:(CGRect)a3
{
  self->_inputAccessoryViewFrame = a3;
}

- (BOOL)isKeyboardSplit
{
  return self->_isKeyboardSplit;
}

- (void)setIsKeyboardSplit:(BOOL)a3
{
  self->_isKeyboardSplit = a3;
}

- (BOOL)isKeyboardFloating
{
  return self->_isKeyboardFloating;
}

- (void)setIsKeyboardFloating:(BOOL)a3
{
  self->_isKeyboardFloating = a3;
}

- (BOOL)isHardwareKeyboard
{
  return self->_isHardwareKeyboard;
}

- (void)setIsHardwareKeyboard:(BOOL)a3
{
  self->_isHardwareKeyboard = a3;
}

- (BOOL)isKeyboardVisible
{
  return self->_isKeyboardVisible;
}

- (void)setIsKeyboardVisible:(BOOL)a3
{
  self->_isKeyboardVisible = a3;
}

@end
