@implementation _UIHostedFocusSystemItemContainer

- (_UIHostedFocusSystemItemContainer)initWithHostedFocusSystem:(id)a3
{
  id v4;
  _UIHostedFocusSystemItemContainer *v5;
  _UIHostedFocusSystemItemContainer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIHostedFocusSystemItemContainer;
  v5 = -[_UIHostedFocusSystemItemContainer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIHostedFocusSystemItemContainer setFocusSystem:](v5, "setFocusSystem:", v4);

  return v6;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_UIHostedFocusSystemItemContainer focusSystem](self, "focusSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusItemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v5;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIHostedFocusSystemItemContainer focusSystem](self, "focusSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegateProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "_focusSystem:focusItemsInRect:", v7, x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (_UIHostedFocusSystem)focusSystem
{
  return (_UIHostedFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (void)setFocusSystem:(id)a3
{
  objc_storeWeak((id *)&self->_focusSystem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end
