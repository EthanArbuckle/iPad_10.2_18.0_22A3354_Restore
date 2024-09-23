@implementation _TVTextFieldViewController

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardWithUserText, 0);
  v3.receiver = self;
  v3.super_class = (Class)_TVTextFieldViewController;
  -[_TVTextFieldViewController dealloc](&v3, sel_dealloc);
}

- (void)updateWithViewElement:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  -[IKTextFieldElement keyboard](self->_viewElement, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  if (-[_TVTextFieldViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVTextFieldViewController _updateViewLayout](self, "_updateViewLayout");
    -[_TVTextFieldViewController _updateUserText](self, "_updateUserText");
  }

}

- (UITextField)textField
{
  void *v3;
  void *v4;

  if (-[_TVTextFieldViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVTextFieldViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (UITextField *)v4;
}

- (void)textDidChangeForKeyboard:(id)a3
{
  if (-[_TVTextFieldViewController isViewLoaded](self, "isViewLoaded", a3))
    -[_TVTextFieldViewController _updateUserText](self, "_updateUserText");
}

- (void)loadView
{
  _TVSearchBar *v3;
  _TVSearchBar *v4;

  v3 = [_TVSearchBar alloc];
  v4 = -[_TVSearchBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[_TVSearchBar setDelegate:](v4, "setDelegate:", self);
  -[_TVTextFieldViewController setView:](self, "setView:", v4);
  -[_TVTextFieldViewController _updateViewLayout](self, "_updateViewLayout");
  -[_TVTextFieldViewController _updateUserText](self, "_updateUserText");

}

- (void)searchBarDidChangeText:(id)a3
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardWithUserText, 0);
  -[_TVTextFieldViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateKeyboardWithUserText, 0, 0.2);
}

- (void)_updateViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[_TVTextFieldViewController viewElement](self, "viewElement");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVTextFieldViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tv_attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tv_textAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v18, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tv_highlightColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x24BDF6600]);
  objc_msgSend(v4, "setAttributedPlaceholder:", v5);
  objc_msgSend(v4, "setDefaultTextAttributes:", v7);
  objc_msgSend(v18, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("activityIndicator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "activityIndicatorView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
    objc_msgSend(v14, "startAnimating");
  else
    objc_msgSend(v14, "stopAnimating");

  -[_TVTextFieldViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVTextFieldViewController viewElement](self, "viewElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transferLayoutStylesFromElement:", v17);

}

- (void)_updateUserText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_TVTextFieldViewController viewElement](self, "viewElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVTextFieldViewController textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardWithUserText, 0);
}

- (void)_updateKeyboardWithUserText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardWithUserText, 0);
  -[_TVTextFieldViewController textField](self, "textField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVTextFieldViewController viewElement](self, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (IKTextFieldElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
