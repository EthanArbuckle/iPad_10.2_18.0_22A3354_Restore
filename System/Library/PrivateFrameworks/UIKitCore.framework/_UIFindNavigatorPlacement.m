@implementation _UIFindNavigatorPlacement

- (_UIFindNavigatorKeyboardPlacement)keyboardPlacement
{
  return 0;
}

- (_UIFindNavigatorInlinePlacement)inlinePlacement
{
  return 0;
}

- (BOOL)isShowing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

@end
