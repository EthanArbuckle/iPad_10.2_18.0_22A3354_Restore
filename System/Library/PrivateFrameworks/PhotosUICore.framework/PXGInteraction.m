@implementation PXGInteraction

- (void)setLayout:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layout, obj);
    -[PXGInteraction layoutDidChange](self, "layoutDidChange");
    v5 = obj;
  }

}

- (void)setView:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    -[PXGInteraction viewWillChange](self, "viewWillChange");
    objc_storeWeak((id *)&self->_view, obj);
    -[PXGInteraction viewDidChange](self, "viewDidChange");
  }

}

- (void)setScrollViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollViewController, obj);
    -[PXGInteraction scrollViewControllerDidChange](self, "scrollViewControllerDidChange");
    v5 = obj;
  }

}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (PXGHitTestEnvironment)view
{
  return (PXGHitTestEnvironment *)objc_loadWeakRetained((id *)&self->_view);
}

- (PXScrollViewController)scrollViewController
{
  return (PXScrollViewController *)objc_loadWeakRetained((id *)&self->_scrollViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewController);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_layout);
}

@end
