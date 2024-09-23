@implementation PXPhotosCloseButtonController

- (PXPhotosCloseButtonController)initWithButtonConfiguration:(id)a3
{
  id v5;
  PXPhotosCloseButtonController *v6;
  uint64_t v7;
  UIButton *button;
  uint64_t v9;
  UIColor *foregroundColor;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosCloseButtonController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buttonConfiguration"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosCloseButtonController;
  v6 = -[PXPhotosCloseButtonController init](&v13, sel_init);
  if (v6)
  {
    +[PXPhotosViewRoundedAccessoryButton buttonWithConfiguration:primaryAction:](PXPhotosViewRoundedAccessoryButton, "buttonWithConfiguration:primaryAction:", v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    button = v6->_button;
    v6->_button = (UIButton *)v7;

    -[UIButton addTarget:action:forControlEvents:](v6->_button, "addTarget:action:forControlEvents:", v6, sel__handleButtonAction_, 0x2000);
    objc_msgSend(v5, "baseForegroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    foregroundColor = v6->_foregroundColor;
    v6->_foregroundColor = (UIColor *)v9;

  }
  return v6;
}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  char v8;
  void *v9;
  UIColor *v10;

  v10 = (UIColor *)a3;
  v5 = self->_foregroundColor;
  v6 = v10;
  if (v5 == v10)
    goto LABEL_4;
  v7 = v5;
  v8 = -[UIColor isEqual:](v5, "isEqual:", v10);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[UIButton configuration](self->_button, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIColor *)objc_msgSend(v9, "copy");

    -[UIColor setBaseForegroundColor:](v6, "setBaseForegroundColor:", v10);
    -[UIButton setConfiguration:](self->_button, "setConfiguration:", v6);
LABEL_4:

  }
}

- (void)_handleButtonAction:(id)a3
{
  id v4;

  -[PXPhotosCloseButtonController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosCloseButtonControllerHandleAction:", self);

}

- (UIButton)button
{
  return self->_button;
}

- (PXPhotosCloseButtonControllerDelegate)delegate
{
  return (PXPhotosCloseButtonControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
