@implementation MCKeyboardState

- (MCKeyboardState)initWithUserInterfaceIdiom:(int64_t)a3 isSplitKeyboard:(BOOL)a4 isFloatingKeyboard:(BOOL)a5 isHardwareKeyboard:(BOOL)a6
{
  MCKeyboardState *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCKeyboardState;
  result = -[MCKeyboardState init](&v11, sel_init);
  if (result)
  {
    result->_userInterfaceIdiom = a3;
    result->_isSplitKeyboard = a4;
    result->_isFloatingKeyboard = a5;
    result->_isHardwareKeyboard = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_QWORD *)result + 2) = self->_userInterfaceIdiom;
    *((_BYTE *)result + 8) = self->_isSplitKeyboard;
    *((_BYTE *)result + 9) = self->_isFloatingKeyboard;
    *((_BYTE *)result + 10) = self->_isHardwareKeyboard;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("i=%ld, s=%d, f=%d, h=%d"), -[MCKeyboardState userInterfaceIdiom](self, "userInterfaceIdiom"), -[MCKeyboardState isSplitKeyboard](self, "isSplitKeyboard"), -[MCKeyboardState isFloatingKeyboard](self, "isFloatingKeyboard"), -[MCKeyboardState isHardwareKeyboard](self, "isHardwareKeyboard"));
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (BOOL)isSplitKeyboard
{
  return self->_isSplitKeyboard;
}

- (BOOL)isFloatingKeyboard
{
  return self->_isFloatingKeyboard;
}

- (BOOL)isHardwareKeyboard
{
  return self->_isHardwareKeyboard;
}

@end
