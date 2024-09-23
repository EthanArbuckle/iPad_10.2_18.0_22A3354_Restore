@implementation _SBSystemApertureIndicatorContainerView

- (void)setElementViewController:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_elementViewController);
    objc_storeWeak((id *)&self->_outgoingElementViewController, v5);
    objc_storeWeak((id *)&self->_elementViewController, obj);

  }
}

- (SAUIElementViewControlling)elementViewController
{
  return (SAUIElementViewControlling *)objc_loadWeakRetained((id *)&self->_elementViewController);
}

- (SAUIElementViewControlling)outgoingElementViewController
{
  return (SAUIElementViewControlling *)objc_loadWeakRetained((id *)&self->_outgoingElementViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_outgoingElementViewController);
  objc_destroyWeak((id *)&self->_elementViewController);
}

@end
