@implementation UGCAddPhotosController

- (UGCAddPhotosController)initWithPresentingViewController:(id)a3 sourceType:(int64_t)a4 multipleSelectionLimit:(unint64_t)a5 placeQuestionnaire:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  UGCAddPhotosController *v16;
  UGCAddPhotosController *v17;
  void *v18;
  objc_super v20;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)UGCAddPhotosController;
  v16 = -[UGCAddPhotosController init](&v20, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_presentingViewController, a3);
    v17->_initialSourceType = a4;
    objc_storeWeak((id *)&v17->_delegate, v15);
    v17->_multipleSelectionLimit = a5;
    objc_storeStrong((id *)&v17->_placeQuestionnaire, a6);
    -[UGCAddPhotosController _resolveInitialSourceTypeIfNeeded](v17, "_resolveInitialSourceTypeIfNeeded");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v17, "_imagePickerDidRetake:", _UIImagePickerControllerUserDidRejectItemNotification, 0);

  }
  return v17;
}

- (void)_resolveInitialSourceTypeIfNeeded
{
  unint64_t v3;
  BOOL v4;

  v3 = +[PhotoOptionsPicker numberOfSupportedSourceTypes](PhotoOptionsPicker, "numberOfSupportedSourceTypes");
  if (self->_initialSourceType)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (!v4)
    self->_initialSourceType = +[PhotoOptionsPicker preferredSourceType](PhotoOptionsPicker, "preferredSourceType");
}

- (void)present
{
  id WeakRetained;
  PhotoOptionsPicker *v4;
  id v5;
  id v6;
  _QWORD v7[5];

  if (+[PhotoOptionsPicker numberOfSupportedSourceTypes](PhotoOptionsPicker, "numberOfSupportedSourceTypes"))
  {
    if (self->_initialSourceType)
    {
      -[UGCAddPhotosController _presentImagePickerWithSourceType:](self, "_presentImagePickerWithSourceType:");
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "addPhotosControllerRequestsAnchoringView:", self));

      v4 = -[PhotoOptionsPicker initWithPresentingViewController:sourceView:delegate:]([PhotoOptionsPicker alloc], "initWithPresentingViewController:sourceView:delegate:", self->_presentingViewController, v6, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1008319EC;
      v7[3] = &unk_1011D8AF8;
      v7[4] = self;
      -[PhotoOptionsPicker presentPhotoOptionsWithPreparationBlock:](v4, "presentPhotoOptionsWithPreparationBlock:", v7);

    }
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "takePhotoController:didSelectPhotosWithMetadata:", self, &__NSArray0__struct);

  }
}

- (void)_presentImagePickerWithSourceType:(int64_t)a3
{
  UIImagePickerController *v5;
  UIImagePickerController *imagePicker;
  UIImagePickerController *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = (UIImagePickerController *)objc_alloc_init((Class)UIImagePickerController);
  imagePicker = self->_imagePicker;
  self->_imagePicker = v5;

  -[UIImagePickerController setDelegate:](self->_imagePicker, "setDelegate:", self);
  if (self->_multipleSelectionLimit >= 2)
  {
    -[UIImagePickerController _setAllowsMultipleSelection:](self->_imagePicker, "_setAllowsMultipleSelection:", 1);
    -[UIImagePickerController _setMultipleSelectionLimit:](self->_imagePicker, "_setMultipleSelectionLimit:", self->_multipleSelectionLimit);
  }
  if (a3 == 2)
  {
    -[UIImagePickerController setSourceType:](self->_imagePicker, "setSourceType:", 0);
    v9 = sub_1002A8AA0(self->_imagePicker);
    v7 = self->_imagePicker;
    if (v9 != 5)
    {
      v8 = 2;
      goto LABEL_9;
    }
    -[UIImagePickerController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "addPhotosControllerRequestsAnchoringView:", self));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_presentingViewController, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePicker, "popoverPresentationController"));
    objc_msgSend(v13, "setSourceView:", v12);

    objc_msgSend(v11, "bounds");
    objc_msgSend(v12, "convertRect:fromView:", v11);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePicker, "popoverPresentationController"));
    objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  }
  else if (a3 == 1)
  {
    -[UIImagePickerController setSourceType:](self->_imagePicker, "setSourceType:", 1);
    v7 = self->_imagePicker;
    v8 = 0;
LABEL_9:
    -[UIImagePickerController setModalPresentationStyle:](v7, "setModalPresentationStyle:", v8);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController popoverPresentationController](self->_imagePicker, "popoverPresentationController"));
  objc_msgSend(v23, "setDelegate:", self);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImagePickerController presentationController](self->_imagePicker, "presentationController"));
  objc_msgSend(v24, "setDelegate:", self);

  -[UIImagePickerController _setImagePickerSavingOptions:](self->_imagePicker, "_setImagePickerSavingOptions:", 6);
  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", self->_imagePicker, 1, 0);
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  void *v4;
  id WeakRetained;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, _UIImagePickerControllerUserDidRejectItemNotification, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "takePhotoControllerDidCancel:", self);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "takePhotoControllerDidCancel:", self);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  id v7;
  UIImage *v8;
  CGFloat Double;
  NSData *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "sourceType") == (id)1)
  {
    -[UGCAddPhotosController _captureUserAction:](self, "_captureUserAction:", 2129);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIImagePickerControllerEditedImage));
    if (!v8)
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));
    -[UIImage size](v8, "size");
    if (-[UGCAddPhotosController _isValidImageSize:](self, "_isValidImageSize:"))
    {
      Double = GEOConfigGetDouble(MapsConfig_ARPUserSelectedPhotoJPEGCompressionQuality, off_1014B4A98);
      v10 = UIImageJPEGRepresentation(v8, Double);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[UIImage size](v8, "size");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotosController _resizeImageIfNeeded:imageSize:](self, "_resizeImageIfNeeded:imageSize:", v11));

      if (v12)
      {
        UIImageDataWriteToSavedPhotosAlbum(v12, 0, 0, 0);
        -[UGCAddPhotosController _handleAddFromCameraWithImageData:mediaInfo:](self, "_handleAddFromCameraWithImageData:mediaInfo:", v12, v7);
      }

    }
    goto LABEL_12;
  }
  v13 = objc_msgSend(v6, "sourceType");
  if (v7
    && !v13
    && (-[UIImagePickerController _allowsMultipleSelection](self->_imagePicker, "_allowsMultipleSelection") & 1) == 0)
  {
    v14 = v7;
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    -[UGCAddPhotosController _handleAddFromLibraryWithEditingInfoList:](self, "_handleAddFromLibraryWithEditingInfoList:", v8);
LABEL_12:

  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4
{
  id v6;

  v6 = a4;
  if (!objc_msgSend(a3, "sourceType"))
    -[UGCAddPhotosController _handleAddFromLibraryWithEditingInfoList:](self, "_handleAddFromLibraryWithEditingInfoList:", v6);

}

- (void)_handleAddFromLibraryWithEditingInfoList:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  UIImage *v10;
  CGFloat Double;
  NSData *v12;
  void *v13;
  void *v14;
  void *v15;
  UGCPhotoWithMetadata *v16;
  void *v17;
  id WeakRetained;
  id v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  v20 = objc_alloc_init((Class)NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v10 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIImagePickerControllerEditedImage));
        if (!v10)
          v10 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIImagePickerControllerOriginalImage));
        -[UIImage size](v10, "size");
        if (-[UGCAddPhotosController _isValidImageSize:](self, "_isValidImageSize:"))
        {
          Double = GEOConfigGetDouble(MapsConfig_ARPUserSelectedPhotoJPEGCompressionQuality, off_1014B4A98);
          v12 = UIImageJPEGRepresentation(v10, Double);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[UIImage size](v10, "size");
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotosController _resizeImageIfNeeded:imageSize:](self, "_resizeImageIfNeeded:imageSize:", v13));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIImagePickerControllerPHAsset));
          v16 = -[UGCPhotoWithMetadata initWithImageData:PHAsset:sourceType:]([UGCPhotoWithMetadata alloc], "initWithImageData:PHAsset:sourceType:", v14, v15, 2);
          if (v16)
            objc_msgSend(v20, "addObject:", v16);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  -[UGCAddPhotosController _captureUserAction:](self, "_captureUserAction:", 2132);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "removeObserver:name:object:", self, _UIImagePickerControllerUserDidRejectItemNotification, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_msgSend(v20, "copy");
  objc_msgSend(WeakRetained, "takePhotoController:didSelectPhotosWithMetadata:", self, v19);

}

- (void)_handleAddFromCameraWithImageData:(id)a3 mediaInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  UGCAddPhotosController *v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v9 = objc_msgSend(v8, "isLocationServicesPossiblyAvailable");

  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1008322AC;
    v15 = &unk_1011D8B20;
    objc_copyWeak(&v18, &location);
    v16 = v6;
    v17 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "singleLocationUpdateWithHandler:", &v12));

    objc_msgSend(v11, "start", v12, v13, v14, v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (void)_imagePickerDidRetake:(id)a3
{
  -[UGCAddPhotosController _captureUserAction:](self, "_captureUserAction:", 2141);
}

- (BOOL)_isValidImageSize:(CGSize)a3
{
  double height;
  double width;
  double v7;
  float v8;

  height = a3.height;
  width = a3.width;
  if (a3.width * a3.height < (double)(unint64_t)-[GEOPlaceQuestionnaire minPixels](self->_placeQuestionnaire, "minPixels"))return 0;
  if (width > height)
    v7 = width / height;
  else
    v7 = height / width;
  -[GEOPlaceQuestionnaire maxAspectRatio](self->_placeQuestionnaire, "maxAspectRatio");
  return v7 <= v8;
}

- (id)_resizeImageIfNeeded:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  const __CFData *v7;
  double v8;
  id v9;
  void *v10;
  const __CFDictionary *v11;
  CGImageSource *v12;
  CGImage *ThumbnailAtIndex;
  __CFData *v14;
  CGImageDestination *v15;
  NSNumber *v16;
  void *v17;
  const __CFDictionary *v18;
  CFStringRef v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];

  height = a4.height;
  width = a4.width;
  v7 = (const __CFData *)a3;
  if (width * height > (double)(unint64_t)-[GEOPlaceQuestionnaire maxPixels](self->_placeQuestionnaire, "maxPixels")&& -[GEOPlaceQuestionnaire maxPixels](self->_placeQuestionnaire, "maxPixels"))
  {
    if (width > height)
      v8 = width / height;
    else
      v8 = height / width;
    v9 = -[GEOPlaceQuestionnaire maxPixels](self->_placeQuestionnaire, "maxPixels");
    v22[0] = kCGImageSourceThumbnailMaxPixelSize;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)sqrt(v8 * (double)(unint64_t)v9)));
    v23[0] = v10;
    v23[1] = kCFBooleanTrue;
    v22[1] = kCGImageSourceCreateThumbnailFromImageAlways;
    v22[2] = kCGImageSourceCreateThumbnailWithTransform;
    v23[2] = kCFBooleanTrue;
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));

    v12 = CGImageSourceCreateWithData(v7, 0);
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0, v11);
    if (v12)
      CFRelease(v12);
    v14 = (__CFData *)objc_alloc_init((Class)NSMutableData);
    v15 = CGImageDestinationCreateWithData(v14, CFSTR("public.jpeg"), 1uLL, 0);
    v20 = kCGImageDestinationLossyCompressionQuality;
    v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", GEOConfigGetDouble(MapsConfig_ARPUserSelectedPhotoJPEGCompressionQuality, off_1014B4A98));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v21 = v17;
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

    CGImageDestinationAddImage(v15, ThumbnailAtIndex, v18);
    CGImageDestinationFinalize(v15);
    CFRelease(v15);
    CGImageRelease(ThumbnailAtIndex);

  }
  else
  {
    v14 = v7;
  }

  return v14;
}

- (void)dismissWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  PhotoOptionsPicker *photoOptionsPicker;
  UIImagePickerController *imagePicker;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  photoOptionsPicker = self->_photoOptionsPicker;
  if (photoOptionsPicker)
  {
    -[PhotoOptionsPicker dismissPhotoOptionsWithCompletion:](photoOptionsPicker, "dismissPhotoOptionsWithCompletion:", v4);
  }
  else
  {
    imagePicker = self->_imagePicker;
    if (imagePicker)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100832760;
      v7[3] = &unk_1011AE240;
      v7[4] = self;
      v8 = v4;
      -[UIImagePickerController dismissViewControllerAnimated:completion:](imagePicker, "dismissViewControllerAnimated:completion:", 1, v7);

    }
    else
    {
      v4[2](v4);
    }
  }

}

- (void)photoOptionsPickerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008327EC;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissPhotoOptionsWithCompletion:", v3);
}

- (void)photoOptionsPickerDidSelectAddFromLibrary:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100832854;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissPhotoOptionsWithCompletion:", v3);
}

- (void)photoOptionsPickerDidSelectTakePhoto:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008328E0;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  objc_msgSend(a3, "dismissPhotoOptionsWithCompletion:", v3);
}

- (void)_captureUserAction:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 620, 0);
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (void)setMaximumCount:(unint64_t)a3
{
  self->_maximumCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeQuestionnaire, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_photoOptionsPicker, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
}

@end
