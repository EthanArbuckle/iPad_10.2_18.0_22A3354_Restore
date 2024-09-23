@implementation _PXVisualIntelligenceRequest

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 requestID:(int)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  _PXVisualIntelligenceRequest *v11;
  _PXVisualIntelligenceRequest *v12;
  uint64_t v13;
  id resultHandler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_PXVisualIntelligenceRequest;
  v11 = -[_PXVisualIntelligenceRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    v12->_requestID = a4;
    v13 = objc_msgSend(v10, "copy");
    resultHandler = v12->_resultHandler;
    v12->_resultHandler = (id)v13;

  }
  return v12;
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 image:(id)a4 requestID:(int)a5 resultHandler:(id)a6
{
  uint64_t v7;
  id v11;
  _PXVisualIntelligenceRequest *v12;
  _PXVisualIntelligenceRequest *v13;

  v7 = *(_QWORD *)&a5;
  v11 = a4;
  v12 = -[_PXVisualIntelligenceRequest initWithAsset:requestID:resultHandler:](self, "initWithAsset:requestID:resultHandler:", a3, v7, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_image, a4);

  return v13;
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(int64_t)a5 requestID:(int)a6 resultHandler:(id)a7
{
  _PXVisualIntelligenceRequest *v9;

  v9 = -[_PXVisualIntelligenceRequest initWithAsset:requestID:resultHandler:](self, "initWithAsset:requestID:resultHandler:", a3, *(_QWORD *)&a6, a7);
  if (v9)
  {
    v9->_pixelBuffer = CVPixelBufferRetain(a4);
    v9->_cgImageOrPixelBufferOrientation = a5;
  }
  return v9;
}

- (_PXVisualIntelligenceRequest)initWithAsset:(id)a3 cgImage:(CGImage *)a4 orientation:(int64_t)a5 requestID:(int)a6 resultHandler:(id)a7
{
  _PXVisualIntelligenceRequest *v9;

  v9 = -[_PXVisualIntelligenceRequest initWithAsset:requestID:resultHandler:](self, "initWithAsset:requestID:resultHandler:", a3, *(_QWORD *)&a6, a7);
  if (v9)
  {
    v9->_cgImage = CGImageRetain(a4);
    v9->_cgImageOrPixelBufferOrientation = a5;
  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CEE040], "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseCachedResources");

  CVPixelBufferRelease(-[_PXVisualIntelligenceRequest pixelBuffer](self, "pixelBuffer"));
  CGImageRelease(self->_cgImage);
  v4.receiver = self;
  v4.super_class = (Class)_PXVisualIntelligenceRequest;
  -[_PXVisualIntelligenceRequest dealloc](&v4, sel_dealloc);
}

- (VKCImageAnalyzerRequest)vkImageRequest
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  double v6;
  double v7;
  uint64_t v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  int64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGImage *v19;
  int64_t v20;
  int64_t v21;
  id v22;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_PXVisualIntelligenceRequest asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXVisualIntelligenceRequest asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PXVisualIntelligenceManager canRequestVKImageAnalysisForAsset:](PXVisualIntelligenceManager, "canRequestVKImageAnalysisForAsset:", v4);

  if (v5)
  {
    v6 = (double)(unint64_t)objc_msgSend(v3, "pixelWidth");
    v7 = (double)(unint64_t)objc_msgSend(v3, "pixelHeight");
    if ((PLIsSpotlight() & 1) != 0 || PLIsPeopleViewService())
      v8 = -17;
    else
      v8 = -1;
    objc_msgSend(v3, "localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photoLibraryURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DE0]), "initWithLocalIdentifier:photoLibraryURL:imageSize:requestType:", v16, v18, v8, v6, v7);
    objc_msgSend(v15, "setImageSource:", 0);

    goto LABEL_20;
  }
  if (objc_msgSend(v3, "mediaType") == 2)
  {
    v9 = -[_PXVisualIntelligenceRequest pixelBuffer](self, "pixelBuffer");
    if (v9)
    {
      v10 = v9;
      v11 = -[_PXVisualIntelligenceRequest cgImageOrPixelBufferOrientation](self, "cgImageOrPixelBufferOrientation");
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DE0]), "initWithCVPixelBuffer:orientation:requestType:", v10, v11, -1);
    }
    else
    {
      v19 = -[_PXVisualIntelligenceRequest cgImage](self, "cgImage");
      v20 = -[_PXVisualIntelligenceRequest cgImageOrPixelBufferOrientation](self, "cgImageOrPixelBufferOrientation");
      if (v19)
      {
        v21 = v20;
      }
      else
      {
        -[_PXVisualIntelligenceRequest image](self, "image");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = (CGImage *)objc_msgSend(v22, "CGImage");

        if (!v19)
        {
          PLVisualIntelligenceGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            -[_PXVisualIntelligenceRequest asset](self, "asset");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138412290;
            v27 = v25;
            _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "No video frame to make visual image analyze request, asset: %@", (uint8_t *)&v26, 0xCu);

          }
          v15 = 0;
          goto LABEL_19;
        }
        v21 = 0;
      }
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DE0]), "initWithCGImage:orientation:requestType:", v19, v21, -1);
    }
    v15 = (void *)v12;
LABEL_19:
    objc_msgSend(v15, "setImageSource:", 2);
    goto LABEL_20;
  }
  PLVisualIntelligenceGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[_PXVisualIntelligenceRequest asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = v14;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Must be PHAsset of image (excludes GIF) or LivePhoto to make visual image analyze request, asset: %@", (uint8_t *)&v26, 0xCu);

  }
  v15 = 0;
LABEL_20:

  return (VKCImageAnalyzerRequest *)v15;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (int)requestID
{
  return self->_requestID;
}

- (UIImage)image
{
  return self->_image;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CGImage)cgImage
{
  return self->_cgImage;
}

- (int64_t)cgImageOrPixelBufferOrientation
{
  return self->_cgImageOrPixelBufferOrientation;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (int)vkRequestID
{
  return self->_vkRequestID;
}

- (void)setVkRequestID:(int)a3
{
  self->_vkRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
