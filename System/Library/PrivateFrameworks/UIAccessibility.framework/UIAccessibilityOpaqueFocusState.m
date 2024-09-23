@implementation UIAccessibilityOpaqueFocusState

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  CGRect v13;

  -[UIAccessibilityOpaqueFocusState element](self, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = -[UIAccessibilityOpaqueFocusState hasFocus](self, "hasFocus");
    -[UIAccessibilityOpaqueFocusState element](self, "element");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityOpaqueFocusState element](self, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityOpaqueFocusState sceneRelativeFrame](self, "sceneRelativeFrame");
    NSStringFromCGRect(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityOpaqueFocusState reusableView](self, "reusableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Has focus: %i\nElement: %@ (%@)\nScene relative frame: %@\nReusable view: %@\nHas been reused: %i"), v5, v6, v8, v9, v10, -[UIAccessibilityOpaqueFocusState hasBeenReused](self, "hasBeenReused"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("No focused element");
  }
  return v11;
}

- (void)setElement:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&self->_element);

  if (WeakRetained != obj)
  {
    objc_storeWeak(&self->_element, obj);
    -[UIAccessibilityOpaqueFocusState setHasFocus:](self, "setHasFocus:", obj != 0);
    if (obj)
    {
      if ((objc_msgSend(obj, "isAccessibilityElement") & 1) == 0
        && (objc_msgSend(obj, "isAccessibilityOpaqueElementProvider") & 1) == 0
        && (objc_msgSend(obj, "_accessibilityIsRemoteElement") & 1) == 0
        && (objc_msgSend(obj, "_accessibilityIsGroupedParent") & 1) == 0)
      {
        objc_msgSend(obj, "description");
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v5, "UTF8String");
        _AXAssert();

      }
    }
  }

}

- (id)element
{
  return objc_loadWeakRetained(&self->_element);
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (void)setHasFocus:(BOOL)a3
{
  self->_hasFocus = a3;
}

- (CGRect)sceneRelativeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sceneRelativeFrame.origin.x;
  y = self->_sceneRelativeFrame.origin.y;
  width = self->_sceneRelativeFrame.size.width;
  height = self->_sceneRelativeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSceneRelativeFrame:(CGRect)a3
{
  self->_sceneRelativeFrame = a3;
}

- (UIView)reusableView
{
  return self->_reusableView;
}

- (void)setReusableView:(id)a3
{
  objc_storeStrong((id *)&self->_reusableView, a3);
}

- (BOOL)hasBeenReused
{
  return self->_hasBeenReused;
}

- (void)setHasBeenReused:(BOOL)a3
{
  self->_hasBeenReused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableView, 0);
  objc_destroyWeak(&self->_element);
}

@end
