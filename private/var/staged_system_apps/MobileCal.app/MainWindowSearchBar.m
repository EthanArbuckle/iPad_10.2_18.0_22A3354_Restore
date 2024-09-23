@implementation MainWindowSearchBar

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MainWindowSearchBar frame](self, "frame");
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)MainWindowSearchBar;
  -[MainWindowSearchBar setFrame:](&v11, "setFrame:", x, y, width, height);
  if (height != v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowSearchBar heightObserver](self, "heightObserver"));
    objc_msgSend(v10, "searchBarHeightDidChange");

  }
}

- (SearchBarHeightObserver)heightObserver
{
  return (SearchBarHeightObserver *)objc_loadWeakRetained((id *)&self->_heightObserver);
}

- (void)setHeightObserver:(id)a3
{
  objc_storeWeak((id *)&self->_heightObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_heightObserver);
}

@end
