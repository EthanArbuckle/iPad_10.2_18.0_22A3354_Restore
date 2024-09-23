@implementation PXViewControllerPresenter

- (PXViewControllerPresenter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewControllerPresenter.m"), 40, CFSTR("%s is not available as initializer"), "-[PXViewControllerPresenter init]");

  abort();
}

- (PXViewControllerPresenter)initWithBaseViewController:(id)a3 sourceItem:(id)a4
{
  id v8;
  id v9;
  PXViewControllerPresenter *v10;
  PXViewControllerPresenter *v11;
  UIView *sourceView;
  CGSize v13;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewControllerPresenter.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseViewController"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXViewControllerPresenter;
  v10 = -[PXViewControllerPresenter init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_baseViewController, a3);
    objc_storeStrong((id *)&v11->_sourceItem, a4);
    sourceView = v11->_sourceView;
    v11->_sourceView = 0;

    v13 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v11->_sourceRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v11->_sourceRect.size = v13;
  }

  return v11;
}

- (PXViewControllerPresenter)initWithBaseViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  PXViewControllerPresenter *v13;
  PXViewControllerPresenter *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4;
  v13 = -[PXViewControllerPresenter initWithBaseViewController:sourceItem:](self, "initWithBaseViewController:sourceItem:", a3, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceView, a4);
    v14->_sourceRect.origin.x = x;
    v14->_sourceRect.origin.y = y;
    v14->_sourceRect.size.width = width;
    v14->_sourceRect.size.height = height;
  }

  return v14;
}

- (UINavigationController)navigationController
{
  void *v2;
  void *v3;

  -[PXViewControllerPresenter baseViewController](self, "baseViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationController *)v3;
}

- (BOOL)canPresentPopovers
{
  void *v3;
  BOOL v4;

  -[UIViewController traitCollection](self->_baseViewController, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") == 1
    || objc_msgSend(v3, "verticalSizeClass") == 1
    || self->_sourceView
    || self->_sourceItem != 0;

  return v4;
}

- (NSString)description
{
  id v3;
  void *v4;
  __CFString *v5;
  UIPopoverPresentationControllerSourceItem *sourceItem;
  void *v7;

  if (self->_sourceView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromCGRect(self->_sourceRect);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ in %@"), v4, self->_sourceView);

  }
  else
  {
    sourceItem = self->_sourceItem;
    if (sourceItem)
    {
      -[UIPopoverPresentationControllerSourceItem description](sourceItem, "description");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("None");
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p, view controller: %@, popover source: %@>"), objc_opt_class(), self, self->_baseViewController, v5);

  return (NSString *)v7;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v24 = v9;
  -[PXViewControllerPresenter sourceItem](self, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXViewControllerPresenter sourceView](self, "sourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXViewControllerPresenter sourceRect](self, "sourceRect");
  if (v11)
  {
    objc_msgSend(v24, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceItem:", v11);
LABEL_3:

    goto LABEL_4;
  }
  if (v12)
  {
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = v16;
    if (!CGRectIsNull(*(CGRect *)&v13))
    {
      v25.origin.x = v19;
      v25.origin.y = v20;
      v25.size.width = v21;
      v25.size.height = v22;
      if (!CGRectIsEmpty(v25))
      {
        objc_msgSend(v24, "popoverPresentationController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSourceView:", v12);
        objc_msgSend(v17, "setSourceRect:", v19, v20, v21, v22);
        goto LABEL_3;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v24, "modalPresentationStyle") == 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewControllerPresenter.m"), 105, CFSTR("%@ wasn't configured for a popover presentation but %@ requires to be presented as a popover"), self, v24);

    abort();
  }
LABEL_4:
  -[PXViewControllerPresenter presentingViewController](self, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", v24, v6, v10);

}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = a5;
  objc_msgSend(v9, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v6, v7);

}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PXViewControllerPresenter baseViewController](self, "baseViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_topmostPresentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PXViewControllerPresenter baseViewController](self, "baseViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (UIViewController *)v7;
}

- (BOOL)canPushViewController
{
  void *v2;
  BOOL v3;

  -[PXViewControllerPresenter navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v10;

  v4 = a4;
  v6 = a3;
  -[PXViewControllerPresenter navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[PXViewControllerPresenter canPushViewController](self, "canPushViewController")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = v6;
    -[PXViewControllerPresenter willPushViewController:inNavigationController:animated:](self, "willPushViewController:inNavigationController:animated:", v10, v7, v4);
    objc_msgSend(v7, "pushViewController:animated:", v10, v4);

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v6 = a3;
  -[PXViewControllerPresenter navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[PXViewControllerPresenter canPushViewController](self, "canPushViewController"))
  {
    v8 = v6;
    v9 = objc_msgSend(v7, "px_preparePopToViewController:forced:", v8, 0);
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0DC3F20];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__PXViewControllerPresenter_popToViewController_animated___block_invoke;
      v12[3] = &unk_1E51473C0;
      v13 = v7;
      v14 = v8;
      v15 = a4;
      objc_msgSend(v10, "_performWithoutDeferringTransitions:", v12);

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)presentAlertWithConfigurationHandler:(id)a3
{
  void (**v4)(id, PXAlertConfiguration *);
  PXAlertConfiguration *v5;
  PXAlert *v6;
  void *v7;

  v4 = (void (**)(id, PXAlertConfiguration *))a3;
  v5 = objc_alloc_init(PXAlertConfiguration);
  v4[2](v4, v5);

  v6 = -[PXAlert initWithConfiguration:]([PXAlert alloc], "initWithConfiguration:", v5);
  -[PXAlert alertController](v6, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXViewControllerPresenter presentViewController:animated:completionHandler:](self, "presentViewController:animated:completionHandler:", v7, 1, 0);

  return v6;
}

- (void)dismissAlertWithToken:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = v7;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewControllerPresenter.m"), 167, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("token"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewControllerPresenter.m"), 167, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("token"), v15);
  }

LABEL_3:
  objc_msgSend(v9, "alertController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v8);
  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Alert controller had a nil presentingViewController, indicating it may have been already dismissed.", buf, 2u);
    }

    v8[2](v8);
  }

}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (UIPopoverPresentationControllerSourceItem)sourceItem
{
  return self->_sourceItem;
}

- (UIView)sourceView
{
  return self->_sourceView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
}

id __58__PXViewControllerPresenter_popToViewController_animated___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "popToViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

+ (id)defaultPresenterWithViewController:(id)a3
{
  return (id)objc_msgSend(a1, "popoverPresenterWithViewController:sourceItem:", a3, 0);
}

+ (id)popoverPresenterWithViewController:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseViewController:sourceItem:", v7, v6);

  return v8;
}

+ (id)popoverPresenterWithViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseViewController:sourceView:sourceRect:", v12, v11, x, y, width, height);

  return v13;
}

@end
