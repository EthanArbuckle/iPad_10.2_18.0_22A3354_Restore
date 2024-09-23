@implementation PXPhotosStatusToggleButtonController

- (PXPhotosStatusToggleButtonController)initWithFooterViewModel:(id)a3 buttonConfiguration:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXPhotosStatusToggleButtonController *v11;
  PXPhotosStatusToggleButtonController *v12;
  uint64_t v13;
  UIButton *button;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosStatusToggleButtonController.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("footerViewModel"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosStatusToggleButtonController.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buttonConfiguration"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosStatusToggleButtonController;
  v11 = -[PXPhotosStatusToggleButtonController init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_footerViewModel, a3);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    button = v12->_button;
    v12->_button = (UIButton *)v13;

    -[UIButton addTarget:action:forControlEvents:](v12->_button, "addTarget:action:forControlEvents:", v12, sel__handleButtonAction_, 0x2000);
  }

  return v12;
}

- (void)_handleButtonAction:(id)a3
{
  PXPhotosGlobalFooterView *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v4 = objc_alloc_init(PXPhotosGlobalFooterView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[PXPhotosGlobalFooterView setViewModel:](v4, "setViewModel:", self->_footerViewModel);
  -[PXPhotosGlobalFooterView setDelegate:](v4, "setDelegate:", self);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  objc_msgSend(v6, "setView:", v4);
  -[PXPhotosGlobalFooterView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  objc_msgSend(v6, "setPreferredContentSize:");
  objc_storeWeak((id *)&self->_presentedPopOverViewController, v6);
  objc_msgSend(v6, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setPermittedArrowDirections:", 2);
  -[PXPhotosStatusToggleButtonController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Missing PXPhotosStatusToggleButtonControllerDelegate", v11, 2u);
    }

  }
  objc_msgSend(v8, "popoverPresentationEnvironmentForPhotosStatusToggleButtonController:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completionHandler:", v6, 1, 0);

}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  -[PXPhotosStatusToggleButtonController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Missing PXPhotosStatusToggleButtonControllerDelegate", v9, 2u);
    }

  }
  objc_msgSend(v6, "presentationEnvironmentForPhotosStatusToggleButtonController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completionHandler:", v5, 1, 0);

}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", v5, 1.79769313e308);
  v7 = v6;
  v9 = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedPopOverViewController);
  objc_msgSend(WeakRetained, "setPreferredContentSize:", v7, v9);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_storeWeak((id *)&self->_presentedPopOverViewController, 0);
}

- (UIButton)button
{
  return self->_button;
}

- (PXPhotosStatusToggleButtonControllerDelegate)delegate
{
  return (PXPhotosStatusToggleButtonControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_presentedPopOverViewController);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
}

@end
