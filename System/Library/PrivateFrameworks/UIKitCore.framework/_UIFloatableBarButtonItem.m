@implementation _UIFloatableBarButtonItem

- (BOOL)_isFloatable
{
  return self->_floatable;
}

- (BOOL)_isFloating
{
  return self->_floatable && self->_floating;
}

- (void)_setFloatable:(BOOL)a3
{
  self->_floatable = a3;
}

- (void)_setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (UIView)_referenceView
{
  return self->_referenceView;
}

- (UIView)_configuredFloatableView
{
  return self->_configuredFloatableView;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFloatableBarButtonItem;
  -[UIBarButtonItem description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    if (-[_UIFloatableBarButtonItem _isFloating](self, "_isFloating"))
    {
      v6 = CFSTR(" _isFloating");
    }
    else
    {
      if (!self->_floatable)
        return v4;
      v6 = CFSTR(" _floatable");
    }
    objc_msgSend(v4, "appendString:", v6);
  }
  return v4;
}

- (void)_setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (void)_setConfiguredFloatableView:(id)a3
{
  objc_storeStrong((id *)&self->_configuredFloatableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_configuredFloatableView, 0);
}

@end
