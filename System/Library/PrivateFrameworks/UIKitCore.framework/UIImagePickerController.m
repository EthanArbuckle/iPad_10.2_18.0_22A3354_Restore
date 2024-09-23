@implementation UIImagePickerController

+ (BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)sourceType
{
  int v3;

  LOBYTE(v3) = 1;
  if (sourceType > UIImagePickerControllerSourceTypeCamera)
  {
    if (sourceType == UIImagePickerControllerSourceTypeSavedPhotosAlbum || sourceType == 1000)
      return v3;
LABEL_10:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
    return v3;
  if (sourceType != UIImagePickerControllerSourceTypeCamera)
    goto LABEL_10;
  v3 = MGGetBoolAnswer();
  if (v3)
    LOBYTE(v3) = MGGetBoolAnswer() ^ 1;
  return v3;
}

+ (BOOL)_isMediaTypeAvailable:(id)a3 forSource:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v11;
  int v12;
  void *v13;
  int v14;

  v6 = a3;
  if (objc_msgSend(a1, "isSourceTypeAvailable:", a4))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isEqualToString:", v11);

      if (v12)
      {
        if (a4 == 1)
          v9 = MGGetBoolAnswer();
        else
          v9 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 0;
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC540], "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "isEqualToString:", v13);

        if (a4 == 1)
          v9 = 0;
        else
          v9 = v14;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_reviewCapturedItems
{
  return 1;
}

+ (NSArray)availableMediaTypesForSourceType:(UIImagePickerControllerSourceType)sourceType
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isSourceTypeAvailable:"))
    return (NSArray *)0;
  v5 = (void *)*MEMORY[0x1E0CEC568];
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "_isMediaTypeAvailable:forSource:", v6, sourceType);

  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    v14[0] = v8;
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v11;
}

+ (BOOL)isCameraDeviceAvailable:(UIImagePickerControllerCameraDevice)cameraDevice
{
  if ((unint64_t)cameraDevice > UIImagePickerControllerCameraDeviceFront)
    return 0;
  else
    return MGGetBoolAnswer();
}

+ (NSArray)availableCaptureModesForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (cameraDevice == UIImagePickerControllerCameraDeviceFront)
  {
    if (MGGetBoolAnswer())
    {
      v7 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithObjects:", v6, v8, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_9:
    v5 = 0;
    return (NSArray *)v5;
  }
  if (cameraDevice || !MGGetBoolAnswer())
    goto LABEL_9;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
LABEL_8:

  }
  return (NSArray *)v5;
}

+ (BOOL)isFlashAvailableForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
  if ((unint64_t)cameraDevice > UIImagePickerControllerCameraDeviceFront)
    return 0;
  else
    return MGGetBoolAnswer();
}

- (UIImagePickerController)init
{
  UIImagePickerController *v2;
  FILE *v3;
  char *v4;
  FILE *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  NSArray *mediaTypes;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)UIImagePickerController;
  v2 = -[UIViewController init](&v11, sel_init);
  if (v2)
  {
    if (UIImagePickerLoadPhotoLibraryIfNecessary())
    {
      if ((_MergedGlobals_7_1 & 1) == 0)
      {
        qword_1ECD7B0D8 = (uint64_t)dlopen((const char *)objc_msgSend(CFSTR("/System/Library/Frameworks/PhotosUI.framework/PhotosUI"), "fileSystemRepresentation"), 2);
        if (qword_1ECD7B0D8)
        {
          _MergedGlobals_7_1 = 1;
        }
        else
        {
          v3 = (FILE *)*MEMORY[0x1E0C80C10];
          v4 = dlerror();
          fprintf(v3, "Couldn't load framework: %s\n", v4);
          _MergedGlobals_7_1 = 1;
          if (!qword_1ECD7B0D8)
            goto LABEL_12;
        }
      }
      if ((byte_1ECD7B0D1 & 1) != 0)
      {
LABEL_11:
        v2->_sourceType = 0;
        v2->_savingOptions = 2;
        objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v8 = objc_claimAutoreleasedReturnValue();
        mediaTypes = v2->_mediaTypes;
        v2->_mediaTypes = (NSArray *)v8;

        -[UIViewController _setIgnoreAppSupportedOrientations:](v2, "_setIgnoreAppSupportedOrientations:", 1);
        -[UINavigationController setPreferredContentSize:](v2, "setPreferredContentSize:", 320.0, 480.0);
        return v2;
      }
      qword_1ECD7B0E0 = (uint64_t)dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CameraUI.framework/CameraUI"), "fileSystemRepresentation"), 2);
      if (qword_1ECD7B0E0)
      {
        byte_1ECD7B0D1 = 1;
        goto LABEL_11;
      }
      v5 = (FILE *)*MEMORY[0x1E0C80C10];
      v6 = dlerror();
      fprintf(v5, "Couldn't load framework: %s\n", v6);
      byte_1ECD7B0D1 = 1;
      if (qword_1ECD7B0E0)
        goto LABEL_11;
    }
LABEL_12:

    return 0;
  }
  return v2;
}

- (UIImagePickerController)initWithCoder:(id)a3
{
  id v4;
  UIImagePickerController *v5;
  uint64_t v6;
  void *mediaTypes;
  uint64_t v8;
  NSArray *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIImagePickerController;
  v5 = -[UINavigationController initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    if (UIImagePickerLoadPhotoLibraryIfNecessary())
    {
      v5->_sourceType = 0;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISourceType")))
        v5->_sourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISourceType"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIMediaTypes")))
      {
        objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIMediaTypes"));
        v6 = objc_claimAutoreleasedReturnValue();
        mediaTypes = v5->_mediaTypes;
        v5->_mediaTypes = (NSArray *)v6;
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
        mediaTypes = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = mediaTypes;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v5->_mediaTypes;
        v5->_mediaTypes = (NSArray *)v8;

      }
      -[UIImagePickerController _setAllowsImageEditing:](v5, "_setAllowsImageEditing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAllowsImageEditing")));
      v5->_savingOptions = 2;
      -[UIViewController _setIgnoreAppSupportedOrientations:](v5, "_setIgnoreAppSupportedOrientations:", 1);
      -[UINavigationController setPreferredContentSize:](v5, "setPreferredContentSize:", 320.0, 480.0);
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)_initWithSourceImageData:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  UIImagePickerController *v11;
  void *v12;
  uint64_t v13;
  NSArray *mediaTypes;
  objc_super v16;
  _QWORD v17[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIImagePickerController;
  v11 = -[UIViewController init](&v16, sel_init);
  if (v11)
  {
    if (UIImagePickerLoadPhotoLibraryIfNecessary())
    {
      objc_storeStrong(&v11->_image, a3);
      v11->_cropRect.origin.x = x;
      v11->_cropRect.origin.y = y;
      v11->_cropRect.size.width = width;
      v11->_cropRect.size.height = height;
      v11->_sourceType = 1000;
      objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      mediaTypes = v11->_mediaTypes;
      v11->_mediaTypes = (NSArray *)v13;

      -[UIImagePickerController _setAllowsImageEditing:](v11, "_setAllowsImageEditing:", 1);
      v11->_savingOptions = 2;
      -[UIViewController _setIgnoreAppSupportedOrientations:](v11, "_setIgnoreAppSupportedOrientations:", 1);
      -[UINavigationController setPreferredContentSize:](v11, "setPreferredContentSize:", 320.0, 480.0);
    }
    else
    {

      v11 = 0;
    }
  }

  return v11;
}

- (void)_populateArchivedChildViewControllers:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIImagePickerController;
  v3 = a3;
  -[UIViewController _populateArchivedChildViewControllers:](&v4, sel__populateArchivedChildViewControllers_, v3);
  objc_msgSend(v3, "removeAllObjects", v4.receiver, v4.super_class);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t sourceType;
  NSArray *mediaTypes;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIImagePickerController;
  -[UINavigationController encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  sourceType = self->_sourceType;
  if (sourceType)
    objc_msgSend(v4, "encodeInteger:forKey:", sourceType, CFSTR("UISourceType"));
  if (-[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing"), CFSTR("UIAllowsImageEditing"));
  mediaTypes = self->_mediaTypes;
  if (mediaTypes)
    objc_msgSend(v4, "encodeObject:forKey:", mediaTypes, CFSTR("UIMediaTypes"));

}

- (void)_updateCameraCaptureMode
{
  void *v3;
  unsigned int v4;
  id v5;

  if (-[UIImagePickerController sourceType](self, "sourceType") == UIImagePickerControllerSourceTypeCamera
    && -[NSArray count](self->_mediaTypes, "count") == 1)
  {
    -[NSArray objectAtIndex:](self->_mediaTypes, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", v3);

    -[UIImagePickerController setCameraCaptureMode:](self, "setCameraCaptureMode:", v4);
  }
}

- (void)setSourceType:(UIImagePickerControllerSourceType)sourceType
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSArray *mediaTypes;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_sourceType != sourceType)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSourceTypeAvailable:", sourceType) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Source type %ld not available"), sourceType);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    self->_sourceType = sourceType;
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_mediaTypes;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_opt_class(), "_isMediaTypeAvailable:forSource:", v11, self->_sourceType))-[NSArray addObject:](v5, "addObject:", v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (!-[NSArray count](v5, "count"))
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v5, "addObject:", v12);

    }
    mediaTypes = self->_mediaTypes;
    self->_mediaTypes = v5;

    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
      -[UIImagePickerController _setupControllersForCurrentSourceTypeWithCompletion:](self, "_setupControllersForCurrentSourceTypeWithCompletion:", 0);
    -[UIImagePickerController _updateCameraCaptureMode](self, "_updateCameraCaptureMode");
  }
}

- (UIImagePickerControllerSourceType)sourceType
{
  return self->_sourceType;
}

- (void)setMediaTypes:(NSArray *)mediaTypes
{
  NSArray *v4;
  UIImagePickerControllerSourceType v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  const __CFString *v18;
  id v19;
  UIImagePickerControllerSourceType v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = mediaTypes;
  if (self->_mediaTypes == v4)
  {
    v6 = 0;
  }
  else
  {
    v5 = -[UIImagePickerController sourceType](self, "sourceType");
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v4;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend((id)objc_opt_class(), "_isMediaTypeAvailable:forSource:", v13, v5))
          {
            objc_msgSend(v6, "addObject:", v13);
            ++v10;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    objc_msgSend((id)*MEMORY[0x1E0CEC540], "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", v14) & 1) != 0)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v6, "containsObject:", v15);

      if ((v16 & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = CFSTR("The Live Photo type cannot be specified without the Image media type");
        goto LABEL_23;
      }
    }
    else
    {

    }
    if (!v10)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      v20 = v5;
      v18 = CFSTR("No available types for source %ld");
LABEL_23:
      objc_msgSend(v17, "stringWithFormat:", v18, v20);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v19);
    }
    objc_storeStrong((id *)&self->_mediaTypes, v6);
    -[UIImagePickerController _updateCameraCaptureMode](self, "_updateCameraCaptureMode");
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
      -[UIImagePickerController _setupControllersForCurrentMediaTypes](self, "_setupControllersForCurrentMediaTypes");
  }

}

- (NSArray)mediaTypes
{
  return (NSArray *)(id)-[NSArray copy](self->_mediaTypes, "copy");
}

- (BOOL)_allowsMultipleSelection
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerAllowMutipleSelection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setAllowsMultipleSelection:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerAllowMutipleSelection"));

}

- (unint64_t)_multipleSelectionLimit
{
  void *v2;
  unint64_t v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerMultipleSelectionLimit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)_setMultipleSelectionLimit:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerMultipleSelectionLimit"));

}

- (BOOL)_requiresPickingConfirmation
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerRequiresPickingConfirmation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setRequiresPickingConfirmation:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerRequiresPickingConfirmation"));

}

- (BOOL)_showsFileSizePicker
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerShowsFileSizePicker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setShowsFileSizePicker:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerShowsFileSizePicker"));

}

- (BOOL)_onlyShowAutoloops
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerOnlyShowAutoloopVideos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setOnlyShowAutoloops:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerOnlyShowAutoloopVideos"));

}

- (BOOL)_convertAutoloopsToGIF
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerConvertAutoloopsToGIF"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setConvertAutoloopsToGIF:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerConvertAutoloopsToGIF"));

}

- (BOOL)_showsPrompt
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerShowsPrompt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setShowsPrompt:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerShowsPrompt"));

}

- (id)_staticPrompt
{
  return -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerStaticPrompt"));
}

- (void)_setStaticPrompt:(id)a3
{
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("_UIImagePickerControllerStaticPrompt"));
}

- (id)_targetForPrompt
{
  return -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerTargetForPrompt"));
}

- (void)_setTargetForPrompt:(id)a3
{
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("_UIImagePickerControllerTargetForPrompt"));
}

- (BOOL)_allowsIris
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerAllowIris"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setAllowsIris:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerAllowIris"));

}

- (UIImagePickerControllerImageURLExportPreset)imageExportPreset
{
  void *v2;
  UIImagePickerControllerImageURLExportPreset v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerImageURLExportPreset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setImageExportPreset:(UIImagePickerControllerImageURLExportPreset)imageExportPreset
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", imageExportPreset);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("_UIImagePickerControllerImageURLExportPreset"));

}

- (NSTimeInterval)videoMaximumDuration
{
  void *v2;
  double v3;
  double v4;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("UIImagePickerControllerVideoMaximumDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setVideoMaximumDuration:(NSTimeInterval)videoMaximumDuration
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", videoMaximumDuration);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("UIImagePickerControllerVideoMaximumDuration"));

}

- (UIImagePickerControllerQualityType)videoQuality
{
  void *v2;
  UIImagePickerControllerQualityType v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("UIImagePickerControllerVideoQuality"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setVideoQuality:(UIImagePickerControllerQualityType)videoQuality
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", videoQuality);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("UIImagePickerControllerVideoQuality"));

}

- (NSString)videoExportPreset
{
  return (NSString *)-[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerVideoRemakerQuality"));
}

- (void)setVideoExportPreset:(NSString *)videoExportPreset
{
  -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", videoExportPreset, CFSTR("_UIImagePickerControllerVideoRemakerQuality"));
}

- (void)_setAllowsImageEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (-[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing") != a3)
  {
    if (v3)
    {
      -[objc_class performSelector:](NSClassFromString(CFSTR("PLPrivacy")), "performSelector:", sel_sharedInstance);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v5, "isPhotoLibraryModificationAllowed");
      else
        v6 = 1;

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v7, CFSTR("UIImagePickerControllerAllowsEditing"));

  }
}

- (BOOL)_allowsImageEditing
{
  void *v2;
  char v3;

  -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("UIImagePickerControllerAllowsEditing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setProperties:(id)a3
{
  objc_class *v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *properties;

  if (self->_properties != a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99E08];
    v5 = a3;
    v6 = (NSMutableDictionary *)objc_msgSend([v4 alloc], "initWithDictionary:", v5);

    properties = self->_properties;
    self->_properties = v6;

  }
}

- (void)_initializeProperties
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *properties;
  uint64_t v15;
  void *v16;
  id v17;
  _OWORD v18[4];

  if (!self->_properties)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isCameraDeviceAvailable:", 0) & 1) != 0)
      v3 = 0;
    else
      v3 = objc_msgSend((id)objc_opt_class(), "isCameraDeviceAvailable:", 1);
    v17 = objc_alloc(MEMORY[0x1E0C99E08]);
    v4 = *MEMORY[0x1E0C9AE40];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0C9AE50];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v18[0] = *MEMORY[0x1E0C9BAA8];
    v18[1] = v5;
    v18[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 600.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_reviewCapturedItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSMutableDictionary *)objc_msgSend(v17, "initWithObjectsAndKeys:", v4, CFSTR("UIImagePickerControllerAllowsEditing"), v16, CFSTR("UIImagePickerControllerVideoQuality"), v15, CFSTR("_UIImagePickerControllerShowCameraControls"), v6, CFSTR("_UIImagePickerControllerCameraViewTransform"), v7, CFSTR("UIImagePickerControllerVideoMaximumDuration"), v8, CFSTR("_UIImagePickerControllerCameraDevice"), v9, CFSTR("_UIImagePickerControllerCameraCaptureMode"), v10, CFSTR("_UIImagePickerControllerCameraFlashMode"), v11,
                                   CFSTR("_UIImagePickerControllerReviewCapturedItem"),
                                   v4,
                                   CFSTR("_UIImagePickerControllerAllowIris"),
                                   v12,
                                   CFSTR("_UIImagePickerControllerImageURLExportPreset"),
                                   0);
    properties = self->_properties;
    self->_properties = v13;

  }
}

- (id)_properties
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (!properties)
  {
    -[UIImagePickerController _initializeProperties](self, "_initializeProperties");
    properties = self->_properties;
  }
  return (id)-[NSMutableDictionary copy](properties, "copy");
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSMutableDictionary *properties;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_properties)
    -[UIImagePickerController _initializeProperties](self, "_initializeProperties");
  v7 = -[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing");
  properties = self->_properties;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", v10, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v6);
  if (v7 != -[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("_UIImagePickerControllerEditabilityChanged"), self, 0);

  }
}

- (id)_valueForProperty:(id)a3
{
  id v4;
  NSMutableDictionary *properties;
  void *v6;

  v4 = a3;
  properties = self->_properties;
  if (!properties)
  {
    -[UIImagePickerController _initializeProperties](self, "_initializeProperties");
    properties = self->_properties;
  }
  -[NSMutableDictionary objectForKey:](properties, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setImagePickerSavingOptions:(unint64_t)a3
{
  self->_savingOptions = a3;
}

- (unint64_t)_imagePickerSavingOptions
{
  return self->_savingOptions;
}

- (BOOL)_sourceTypeIsCamera
{
  UIImagePickerControllerSourceType v2;
  id v3;

  v2 = -[UIImagePickerController sourceType](self, "sourceType");
  if (v2 != UIImagePickerControllerSourceTypeCamera)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Source type must be UIImagePickerControllerSourceTypeCamera"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return v2;
}

- (id)_cameraViewController
{
  void *v3;
  void *v4;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    -[UINavigationController viewControllers](self, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)showsCameraControls
{
  void *v3;
  char v4;
  BOOL v5;

  if (!-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
    return 1;
  if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_showsCameraControls");
  }
  else
  {
    -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerShowCameraControls"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  v5 = v4;

  return v5;
}

- (void)setShowsCameraControls:(BOOL)showsCameraControls
{
  _BOOL8 v3;
  id v5;

  v3 = showsCameraControls;
  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
    {
      -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setShowsCameraControls:", v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }

  }
}

- (UIView)cameraOverlayView
{
  void *v3;
  void *v4;
  UIView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "_cameraOverlayView");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerCameraOverlayView"));
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bounds");
        v8 = v7;
        v10 = v9;
        v12 = v11;
        v14 = v13;

        v5 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v10, v12, v14);
        -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v5, CFSTR("_UIImagePickerControllerCameraOverlayView"));
      }
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setCameraOverlayView:(UIView *)cameraOverlayView
{
  void *v4;
  void *v5;
  UIView *v6;

  v6 = cameraOverlayView;
  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "_setCameraOverlayView:", v6);
    else
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v6, CFSTR("_UIImagePickerControllerCameraOverlayView"));

  }
}

- (CGAffineTransform)cameraViewTransform
{
  uint64_t v5;
  __int128 v6;
  CGAffineTransform *result;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  result = (CGAffineTransform *)-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera");
  if ((_DWORD)result)
  {
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
    {
      -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v10;
      if (v10)
      {
        objc_msgSend(v10, "_cameraViewTransform");
        goto LABEL_8;
      }
    }
    else
    {
      -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerCameraViewTransform"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "CGAffineTransformValue");
LABEL_8:
        *(_OWORD *)&retstr->a = v11;
        *(_OWORD *)&retstr->c = v12;
        *(_OWORD *)&retstr->tx = v13;

        return result;
      }
    }
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    goto LABEL_8;
  }
  return result;
}

- (void)setCameraViewTransform:(CGAffineTransform *)cameraViewTransform
{
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
    {
      -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_OWORD *)&cameraViewTransform->c;
      v8 = *(_OWORD *)&cameraViewTransform->a;
      v9 = v7;
      v10 = *(_OWORD *)&cameraViewTransform->tx;
      objc_msgSend(v6, "_setCameraViewTransform:", &v8);
    }
    else
    {
      v5 = *(_OWORD *)&cameraViewTransform->c;
      v8 = *(_OWORD *)&cameraViewTransform->a;
      v9 = v5;
      v10 = *(_OWORD *)&cameraViewTransform->tx;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:", v6, CFSTR("_UIImagePickerControllerCameraViewTransform"));
    }

  }
}

- (void)takePicture
{
  id v3;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_takePicture");

  }
}

- (BOOL)startVideoCapture
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera");
  if (v3)
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_startVideoCapture");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)stopVideoCapture
{
  id v3;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_stopVideoCapture");

  }
}

- (UIImagePickerControllerCameraDevice)cameraDevice
{
  void *v3;
  UIImagePickerControllerCameraDevice v4;

  if (!-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
    return 0;
  if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_cameraDevice");
  }
  else
  {
    -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerCameraDevice"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue");
  }

  return v4;
}

- (void)setCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
  id v5;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera")
    && objc_msgSend((id)objc_opt_class(), "isCameraDeviceAvailable:", cameraDevice))
  {
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
    {
      -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setCameraDevice:", cameraDevice);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", cameraDevice);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }

  }
}

- (UIImagePickerControllerCameraCaptureMode)cameraCaptureMode
{
  void *v3;
  UIImagePickerControllerCameraCaptureMode v4;

  if (!-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
    return 0;
  if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_cameraCaptureMode");
  }
  else
  {
    -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerCameraCaptureMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue");
  }

  return v4;
}

- (BOOL)_isCameraCaptureModeValid:(int64_t)a3
{
  NSArray *mediaTypes;
  void *v4;

  mediaTypes = self->_mediaTypes;
  MediaTypeForCameraCaptureMode(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mediaTypes) = -[NSArray containsObject:](mediaTypes, "containsObject:", v4);

  return (char)mediaTypes;
}

- (void)setCameraCaptureMode:(UIImagePickerControllerCameraCaptureMode)cameraCaptureMode
{
  id v5;
  id v6;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    if (!-[UIImagePickerController _isCameraCaptureModeValid:](self, "_isCameraCaptureModeValid:", cameraCaptureMode))
    {
      MediaTypeForCameraCaptureMode(cameraCaptureMode);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cameraCaptureMode %ld not available because mediaTypes does contain %@"), cameraCaptureMode, objc_claimAutoreleasedReturnValue());
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
    {
      -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setCameraCaptureMode:", cameraCaptureMode);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", cameraCaptureMode);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }

  }
}

- (UIImagePickerControllerCameraFlashMode)cameraFlashMode
{
  void *v3;
  UIImagePickerControllerCameraFlashMode v4;

  if (!-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
    return 0;
  if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
  {
    -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_cameraFlashMode");
  }
  else
  {
    -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerCameraFlashMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v3, "intValue");
  }

  return v4;
}

- (void)setCameraFlashMode:(UIImagePickerControllerCameraFlashMode)cameraFlashMode
{
  id v5;

  if (-[UIImagePickerController _sourceTypeIsCamera](self, "_sourceTypeIsCamera"))
  {
    if ((*(_BYTE *)&self->_imagePickerFlags & 1) != 0)
    {
      -[UIImagePickerController _cameraViewController](self, "_cameraViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setCameraFlashMode:", cameraFlashMode);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", cameraFlashMode);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }

  }
}

- (void)_viewControllerPresentationDidInitiate
{
  _QWORD v3[5];

  if (-[UIImagePickerController _shouldDelayPresentation](self, "_shouldDelayPresentation")
    && !self->_photoPickerDidStartDelayingPresentation)
  {
    self->_photoPickerDidStartDelayingPresentation = 1;
    self->_photoPickerDidEndDelayingPresentation = 0;
    -[UIViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_130, 3.0);
    if (!self->_photoPickerIsPreheating)
    {
      self->_photoPickerIsPreheating = 1;
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __65__UIImagePickerController__viewControllerPresentationDidInitiate__block_invoke_2;
      v3[3] = &unk_1E16B1B28;
      v3[4] = self;
      -[UIImagePickerController _setupControllersForCurrentSourceTypeWithCompletion:](self, "_setupControllersForCurrentSourceTypeWithCompletion:", v3);
    }
  }
}

uint64_t __65__UIImagePickerController__viewControllerPresentationDidInitiate__block_invoke()
{
  return 1;
}

uint64_t __65__UIImagePickerController__viewControllerPresentationDidInitiate__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1506) = 0;
  return result;
}

- (void)viewWillUnload
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIViewController parentViewController](self, "parentViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      *(_BYTE *)&self->_imagePickerFlags &= ~1u;
      -[UIImagePickerController _removeAllChildren](self, "_removeAllChildren");
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIImagePickerController;
  -[UIViewController viewWillUnload](&v6, sel_viewWillUnload);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  UIViewController *photoPickerPreheatedViewController;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  objc_super v16;

  v3 = a3;
  if ((*(_BYTE *)&self->_imagePickerFlags & 3) == 0)
  {
    *(_BYTE *)&self->_imagePickerFlags = *(_BYTE *)&self->_imagePickerFlags & 0xFA | 1;
    if (!self->_photoPickerIsPreheating)
    {
      -[UINavigationController viewControllers](self, "viewControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (!v6)
      {
        if (self->_photoPickerPreheatedViewController)
        {
          -[UIImagePickerController _handleTopViewControllerReadyForDisplay:](self, "_handleTopViewControllerReadyForDisplay:");
          photoPickerPreheatedViewController = self->_photoPickerPreheatedViewController;
          self->_photoPickerPreheatedViewController = 0;

        }
        else
        {
          -[UIImagePickerController _setupControllersForCurrentSourceTypeWithCompletion:](self, "_setupControllersForCurrentSourceTypeWithCompletion:");
        }
      }
    }
    if ((objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance") & 1) == 0)
    {
      -[UINavigationController _window](self, "_window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "statusBarStyle");

      __UIStatusBarManagerForWindow(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v11, "isStatusBarHidden");

      if ((_DWORD)v9)
        v12 = -1;
      else
        v12 = v10;
      self->_previousStatusBarStyle = v12;
      -[UINavigationController _window](self, "_window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isStatusBarHidden");

      self->_previousStatusBarHidden = v15;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)UIImagePickerController;
  -[UINavigationController viewWillAppear:](&v16, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UIStatusBarHideAnimationParameters *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t previousStatusBarStyle;
  double v18;
  objc_super v19;

  v3 = a3;
  if ((objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance") & 1) != 0)
    goto LABEL_9;
  -[UINavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_4:

      goto LABEL_5;
    }
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      *(_BYTE *)&self->_imagePickerFlags |= 4u;
      -[UINavigationController _window](self, "_window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "statusBarStyle");

      objc_msgSend(v5, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "_imagePickerStatusBarStyle");
      previousStatusBarStyle = self->_previousStatusBarStyle;
      if ((_DWORD)previousStatusBarStyle != -1 && v15 == v16 && v15 != previousStatusBarStyle)
      {
        if (v3)
        {
          +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", 2);
          previousStatusBarStyle = self->_previousStatusBarStyle;
        }
        else
        {
          v18 = 0.0;
        }
        objc_msgSend((id)UIApp, "setStatusBarStyle:duration:", previousStatusBarStyle, v18);
      }
      goto LABEL_4;
    }
  }
LABEL_5:
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = -[UIStatusBarHideAnimationParameters initWithDefaultParameters]([UIStatusBarHideAnimationParameters alloc], "initWithDefaultParameters");
      -[UIStatusBarHideAnimationParameters setHideAnimation:](v12, "setHideAnimation:", 0);
      objc_msgSend((id)UIApp, "setStatusBarHidden:animationParameters:", self->_previousStatusBarHidden, v12);

    }
  }

LABEL_9:
  v19.receiver = self;
  v19.super_class = (Class)UIImagePickerController;
  -[UINavigationController viewWillDisappear:](&v19, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UIViewController *photoPickerPreheatedViewController;
  objc_super v8;

  v3 = a3;
  -[UIViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      *(_BYTE *)&self->_imagePickerFlags &= ~1u;
      -[UIImagePickerController _invalidatePhotoPickerServices](self, "_invalidatePhotoPickerServices");
      -[UIImagePickerController _setPhotoPickerDisplayCompletion:](self, "_setPhotoPickerDisplayCompletion:", 0);
      -[UIImagePickerController _setPhotoPickerPreviewDisplayCompletion:](self, "_setPhotoPickerPreviewDisplayCompletion:", 0);
      -[UIImagePickerController setPhotosExtension:](self, "setPhotosExtension:", 0);
      self->_photoPickerIsPreheating = 0;
      photoPickerPreheatedViewController = self->_photoPickerPreheatedViewController;
      self->_photoPickerPreheatedViewController = 0;

      self->_photoPickerDidStartDelayingPresentation = 0;
      self->_photoPickerDidEndDelayingPresentation = 0;
      -[UIImagePickerController _removeAllChildren](self, "_removeAllChildren");
    }
  }
  *(_BYTE *)&self->_imagePickerFlags &= ~4u;
  v8.receiver = self;
  v8.super_class = (Class)UIImagePickerController;
  -[UINavigationController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
}

- (BOOL)_didRevertStatusBar
{
  return (*(_BYTE *)&self->_imagePickerFlags >> 2) & 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  if (-[UIImagePickerController sourceType](self, "sourceType") != UIImagePickerControllerSourceTypeCamera)
    return 1;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 == 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  if (-[UIImagePickerController sourceType](self, "sourceType") != UIImagePickerControllerSourceTypeCamera)
    return 1;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 == 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  if (-[UIImagePickerController sourceType](self, "sourceType") == UIImagePickerControllerSourceTypeCamera
    && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "userInterfaceIdiom"),
        v2,
        (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    return 2;
  }
  else
  {
    return 30;
  }
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  -[UIViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
}

- (void)_removeAllChildren
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UINavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      *(_BYTE *)&self->_imagePickerFlags |= 2u;
      -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
      *(_BYTE *)&self->_imagePickerFlags &= ~2u;
    }
    -[UINavigationController topViewController](self, "topViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UINavigationController setViewControllers:](self, "setViewControllers:", MEMORY[0x1E0C9AA60]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "performSelector:", sel__removedAsTopViewController);
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutSubviews");

  }
}

- (BOOL)_shouldDelayPresentation
{
  return (self->_sourceType & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)_createInitialControllerWithCompletion:(id)a3
{
  void (**v4)(id, _UIImagePickerPlaceholderViewController *, _QWORD);
  int64_t sourceType;
  void *v6;
  _UIImagePickerPlaceholderViewController *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char isKindOfClass;
  id v17;
  id image;
  double x;
  double y;
  double width;
  double height;
  _UIImagePickerPlaceholderViewController *v23;
  _QWORD v24[4];
  void (**v25)(id, _UIImagePickerPlaceholderViewController *, _QWORD);
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _UIImagePickerPlaceholderViewController *, _QWORD))a3;
  sourceType = self->_sourceType;
  if (sourceType > 1)
  {
    if (sourceType == 1000)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v17 = objc_alloc(NSClassFromString(CFSTR("PLUIImageViewController")));
      image = self->_image;
      x = self->_cropRect.origin.x;
      y = self->_cropRect.origin.y;
      width = self->_cropRect.size.width;
      height = self->_cropRect.size.height;
      if ((isKindOfClass & 1) != 0)
        v23 = (_UIImagePickerPlaceholderViewController *)objc_msgSend(v17, "initWithImageData:cropRect:", image, x, y, width, height);
      else
        v23 = (_UIImagePickerPlaceholderViewController *)objc_msgSend(v17, "initWithUIImage:cropRect:", image, x, y, width, height);
      v7 = v23;
      -[UIViewController _setImagePickerMediaTypes:](v23, "_setImagePickerMediaTypes:", self->_mediaTypes);
      v4[2](v4, v7, 0);
      goto LABEL_17;
    }
    if (sourceType != 2)
      goto LABEL_18;
    v8 = CFSTR("PUUIMomentsGridViewController");
LABEL_9:
    v7 = objc_alloc_init(_UIImagePickerPlaceholderViewController);
    -[UIImagePickerController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIImagePickerControllerHidesPlaceholderNavigationBar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImagePickerPlaceholderViewController setHidesPlaceholderNavigationBar:](v7, "setHidesPlaceholderNavigationBar:", objc_msgSend(v9, "BOOLValue"));

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v4[2](v4, v7, 1);
    v27 = *MEMORY[0x1E0CB2A08];
    v28[0] = CFSTR("com.apple.mobileslideshow.photo-picker");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v12, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImagePickerController setPhotosExtension:](self, "setPhotosExtension:", v15);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __66__UIImagePickerController__createInitialControllerWithCompletion___block_invoke;
      v24[3] = &unk_1E16C0440;
      v25 = v4;
      -[UIImagePickerController _handleMatchingExtension:viewControllerClassName:completion:](self, "_handleMatchingExtension:viewControllerClassName:completion:", v15, v8, v24);

    }
    else
    {
      NSLog(CFSTR("UIImagePickerController extension discovery failed with error: %@"), v14);
    }

    goto LABEL_17;
  }
  if (!sourceType)
  {
    v8 = CFSTR("PUUIAlbumListViewController");
    goto LABEL_9;
  }
  if (sourceType == 1)
  {
    -[UIImagePickerController _properties](self, "_properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (_UIImagePickerPlaceholderViewController *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("CAMImagePickerCameraViewController"))), "initWithInitialImagePickerProperties:", v6);
    -[UIViewController _setImagePickerMediaTypes:](v7, "_setImagePickerMediaTypes:", self->_mediaTypes);
    v4[2](v4, v7, 0);

LABEL_17:
  }
LABEL_18:

}

uint64_t __66__UIImagePickerController__createInitialControllerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleMatchingExtension:(id)a3 viewControllerClassName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIImagePickerController _propertiesForPhotoPickerExtension](self, "_propertiesForPhotoPickerExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(-[UIImagePickerController photoPickerRequestOptionsClass](self, "photoPickerRequestOptionsClass")), "initWithRequestedClassName:photoPickerProperties:", v9, v11);
  v13 = objc_alloc(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithItem:typeIdentifier:", v12, v14);

  v16 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  v25[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttachments:", v17);

  objc_initWeak(&location, self);
  v24 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__UIImagePickerController__handleMatchingExtension_viewControllerClassName_completion___block_invoke;
  v20[3] = &unk_1E16C0468;
  objc_copyWeak(&v22, &location);
  v19 = v10;
  v21 = v19;
  objc_msgSend(v8, "instantiateViewControllerWithInputItems:connectionHandler:", v18, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __87__UIImagePickerController__handleMatchingExtension_viewControllerClassName_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleInstantiatedRemoteViewController:request:error:completion:", v9, v10, v8, *(_QWORD *)(a1 + 32));

}

- (void)_handleInstantiatedRemoteViewController:(id)a3 request:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  UIImagePickerController *v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = v11;
    -[UIImagePickerController photosExtension](self, "photosExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_extensionContextForUUID:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "performSelector:withObject:", sel_setDelegate_, self);
    objc_msgSend(v16, "performSelector:withObject:", sel_setRequestIdentifier_, v14);
    objc_msgSend(v10, "performSelector:withObject:", sel_setHostExtensionContext_, v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "_setImagePickerMediaTypes:", self->_mediaTypes);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "performSelector:withObject:", sel_setDelegate_, self);
    -[UIViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v10, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_3;
      block[3] = &unk_1E16BB458;
      v36 = v13;
      v34 = v10;
      v35 = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v27 = v36;
    }
    else
    {
      v31 = v14;
      v32 = v11;
      -[UIViewController traitCollection](self, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOverrideTraitCollection:", v27);
      -[UIViewController _contentOverlayInsets](self, "_contentOverlayInsets");
      objc_msgSend(v10, "_setContentOverlayInsets:");
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke;
      aBlock[3] = &unk_1E16C0490;
      v38 = v12;
      v40 = v13;
      v28 = v10;
      v39 = v28;
      objc_copyWeak(&v41, location);
      v29 = _Block_copy(aBlock);
      v30 = _Block_copy(v29);
      objc_msgSend(v28, "performSelector:withObject:", sel_performTraitCollectionUpdateWithCompletion_, v30);

      objc_destroyWeak(&v41);
      objc_destroyWeak(location);
      v11 = v32;
      v14 = v31;
    }

  }
  if (v12)
    NSLog(CFSTR("UIImagePickerController UIViewController create error: %@"), v12);

}

void __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  if ((objc_msgSend(a2, "BOOLValue") & 1) == 0)
    NSLog(CFSTR("UIImagePickerController UIViewController traits update error: %@"), *(_QWORD *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_2;
  block[3] = &unk_1E16B59D8;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);

}

void __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleEndingPhotoPickerPresentationDelay");

}

uint64_t __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_handleEndingPhotoPickerPresentationDelay");
}

- (id)_propertiesForPhotoPickerExtension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  UIImagePickerControllerSourceType v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  id v25[2];
  id location;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[UIImagePickerController _properties](self, "_properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImagePickerController mediaTypes](self, "mediaTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("_UIImagePickerControllerMediaTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIImagePickerController _allowsMultipleSelection](self, "_allowsMultipleSelection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("_UIImagePickerControllerAllowMutipleSelection"));

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("_UIImagePickerControllerCameraViewTransform"));
  v8 = -[UIImagePickerController _imagePickerSavingOptions](self, "_imagePickerSavingOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("_UIImagePickerSavingOptions"));

  v10 = -[UIImagePickerController sourceType](self, "sourceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("_UIImagePickerControllerSourceType"));

  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("_UIImagePickerControllerTemporaryDirectoryUrl"));

  v13 = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle");
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x3010000000;
  v30 = &unk_18685B0AF;
  v31 = *MEMORY[0x1E0C9D820];
  objc_initWeak(&location, self);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __61__UIImagePickerController__propertiesForPhotoPickerExtension__block_invoke;
  v23 = &unk_1E16C04B8;
  v25[1] = v13;
  v24 = &v27;
  objc_copyWeak(v25, &location);
  v14 = (void (**)(_QWORD))_Block_copy(&v20);
  if (pthread_main_np() == 1)
    v14[2](v14);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28[4], v20, v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("_UIImagePickerControllerViewWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("_UIImagePickerControllerViewHeight"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("_UIImagePickerControllerModalPresentationStyle"));

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("_UIImagePickerControllerCameraOverlayView"));
  v18 = (void *)objc_msgSend(v5, "copy");

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __61__UIImagePickerController__propertiesForPhotoPickerExtension__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1 && *(_QWORD *)(a1 + 48) == 7)
  {
    v4 = 0x407E000000000000;
    v5 = 0x4074000000000000;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v5 = v8;
    v4 = v9;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v10 + 32) = v5;
  *(_QWORD *)(v10 + 40) = v4;
}

- (Class)photoPickerRequestOptionsClass
{
  objc_class *photoPickerRequestOptionsClass;

  photoPickerRequestOptionsClass = self->_photoPickerRequestOptionsClass;
  if (!photoPickerRequestOptionsClass)
  {
    photoPickerRequestOptionsClass = NSClassFromString(CFSTR("PUPhotoPickerRemoteViewControllerRequestOptions"));
    self->_photoPickerRequestOptionsClass = photoPickerRequestOptionsClass;
  }
  return photoPickerRequestOptionsClass;
}

- (id)_photoPickerDisplayCompletion
{
  return _Block_copy(self->_photoPickerDisplayCompletion);
}

- (void)_setPhotoPickerDisplayCompletion:(id)a3
{
  void *v4;
  id photoPickerDisplayCompletion;

  v4 = _Block_copy(a3);
  photoPickerDisplayCompletion = self->_photoPickerDisplayCompletion;
  self->_photoPickerDisplayCompletion = v4;

}

- (id)_photoPickerPreviewDisplayCompletion
{
  return _Block_copy(self->_photoPickerPreviewDisplayCompletion);
}

- (void)_setPhotoPickerPreviewDisplayCompletion:(id)a3
{
  void *v4;
  id photoPickerPreviewDisplayCompletion;

  v4 = _Block_copy(a3);
  photoPickerPreviewDisplayCompletion = self->_photoPickerPreviewDisplayCompletion;
  self->_photoPickerPreviewDisplayCompletion = v4;

}

- (void)_invalidatePhotoPickerServices
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UINavigationController viewControllers](self, "viewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "performSelector:", sel_invalidate);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_testPerformPreviewOfFirstPhoto
{
  id v2;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "performSelector:", sel_performPhotoPickerPreviewOfFirstAsset);

}

- (void)cancelPhotoPicker
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__UIImagePickerController_cancelPhotoPicker__block_invoke;
  v2[3] = &unk_1E16B3F40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __44__UIImagePickerController_cancelPhotoPicker__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_imagePickerDidCancel");

}

- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD aBlock[4];
  id v11;
  char v12;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLValue");
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke;
  aBlock[3] = &unk_1E16BFC68;
  objc_copyWeak(&v11, &location);
  v12 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
  {
    v7[2](v7);
  }
  else
  {
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke_2;
    v8[3] = &unk_1E16B1BF8;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestViewControllerFromPhotoPickerWithRequestIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIImagePickerController _propertiesForPhotoPickerExtension](self, "_propertiesForPhotoPickerExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(-[UIImagePickerController photoPickerRequestOptionsClass](self, "photoPickerRequestOptionsClass")), "initWithRequestedIdentifier:photoPickerProperties:", v4, v5);
  v7 = objc_alloc(MEMORY[0x1E0CB36C8]);
  objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithItem:typeIdentifier:", v6, v8);

  v10 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttachments:", v11);

  objc_initWeak(&location, self);
  -[UIImagePickerController photosExtension](self, "photosExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke;
  v14[3] = &unk_1E16C0508;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v12, "instantiateViewControllerWithInputItems:connectionHandler:", v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke_2;
  v12[3] = &unk_1E16C04E0;
  objc_copyWeak(&v13, v10);
  objc_msgSend(WeakRetained, "_handleInstantiatedRemoteViewController:request:error:completion:", v8, v7, v9, v12);

  objc_destroyWeak(&v13);
}

void __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePushViewController:", v3);

}

- (void)_handlePushViewController:(id)a3
{
  -[UINavigationController pushViewController:animated:](self, "pushViewController:animated:", a3, 1);
}

- (void)didDisplayPhotoPickerSourceType:(id)a3
{
  void *v4;
  void *v5;
  id *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10[2];
  id location;

  v4 = (void *)objc_msgSend(a3, "integerValue");
  -[UIImagePickerController _photoPickerDisplayCompletion](self, "_photoPickerDisplayCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke;
    block[3] = &unk_1E16C0530;
    objc_copyWeak(v10, &location);
    v10[1] = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v10;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke_2;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v7);
    v6 = &v8;
  }
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void (**v5)(id, _QWORD);

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_photoPickerDisplayCompletion");
  v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
    v5[2](v5, *(_QWORD *)(a1 + 40));
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_handleEndingPhotoPickerPresentationDelay");

}

void __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEndingPhotoPickerPresentationDelay");

}

- (void)_handleEndingPhotoPickerPresentationDelay
{
  if (self->_photoPickerDidStartDelayingPresentation && !self->_photoPickerDidEndDelayingPresentation)
  {
    -[UIViewController _endDelayingPresentation](self, "_endDelayingPresentation");
    self->_photoPickerDidEndDelayingPresentation = 1;
  }
}

- (void)didDisplayPhotoPickerPreview
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[UIImagePickerController _photoPickerPreviewDisplayCompletion](self, "_photoPickerPreviewDisplayCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__UIImagePickerController_didDisplayPhotoPickerPreview__block_invoke;
    v4[3] = &unk_1E16B3F40;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __55__UIImagePickerController_didDisplayPhotoPickerPreview__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_photoPickerPreviewDisplayCompletion");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v2 = v3;
  if (v3)
  {
    (*((void (**)(id))v3 + 2))(v3);
    v2 = v3;
  }

}

- (void)didSelectMediaWithInfoDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__UIImagePickerController_didSelectMediaWithInfoDictionary___block_invoke;
  block[3] = &unk_1E16B1500;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__UIImagePickerController_didSelectMediaWithInfoDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_imagePickerDidCompleteWithInfo:", *(_QWORD *)(a1 + 32));

}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__UIImagePickerController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke;
  block[3] = &unk_1E16B1500;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __75__UIImagePickerController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_imagePickerDidCompleteWithInfoArray:", *(_QWORD *)(a1 + 32));

}

- (void)_setupControllersForCurrentSourceTypeWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__UIImagePickerController__setupControllersForCurrentSourceTypeWithCompletion___block_invoke;
  v6[3] = &unk_1E16C0558;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIImagePickerController _createInitialControllerWithCompletion:](self, "_createInitialControllerWithCompletion:", v6);

}

void __79__UIImagePickerController__setupControllersForCurrentSourceTypeWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v6;
  id *v7;
  BOOL v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(id **)(a1 + 32);
    if (v6)
      v8 = 0;
    else
      v8 = a3 == 0;
    if (v8)
      objc_storeStrong(v7 + 189, a2);
    else
      objc_msgSend(v7, "_handleTopViewControllerReadyForDisplay:", v10);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)_handleTopViewControllerReadyForDisplay:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIImagePickerController _removeAllChildren](self, "_removeAllChildren");
  -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", objc_msgSend(v4, "_displaysFullScreen"), 0);
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UINavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v5, 0);
}

- (void)_setupControllersForCurrentMediaTypes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UINavigationController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "_setImagePickerMediaTypes:", self->_mediaTypes);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[UIViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setImagePickerMediaTypes:", self->_mediaTypes);

}

- (int64_t)_preferredModalPresentationStyle
{
  objc_super v4;

  if (-[UIImagePickerController sourceType](self, "sourceType") == UIImagePickerControllerSourceTypeCamera)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UIImagePickerController;
  return -[UIViewController _preferredModalPresentationStyle](&v4, sel__preferredModalPresentationStyle);
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v2;
  id v3;

  -[UINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (_UIRemoteViewController *)v3;
}

- (void)_autoDismiss
{
  id v2;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_imagePickerDidCancel
{
  id v3;

  -[UINavigationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "imagePickerControllerDidCancel:", self);
  else
    -[UIImagePickerController _autoDismiss](self, "_autoDismiss");

}

- (void)_imagePickerDidCompleteWithInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[UINavigationController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "imagePickerController:didFinishPickingMediaWithInfo:", self, v10);
LABEL_15:

      goto LABEL_16;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[UIImagePickerController _autoDismiss](self, "_autoDismiss");
      goto LABEL_15;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("UIImagePickerControllerMediaType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v7)
    {
      -[UIImagePickerController _imagePickerDidCancel](self, "_imagePickerDidCancel");

      goto LABEL_15;
    }
    if (-[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing"))
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("UIImagePickerControllerEditedImage"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("UIImagePickerControllerMediaType"));
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("UIImagePickerControllerEditedImage"));
      if (v8)
      {
LABEL_9:
        objc_msgSend(v4, "imagePickerController:didFinishPickingImage:editingInfo:", self, v8, v9);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("UIImagePickerControllerOriginalImage"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (v8)
        goto LABEL_9;
    }
    -[UIImagePickerController _imagePickerDidCancel](self, "_imagePickerDidCancel");
    goto LABEL_14;
  }
  -[UIImagePickerController _imagePickerDidCancel](self, "_imagePickerDidCancel");
LABEL_16:

}

- (void)_imagePickerDidCompleteWithInfoArray:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImagePickerController _imagePickerDidCompleteWithInfo:](self, "_imagePickerDidCompleteWithInfo:", v4);

  }
  if (v6)
  {
    -[UINavigationController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "performSelector:withObject:withObject:", sel_imagePickerController_didFinishPickingMultipleMediaWithInfo_, self, v6);
    else
      -[UIImagePickerController _autoDismiss](self, "_autoDismiss");

  }
  else
  {
    -[UIImagePickerController _imagePickerDidCancel](self, "_imagePickerDidCancel");
  }

}

- (NSExtension)photosExtension
{
  return self->_photosExtension;
}

- (void)setPhotosExtension:(id)a3
{
  objc_storeStrong((id *)&self->_photosExtension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosExtension, 0);
  objc_storeStrong((id *)&self->_photoPickerPreheatedViewController, 0);
  objc_storeStrong(&self->_photoPickerPreviewDisplayCompletion, 0);
  objc_storeStrong(&self->_photoPickerDisplayCompletion, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
  objc_storeStrong(&self->_image, 0);
}

@end
