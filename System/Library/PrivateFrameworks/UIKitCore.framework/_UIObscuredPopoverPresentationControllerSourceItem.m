@implementation _UIObscuredPopoverPresentationControllerSourceItem

+ (id)obscuredSourceItemForItem:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  objc_getAssociatedObject(v4, &obscuredSourceItemForItem___UIObscuredPopoverPresentationControllerSourceItemTag);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (id *)objc_opt_new();
    objc_storeStrong(v5 + 1, a3);
    objc_setAssociatedObject(v4, &obscuredSourceItemForItem___UIObscuredPopoverPresentationControllerSourceItemTag, v5, (void *)1);
  }

  return v5;
}

- (CGRect)frameInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIObscuredPopoverPresentationControllerSourceItem _frameInCoordinateSpace:window:](self, "_frameInCoordinateSpace:window:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[_UIPopoverPresentationControllerSourceItem_Internal _frameInCoordinateSpace:window:](self->_sourceItem, "_frameInCoordinateSpace:window:", a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)_nearestViewController
{
  return (id)-[_UIPopoverPresentationControllerSourceItem_Internal _nearestViewController](self->_sourceItem, "_nearestViewController");
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  return (id)-[_UIPopoverPresentationControllerSourceItem_Internal _sourceViewForPresentationInWindow:](self->_sourceItem, "_sourceViewForPresentationInWindow:", a3);
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIPopoverPresentationControllerSourceItem_Internal _sourceRectForPresentationInWindow:](self->_sourceItem, "_sourceRectForPresentationInWindow:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end
