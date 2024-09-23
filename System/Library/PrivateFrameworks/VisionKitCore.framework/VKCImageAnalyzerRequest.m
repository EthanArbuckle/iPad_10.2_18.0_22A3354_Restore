@implementation VKCImageAnalyzerRequest

- (void)dealloc
{
  CGImage *cgImageRef;
  __CVBuffer *pixelBuffer;
  objc_super v5;

  cgImageRef = self->_cgImageRef;
  if (cgImageRef)
    CGImageRelease(cgImageRef);
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    CVBufferRelease(pixelBuffer);
  v5.receiver = self;
  v5.super_class = (Class)VKCImageAnalyzerRequest;
  -[VKCImageAnalyzerRequest dealloc](&v5, sel_dealloc);
}

- (VKCImageAnalyzerRequest)init
{
  VKCImageAnalyzerRequest *v2;
  VKCImageAnalyzerRequest *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKCImageAnalyzerRequest;
  v2 = -[VKCImageAnalyzerRequest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_imageOrientation = 0;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3->_screenScale = v5;

    v3->_queryID = objc_msgSend((id)objc_opt_class(), "newQueryIDForParsec");
  }
  return v3;
}

+ (unint64_t)newQueryIDForParsec
{
  unint64_t result;

  result = newQueryIDForParsec_sCurrentQueryID + arc4random_uniform(0x10u) + 1;
  newQueryIDForParsec_sCurrentQueryID = result;
  return result;
}

- (VKCImageAnalyzerRequest)initWithImage:(id)a3 requestType:(unint64_t)a4
{
  id v6;
  VKCImageAnalyzerRequest *v7;

  v6 = a3;
  v7 = -[VKCImageAnalyzerRequest initWithImage:orientation:requestType:](self, "initWithImage:orientation:requestType:", v6, objc_msgSend(v6, "vk_imageOrientation"), a4);

  return v7;
}

- (VKCImageAnalyzerRequest)initWithImage:(id)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  id v9;
  VKCImageAnalyzerRequest *v10;
  NSObject *v11;

  v9 = a3;
  v10 = -[VKCImageAnalyzerRequest init](self, "init");
  if (v10)
  {
    if (!v9)
    {
      v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalyzerRequest initWithImage:orientation:requestType:].cold.1();

    }
    objc_storeStrong((id *)&v10->_image, a3);
    v10->_imageOrientation = a4;
    v10->_analysisTypes = a5;
    v10->_requestType = 0;
  }

  return v10;
}

- (VKCImageAnalyzerRequest)initWithCIImage:(id)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  id v9;
  VKCImageAnalyzerRequest *v10;
  NSObject *v11;

  v9 = a3;
  v10 = -[VKCImageAnalyzerRequest init](self, "init");
  if (v10)
  {
    if (!v9)
    {
      v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalyzerRequest initWithCIImage:orientation:requestType:].cold.1();

    }
    objc_storeStrong((id *)&v10->_ciImage, a3);
    v10->_imageOrientation = a4;
    v10->_analysisTypes = a5;
    v10->_requestType = 2;
  }

  return v10;
}

- (VKCImageAnalyzerRequest)initWithCGImage:(CGImage *)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  VKCImageAnalyzerRequest *v8;
  NSObject *v9;

  v8 = -[VKCImageAnalyzerRequest init](self, "init");
  if (v8)
  {
    if (!a3)
    {
      v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalyzerRequest initWithCGImage:orientation:requestType:].cold.1();

    }
    v8->_cgImageRef = CGImageRetain(a3);
    v8->_imageOrientation = a4;
    v8->_analysisTypes = a5;
    v8->_requestType = 1;
  }
  return v8;
}

- (VKCImageAnalyzerRequest)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(int64_t)a4 requestType:(unint64_t)a5
{
  VKCImageAnalyzerRequest *v9;
  NSObject *v10;
  void *v11;
  VKCImageAnalyzerRequest *v12;
  NSObject *v13;
  uint8_t v15[16];

  if (a3 && !CVPixelBufferGetIOSurface(a3))
  {
    v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D2E0D000, v10, OS_LOG_TYPE_DEFAULT, "pixelBuffer is not IOSurfaceBacked, converting to CIImage", v15, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[VKCImageAnalyzerRequest initWithCIImage:orientation:requestType:](self, "initWithCIImage:orientation:requestType:", v11, a4, a5);

  }
  else
  {
    v9 = -[VKCImageAnalyzerRequest init](self, "init");
    if (v9)
    {
      if (a3)
      {
        v9->_pixelBuffer = CVPixelBufferRetain(a3);
      }
      else
      {
        v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[VKCImageAnalyzerRequest initWithCVPixelBuffer:orientation:requestType:].cold.1();

      }
      v9->_imageOrientation = a4;
      v9->_analysisTypes = a5;
      v9->_requestType = 3;
    }
    v12 = v9;
  }

  return v12;
}

- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 imageSize:(CGSize)a5 requestType:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  VKCImageAnalyzerRequest *v14;
  VKCImageAnalyzerRequest *v15;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = -[VKCImageAnalyzerRequest init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_URL, a4);
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    v15->_analysisTypes = a6;
    v15->_requestType = 5;
    v15->_photosImageSize.width = width;
    v15->_photosImageSize.height = height;
  }

  return v15;
}

- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 cgImage:(CGImage *)a5 orientation:(int64_t)a6 requestType:(unint64_t)a7
{
  id v13;
  id v14;
  VKCImageAnalyzerRequest *v15;
  NSObject *v16;

  v13 = a3;
  v14 = a4;
  v15 = -[VKCImageAnalyzerRequest init](self, "init");
  if (v15)
  {
    if (!a5)
    {
      v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalyzerRequest initWithCGImage:orientation:requestType:].cold.1();

    }
    v15->_cgImageRef = CGImageRetain(a5);
    objc_storeStrong((id *)&v15->_URL, a4);
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    v15->_imageOrientation = a6;
    v15->_analysisTypes = a7;
    v15->_requestType = 6;
  }

  return v15;
}

- (VKCImageAnalyzerRequest)initWithLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 pixelBuffer:(__CVBuffer *)a5 orientation:(int64_t)a6 requestType:(unint64_t)a7
{
  id v13;
  id v14;
  VKCImageAnalyzerRequest *v15;
  NSObject *v16;

  v13 = a3;
  v14 = a4;
  v15 = -[VKCImageAnalyzerRequest init](self, "init");
  if (v15)
  {
    if (a5)
    {
      v15->_pixelBuffer = CVPixelBufferRetain(a5);
    }
    else
    {
      v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalyzerRequest initWithLocalIdentifier:photoLibraryURL:pixelBuffer:orientation:requestType:].cold.1();

    }
    objc_storeStrong((id *)&v15->_URL, a4);
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    v15->_imageOrientation = a6;
    v15->_analysisTypes = a7;
    v15->_requestType = 7;
  }

  return v15;
}

- (VKCImageAnalyzerRequest)initWithImageURL:(id)a3 requestType:(unint64_t)a4
{
  id v7;
  VKCImageAnalyzerRequest *v8;
  NSObject *v9;

  v7 = a3;
  v8 = -[VKCImageAnalyzerRequest init](self, "init");
  if (v8)
  {
    if (!v7)
    {
      v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[VKCImageAnalyzerRequest initWithImageURL:requestType:].cold.1();

    }
    objc_storeStrong((id *)&v8->_URL, a3);
    v8->_analysisTypes = a4;
    v8->_requestType = 4;
  }

  return v8;
}

- (VKCImageAnalyzerRequest)initWithView:(id)a3 requestType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  VKCImageAnalyzerRequest *v9;

  v6 = a3;
  if (!v6)
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VKCImageAnalyzerRequest initWithView:requestType:].cold.1();

  }
  objc_msgSend(v6, "vk_renderImageFromViewBackingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VKCImageAnalyzerRequest initWithImage:orientation:requestType:](self, "initWithImage:orientation:requestType:", v8, 0, a4);

  return v9;
}

- (id)requestIDValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VKCImageAnalyzerRequest requestID](self, "requestID"));
}

- (void)setRequestID:(int)a3
{
  void *v5;

  -[VKCImageAnalyzerRequest processDate](self, "processDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 >= 1 && !v5)
    self->_requestID = a3;
}

- (void)setLocales:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[VKCImageAnalyzerRequest processDate](self, "processDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_storeStrong((id *)&self->_locales, a3);

}

- (void)setBarcodeSymbologies:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  -[VKCImageAnalyzerRequest processDate](self, "processDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_storeStrong((id *)&self->_barcodeSymbologies, a3);

}

- (unint64_t)requestedAnalysisTypes
{
  return self->_analysisTypes;
}

- (BOOL)isPhotosAssetRequest
{
  return -[VKCImageAnalyzerRequest requestType](self, "requestType") == 5;
}

- (id)processedBarcodeSymbologies
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[VKCImageAnalyzerRequest barcodeSymbologies](self, "barcodeSymbologies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[VKCImageAnalyzerRequest defaultBarcodeSymbologies](self, "defaultBarcodeSymbologies");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if ((-[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes") & 8) != 0)
  {
    objc_msgSend(v6, "vk_arrayByAddingNonNilObject:", *MEMORY[0x1E0CEE250]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (unsigned)cgimageOrientation
{
  return vk_cgImagePropertyOrientationFromVKOrientation(-[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation"));
}

- (NSString)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  __CFString *v17;
  objc_super v18;

  if (-[VKCImageAnalyzerRequest requestID](self, "requestID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VKCImageAnalyzerRequest requestID](self, "requestID"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("(Not Set)");
  }
  if (-[VKCImageAnalyzerRequest madRequestID](self, "madRequestID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VKCImageAnalyzerRequest madRequestID](self, "madRequestID"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("(Not Set)");
  }
  v15 = (id)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)VKCImageAnalyzerRequest;
  -[VKCImageAnalyzerRequest description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKCImageAnalyzerRequest cancelled](self, "cancelled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForAnalysisTypes(-[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForAnalyzerRequestType(-[VKCImageAnalyzerRequest requestType](self, "requestType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalyzerRequest locales](self, "locales");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalyzerRequest barcodeSymbologies](self, "barcodeSymbologies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalyzerRequest imageSize](self, "imageSize");
  VKMUIStringForSize(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForImageOrientation(-[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ \n requestID: %@ \n madRequestID: %@ \n cancelled: %@ \n analysisTypes: %@ \n requestType: %@ \n locales: %@ \n barcodeSymbologies %@ \n imageSize %@ \n orientation: %@"), v4, v17, v3, v5, v6, v7, v8, v9, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)shortLoggingDescription
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (-[VKCImageAnalyzerRequest requestID](self, "requestID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VKCImageAnalyzerRequest requestID](self, "requestID"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("(Not Set)");
  }
  if (-[VKCImageAnalyzerRequest madRequestID](self, "madRequestID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VKCImageAnalyzerRequest madRequestID](self, "madRequestID"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(Not Set)");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VKCImageAnalyzerRequest;
  -[VKCImageAnalyzerRequest description](&v10, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKCImageAnalyzerRequest cancelled](self, "cancelled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ requestID: %@ madRequestID: %@ cancelled: %@"), v6, v3, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)madRequests
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[VKCImageAnalyzerRequest processedAnalysisTypes](self, "processedAnalysisTypes");
  if ((v4 & 1) != 0)
  {
    -[VKCImageAnalyzerRequest locales](self, "locales");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      -[VKCImageAnalyzerRequest locales](self, "locales");
    else
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0D477A8]);
    objc_msgSend(v7, "setUsesFormFieldDetection:", -[VKCImageAnalyzerRequest _wantsFormFieldDetection](self, "_wantsFormFieldDetection"));
    objc_msgSend(v7, "setLanguages:", v6);
    objc_msgSend(v7, "setMaximumCandidateCount:", 3);
    objc_msgSend(v7, "setUsesLanguageDetection:", 1);
    objc_msgSend(v3, "addObject:", v7);

  }
  if ((v4 & 0xC) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D477C8]);
    -[VKCImageAnalyzerRequest processedBarcodeSymbologies](self, "processedBarcodeSymbologies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSymbologies:", v9);

    objc_msgSend(v3, "addObject:", v10);
  }
  if (-[VKCImageAnalyzerRequest _wantsRectangleDetection](self, "_wantsRectangleDetection"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D477D8]);
    objc_msgSend(v11, "setMaximumObservations:", 0);
    LODWORD(v12) = 0;
    objc_msgSend(v11, "setMinimumAspectRatio:", v12);
    LODWORD(v13) = 0;
    objc_msgSend(v11, "setMinimumSize:", v13);
    LODWORD(v14) = 0.5;
    objc_msgSend(v11, "setMinimumConfidence:", v14);
    LODWORD(v15) = 20.0;
    objc_msgSend(v11, "setQuadratureTolerance:", v15);
    objc_msgSend(v3, "addObject:", v11);

  }
  if ((v4 & 0x10) != 0)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D47820]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VKCImageAnalyzerRequest queryID](self, "queryID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setQueryID:", v17);

    -[VKCImageAnalyzerRequest viImageType](self, "viImageType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImageType:", v18);

    -[VKCImageAnalyzerRequest imageURL](self, "imageURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImageURL:", v19);

    -[VKCImageAnalyzerRequest pageURL](self, "pageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setReferralURL:", v20);

    -[VKCImageAnalyzerRequest location](self, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLocation:", v21);

    objc_msgSend(v3, "addObject:", v16);
  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (id)viImageType
{
  unint64_t v2;

  v2 = -[VKCImageAnalyzerRequest imageSource](self, "imageSource");
  if (v2 > 2)
    return 0;
  else
    return (id)qword_1E9464F10[v2];
}

- (__CVBuffer)tempPixelBufferRef
{
  CGImage *v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;

  if (-[VKCImageAnalyzerRequest requestType](self, "requestType"))
  {
    if (-[VKCImageAnalyzerRequest requestType](self, "requestType") == 1)
    {
      v3 = -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef");
      return vk_ioSurfaceBackedPixelBufferFromCGImage(v3, 0);
    }
  }
  else
  {
    -[VKCImageAnalyzerRequest image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "vk_cgImageGeneratingIfNecessary");

    if (v5)
    {
      v3 = (CGImage *)v5;
      return vk_ioSurfaceBackedPixelBufferFromCGImage(v3, 0);
    }
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VKCImageAnalyzerRequest tempPixelBufferRef].cold.1((uint64_t)self, v7);

  }
  return 0;
}

- (BOOL)hasImageData
{
  return -[VKCImageAnalyzerRequest requestType](self, "requestType") < 5;
}

- (id)blockingGenerateCIImage
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9E0B0];
  v20[0] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0C9E140];
  v19[0] = v3;
  v19[1] = v4;
  v17 = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", vk_cgImagePropertyOrientationFromVKOrientation(-[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[VKCImageAnalyzerRequest requestType](self, "requestType"))
  {
    case 0uLL:
      v8 = (void *)MEMORY[0x1E0C9DDC8];
      -[VKCImageAnalyzerRequest image](self, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithCGImage:options:", objc_msgSend(v9, "vk_cgImage"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:options:", -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"), v7);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", -[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"), v7);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v11;
      break;
    case 4uLL:
      v12 = (void *)MEMORY[0x1E0C9DDC8];
      v13 = (void *)MEMORY[0x1E0CEA638];
      -[VKCImageAnalyzerRequest URL](self, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "vk_imageWithContentsOfURL:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithCGImage:options:", objc_msgSend(v15, "vk_cgImage"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (CGImage)blockingGenerateCGImage
{
  void *v3;
  __CVBuffer *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGImage *v12;

  switch(-[VKCImageAnalyzerRequest requestType](self, "requestType"))
  {
    case 0uLL:
      -[VKCImageAnalyzerRequest image](self, "image");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (__CVBuffer *)objc_msgSend(v3, "vk_cgImage");

      return v4;
    case 1uLL:
      return -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef");
    case 2uLL:
      -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (__CVBuffer *)objc_msgSend(v6, "CGImage");

      if (v4)
        return v4;
      objc_msgSend(MEMORY[0x1E0C9DD90], "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageAnalyzerRequest imageSize](self, "imageSize");
      v4 = (__CVBuffer *)objc_msgSend(v7, "createCGImage:fromRect:", v8, VKMRectWithSize());

      if (!v4)
        return v4;
      goto LABEL_9;
    case 3uLL:
      v4 = vk_cgImageFromPixelBuffer(-[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"));
      if (v4)
LABEL_9:
        CFAutorelease(v4);
      return v4;
    case 4uLL:
      v9 = (void *)MEMORY[0x1E0CEA638];
      -[VKCImageAnalyzerRequest URL](self, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vk_imageWithContentsOfURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (CGImage *)objc_msgSend(v11, "vk_cgImage");

      return v12;
    default:
      return 0;
  }
}

- (id)createVNRequestHandler
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  CGImage *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  __CVBuffer *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  switch(-[VKCImageAnalyzerRequest requestType](self, "requestType"))
  {
    case 0uLL:
      v3 = objc_alloc(MEMORY[0x1E0CEDF70]);
      -[VKCImageAnalyzerRequest image](self, "image");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "vk_cgImage");
      v6 = -[VKCImageAnalyzerRequest cgimageOrientation](self, "cgimageOrientation");
      v7 = objc_msgSend(v3, "initWithCGImage:orientation:options:", v5, v6, MEMORY[0x1E0C9AA70]);
      goto LABEL_9;
    case 1uLL:
      v9 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v10 = -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef");
      v11 = -[VKCImageAnalyzerRequest cgimageOrientation](self, "cgimageOrientation");
      v12 = objc_msgSend(v9, "initWithCGImage:orientation:options:", v10, v11, MEMORY[0x1E0C9AA70]);
      goto LABEL_7;
    case 2uLL:
      v13 = objc_alloc(MEMORY[0x1E0CEDF70]);
      -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[VKCImageAnalyzerRequest cgimageOrientation](self, "cgimageOrientation");
      v7 = objc_msgSend(v13, "initWithCIImage:orientation:options:", v4, v14, MEMORY[0x1E0C9AA70]);
      goto LABEL_9;
    case 3uLL:
      v15 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v16 = -[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer");
      v17 = -[VKCImageAnalyzerRequest cgimageOrientation](self, "cgimageOrientation");
      v12 = objc_msgSend(v15, "initWithCVPixelBuffer:orientation:options:", v16, v17, MEMORY[0x1E0C9AA70]);
LABEL_7:
      v8 = (void *)v12;
      break;
    case 4uLL:
      v18 = objc_alloc(MEMORY[0x1E0CEDF70]);
      -[VKCImageAnalyzerRequest URL](self, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[VKCImageAnalyzerRequest cgimageOrientation](self, "cgimageOrientation");
      v7 = objc_msgSend(v18, "initWithURL:orientation:options:", v4, v19, MEMORY[0x1E0C9AA70]);
LABEL_9:
      v8 = (void *)v7;

      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (CGSize)imageSize
{
  double Width;
  double v4;
  CGImage *v5;
  size_t Height;
  __CVBuffer *v7;
  __CVBuffer *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  const __CFURL *v18;
  CGImageSourceRef v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  Width = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  switch(-[VKCImageAnalyzerRequest requestType](self, "requestType"))
  {
    case 0uLL:
      -[VKCImageAnalyzerRequest image](self, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      Width = v10;
      v4 = v11;
      goto LABEL_8;
    case 1uLL:
    case 6uLL:
      v5 = -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef");
      Width = (double)CGImageGetWidth(v5);
      Height = CGImageGetHeight(v5);
      goto LABEL_5;
    case 2uLL:
      -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "extent");
      Width = v12;
      v4 = v13;
LABEL_8:

      goto LABEL_12;
    case 3uLL:
    case 7uLL:
      v7 = -[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer");
      if (!v7)
        goto LABEL_12;
      v8 = v7;
      Width = (double)CVPixelBufferGetWidth(v7);
      Height = CVPixelBufferGetHeight(v8);
LABEL_5:
      v4 = (double)Height;
LABEL_12:
      v22 = Width;
      v23 = v4;
      result.height = v23;
      result.width = v22;
      return result;
    case 4uLL:
      -[VKCImageAnalyzerRequest URL](self, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "checkResourceIsReachableAndReturnError:", 0);

      if (v17)
      {
        -[VKCImageAnalyzerRequest URL](self, "URL");
        v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        v19 = CGImageSourceCreateWithURL(v18, 0);

        -[VKCImageAnalyzerRequest imageSizeFromCGImageSource:](self, "imageSizeFromCGImageSource:", v19);
        Width = v20;
        v4 = v21;
        CFRelease(v19);
      }
      goto LABEL_12;
    case 5uLL:
      -[VKCImageAnalyzerRequest photosImageSize](self, "photosImageSize");
      Width = v14;
      v4 = v15;
      goto LABEL_12;
    default:
      goto LABEL_12;
  }
}

- (CGSize)imageSizeFromCGImageSource:(CGImageSource *)a3
{
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  v4 = v3;
  if (v3)
  {
    -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    v8 = *MEMORY[0x1E0CBD040];
    -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    -[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if ((v13 - 5) >= 4)
      v14 = v11;
    else
      v14 = v7;
    if ((v13 - 5) < 4)
      v7 = v11;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v15 = v7;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (NSArray)defaultBarcodeSymbologies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CEE278];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  VKCImageAnalyzerRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  VKCImageAnalyzerRequest *v9;
  VKCImageAnalyzerRequest *v10;
  void *v12;
  VKCImageAnalyzerRequest *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  VKCImageAnalyzerRequest *v18;

  -[VKCImageAnalyzerRequest image](self, "image", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [VKCImageAnalyzerRequest alloc];
    -[VKCImageAnalyzerRequest image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VKCImageAnalyzerRequest initWithImage:orientation:requestType:](v5, "initWithImage:orientation:requestType:", v6, -[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation"), -[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"));
LABEL_5:
    v10 = (VKCImageAnalyzerRequest *)v7;
LABEL_6:

    return v10;
  }
  -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [VKCImageAnalyzerRequest alloc];
    -[VKCImageAnalyzerRequest ciImage](self, "ciImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VKCImageAnalyzerRequest initWithCIImage:orientation:requestType:](v9, "initWithCIImage:orientation:requestType:", v6, -[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation"), -[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"));
    goto LABEL_5;
  }
  if (-[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"))
    return -[VKCImageAnalyzerRequest initWithCGImage:orientation:requestType:]([VKCImageAnalyzerRequest alloc], "initWithCGImage:orientation:requestType:", -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"), -[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation"), -[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"));
  if (-[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"))
    return -[VKCImageAnalyzerRequest initWithCVPixelBuffer:orientation:requestType:]([VKCImageAnalyzerRequest alloc], "initWithCVPixelBuffer:orientation:requestType:", -[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"), -[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation"), -[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"));
  -[VKCImageAnalyzerRequest localIdentifier](self, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [VKCImageAnalyzerRequest alloc];
    -[VKCImageAnalyzerRequest localIdentifier](self, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalyzerRequest URL](self, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalyzerRequest imageSize](self, "imageSize");
    v10 = -[VKCImageAnalyzerRequest initWithLocalIdentifier:photoLibraryURL:imageSize:requestType:](v13, "initWithLocalIdentifier:photoLibraryURL:imageSize:requestType:", v6, v14, -[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"), v15, v16);

    goto LABEL_6;
  }
  -[VKCImageAnalyzerRequest URL](self, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = [VKCImageAnalyzerRequest alloc];
    -[VKCImageAnalyzerRequest URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VKCImageAnalyzerRequest initWithImageURL:requestType:](v18, "initWithImageURL:requestType:", v6, -[VKCImageAnalyzerRequest analysisTypes](self, "analysisTypes"));
    goto LABEL_5;
  }
  +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCImageAnalyzerRequest copyWithZone:]", 0, 0, CFSTR("Unable to create a copy of VKImageAnalyzerRequest"));
  return 0;
}

- (id)blockingCreatePNGAssetDataWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CVBuffer *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t v45;
  Class (*v46)(uint64_t);
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__12;
  v42 = __Block_byref_object_dispose__12;
  v43 = 0;
  -[VKCImageAnalyzerRequest image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VKCImageAnalyzerRequest image](self, "image");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v39[5];
    v39[5] = v6;
    goto LABEL_6;
  }
  if (-[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", -[VKCImageAnalyzerRequest cgImageRef](self, "cgImageRef"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"))
  {
    v13 = vk_cgImageFromPixelBuffer(-[VKCImageAnalyzerRequest pixelBuffer](self, "pixelBuffer"));
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v39[5];
    v39[5] = v14;

    CGImageRelease(v13);
    goto LABEL_7;
  }
  -[VKCImageAnalyzerRequest localIdentifier](self, "localIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_7;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v17 = (void *)getPHPhotoLibraryClass_softClass;
  v52 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v44 = MEMORY[0x1E0C809B0];
    v45 = 3221225472;
    v46 = __getPHPhotoLibraryClass_block_invoke;
    v47 = &unk_1E9462330;
    v48 = &v49;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)&v44);
    v17 = (void *)v50[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v49, 8);
  v19 = [v18 alloc];
  -[VKCImageAnalyzerRequest URL](self, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v19, "initWithPhotoLibraryURL:", v20);

  if (v7)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v21 = (void *)getPHFetchOptionsClass_softClass;
    v52 = getPHFetchOptionsClass_softClass;
    v22 = MEMORY[0x1E0C809B0];
    if (!getPHFetchOptionsClass_softClass)
    {
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = __getPHFetchOptionsClass_block_invoke;
      v47 = &unk_1E9462330;
      v48 = &v49;
      __getPHFetchOptionsClass_block_invoke((uint64_t)&v44);
      v21 = (void *)v50[3];
    }
    v23 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v49, 8);
    objc_msgSend(v23, "fetchOptionsWithPhotoLibrary:orObject:", v7, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v25 = (void *)getPHAssetClass_softClass;
    v52 = getPHAssetClass_softClass;
    if (!getPHAssetClass_softClass)
    {
      v44 = v22;
      v45 = 3221225472;
      v46 = __getPHAssetClass_block_invoke;
      v47 = &unk_1E9462330;
      v48 = &v49;
      __getPHAssetClass_block_invoke((uint64_t)&v44);
      v25 = (void *)v50[3];
    }
    v26 = objc_retainAutorelease(v25);
    _Block_object_dispose(&v49, 8);
    -[VKCImageAnalyzerRequest localIdentifier](self, "localIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fetchAssetsWithLocalIdentifiers:options:", v28, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v31 = (void *)getPHImageRequestOptionsClass_softClass;
    v52 = getPHImageRequestOptionsClass_softClass;
    if (!getPHImageRequestOptionsClass_softClass)
    {
      v44 = v22;
      v45 = 3221225472;
      v46 = __getPHImageRequestOptionsClass_block_invoke;
      v47 = &unk_1E9462330;
      v48 = &v49;
      __getPHImageRequestOptionsClass_block_invoke((uint64_t)&v44);
      v31 = (void *)v50[3];
    }
    v32 = objc_retainAutorelease(v31);
    _Block_object_dispose(&v49, 8);
    v33 = (void *)objc_msgSend([v32 alloc], "init");
    objc_msgSend(v33, "setSynchronous:", 1);
    objc_msgSend(v33, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v33, "setDeliveryMode:", 1);
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v34 = (void *)getPHImageManagerClass_softClass;
    v52 = getPHImageManagerClass_softClass;
    if (!getPHImageManagerClass_softClass)
    {
      v44 = v22;
      v45 = 3221225472;
      v46 = __getPHImageManagerClass_block_invoke;
      v47 = &unk_1E9462330;
      v48 = &v49;
      __getPHImageManagerClass_block_invoke((uint64_t)&v44);
      v34 = (void *)v50[3];
    }
    v35 = objc_retainAutorelease(v34);
    _Block_object_dispose(&v49, 8);
    objc_msgSend(v35, "defaultManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageAnalyzerRequest imageSize](self, "imageSize");
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __63__VKCImageAnalyzerRequest_blockingCreatePNGAssetDataWithError___block_invoke;
    v37[3] = &unk_1E9464ED8;
    v37[4] = &v38;
    v37[5] = a3;
    objc_msgSend(v36, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v30, 0, v33, v37);

  }
LABEL_6:

LABEL_7:
  v8 = -[VKCImageAnalyzerRequest imageOrientation](self, "imageOrientation");
  v9 = v39[5];
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_orientedImageFromImage:toOrientation:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vk_PNGData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)v39[5], "vk_PNGData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v38, 8);

  return v11;
}

void __63__VKCImageAnalyzerRequest_blockingCreatePNGAssetDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  _Unwind_Exception *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a2;
  v7 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v8 = (id *)getPHImageErrorKeySymbolLoc_ptr;
  v16 = getPHImageErrorKeySymbolLoc_ptr;
  if (!getPHImageErrorKeySymbolLoc_ptr)
  {
    v9 = (void *)PhotosLibrary();
    v8 = (id *)dlsym(v9, "PHImageErrorKey");
    v14[3] = (uint64_t)v8;
    getPHImageErrorKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v13, 8);
  if (!v8)
  {
    v12 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  v10 = *v8;
  objc_msgSend(v7, "objectForKeyedSubscript:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && *(_QWORD *)(a1 + 40))
    **(_QWORD **)(a1 + 40) = objc_retainAutorelease(v11);
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalyzerRequest URL](self, "URL");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[VKCImageAnalyzerRequest localIdentifier](self, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      -[VKCImageAnalyzerRequest URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isFileURL");

      if (v12)
      {
        -[VKCImageAnalyzerRequest URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByAppendingPathComponent:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v13, v15, a4);

LABEL_9:
        goto LABEL_10;
      }
    }
  }
  -[VKCImageAnalyzerRequest blockingCreatePNGAssetDataWithError:](self, "blockingCreatePNGAssetDataWithError:", a4);
  v17 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v17;
  v16 = a4 == 0;
  if (!a4 && v17)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("RequestAsset.png"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "writeToURL:options:error:", v14, 2, 0);
    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSArray)barcodeSymbologies
{
  return self->_barcodeSymbologies;
}

- (unint64_t)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(unint64_t)a3
{
  self->_imageSource = a3;
}

- (int)requestID
{
  return self->_requestID;
}

- (unint64_t)processedAnalysisTypes
{
  return self->_processedAnalysisTypes;
}

- (void)setProcessedAnalysisTypes:(unint64_t)a3
{
  self->_processedAnalysisTypes = a3;
}

- (BOOL)_wantsFormFieldDetection
{
  return self->__wantsFormFieldDetection;
}

- (void)set_wantsFormFieldDetection:(BOOL)a3
{
  self->__wantsFormFieldDetection = a3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (VKCImageAnalysis)inProcessAnalysis
{
  return self->_inProcessAnalysis;
}

- (void)setInProcessAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessAnalysis, a3);
}

- (BOOL)isMultiPartAnalysis
{
  return self->_isMultiPartAnalysis;
}

- (void)setIsMultiPartAnalysis:(BOOL)a3
{
  self->_isMultiPartAnalysis = a3;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

- (void)setCgimageOrientation:(unsigned int)a3
{
  self->_cgimageOrientation = a3;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  self->_analysisTypes = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CIImage)ciImage
{
  return self->_ciImage;
}

- (void)setCiImage:(id)a3
{
  objc_storeStrong((id *)&self->_ciImage, a3);
}

- (CGImage)cgImageRef
{
  return self->_cgImageRef;
}

- (void)setCgImageRef:(CGImage *)a3
{
  self->_cgImageRef = a3;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CGSize)photosImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_photosImageSize.width;
  height = self->_photosImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPhotosImageSize:(CGSize)a3
{
  self->_photosImageSize = a3;
}

- (int)madRequestID
{
  return self->_madRequestID;
}

- (void)setMadRequestID:(int)a3
{
  self->_madRequestID = a3;
}

- (NSDate)processDate
{
  return self->_processDate;
}

- (void)setProcessDate:(id)a3
{
  objc_storeStrong((id *)&self->_processDate, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)_wantsRectangleDetection
{
  return self->__wantsRectangleDetection;
}

- (void)set_wantsRectangleDetection:(BOOL)a3
{
  self->__wantsRectangleDetection = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setDefaultBarcodeSymbologies:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBarcodeSymbologies, a3);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (void)setQueryID:(unint64_t)a3
{
  self->_queryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBarcodeSymbologies, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_processDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_ciImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_inProcessAnalysis, 0);
  objc_storeStrong((id *)&self->_barcodeSymbologies, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

- (void)initWithImage:orientation:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Analysis request with an image, but the provided image is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCIImage:orientation:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Analysis request with a CIImage, but the provided CIImage is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCGImage:orientation:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Analysis request with a CGImage, but the provided CGImageRef is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCVPixelBuffer:orientation:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Analysis request with a CVPixelBuffer, but the provided CVPixelBufferRef is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithLocalIdentifier:photoLibraryURL:pixelBuffer:orientation:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Photos Analysis request with a CVPixelBuffer, but the provided CVPixelBufferRef is NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithImageURL:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Analysis request with a URL, but the provided URL in nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithView:requestType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2E0D000, v0, v1, "Trying to create an Analysis request with a View, but the provided View in nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tempPixelBufferRef
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2E0D000, a2, OS_LOG_TYPE_ERROR, "Unable to create CVPixelBuffer for request: %@", (uint8_t *)&v2, 0xCu);
}

@end
