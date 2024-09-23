@implementation PXHUDBoxedValueVisualization

- (void)setValue:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_value != v5)
  {
    v6 = v5;
    objc_storeStrong(&self->_value, a3);
    -[PXHUDVisualization _notifyDelegateVisualizationDidChange](self, "_notifyDelegateVisualizationDidChange");
    v5 = v6;
  }

}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
