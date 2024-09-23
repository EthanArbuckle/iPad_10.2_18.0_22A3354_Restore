@implementation VKCRemoveBackgroundRequest

- (VKCRemoveBackgroundRequest)initWithPhotosAnalyzerRequest:(id)a3
{
  id v5;
  VKCRemoveBackgroundRequest *v6;
  VKCRemoveBackgroundRequest *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKCRemoveBackgroundRequest;
  v6 = -[VKCRemoveBackgroundRequest init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v7->_requestID = -1;
    objc_storeStrong((id *)&v7->_photosRequest, a3);
  }

  return v7;
}

+ (VKCRemoveBackgroundRequest)requestWithImage:(CGImage *)a3 orientation:(int64_t)a4 canResize:(BOOL)a5
{
  _BOOL4 v5;
  CGImage *v7;
  double Width;
  double v9;
  NSObject *v11;
  NSObject *v12;
  CGImageRef ScaledCGImage;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v5 = a5;
  v7 = a3;
  Width = (double)CGImageGetWidth(a3);
  v9 = Width * (double)CGImageGetHeight(v7);
  if (v9 > 12582912.0 && v5)
  {
    _VKSignpostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Resize", (const char *)&unk_1D2EDB5E1, buf, 2u);
    }

    v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D2E0D000, v12, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit Remove Background Resize\", v19, 2u);
    }

    ScaledCGImage = vk_createScaledCGImage(v7, floor(sqrt(12582912.0 / v9) * 100.0) / 100.0);
    v7 = ScaledCGImage;
    if (ScaledCGImage)
      CFAutorelease(ScaledCGImage);
    _VKSignpostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Resize", (const char *)&unk_1D2EDB5E1, v18, 2u);
    }

    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_INFO, "Signpost End: \"VisionKit Remove Background Resize\", v17, 2u);
    }

  }
  return -[VKCRemoveBackgroundRequest initWithCGImage:orientation:]([VKCRemoveBackgroundRequest alloc], "initWithCGImage:orientation:", v7, a4);
}

- (VKCRemoveBackgroundRequest)initWithCGImage:(CGImage *)a3 orientation:(int64_t)a4
{
  VKCRemoveBackgroundRequest *v6;
  VKCRemoveBackgroundRequest *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  size_t Width;
  size_t Height;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKCRemoveBackgroundRequest;
  v6 = -[VKCRemoveBackgroundRequest init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v7->_requestID = -1;
    v7->_CGImage = CGImageRetain(a3);
    v7->_imageOrientation = a4;
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    v7->_size.width = (double)Width;
    v7->_size.height = (double)Height;
  }
  return v7;
}

- (VKCRemoveBackgroundRequest)initWithCGImage:(CGImage *)a3
{
  return -[VKCRemoveBackgroundRequest initWithCGImage:orientation:](self, "initWithCGImage:orientation:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)VKCRemoveBackgroundRequest;
  -[VKCRemoveBackgroundRequest dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  os_unfair_lock_s *p_lock;
  __CVBuffer *pixelBuffer;
  CGColorSpace *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pixelBuffer = self->_pixelBuffer;
  if (!pixelBuffer)
  {
    v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    self->_pixelBuffer = vk_ioSurfaceBackedPixelBufferFromCGImage(-[VKCRemoveBackgroundRequest CGImage](self, "CGImage"), v5);
    CGColorSpaceRelease(v5);
    pixelBuffer = self->_pixelBuffer;
  }
  os_unfair_lock_unlock(p_lock);
  return pixelBuffer;
}

- (int)MADRequestID
{
  VKCRemoveBackgroundRequest *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_requestID;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setMADRequestID:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_requestID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)createMADRequest
{
  if (-[VKCRemoveBackgroundRequest maskOnly](self, "maskOnly"))
    -[VKCRemoveBackgroundRequest _createMADMaskRequest](self);
  else
    -[VKCRemoveBackgroundRequest _createMADMatteRequest](self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createMADMaskRequest
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D47750]);
    objc_msgSend(a1, "VIImageType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setImageType:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_createMADMatteRequest
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  v2 = objc_alloc_init(MEMORY[0x1E0D47760]);
  objc_msgSend(a1, "VIImageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageType:", v3);

  objc_msgSend(v2, "setCropResult:", objc_msgSend(a1, "cropToFit"));
  if (objc_msgSend(a1, "performInPlace"))
  {
    if (!objc_msgSend(a1, "cropToFit"))
    {
      v5 = 1;
      goto LABEL_9;
    }
    v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[VKCRemoveBackgroundRequest _createMADMatteRequest].cold.1(v4);

  }
  v5 = 0;
LABEL_9:
  objc_msgSend(v2, "setInPlace:", v5);
  objc_msgSend(a1, "selectedIndexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInstances:", v6);

  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VKCRemoveBackgroundRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCRemoveBackgroundRequest size](self, "size");
  VKMUIStringForSize(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKCRemoveBackgroundRequest cropToFit](self, "cropToFit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKCRemoveBackgroundRequest maskOnly](self, "maskOnly"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RemoveBGRequest id: %@\n size: %@\n cropToFit: %@\n maskOnly: %@"), v4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (BOOL)cropToFit
{
  return self->_cropToFit;
}

- (void)setCropToFit:(BOOL)a3
{
  self->_cropToFit = a3;
}

- (BOOL)maskOnly
{
  return self->_maskOnly;
}

- (void)setMaskOnly:(BOOL)a3
{
  self->_maskOnly = a3;
}

- (NSIndexSet)selectedIndexSet
{
  return self->_selectedIndexSet;
}

- (void)setSelectedIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexSet, a3);
}

- (NSNumber)VIImageType
{
  return self->_VIImageType;
}

- (void)setVIImageType:(id)a3
{
  objc_storeStrong((id *)&self->_VIImageType, a3);
}

- (VKCImageAnalyzerRequest)photosRequest
{
  return self->_photosRequest;
}

- (BOOL)performInPlace
{
  return self->_performInPlace;
}

- (void)setPerformInPlace:(BOOL)a3
{
  self->_performInPlace = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(id)a3
{
  objc_storeStrong((id *)&self->_animatedStickerScore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_VIImageType, 0);
  objc_storeStrong((id *)&self->_selectedIndexSet, 0);
  objc_storeStrong((id *)&self->_photosRequest, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_createMADMatteRequest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_ERROR, "Trying to perform a remove background request with performInPlace and cropToFit set to true, this is not support, falling back to just cropToFit", v1, 2u);
}

@end
