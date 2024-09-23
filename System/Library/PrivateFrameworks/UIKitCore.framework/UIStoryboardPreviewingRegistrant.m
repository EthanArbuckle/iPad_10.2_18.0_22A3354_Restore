@implementation UIStoryboardPreviewingRegistrant

- (UIStoryboardPreviewingRegistrant)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStoryboardPreviewingRegistrant;
  return -[UIStoryboardPreviewingRegistrant init](&v4, sel_init, a3);
}

- (void)registerForPreviewing
{
  UIView **p_sourceView;
  id WeakRetained;
  id v6;
  UIViewControllerPreviewing *v7;
  UIViewControllerPreviewing *previewingContext;
  void *v9;
  void *v10;
  id v11;

  p_sourceView = &self->_sourceView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardPreviewingRegistrant.m"), 37, CFSTR("Cannot register without a source view to register for."));

  }
  if (self->_previewingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardPreviewingRegistrant.m"), 39, CFSTR("It is a programming error to register multiple times."));

  }
  v11 = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = objc_loadWeakRetained((id *)p_sourceView);
  objc_msgSend(v11, "registerForPreviewingWithDelegate:sourceView:", self, v6);
  v7 = (UIViewControllerPreviewing *)objc_claimAutoreleasedReturnValue();
  previewingContext = self->_previewingContext;
  self->_previewingContext = v7;

}

- (void)unregisterForPreviewing
{
  id WeakRetained;
  UIViewControllerPreviewing *previewingContext;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "unregisterForPreviewingWithContext:", self->_previewingContext);

  previewingContext = self->_previewingContext;
  self->_previewingContext = 0;

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  UIStoryboardPreviewingSegueTemplateStorage *segueTemplateStorage;
  void *v9;
  void *v10;
  UIStoryboardPreviewingSegueTemplateStorage *v11;
  BOOL v12;
  void *v13;
  UIStoryboardPreviewingSegueTemplateStorage *v14;
  UIStoryboardPreviewingSegueTemplateStorage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  segueTemplateStorage = self->_segueTemplateStorage;
  self->_segueTemplateStorage = 0;

  objc_msgSend(v7, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hitTest:withEvent:", 0, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_segueTemplateStorage;
  if (v11)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (v12)
  {
    v13 = v10;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v10, "_previewingSegueTemplateStorageForLocation:inView:", v9, x, y);
      v14 = (UIStoryboardPreviewingSegueTemplateStorage *)objc_claimAutoreleasedReturnValue();
      v15 = self->_segueTemplateStorage;
      self->_segueTemplateStorage = v14;

      if (v10 == v9)
        break;
      objc_msgSend(v10, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = self->_segueTemplateStorage;
      if (!v11)
      {
        v10 = v13;
        if (v13)
          continue;
      }
      goto LABEL_12;
    }
    v11 = self->_segueTemplateStorage;
    v13 = v9;
  }
LABEL_12:
  -[UIStoryboardPreviewingSegueTemplateStorage sender](v11, "sender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardPreviewingSegueTemplateStorage sender](self->_segueTemplateStorage, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  objc_msgSend(v16, "convertRect:toView:", v9);
  objc_msgSend(v7, "setSourceRect:");

  -[UIStoryboardPreviewingSegueTemplateStorage previewTemplate](self->_segueTemplateStorage, "previewTemplate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardPreviewingSegueTemplateStorage sender](self->_segueTemplateStorage, "sender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "perform:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "destinationViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  UIStoryboardPreviewingSegueTemplateStorage *segueTemplateStorage;
  id v9;

  v9 = a4;
  -[UIStoryboardPreviewingSegueTemplateStorage commitTemplate](self->_segueTemplateStorage, "commitTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardPreviewingSegueTemplateStorage sender](self->_segueTemplateStorage, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "_performWithDestinationViewController:sender:", v9, v6);

  segueTemplateStorage = self->_segueTemplateStorage;
  self->_segueTemplateStorage = 0;

}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_segueTemplateStorage, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
}

@end
