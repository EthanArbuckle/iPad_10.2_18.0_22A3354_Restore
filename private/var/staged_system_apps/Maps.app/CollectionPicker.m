@implementation CollectionPicker

- (CollectionPicker)initWithCollectionEditSession:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  CollectionPicker *v14;
  CollectionPicker *v15;
  objc_super v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CollectionPicker;
  v14 = -[CollectionPicker init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_editSession, a3);
    objc_storeStrong((id *)&v15->_sourceView, a4);
    v15->_sourceRect.origin.x = x;
    v15->_sourceRect.origin.y = y;
    v15->_sourceRect.size.width = width;
    v15->_sourceRect.size.height = height;
  }

  return v15;
}

- (void)viewControllerToPresentIfContainee:(id)a3 ifAlertController:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v6 && self->_sourceView && (v8 == (id)6 || v8 == (id)1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPicker alertController](self, "alertController"));
    v6[2](v6, v10);
LABEL_11:

    goto LABEL_12;
  }
  if (v11)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPicker collectionPickerContaineeViewController](self, "collectionPickerContaineeViewController"));
    v11[2](v11, v10);
    goto LABEL_11;
  }
LABEL_12:

}

- (id)collectionPickerContaineeViewController
{
  _TtC4Maps39CollectionPickerContaineeViewController *collectionPickerContaineeController;
  _TtC4Maps39CollectionPickerContaineeViewController *v4;
  _TtC4Maps39CollectionPickerContaineeViewController *v5;

  collectionPickerContaineeController = self->_collectionPickerContaineeController;
  if (!collectionPickerContaineeController)
  {
    v4 = -[CollectionPickerContaineeViewController initWithCollectionEditSession:]([_TtC4Maps39CollectionPickerContaineeViewController alloc], "initWithCollectionEditSession:", self->_editSession);
    v5 = self->_collectionPickerContaineeController;
    self->_collectionPickerContaineeController = v4;

    -[CollectionPickerContaineeViewController setDelegate:](self->_collectionPickerContaineeController, "setDelegate:", self);
    collectionPickerContaineeController = self->_collectionPickerContaineeController;
  }
  return collectionPickerContaineeController;
}

- (id)alertController
{
  UIAlertController *alertController;
  CollectionPickerViewController *v4;
  CollectionPickerViewController *pickerViewController;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  UIAlertController *v12;
  UIView *sourceView;
  void *v14;
  double x;
  double y;
  double width;
  double height;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIAlertController *v24;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;

  alertController = self->_alertController;
  if (!alertController)
  {
    if (!self->_pickerViewController)
    {
      v4 = -[CollectionPickerViewController initWithCollectionEditSession:]([CollectionPickerViewController alloc], "initWithCollectionEditSession:", self->_editSession);
      pickerViewController = self->_pickerViewController;
      self->_pickerViewController = v4;

      -[CollectionPickerViewController setDelegate:](self->_pickerViewController, "setDelegate:", self);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self->_editSession, "selectedObjectSet"));
    v7 = objc_msgSend(v6, "count");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if ((unint64_t)v7 <= 1)
      v10 = CFSTR("[Collection] Alert's title");
    else
      v10 = CFSTR("[Collection] Alert's title (plural)");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));

    v12 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v11, 0));
    sourceView = self->_sourceView;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](v12, "popoverPresentationController"));
    objc_msgSend(v14, "setSourceView:", sourceView);

    x = self->_sourceRect.origin.x;
    y = self->_sourceRect.origin.y;
    width = self->_sourceRect.size.width;
    height = self->_sourceRect.size.height;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](v12, "popoverPresentationController"));
    objc_msgSend(v19, "setSourceRect:", x, y, width, height);

    -[UIAlertController setContentViewController:](v12, "setContentViewController:", self->_pickerViewController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController view](v12, "view"));
    objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("CollectionPickerAlert"));

    objc_initWeak(&location, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[Collection] Alert's cancel button title"), CFSTR("localized string not found"), 0));
    v26 = _NSConcreteStackBlock;
    v27 = 3221225472;
    v28 = sub_1002B306C;
    v29 = &unk_1011AFA88;
    objc_copyWeak(&v30, &location);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, &v26));

    objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("CollectionPickerCancelAction"), v26, v27, v28, v29);
    -[UIAlertController addAction:](v12, "addAction:", v23);
    v24 = self->_alertController;
    self->_alertController = v12;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    alertController = self->_alertController;
  }
  return alertController;
}

- (void)cleanControllers
{
  UIAlertController *alertController;
  CollectionPickerViewController *pickerViewController;
  _TtC4Maps39CollectionPickerContaineeViewController *collectionPickerContaineeController;

  alertController = self->_alertController;
  self->_alertController = 0;

  pickerViewController = self->_pickerViewController;
  self->_pickerViewController = 0;

  collectionPickerContaineeController = self->_collectionPickerContaineeController;
  self->_collectionPickerContaineeController = 0;

}

- (void)_collectionPickerDismissedAfterSelectingCollection:(id)a3 parentVC:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  CollectionPicker *v26;

  v6 = a3;
  v7 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002B331C;
  v24[3] = &unk_1011AC8B0;
  v8 = v6;
  v25 = v8;
  v26 = self;
  v9 = objc_retainBlock(v24);
  if (-[CollectionSaveSession canRenameSelectedObjectInCollection:](self->_editSession, "canRenameSelectedObjectInCollection:", v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession mapItem](self->_editSession, "mapItem"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002B3398;
    v21[3] = &unk_1011AFAB0;
    v22 = v10;
    v23 = v9;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController _maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:](UIViewController, "_maps_viewControllerForRenamingMapItem:saveHandler:cancelHandler:", v11, v21, 0));
    v13 = dispatch_time(0, 500000000);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1002B33C8;
    v18 = &unk_1011AC8B0;
    v19 = v7;
    v20 = v12;
    v14 = v12;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, &v15);

  }
  else
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }
  -[CollectionPicker cleanControllers](self, "cleanControllers", v15, v16, v17, v18);

}

- (void)collectionPickerViewController:(id)a3 selectCollection:(id)a4
{
  id v5;
  void *v6;
  UIAlertController *alertController;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController presentingViewController](self->_alertController, "presentingViewController"));
  alertController = self->_alertController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002B348C;
  v10[3] = &unk_1011AD238;
  v10[4] = self;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  -[UIAlertController dismissViewControllerAnimated:completion:](alertController, "dismissViewControllerAnimated:completion:", 1, v10);

}

- (void)collectionPickerViewController:(id)a3 unselectCollection:(id)a4
{
  id WeakRetained;

  -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CollectionPicker cleanControllers](self, "cleanControllers");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionPickerClosed:", self);

}

- (void)collectionPickerContaineeViewController:(id)a3 selectCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
  objc_msgSend(v6, "handleDismissAction:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002B3600;
    v11[3] = &unk_1011AFAD8;
    v11[4] = self;
    v12 = v7;
    v13 = v8;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", 0, v11);

  }
  else
  {
    -[CollectionPicker _collectionPickerDismissedAfterSelectingCollection:parentVC:](self, "_collectionPickerDismissedAfterSelectingCollection:parentVC:", v7, v8);
  }

}

- (void)collectionPickerContaineeViewControllerCancelTapped:(id)a3
{
  id WeakRetained;

  objc_msgSend(a3, "handleDismissAction:", 0);
  -[CollectionPicker cleanControllers](self, "cleanControllers");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "collectionPickerClosed:", self);

}

- (CollectionPickerDelegate)delegate
{
  return (CollectionPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CollectionSaveSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
  objc_storeStrong((id *)&self->_editSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_collectionPickerContaineeController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end
