@implementation CRImage_PixelBuffer

- (unint64_t)height
{
  return CVPixelBufferGetHeight(-[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"));
}

- (unint64_t)width
{
  return CVPixelBufferGetWidth(-[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"));
}

- (__CVBuffer)pixelBuffer
{
  return self->super._pixelBuffer;
}

- (CRImage_PixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  CRImage_PixelBuffer *v4;
  id v6;
  objc_super v7;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempting to initialize CRImage_PixelBuffer with nil CVPixelBufferRef"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CRImage_PixelBuffer;
  v4 = -[CRImage init](&v7, sel_init);
  if (v4)
    v4->super._pixelBuffer = CVPixelBufferRetain(a3);
  return v4;
}

- (CRImage_PixelBuffer)initWithContentsOfURL:(id)a3 toColorSpace:(int)a4
{
  id v6;
  CRImage_PixelBuffer *v7;
  CRImage_PixelBuffer *v8;
  CRImage_PixelBuffer *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 2)
  {
    v12.receiver = self;
    v12.super_class = (Class)CRImage_PixelBuffer;
    v7 = -[CRImage init](&v12, sel_init);
    v8 = v7;
    if (v7)
      v7->super._pixelBuffer = -[CRImage_PixelBuffer _pixelBufferFromUrl:](v7, "_pixelBufferFromUrl:", v6);
    self = v8;
    v9 = self;
  }
  else
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = a4;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_ERROR, "[CRImage_PixelBuffer initWithContentsOfURL:toColorSpace:] Unsupported colorspace: %d ", buf, 8u);
    }

    v9 = 0;
  }

  return v9;
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7
{
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", a5, a6, *(_QWORD *)&a7, 0, 0, a3, a4.width, a4.height);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7 hardwareAcceleration:(BOOL)a8 toSurface:(__IOSurface *)a9
{
  _BOOL4 v10;
  double height;
  double width;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  OSType PixelFormatType;
  const __CFAllocator *v22;
  CRImage_PixelBuffer *v23;
  __IOSurface *IOSurface;
  const void *v25;
  const void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  OpaqueVTPixelTransferSession *v35;
  __CVBuffer *v36;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v40[2];
  _QWORD v41[3];
  CGSize v42;

  v10 = a8;
  height = a4.height;
  width = a4.width;
  v41[2] = *MEMORY[0x1E0C80C00];
  if (*a9)
  {
    v17 = -[CRImage_PixelBuffer width](self, "width", a5, a6);
    v18 = -[CRImage_PixelBuffer height](self, "height");
    v19 = *MEMORY[0x1E0CA8F70];
    v40[0] = *MEMORY[0x1E0CA8F78];
    v40[1] = v19;
    v41[0] = MEMORY[0x1E0C9AAB0];
    v41[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    PixelFormatType = CVPixelBufferGetPixelFormatType(-[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"));
    pixelBufferOut = 0;
    v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *a9, v20, &pixelBufferOut))
    {
      v23 = 0;
    }
    else
    {
      pixelTransferSessionOut = 0;
      VTPixelTransferSessionCreate(v22, &pixelTransferSessionOut);
      v25 = (const void *)*MEMORY[0x1E0C9AE50];
      if (v10)
        v26 = (const void *)*MEMORY[0x1E0C9AE50];
      else
        v26 = (const void *)*MEMORY[0x1E0C9AE40];
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED800], v26);
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED7F8], v26);
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB30]);
      v27 = (unint64_t)((double)v17 * a3);
      v28 = (unint64_t)((double)v18 * a3);
      v29 = (unint64_t)height;
      if (v27 >= (unint64_t)width)
        v27 = (unint64_t)width;
      if (v28 >= v29)
        v28 = (unint64_t)height;
      v30 = (double)v27;
      v31 = (double)v28;
      if (a5)
      {
        a5->width = v30;
        a5->height = v31;
      }
      v42.width = (double)(unint64_t)width;
      v42.height = (double)v29;
      v32 = 0;
      v33 = 0;
      createPixelBufferCLAPDictionaryFromRect(v42, *(CGRect *)(&v30 - 2));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED7B8], v34);
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED868], v25);
      v35 = pixelTransferSessionOut;
      v36 = -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer");
      VTPixelTransferSessionTransferImage(v35, v36, pixelBufferOut);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      CFRelease(pixelTransferSessionOut);
      if (PixelFormatType == a7)
        v23 = (CRImage_PixelBuffer *)pixelBufferOut;
      else
        v23 = 0;

    }
  }
  else
  {
    v23 = -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", a5, a6, *(_QWORD *)&a7, a8, 1, a3, a4.width, a4.height);
    IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)v23);
    *a9 = IOSurface;
    CFRetain(IOSurface);
  }
  return v23;
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7 hardwareAcceleration:(BOOL)a8 iosurfaceBacking:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  double width;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  OSType PixelFormatType;
  unint64_t v24;
  unint64_t v25;
  const __CFAllocator *v26;
  __CVBuffer *v27;
  const void *v28;
  const void *v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  OpaqueVTPixelTransferSession *v37;
  __CVBuffer *v38;
  unsigned int v40;
  unsigned int v41;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v44[2];
  _QWORD v45[3];
  CGSize v46;

  v9 = a9;
  v10 = a8;
  height = a4.height;
  width = a4.width;
  v45[2] = *MEMORY[0x1E0C80C00];
  v17 = -[CRImage_PixelBuffer width](self, "width", a5, a6);
  v18 = -[CRImage_PixelBuffer height](self, "height");
  v19 = (void *)MEMORY[0x1E0C99E08];
  v20 = *MEMORY[0x1E0CA8F70];
  v44[0] = *MEMORY[0x1E0CA8F78];
  v44[1] = v20;
  v45[0] = MEMORY[0x1E0C9AAB0];
  v45[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v22, "setObject:forKey:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
  PixelFormatType = CVPixelBufferGetPixelFormatType(-[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer", __PAIR64__(a7, v9)));
  v24 = (unint64_t)width;
  v25 = (unint64_t)height;
  pixelBufferOut = 0;
  v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)width, (unint64_t)height, PixelFormatType, (CFDictionaryRef)v22, &pixelBufferOut))
  {
    v27 = 0;
  }
  else
  {
    pixelTransferSessionOut = 0;
    VTPixelTransferSessionCreate(v26, &pixelTransferSessionOut);
    v28 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v10)
      v29 = (const void *)*MEMORY[0x1E0C9AE50];
    else
      v29 = (const void *)*MEMORY[0x1E0C9AE40];
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED800], v29);
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED7F8], v29);
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB30]);
    v30 = (unint64_t)((double)v17 * a3);
    v31 = (unint64_t)((double)v18 * a3);
    if (v30 >= v24)
      v30 = (unint64_t)width;
    if (v31 >= v25)
      v31 = (unint64_t)height;
    v32 = (double)v30;
    v33 = (double)v31;
    if (a5)
    {
      a5->width = v32;
      a5->height = v33;
    }
    v46.width = (double)v24;
    v46.height = (double)v25;
    v34 = 0;
    v35 = 0;
    createPixelBufferCLAPDictionaryFromRect(v46, *(CGRect *)(&v32 - 2));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED7B8], v36);
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E0CED868], v28);
    v37 = pixelTransferSessionOut;
    v38 = -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer");
    VTPixelTransferSessionTransferImage(v37, v38, pixelBufferOut);
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    if (PixelFormatType == v41)
    {
      v27 = pixelBufferOut;
    }
    else
    {
      v27 = +[CRImage_PixelBuffer _convertPixelBuffer:toFormat:iosurfaceBacking:](CRImage_PixelBuffer, "_convertPixelBuffer:toFormat:iosurfaceBacking:", pixelBufferOut, v41, v40);
      CVPixelBufferRelease(pixelBufferOut);
    }

  }
  return (CRImage_PixelBuffer *)v27;
}

- (id)imageByConvertingToColorSpace:(int)a3
{
  return -[CRImage initWithCVPixelBuffer:toColorSpace:forceDataCopy:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:forceDataCopy:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), *(_QWORD *)&a3, 0);
}

- (id)imageByConvertingToColorSpace:(int)a3 forceDataCopy:(BOOL)a4
{
  return -[CRImage initWithCVPixelBuffer:toColorSpace:forceDataCopy:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:forceDataCopy:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), *(_QWORD *)&a3, a4);
}

- (id)imageByCroppingRectangle:(CGRect)a3
{
  return -[CRImage_PixelBuffer imageByCroppingRectangle:iosurfaceBacking:](self, "imageByCroppingRectangle:iosurfaceBacking:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)imageByCroppingRectangle:(CGRect)a3 toSurface:(__IOSurface *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  const __CFDictionary *v11;
  CRImage_PixelBuffer *v12;
  __IOSurface *IOSurface;
  __CVBuffer *v14;
  CRImage_PixelBuffer *v15;
  CVPixelBufferRef texture;
  _QWORD v18[2];
  _QWORD v19[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19[2] = *MEMORY[0x1E0C80C00];
  if (*a4)
  {
    v10 = *MEMORY[0x1E0CA8F70];
    v18[0] = *MEMORY[0x1E0CA8F78];
    v18[1] = v10;
    v19[0] = MEMORY[0x1E0C9AAB0];
    v19[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    texture = 0;
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *a4, v11, &texture))
    {
      v12 = 0;
    }
    else
    {
      v14 = -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer");
      CRCropRectangleFromPixelBuffer(v14, texture, x, y, width, height);
      v15 = [CRImage_PixelBuffer alloc];
      v12 = -[CRImage_PixelBuffer initWithCVPixelBuffer:](v15, "initWithCVPixelBuffer:", texture);
      CVPixelBufferRelease(texture);
    }

  }
  else
  {
    -[CRImage_PixelBuffer imageByCroppingRectangle:iosurfaceBacking:](self, "imageByCroppingRectangle:iosurfaceBacking:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v12 = (CRImage_PixelBuffer *)objc_claimAutoreleasedReturnValue();
    IOSurface = CVPixelBufferGetIOSurface(-[CRImage_PixelBuffer pixelBuffer](v12, "pixelBuffer"));
    *a4 = IOSurface;
    CFRetain(IOSurface);
  }
  return v12;
}

- (id)imageByCroppingRectangle:(CGRect)a3 iosurfaceBacking:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  unint64_t v10;
  unint64_t v11;
  CRImage_PixelBuffer *v12;
  OSType PixelFormatType;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CVBuffer *v18;
  CRImage_PixelBuffer *v19;
  CVPixelBufferRef texture;
  _QWORD v22[2];
  _QWORD v23[3];
  CGRect v24;
  CGRect v25;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = -[CRImage_PixelBuffer width](self, "width");
  v11 = -[CRImage_PixelBuffer height](self, "height");
  v25.size.width = (double)v10;
  v25.size.height = (double)v11;
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (!CGRectEqualToRect(v24, v25) || v4)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(-[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"));
    v14 = (void *)MEMORY[0x1E0C99E08];
    v15 = *MEMORY[0x1E0CA8F70];
    v22[0] = *MEMORY[0x1E0CA8F78];
    v22[1] = v15;
    v23[0] = MEMORY[0x1E0C9AAB0];
    v23[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v17, "setObject:forKey:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
    texture = 0;
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)width, (unint64_t)height, PixelFormatType, (CFDictionaryRef)v17, &texture))
    {
      v12 = 0;
    }
    else
    {
      v18 = -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer");
      CRCropRectangleFromPixelBuffer(v18, texture, x, y, width, height);
      v19 = [CRImage_PixelBuffer alloc];
      v12 = -[CRImage_PixelBuffer initWithCVPixelBuffer:](v19, "initWithCVPixelBuffer:", texture);
      CVPixelBufferRelease(texture);
    }

  }
  else
  {
    v12 = self;
  }
  return v12;
}

- (id)imageByRotating90CW
{
  return -[CRImage_PixelBuffer imageByCorrectingFromOrientation:](self, "imageByCorrectingFromOrientation:", 8);
}

- (id)imageByCorrectingFromOrientation:(unsigned int)a3
{
  size_t v6;
  size_t v7;
  const void *v8;
  const void **v9;
  const __CFDictionary *v10;
  const __CFAllocator *v11;
  OSType PixelFormatType;
  CVReturn v13;
  OpaqueVTPixelRotationSession *v14;
  CRImage_PixelBuffer *v15;
  __CVBuffer *v16;
  CRImage_PixelBuffer *v17;
  CVPixelBufferRef pixelBufferOut;
  VTPixelRotationSessionRef pixelRotationSessionOut;

  if (a3 - 1 <= 1)
    return self;
  v6 = -[CRImage_PixelBuffer width](self, "width");
  v7 = -[CRImage_PixelBuffer height](self, "height");
  v8 = 0;
  if (a3 <= 8)
  {
    if (((1 << a3) & 0x18) != 0)
    {
      v8 = (const void *)*MEMORY[0x1E0CEDA30];
    }
    else
    {
      if (((1 << a3) & 0xC0) != 0)
      {
        v9 = (const void **)MEMORY[0x1E0CEDA40];
        goto LABEL_10;
      }
      if (((1 << a3) & 0x120) != 0)
      {
        v9 = (const void **)MEMORY[0x1E0CEDA38];
LABEL_10:
        v8 = *v9;
        v6 = -[CRImage_PixelBuffer height](self, "height");
        v7 = -[CRImage_PixelBuffer width](self, "width");
      }
    }
  }
  pixelBufferOut = 0;
  pixelRotationSessionOut = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CA8F78], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA8F70], 0);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &pixelRotationSessionOut);
  VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED7A0], v8);
  VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E0CED7F8], (CFTypeRef)*MEMORY[0x1E0C9AE40]);
  PixelFormatType = CVPixelBufferGetPixelFormatType(-[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"));
  v13 = CVPixelBufferCreate(v11, v6, v7, PixelFormatType, v10, &pixelBufferOut);
  v14 = pixelRotationSessionOut;
  if (v13)
  {
    CFRelease(pixelRotationSessionOut);
    v15 = 0;
  }
  else
  {
    v16 = -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer");
    VTPixelRotationSessionRotateImage(v14, v16, pixelBufferOut);
    VTPixelRotationSessionInvalidate(pixelRotationSessionOut);
    CFRelease(pixelRotationSessionOut);
    v17 = [CRImage_PixelBuffer alloc];
    v15 = -[CRImage_PixelBuffer initWithCVPixelBuffer:](v17, "initWithCVPixelBuffer:", pixelBufferOut);
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v15;
}

- (vImage_Buffer)vImage
{
  CRImage *v4;
  vImage_Buffer *result;
  CRImage *v6;

  v4 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  v6 = v4;
  if (v4)
  {
    -[CRImage vImage](v4, "vImage");
  }
  else
  {
    *(_OWORD *)&retstr->data = 0u;
    *(_OWORD *)&retstr->width = 0u;
  }

  return result;
}

- (CGImage)cgImage
{
  CRImage *v2;
  CGImage *v3;

  v2 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  v3 = -[CRImage cgImage](v2, "cgImage");

  return v3;
}

- (id)imageByScalingToWidth:(unint64_t)a3 height:(unint64_t)a4
{
  CRImage *v6;
  void *v7;

  v6 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage imageByScalingToWidth:height:](v6, "imageByScalingToWidth:height:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5
{
  return -[CRImage_PixelBuffer imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:](self, "imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:", a3, a4, a5, 0);
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5 alignCenter:(BOOL)a6
{
  _BOOL8 v6;
  CRImage *v10;
  void *v11;

  v6 = a6;
  v10 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:](v10, "imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:", a3, a4, a5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageByRotating180
{
  return -[CRImage_PixelBuffer imageByCorrectingFromOrientation:](self, "imageByCorrectingFromOrientation:", 3);
}

- (id)imageByDilating
{
  CRImage *v2;
  void *v3;

  v2 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage imageByDilating](v2, "imageByDilating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageByApplyingBinaryMask:(id)a3
{
  id v4;
  CRImage *v5;
  void *v6;

  v4 = a3;
  v5 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage imageByApplyingBinaryMask:](v5, "imageByApplyingBinaryMask:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)writeToFile:(id)a3
{
  CRImage *v4;
  id v5;

  v5 = a3;
  v4 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage writeToFile:](v4, "writeToFile:", v5);

}

- (id)imageByInvertingIntensity
{
  CRImage *v2;
  void *v3;

  v2 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage imageByInvertingIntensity](v2, "imageByInvertingIntensity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4 lineWidth:(double)a5 red:(double)a6 green:(double)a7 blue:(double)a8 alpha:(double)a9
{
  CRImage *v16;
  void *v17;

  v16 = -[CRImage initWithCVPixelBuffer:toColorSpace:]([CRImage alloc], "initWithCVPixelBuffer:toColorSpace:", -[CRImage_PixelBuffer pixelBuffer](self, "pixelBuffer"), 1);
  -[CRImage imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:](v16, "imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:", a3, a4, 0, a5, a6, a7, a8, a9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4
{
  return -[CRImage imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:](self, "imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:", a3, a4, 0, 3.0, 1.0, 0.0, 0.0, 1.0);
}

+ (void)drawVerticalLineAtXOffset:(double)a3 image:(id)a4
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2, a3);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4
{
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:", 0, 1, 1111970369, a3, a4.width, a4.height);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5
{
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:", a5, 1, 1111970369, a3, a4.width, a4.height);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6
{
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:", a5, 1, 1111970369, a3, a4.width, a4.height);
}

- (vImage_Buffer)createFloatBuffer
{
  return (vImage_Buffer *)-[CRImage_PixelBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->super._pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->super._pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRImage_PixelBuffer;
  -[CRImage dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)_pixelBufferFromUrl:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  const __CFDictionary *v12;
  __CVBuffer *v13;
  CVPixelBufferRef v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C9DDC8];
  v18 = *MEMORY[0x1E0C9E0B0];
  v19[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithContentsOfURL:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
  objc_msgSend(v6, "extent");
  v9 = v8;
  v11 = v10;
  v15 = 0;
  v16 = *MEMORY[0x1E0CA8FF0];
  v17 = MEMORY[0x1E0C9AA70];
  v12 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)v9, (unint64_t)v11, 0x34323066u, v12, &v15))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v7, "render:toCVPixelBuffer:", v6, v15);
    v13 = v15;
  }

  return v13;
}

+ (__CVBuffer)_convertPixelBuffer:(__CVBuffer *)a3 toFormat:(unsigned int)a4 iosurfaceBacking:(BOOL)a5
{
  _BOOL4 v5;
  const __CFAllocator *v8;
  size_t Width;
  size_t Height;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CVBuffer *v15;
  CVPixelBufferRef pixelBufferOut;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  _QWORD v19[2];
  _QWORD v20[3];

  v5 = a5;
  v20[2] = *MEMORY[0x1E0C80C00];
  pixelTransferSessionOut = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &pixelTransferSessionOut);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = *MEMORY[0x1E0CA8F70];
  v19[0] = *MEMORY[0x1E0CA8F78];
  v19[1] = v12;
  v20[0] = MEMORY[0x1E0C9AAB0];
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
  pixelBufferOut = 0;
  CVPixelBufferCreate(v8, Width, Height, a4, (CFDictionaryRef)v14, &pixelBufferOut);
  VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a3, pixelBufferOut);
  VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
  CFRelease(pixelTransferSessionOut);
  v15 = pixelBufferOut;

  return v15;
}

@end
