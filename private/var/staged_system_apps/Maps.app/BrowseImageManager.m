@implementation BrowseImageManager

- (BrowseImageManager)init
{
  BrowseImageManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *imageOperationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BrowseImageManager;
  v2 = -[BrowseImageManager init](&v6, "init");
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    imageOperationQueue = v2->_imageOperationQueue;
    v2->_imageOperationQueue = v3;

    -[NSOperationQueue setName:](v2->_imageOperationQueue, "setName:", CFSTR("com.apple.Maps.BrowseImageManager.CreateImage"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_imageOperationQueue, "setMaxConcurrentOperationCount:", 2);
    -[NSOperationQueue setQualityOfService:](v2->_imageOperationQueue, "setQualityOfService:", 25);
  }
  return v2;
}

+ (id)sharedImageCache
{
  if (qword_1014D3340 != -1)
    dispatch_once(&qword_1014D3340, &stru_1011C6DD0);
  return (id)qword_1014D3338;
}

- (void)maskedImage:(id)a3 inRect:(CGRect)a4 withColor:(CGColor *)a5 inContext:(CGContext *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  id v14;
  CGImage *v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (a5 && a3)
  {
    if (a6)
    {
      height = a4.size.height;
      width = a4.size.width;
      y = a4.origin.y;
      x = a4.origin.x;
      v12 = a3;
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
      CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v13, "CGColor"));

      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      CGContextFillRect(a6, v16);
      v14 = objc_retainAutorelease(v12);
      v15 = (CGImage *)objc_msgSend(v14, "CGImage");

      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      CGContextClipToMask(a6, v17, v15);
      CGContextSetFillColorWithColor(a6, a5);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      CGContextFillRect(a6, v18);
    }
  }
}

- (void)imageForCategory:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BrowseImageManager browseManager](self, "browseManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traits"));
  -[BrowseImageManager imageForCategory:traits:resultHandler:](self, "imageForCategory:traits:resultHandler:", v7, v8, v6);

}

- (void)imageForCategory:(id)a3 traits:(id)a4 resultHandler:(id)a5
{
  -[BrowseImageManager imageForCategory:scale:traits:resultHandler:](self, "imageForCategory:scale:traits:resultHandler:", a3, a4, a5, 0.0);
}

- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 resultHandler:(id)a6
{
  -[BrowseImageManager imageForCategory:scale:traits:isCarplay:resultHandler:](self, "imageForCategory:scale:traits:isCarplay:resultHandler:", a3, a5, 0, a6, a4);
}

- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 resultHandler:(id)a7
{
  -[BrowseImageManager imageForCategory:scale:traits:isCarplay:isTouchBar:resultHandler:](self, "imageForCategory:scale:traits:isCarplay:isTouchBar:resultHandler:", a3, a5, a6, 0, a7, a4);
}

- (void)imageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 isTouchBar:(BOOL)a7 resultHandler:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  id v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *);
  id v26[2];
  BOOL v27;
  unsigned __int8 v28;
  id location;
  id v30;

  v9 = a6;
  v13 = a3;
  v14 = a5;
  v15 = (void (**)(id, void *))a8;
  v30 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseImageManager _cachedImageForCategory:scale:traits:isCarplay:outputCategoryKey:](self, "_cachedImageForCategory:scale:traits:isCarplay:outputCategoryKey:", v13, v14, v9, &v30, a4));
  v17 = v30;
  if (v16)
  {
    if (v15)
      v15[2](v15, v16);
  }
  else
  {
    v18 = -[BrowseImageManager _isNightMode](self, "_isNightMode");
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1007B26F4;
    v21[3] = &unk_1011C6DF8;
    objc_copyWeak(v26, &location);
    v22 = v13;
    v26[1] = *(id *)&a4;
    v23 = v14;
    v27 = v9;
    v28 = v18;
    v24 = v17;
    v25 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v21));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseImageManager imageOperationQueue](self, "imageOperationQueue"));
    objc_msgSend(v20, "addOperation:", v19);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }

}

- (id)synchronousImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseImageManager _cachedImageForCategory:scale:traits:isCarplay:outputCategoryKey:](self, "_cachedImageForCategory:scale:traits:isCarplay:outputCategoryKey:", v10, v11, v6, &v19, a4));
  v13 = v19;
  if (!v12)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseImageManager _createImageForCategory:scale:traits:isCarplay:nightMode:](self, "_createImageForCategory:scale:traits:isCarplay:nightMode:", v10, v11, v6, -[BrowseImageManager _isNightMode](self, "_isNightMode"), a4));
    if (v12)
    {
      v14 = objc_msgSend((id)objc_opt_class(self), "sharedImageCache");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      -[NSObject setObject:forKey:](v15, "setObject:forKey:", v12, v13);
    }
    else
    {
      v16 = sub_1007B158C();
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        *(_DWORD *)buf = 138412546;
        v21 = v17;
        v22 = 2112;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Failed to create image for category %@, key: %@", buf, 0x16u);

      }
    }

  }
  return v12;
}

- (id)_cachedImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 outputCategoryKey:(id *)a7
{
  _BOOL8 v8;
  id v12;
  _BOOL8 v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  CategoryKey *v18;
  void *v19;
  const __CFString *v20;
  CategoryKey *v21;
  id v22;
  void *v23;
  void *v24;

  v8 = a6;
  v12 = a3;
  v13 = objc_msgSend(a5, "mode") == 4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseImageManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  v15 = objc_msgSend(v14, "isNightMode");

  -[BrowseImageManager _screenScaleForScale:isCarplay:](self, "_screenScaleForScale:isCarplay:", v8, a4);
  v17 = v16;
  v18 = objc_alloc_init(CategoryKey);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "category"));

  -[CategoryKey setCategory:](v18, "setCategory:", v19);
  -[CategoryKey setTransitMode:](v18, "setTransitMode:", v13);
  -[CategoryKey setScale:](v18, "setScale:", v17);
  -[BrowseImageManager desiredImageSize](self, "desiredImageSize");
  -[CategoryKey setSize:](v18, "setSize:");
  -[CategoryKey setIsCarPlay:](v18, "setIsCarPlay:", v8);
  -[CategoryKey setIsNightMode:](v18, "setIsNightMode:", v15);
  if (-[BrowseImageManager isTransparencyEnabled](self, "isTransparencyEnabled"))
    v20 = CFSTR("transparent");
  else
    v20 = 0;
  -[CategoryKey setPrefix:](v18, "setPrefix:", v20);
  v21 = objc_retainAutorelease(v18);
  *a7 = v21;
  v22 = objc_msgSend((id)objc_opt_class(self), "sharedImageCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v21));

  return v24;
}

- (BOOL)_isNightMode
{
  void *v3;
  unsigned __int8 v4;
  uint8_t v6[16];

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseImageManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    v4 = objc_msgSend(v3, "isNightMode");

    return v4;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: NSThread.isMainThread", v6, 2u);
    }
    return 0;
  }
}

- (id)_createImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 nightMode:(BOOL)a7
{
  _BOOL8 v8;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  unsigned __int8 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  BOOL v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD v39[4];
  id v40;
  id v41;
  unsigned __int8 v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  _QWORD v46[6];

  v8 = a6;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "category"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "styleAttributes"));

  LODWORD(v13) = objc_msgSend(v12, "mode");
  v15 = (_DWORD)v13 == 4;
  v16 = -[BrowseImageManager isTransparencyEnabled](self, "isTransparencyEnabled");
  -[BrowseImageManager desiredImageSize](self, "desiredImageSize");
  v18 = v17;
  v20 = v19;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1007B2E58;
  v46[3] = &unk_1011C6E18;
  *(double *)&v46[4] = v17;
  *(double *)&v46[5] = v19;
  v21 = objc_retainBlock(v46);
  v22 = v20 == CGSizeZero.height && v18 == CGSizeZero.width;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1007B2E7C;
  v39[3] = &unk_1011C6E40;
  v23 = v14;
  v40 = v23;
  v42 = v16;
  v43 = v15;
  v44 = a7;
  v45 = !v22;
  v24 = v21;
  v41 = v24;
  v25 = objc_retainBlock(v39);
  -[BrowseImageManager _screenScaleForScale:isCarplay:](self, "_screenScaleForScale:isCarplay:", v8, a4);
  v27 = v26;
  v28 = ((uint64_t (*)(_QWORD *, uint64_t, _BOOL8))v25[2])(v25, 4, v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  if (!v29 && v8)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v30, "scale");
    v32 = v31;

    if (v27 <= v32)
      v33 = 4;
    else
      v33 = 5;
    v34 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t, double))v25[2])(v25, v33, 1, v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (v29)
      goto LABEL_13;
    v35 = ((uint64_t (*)(_QWORD *, uint64_t, _QWORD, double))v25[2])(v25, 5, 0, v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v35);
  }
  if (!v29)
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("browse-placeholder")));
LABEL_13:
  if (v29)
    v36 = v22;
  else
    v36 = 1;
  if ((v36 & 1) == 0)
  {
    -[BrowseImageManager desiredImageSize](self, "desiredImageSize");
    v37 = objc_claimAutoreleasedReturnValue(-[BrowseImageManager _scaleImage:ifNeededToFitSize:](self, "_scaleImage:ifNeededToFitSize:", v29));

    v29 = (void *)v37;
  }

  return v29;
}

- (double)_screenScaleForScale:(double)a3 isCarplay:(BOOL)a4
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  if (a3 == 0.0)
  {
    if (a4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screenTraitCollection"));
      objc_msgSend(v6, "displayScale");
      v4 = v7;

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
      objc_msgSend(v5, "screenScale");
      v4 = v8;
    }

  }
  return v4;
}

- (id)transparentImageForCategory:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  CategoryKey *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v5, "screenScale");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleAttributes"));
  v9 = objc_alloc_init(CategoryKey);
  -[CategoryKey setCategory:](v9, "setCategory:", v4);

  -[CategoryKey setTransitMode:](v9, "setTransitMode:", 0);
  -[CategoryKey setPrefix:](v9, "setPrefix:", CFSTR("transparent"));
  -[CategoryKey setRenderAsTemplate:](v9, "setRenderAsTemplate:", 1);
  v10 = objc_msgSend((id)objc_opt_class(self), "sharedImageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:", v8, 4, 1, 1, 0, v7));
    if (v13
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")))) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));

      v14 = objc_msgSend((id)objc_opt_class(self), "sharedImageCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v15, "setObject:forKey:", v12, v9);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)_scaleImage:(id)a3 ifNeededToFitSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v14;
  double v15;
  id v16;
  double y;
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  CGSize v21;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "size");
  v9 = width == v7 && height == v8;
  if (v9 || ((v10 = v7, v11 = v8, width == CGSizeZero.width) ? (v12 = height == CGSizeZero.height) : (v12 = 0), v12))
  {
    v16 = v6;
  }
  else
  {
    while (v10 > width || v11 > height)
    {
      v14 = v10 <= v11;
      v15 = height * (v10 / v11);
      if (v10 > v11)
        v11 = width * (v11 / v10);
      else
        v11 = height;
      if (v14)
        v10 = v15;
      else
        v10 = width;
    }
    y = CGPointZero.y;
    v21.width = v10;
    v21.height = v11;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
    objc_msgSend(v6, "drawInRect:", CGPointZero.x, y, v10, v11);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v16 = (id)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }

  return v16;
}

- (BOOL)isTransparencyEnabled
{
  return self->_transparencyEnabled;
}

- (void)setTransparencyEnabled:(BOOL)a3
{
  self->_transparencyEnabled = a3;
}

- (CGSize)desiredImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredImageSize.width;
  height = self->_desiredImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredImageSize:(CGSize)a3
{
  self->_desiredImageSize = a3;
}

- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate
{
  return (MapsUIImageCacheUserInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
}

- (void)setUserInterfaceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_userInterfaceDelegate, a3);
}

- (BrowseManager)browseManager
{
  return (BrowseManager *)objc_loadWeakRetained((id *)&self->_browseManager);
}

- (void)setBrowseManager:(id)a3
{
  objc_storeWeak((id *)&self->_browseManager, a3);
}

- (NSOperationQueue)imageOperationQueue
{
  return self->_imageOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOperationQueue, 0);
  objc_destroyWeak((id *)&self->_browseManager);
  objc_destroyWeak((id *)&self->_userInterfaceDelegate);
}

@end
