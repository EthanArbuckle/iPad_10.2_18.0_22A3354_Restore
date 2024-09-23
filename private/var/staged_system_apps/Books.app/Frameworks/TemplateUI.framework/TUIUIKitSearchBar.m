@implementation TUIUIKitSearchBar

- (TUIUIKitSearchBar)initWithFrame:(CGRect)a3
{
  TUIUIKitSearchBar *v3;
  TUIUIKitSearchBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIUIKitSearchBar;
  v3 = -[TUIUIKitSearchBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TUIUIKitSearchBar setSearchBarStyle:](v3, "setSearchBarStyle:", 2);
    -[TUIUIKitSearchBar setContentInset:](v4, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  return v4;
}

- (BOOL)isEnabled
{
  return 1;
}

- (BOOL)isHighlighted
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double x;
  double Width;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39.receiver = self;
  v39.super_class = (Class)TUIUIKitSearchBar;
  -[TUIUIKitSearchBar layoutSubviews](&v39, "layoutSubviews");
  -[TUIUIKitSearchBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar searchField](self, "searchField"));
  v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tui_imageNamed:inBundle:](UIImage, "tui_imageNamed:inBundle:", CFSTR("search_glyph.png"), v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithRenderingMode:", 2));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leftView"));
  objc_msgSend(v16, "setImage:", v15);
  objc_msgSend(v16, "frame");
  v18 = v17;
  objc_msgSend(v16, "frame");
  v20 = v19;
  objc_msgSend(v15, "size");
  v22 = v21;
  objc_msgSend(v15, "size");
  objc_msgSend(v16, "setFrame:", v18, v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar tintColor](self, "tintColor"));
  objc_msgSend(v16, "setTintColor:", v24);

  objc_msgSend(v11, "frame");
  x = v40.origin.x;
  Width = CGRectGetWidth(v40);
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  objc_msgSend(v11, "setFrame:", x, 0.0, Width, CGRectGetHeight(v41));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar cancelButton](self, "cancelButton"));
  objc_msgSend(v27, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  v36 = CGRectGetWidth(v42);
  v43.origin.x = v29;
  v43.origin.y = v31;
  v43.size.width = v33;
  v43.size.height = v35;
  v37 = v36 - CGRectGetWidth(v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar cancelButton](self, "cancelButton"));
  objc_msgSend(v38, "setFrame:", v37, v31, v33, v35);

}

- (void)setFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar searchField](self, "searchField"));
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar searchField](self, "searchField"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIUIKitSearchBar;
  v4 = a3;
  -[TUIUIKitSearchBar setTintColor:](&v11, "setTintColor:", v4);
  -[TUIUIKitSearchBar setBarTintColor:](self, "setBarTintColor:", v4, v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar searchField](self, "searchField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_clearButton"));
  objc_msgSend(v6, "setTintColor:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar searchField](self, "searchField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_clearButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageForState:", 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithRenderingMode:", 2));
  -[TUIUIKitSearchBar setImage:forSearchBarIcon:state:](self, "setImage:forSearchBarIcon:state:", v10, 1, 0);

}

- (void)setCancelText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[TUIUIKitSearchBar _setCancelButtonText:](self, "_setCancelButtonText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar cancelButton](self, "cancelButton"));
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar cancelButton](self, "cancelButton"));
  objc_msgSend(v6, "sizeToFit");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar text](self, "text"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[TUIUIKitSearchBar cancelButton](self, "cancelButton"));
    objc_msgSend(v9, "setEnabled:", 1);

  }
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

@end
