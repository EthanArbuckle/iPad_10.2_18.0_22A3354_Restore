@implementation PXPhotosensitivityProcessing

- (PXPhotosensitivityProcessing)init
{
  PXPhotosensitivityProcessing *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosensitivityProcessing;
  result = -[PXPhotosensitivityProcessing init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_lock_pool);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosensitivityProcessing;
  -[PXPhotosensitivityProcessing dealloc](&v3, sel_dealloc);
}

- (PSEVideoProcessor)lock_processor
{
  PSEVideoProcessor *lock_processor;
  NSObject *v4;
  PSEVideoProcessor *v5;
  PSEVideoProcessor *v6;
  uint8_t v8[16];

  os_unfair_lock_assert_owner(&self->_lock);
  lock_processor = self->_lock_processor;
  if (!lock_processor)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "PXPhotosensitivityProcessing creating PSEVideoProcessor for dimming flashing lights", v8, 2u);
    }

    v5 = (PSEVideoProcessor *)objc_alloc_init(MEMORY[0x1E0D7D280]);
    v6 = self->_lock_processor;
    self->_lock_processor = v5;

    lock_processor = self->_lock_processor;
  }
  return lock_processor;
}

- (__CVBuffer)copyAndProcessPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  os_unfair_lock_s *p_lock;
  __CVBuffer *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[PXPhotosensitivityProcessing _lock_processPixelBuffer:timestamp:](self, "_lock_processPixelBuffer:timestamp:", a3, a4);
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (__CVBuffer)_lock_processPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  IOSurfaceRef IOSurface;
  IOSurfaceRef v8;
  NSObject *v9;
  double Width;
  __CVPixelBufferPool *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __CVBuffer *v15;
  IOSurfaceRef v17;
  IOSurfaceRef v18;
  const __CFDictionary *v19;
  __int16 v20;
  _BYTE pixelBufferOut[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend(MEMORY[0x1E0D7D280], "needsProcessing") & 1) != 0
    || -[PXPhotosensitivityProcessing forceEnable](self, "forceEnable"))
  {
    IOSurface = CVPixelBufferGetIOSurface(a3);
    if (!IOSurface)
    {
      PLUIGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pixelBufferOut = 138412290;
        *(_QWORD *)&pixelBufferOut[4] = a3;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "PXPhotosensitivityProcessing unable to get surface from %@", pixelBufferOut, 0xCu);
      }
      goto LABEL_17;
    }
    v8 = IOSurface;
    -[PXPhotosensitivityProcessing lock_processor](self, "lock_processor");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject canProcessSurface:](v9, "canProcessSurface:", v8) & 1) == 0)
    {
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pixelBufferOut = 138412290;
        *(_QWORD *)&pixelBufferOut[4] = v8;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "PXPhotosensitivityProcessing cannot process surface %@", pixelBufferOut, 0xCu);
      }
      goto LABEL_16;
    }
    Width = (double)CVPixelBufferGetWidth(a3);
    v11 = -[PXPhotosensitivityProcessing _lock_poolForSize:](self, "_lock_poolForSize:", Width, (double)CVPixelBufferGetHeight(a3));
    if (v11)
    {
      *(_QWORD *)pixelBufferOut = 0;
      if (!CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, (CVPixelBufferRef *)pixelBufferOut))
      {
        v17 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)pixelBufferOut);
        if (v17)
        {
          v18 = v17;
          v19 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
          CVBufferSetAttachments(*(CVBufferRef *)pixelBufferOut, v19, kCVAttachmentMode_ShouldPropagate);
          CFRelease(v19);
          -[NSObject processSourceSurface:withTimestamp:toDestinationSurface:options:](v9, "processSourceSurface:withTimestamp:toDestinationSurface:options:", v8, v18, &unk_1E53EFFA8, a4);
          v15 = *(__CVBuffer **)pixelBufferOut;
          goto LABEL_18;
        }
        PXAssertGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          goto LABEL_16;
        v20 = 0;
        v13 = "PXPhotosensitivityProcessing unable to retrieve IOSurface from created pixelBuffer";
        goto LABEL_9;
      }
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v20 = 0;
        v13 = "PXPhotosensitivityProcessing unable to create buffer for photosensitivity processing";
LABEL_9:
        v14 = (uint8_t *)&v20;
LABEL_25:
        _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, v13, v14, 2u);
      }
    }
    else
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)pixelBufferOut = 0;
        v13 = "PXPhotosensitivityProcessing unable to create pixel buffer pool for photosensitivity processing";
        v14 = pixelBufferOut;
        goto LABEL_25;
      }
    }
LABEL_16:

LABEL_17:
    v15 = 0;
LABEL_18:

    return v15;
  }
  return 0;
}

- (__CVPixelBufferPool)_lock_poolForSize:(CGSize)a3
{
  double height;
  double width;
  __CVPixelBufferPool *lock_pool;
  double v7;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  height = a3.height;
  width = a3.width;
  v15[5] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  lock_pool = self->_lock_pool;
  v7 = self->_lock_poolSize.height;
  if (self->_lock_poolSize.width != width || v7 != height)
  {
    if (lock_pool)
    {
      CVPixelBufferPoolRelease(self->_lock_pool);
      self->_lock_pool = 0;
    }
    self->_lock_poolSize.width = width;
    self->_lock_poolSize.height = height;
    v9 = *MEMORY[0x1E0CA8FF0];
    v14[0] = *MEMORY[0x1E0CA9010];
    v14[1] = v9;
    v15[0] = MEMORY[0x1E0C9AAB0];
    v15[1] = MEMORY[0x1E0C9AA70];
    v14[2] = *MEMORY[0x1E0CA90E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    v14[3] = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = *MEMORY[0x1E0CA9040];
    v15[3] = v11;
    v15[4] = &unk_1E53EB1C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v12, &self->_lock_pool);
    lock_pool = self->_lock_pool;

  }
  return lock_pool;
}

- (BOOL)forceEnable
{
  return self->_forceEnable;
}

- (void)setForceEnable:(BOOL)a3
{
  self->_forceEnable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_processor, 0);
}

+ (BOOL)isSupported
{
  return 1;
}

@end
