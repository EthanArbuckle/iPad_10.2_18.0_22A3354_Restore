@implementation _PXConsoleViewController

- (_PXConsoleViewController)init
{
  _PXConsoleViewController *v2;
  void *v3;
  uint64_t v4;
  UIBarButtonItem *shareBarButtonItem;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_PXConsoleViewController;
  v2 = -[_PXConsoleViewController init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, v2, sel__presentSharingViewController_);
    shareBarButtonItem = v2->__shareBarButtonItem;
    v2->__shareBarButtonItem = (UIBarButtonItem *)v4;

    v9[0] = v3;
    v9[1] = v2->__shareBarButtonItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXConsoleViewController setToolbarItems:](v2, "setToolbarItems:", v6);

  }
  return v2;
}

- (void)loadView
{
  void *v3;
  id v4;
  UITextView *v5;
  UITextView *textView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXConsoleViewController;
  -[_PXConsoleViewController loadView](&v7, sel_loadView);
  -[_PXConsoleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v3, "bounds");
  v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:");
  textView = self->__textView;
  self->__textView = v5;

  -[UITextView setAutoresizingMask:](self->__textView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->__textView);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PXConsoleViewController;
  -[_PXConsoleViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  -[_PXConsoleViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXConsoleViewController setToolBarWasHidden:](self, "setToolBarWasHidden:", objc_msgSend(v5, "isToolbarHidden"));

  -[_PXConsoleViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:animated:", 0, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_PXConsoleViewController;
  -[_PXConsoleViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[_PXConsoleViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:animated:", -[_PXConsoleViewController toolBarWasHidden](self, "toolBarWasHidden"), v3);

}

- (void)appendOutput:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
    goto LABEL_5;
  }
  objc_msgSend(v3, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E5149688;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
LABEL_9:
  v10 = v5;
  px_dispatch_on_main_queue();

}

- (UITextView)_textView
{
  UITextView *textView;
  id v4;

  textView = self->__textView;
  if (!textView)
  {
    v4 = (id)-[_PXConsoleViewController view](self, "view");
    textView = self->__textView;
  }
  return textView;
}

- (void)_presentSharingViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[_PXConsoleViewController _textView](self, "_textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E5149688;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v9 = objc_alloc(MEMORY[0x1E0D96D28]);
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithActivityItems:applicationActivities:", v10, 0);
  -[_PXConsoleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  objc_msgSend(v11, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXConsoleViewController _shareBarButtonItem](self, "_shareBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBarButtonItem:", v13);

}

- (BOOL)toolBarWasHidden
{
  return self->_toolBarWasHidden;
}

- (void)setToolBarWasHidden:(BOOL)a3
{
  self->_toolBarWasHidden = a3;
}

- (UIBarButtonItem)_shareBarButtonItem
{
  return self->__shareBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->__textView, 0);
}

@end
