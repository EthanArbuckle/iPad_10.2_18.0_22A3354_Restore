@implementation PhotoOptionsPicker

- (PhotoOptionsPicker)initWithPresentingViewController:(id)a3 sourceView:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PhotoOptionsPicker *v12;
  PhotoOptionsPicker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PhotoOptionsPicker;
  v12 = -[PhotoOptionsPicker init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_presentingViewController, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_anchoringView, a4);
    -[PhotoOptionsPicker _createAlertController](v13, "_createAlertController");
  }

  return v13;
}

- (void)_createAlertController
{
  UIAlertController *v3;
  UIAlertController *photoOptionsActionSheet;
  unsigned int v5;
  unsigned int v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  PhotoOptionsPicker *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id location[2];

  v3 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  photoOptionsActionSheet = self->_photoOptionsActionSheet;
  self->_photoOptionsActionSheet = v3;

  v5 = +[PhotoOptionsPicker _supportsCamera](PhotoOptionsPicker, "_supportsCamera");
  v6 = +[PhotoOptionsPicker _supportsPhotoLibrary](PhotoOptionsPicker, "_supportsPhotoLibrary");
  objc_initWeak(location, self);
  v7 = "HomeListSectionControllerSubclassing" + 32;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Take New Photo [Report a Problem Photos]"), CFSTR("localized string not found"), 0));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10096FE3C;
    v25[3] = &unk_1011D9DC8;
    objc_copyWeak(&v26, location);
    v25[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v25));

    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("TakeNewPhotoMenuAction"));
    -[UIAlertController addAction:](self->_photoOptionsActionSheet, "addAction:", v10);

    objc_destroyWeak(&v26);
    v7 = "sing";
  }
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Choose Existing [Report a Problem Photos]"), CFSTR("localized string not found"), 0));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = *((_QWORD *)v7 + 186);
    v23[2] = sub_10096FE98;
    v23[3] = &unk_1011D9DC8;
    objc_copyWeak(&v24, location);
    v23[4] = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v23));

    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("ChooseExistingPhotoMenuAction"));
    -[UIAlertController addAction:](self->_photoOptionsActionSheet, "addAction:", v13);

    objc_destroyWeak(&v24);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel [Report a Problem Photos]"), CFSTR("localized string not found"), 0));
  v17 = _NSConcreteStackBlock;
  v18 = *((_QWORD *)v7 + 186);
  v19 = sub_10096FEF4;
  v20 = &unk_1011D9DC8;
  objc_copyWeak(&v22, location);
  v21 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, &v17));

  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("CancelAction"), v17, v18, v19, v20);
  -[UIAlertController addAction:](self->_photoOptionsActionSheet, "addAction:", v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(location);
}

- (void)presentPhotoOptionsWithPreparationBlock:(id)a3
{
  UIView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *);

  v18 = (void (**)(id, void *))a3;
  v4 = self->_anchoringView;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_presentingViewController, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_photoOptionsActionSheet, "popoverPresentationController"));
  objc_msgSend(v6, "setSourceView:", v5);

  -[UIView bounds](v4, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_photoOptionsActionSheet, "popoverPresentationController"));
  objc_msgSend(v15, "setSourceRect:", v8, v10, v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_photoOptionsActionSheet, "popoverPresentationController"));
  objc_msgSend(v16, "setPermittedArrowDirections:", 3);

  if (v18)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController popoverPresentationController](self->_photoOptionsActionSheet, "popoverPresentationController"));
    v18[2](v18, v17);

  }
  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", self->_photoOptionsActionSheet, 1, 0);

}

- (void)dismissPhotoOptionsWithCompletion:(id)a3
{
  -[UIAlertController dismissViewControllerAnimated:completion:](self->_photoOptionsActionSheet, "dismissViewControllerAnimated:completion:", 1, a3);
}

- (void)_captureUserAction:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 620, 0);
}

+ (unint64_t)numberOfSupportedSourceTypes
{
  unsigned int v2;
  unsigned int v3;
  unint64_t v4;

  v2 = +[PhotoOptionsPicker _supportsCamera](PhotoOptionsPicker, "_supportsCamera");
  v3 = +[PhotoOptionsPicker _supportsPhotoLibrary](PhotoOptionsPicker, "_supportsPhotoLibrary");
  v4 = 1;
  if (v2)
    v4 = 2;
  if (v3)
    return v4;
  else
    return v2;
}

+ (int64_t)preferredSourceType
{
  unsigned int v2;
  unsigned int v3;
  int64_t v4;

  v2 = +[PhotoOptionsPicker _supportsCamera](PhotoOptionsPicker, "_supportsCamera");
  v3 = +[PhotoOptionsPicker _supportsPhotoLibrary](PhotoOptionsPicker, "_supportsPhotoLibrary");
  v4 = 2;
  if (!v3)
    v4 = 0;
  if (v2)
    return v3 ^ 1;
  else
    return v4;
}

+ (BOOL)_supportsCamera
{
  void *v2;
  BOOL v3;

  if (!+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1))return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != (id)5;

  return v3;
}

+ (BOOL)_supportsPhotoLibrary
{
  return +[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 0);
}

+ (BOOL)supportsSourceType:(int64_t)a3
{
  if (a3 == 2)
    return objc_msgSend(a1, "_supportsPhotoLibrary");
  if (a3 == 1)
    return objc_msgSend(a1, "_supportsCamera");
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_anchoringView, 0);
  objc_storeStrong((id *)&self->_photoOptionsActionSheet, 0);
}

@end
