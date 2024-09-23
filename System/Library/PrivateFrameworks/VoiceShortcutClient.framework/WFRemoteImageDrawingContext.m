@implementation WFRemoteImageDrawingContext

- (WFRemoteImageDrawingContext)initWithAlphaOnlyImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5
{
  return -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:](self, "initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:", a3, 0, 0, 0, 1, a4.width, a4.height, a5);
}

- (WFRemoteImageDrawingContext)initWithImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5 colorSpace:(CGColorSpace *)a6
{
  return -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:](self, "initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:", a3, a6, 0, 0, 0, a4.width, a4.height, a5);
}

- (WFRemoteImageDrawingContext)initWithImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5 colorSpace:(CGColorSpace *)a6 buffer:(void *)a7 bufferSize:(unint64_t)a8 drawAlphaOnly:(BOOL)a9
{
  double height;
  CGFloat width;
  WFRemoteImageDrawingContext *v19;
  double *v20;
  double v21;
  CGColorSpaceRef v22;
  WFRemoteImageDrawingContext *v23;
  void *v25;
  void *v26;
  objc_super v27;

  height = a4.height;
  width = a4.width;
  if (a4.width <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteImageDrawingContext.m"), 67, CFSTR("Image width should be greater than 0"));

  }
  if (height <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteImageDrawingContext.m"), 68, CFSTR("Image height should be greater than 0"));

  }
  v27.receiver = self;
  v27.super_class = (Class)WFRemoteImageDrawingContext;
  v19 = -[WFRemoteImageDrawingContext init](&v27, sel_init);
  v20 = (double *)v19;
  if (!v19)
    goto LABEL_15;
  v19->_imageCount = a3;
  v19->_singleImageSize.width = width;
  v19->_singleImageSize.height = height;
  if (a5 <= 0.0)
  {
    -[WFRemoteImageDrawingContext screenScale](v19, "screenScale");
    a5 = v21;
  }
  v20[3] = a5;
  if (a6)
    v22 = CGColorSpaceRetain(a6);
  else
    v22 = 0;
  *((_QWORD *)v20 + 4) = v22;
  *((_BYTE *)v20 + 8) = a9;
  if (!a7)
  {
    if (objc_msgSend(v20, "allocateSharedBuffer"))
      goto LABEL_14;
LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
  *((_QWORD *)v20 + 6) = a7;
  *((_QWORD *)v20 + 7) = a8;
LABEL_14:
  v23 = v20;
LABEL_16:

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WFRemoteImageDrawingContext buffer](self, "buffer"))
    munmap(-[WFRemoteImageDrawingContext buffer](self, "buffer"), -[WFRemoteImageDrawingContext bufferSize](self, "bufferSize"));
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)WFRemoteImageDrawingContext;
  -[WFRemoteImageDrawingContext dealloc](&v3, sel_dealloc);
}

- (unint64_t)numberOfComponents
{
  if (-[WFRemoteImageDrawingContext colorSpace](self, "colorSpace"))
    return CGColorSpaceGetNumberOfComponents(-[WFRemoteImageDrawingContext colorSpace](self, "colorSpace")) + 1;
  else
    return 1;
}

- (unsigned)bitmapInfo
{
  if (-[WFRemoteImageDrawingContext drawAlphaOnly](self, "drawAlphaOnly"))
    return 7;
  else
    return 1;
}

- (double)screenScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "doubleValue");
  if (v3 <= 0.0)
    v4 = 1.0;
  else
    v4 = v3;

  return v4;
}

- (unint64_t)sizePerImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[WFRemoteImageDrawingContext singleImageSize](self, "singleImageSize");
  v4 = v3;
  -[WFRemoteImageDrawingContext scale](self, "scale");
  v6 = v4 * v5;
  -[WFRemoteImageDrawingContext singleImageSize](self, "singleImageSize");
  v8 = v7;
  -[WFRemoteImageDrawingContext scale](self, "scale");
  return (unint64_t)(v6
                          * (v8
                           * v9)
                          * (double)-[WFRemoteImageDrawingContext numberOfComponents](self, "numberOfComponents"));
}

- (BOOL)allocateSharedBuffer
{
  BOOL v3;
  unint64_t v4;
  memory_object_size_t v5;
  vm_map_t *v6;
  kern_return_t memory_entry_64;
  void (**v8)(_QWORD);
  void *v9;
  NSObject *v10;
  NSObject *v11;
  kern_return_t v12;
  kern_return_t v14;
  void *v15;
  NSObject *v16;
  memory_object_size_t v17;
  void *v18;
  _QWORD aBlock[4];
  mach_port_t v20;
  mach_vm_address_t address;
  memory_object_size_t size;
  mach_port_t object_handle;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  memory_object_size_t v27;
  __int16 v28;
  memory_object_size_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[WFRemoteImageDrawingContext buffer](self, "buffer"))
  {
    v4 = -[WFRemoteImageDrawingContext sizePerImage](self, "sizePerImage");
    v5 = -[WFRemoteImageDrawingContext imageCount](self, "imageCount") * v4;
    object_handle = 0;
    address = 0;
    size = v5;
    v6 = (vm_map_t *)MEMORY[0x1E0C83DA0];
    memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x1E0C83DA0], &size, 0, 139267, &object_handle, 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFRemoteImageDrawingContext_allocateSharedBuffer__block_invoke;
    aBlock[3] = &__block_descriptor_36_e5_v8__0l;
    v20 = object_handle;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (memory_entry_64)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2D98], memory_entry_64, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getWFVoiceShortcutClientLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
        v26 = 2112;
        v27 = (memory_object_size_t)v9;
        _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_FAULT, "%s Could not make memory entry for remote image drawing: %@", buf, 0x16u);
      }
    }
    else
    {
      if (size < v5)
      {
        getWFVoiceShortcutClientLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
          v26 = 2048;
          v27 = v5;
          v28 = 2048;
          v29 = size;
          _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_FAULT, "%s Could not make memory entry of requested size for remote image drawing (expecting %lu bytes, got %llu bytes)", buf, 0x20u);
        }

        goto LABEL_15;
      }
      v12 = mach_vm_map(*v6, &address, size, 0, 1, object_handle, 0, 0, 3, 3, 1u);
      if (!v12)
      {
        v14 = mach_memory_entry_ownership(object_handle, *v6, 4, 0);
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2D98], v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          getWFVoiceShortcutClientLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
            v26 = 2114;
            v27 = (memory_object_size_t)v15;
            _os_log_impl(&dword_1AF681000, v16, OS_LOG_TYPE_ERROR, "%s Could not move memory entry to the graphics ledger for remote image drawing: %{public}@. We're proceeding - this is not a blocking error.", buf, 0x16u);
          }

        }
        v17 = size;
        self->_buffer = (void *)address;
        self->_bufferSize = v17;
        v18 = -[WFRemoteImageDrawingContext buffer](self, "buffer");
        bzero(v18, size);
        v3 = 1;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2D98], v12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getWFVoiceShortcutClientLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
        v26 = 2112;
        v27 = (memory_object_size_t)v9;
        _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_FAULT, "%s Could not map memory entry for remote image drawing: %@", buf, 0x16u);
      }
    }

LABEL_15:
    v3 = 0;
LABEL_16:
    v8[2](v8);

    return v3;
  }
  return 1;
}

- (CGImage)imageAtIndex:(unint64_t)a3
{
  const void *v6;
  CGImage *v7;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (-[WFRemoteImageDrawingContext imageCount](self, "imageCount") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteImageDrawingContext.m"), 183, CFSTR("Index %lu must be in bounds (0..%lu)"), a3, -[WFRemoteImageDrawingContext imageCount](self, "imageCount"));

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__WFRemoteImageDrawingContext_imageAtIndex___block_invoke;
  v10[3] = &unk_1E5FC7CE0;
  v10[4] = &v11;
  -[WFRemoteImageDrawingContext accessBitmapContextForImageAtIndex:accessBlock:](self, "accessBitmapContextForImageAtIndex:accessBlock:", a3, v10);
  v6 = (const void *)v12[3];
  if (v6)
    v7 = (CGImage *)CFAutorelease(v6);
  else
    v7 = 0;
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (void)accessBitmapContextForImageAtIndex:(unint64_t)a3 accessBlock:(id)a4
{
  void (**v7)(id, CGContext *);
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  size_t v13;
  double v14;
  double v15;
  double v16;
  CGContextRef v17;
  CGContext *v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  void *v24;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, CGContext *))a4;
  if (-[WFRemoteImageDrawingContext imageCount](self, "imageCount") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteImageDrawingContext.m"), 199, CFSTR("Index %lu must be in bounds (0..%lu)"), a3, -[WFRemoteImageDrawingContext imageCount](self, "imageCount"));

  }
  v8 = -[WFRemoteImageDrawingContext sizePerImage](self, "sizePerImage");
  v9 = -[WFRemoteImageDrawingContext buffer](self, "buffer") + v8 * a3;
  -[WFRemoteImageDrawingContext singleImageSize](self, "singleImageSize");
  v11 = v10;
  -[WFRemoteImageDrawingContext scale](self, "scale");
  v13 = (unint64_t)(v11 * v12);
  -[WFRemoteImageDrawingContext singleImageSize](self, "singleImageSize");
  v15 = v14;
  -[WFRemoteImageDrawingContext scale](self, "scale");
  v17 = CGBitmapContextCreate(v9, v13, (unint64_t)(v15 * v16), 8uLL, -[WFRemoteImageDrawingContext numberOfComponents](self, "numberOfComponents") * v13, -[WFRemoteImageDrawingContext colorSpace](self, "colorSpace"), -[WFRemoteImageDrawingContext bitmapInfo](self, "bitmapInfo"));
  if (v17)
  {
    v18 = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__WFRemoteImageDrawingContext_accessBitmapContextForImageAtIndex_accessBlock___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v17;
    v19 = (uint64_t)_Block_copy(aBlock);
    -[WFRemoteImageDrawingContext scale](self, "scale");
    v21 = v20;
    -[WFRemoteImageDrawingContext scale](self, "scale");
    CGContextScaleCTM(v18, v21, -v22);
    -[WFRemoteImageDrawingContext singleImageSize](self, "singleImageSize");
    CGContextTranslateCTM(v18, 0.0, -v23);
    v7[2](v7, v18);
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[WFRemoteImageDrawingContext accessBitmapContextForImageAtIndex:accessBlock:]";
      v28 = 2048;
      v29 = a3;
      _os_log_impl(&dword_1AF681000, (os_log_t)v19, OS_LOG_TYPE_FAULT, "%s Shared bitmap context is nil at index %lu", buf, 0x16u);
    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  xpc_object_t v6;
  CGColorSpace *Name;
  void *v8;
  CGColorSpace *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteImageDrawingContext.m"), 234, CFSTR("Attempting to encode %@ with a non-XPC coder--this is not allowed"), v15);

  }
  v6 = xpc_shmem_create(-[WFRemoteImageDrawingContext buffer](self, "buffer"), -[WFRemoteImageDrawingContext imageCount](self, "imageCount")* -[WFRemoteImageDrawingContext sizePerImage](self, "sizePerImage"));
  Name = -[WFRemoteImageDrawingContext colorSpace](self, "colorSpace");
  if (Name)
    Name = (CGColorSpace *)CGColorSpaceGetName(-[WFRemoteImageDrawingContext colorSpace](self, "colorSpace"));
  v8 = (void *)MEMORY[0x1E0CB3B18];
  v9 = Name;
  objc_msgSend(v8, "valueWithBytes:objCType:", &self->_singleImageSize, "{CGSize=dd}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v16;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  -[WFRemoteImageDrawingContext scale](self, "scale");
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("scale"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[WFRemoteImageDrawingContext imageCount](self, "imageCount"), CFSTR("imageCount"));
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("singleImageSize"));
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("colorSpace"));

  objc_msgSend(v12, "encodeBool:forKey:", -[WFRemoteImageDrawingContext drawAlphaOnly](self, "drawAlphaOnly"), CFSTR("drawAlphaOnly"));
  objc_msgSend(v12, "encodeXPCObject:forKey:", v6, CFSTR("sharedMemory"));

}

- (WFRemoteImageDrawingContext)initWithCoder:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  size_t v16;
  size_t v17;
  CGColorSpaceRef v18;
  NSObject *v19;
  const char *v20;
  WFRemoteImageDrawingContext *v21;
  void *v23;
  objc_class *v24;
  void *v25;
  void *region;
  _BYTE buf[22];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteImageDrawingContext.m"), 252, CFSTR("Attempting to decode %@ with a non-XPC coder--this is not allowed"), v25);

  }
  v6 = v5;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "decodeDoubleForKey:", CFSTR("scale"));
  v10 = v9;
  v11 = objc_msgSend(v8, "decodeIntForKey:", CFSTR("imageCount"));
  objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("singleImageSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorSpace"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "decodeBoolForKey:", CFSTR("drawAlphaOnly"));
  region = 0;
  objc_msgSend(v8, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81388], CFSTR("sharedMemory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    getWFVoiceShortcutClientLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFRemoteImageDrawingContext initWithCoder:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("sharedMemory");
      v20 = "%s Could not find shmem for key: %{public}@";
LABEL_16:
      _os_log_impl(&dword_1AF681000, v19, OS_LOG_TYPE_FAULT, v20, buf, 0x16u);
    }
LABEL_17:

    v21 = 0;
    goto LABEL_20;
  }
  v16 = xpc_shmem_map(v15, &region);
  if (!v16)
  {
    getWFVoiceShortcutClientLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFRemoteImageDrawingContext initWithCoder:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      v20 = "%s Could not map shared memory, mapped drawing buffer size is %llu";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v17 = v16;
  if (v13)
    v18 = CGColorSpaceCreateWithName(v13);
  else
    v18 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E0C9D820];
  objc_msgSend(v12, "getValue:size:", buf, 16);
  self = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:](self, "initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:", v11, v18, region, v17, v14, *(double *)buf, *(double *)&buf[8], v10);
  v21 = self;
LABEL_20:

  return v21;
}

- (unint64_t)imageCount
{
  return self->_imageCount;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)singleImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_singleImageSize.width;
  height = self->_singleImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)drawAlphaOnly
{
  return self->_drawAlphaOnly;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (void)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

void __78__WFRemoteImageDrawingContext_accessBitmapContextForImageAtIndex_accessBlock___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

CGImageRef __44__WFRemoteImageDrawingContext_imageAtIndex___block_invoke(uint64_t a1, CGContextRef context)
{
  CGImageRef result;

  result = CGBitmapContextCreateImage(context);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __51__WFRemoteImageDrawingContext_allocateSharedBuffer__block_invoke(uint64_t result)
{
  mach_port_name_t v1;

  v1 = *(_DWORD *)(result + 32);
  if (v1)
    return mach_port_deallocate(*MEMORY[0x1E0C83DA0], v1);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
