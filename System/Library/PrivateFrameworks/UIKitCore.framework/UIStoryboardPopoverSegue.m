@implementation UIStoryboardPopoverSegue

- (UIPopoverController)popoverController
{
  UIPopoverController *popoverController;
  UIPopoverController *v4;
  void *v5;
  UIPopoverController *v6;
  UIPopoverController *v7;
  UIPopoverController *v8;
  void *v9;

  popoverController = self->_popoverController;
  if (!popoverController)
  {
    v4 = [UIPopoverController alloc];
    -[UIStoryboardSegue destinationViewController](self, "destinationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIPopoverController initWithContentViewController:](v4, "initWithContentViewController:", v5);
    v7 = self->_popoverController;
    self->_popoverController = v6;

    -[UIPopoverController _setRetainsSelfWhilePresented:](self->_popoverController, "_setRetainsSelfWhilePresented:", 1);
    v8 = self->_popoverController;
    -[UIStoryboardPopoverSegue _passthroughViews](self, "_passthroughViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverController setPassthroughViews:](v8, "setPassthroughViews:", v9);

    popoverController = self->_popoverController;
  }
  return popoverController;
}

- (void)perform
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[UIStoryboardSegue destinationViewController](self, "destinationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardSegue sourceViewController](self, "sourceViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSourceViewControllerIfPresentedViaPopoverSegue:", v5);

  -[UIStoryboardPopoverSegue _anchorBarButtonItem](self, "_anchorBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIStoryboardPopoverSegue popoverController](self, "popoverController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[UIStoryboardPopoverSegue _anchorBarButtonItem](self, "_anchorBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v7, -[UIStoryboardPopoverSegue _permittedArrowDirections](self, "_permittedArrowDirections"), 1);
  }
  else
  {
    -[UIStoryboardPopoverSegue _anchorView](self, "_anchorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardPopoverSegue.m"), 34, CFSTR("%@ must be presented from a bar button item or a view."), objc_opt_class());
      goto LABEL_6;
    }
    -[UIStoryboardPopoverSegue popoverController](self, "popoverController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[UIStoryboardPopoverSegue _anchorRect](self, "_anchorRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UIStoryboardPopoverSegue _anchorView](self, "_anchorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, -[UIStoryboardPopoverSegue _permittedArrowDirections](self, "_permittedArrowDirections"), 1, v10, v12, v14, v16);
  }

LABEL_6:
}

- (NSArray)_passthroughViews
{
  return self->_passthroughViews;
}

- (void)_setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)_permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)_setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (UIView)_anchorView
{
  return self->_anchorView;
}

- (void)_setAnchorView:(id)a3
{
  objc_storeStrong((id *)&self->_anchorView, a3);
}

- (UIBarButtonItem)_anchorBarButtonItem
{
  return self->_anchorBarButtonItem;
}

- (void)_setAnchorBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, a3);
}

- (CGRect)_anchorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_anchorRect.origin.x;
  y = self->_anchorRect.origin.y;
  width = self->_anchorRect.size.width;
  height = self->_anchorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
}

@end
