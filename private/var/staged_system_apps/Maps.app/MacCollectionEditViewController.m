@implementation MacCollectionEditViewController

- (MacCollectionEditViewController)initWithCollection:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  MacCollectionEditViewController *v9;
  MacCollectionEditViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MacCollectionEditViewController;
  v9 = -[MacCollectionEditViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  UITextField *v9;
  UITextField *textField;
  void *v11;
  void *v12;
  void *v13;
  CollectionImageView *v14;
  CollectionImageView *imageView;
  void *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *changePhotoButton;
  void *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  UIButton *deleteButton;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  _QWORD v46[3];

  v45.receiver = self;
  v45.super_class = (Class)MacCollectionEditViewController;
  -[MacCollectionEditViewController viewDidLoad](&v45, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  objc_msgSend(v3, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("MacCollectionEditView"));

  v5 = objc_alloc((Class)UITextField);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (UITextField *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textField = self->_textField;
  self->_textField = v9;

  -[UITextField setBorderStyle:](self->_textField, "setBorderStyle:", 3);
  -[UITextField setControlSize:](self->_textField, "setControlSize:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler title](self->_collection, "title"));
  -[UITextField setText:](self->_textField, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Bold](UIFont, "system20Bold"));
  -[UITextField setFont:](self->_textField, "setFont:", v12);

  -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
  -[UITextField setEnabled:](self->_textField, "setEnabled:", -[CollectionHandler canEditTitle](self->_collection, "canEditTitle"));
  -[UITextField setAccessibilityIdentifier:](self->_textField, "setAccessibilityIdentifier:", CFSTR("MacCollectionEditTextField"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_textField);

  v14 = -[CollectionImageView initWithFrame:makeCornersRounded:]([CollectionImageView alloc], "initWithFrame:makeCornersRounded:", 0, CGRectZero.origin.x, y, width, height);
  imageView = self->_imageView;
  self->_imageView = v14;

  -[CollectionImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", 17.0);
  -[CollectionImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[CollectionImageView setCollectionInfo:](self->_imageView, "setCollectionInfo:", self->_collection);
  -[CollectionImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("MacCollectionEditImage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_imageView);

  if (-[CollectionHandler canEditImage](self->_collection, "canEditImage"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Edit Collection] Change Key Photo"), CFSTR("localized string not found"), 0));
    v19 = (UIButton *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController _buttonWithTitle:imageNamed:](self, "_buttonWithTitle:imageNamed:", v18, CFSTR("photo")));
    changePhotoButton = self->_changePhotoButton;
    self->_changePhotoButton = v19;

    -[UIButton addTarget:action:forControlEvents:](self->_changePhotoButton, "addTarget:action:forControlEvents:", self, "_changePhoto", 64);
    -[UIButton setAccessibilityIdentifier:](self->_changePhotoButton, "setAccessibilityIdentifier:", CFSTR("MacCollectionEditChangePhotoButton"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
    objc_msgSend(v21, "addSubview:", self->_changePhotoButton);

  }
  if (-[CollectionHandler canDelete](self->_collection, "canDelete"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Edit Guide] Delete Guide"), CFSTR("localized string not found"), 0));
    v24 = (UIButton *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController _buttonWithTitle:imageNamed:](self, "_buttonWithTitle:imageNamed:", v23, CFSTR("trash")));
    deleteButton = self->_deleteButton;
    self->_deleteButton = v24;

    -[UIButton addTarget:action:forControlEvents:](self->_deleteButton, "addTarget:action:forControlEvents:", self, "_delete", 64);
    -[UIButton setAccessibilityIdentifier:](self->_deleteButton, "setAccessibilityIdentifier:", CFSTR("MacCollectionEditDeleteButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
    objc_msgSend(v26, "addSubview:", self->_deleteButton);

  }
  v27 = objc_alloc((Class)MUSizeLayout);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  LODWORD(v29) = 1144750080;
  v31 = objc_msgSend(v27, "initWithItem:size:priority:", v28, 282.0, v30, v29);

  v32 = objc_msgSend(objc_alloc((Class)MUSizeLayout), "initWithItem:size:", self->_imageView, 60.0, 60.0);
  v33 = objc_alloc((Class)MUStackLayout);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layoutMarginsGuide"));
  v36 = objc_msgSend(v33, "initWithContainer:axis:", v35, 1);

  objc_msgSend(v36, "setDistribution:", 2);
  LODWORD(v37) = 1112276992;
  objc_msgSend(v36, "setDistributionFittingSizePriority:", v37);
  objc_msgSend(v36, "setAlignment:", 1);
  objc_msgSend(v36, "addArrangedLayoutItem:", self->_textField);
  objc_msgSend(v36, "setAlignment:forArrangedLayoutItem:", 0, self->_textField);
  objc_msgSend(v36, "addArrangedLayoutItem:", self->_imageView);
  v38 = 20.0;
  objc_msgSend(v36, "setPadding:forArrangedLayoutItem:", self->_imageView, 20.0, 0.0, 0.0, 0.0);
  if (self->_changePhotoButton)
  {
    objc_msgSend(v36, "addArrangedLayoutItem:");
    objc_msgSend(v36, "setPadding:forArrangedLayoutItem:", self->_changePhotoButton, 20.0, 0.0, 0.0, 0.0);
    v38 = 8.0;
  }
  if (self->_deleteButton)
  {
    objc_msgSend(v36, "addArrangedLayoutItem:");
    objc_msgSend(v36, "setPadding:forArrangedLayoutItem:", self->_deleteButton, v38, 0.0, 0.0, 0.0);
  }
  v46[0] = v31;
  v46[1] = v32;
  v46[2] = v36;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController view](self, "view"));
  objc_msgSend(v40, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v42 = v41;
  v44 = v43;

  -[MacCollectionEditViewController setPreferredContentSize:](self, "setPreferredContentSize:", v42, v44);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacCollectionEditViewController;
  -[MacCollectionEditViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (id)_buttonWithTitle:(id)a3 imageNamed:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration tintedButtonConfiguration](UIButtonConfiguration, "tintedButtonConfiguration"));
  objc_msgSend(v9, "setTitle:", v7);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1009D0F60;
  v25[3] = &unk_1011AFCC0;
  v26 = v8;
  v24 = v8;
  objc_msgSend(v9, "setTitleTextAttributesTransformer:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController _spacerImage](self, "_spacerImage"));
  objc_msgSend(v9, "setImage:", v10);

  objc_msgSend(v9, "setImagePadding:", 0.0);
  objc_msgSend(v9, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v11, "setConfiguration:", v9);
  v12 = objc_alloc((Class)UIImageView);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6));

  v14 = objc_msgSend(v12, "initWithImage:", v13);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v24));
  objc_msgSend(v14, "setPreferredSymbolConfiguration:", v15);

  objc_msgSend(v11, "addSubview:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 9.0));
  v27[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v27[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  return v11;
}

- (id)_spacerImage
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 22.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageWithActions:", &stru_1011DE8B8));

  return v3;
}

- (NSString)newTitle
{
  return (NSString *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_textField, "text"));
}

- (void)_changePhoto
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "macCollectionEditViewControllerPickPhoto:", self);

}

- (void)_delete
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "macCollectionEditViewControllerDelete:", self);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t UInteger;
  id v13;
  uint64_t v14;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));

  UInteger = GEOConfigGetUInteger(MapsConfig_CollectionNameMaximumLength, off_1014B4A18);
  v13 = objc_msgSend(v11, "length");
  if ((unint64_t)v13 > UInteger)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, UInteger));

    objc_msgSend(v8, "setText:", v14);
    v11 = (void *)v14;
  }

  return (unint64_t)v13 <= UInteger;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "macCollectionEditViewControllerDismiss:", self);

  return 1;
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (MacCollectionEditViewControllerDelegate)delegate
{
  return (MacCollectionEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_changePhotoButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
