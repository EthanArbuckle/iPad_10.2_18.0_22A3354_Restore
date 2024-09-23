@implementation SiriUIPrivatePeoplePickerViewController

- (SiriUIPrivatePeoplePickerViewController)initWithSnippet:(id)a3
{
  id v5;
  SiriUIPrivatePeoplePickerViewController *v6;
  SiriUIPrivatePeoplePickerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUIPrivatePeoplePickerViewController;
  v6 = -[SiriUISnippetViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_picker, a3);
    -[SiriUISnippetViewController setDefaultViewInsets:](v7, "setDefaultViewInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  }

  return v7;
}

- (void)loadView
{
  void *v3;
  SiriUIObjectPickerButtonView *v4;

  v4 = objc_alloc_init(SiriUIObjectPickerButtonView);
  -[SiriUIObjectPickerButtonView button](v4, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__showPicker_, 64);

  -[SiriUIPrivatePeoplePickerViewController setView:](self, "setView:", v4);
}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[SiriUIPrivatePeoplePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  v6 = v5;

  return v6;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (Class)footerViewClass
{
  return (Class)objc_opt_class();
}

- (id)_pickerController
{
  SiriUIObjectPickerViewController *pickerController;
  SiriUIObjectPickerViewController *v4;
  SiriUIObjectPickerViewController *v5;

  pickerController = self->_pickerController;
  if (!pickerController)
  {
    +[SiriUIObjectPickerViewController pickerControllerWithPicker:](SiriUIObjectPickerViewController, "pickerControllerWithPicker:", self->_picker);
    v4 = (SiriUIObjectPickerViewController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pickerController;
    self->_pickerController = v4;

    -[SiriUIObjectPickerViewController setPickerDelegate:](self->_pickerController, "setPickerDelegate:", self);
    pickerController = self->_pickerController;
  }
  return pickerController;
}

- (void)_showPicker:(id)a3
{
  id v3;

  -[SiriUIPrivatePeoplePickerViewController _pickerController](self, "_pickerController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showPicker:", 0);

}

- (double)desiredHeightForFooterView
{
  return 0.0;
}

- (void)pickerViewController:(id)a3 willPresentPicker:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelRequestForSiriSnippetViewController:", self);

  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSnippetViewController:willPresentViewController:", self, v5);

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriSnippetViewController:setStatusViewHidden:", self, 1);

}

- (void)pickerViewController:(id)a3 didSelectObject:(id)a4 fromPicker:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "siriViewController:performAceCommands:", self, v8);
}

- (void)pickerViewController:(id)a3 willDismissPicker:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:willDismissViewController:", self, v5);

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSnippetViewController:setStatusViewHidden:", self, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerController, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
