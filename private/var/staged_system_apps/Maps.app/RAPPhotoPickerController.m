@implementation RAPPhotoPickerController

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = objc_msgSend(v6, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v11);

}

- (void)removeObserver:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (void)_invokeChangeHandlers
{
  NSMapTable *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_observers;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8, (_QWORD)v10));
        ((void (**)(_QWORD, RAPPhotoPickerController *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (RAPPhotoPickerController)init
{
  return -[RAPPhotoPickerController initWithInitialPhoto:](self, "initWithInitialPhoto:", 0);
}

- (RAPPhotoPickerController)initWithInitialPhoto:(id)a3
{
  id v5;
  RAPPhotoPickerController *v6;
  RAPPhotoPickerController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPPhotoPickerController;
  v6 = -[RAPPhotoPickerController init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photo, a3);
    v7->_overriddenInterfaceStyle = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[RAPPhotoPickerController _clearImagePicker](self, "_clearImagePicker");
  v3.receiver = self;
  v3.super_class = (Class)RAPPhotoPickerController;
  -[RAPPhotoPickerController dealloc](&v3, "dealloc");
}

- (void)clearSelectedPhoto
{
  RAPPhoto *photo;

  photo = self->_photo;
  self->_photo = 0;

}

- (void)_clearImagePicker
{
  void *v3;
  void *v4;
  UIImagePickerController *imagePicker;

  -[UIImagePickerController setDelegate:](self->_imagePicker, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePicker, "popoverPresentationController"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController presentationController](self->_imagePicker, "presentationController"));
  objc_msgSend(v4, "setDelegate:", 0);

  imagePicker = self->_imagePicker;
  self->_imagePicker = 0;

}

- (void)startPicking
{
  if (!self->_picking)
  {
    self->_picking = 1;
    -[RAPPhotoPickerController _presentPhotoOptions](self, "_presentPhotoOptions");
    -[RAPPhotoPickerController _instrument](self, "_instrument");
  }
}

- (void)startPickingWithSourceType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      -[RAPPhotoPickerController _proceedWithSourceType:](self, "_proceedWithSourceType:", 0);
    }
    else if (a3 == 1)
    {
      -[RAPPhotoPickerController _proceedWithSourceType:](self, "_proceedWithSourceType:", 1);
    }
  }
  else
  {
    -[RAPPhotoPickerController startPicking](self, "startPicking");
  }
}

- (void)_presentPhotoOptions
{
  PhotoOptionsPicker *v3;
  PhotoOptionsPicker *photoOptionsPicker;

  v3 = -[PhotoOptionsPicker initWithPresentingViewController:sourceView:delegate:]([PhotoOptionsPicker alloc], "initWithPresentingViewController:sourceView:delegate:", self->_presentingViewController, self->_anchoringView, self);
  photoOptionsPicker = self->_photoOptionsPicker;
  self->_photoOptionsPicker = v3;

  -[PhotoOptionsPicker presentPhotoOptionsWithPreparationBlock:](self->_photoOptionsPicker, "presentPhotoOptionsWithPreparationBlock:", 0);
}

- (void)_proceedWithSourceType:(int64_t)a3
{
  AVAuthorizationStatus v5;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  PHAuthorizationStatus v13;
  BOOL v15;
  UIImagePickerController **p_imagePicker;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  UIImagePickerController *v27;
  uint64_t v28;
  uint64_t v29;
  UIViewController *presentingViewController;
  UIView *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;

  if (a3 == 1)
  {
    v5 = +[AVCaptureDevice authorizationStatusForMediaType:](AVCaptureDevice, "authorizationStatusForMediaType:", AVMediaTypeVideo);
    v7 = v5 == AVAuthorizationStatusAuthorized || v5 == AVAuthorizationStatusNotDetermined;
    if (v5)
      v8 = v5 == AVAuthorizationStatusAuthorized;
    else
      v8 = 1;
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("No Access to Camera"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("To take a photo, go to Settings > Privacy & Security > Camera and enable access for Maps.");
LABEL_28:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));

      goto LABEL_29;
    }
  }
  else
  {
    v13 = +[PHPhotoLibrary authorizationStatus](PHPhotoLibrary, "authorizationStatus");
    v7 = v13 == PHAuthorizationStatusAuthorized || v13 == PHAuthorizationStatusNotDetermined;
    if (v13)
      v15 = v13 == PHAuthorizationStatusAuthorized;
    else
      v15 = 1;
    if (!v15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("No Access to Photos"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("To attach a photo to the report, go to Settings > Privacy & Security > Photos and enable access for Maps.");
      goto LABEL_28;
    }
  }
  if (!v7)
  {
    v44 = 0;
    v18 = 0;
LABEL_29:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoPickerController presentingViewController](self, "presentingViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK [Alert dismissal]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v20, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:", v44, v18, v22);

    -[RAPPhotoPickerController _endPicking](self, "_endPicking");
    return;
  }
  p_imagePicker = &self->_imagePicker;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController presentingViewController](self->_imagePicker, "presentingViewController"));

  if (v17)
  {
    -[RAPPhotoPickerController _endPicking](self, "_endPicking");
    return;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoPickerController presentingViewController](self, "presentingViewController"));
  if (v23)
  {
    v24 = objc_alloc_init((Class)UIImagePickerController);
    objc_msgSend(v24, "setDelegate:", self);
    if (!a3)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
      v45 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
      objc_msgSend(v24, "setMediaTypes:", v26);

    }
    objc_msgSend(v24, "setSourceType:", a3);
    objc_storeStrong((id *)&self->_imagePicker, v24);
    v27 = *p_imagePicker;
    if (a3 == 1)
    {
      v28 = 0;
    }
    else
    {
      v29 = sub_1002A8AA0(v27);
      v27 = *p_imagePicker;
      if (v29 == 5)
      {
        -[UIImagePickerController setModalPresentationStyle:](v27, "setModalPresentationStyle:", 7);
        presentingViewController = self->_presentingViewController;
        v31 = self->_anchoringView;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](presentingViewController, "view"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePicker, "popoverPresentationController"));
        objc_msgSend(v33, "setSourceView:", v32);

        -[UIView bounds](v31, "bounds");
        objc_msgSend(v32, "convertRect:fromView:", v31);
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePicker, "popoverPresentationController"));

        objc_msgSend(v42, "setSourceRect:", v35, v37, v39, v41);
LABEL_40:
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController presentationController](self->_imagePicker, "presentationController"));
        objc_msgSend(v43, "setDelegate:", self);

        objc_msgSend(v24, "setOverrideUserInterfaceStyle:", self->_overriddenInterfaceStyle);
        -[RAPPhotoPickerController _presentViewController:](self, "_presentViewController:", v24);
        if (a3 != 1)
          sub_100753E60();

        goto LABEL_43;
      }
      v28 = 2;
    }
    -[UIImagePickerController setModalPresentationStyle:](v27, "setModalPresentationStyle:", v28);
    goto LABEL_40;
  }
  -[RAPPhotoPickerController _endPicking](self, "_endPicking");
LABEL_43:

}

- (void)_endPicking
{
  PhotoOptionsPicker *photoOptionsPicker;

  self->_picking = 0;
  photoOptionsPicker = self->_photoOptionsPicker;
  self->_photoOptionsPicker = 0;

  -[RAPPhotoPickerController _invokeChangeHandlers](self, "_invokeChangeHandlers");
}

- (void)_presentViewController:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009CEE88;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_instrument
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoPickerController presentingViewController](self, "presentingViewController"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___RAPInstrumentableTarget))
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  if (objc_msgSend(v5, "analyticTarget"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 10115, objc_msgSend(v5, "analyticTarget"), 0);

  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1009CF178;
  v25[3] = &unk_1011DE850;
  v25[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));
  v26 = v8;
  v9 = objc_retainBlock(v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIImagePickerControllerPHAsset));

  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIImagePickerControllerPHAsset));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "creationDate"));
    ((void (*)(_QWORD *, void *, void *))v9[2])(v9, v12, v13);

  }
  else
  {
    if (objc_msgSend(v6, "sourceType") != (id)1
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager")), v15 = objc_msgSend(v14, "isLocationServicesPossiblyAvailable"), v14, !v15))
    {
      ((void (*)(_QWORD *, _QWORD, _QWORD))v9[2])(v9, 0, 0);
      goto LABEL_8;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1009CF250;
    v22 = &unk_1011DE878;
    v23 = v16;
    v24 = v9;
    v11 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "singleLocationUpdateWithHandler:", &v19));

    objc_msgSend(v18, "start", v19, v20, v21, v22);
  }

LABEL_8:
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  -[RAPPhotoPickerController _cancel](self, "_cancel", a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  self->_picking = 0;
  -[RAPPhotoPickerController _invokeChangeHandlers](self, "_invokeChangeHandlers", a3);
  -[RAPPhotoPickerController _clearImagePicker](self, "_clearImagePicker");
}

- (void)_cancel
{
  UIImagePickerController *imagePicker;
  _QWORD v4[5];

  self->_picking = 0;
  -[RAPPhotoPickerController _invokeChangeHandlers](self, "_invokeChangeHandlers");
  imagePicker = self->_imagePicker;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009CF2F8;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[UIImagePickerController dismissViewControllerAnimated:completion:](imagePicker, "dismissViewControllerAnimated:completion:", 1, v4);
}

- (void)photoOptionsPickerDidSelectTakePhoto:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009CF358;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissPhotoOptionsWithCompletion:", v3);
}

- (void)photoOptionsPickerDidSelectAddFromLibrary:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009CF3BC;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissPhotoOptionsWithCompletion:", v3);
}

- (void)photoOptionsPickerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009CF420;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissPhotoOptionsWithCompletion:", v3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIView)anchoringView
{
  return self->_anchoringView;
}

- (void)setAnchoringView:(id)a3
{
  objc_storeStrong((id *)&self->_anchoringView, a3);
}

- (RAPPhoto)photo
{
  return self->_photo;
}

- (BOOL)isPicking
{
  return self->_picking;
}

- (int64_t)overriddenInterfaceStyle
{
  return self->_overriddenInterfaceStyle;
}

- (void)setOverriddenInterfaceStyle:(int64_t)a3
{
  self->_overriddenInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_anchoringView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_photoOptionsPicker, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
