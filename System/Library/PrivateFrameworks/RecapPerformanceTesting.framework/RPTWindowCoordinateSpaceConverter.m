@implementation RPTWindowCoordinateSpaceConverter

- (id)initFromWindow:(id)a3 toScreen:(id)a4
{
  id v7;
  id v8;
  RPTWindowCoordinateSpaceConverter *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPTWindowCoordinateSpaceConverter;
  v9 = -[RPTWindowCoordinateSpaceConverter init](&v12, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_window, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (CGPoint)convertPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  UIWindow *window;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPoint result;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isiOSAppOnMac");

  if (v7)
  {
    -[RPTWindowCoordinateSpaceConverter window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nsWindowProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPointFromUIWindow:", x, y);
    v11 = v10;
    v13 = v12;

    -[RPTWindowCoordinateSpaceConverter window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nsWindowProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPointToScreen:", v11, v13);
    v17 = v16;
    v19 = v18;

    -[RPTWindowCoordinateSpaceConverter window](self, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nsScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v22 = CGRectGetHeight(v29) - v19;

  }
  else
  {
    window = self->_window;
    -[UIScreen fixedCoordinateSpace](self->_screen, "fixedCoordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow convertPoint:toCoordinateSpace:](window, "convertPoint:toCoordinateSpace:", v20, x, y);
    v17 = v24;
    v22 = v25;
  }

  v26 = v17;
  v27 = v22;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGSize)convertSize:(CGSize)a3
{
  double height;
  double width;
  UIWindow *window;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  window = self->_window;
  -[UIScreen fixedCoordinateSpace](self->_screen, "fixedCoordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow convertRect:toCoordinateSpace:](window, "convertRect:toCoordinateSpace:", v6, 0.0, 0.0, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGRect)convertRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIWindow *window;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  window = self->_window;
  -[UIScreen fixedCoordinateSpace](self->_screen, "fixedCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow convertRect:toCoordinateSpace:](window, "convertRect:toCoordinateSpace:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGVector)convertVector:(CGVector)a3
{
  double dy;
  double dx;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  -[RPTWindowCoordinateSpaceConverter convertPoint:](self, "convertPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v7 = v6;
  v9 = v8;
  -[RPTWindowCoordinateSpaceConverter convertPoint:](self, "convertPoint:", dx, dy);
  v11 = v10 - v7;
  v13 = v12 - v9;
  result.dy = v13;
  result.dx = v11;
  return result;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
  objc_storeStrong((id *)&self->_screen, a3);
}

- (id)nsScreen
{
  return self->_nsScreen;
}

- (void)setNsScreen:(id)a3
{
  objc_storeStrong(&self->_nsScreen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nsScreen, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
