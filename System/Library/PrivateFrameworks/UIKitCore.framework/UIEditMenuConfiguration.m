@implementation UIEditMenuConfiguration

+ (UIEditMenuConfiguration)configurationWithIdentifier:(id)identifier sourcePoint:(CGPoint)sourcePoint
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;

  y = sourcePoint.y;
  x = sourcePoint.x;
  v7 = identifier;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v10);

  }
  objc_msgSend(v9, "setSourcePoint:", x, y);
  objc_msgSend(v9, "set_ignoresPassthroughInView:", 0);

  return (UIEditMenuConfiguration *)v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  void *v11;
  CGPoint v13;

  -[NSObject _ui_descriptionBuilder](self, "_ui_descriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEditMenuConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v4);

  -[UIEditMenuConfiguration sourcePoint](self, "sourcePoint");
  NSStringFromCGPoint(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("sourcePoint"), v6);

  v8 = -[UIEditMenuConfiguration preferredArrowDirection](self, "preferredArrowDirection") - 1;
  if (v8 > 3)
    v9 = CFSTR(".automatic");
  else
    v9 = off_1E16EAEF0[v8];
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("arrowDirection"), v9);
  objc_msgSend(v3, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGPoint)sourcePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_sourcePoint.x;
  y = self->_sourcePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSourcePoint:(CGPoint)a3
{
  self->_sourcePoint = a3;
}

- (UIEditMenuArrowDirection)preferredArrowDirection
{
  return self->_preferredArrowDirection;
}

- (void)setPreferredArrowDirection:(UIEditMenuArrowDirection)preferredArrowDirection
{
  self->_preferredArrowDirection = preferredArrowDirection;
}

- (BOOL)_ignoresPassthroughInView
{
  return self->__ignoresPassthroughInView;
}

- (void)set_ignoresPassthroughInView:(BOOL)a3
{
  self->__ignoresPassthroughInView = a3;
}

- (BOOL)_prefersMenuPresentationInView
{
  return self->__prefersMenuPresentationInView;
}

- (void)set_prefersMenuPresentationInView:(BOOL)a3
{
  self->__prefersMenuPresentationInView = a3;
}

- (UIResponder)_firstResponderTarget
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->__firstResponderTarget);
}

- (void)set_firstResponderTarget:(id)a3
{
  objc_storeWeak((id *)&self->__firstResponderTarget, a3);
}

- (UIWindow)_overrideSourceWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->__overrideSourceWindow);
}

- (void)set_overrideSourceWindow:(id)a3
{
  objc_storeWeak((id *)&self->__overrideSourceWindow, a3);
}

- (BOOL)_ignoresKeyboardAvoidance
{
  return self->__ignoresKeyboardAvoidance;
}

- (void)set_ignoresKeyboardAvoidance:(BOOL)a3
{
  self->__ignoresKeyboardAvoidance = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__overrideSourceWindow);
  objc_destroyWeak((id *)&self->__firstResponderTarget);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
