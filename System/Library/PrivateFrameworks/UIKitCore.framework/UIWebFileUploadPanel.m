@implementation UIWebFileUploadPanel

- (UIWebFileUploadPanel)initWithResultListener:(id)a3 configuration:(id)a4 documentView:(id)a5
{
  UIWebFileUploadPanel *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIWebFileUploadPanel;
  v8 = -[UIViewController init](&v10, sel_init);
  if (v8)
  {
    -[UIWebFileUploadPanel setMimeTypes:](v8, "setMimeTypes:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DD9820]));
    -[UIWebFileUploadPanel setDocumentView:](v8, "setDocumentView:", a5);
    -[UIWebFileUploadPanel setResultListener:](v8, "setResultListener:", a3);
    -[UIWebFileUploadPanel setAllowMultipleFiles:](v8, "setAllowMultipleFiles:", objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DD9810]) != 0);
    -[UIWebFileUploadPanel setIsUsingCamera:](v8, "setIsUsingCamera:", 0);
    -[UIWebFileUploadPanel setMediaCaptureType:](v8, "setMediaCaptureType:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DD9818]), "integerValue"));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebFileUploadPanel setMimeTypes:](self, "setMimeTypes:", 0);
  -[UIWebFileUploadPanel setDocumentView:](self, "setDocumentView:", 0);
  -[UIWebFileUploadPanel setResultListener:](self, "setResultListener:", 0);
  -[UIDocumentMenuViewController setDelegate:](self->_documentMenuController, "setDelegate:", 0);

  -[UINavigationController setDelegate:](self->_imagePicker, "setDelegate:", 0);
  self->_presentationViewController = 0;
  -[UIPopoverController setDelegate:](self->_presentationPopover, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)UIWebFileUploadPanel;
  -[UIViewController dealloc](&v3, sel_dealloc);
}

- (void)_dispatchDidDismiss
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebFileUploadPanelDelegate fileUploadPanelDidDismiss:](self->_delegate, "fileUploadPanelDidDismiss:", self);
}

- (void)_cancel
{
  WebThreadLock();
  -[WebOpenPanelResultListener cancel](self->_resultListener, "cancel");
  -[UIWebFileUploadPanel _dispatchDidDismiss](self, "_dispatchDidDismiss");
}

- (void)_chooseFilename:(id)a3 displayString:(id)a4 iconImage:(id)a5
{
  WebThreadLock();
  -[WebOpenPanelResultListener chooseFilename:displayString:iconImage:](self->_resultListener, "chooseFilename:displayString:iconImage:", a3, a4, objc_msgSend(a5, "CGImage"));
  -[UIWebFileUploadPanel _dispatchDidDismiss](self, "_dispatchDidDismiss");
}

- (void)_chooseFilenames:(id)a3 displayString:(id)a4 iconImage:(id)a5
{
  WebThreadLock();
  -[WebOpenPanelResultListener chooseFilenames:displayString:iconImage:](self->_resultListener, "chooseFilenames:displayString:iconImage:", a3, a4, objc_msgSend(a5, "CGImage"));
  -[UIWebFileUploadPanel _dispatchDidDismiss](self, "_dispatchDidDismiss");
}

- (void)_adjustMediaCaptureType
{
  _BOOL4 v3;
  int64_t v4;

  if (!+[UIImagePickerController isCameraDeviceAvailable:](UIImagePickerController, "isCameraDeviceAvailable:", 1))
  {
    v3 = +[UIImagePickerController isCameraDeviceAvailable:](UIImagePickerController, "isCameraDeviceAvailable:", 0);
    v4 = 0;
    if (!v3)
      goto LABEL_7;
  }
  if (!+[UIImagePickerController isCameraDeviceAvailable:](UIImagePickerController, "isCameraDeviceAvailable:", 1))self->_mediaCaptureType = 2;
  if (!+[UIImagePickerController isCameraDeviceAvailable:](UIImagePickerController, "isCameraDeviceAvailable:", 0))
  {
    v4 = 1;
LABEL_7:
    self->_mediaCaptureType = v4;
  }
}

- (BOOL)_shouldMediaCaptureOpenMediaDevice
{
  return self->_mediaCaptureType
      && +[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1);
}

- (BOOL)_string:(id)a3 hasPrefixCaseInsensitive:(id)a4
{
  return objc_msgSend(a3, "rangeOfString:options:", a4, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_UTIsForMIMETypes
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = -[UIWebFileUploadPanel mimeTypes](self, "mimeTypes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = (void *)*MEMORY[0x1E0CEC568];
    v9 = (void *)*MEMORY[0x1E0CEC520];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = -[UIWebFileUploadPanel _string:hasPrefixCaseInsensitive:](self, "_string:hasPrefixCaseInsensitive:", v11, CFSTR("image/"));
        v13 = v9;
        if (!v12)
        {
          v14 = -[UIWebFileUploadPanel _string:hasPrefixCaseInsensitive:](self, "_string:hasPrefixCaseInsensitive:", v11, CFSTR("video/"));
          v13 = v8;
          if (!v14)
            continue;
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(v13, "identifier"));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  return (id)objc_msgSend(v3, "allObjects");
}

- (id)_mediaTypesForPickerSourceType:(int64_t)a3
{
  id v4;

  v4 = -[UIWebFileUploadPanel _UTIsForMIMETypes](self, "_UTIsForMIMETypes");
  if (objc_msgSend(v4, "count"))
    return v4;
  else
    return +[UIImagePickerController availableMediaTypesForSourceType:](UIImagePickerController, "availableMediaTypesForSourceType:", a3);
}

- (id)_documentPickerMenuMediaTypes
{
  id v2;

  v2 = -[UIWebFileUploadPanel _UTIsForMIMETypes](self, "_UTIsForMIMETypes");
  if (objc_msgSend(v2, "count"))
    return v2;
  else
    return &unk_1E1A93488;
}

- (id)_photoPickerWithSourceType:(int64_t)a3
{
  UIImagePickerController *v5;
  int64_t mediaCaptureType;

  v5 = objc_alloc_init(UIImagePickerController);
  -[UIImagePickerController setSourceType:](v5, "setSourceType:", a3);
  -[UIImagePickerController setAllowsEditing:](v5, "setAllowsEditing:", 0);
  -[UINavigationController setDelegate:](v5, "setDelegate:", self);
  -[UIViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 0);
  -[UIImagePickerController _setAllowsMultipleSelection:](v5, "_setAllowsMultipleSelection:", self->_allowMultipleFiles);
  -[UIImagePickerController setMediaTypes:](v5, "setMediaTypes:", -[UIWebFileUploadPanel _mediaTypesForPickerSourceType:](self, "_mediaTypesForPickerSourceType:", a3));
  mediaCaptureType = self->_mediaCaptureType;
  if (mediaCaptureType)
    -[UIImagePickerController setCameraDevice:](v5, "setCameraDevice:", mediaCaptureType == 1);
  return v5;
}

- (void)_showPhotoPickerWithSourceType:(int64_t)a3
{
  _BOOL4 IsSmallScreen;
  UIImagePickerController *imagePicker;

  self->_imagePicker = (UIImagePickerController *)-[UIWebFileUploadPanel _photoPickerWithSourceType:](self, "_photoPickerWithSourceType:");
  IsSmallScreen = UIWebCurrentUserInterfaceIdiomIsSmallScreen();
  imagePicker = self->_imagePicker;
  if (a3 == 1 || IsSmallScreen)
    -[UIWebFileUploadPanel _presentFullscreenViewController:animated:](self, "_presentFullscreenViewController:animated:", imagePicker, 1);
  else
    -[UIWebFileUploadPanel _presentPopoverWithContentViewController:animated:](self, "_presentPopoverWithContentViewController:animated:", imagePicker, 1);
}

- (id)_cameraButtonLabel
{
  id v3;
  int v4;
  int v5;
  BOOL v6;
  __CFString *v8;

  if (!+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1))return 0;
  v3 = -[UIWebFileUploadPanel _mediaTypesForPickerSourceType:](self, "_mediaTypesForPickerSourceType:", 1);
  v4 = objc_msgSend(v3, "containsObject:", objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier"));
  v5 = objc_msgSend(v3, "containsObject:", objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier"));
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (v5)
      v8 = CFSTR("Take Video");
    else
      v8 = CFSTR("Take Photo");
  }
  else
  {
    v8 = CFSTR("Take Photo or Video");
  }
  return _UINSLocalizedStringWithDefaultValue(v8, v8);
}

- (void)_showDocumentPickerMenu
{
  UIDocumentMenuViewController *v3;
  id v4;
  UIDocumentMenuViewController *documentMenuController;
  UIImage *v6;
  uint64_t v7;
  id v8;
  UIDocumentMenuViewController *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = -[UIDocumentMenuViewController _initIgnoringApplicationEntitlementForImportOfTypes:]([UIDocumentMenuViewController alloc], "_initIgnoringApplicationEntitlementForImportOfTypes:", -[UIWebFileUploadPanel _documentPickerMenuMediaTypes](self, "_documentPickerMenuMediaTypes"));
  self->_documentMenuController = v3;
  -[UIDocumentMenuViewController setDelegate:](v3, "setDelegate:", self);
  v4 = _UINSLocalizedStringWithDefaultValue(CFSTR("Photo Library"), CFSTR("Photo Library"));
  documentMenuController = self->_documentMenuController;
  v6 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("rectangle.on.rectangle"));
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke;
  v11[3] = &unk_1E16B41B8;
  v11[4] = self;
  -[UIDocumentMenuViewController addOptionWithTitle:image:order:handler:](documentMenuController, "addOptionWithTitle:image:order:handler:", v4, v6, 0, v11);
  if (+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1))
  {
    v8 = -[UIWebFileUploadPanel _cameraButtonLabel](self, "_cameraButtonLabel");
    if (v8)
    {
      v9 = self->_documentMenuController;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke_2;
      v10[3] = &unk_1E16B41B8;
      v10[4] = self;
      -[UIDocumentMenuViewController addOptionWithTitle:image:order:handler:](v9, "addOptionWithTitle:image:order:handler:", v8, +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("camera.fill")), 0, v10);
    }
  }
  -[UIWebFileUploadPanel _presentForCurrentInterfaceIdiom:](self, "_presentForCurrentInterfaceIdiom:", self->_documentMenuController);
}

uint64_t __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPhotoPickerWithSourceType:", 0);
}

uint64_t __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1025) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_showPhotoPickerWithSourceType:", 1);
}

- (void)_presentForCurrentInterfaceIdiom:(id)a3
{
  if (UIWebCurrentUserInterfaceIdiomIsSmallScreen())
    -[UIWebFileUploadPanel _presentFullscreenViewController:animated:](self, "_presentFullscreenViewController:animated:", a3, 1);
  else
    -[UIWebFileUploadPanel _presentPopoverWithContentViewController:animated:](self, "_presentPopoverWithContentViewController:animated:", a3, 1);
}

- (void)_presentPopoverWithContentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIPopoverController *v7;
  UIPopoverController *presentationPopover;
  CGRect v9;
  CGRect v10;

  v4 = a4;
  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", a4);
  v7 = -[UIPopoverController initWithContentViewController:]([UIPopoverController alloc], "initWithContentViewController:", a3);
  self->_presentationPopover = v7;
  -[UIPopoverController setDelegate:](v7, "setDelegate:", self);
  presentationPopover = self->_presentationPopover;
  v9.origin.x = self->_interactionPoint.x;
  v9.origin.y = self->_interactionPoint.y;
  v9.size.width = 1.0;
  v9.size.height = 1.0;
  v10 = CGRectIntegral(v9);
  -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](presentationPopover, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", -[UIWebFileUploadPanel documentView](self, "documentView"), 15, v4, v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void)_presentFullscreenViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIViewController *v7;

  v4 = a4;
  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", a4);
  v7 = +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", -[UIWebFileUploadPanel documentView](self, "documentView"));
  self->_presentationViewController = v7;
  -[UIViewController presentViewController:animated:completion:](v7, "presentViewController:animated:completion:", a3, v4, 0);
}

- (void)present
{
  CGFloat v3;
  CGFloat v4;

  self->_interactionElement = (DOMNode *)-[UIWebDocumentView interactionElement](-[UIWebFileUploadPanel documentView](self, "documentView"), "interactionElement");
  -[UIWebDocumentView interactionLocation](-[UIWebFileUploadPanel documentView](self, "documentView"), "interactionLocation");
  self->_interactionPoint.x = v3;
  self->_interactionPoint.y = v4;
  if (-[UIWebFileUploadPanel _shouldMediaCaptureOpenMediaDevice](self, "_shouldMediaCaptureOpenMediaDevice"))
  {
    -[UIWebFileUploadPanel _adjustMediaCaptureType](self, "_adjustMediaCaptureType");
    self->_isUsingCamera = 1;
    -[UIWebFileUploadPanel _showPhotoPickerWithSourceType:](self, "_showPhotoPickerWithSourceType:", 1);
  }
  else
  {
    -[UIWebFileUploadPanel _showDocumentPickerMenu](self, "_showDocumentPickerMenu");
  }
}

- (void)dismiss
{
  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 0);
  -[UIWebFileUploadPanel _cancel](self, "_cancel");
}

- (void)documentMenu:(id)a3 didPickDocumentPicker:(id)a4
{
  objc_msgSend(a4, "setDelegate:", self);
  objc_msgSend(a4, "setModalPresentationStyle:", 0);
  -[UIWebFileUploadPanel _presentForCurrentInterfaceIdiom:](self, "_presentForCurrentInterfaceIdiom:", a4);
}

- (void)documentMenuWasCancelled:(id)a3
{
  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  -[UIWebFileUploadPanel _cancel](self, "_cancel");
}

- (void)documentPicker:(id)a3 didPickDocumentAtURL:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  v6 = objc_msgSend(a4, "path");
  v7 = objc_msgSend(a4, "lastPathComponent");
  v8 = (void *)objc_msgSend(a4, "pathExtension");
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v8);
    if (objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC520]))
    {
      v10 = iconForImageFile((const __CFURL *)a4);
    }
    else if (objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC568]))
    {
      v10 = iconForVideoFile(a4);
    }
    else
    {
      v10 = fallbackIconForFile((uint64_t)a4);
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  -[UIWebFileUploadPanel _chooseFilename:displayString:iconImage:](self, "_chooseFilename:displayString:iconImage:", v6, v7, v11);
}

- (void)documentPickerWasCancelled:(id)a3
{
  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  -[UIWebFileUploadPanel _cancel](self, "_cancel");
}

- (void)_dismissDisplayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIPopoverController *presentationPopover;
  UIViewController *presentationViewController;
  _QWORD v7[5];

  v3 = a3;
  presentationPopover = self->_presentationPopover;
  if (presentationPopover)
  {
    -[UIPopoverController dismissPopoverAnimated:](presentationPopover, "dismissPopoverAnimated:", a3);
    -[UIPopoverController setDelegate:](self->_presentationPopover, "setDelegate:", 0);

    self->_presentationPopover = 0;
  }
  presentationViewController = self->_presentationViewController;
  if (presentationViewController)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__UIWebFileUploadPanel__dismissDisplayAnimated___block_invoke;
    v7[3] = &unk_1E16B41B8;
    v7[4] = self;
    -[UIViewController dismissViewControllerAnimated:completion:](presentationViewController, "dismissViewControllerAnimated:completion:", v3, v7);
  }
}

uint64_t __48__UIWebFileUploadPanel__dismissDisplayAnimated___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 984) = 0;
  return result;
}

- (id)_displayStringForPhotos:(unint64_t)a3 videos:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;

  if (!(a4 | a3))
    return 0;
  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v6, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  v7 = 1;
  objc_msgSend(v6, "setGeneratesDecimalNumbers:", 1);
  objc_msgSend(v6, "setNumberStyle:", 1);
  if (v5)
  {
    if (v5 == 1)
    {
      v8 = _UINSLocalizedStringWithDefaultValue(CFSTR("1 Photo"), CFSTR("1 Photo"));
    }
    else
    {
      v10 = objc_msgSend(v6, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5));
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", _UINSLocalizedStringWithDefaultValue(CFSTR("%@ Photos"), CFSTR("%@ Photos")), v10);
    }
    v5 = (unint64_t)v8;
    v7 = 2;
  }
  if (v4 == 1)
  {
    v11 = _UINSLocalizedStringWithDefaultValue(CFSTR("1 Video"), CFSTR("1 Video"));
LABEL_13:
    v4 = (unint64_t)v11;
    goto LABEL_14;
  }
  if (v4)
  {
    v12 = objc_msgSend(v6, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4));
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", _UINSLocalizedStringWithDefaultValue(CFSTR("%@ Videos"), CFSTR("%@ Videos")), v12);
    goto LABEL_13;
  }
  --v7;
LABEL_14:
  if (v7 == 1)
  {
    if (v5)
      v13 = (void *)v5;
    else
      v13 = (void *)v4;
  }
  else if (v7 == 2)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", _UINSLocalizedStringWithDefaultValue(CFSTR("%@ and %@"), CFSTR("%@ and %@")), v5, v4);
  }
  else
  {
    v13 = 0;
  }
  return (id)objc_msgSend(v13, "lowercaseString");
}

- (void)_processMediaInfoDictionaries:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  -[UIWebFileUploadPanel _processMediaInfoDictionaries:atIndex:processedResults:processedImageCount:processedVideoCount:successBlock:failureBlock:](self, "_processMediaInfoDictionaries:atIndex:processedResults:processedImageCount:processedVideoCount:successBlock:failureBlock:", a3, 0, objc_msgSend(MEMORY[0x1E0C99DE8], "array"), 0, 0, a4, a5);
}

- (void)_processMediaInfoDictionaries:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 processedImageCount:(unint64_t)a6 processedVideoCount:(unint64_t)a7 successBlock:(id)a8 failureBlock:(id)a9
{
  uint64_t v16;
  _QWORD v17[12];

  if (objc_msgSend(a3, "count") == a4)
  {
    (*((void (**)(id, id, id))a8 + 2))(a8, a5, -[UIWebFileUploadPanel _displayStringForPhotos:videos:](self, "_displayStringForPhotos:videos:", a6, a7));
  }
  else
  {
    v16 = objc_msgSend(a3, "objectAtIndex:", a4);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __145__UIWebFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_processedImageCount_processedVideoCount_successBlock_failureBlock___block_invoke;
    v17[3] = &unk_1E16C7050;
    v17[4] = a5;
    v17[5] = self;
    v17[10] = a6;
    v17[11] = a4 + 1;
    v17[6] = a3;
    v17[7] = a8;
    v17[8] = a9;
    v17[9] = a7;
    -[UIWebFileUploadPanel _uploadItemFromMediaInfo:successBlock:failureBlock:](self, "_uploadItemFromMediaInfo:successBlock:failureBlock:", v16, v17, a9);
  }
}

uint64_t __145__UIWebFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_processedImageCount_processedVideoCount_successBlock_failureBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = v4 + objc_msgSend(a2, "isVideo");
  v6 = *(_QWORD *)(a1 + 80);
  v7 = v6 + (objc_msgSend(a2, "isVideo") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_processMediaInfoDictionaries:atIndex:processedResults:processedImageCount:processedVideoCount:successBlock:failureBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), v7, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_uploadItemForImageData:(id)a3 imageName:(id)a4 successBlock:(id)a5 failureBlock:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "_webkit_createTemporaryDirectoryWithTemplatePrefix:", CFSTR("UIWebFileUpload")), "stringByAppendingPathComponent:", a4);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    objc_msgSend(a3, "writeToFile:options:error:", v9, 1, &v11);
    if (v11)
    {
      NSLog(CFSTR("WebFileUpload: Error writing image data to temporary file: %@"), v11);
      (*((void (**)(id))a6 + 2))(a6);
    }
    else
    {
      (*((void (**)(id, _UIWebImageUploadItem *))a5 + 2))(a5, -[_UIWebFileUploadItem initWithFilePath:]([_UIWebImageUploadItem alloc], "initWithFilePath:", v10));
    }
  }
  else
  {
    NSLog(CFSTR("WebFileUpload: Failed to create temporary directory to save image"));
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)_uploadItemForJPEGRepresentationOfImage:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  NSObject *global_queue;
  _QWORD v10[8];

  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__UIWebFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke;
  v10[3] = &unk_1E16C7078;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a5;
  v10[7] = a4;
  dispatch_async(global_queue, v10);
}

uint64_t __90__UIWebFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke(uint64_t a1)
{
  id v2;

  v2 = _UIImageJPEGRepresentation(*(void **)(a1 + 32), 0, 0.8);
  if (v2)
    return objc_msgSend(*(id *)(a1 + 40), "_uploadItemForImageData:imageName:successBlock:failureBlock:", v2, CFSTR("image.jpg"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  NSLog(CFSTR("WebFileUpload: Failed to create JPEG representation for image"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_uploadItemFromMediaInfo:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  _UIWebVideoUploadItem *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("UIImagePickerControllerMediaType"));
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v9, 1);
  if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC568]))
  {
    v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("UIImagePickerControllerMediaURL"));
    if ((objc_msgSend(v11, "isFileURL") & 1) != 0)
    {
      v12 = [_UIWebVideoUploadItem alloc];
      v13 = v11;
LABEL_8:
      (*((void (**)(id, _UIWebVideoUploadItem *))a4 + 2))(a4, -[_UIWebFileUploadItem initWithFilePath:](v12, "initWithFilePath:", objc_msgSend(v13, "path")));
      return;
    }
    NSLog(CFSTR("WebFileUpload: Expected media URL to be a file path, it was not"));
  }
  else if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
  {
    v14 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UIImagePickerControllerImageURL"));
    if (v14)
    {
      v15 = v14;
      if ((objc_msgSend(v14, "isFileURL") & 1) != 0)
      {
        v12 = [_UIWebImageUploadItem alloc];
        v13 = v15;
        goto LABEL_8;
      }
      NSLog(CFSTR("WKFileUploadPanel: Expected image URL to be a file path, it was not"));
    }
    else
    {
      v16 = objc_msgSend(a3, "objectForKey:", CFSTR("UIImagePickerControllerOriginalImage"));
      if (v16)
      {
        -[UIWebFileUploadPanel _uploadItemForJPEGRepresentationOfImage:successBlock:failureBlock:](self, "_uploadItemForJPEGRepresentationOfImage:successBlock:failureBlock:", v16, a4, a5);
        return;
      }
      NSLog(CFSTR("WebFileUpload: Expected image data but there was none"));
    }
  }
  else
  {
    NSLog(CFSTR("WebFileUpload: Unexpected media type. Expected image or video, got: %@"), v10);
  }
  (*((void (**)(id))a5 + 2))(a5);
}

- (BOOL)_willMultipleSelectionDelegateBeCalled
{
  return self->_allowMultipleFiles && !self->_isUsingCamera;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (!-[UIWebFileUploadPanel _willMultipleSelectionDelegateBeCalled](self, "_willMultipleSelectionDelegateBeCalled", a3))
  {
    -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4);
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
    v8[3] = &unk_1E16C70C8;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_3;
    v7[3] = &unk_1E16B41B8;
    -[UIWebFileUploadPanel _processMediaInfoDictionaries:successBlock:failureBlock:](self, "_processMediaInfoDictionaries:successBlock:failureBlock:", v6, v8, v7);
  }
}

void __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v7[8];

  v5 = (void *)objc_msgSend(a2, "objectAtIndex:", 0);
  v6 = objc_msgSend(v5, "displayImage");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2;
  v7[3] = &unk_1E16C70A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = v5;
  v7[6] = a3;
  v7[7] = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
}

uint64_t __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_chooseFilename:displayString:iconImage:", objc_msgSend(*(id *)(a1 + 40), "filePath"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_4;
  block[3] = &unk_1E16B41B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4
{
  _QWORD v6[5];
  _QWORD v7[5];

  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke;
  v7[3] = &unk_1E16C70C8;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_3;
  v6[3] = &unk_1E16B41B8;
  -[UIWebFileUploadPanel _processMediaInfoDictionaries:successBlock:failureBlock:](self, "_processMediaInfoDictionaries:successBlock:failureBlock:", a4, v7, v6);
}

void __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v13[8];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "filePath"))
          objc_msgSend(v6, "addObject:", objc_msgSend(v12, "filePath"));
        if (!v9)
          v9 = objc_msgSend(v12, "displayImage");
      }
      v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2;
  v13[3] = &unk_1E16C70A0;
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = v6;
  v13[6] = a3;
  v13[7] = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);
}

uint64_t __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_chooseFilenames:displayString:iconImage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_4;
  block[3] = &unk_1E16B41B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  -[UIWebFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  -[UIWebFileUploadPanel _cancel](self, "_cancel");
}

- (NSArray)mimeTypes
{
  return self->_mimeTypes;
}

- (void)setMimeTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UIWebDocumentView)documentView
{
  return self->_documentView;
}

- (void)setDocumentView:(id)a3
{
  self->_documentView = (UIWebDocumentView *)a3;
}

- (WebOpenPanelResultListener)resultListener
{
  return self->_resultListener;
}

- (void)setResultListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (BOOL)allowMultipleFiles
{
  return self->_allowMultipleFiles;
}

- (void)setAllowMultipleFiles:(BOOL)a3
{
  self->_allowMultipleFiles = a3;
}

- (BOOL)isUsingCamera
{
  return self->_isUsingCamera;
}

- (void)setIsUsingCamera:(BOOL)a3
{
  self->_isUsingCamera = a3;
}

- (UIWebFileUploadPanelDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIWebFileUploadPanelDelegate *)a3;
}

- (int64_t)mediaCaptureType
{
  return self->_mediaCaptureType;
}

- (void)setMediaCaptureType:(int64_t)a3
{
  self->_mediaCaptureType = a3;
}

@end
