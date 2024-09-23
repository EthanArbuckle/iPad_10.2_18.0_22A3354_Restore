@implementation VUILibraryDownloadPopoverViewController

- (void)loadView
{
  VUITextLayout *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUILibraryListItemView *v11;
  VUILibraryListItemView *listView;
  void *v13;
  double Width;
  void *v15;
  double Height;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)VUILibraryDownloadPopoverViewController;
  -[VUILibraryDownloadPopoverViewController loadView](&v23, sel_loadView);
  v3 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v3, "setTextStyle:", 3);
  -[VUITextLayout setFontWeight:](v3, "setFontWeight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v3, "setColor:", v4);

  -[VUITextLayout setNumberOfLines:](v3, "setNumberOfLines:", 1);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("REMOVE_DOWNLOAD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("ActionMenu-ClearHistory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_flatImageWithColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(VUILibraryListItemView);
  listView = self->_listView;
  self->_listView = v11;

  -[VUILibraryListItemView setTitleLabel:](self->_listView, "setTitleLabel:", v7);
  -[VUILibraryListItemView setItemImage:](self->_listView, "setItemImage:", v10);
  -[VUILibraryDownloadPopoverViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Width = CGRectGetWidth(v24);

  -[VUILibraryDownloadPopoverViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  Height = CGRectGetHeight(v25);

  -[VUILibraryListItemView sizeThatFits:](self->_listView, "sizeThatFits:", Width, 1.79769313e308);
  -[VUILibraryDownloadPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", fmin(Height, v17), fmin(Height, v18));
  -[VUILibraryDownloadPopoverViewController setView:](self, "setView:", self->_listView);
  -[VUILibraryDownloadPopoverViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_popoverPressed_);
  objc_msgSend(v21, "setDelegate:", self);
  -[VUILibraryDownloadPopoverViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addGestureRecognizer:", v21);

}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUILibraryDownloadPopoverViewController;
  -[VUILibraryDownloadPopoverViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeDownloadDismissed");

}

- (void)popoverPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "removeDownloadPressed");

}

- (VUILibraryDownloadPopoverViewControllerDelegate)delegate
{
  return (VUILibraryDownloadPopoverViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUILibraryListItemView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
