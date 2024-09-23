@implementation _TVWindowSizeAdaptor

- (_TVWindowSizeAdaptor)initWithWindow:(id)a3
{
  id v4;
  _TVWindowSizeAdaptor *v5;
  _TVWindowSizeAdaptor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVWindowSizeAdaptor;
  v5 = -[_TVWindowSizeAdaptor init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_window, v4);
    v6->_allowedInterfaceOrientations = -[_TVWindowSizeAdaptor _supportedOrientations](v6, "_supportedOrientations");
  }

  return v6;
}

- (CGSize)adjustedWindowSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  CGSize result;

  -[_TVWindowSizeAdaptor window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[_TVWindowSizeAdaptor window](self, "window");
  else
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = -[_TVWindowSizeAdaptor _shouldSwapDimensions](self, "_shouldSwapDimensions");
  if (v9)
    v10 = v8;
  else
    v10 = v6;
  if (v9)
    v11 = v6;
  else
    v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)update
{
  unint64_t v3;
  unint64_t allowedInterfaceOrientations;

  v3 = -[_TVWindowSizeAdaptor _supportedOrientations](self, "_supportedOrientations");
  allowedInterfaceOrientations = self->_allowedInterfaceOrientations;
  if (v3 != allowedInterfaceOrientations)
    self->_allowedInterfaceOrientations = v3;
  return v3 != allowedInterfaceOrientations;
}

- (BOOL)_shouldSwapDimensions
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  int v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5)
    return 0;
  v7 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "statusBarOrientation");
  if ((unint64_t)(v7 - 1) > 3)
    LOBYTE(v8) = 0;
  else
    v8 = dword_222E774F0[v7 - 1];
  return (self->_allowedInterfaceOrientations & ((1 << v7) | (unint64_t)(1 << v8))) == 0;
}

- (unint64_t)_supportedOrientations
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  objc_msgSend(WeakRetained, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = objc_msgSend(v4, "supportedInterfaceOrientations");

  return v6;
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
}

@end
