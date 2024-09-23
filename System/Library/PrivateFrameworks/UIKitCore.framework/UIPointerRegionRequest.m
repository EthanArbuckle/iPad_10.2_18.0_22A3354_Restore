@implementation UIPointerRegionRequest

- (BOOL)_isPencilInitiated
{
  void *v5;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPointerInteraction.m"), 713, CFSTR("This may only be used in Springboard!"));

  }
  return -[UIPointerRegionRequest _pointerType](self, "_pointerType") == 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CGPoint v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UIPointerRegionRequest location](self, "location");
  NSStringFromCGPoint(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; location = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (UIKeyModifierFlags)modifiers
{
  return self->_modifiers;
}

- (void)setModifiers:(int64_t)a3
{
  self->_modifiers = a3;
}

- (int64_t)_pointerType
{
  return self->__pointerType;
}

- (void)set_pointerType:(int64_t)a3
{
  self->__pointerType = a3;
}

@end
