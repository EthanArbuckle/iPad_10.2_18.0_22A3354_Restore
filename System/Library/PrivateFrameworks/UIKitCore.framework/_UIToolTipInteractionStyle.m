@implementation _UIToolTipInteractionStyle

- (_UIToolTipInteractionStyle)initWithView:(id)a3 provider:(id)a4
{
  id v5;
  id v6;
  _UIToolTipInteractionStyle *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIToolTipInteractionStyle;
  v5 = a4;
  v6 = a3;
  v7 = -[_UIToolTipInteractionStyle init](&v9, sel_init);
  objc_storeWeak((id *)&v7->_view, v6);

  objc_storeWeak((id *)&v7->_provider, v5);
  return v7;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UIToolTipProvider)provider
{
  return (UIToolTipProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_view);
}

@end
