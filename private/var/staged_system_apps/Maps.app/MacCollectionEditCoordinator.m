@implementation MacCollectionEditCoordinator

- (MacCollectionEditCoordinator)initWithCollection:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  id v19;
  MacCollectionEditCoordinator *v20;
  MacCollectionEditCoordinator *v21;
  id v22;
  id completion;
  objc_super v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MacCollectionEditCoordinator;
  v20 = -[MacCollectionEditCoordinator init](&v25, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_collection, a3);
    objc_storeWeak((id *)&v21->_presentingViewController, v17);
    objc_storeWeak((id *)&v21->_sourceView, v18);
    v21->_sourceRect.origin.x = x;
    v21->_sourceRect.origin.y = y;
    v21->_sourceRect.size.width = width;
    v21->_sourceRect.size.height = height;
    v22 = objc_retainBlock(v19);
    completion = v21->_completion;
    v21->_completion = v22;

  }
  return v21;
}

- (void)present
{
  -[MacCollectionEditCoordinator _presentEditor](self, "_presentEditor");
}

- (void)_finish
{
  void (**completion)(void);

  if (!self->_finished)
  {
    self->_finished = 1;
    -[MacCollectionEditCoordinator _dismissEditor](self, "_dismissEditor");
    -[MacCollectionEditCoordinator _dismissDeleteConfirmation](self, "_dismissDeleteConfirmation");
    -[MacCollectionEditCoordinator _dismissPhotoPicker](self, "_dismissPhotoPicker");
    completion = (void (**)(void))self->_completion;
    if (completion)
      completion[2]();
  }
}

- (void)_presentEditor
{
  MacCollectionEditViewController *v3;
  MacCollectionEditViewController *editViewController;
  id WeakRetained;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = -[MacCollectionEditViewController initWithCollection:delegate:]([MacCollectionEditViewController alloc], "initWithCollection:delegate:", self->_collection, self);
  editViewController = self->_editViewController;
  self->_editViewController = v3;

  -[MacCollectionEditViewController setModalPresentationStyle:](self->_editViewController, "setModalPresentationStyle:", 7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController popoverPresentationController](self->_editViewController, "popoverPresentationController"));
  objc_msgSend(v6, "setSourceView:", WeakRetained);

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController popoverPresentationController](self->_editViewController, "popoverPresentationController"));
  objc_msgSend(v11, "setSourceRect:", x, y, width, height);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController popoverPresentationController](self->_editViewController, "popoverPresentationController"));
  objc_msgSend(v12, "setPermittedArrowDirections:", 12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController popoverPresentationController](self->_editViewController, "popoverPresentationController"));
  objc_msgSend(v13, "setDelegate:", self);

  v14 = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(v14, "presentViewController:animated:completion:", self->_editViewController, 1, 0);

}

- (void)_dismissEditor
{
  void *v3;
  void *v4;
  MacCollectionEditViewController *editViewController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController presentingViewController](self->_editViewController, "presentingViewController"));

  if (v3)
  {
    -[MacCollectionEditCoordinator _updateTitle](self, "_updateTitle");
    -[MacCollectionEditCoordinator _save](self, "_save");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController presentingViewController](self->_editViewController, "presentingViewController"));
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  editViewController = self->_editViewController;
  self->_editViewController = 0;

}

- (void)_presentDeleteConfirmation
{
  MacCollectionEditCoordinator *v2;
  void *v3;
  id *p_presentingViewController;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  UIAlertController *confirmDeleteViewController;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, int);
  void *v13;
  id v14;
  id location;
  CollectionHandler *collection;

  v2 = self;
  objc_initWeak(&location, self);
  collection = v2->_collection;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &collection, 1));
  p_presentingViewController = (id *)&v2->_presentingViewController;
  WeakRetained = objc_loadWeakRetained((id *)&v2->_presentingViewController);
  v6 = sub_1002A8AA0(WeakRetained);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100764E04;
  v13 = &unk_1011AD4F0;
  objc_copyWeak(&v14, &location);
  v7 = objc_claimAutoreleasedReturnValue(+[UIAlertController _maps_confirmationAlertControllerForDeletingCollections:userInterfaceIdiom:completion:](UIAlertController, "_maps_confirmationAlertControllerForDeletingCollections:userInterfaceIdiom:completion:", v3, v6, &v10));
  confirmDeleteViewController = v2->_confirmDeleteViewController;
  v2 = (MacCollectionEditCoordinator *)((char *)v2 + 16);
  v2->super.isa = (Class)v7;

  v9 = objc_loadWeakRetained(p_presentingViewController);
  objc_msgSend(v9, "presentViewController:animated:completion:", v2->super.isa, 1, 0, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_dismissDeleteConfirmation
{
  void *v3;
  void *v4;
  UIAlertController *confirmDeleteViewController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController presentingViewController](self->_confirmDeleteViewController, "presentingViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController presentingViewController](self->_confirmDeleteViewController, "presentingViewController"));
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  confirmDeleteViewController = self->_confirmDeleteViewController;
  self->_confirmDeleteViewController = 0;

}

- (void)_presentPhotoPicker
{
  UIImagePickerController *v3;
  UIImagePickerController *imagePickerController;
  id WeakRetained;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  id v12;

  v3 = (UIImagePickerController *)objc_alloc_init((Class)UIImagePickerController);
  imagePickerController = self->_imagePickerController;
  self->_imagePickerController = v3;

  -[UIImagePickerController setDelegate:](self->_imagePickerController, "setDelegate:", self);
  -[UIImagePickerController setAllowsEditing:](self->_imagePickerController, "setAllowsEditing:", 1);
  -[UIImagePickerController setSourceType:](self->_imagePickerController, "setSourceType:", 0);
  if (sub_1002A8AA0(self->_imagePickerController) == 5)
  {
    -[UIImagePickerController setModalPresentationStyle:](self->_imagePickerController, "setModalPresentationStyle:", 7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePickerController, "popoverPresentationController"));
    objc_msgSend(v6, "setSourceView:", WeakRetained);

    x = self->_sourceRect.origin.x;
    y = self->_sourceRect.origin.y;
    width = self->_sourceRect.size.width;
    height = self->_sourceRect.size.height;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePickerController, "popoverPresentationController"));
    objc_msgSend(v11, "setSourceRect:", x, y, width, height);

  }
  v12 = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(v12, "presentViewController:animated:completion:", self->_imagePickerController, 1, 0);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2074, 252, 0);
}

- (void)_dismissPhotoPicker
{
  void *v3;
  void *v4;
  UIImagePickerController *imagePickerController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController presentingViewController](self->_imagePickerController, "presentingViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController presentingViewController](self->_imagePickerController, "presentingViewController"));
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  imagePickerController = self->_imagePickerController;
  self->_imagePickerController = 0;

}

- (void)_updateTitle
{
  NSString *v3;
  unsigned __int8 v4;
  NSString *v5;

  v5 = -[MacCollectionEditViewController newTitle](self->_editViewController, "newTitle");
  if (-[NSString length](v5, "length"))
  {
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[CollectionHandler title](self->_collection, "title"));
    if (v3 == v5)
    {

    }
    else
    {
      v4 = -[NSString isEqual:](v3, "isEqual:", v5);

      if ((v4 & 1) == 0)
        -[CollectionHandler updateTitle:](self->_collection, "updateTitle:", v5);
    }
  }

}

- (void)_save
{
  -[CollectionHandler updateCollection:](self->_collection, "updateCollection:", &stru_1011C5D38);
}

- (void)_deleteCollection
{
  -[CollectionHandler deleteCollection:](self->_collection, "deleteCollection:", &stru_1011C5D58);
}

- (void)macCollectionEditViewControllerPickPhoto:(id)a3
{
  -[MacCollectionEditCoordinator _dismissEditor](self, "_dismissEditor", a3);
  -[MacCollectionEditCoordinator _presentPhotoPicker](self, "_presentPhotoPicker");
}

- (void)macCollectionEditViewControllerDelete:(id)a3
{
  -[MacCollectionEditCoordinator _dismissEditor](self, "_dismissEditor", a3);
  -[MacCollectionEditCoordinator _presentDeleteConfirmation](self, "_presentDeleteConfirmation");
}

- (void)presentationControllerWillDismiss:(id)a3
{
  MacCollectionEditViewController *editViewController;
  id v5;
  id v6;

  editViewController = self->_editViewController;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MacCollectionEditViewController presentationController](editViewController, "presentationController"));

  if (v6 == v5)
    -[MacCollectionEditCoordinator _finish](self, "_finish");
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", UIImagePickerControllerEditedImage));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));
  -[CollectionHandler updateImage:](self->_collection, "updateImage:", v5);
  -[MacCollectionEditCoordinator _save](self, "_save");
  -[MacCollectionEditCoordinator _finish](self, "_finish");

}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_confirmDeleteViewController, 0);
  objc_storeStrong((id *)&self->_editViewController, 0);
}

@end
