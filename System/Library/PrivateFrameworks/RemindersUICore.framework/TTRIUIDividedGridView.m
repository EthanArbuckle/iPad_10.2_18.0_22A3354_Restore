@implementation TTRIUIDividedGridView

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TTRIUIDividedGridView viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[TTRIUIDividedGridView viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TTRIDividedGridViewController)viewController
{
  return (TTRIDividedGridViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
