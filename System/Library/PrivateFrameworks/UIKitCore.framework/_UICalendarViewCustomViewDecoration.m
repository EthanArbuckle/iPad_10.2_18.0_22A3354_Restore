@implementation _UICalendarViewCustomViewDecoration

- (_UICalendarViewCustomViewDecoration)initWithCustomViewProvider:(id)a3
{
  id v4;
  _UICalendarViewCustomViewDecoration *v5;
  void *v6;
  id customViewProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICalendarViewCustomViewDecoration;
  v5 = -[_UICalendarViewCustomViewDecoration init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    customViewProvider = v5->_customViewProvider;
    v5->_customViewProvider = v6;

  }
  return v5;
}

- (id)_decorationViewForReuseView:(id)a3
{
  UIView *fulfilledCustomView;
  UIView *v5;
  UIView *v6;
  id customViewProvider;

  fulfilledCustomView = self->_fulfilledCustomView;
  if (!fulfilledCustomView)
  {
    (*((void (**)(void))self->_customViewProvider + 2))();
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_fulfilledCustomView;
    self->_fulfilledCustomView = v5;

    customViewProvider = self->_customViewProvider;
    self->_customViewProvider = 0;

    fulfilledCustomView = self->_fulfilledCustomView;
  }
  return fulfilledCustomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fulfilledCustomView, 0);
  objc_storeStrong(&self->_customViewProvider, 0);
}

@end
