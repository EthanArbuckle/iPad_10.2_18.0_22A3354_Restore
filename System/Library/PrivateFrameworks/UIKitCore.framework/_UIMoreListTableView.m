@implementation _UIMoreListTableView

- (void)set_listController:(id)a3
{
  objc_storeWeak((id *)&self->__listController, a3);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIMoreListTableView;
  -[UITableView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIMoreListTableView _listController](self, "_listController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_layoutCells");

  }
}

- (UIMoreListController)_listController
{
  return (UIMoreListController *)objc_loadWeakRetained((id *)&self->__listController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__listController);
}

@end
