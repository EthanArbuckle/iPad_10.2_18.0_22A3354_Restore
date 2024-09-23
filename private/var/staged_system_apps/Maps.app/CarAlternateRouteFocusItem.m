@implementation CarAlternateRouteFocusItem

- (CarAlternateRouteFocusItem)initWithRoute:(id)a3 containingView:(id)a4 frame:(CGRect)a5 delegate:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  CarAlternateRouteFocusItem *v16;
  CarAlternateRouteFocusItem *v17;
  objc_super v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CarAlternateRouteFocusItem;
  v16 = -[CarAlternateRouteFocusItem init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_route, v13);
    objc_storeWeak((id *)&v17->_containingView, v14);
    v17->_frame.origin.x = x;
    v17->_frame.origin.y = y;
    v17->_frame.size.width = width;
    v17->_frame.size.height = height;
    objc_storeWeak((id *)&v17->_delegate, v15);
  }

  return v17;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarAlternateRouteFocusItem;
  v3 = -[CarAlternateRouteFocusItem description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = NSStringFromCGRect(self->_frame);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@, %@)"), v4, v6, v8));

  return (NSString *)v9;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_containingView);
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self));
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self));
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CarAlternateRouteFocusItem *v5;
  id WeakRetained;

  v5 = (CarAlternateRouteFocusItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextFocusedItem"));
  -[CarAlternateRouteFocusItem setFocused:](self, "setFocused:", v5 == self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routeItemDidUpdateFocus:", self);

}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)objc_loadWeakRetained((id *)&self->_route);
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void)setFocused:(BOOL)a3
{
  self->_focused = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_route);
  objc_destroyWeak((id *)&self->_containingView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
