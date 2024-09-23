@implementation _UIDebuggingOverlayDetailIvar

- (void)_createVCIfNecessary
{
  UIDebuggingIvarViewController *v3;
  UIDebuggingIvarViewController *vc;

  if (!self->_vc)
  {
    v3 = objc_alloc_init(UIDebuggingIvarViewController);
    vc = self->_vc;
    self->_vc = v3;

  }
}

- (id)viewController
{
  -[_UIDebuggingOverlayDetailIvar _createVCIfNecessary](self, "_createVCIfNecessary");
  return self->_vc;
}

- (void)_updateForInspectedView:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIDebuggingOverlayDetailIvar _createVCIfNecessary](self, "_createVCIfNecessary");
  -[UIDebuggingIvarViewController setInspectedObject:](self->_vc, "setInspectedObject:", v4);

}

- (void)_updateForInspectedViewController:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIDebuggingOverlayDetailIvar _createVCIfNecessary](self, "_createVCIfNecessary");
  -[UIDebuggingIvarViewController setInspectedObject:](self->_vc, "setInspectedObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);
}

@end
