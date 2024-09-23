@implementation PUToolbarViewModel

- (void)_setViewController:(id)a3
{
  objc_storeWeak((id *)&self->__viewController, a3);
}

- (double)accessoryViewTopOutset
{
  return self->_accessoryViewTopOutset;
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setToolbarItems:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *toolbarItems;
  void *v9;
  NSArray *v10;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_toolbarItems != v4)
  {
    v10 = v4;
    v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)-[NSArray copy](v10, "copy");
      toolbarItems = self->_toolbarItems;
      self->_toolbarItems = v7;

      -[PUToolbarViewModel currentChange](self, "currentChange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setToolbarItemsChanged:", 1);

      v5 = v10;
    }
  }

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  void *v6;
  UIView *v7;

  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[PUToolbarViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAccessoryViewChanged:", 1);

    v5 = v7;
  }

}

- (void)setAccessoryViewTopOutset:(double)a3
{
  id v3;

  if (self->_accessoryViewTopOutset != a3)
  {
    self->_accessoryViewTopOutset = a3;
    -[PUToolbarViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAccessoryViewTopOutsetChanged:", 1);

  }
}

- (void)setAccessoryViewMaximumHeight:(double)a3
{
  id v3;

  if (self->_accessoryViewMaximumHeight != a3)
  {
    self->_accessoryViewMaximumHeight = a3;
    -[PUToolbarViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAccessoryViewMaximumHeightChanged:", 1);

  }
}

- (void)setMaximumHeight:(double)a3
{
  id v3;

  if (self->_maximumHeight != a3)
  {
    self->_maximumHeight = a3;
    -[PUToolbarViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setMaximumHeightChanged:", 1);

  }
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUToolbarViewModelChange);
}

- (PUToolbarViewModelChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUToolbarViewModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (PUToolbarViewModelChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)didPublishChanges
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUToolbarViewModel;
  -[PUViewModel didPublishChanges](&v5, sel_didPublishChanges);
  if (-[PUToolbarViewModel needsToUpdateToolbarSize](self, "needsToUpdateToolbarSize"))
  {
    -[PUToolbarViewModel setNeedsToUpdateToolbarSize:](self, "setNeedsToUpdateToolbarSize:", 0);
    -[PUToolbarViewModel _viewController](self, "_viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isToolbarHidden") & 1) == 0)
      objc_msgSend(v4, "_positionToolbarHidden:", 0);

  }
}

- (double)accessoryViewMaximumHeight
{
  return self->_accessoryViewMaximumHeight;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (UIViewController)_viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__viewController);
}

- (BOOL)needsToUpdateToolbarSize
{
  return self->_needsToUpdateToolbarSize;
}

- (void)setNeedsToUpdateToolbarSize:(BOOL)a3
{
  self->_needsToUpdateToolbarSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__viewController);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
}

@end
