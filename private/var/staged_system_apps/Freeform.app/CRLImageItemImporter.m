@implementation CRLImageItemImporter

+ (id)protected_supportedFileTypes
{
  return +[CRLIngestionTypes supportedImageTypes](CRLIngestionTypes, "supportedImageTypes");
}

+ (id)protected_supportedFileUTTypes
{
  return +[CRLIngestionTypes supportedImageUTTypes](CRLIngestionTypes, "supportedImageUTTypes");
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  const __CFURL *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  CGImageSourceRef v11;
  CGImageSourceRef v12;
  objc_super v14;

  v6 = (const __CFURL *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
  v9 = objc_msgSend(v7, "crl_conformsToUTI:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(a1, "isSupportedAnimatedImageFileType:", v7))
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___CRLImageItemImporter;
    v10 = objc_msgSendSuper2(&v14, "protected_canImportFileAtURL:type:", v6, v7);
    goto LABEL_10;
  }
  v11 = CGImageSourceCreateWithURL(v6, 0);
  if (!v11)
  {
LABEL_2:
    v10 = 0;
  }
  else
  {
    v12 = v11;
    if ((objc_msgSend(a1, "p_canImportImageSource:", v11) & 1) != 0)
      v10 = 1;
    else
      v10 = +[PFImageMetadata imageSourceIsSpatial:](PFImageMetadata, "imageSourceIsSpatial:", v12);
    CFRelease(v12);
  }
LABEL_10:

  return v10;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  id v11;
  const void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v9 = objc_msgSend(v8, "isEqual:", UTTypePDF);

  if ((v9 & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(a1, "isSupportedAnimatedImageFileType:", v7))
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___CRLImageItemImporter;
    v10 = objc_msgSendSuper2(&v14, "protected_canImportFileWithPreinsertionAsset:type:", v6, v7);
    goto LABEL_10;
  }
  v11 = objc_msgSend(v6, "newCGImageSource");
  if (!v11)
  {
LABEL_2:
    v10 = 0;
  }
  else
  {
    v12 = v11;
    if ((objc_msgSend(a1, "p_canImportImageSource:", v11) & 1) != 0)
      v10 = 1;
    else
      v10 = +[PFImageMetadata imageSourceIsSpatial:](PFImageMetadata, "imageSourceIsSpatial:", v12);
    CFRelease(v12);
  }
LABEL_10:

  return v10;
}

+ (BOOL)p_canImportImageSource:(CGImageSource *)a3
{
  size_t Count;

  Count = CGImageSourceGetCount(a3);
  if (Count != 1)
    LOBYTE(Count) = objc_msgSend(a1, "p_canAnimate:", a3) ^ 1;
  return Count;
}

+ (BOOL)p_canAnimate:(CGImageSource *)a3
{
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 1;
  v3 = CGImageSourceCopyProperties(a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("CanAnimate")));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "intValue") != 0;
  else
    v6 = 1;

  return v6;
}

- (CRLImageItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  CRLImageItemImporter *v4;
  CRLImageItemImporter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLImageItemImporter;
  v4 = -[CRLBoardItemImporter initWithURL:boardItemFactory:](&v7, "initWithURL:boardItemFactory:", a3, a4);
  v5 = v4;
  if (v4)
    sub_1003C8B24(v4);
  return v5;
}

- (CRLImageItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  CRLImageItemImporter *v4;
  CRLImageItemImporter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLImageItemImporter;
  v4 = -[CRLBoardItemImporter initWithData:boardItemFactory:](&v7, "initWithData:boardItemFactory:", a3, a4);
  v5 = v4;
  if (v4)
    sub_1003C8B24(v4);
  return v5;
}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *importQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  importQueue = self->_importQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003C8C7C;
  v7[3] = &unk_101231F00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(importQueue, v7);

}

- (void)p_createAssetDataAndThenContinueImportWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  void *v7;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = self->_importQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v5);

  if (!atomic_load((unsigned int *)&self->_isCancelled))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
    if (v7)
    {
      v8 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetOwner"));
      v12 = -[CRLPreinsertionAssetWrapper initWithUrl:owner:](v8, "initWithUrl:owner:", v9, v11);

      if (!v12)
      {
LABEL_11:
        -[CRLImageItemImporter p_doAsyncImportWorkWithCompletionHandler:](self, "p_doAsyncImportWorkWithCompletionHandler:", v4);
        goto LABEL_12;
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter preinsertionAsset](self, "preinsertionAsset"));

      if (!v13)
        goto LABEL_11;
      v12 = (_TtC8Freeform27CRLPreinsertionAssetWrapper *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter preinsertionAsset](self, "preinsertionAsset"));
      if (!v12)
        goto LABEL_11;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003C8E2C;
    v14[3] = &unk_101231FA8;
    v14[4] = self;
    v15 = v4;
    -[CRLPreinsertionAssetWrapper createAssetWithCompletionHandler:](v12, "createAssetWithCompletionHandler:", v14);

LABEL_12:
  }

}

- (void)p_doAsyncImportWorkWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  double v6;
  double v8;
  _TtC8Freeform8CRLAsset *imageData;
  void *v10;
  uint64_t v11;
  CRLImageCompatibilityChecker *v12;
  CRLImageCompatibilityChecker *compatibilityChecker;
  CRLImageCompatibilityChecker *v14;
  id v15;
  void **v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  void *v19;
  CRLImageItemImporter *v20;
  id v21;
  id v22;
  uint64_t v23;

  v4 = a3;
  v5 = self->_importQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v5);

  -[CRLBasicProgress maxValue](self->_progress, "maxValue");
  if (atomic_load((unsigned int *)&self->_isCancelled))
  {
    -[CRLImageItemImporter p_finishImportingWithInfo:error:completionHandler:](self, "p_finishImportingWithInfo:error:completionHandler:", 0, 0, v4);
  }
  else
  {
    v8 = v6;
    -[CRLBasicProgress setValue:](self->_progress, "setValue:", v6 * 0.1);
    imageData = self->_imageData;
    if (imageData)
    {
      objc_storeStrong((id *)&self->_originalImageData, imageData);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter delegate](self, "delegate"));
      if (v10)
        v11 = 4;
      else
        v11 = 3;
      v12 = -[CRLImageCompatibilityChecker initWithImageData:]([CRLImageCompatibilityChecker alloc], "initWithImageData:", self->_imageData);
      compatibilityChecker = self->_compatibilityChecker;
      self->_compatibilityChecker = v12;

      v14 = self->_compatibilityChecker;
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_1003C92B0;
      v19 = &unk_101259348;
      v20 = self;
      v21 = v10;
      v23 = v11;
      v22 = v4;
      v15 = v10;
      -[CRLImageCompatibilityChecker checkCompatibilityUpToLevel:completionHandler:](v14, "checkCompatibilityUpToLevel:completionHandler:", v11, &v16);

    }
    else
    {
      -[CRLImageItemImporter p_finishImportingWithInfo:error:completionHandler:](self, "p_finishImportingWithInfo:error:completionHandler:", 0, 0, v4);
    }
    -[CRLBasicProgress setValue:](self->_progress, "setValue:", v8 * 0.5, v16, v17, v18, v19, v20);
  }

}

- (void)p_importImageFromDataConvertingIfNeededToRequiredCompatibilityLevel:(int64_t)a3 fromCompatibilityLevel:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  CRLImageCompatibilityConverter *v10;
  _TtC8Freeform8CRLAsset *imageData;
  void *v12;
  void *v13;
  CRLImageCompatibilityConverter *v14;
  CRLImageCompatibilityConverter *compatibilityConverter;
  CRLImageCompatibilityConverter *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];

  v8 = a5;
  v9 = self->_importQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

  if (a4 >= a3)
  {
    -[CRLImageItemImporter p_importInfoFromDataWithCompletionHandler:](self, "p_importInfoFromDataWithCompletionHandler:", v8);
  }
  else if (a4 < 2)
  {
    v32[0] = NSLocalizedDescriptionKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("The image type is not supported on this device."), 0, 0));
    v32[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
    v33[0] = v18;
    v33[1] = &off_1012CC820;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));

    v20 = objc_msgSend(v19, "mutableCopy");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
    if (v21)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, NSURLErrorKey);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 103, v20));
    if ((sub_10040ED28(self->_imageData) & 1) == 0)
    {
      v27 = objc_alloc((Class)NSError);
      v30[0] = NSLocalizedFailureReasonErrorKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("This image is too large to insert."), 0, 0));
      v30[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
      v31[0] = v24;
      v31[1] = &off_1012CC820;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
      v26 = objc_msgSend(v27, "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 102, v25);

      v22 = v26;
    }
    -[CRLImageItemImporter p_finishImportingWithInfo:error:completionHandler:](self, "p_finishImportingWithInfo:error:completionHandler:", 0, v22, v8);

  }
  else
  {
    v10 = [CRLImageCompatibilityConverter alloc];
    imageData = self->_imageData;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetOwner"));
    v14 = -[CRLImageCompatibilityConverter initWithImageData:desiredCompatibilityLevel:assetOwner:](v10, "initWithImageData:desiredCompatibilityLevel:assetOwner:", imageData, a3, v13);
    compatibilityConverter = self->_compatibilityConverter;
    self->_compatibilityConverter = v14;

    v16 = self->_compatibilityConverter;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1003C98F8;
    v28[3] = &unk_101231F00;
    v28[4] = self;
    v29 = v8;
    -[CRLImageCompatibilityConverter convertMediaWithCompletionHandler:](v16, "convertMediaWithCompletionHandler:", v28);

  }
}

- (void)p_importInfoFromDataWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  void *v6;
  double v8;
  unsigned int v9;
  id v10;
  void *v11;
  double v12;
  char v13;
  CFArrayRef (__cdecl **v14)(CTFontDescriptorRef, CFSetRef);
  CFArrayRef (__cdecl **v15)(CTFontDescriptorRef, CFSetRef);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CRLCanvasInfoGeometry *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];

  v4 = a3;
  v5 = self->_importQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v5);

  v6 = objc_autoreleasePoolPush();
  if (!atomic_load((unsigned int *)&self->_isCancelled))
  {
    -[CRLBasicProgress maxValue](self->_progress, "maxValue");
    if (!self->_imageData || (v9 = atomic_load((unsigned int *)&self->_isCancelled)) != 0)
    {
      v10 = 0;
      v11 = 0;
LABEL_17:
      -[CRLImageItemImporter p_finishImportingWithInfo:error:completionHandler:](self, "p_finishImportingWithInfo:error:completionHandler:", v11, v10, v4);

      goto LABEL_18;
    }
    v12 = v8;
    v13 = sub_10040ED28(self->_imageData);
    v14 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v15 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    if ((v13 & 1) != 0)
      goto LABEL_23;
    v16 = objc_alloc((Class)NSError);
    v34[0] = NSLocalizedFailureReasonErrorKey;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("This image is too large to insert."), 0, 0));
    v34[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
    v35[0] = v18;
    v35[1] = &off_1012CC820;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
    v10 = objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 102, v19);

    v14 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v15 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    if (!v10)
    {
LABEL_23:
      if (self->_imageData)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "providerForAsset:shouldValidate:", self->_imageData, 1));

        if (v21 && !objc_msgSend(v21, "isError"))
        {
          objc_msgSend(v21, "dpiAdjustedNaturalSize");
          v28 = sub_100062E10(v26, v27, 250.0, 250.0);
          v30 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", v28, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItemFactory](self, "boardItemFactory"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "makeImageItemWithGeometry:imageData:thumbnailData:", v30, self->_imageData, self->_thumbnailData));

          v15 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          v14 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          if (v11)
          {
            v10 = 0;
            goto LABEL_16;
          }
        }
        else
        {

          v14 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
        }
      }
      v22 = objc_alloc((Class)v14[393]);
      v32[0] = NSLocalizedFailureReasonErrorKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[375], "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("This image is of an unsupported type."), 0, 0));
      v32[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
      v33[0] = v24;
      v33[1] = &off_1012CC820;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
      v10 = objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 103, v25);

    }
    v11 = 0;
LABEL_16:
    -[CRLBasicProgress setValue:](self->_progress, "setValue:", v12);
    goto LABEL_17;
  }
LABEL_18:
  objc_autoreleasePoolPop(v6);

}

- (void)p_finishImportingWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSError *v23;
  NSError *v24;
  NSError *error;
  NSError *v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  -[CRLImageItemImporter p_tellDelegateToIgnoreCompatibilityLevelIfNeeded](self, "p_tellDelegateToIgnoreCompatibilityLevelIfNeeded");
  if (!atomic_load((unsigned int *)&self->_isCancelled))
  {
    if (!v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter URL](self, "URL"));
      v14 = v13;
      if (v13)
      {
        v27 = 0;
        objc_msgSend(v13, "getResourceValue:forKey:error:", &v27, NSURLLocalizedNameKey, 0);
        v15 = v27;
        if (!v15)
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("The image “%@” couldn’t be inserted."), 0, 0));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v15));

      }
      else
      {
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("The image couldn’t be inserted."), 0, 0));
      }

      if (v10)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
        v20 = objc_msgSend(v19, "mutableCopy");

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
        if (!v21)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, NSLocalizedDescriptionKey);
        if (v14)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, NSURLErrorKey);
        v22 = objc_alloc((Class)NSError);
        v23 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
        v24 = (NSError *)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, objc_msgSend(v10, "code"), v20);
        error = self->_error;
        self->_error = v24;

      }
      else
      {
        v20 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, NSLocalizedDescriptionKey);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", &off_1012CC820, CFSTR("CRLBoardItemImporterErrorMediaTypeKey"));
        if (v14)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, NSURLErrorKey);
        v26 = (NSError *)objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 100, v20);
        v23 = self->_error;
        self->_error = v26;
      }

      if (v11)
        goto LABEL_5;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_boardItem, a3);
  }
  if (v11)
LABEL_5:
    v11[2](v11);
LABEL_6:

}

- (void)p_tellDelegateToIgnoreCompatibilityLevelIfNeeded
{
  OS_dispatch_queue *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v3 = self->_importQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (!self->_didMessageDelegateAboutMediaCompatibility)
  {
    self->_didMessageDelegateAboutMediaCompatibility = 1;
    v4 = objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter delegate](self, "delegate"));
    v5 = (void *)v4;
    if (v4)
    {
      v7 = (void *)v4;
      v6 = objc_opt_respondsToSelector(v4, "boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:");
      v5 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
        v5 = v7;
      }
    }

  }
}

- (void)cancel
{
  NSObject *importQueue;
  _QWORD block[5];

  importQueue = self->_importQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003CA260;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(importQueue, block);
}

- (unint64_t)uploadDataLength
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  objc_opt_class(_TtC8Freeform12CRLImageItem, a2);
  v4 = sub_100221D0C(v3, self->_boardItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[CRLImageItemImporter p_uploadDataLengthForInfo:](self, "p_uploadDataLengthForInfo:", v5);

  return v6;
}

- (unint64_t)embeddedDataLength
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  objc_opt_class(_TtC8Freeform12CRLImageItem, a2);
  v4 = sub_100221D0C(v3, self->_boardItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[CRLImageItemImporter p_embeddedDataLengthForInfo:](self, "p_embeddedDataLengthForInfo:", v5);

  return v6;
}

- (unint64_t)p_uploadDataLengthForInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));
    v4 = objc_msgSend(v5, "length");

  }
  return (unint64_t)v4;
}

- (unint64_t)p_embeddedDataLengthForInfo:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnailAssetPayload"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "thumbnailAssetPayload"));
    v4 = (char *)objc_msgSend(v5, "length");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageAssetPayload"));
    v4 = &v4[(_QWORD)objc_msgSend(v7, "length")];

  }
  return (unint64_t)v4;
}

- (id)progress
{
  return self->_progress;
}

- (id)boardItem
{
  return self->_boardItem;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_compatibilityConverter, 0);
  objc_storeStrong((id *)&self->_compatibilityChecker, 0);
  objc_storeStrong((id *)&self->_originalImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_importQueue, 0);
}

@end
