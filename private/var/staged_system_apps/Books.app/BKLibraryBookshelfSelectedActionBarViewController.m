@implementation BKLibraryBookshelfSelectedActionBarViewController

- (void)viewDidLoad
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)BKLibraryBookshelfSelectedActionBarViewController;
  -[BKLibraryBookshelfSelectedActionBarViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Actions"), &stru_10091C438, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController view](self, "view"));
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_10091C438, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController trashButton](self, "trashButton"));
  objc_msgSend(v8, "setAccessibilityLabel:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_10091C438, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController moreButton](self, "moreButton"));
  objc_msgSend(v11, "setAccessibilityLabel:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 3, 17.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("text.badge.plus")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithConfiguration:", v12));

  v15 = objc_opt_class(UIButton);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController addButton](self, "addButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "customView"));
  v18 = BUDynamicCast(v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  objc_msgSend(v19, "setImage:forState:", v14, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController view](self, "view"));
  v21 = objc_msgSend(v20, "effectiveUserInterfaceLayoutDirection");

  if (v21 == (id)1)
    v22 = -6.0;
  else
    v22 = 6.0;
  objc_msgSend(v19, "setImageEdgeInsets:", 0.0, -v22, 0.0, v22);
  objc_msgSend(v19, "setTitleEdgeInsets:", 0.0, v22, 0.0, -v22);
  objc_msgSend(v19, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageWithConfiguration:", v12));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController trashButton](self, "trashButton"));
  objc_msgSend(v25, "setImage:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageWithConfiguration:", v12));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController moreButton](self, "moreButton"));
  objc_msgSend(v28, "setImage:", v27);

}

- (void)removeButtonTouch:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "removeForSelectedItems:", self);

}

- (void)moreButtonTouch:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController moreButton](self, "moreButton"));
  objc_msgSend(v5, "shareSelectedItemFromBarButtonItem:", v4);

}

- (void)addButtonTouch:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "addForSelectedItems:", self);

}

- (void)updateForSelectedItems:(id)a3 deletableItems:(BOOL)a4 seriesItems:(BOOL)a5 editable:(BOOL)a6
{
  id v8;
  _QWORD v9[4];
  id v10;
  BKLibraryBookshelfSelectedActionBarViewController *v11;
  BOOL v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E5FC8;
  v9[3] = &unk_1008E7D78;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8 = v10;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 1.0);

}

- (void)updateActionBarFromMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSelectedActionBarViewController toolbar](self, "toolbar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barTintColor"));
  objc_msgSend(v7, "setBarTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));
  objc_msgSend(v7, "setTintColor:", v6);

}

- (BKLibraryBookshelfSelectedActionBar)toolbar
{
  return (BKLibraryBookshelfSelectedActionBar *)objc_loadWeakRetained((id *)&self->_toolbar);
}

- (void)setToolbar:(id)a3
{
  objc_storeWeak((id *)&self->_toolbar, a3);
}

- (BKLibraryBookshelfSelectedActionBarDelegate)delegate
{
  return (BKLibraryBookshelfSelectedActionBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIBarButtonItem)trashButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_trashButton);
}

- (void)setTrashButton:(id)a3
{
  objc_storeWeak((id *)&self->_trashButton, a3);
}

- (UIBarButtonItem)addButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_addButton);
}

- (void)setAddButton:(id)a3
{
  objc_storeWeak((id *)&self->_addButton, a3);
}

- (UIBarButtonItem)moreButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_moreButton);
}

- (void)setMoreButton:(id)a3
{
  objc_storeWeak((id *)&self->_moreButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moreButton);
  objc_destroyWeak((id *)&self->_addButton);
  objc_destroyWeak((id *)&self->_trashButton);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_toolbar);
}

@end
