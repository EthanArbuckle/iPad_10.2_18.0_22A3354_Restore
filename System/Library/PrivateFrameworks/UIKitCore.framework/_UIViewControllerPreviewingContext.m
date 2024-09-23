@implementation _UIViewControllerPreviewingContext

- (_UIViewControllerPreviewingContext)initWithSourceView:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  _UIViewControllerPreviewingContext *v9;
  _UIViewControllerPreviewingContext *v10;
  _UIPreviewInteractionController *v11;
  _UIPreviewInteractionController *previewInteractionController;
  _UIViewControllerPreviewingContext *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIViewControllerPreviewingContext;
  v9 = -[_UIViewControllerPreviewingContext init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceView, a3);
    objc_storeWeak((id *)&v10->_viewController, v8);
    v11 = -[_UIPreviewInteractionController initWithView:]([_UIPreviewInteractionController alloc], "initWithView:", v7);
    previewInteractionController = v10->_previewInteractionController;
    v10->_previewInteractionController = v11;

    -[_UIPreviewInteractionController setDelegate:](v10->_previewInteractionController, "setDelegate:", v10);
    -[_UIPreviewInteractionController setCurrentPreviewingContext:](v10->_previewInteractionController, "setCurrentPreviewingContext:", v10);
    v13 = v10;
  }

  return v10;
}

- (UIGestureRecognizer)previewingGestureRecognizerForFailureRelationship
{
  void *v2;
  void *v3;

  -[_UIViewControllerPreviewingContext previewInteractionController](self, "previewInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (CGRect)preferredSourceViewRectInCoordinateSpace:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  _UIPreviewInteractionController *previewInteractionController;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;

  v4 = a3;
  -[_UIViewControllerPreviewingContext sourceRect](self, "sourceRect");
  v39.origin.x = v5;
  v39.origin.y = v6;
  v39.size.width = v7;
  v39.size.height = v8;
  -[_UIViewControllerPreviewingContext sourceView](self, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  previewInteractionController = self->_previewInteractionController;
  v38 = v9;
  -[_UIPreviewInteractionController _overrideSourceViewForBinaryCompatibilityIfNeeded:sourceRect:](previewInteractionController, "_overrideSourceViewForBinaryCompatibilityIfNeeded:sourceRect:", &v38, &v39);
  v11 = v38;

  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (CGRectIsEmpty(v39))
  {
    v39.origin.x = v13;
    v39.origin.y = v15;
    height = v19;
    width = v17;
    y = v15;
    x = v13;
    v39.size.width = v17;
    v39.size.height = v19;
  }
  else
  {
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
  }
  v43.origin.x = v13;
  v43.origin.y = v15;
  v43.size.width = v17;
  v43.size.height = v19;
  if (CGRectEqualToRect(*(CGRect *)&x, v43))
  {
    objc_msgSend(v11, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "bounds");
      objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v25);
      v26 = v40.origin.x;
      v27 = v40.origin.y;
      v28 = v40.size.width;
      v29 = v40.size.height;
      if (CGRectIntersectsRect(v40, v39))
      {
        v41.origin.x = v26;
        v41.origin.y = v27;
        v41.size.width = v28;
        v41.size.height = v29;
        v39 = CGRectIntersection(v41, v39);
      }
    }

  }
  if (v4 && v11 != v4)
  {
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v4, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    v39.origin.x = v30;
    v39.origin.y = v31;
    v39.size.width = v32;
    v39.size.height = v33;
  }

  v34 = v39.origin.x;
  v35 = v39.origin.y;
  v36 = v39.size.width;
  v37 = v39.size.height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)unregister
{
  UIView *sourceView;
  _UIPreviewInteractionController *previewInteractionController;

  sourceView = self->_sourceView;
  self->_sourceView = 0;

  objc_storeWeak((id *)&self->_viewController, 0);
  previewInteractionController = self->_previewInteractionController;
  self->_previewInteractionController = 0;

}

- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 presentingViewController:(id *)a6
{
  double y;
  double x;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  y = a4.y;
  x = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[_UIViewControllerPreviewingContext sourceView](self, "sourceView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    -[_UIViewControllerPreviewingContext setSourceRect:](self, "setSourceRect:");

    -[_UIViewControllerPreviewingContext setCustomViewForInteractiveHighlight:](self, "setCustomViewForInteractiveHighlight:", 0);
    -[_UIViewControllerPreviewingContext delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "previewingContext:viewControllerForLocation:", self, x, y);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v12 = 0;
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v14, "previewViewControllerForLocation:inSourceView:", self->_sourceView, x, y);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v15;
    if (v15)
      *a6 = objc_retainAutorelease(WeakRetained);
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forLocation:(CGPoint)a5 inSourceView:(id)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  id v12;

  y = a5.y;
  x = a5.x;
  v12 = a4;
  v10 = a6;
  -[_UIViewControllerPreviewingContext delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "willPresentPreviewViewController:forLocation:inSourceView:", v12, v10, x, y);

}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_UIViewControllerPreviewingContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_previewingContext:willPresentViewController:", self, v6);

}

- (void)previewInteractionController:(id)a3 willDismissViewController:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_UIViewControllerPreviewingContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_previewingContext:willDismissViewController:", self, v6);

}

- (void)previewInteractionController:(id)a3 didDismissViewController:(id)a4 committing:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  v8 = a4;
  -[_UIViewControllerPreviewingContext delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "didDismissPreviewViewController:committing:", v8, v5);

}

- (void)previewInteractionController:(id)a3 commitViewController:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_UIViewControllerPreviewingContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "previewingContext:commitViewController:", self, v6);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "commitPreviewViewController:committedViewController:", v6, v6);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "commitPreviewViewController:", v6);
  }

}

- (UIViewControllerPreviewingDelegate)delegate
{
  return (UIViewControllerPreviewingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIView)customViewForInteractiveHighlight
{
  return self->_customViewForInteractiveHighlight;
}

- (void)setCustomViewForInteractiveHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_customViewForInteractiveHighlight, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (_UIPreviewInteractionController)previewInteractionController
{
  return self->_previewInteractionController;
}

- (void)setPreviewInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteractionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_customViewForInteractiveHighlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
