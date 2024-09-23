@implementation CRImage

- (unint64_t)width
{
  return self->_vImage.width;
}

- (unint64_t)height
{
  return self->_vImage.height;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)-[CRImage width](self, "width");
  v4 = (double)-[CRImage height](self, "height");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (unint64_t)bufferHash
{
  __CVBuffer *v2;
  unint64_t v3;
  size_t i;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  void *v9;
  unint64_t j;
  uint64_t v11;
  char *v12;
  _BYTE *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  unint64_t k;
  unint64_t v18;
  size_t PlaneCount;

  v2 = -[CRImage pixelBuffer](self, "pixelBuffer");
  CVPixelBufferLockBaseAddress(v2, 0);
  if (CVPixelBufferIsPlanar(v2))
  {
    PlaneCount = CVPixelBufferGetPlaneCount(v2);
    v3 = 0;
    if (PlaneCount)
    {
      for (i = 0; i != PlaneCount; ++i)
      {
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(v2, i);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(v2, i);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v2, i);
        BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v2, i);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", BaseAddressOfPlane, BytesPerRowOfPlane);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v3 ^= objc_msgSend(v9, "hash");
        if (HeightOfPlane)
        {
          for (j = 0; j != HeightOfPlane; ++j)
          {
            if (WidthOfPlane)
            {
              v11 = 0;
              v12 = &BaseAddressOfPlane[j * BytesPerRowOfPlane];
              while (1)
              {
                v12 += BytesPerRowOfPlane / WidthOfPlane;
                if (*v12)
                {
                  if (*v12 != 255)
                    break;
                }
                if (WidthOfPlane == ++v11)
                  goto LABEL_13;
              }
              v3 ^= v11 << (j % 0x18);
            }
LABEL_13:
            ;
          }
        }

      }
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(v2);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v2);
    Width = CVPixelBufferGetWidth(v2);
    Height = CVPixelBufferGetHeight(v2);
    v3 = Height ^ Width;
    if (Height)
    {
      for (k = 0; k != Height; ++k)
      {
        if (Width)
        {
          v18 = 0;
          while ((BaseAddress[k * BytesPerRow
                                              + v18 * (BytesPerRow / Width)
                                              + v18 % (BytesPerRow / Width)]
                                  + 1) < 2u)
          {
            if (Width == ++v18)
              goto LABEL_24;
          }
          v3 ^= v18 << (k % 0x18);
        }
LABEL_24:
        ;
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(v2, 0);
  return v3;
}

+ (vImage_Buffer)allocateVImageBufferWithWidth:(SEL)a3 height:(unint64_t)a4 bytesPerPixel:(unint64_t)a5
{
  size_t v7;
  vImage_Buffer *result;

  retstr->height = a5;
  retstr->width = a4;
  v7 = a6 * a4;
  retstr->rowBytes = v7;
  result = (vImage_Buffer *)malloc_type_malloc(v7 * a5, 0x4E4E74C8uLL);
  retstr->data = result;
  return result;
}

+ (vImage_Buffer)allocateVImageBufferWithWidth:(SEL)a3 height:(unint64_t)a4 colorSpace:(unint64_t)a5
{
  uint64_t v6;
  void *v10;
  vImage_Buffer *result;

  v6 = *(_QWORD *)&a6;
  v10 = (void *)objc_opt_class();
  result = (vImage_Buffer *)objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", v6);
  if (v10)
    return (vImage_Buffer *)objc_msgSend(v10, "allocateVImageBufferWithWidth:height:bytesPerPixel:", a4, a5, result);
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  return result;
}

- (CRImage)init
{
  CRImage *v2;
  NSNumber *sceneStabilityMetric;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRImage;
  v2 = -[CRImage init](&v5, sel_init);
  sceneStabilityMetric = v2->_sceneStabilityMetric;
  v2->_sceneStabilityMetric = 0;

  return v2;
}

- (id)initY8WithCVPixelBuffer:(__CVBuffer *)a3 forceDataCopy:(BOOL)a4
{
  _BOOL4 v4;
  CRImage *v6;
  OSType PixelFormatType;
  OSType v8;
  void *v9;
  size_t Width;
  size_t Height;
  NSObject *v12;
  CRImage *v13;
  size_t v14;
  size_t v15;
  void *v16;
  void *BaseAddressOfPlane;
  char v18;
  __int128 v19;
  vImagePixelCount v20;
  vImagePixelCount v21;
  size_t BytesPerRow;
  size_t rowBytes;
  char *BaseAddress;
  uint64_t v25;
  _BYTE *data;
  char *v27;
  vImagePixelCount i;
  char v29;
  __int128 v30;
  char *v31;
  _BYTE *v32;
  size_t BytesPerRowOfPlane;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = -[CRImage init](self, "init");
  v6->_pixelBuffer = CVPixelBufferRetain(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v8 = PixelFormatType;
  if (PixelFormatType == 846624121 || PixelFormatType == 875704422)
  {
    v6->_isFullRange = PixelFormatType == 875704422;
    CVPixelBufferLockBaseAddress(v6->_pixelBuffer, 0);
    if (v8 == 846624121)
    {
      v9 = (void *)objc_opt_class();
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      if (v9)
      {
        objc_msgSend(v9, "allocateVImageBufferWithWidth:height:colorSpace:", Width, Height, 0);
      }
      else
      {
        v43 = 0u;
        v44 = 0u;
      }
      v19 = v44;
      *(_OWORD *)&v6->_vImage.data = v43;
      *(_OWORD *)&v6->_vImage.width = v19;
      v21 = v6->_vImage.height;
      v20 = v6->_vImage.width;
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      rowBytes = v6->_vImage.rowBytes;
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      if (v21)
      {
        v25 = 0;
        data = v6->_vImage.data;
        v27 = BaseAddress + 1;
        do
        {
          for (i = v20; i; --i)
          {
            v29 = *v27;
            v27 += 2;
            *data++ = v29;
          }
          v27 += BytesPerRow - 2 * v20;
          data += rowBytes - v20;
          ++v25;
        }
        while (v25 != v21);
      }
    }
    else
    {
      if (!v4)
      {
        v6->_vImage.width = CVPixelBufferGetWidthOfPlane(a3, 0);
        v6->_vImage.height = CVPixelBufferGetHeightOfPlane(a3, 0);
        v6->_vImage.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        v18 = 0;
        v6->_vImage.data = BaseAddressOfPlane;
LABEL_33:
        v6->_vImageDataIsCopy = v18;
        v13 = v6;
        goto LABEL_34;
      }
      v14 = CVPixelBufferGetWidth(a3);
      v15 = CVPixelBufferGetHeight(a3);
      v16 = (void *)objc_opt_class();
      if (v16)
      {
        objc_msgSend(v16, "allocateVImageBufferWithWidth:height:colorSpace:", v14 & 0xFFFFFFFFFFFFFFFELL, v15 & 0xFFFFFFFFFFFFFFFELL, 0);
      }
      else
      {
        v43 = 0u;
        v44 = 0u;
      }
      v30 = v44;
      *(_OWORD *)&v6->_vImage.data = v43;
      *(_OWORD *)&v6->_vImage.width = v30;
      v31 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v32 = v6->_vImage.data;
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      if (v15 >= 2)
      {
        v34 = 0;
        v35 = v14 >> 1;
        if (v14 >> 1 <= 1)
          v35 = 1;
        v36 = &v31[BytesPerRowOfPlane];
        do
        {
          if (v14 >= 2)
          {
            v37 = &v31[2 * v34 * BytesPerRowOfPlane];
            v38 = v35;
            do
            {
              *v32 = *v37;
              v32[1] = v37[1];
              v37 += 2;
              v32 += 2;
              --v38;
            }
            while (v38);
            v39 = 0;
            v40 = v35;
            do
            {
              v41 = &v32[v39];
              *v41 = v36[v39];
              v41[1] = v36[v39 + 1];
              v39 += 2;
              --v40;
            }
            while (v40);
            v32 += v39;
          }
          ++v34;
          v36 += 2 * BytesPerRowOfPlane;
        }
        while (v34 != v15 >> 1);
      }
    }
    CVPixelBufferUnlockBaseAddress(v6->_pixelBuffer, 0);
    CVPixelBufferRelease(v6->_pixelBuffer);
    v6->_pixelBuffer = 0;
    v18 = 1;
    goto LABEL_33;
  }
  CVPixelBufferRelease(v6->_pixelBuffer);
  CROSLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    LODWORD(v43) = 67109120;
    DWORD1(v43) = v8;
    _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_FAULT, "[CRImage initY8WithCVPixelBuffer:] Unsupported pixel buffer type %i", (uint8_t *)&v43, 8u);
  }

  v13 = 0;
LABEL_34:

  return v13;
}

- (id)initARGB8888WithCVPixelBuffer:(__CVBuffer *)a3
{
  CRImage *v4;
  CRLogger *PixelFormatType;
  int v6;
  _BYTE *CRLogger;
  NSObject *v8;
  CRImage *v9;
  void *v10;
  size_t Width;
  size_t Height;
  __int128 v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  void *BaseAddress;
  size_t v18;
  size_t BytesPerRow;
  uint8_t v21[16];
  vImage_Buffer v22;
  vImage_Buffer src;
  vImage_YpCbCrToARGB buf;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = -[CRImage init](self, "init");
  v4->_pixelBuffer = CVPixelBufferRetain(a3);
  PixelFormatType = (CRLogger *)CVPixelBufferGetPixelFormatType(a3);
  v6 = (int)PixelFormatType;
  if ((int)PixelFormatType > 875704421)
  {
    if ((_DWORD)PixelFormatType != 875704422)
    {
      if ((_DWORD)PixelFormatType != 1111970369)
        goto LABEL_9;
      CRLogger = CRLogger::getCRLogger(PixelFormatType);
      if (!*CRLogger || (CRLogger[8] & 8) == 0)
        goto LABEL_9;
    }
  }
  else if ((_DWORD)PixelFormatType != 32 && (_DWORD)PixelFormatType != 846624121)
  {
LABEL_9:
    CVPixelBufferRelease(v4->_pixelBuffer);
    CROSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf.opaque = 67109120;
      *(_DWORD *)&buf.opaque[4] = v6;
      _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unsupported pixel buffer type %i", buf.opaque, 8u);
    }

    v9 = 0;
    goto LABEL_32;
  }
  v4->_isFullRange = 1;
  CVPixelBufferLockBaseAddress(v4->_pixelBuffer, 0);
  v10 = (void *)objc_opt_class();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (v10)
    objc_msgSend(v10, "allocateVImageBufferWithWidth:height:colorSpace:", Width, Height, 1);
  else
    memset(&buf, 0, 32);
  v13 = *(_OWORD *)&buf.opaque[16];
  *(_OWORD *)&v4->_vImage.data = *(_OWORD *)buf.opaque;
  *(_OWORD *)&v4->_vImage.width = v13;
  v4->_vImageDataIsCopy = 1;
  if (v6 == 875704422)
  {
    src.data = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    src.height = CVPixelBufferGetHeightOfPlane(a3, 0);
    src.width = CVPixelBufferGetWidthOfPlane(a3, 0);
    src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    v22.data = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    v22.height = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
    v22.width = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
    v22.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    if (vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E0C8BDB0], &fullYpCbCrPixelRange, &buf, kvImage420Yp8_CbCr8, kvImageARGB8888, 0)|| vImageConvert_420Yp8_CbCr8ToARGB8888(&src, &v22, &v4->_vImage, &buf, 0, 0xFFu, 0))
    {
      CROSLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D4FB8000, v15, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unable to initialize ARGB8888 CRImage with 420YpCbCr8BiPlanarFullRange pixel buffer", v21, 2u);
      }

      goto LABEL_27;
    }
  }
  else if (v6 == 846624121)
  {
    src.data = CVPixelBufferGetBaseAddress(a3);
    src.height = CVPixelBufferGetHeight(a3);
    src.width = CVPixelBufferGetWidth(a3);
    src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
    if (vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E0C8BDB0], &videoYpCbCrPixelRange, &buf, kvImage422CbYpCrYp8, kvImageARGB8888, 0)|| vImageConvert_422CbYpCrYp8ToARGB8888(&src, &v4->_vImage, &buf, 0, 0xFFu, 0))
    {
      CROSLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22.data) = 0;
        _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unable to initialize ARGB8888 CRImage with 422CbYpCrYp8 pixel buffer", (uint8_t *)&v22, 2u);
      }

LABEL_27:
      v16 = 1;
      goto LABEL_30;
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    v18 = CVPixelBufferGetHeight(a3);
    CVPixelBufferGetWidth(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    memcpy(v4->_vImage.data, BaseAddress, BytesPerRow * v18);
  }
  v16 = 0;
LABEL_30:
  CVPixelBufferUnlockBaseAddress(v4->_pixelBuffer, 0);
  CVPixelBufferRelease(v4->_pixelBuffer);
  v9 = 0;
  v4->_pixelBuffer = 0;
  if ((v16 & 1) == 0)
    v9 = v4;
LABEL_32:

  return v9;
}

- (id)initYUV888WithCVPixelBuffer:(__CVBuffer *)a3
{
  CRImage *v4;
  OSType PixelFormatType;
  OSType v6;
  void *v7;
  size_t Width;
  size_t Height;
  NSObject *v10;
  CRImage *v11;
  __int128 v12;
  char *BaseAddress;
  size_t BytesPerRow;
  vImagePixelCount v15;
  vImagePixelCount v16;
  _BYTE *data;
  unint64_t v18;
  unint64_t v19;
  int v20;
  char *BaseAddressOfPlane;
  char *v22;
  size_t BytesPerRowOfPlane;
  size_t v24;
  vImagePixelCount v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char v32;
  char v33;
  char v34;
  unint64_t v35;
  char *v36;
  char v37;
  char v38;
  char v39;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = -[CRImage init](self, "init");
  v4->_pixelBuffer = CVPixelBufferRetain(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v6 = PixelFormatType;
  if (PixelFormatType == 846624121 || PixelFormatType == 875704422)
  {
    v4->_isFullRange = PixelFormatType == 875704422;
    CVPixelBufferLockBaseAddress(v4->_pixelBuffer, 0);
    v7 = (void *)objc_opt_class();
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (v7)
    {
      objc_msgSend(v7, "allocateVImageBufferWithWidth:height:colorSpace:", Width, Height, 3);
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
    }
    v12 = v42;
    *(_OWORD *)&v4->_vImage.data = v41;
    *(_OWORD *)&v4->_vImage.width = v12;
    v4->_vImageDataIsCopy = 1;
    if (v6 == 846624121)
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v15 = v4->_vImage.height;
      if (v15)
      {
        v16 = 0;
        data = v4->_vImage.data;
        v18 = v4->_vImage.width;
        do
        {
          if (v18 >= 2)
          {
            v19 = 0;
            do
            {
              v20 = *(_DWORD *)&BaseAddress[4 * v19];
              *data = BYTE1(v20);
              data[1] = v20;
              data[2] = BYTE2(v20);
              data[3] = HIBYTE(v20);
              data[4] = v20;
              data[5] = BYTE2(v20);
              ++v19;
              data += 6;
              v18 = v4->_vImage.width;
            }
            while (v19 < v18 >> 1);
            v15 = v4->_vImage.height;
          }
          ++v16;
          BaseAddress += BytesPerRow;
        }
        while (v16 < v15);
      }
    }
    else
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v22 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      v24 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      if (v4->_vImage.height >= 2)
      {
        v25 = 0;
        v26 = v4->_vImage.data;
        v27 = v4->_vImage.width;
        do
        {
          if (v27 >= 2)
          {
            v28 = 0;
            v29 = &v22[v25 * v24];
            v30 = &BaseAddressOfPlane[2 * v25 * BytesPerRowOfPlane];
            v31 = v29;
            do
            {
              v32 = v30[1];
              v33 = *v31;
              v34 = v31[1];
              *v26 = *v30;
              v26[1] = v33;
              v26[2] = v34;
              v26[3] = v32;
              v26[4] = v33;
              v26[5] = v34;
              ++v28;
              v30 += 2;
              v31 += 2;
              v26 += 6;
              v27 = v4->_vImage.width;
            }
            while (v28 < v27 >> 1);
            if (v27 >= 2)
            {
              v35 = 0;
              v36 = &BaseAddressOfPlane[((2 * v25) | 1) * BytesPerRowOfPlane];
              do
              {
                v37 = v36[1];
                v38 = *v29;
                v39 = v29[1];
                *v26 = *v36;
                v26[1] = v38;
                v26[2] = v39;
                v26[3] = v37;
                v26[4] = v38;
                v26[5] = v39;
                ++v35;
                v36 += 2;
                v29 += 2;
                v26 += 6;
                v27 = v4->_vImage.width;
              }
              while (v35 < v27 >> 1);
            }
          }
          ++v25;
        }
        while (v25 < v4->_vImage.height >> 1);
      }
    }
    v11 = v4;
    CVPixelBufferUnlockBaseAddress(v4->_pixelBuffer, 0);
  }
  else
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v41) = 67109120;
      DWORD1(v41) = v6;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "[CRImage initYUV888WithCVPixelBuffer:] Unsupported pixel buffer type %i", (uint8_t *)&v41, 8u);
    }

    v11 = 0;
  }
  CVPixelBufferRelease(v4->_pixelBuffer);
  v4->_pixelBuffer = 0;

  return v11;
}

- (id)initAYUV8888WithCVPixelBuffer:(__CVBuffer *)a3
{
  CRImage *v4;
  OSType PixelFormatType;
  OSType v6;
  void *v7;
  size_t Width;
  size_t Height;
  NSObject *v10;
  CRImage *v11;
  __int128 v12;
  char *BaseAddress;
  size_t BytesPerRow;
  vImagePixelCount v15;
  uint64_t v16;
  _DWORD *data;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  char *BaseAddressOfPlane;
  char *v25;
  size_t BytesPerRowOfPlane;
  size_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _DWORD *v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  int v38;
  int v39;
  int v40;
  char *v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = -[CRImage init](self, "init");
  v4->_pixelBuffer = CVPixelBufferRetain(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v6 = PixelFormatType;
  if (PixelFormatType == 846624121 || PixelFormatType == 875704422)
  {
    v4->_isFullRange = PixelFormatType == 875704422;
    CVPixelBufferLockBaseAddress(v4->_pixelBuffer, 0);
    v7 = (void *)objc_opt_class();
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (v7)
    {
      objc_msgSend(v7, "allocateVImageBufferWithWidth:height:colorSpace:", Width, Height, 2);
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
    }
    v12 = v48;
    *(_OWORD *)&v4->_vImage.data = v47;
    *(_OWORD *)&v4->_vImage.width = v12;
    v4->_vImageDataIsCopy = 1;
    if (v6 == 846624121)
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      v15 = v4->_vImage.height;
      if (v15)
      {
        v16 = 0;
        data = v4->_vImage.data;
        v18 = v4->_vImage.width;
        v19 = v18 >> 1;
        if (v18 >> 1 <= 1)
          v19 = 1;
        do
        {
          if (v18 >= 2)
          {
            v20 = &BaseAddress[v16 * BytesPerRow];
            v21 = v19;
            do
            {
              v22 = *(_DWORD *)v20;
              v20 += 4;
              HIDWORD(v23) = v22;
              LODWORD(v23) = v22;
              *data = v22 & 0xFF00 | (v22 << 16) & 0xFFFFFF | (BYTE2(v22) << 24) | 0xFF;
              data[1] = (v23 >> 16) & 0xFFFF00 | (BYTE2(v22) << 24) | 0xFF;
              data += 2;
              --v21;
            }
            while (v21);
          }
          ++v16;
        }
        while (v16 != v15);
      }
    }
    else
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v25 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      v27 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      v28 = v4->_vImage.height;
      if (v28 >= 2)
      {
        v29 = 0;
        v30 = v28 >> 1;
        v31 = v4->_vImage.data;
        v32 = v4->_vImage.width;
        v33 = v32 >> 1;
        if (v32 >> 1 <= 1)
          v33 = 1;
        do
        {
          if (v32 >= 2)
          {
            v34 = &v25[v29 * v27];
            v35 = &BaseAddressOfPlane[2 * v29 * BytesPerRowOfPlane];
            v36 = v33;
            v37 = v34;
            do
            {
              v38 = *v37 << 16;
              v39 = v37[1];
              v40 = (v38 | (v35[1] << 8)) & 0xFFFFFF | (v39 << 24) | 0xFF;
              *v31 = v38 | (*v35 << 8) | (v39 << 24) | 0xFF;
              v31[1] = v40;
              v31 += 2;
              v35 += 2;
              v37 += 2;
              --v36;
            }
            while (v36);
            v41 = &BaseAddressOfPlane[((2 * v29) | 1) * BytesPerRowOfPlane];
            v42 = v33;
            do
            {
              v43 = *v34 << 16;
              v44 = v34[1];
              v45 = (v43 | (v41[1] << 8)) & 0xFFFFFF | (v44 << 24) | 0xFF;
              *v31 = v43 | (*v41 << 8) | (v44 << 24) | 0xFF;
              v31[1] = v45;
              v31 += 2;
              v41 += 2;
              v34 += 2;
              --v42;
            }
            while (v42);
          }
          ++v29;
        }
        while (v29 != v30);
      }
    }
    v11 = v4;
    CVPixelBufferUnlockBaseAddress(v4->_pixelBuffer, 0);
  }
  else
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v47) = 67109120;
      DWORD1(v47) = v6;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "[CRImage initAYUV8888WithCVPixelBuffer:] Unsupported pixel buffer type %i", (uint8_t *)&v47, 8u);
    }

    v11 = 0;
  }
  CVPixelBufferRelease(v4->_pixelBuffer);
  v4->_pixelBuffer = 0;

  return v11;
}

- (CRImage)initWithCVPixelBuffer:(__CVBuffer *)a3 toColorSpace:(int)a4
{
  return -[CRImage initWithCVPixelBuffer:toColorSpace:forceDataCopy:](self, "initWithCVPixelBuffer:toColorSpace:forceDataCopy:", a3, *(_QWORD *)&a4, 0);
}

- (CRImage)initWithCVPixelBuffer:(__CVBuffer *)a3 toColorSpace:(int)a4 forceDataCopy:(BOOL)a5
{
  _BOOL8 v5;
  CRImage *v8;
  CRImage *v9;

  v5 = a5;
  v8 = -[CRImage init](self, "init");
  if (v8)
  {
    v8->_colorSpace = a4;
    switch(a4)
    {
      case 0:
        v8 = -[CRImage initY8WithCVPixelBuffer:forceDataCopy:](v8, "initY8WithCVPixelBuffer:forceDataCopy:", a3, v5);
        break;
      case 1:
        v8 = -[CRImage initARGB8888WithCVPixelBuffer:](v8, "initARGB8888WithCVPixelBuffer:", a3);
        break;
      case 2:
        v8 = -[CRImage initAYUV8888WithCVPixelBuffer:](v8, "initAYUV8888WithCVPixelBuffer:", a3);
        break;
      case 3:
        v8 = -[CRImage initYUV888WithCVPixelBuffer:](v8, "initYUV888WithCVPixelBuffer:", a3);
        break;
      default:
        break;
    }
  }
  v9 = v8;

  return v9;
}

- (CRImage)initWithCIImage:(id)a3 toColorSpace:(int)a4
{
  uint64_t v4;
  id v6;
  CRImage *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CRImage *v17;
  __int128 v18;
  vImage_Buffer *p_vImage;
  void *v20;
  CGColorSpace *DeviceGray;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  CGColorSpace *DeviceRGB;
  void *v30;
  void *v31;
  void *v32;
  CRImage *v33;
  CGColorSpace *v34;
  NSObject *v35;
  void *v36;
  vImage_Buffer v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  vImage_Buffer src;
  uint64_t v44;

  v4 = *(_QWORD *)&a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = -[CRImage init](self, "init");
    self = v7;
    if (v7)
    {
      -[CRImage setCiImage:](v7, "setCiImage:", v6);
      objc_msgSend(v6, "extent");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      self->_colorSpace = v4;
      self->_isFullRange = 1;
      v16 = (void *)objc_opt_class();
      if (v16)
        objc_msgSend(v16, "allocateVImageBufferWithWidth:height:colorSpace:", (unint64_t)v13, (unint64_t)v15, v4);
      else
        memset(&src, 0, sizeof(src));
      v18 = *(_OWORD *)&src.width;
      *(_OWORD *)&self->_vImage.data = *(_OWORD *)&src.data;
      *(_OWORD *)&self->_vImage.width = v18;
      self->_vImageDataIsCopy = 1;
      if ((_DWORD)v4)
      {
        p_vImage = &self->_vImage;
        if ((_DWORD)v4 != 1)
        {
          v20 = (void *)objc_opt_class();
          if (v20)
            objc_msgSend(v20, "allocateVImageBufferWithWidth:height:colorSpace:", self->_vImage.width, self->_vImage.height, 1);
          else
            memset(&v38, 0, sizeof(v38));
          src = v38;
          p_vImage = &src;
        }
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v30 = (void *)MEMORY[0x1E0C9DD90];
        v39 = *MEMORY[0x1E0C9DF58];
        v40 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "contextWithOptions:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, p_vImage->data, p_vImage->rowBytes, *MEMORY[0x1E0C9DFF8], DeviceRGB, v9, v11, v13, v15);

        CGColorSpaceRelease(DeviceRGB);
        if ((_DWORD)v4 != 1)
        {
          objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", p_vImage, 1, &self->_vImage, self->_colorSpace);
          free(p_vImage->data);
        }
        v33 = self;
        goto LABEL_29;
      }
      DeviceGray = CGColorSpaceCreateDeviceGray();
      if ((CGColorSpace *)objc_msgSend(v6, "colorSpace") == DeviceGray)
      {
        v25 = (void *)MEMORY[0x1E0C9DD90];
        v26 = *MEMORY[0x1E0C9DF58];
        v41[0] = *MEMORY[0x1E0C9DFC0];
        v41[1] = v26;
        v42[0] = DeviceGray;
        v42[1] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contextWithOptions:", v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, self->_vImage.data, self->_vImage.rowBytes, *MEMORY[0x1E0C9E008], DeviceGray, v9, v11, v13, v15);
        v28 = 0;
      }
      else
      {
        if (qword_1ED0B4930 != -1)
          dispatch_once(&qword_1ED0B4930, &__block_literal_global_42);
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:keysAndValues:", CFSTR("CIColorControls"), *MEMORY[0x1E0C9E1F8], v6, *MEMORY[0x1E0C9E1B0], &unk_1E9926BF8, *MEMORY[0x1E0C9E260], &unk_1E9926BF8, *MEMORY[0x1E0C9E1D0], &unk_1E9926C10, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "outputImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        memset(&src, 0, sizeof(src));
        v24 = (void *)objc_opt_class();
        if (v24)
          objc_msgSend(v24, "allocateVImageBufferWithWidth:height:colorSpace:", self->_vImage.width, self->_vImage.height, 1);
        else
          memset(&src, 0, sizeof(src));
        v34 = CGColorSpaceCreateDeviceRGB();
        objc_msgSend((id)_MergedGlobals_39, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v23, src.data, src.rowBytes, *MEMORY[0x1E0C9DFF8], v34, v9, v11, v13, v15);
        CGColorSpaceRelease(v34);
        v28 = vImageExtractChannel_ARGB8888(&src, &self->_vImage, 1, 0) != 0;
        free(src.data);
      }

      CGColorSpaceRelease(DeviceGray);
      v33 = self;
      if (!v28)
        goto LABEL_29;
      CROSLogForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138412290;
        *(void **)((char *)&src.data + 4) = v36;
        _os_log_impl(&dword_1D4FB8000, v35, OS_LOG_TYPE_ERROR, "[CRImage initWithCIImage:toColorSpace:] Unable to initialize from CIImage to color space %@", (uint8_t *)&src, 0xCu);

      }
    }
    v33 = 0;
LABEL_29:
    v17 = v33;
    goto LABEL_30;
  }
  v17 = 0;
LABEL_30:

  return v17;
}

void __40__CRImage_initWithCIImage_toColorSpace___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C9DD90];
  v4 = *MEMORY[0x1E0C9DF58];
  v5[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contextWithOptions:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = v2;

}

- (CRImage)initWithMTLTexture:(id)a3 toColorSpace:(int)a4
{
  uint64_t v4;
  id v6;
  CRImage *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CRImage *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *data;
  size_t rowBytes;
  CRImage *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[6];
  uint8_t buf[16];
  __int128 v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = -[CRImage init](self, "init");
    self = v7;
    if (v7)
    {
      if (v4 <= 1)
      {
        v7->_colorSpace = v4;
        v7->_isFullRange = 1;
        v8 = (void *)objc_opt_class();
        v9 = objc_msgSend(v6, "width");
        v10 = objc_msgSend(v6, "height");
        if (v8)
        {
          objc_msgSend(v8, "allocateVImageBufferWithWidth:height:colorSpace:", v9, v10, v4);
        }
        else
        {
          *(_OWORD *)buf = 0u;
          v23 = 0u;
        }
        v12 = v23;
        *(_OWORD *)&self->_vImage.data = *(_OWORD *)buf;
        *(_OWORD *)&self->_vImage.width = v12;
        self->_vImageDataIsCopy = 1;
        if (objc_msgSend(v6, "pixelFormat") == 10 || objc_msgSend(v6, "pixelFormat") == 70)
        {
          v13 = objc_msgSend(v6, "width");
          v14 = objc_msgSend(v6, "height");
          data = self->_vImage.data;
          rowBytes = self->_vImage.rowBytes;
          memset(v21, 0, 24);
          v21[3] = v13;
          v21[4] = v14;
          v21[5] = 1;
          objc_msgSend(v6, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", data, rowBytes, v21, 0);
          v17 = self;
LABEL_15:
          v11 = v17;
          goto LABEL_16;
        }
      }
      CROSLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_1D4FB8000, v18, OS_LOG_TYPE_ERROR, "[CRImage initWithMTLTexture:toColorSpace:] Unable to initialize from MTLTexture to color space %@", buf, 0xCu);

      }
    }
    v17 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (void)runBlockWithARGB8888Image:(id)a3 blockOwnsMemory:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, vImage_Buffer *, _QWORD);
  vImage_Buffer *p_vImage;
  _BOOL4 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];

  v4 = a4;
  v6 = (void (**)(id, vImage_Buffer *, _QWORD))a3;
  p_vImage = &self->_vImage;
  if (self->_colorSpace == 1)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_class();
    if (v9)
    {
      objc_msgSend(v9, "allocateVImageBufferWithWidth:height:colorSpace:", self->_vImage.width, self->_vImage.height, 1);
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
    }
    v12[0] = v10;
    v12[1] = v11;
    if (!objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", &self->_vImage, self->_colorSpace, v12, 1))
    {
      p_vImage = (vImage_Buffer *)v12;
      goto LABEL_10;
    }
    v8 = self->_colorSpace != 1;
    p_vImage = (vImage_Buffer *)v12;
  }
  v6[2](v6, p_vImage, v8 & v4);
LABEL_10:
  if (self->_colorSpace != 1 && !v4)
    free(p_vImage->data);

}

- (CIImage)ciImage
{
  CIImage *ciImage;
  CIImage **p_ciImage;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  p_ciImage = &self->_ciImage;
  ciImage = self->_ciImage;
  if (!ciImage)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__24;
    v10 = __Block_byref_object_dispose__24;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __18__CRImage_ciImage__block_invoke;
    v5[3] = &unk_1E98DBE60;
    v5[4] = &v6;
    -[CRImage runBlockWithARGB8888Image:blockOwnsMemory:](self, "runBlockWithARGB8888Image:blockOwnsMemory:", v5, 1);
    objc_storeStrong((id *)p_ciImage, (id)v7[5]);
    _Block_object_dispose(&v6, 8);

    ciImage = *p_ciImage;
  }
  return ciImage;
}

void __18__CRImage_ciImage__block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  CGColorSpace *DeviceRGB;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *a2, a2[1] * a2[3], a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v8, a2[3], *MEMORY[0x1E0C9DFF8], DeviceRGB, (double)(unint64_t)a2[2], (double)(unint64_t)a2[1]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  CGColorSpaceRelease(DeviceRGB);
}

- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4
{
  return -[CRImage pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", 0, 2, a3, a4.width, a4.height);
}

- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5
{
  return -[CRImage pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", a5, 2, a3, a4.width, a4.height);
}

- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6
{
  double height;
  double width;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  const __CFDictionary *v16;
  __CVBuffer *v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  CGFloat v21;
  void *BaseAddress;
  CGColorSpace *DeviceRGB;
  size_t BytesPerRow;
  CGContext *v25;
  __int128 v26;
  CGImage *v27;
  CGAffineTransform transform;
  CVPixelBufferRef pixelBufferOut;
  CGRect v31;
  CGRect v32;

  height = a4.height;
  width = a4.width;
  v12 = -[CRImage width](self, "width");
  v13 = -[CRImage height](self, "height");
  v14 = (unint64_t)width;
  v15 = (unint64_t)height;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CA8F78], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA8F70], 0);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)width, (unint64_t)height, 0x20u, v16, &pixelBufferOut))
  {
    v17 = 0;
  }
  else
  {
    v18 = (double)v13 * a3;
    if ((unint64_t)((double)v12 * a3) >= v14)
      v19 = (unint64_t)width;
    else
      v19 = (unint64_t)((double)v12 * a3);
    if ((unint64_t)v18 >= v15)
      v20 = (unint64_t)height;
    else
      v20 = (unint64_t)v18;
    if (a5)
    {
      a5->width = (double)v19;
      a5->height = (double)v20;
    }
    v21 = 0.0;
    if (a6 <= 3)
      v21 = dbl_1D513BA38[a6];
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    v25 = CGBitmapContextCreate(BaseAddress, (unint64_t)width, (unint64_t)height, 8uLL, BytesPerRow, DeviceRGB, 6u);
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&transform.c = v26;
    *(_OWORD *)&transform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGContextConcatCTM(v25, &transform);
    CGContextSetGrayFillColor(v25, v21, 1.0);
    CGContextSetGrayStrokeColor(v25, v21, 1.0);
    v31.size.width = (double)v14;
    v31.size.height = (double)v15;
    v31.origin.x = 0.0;
    v31.origin.y = 0.0;
    CGContextFillRect(v25, v31);
    v27 = -[CRImage cgImage](self, "cgImage");
    v32.origin.y = (double)(v15 - v20);
    v32.size.width = (double)v19;
    v32.size.height = (double)v20;
    v32.origin.x = 0.0;
    CGContextDrawImage(v25, v32, v27);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v25);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    v17 = pixelBufferOut;
  }

  return v17;
}

- (id)imageByScaling:(double)a3 paddingToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6
{
  __CVBuffer *v6;
  CRImage_PixelBuffer *v7;

  v6 = -[CRImage pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", a5, a6, a3, a4.width, a4.height);
  v7 = -[CRImage_PixelBuffer initWithCVPixelBuffer:]([CRImage_PixelBuffer alloc], "initWithCVPixelBuffer:", v6);
  CVPixelBufferRelease(v6);
  return v7;
}

- (__CVBuffer)pixelBuffer
{
  __CVBuffer *result;
  __CVBuffer **p_pixelBuffer;
  const __CFDictionary *v5;
  size_t v6;
  size_t v7;
  void *BaseAddress;
  CGColorSpace *DeviceRGB;
  size_t v10;
  size_t v11;
  size_t BytesPerRow;
  CGContext *v13;
  CGImage *v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  CGAffineTransform transform;
  CGRect v19;

  p_pixelBuffer = &self->_pixelBuffer;
  result = self->_pixelBuffer;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CA8F78], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA8F70], 0);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRImage width](self, "width");
    v7 = -[CRImage height](self, "height");
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v7, 0x20u, v5, p_pixelBuffer);
    CVPixelBufferLockBaseAddress(*p_pixelBuffer, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(*p_pixelBuffer);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v10 = -[CRImage width](self, "width");
    v11 = -[CRImage height](self, "height");
    BytesPerRow = CVPixelBufferGetBytesPerRow(*p_pixelBuffer);
    v13 = CGBitmapContextCreate(BaseAddress, v10, v11, 8uLL, BytesPerRow, DeviceRGB, 6u);
    v14 = -[CRImage cgImage](self, "cgImage");
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&transform.c = v15;
    *(_OWORD *)&transform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGContextConcatCTM(v13, &transform);
    v16 = -[CRImage width](self, "width");
    v17 = -[CRImage height](self, "height");
    v19.size.width = (double)v16;
    v19.size.height = (double)v17;
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    CGContextDrawImage(v13, v19, v14);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v13);
    CVPixelBufferUnlockBaseAddress(*p_pixelBuffer, 0);

    return *p_pixelBuffer;
  }
  return result;
}

- (BOOL)hasBackingPixelBuffer
{
  return self->_pixelBuffer != 0;
}

- (vImage_Buffer)createFloatBuffer
{
  vImage_Buffer v6;

  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  retstr->data = malloc_type_calloc(-[CRImage height](self, "height") * -[CRImage width](self, "width"), 4uLL, 0x100004052888210uLL);
  retstr->height = -[CRImage height](self, "height");
  retstr->width = -[CRImage width](self, "width");
  retstr->rowBytes = 4 * -[CRImage width](self, "width");
  -[CRImage vImage](self, "vImage", 0, 0, 0, 0);
  return (vImage_Buffer *)vImageConvert_Planar8toPlanarF(&v6, retstr, 1.0, 0.0, 0);
}

- (CGImage)cgImage
{
  _BYTE *CRLogger;
  _BYTE *v4;
  CGImage *result;
  _QWORD v6[5];
  vImage_CGImageFormat format;

  if (!self->_cgImage)
  {
    if (self->_colorSpace)
    {
      *(_QWORD *)&format.bitsPerComponent = 0;
      format.colorSpace = (CGColorSpaceRef)&format;
      *(_QWORD *)&format.bitmapInfo = 0x2020000000;
      format.decode = 0;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __18__CRImage_cgImage__block_invoke;
      v6[3] = &unk_1E98DBE60;
      v6[4] = &format;
      -[CRImage runBlockWithARGB8888Image:blockOwnsMemory:](self, "runBlockWithARGB8888Image:blockOwnsMemory:", v6, 0);
      self->_cgImage = (CGImage *)*((_QWORD *)format.colorSpace + 3);
      _Block_object_dispose(&format, 8);
    }
    else
    {
      *(_QWORD *)&format.bitsPerComponent = 0x100000008;
      memset(&format.bitmapInfo, 0, 24);
      format.colorSpace = CGColorSpaceCreateDeviceGray();
      self->_cgImage = vImageCreateCGImageFromBuffer(&self->_vImage, &format, 0, 0, 0, 0);
      CGColorSpaceRelease(format.colorSpace);
    }
    if (!self->_cgImage)
      return 0;
  }
  CRLogger = CRLogger::getCRLogger((CRLogger *)self);
  if (*CRLogger)
  {
    v4 = CRLogger;
    result = self->_cgImage;
    if ((v4[8] & 8) == 0)
      return result;
    CFRetain(result);
  }
  return self->_cgImage;
}

void __18__CRImage_cgImage__block_invoke(uint64_t a1, const vImage_Buffer *a2, int a3)
{
  vImage_CGImageFormat format;

  *(_QWORD *)&format.bitsPerComponent = 0x2000000008;
  format.colorSpace = CGColorSpaceCreateDeviceRGB();
  format.bitmapInfo = 4;
  memset(&format.version, 0, 20);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = vImageCreateCGImageFromBuffer(a2, &format, 0, 0, 0, 0);
  CGColorSpaceRelease(format.colorSpace);
  if (a3)
    free(a2->data);
}

- (id)imageByApplyingHistogramCorrection
{
  CRImage *v3;
  int v4;
  int v5;
  unsigned __int8 *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  int v12;
  int *v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  float v18;
  uint64_t v19;
  int v20;
  _QWORD v22[129];

  v22[128] = *MEMORY[0x1E0C80C00];
  v3 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage width](self, "width"), -[CRImage height](self, "height"), 0);
  v4 = -[CRImage width](self, "width");
  v5 = -[CRImage height](self, "height");
  -[CRImage vImage](self, "vImage");
  v6 = (unsigned __int8 *)v22[0];
  if (v3)
  {
    -[CRImage vImage](v3, "vImage");
    v7 = (_BYTE *)v22[0];
  }
  else
  {
    v7 = 0;
  }
  v8 = v5 * v4;
  bzero(v22, 0x400uLL);
  if (v8 >= 1)
  {
    v9 = v8;
    v10 = v6;
    do
    {
      v11 = *v10++;
      ++*((_DWORD *)v22 + v11);
      --v9;
    }
    while (v9);
  }
  v12 = 257;
  v13 = (int *)v22;
  do
  {
    v14 = *v13++;
    --v12;
  }
  while (!v14);
  v15 = 1020;
  v16 = v12;
  do
  {
    v17 = *(_DWORD *)((char *)v22 + v15);
    --v16;
    v15 -= 4;
  }
  while (!v17);
  if (v8 >= 1)
  {
    v18 = 255.0 / (float)v16;
    v19 = v8;
    do
    {
      v20 = *v6++;
      *v7++ = (int)(float)(v18 * (float)(v12 + v20 - 256));
      --v19;
    }
    while (v19);
  }
  return v3;
}

- (id)imageByAdjustingBrightnessAlpha:(double)a3 beta:(double)a4
{
  CRImage *v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned __int8 *v15;

  v7 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage width](self, "width"), -[CRImage height](self, "height"), 0);
  v8 = -[CRImage width](self, "width");
  v9 = -[CRImage height](self, "height");
  -[CRImage vImage](self, "vImage");
  v10 = v15;
  if (v7)
  {
    -[CRImage vImage](v7, "vImage");
    v11 = v15;
  }
  else
  {
    v11 = 0;
  }
  if (v9 * v8 >= 1)
  {
    v12 = (v9 * v8);
    do
    {
      v13 = *v10++;
      *v11++ = (int)fmin(a4 + (double)v13 * a3, 255.0);
      --v12;
    }
    while (v12);
  }
  return v7;
}

- (id)imageByRotating90CW
{
  unint64_t v3;
  CRImage *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CRImage *v10;
  CRImage *v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  void *v16[2];
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v3 = -[CRImage bytesPerPixel](self, "bytesPerPixel");
  v4 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage height](self, "height"), -[CRImage width](self, "width"), self->_colorSpace);
  if (v3 == 1)
  {
    v5 = vImageRotate90_Planar8(&self->_vImage, &v4->_vImage, 3u, 0, 0) == 0;
    *((_BYTE *)v19 + 24) = v5;
  }
  else
  {
    *(_OWORD *)v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_opt_class();
    v7 = -[CRImage width](v4, "width");
    v8 = -[CRImage height](v4, "height");
    if (v6)
    {
      objc_msgSend(v6, "allocateVImageBufferWithWidth:height:colorSpace:", v7, v8, 1);
    }
    else
    {
      *(_OWORD *)v16 = 0u;
      v17 = 0u;
    }
    v13[1] = 3221225472;
    v14 = *(_OWORD *)v16;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[2] = __30__CRImage_imageByRotating90CW__block_invoke;
    v13[3] = &unk_1E98DBE88;
    v13[4] = &v18;
    v15 = v17;
    -[CRImage runBlockWithARGB8888Image:blockOwnsMemory:](self, "runBlockWithARGB8888Image:blockOwnsMemory:", v13, 0);
    if (*((_BYTE *)v19 + 24))
    {
      v9 = objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", v16, 1, &v4->_vImage, v4->_colorSpace);
      *((_BYTE *)v19 + 24) = v9;
    }
    free(v16[0]);
    v5 = *((unsigned __int8 *)v19 + 24);
  }
  if (v5)
    v10 = v4;
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

vImage_Error __30__CRImage_imageByRotating90CW__block_invoke(uint64_t a1, vImage_Buffer *src)
{
  vImage_Error result;

  result = vImageRotate90_ARGB8888(src, (const vImage_Buffer *)(a1 + 40), 3u, black_ARGB8888, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

- (id)imageByRotating180
{
  unint64_t v3;
  CRImage *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CRImage *v10;
  CRImage *v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  void *v16[2];
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v3 = -[CRImage bytesPerPixel](self, "bytesPerPixel");
  v4 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage width](self, "width"), -[CRImage height](self, "height"), self->_colorSpace);
  if (v3 == 1)
  {
    v5 = vImageRotate90_Planar8(&self->_vImage, &v4->_vImage, 2u, 0, 0) == 0;
    *((_BYTE *)v19 + 24) = v5;
  }
  else
  {
    *(_OWORD *)v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_opt_class();
    v7 = -[CRImage width](v4, "width");
    v8 = -[CRImage height](v4, "height");
    if (v6)
    {
      objc_msgSend(v6, "allocateVImageBufferWithWidth:height:colorSpace:", v7, v8, 1);
    }
    else
    {
      *(_OWORD *)v16 = 0u;
      v17 = 0u;
    }
    v13[1] = 3221225472;
    v14 = *(_OWORD *)v16;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[2] = __29__CRImage_imageByRotating180__block_invoke;
    v13[3] = &unk_1E98DBE88;
    v13[4] = &v18;
    v15 = v17;
    -[CRImage runBlockWithARGB8888Image:blockOwnsMemory:](self, "runBlockWithARGB8888Image:blockOwnsMemory:", v13, 0);
    if (*((_BYTE *)v19 + 24))
    {
      v9 = objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", v16, 1, &v4->_vImage, v4->_colorSpace);
      *((_BYTE *)v19 + 24) = v9;
    }
    free(v16[0]);
    v5 = *((unsigned __int8 *)v19 + 24);
  }
  if (v5)
    v10 = v4;
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

vImage_Error __29__CRImage_imageByRotating180__block_invoke(uint64_t a1, vImage_Buffer *src)
{
  vImage_Error result;

  result = vImageRotate90_ARGB8888(src, (const vImage_Buffer *)(a1 + 40), 2u, black_ARGB8888, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

- (id)imageByCorrectingFromOrientation:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  CRImage *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t colorSpace;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  int v17;
  char v18;
  uint64_t v19;
  _QWORD v20[2];

  v3 = *(_QWORD *)&a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "cgOrientation:toVImageRotationMode:andReflection:", *(_QWORD *)&a3, &v18, &v17);
  if (v18)
    v5 = 0;
  else
    v5 = v17 == 0;
  if (v5)
    return self;
  if (!self->_vImage.data)
    return 0;
  v6 = [CRImage alloc];
  v7 = *(_OWORD *)&self->_vImage.width;
  v16[0] = *(_OWORD *)&self->_vImage.data;
  v16[1] = v7;
  v8 = -[CRImage initWithVImageBuffer:inColorSpace:](v6, "initWithVImageBuffer:inColorSpace:", v16, self->_colorSpace);
  v9 = (void *)objc_opt_class();
  colorSpace = self->_colorSpace;
  v19 = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "applyEXIFTransformsOnImage:inColorSpace:properties:", v8 + 56, colorSpace, v12);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  *(_OWORD *)(v8 + 56) = v14;
  *(_OWORD *)(v8 + 72) = v15;

  return (id)v8;
}

- (id)imageByScalingToWidth:(unint64_t)a3 height:(unint64_t)a4
{
  unint64_t v7;
  CRImage *v8;
  int v9;
  void *v10;
  char v11;
  CRImage *v12;
  CRImage *v13;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  void *v18[2];
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v7 = -[CRImage bytesPerPixel](self, "bytesPerPixel");
  v8 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", a3, a4, self->_colorSpace);
  if (v7 == 1)
  {
    v9 = vImageScale_Planar8(&self->_vImage, &v8->_vImage, 0, 0) == 0;
    *((_BYTE *)v21 + 24) = v9;
  }
  else
  {
    *(_OWORD *)v18 = 0u;
    v19 = 0u;
    v10 = (void *)objc_opt_class();
    if (v10)
    {
      objc_msgSend(v10, "allocateVImageBufferWithWidth:height:colorSpace:", a3, a4, 1);
    }
    else
    {
      *(_OWORD *)v18 = 0u;
      v19 = 0u;
    }
    v15[1] = 3221225472;
    v16 = *(_OWORD *)v18;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[2] = __40__CRImage_imageByScalingToWidth_height___block_invoke;
    v15[3] = &unk_1E98DBE88;
    v15[4] = &v20;
    v17 = v19;
    -[CRImage runBlockWithARGB8888Image:blockOwnsMemory:](self, "runBlockWithARGB8888Image:blockOwnsMemory:", v15, 0);
    if (*((_BYTE *)v21 + 24))
    {
      v11 = objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", v18, 1, &v8->_vImage, self->_colorSpace);
      *((_BYTE *)v21 + 24) = v11;
    }
    free(v18[0]);
    v9 = *((unsigned __int8 *)v21 + 24);
  }
  if (v9)
    v12 = v8;
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v20, 8);
  return v13;
}

vImage_Error __40__CRImage_imageByScalingToWidth_height___block_invoke(uint64_t a1, vImage_Buffer *src)
{
  vImage_Error result;

  result = vImageScale_ARGB8888(src, (const vImage_Buffer *)(a1 + 40), 0, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5
{
  return -[CRImage imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:](self, "imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:", a3, a4, a5, 1);
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5 alignCenter:(BOOL)a6
{
  _BOOL4 v6;
  CRImage *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  CRImage *v16;
  CRImage *v17;
  vImagePixelCount width;
  int v19;
  vImagePixelCount height;
  unsigned __int8 *data;
  unint64_t v22;
  vImagePixelCount v23;
  unint64_t v24;
  size_t rowBytes;
  unint64_t v26;
  unsigned __int8 *v27;
  const vImage_Buffer *p_vImage;
  vImagePixelCount v29;
  vImagePixelCount v30;
  vImagePixelCount v31;
  vImagePixelCount i;
  vImagePixelCount v33;
  vImagePixelCount v34;
  unint64_t v35;
  vImagePixelCount v36;
  vImagePixelCount j;

  v6 = a6;
  v11 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", a3, a4, 0);
  v12 = (unint64_t)(float)((float)(-[CRImage height](self, "height") * a3) / (float)a4);
  if (-[CRImage width](self, "width") > v12)
    v12 = -[CRImage width](self, "width");
  v13 = (unint64_t)(float)((float)(-[CRImage width](self, "width") * a4) / (float)a3);
  if (-[CRImage height](self, "height") > v13)
    v13 = -[CRImage height](self, "height");
  if (v6)
    v14 = (v12 - -[CRImage width](self, "width")) >> 1;
  else
    v14 = 0;
  v15 = -[CRImage height](self, "height");
  v16 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", v12, v13, 0);
  v17 = v16;
  if (a5 == 3)
  {
    LOBYTE(v24) = -1;
  }
  else if (a5 == 2)
  {
    LOBYTE(v24) = 0x80;
  }
  else if (a5)
  {
    LOBYTE(v24) = 0;
  }
  else
  {
    width = self->_vImage.width;
    if (width)
    {
      v19 = 0;
      data = (unsigned __int8 *)self->_vImage.data;
      height = self->_vImage.height;
      v22 = height - 1;
      v23 = self->_vImage.width;
      do
      {
        v19 += *data + data[(height - 1) * self->_vImage.rowBytes];
        ++data;
        --v23;
      }
      while (v23);
    }
    else
    {
      v19 = 0;
      height = self->_vImage.height;
      v22 = height - 1;
    }
    if (v22 >= 2)
    {
      rowBytes = self->_vImage.rowBytes;
      v26 = v22 - 1;
      v27 = (unsigned __int8 *)self->_vImage.data + rowBytes;
      do
      {
        v19 += *v27 + v27[width - 1];
        v27 += rowBytes;
        --v26;
      }
      while (v26);
    }
    v24 = 2 * (height + width) - 4;
    if (v24)
      v24 = v19 / v24;
  }
  p_vImage = &v16->_vImage;
  v29 = v17->_vImage.height;
  if (v29)
  {
    v30 = 0;
    v31 = v17->_vImage.width;
    do
    {
      if (v31)
      {
        for (i = 0; i < v31; ++i)
        {
          *((_BYTE *)v17->_vImage.data + v30 * v17->_vImage.rowBytes + i) = v24;
          v31 = v17->_vImage.width;
        }
        v29 = v17->_vImage.height;
      }
      ++v30;
    }
    while (v29 > v30);
  }
  v33 = self->_vImage.height;
  if (v33)
  {
    v34 = 0;
    v35 = (v13 - v15) >> 1;
    v36 = self->_vImage.width;
    do
    {
      if (v36)
      {
        for (j = 0; j < v36; ++j)
        {
          *((_BYTE *)v17->_vImage.data + v35 * v17->_vImage.rowBytes + v14 + j) = *((_BYTE *)self->_vImage.data
                                                                                  + v34 * self->_vImage.rowBytes
                                                                                  + j);
          v36 = self->_vImage.width;
        }
        v33 = self->_vImage.height;
      }
      ++v34;
      ++v35;
    }
    while (v33 > v34);
  }
  vImageScale_Planar8(p_vImage, &v11->_vImage, 0, 0);

  return v11;
}

- (id)imageByDilating
{
  CRImage *v3;
  vImage_Error v4;
  uint64_t block;
  uint64_t v7;
  _BYTE *(*v8)(uint64_t);
  void *v9;
  uint64_t v10;

  v3 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage width](self, "width"), -[CRImage height](self, "height"), 0);
  block = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __26__CRImage_imageByDilating__block_invoke;
  v9 = &__block_descriptor_36_e5_v8__0l;
  LODWORD(v10) = 3;
  if (qword_1ED0B4938 != -1)
    dispatch_once(&qword_1ED0B4938, &block);
  v4 = vImageDilate_Planar8(&self->_vImage, &v3->_vImage, 0, 0, (const unsigned __int8 *)qword_1ED0B4940, 3uLL, 3uLL, 0x10u);
  if (v4)
    NSLog(CFSTR("%d"), v4, block, v7, v8, v9, v10);
  return v3;
}

_BYTE *__26__CRImage_imageByDilating__block_invoke(uint64_t a1)
{
  char *v2;
  _BYTE *result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;

  v2 = (char *)malloc_type_calloc((*(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 32)), 1uLL, 0x100004077774924uLL);
  qword_1ED0B4940 = (uint64_t)v2;
  result = memset(v2, 255, (*(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 32)));
  v4 = *(unsigned int *)(a1 + 32);
  if ((int)v4 >= 2)
  {
    v5 = 0;
    v6 = 0;
    v7 = v4 >> 1;
    do
    {
      v8 = 0;
      v9 = &v2[v7 + v7 * (unint64_t)v4];
      result = v9;
      do
      {
        if (((v4 - 1) * (v4 - 1)) >> 2 > (int)v6 * (int)v6 + (int)v8 * (int)v8)
        {
          v9[v6] = 0;
          v9[v5] = 0;
          result[v6] = 0;
          result[v5] = 0;
        }
        ++v8;
        result -= v4;
        v9 += v4;
      }
      while (v7 != v8);
      ++v6;
      --v5;
    }
    while (v6 != v7);
  }
  return result;
}

- (id)imageByApplyingBinaryMask:(id)a3
{
  _QWORD *v4;
  CRImage *v5;
  CRImage *v6;
  vImagePixelCount height;
  char *v8;
  vImagePixelCount v9;
  vImagePixelCount width;
  vImagePixelCount v11;
  vImagePixelCount v12;
  char *v13;
  size_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  char *v20;
  char *v21;
  char *v22;
  char v23;
  char v24;
  vImagePixelCount v25;
  vImagePixelCount v26;
  vImagePixelCount i;
  char v28;
  CRImage *v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;

  v4 = a3;
  v5 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage width](self, "width"), -[CRImage height](self, "height"), 0);
  v6 = v5;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  height = self->_vImage.height;
  if (!height)
    goto LABEL_41;
  v30 = v5;
  v8 = 0;
  v9 = 0;
  width = self->_vImage.width;
  v11 = width;
  do
  {
    if (v11)
    {
      v12 = 0;
      do
      {
        if (!*(_BYTE *)(v4[7] + v12 + v4[10] * v9))
        {
          v13 = (char *)self->_vImage.data + v12;
          v14 = self->_vImage.rowBytes * v9;
          if (v8 >= v33)
          {
            v16 = &v8[-v31];
            v17 = (uint64_t)&v8[-v31 + 1];
            if (v17 < 0)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v18 = (unint64_t)&v33[-v31];
            if (2 * (uint64_t)&v33[-v31] > (unint64_t)v17)
              v17 = 2 * v18;
            if (v18 >= 0x3FFFFFFFFFFFFFFFLL)
              v19 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v19 = v17;
            if (v19)
              v20 = (char *)operator new(v19);
            else
              v20 = 0;
            v21 = &v16[(_QWORD)v20];
            v16[(_QWORD)v20] = v13[v14];
            v15 = (uint64_t)&v16[(_QWORD)v20 + 1];
            if (v8 != (char *)v31)
            {
              v22 = &v8[~v31];
              do
              {
                v23 = *--v8;
                (v22--)[(_QWORD)v20] = v23;
              }
              while (v8 != (char *)v31);
              v8 = (char *)v31;
              v21 = v20;
            }
            v31 = (unint64_t)v21;
            v33 = &v20[v19];
            if (v8)
              operator delete(v8);
          }
          else
          {
            *v8 = v13[v14];
            v15 = (uint64_t)(v8 + 1);
          }
          v32 = v15;
          width = self->_vImage.width;
          v8 = (char *)v15;
        }
        ++v12;
      }
      while (width > v12);
      height = self->_vImage.height;
      v11 = width;
    }
    ++v9;
  }
  while (height > v9);
  if (v8 == (char *)v31)
  {
    v24 = 0;
    v6 = v30;
    if (!height)
      goto LABEL_39;
LABEL_31:
    v25 = 0;
    v26 = self->_vImage.width;
    do
    {
      if (v26)
      {
        for (i = 0; i < v26; ++i)
        {
          v28 = v24;
          if (*(_BYTE *)(v4[7] + v25 * v4[10] + i))
            v28 = *((_BYTE *)self->_vImage.data + v25 * self->_vImage.rowBytes + i);
          *((_BYTE *)v6->_vImage.data + v25 * v6->_vImage.rowBytes + i) = v28;
          v26 = self->_vImage.width;
        }
        height = self->_vImage.height;
      }
      ++v25;
    }
    while (height > v25);
    goto LABEL_39;
  }
  v6 = v30;
  std::__sort<std::__less<unsigned char,unsigned char> &,unsigned char *>();
  v8 = (char *)v31;
  v24 = *(_BYTE *)(v31 + ((v32 - v31) >> 1));
  height = self->_vImage.height;
  if (height)
    goto LABEL_31;
LABEL_39:
  if (v8)
    operator delete(v8);
LABEL_41:

  return v6;
}

+ (unint64_t)bytesPerPixelForColorSpace:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return qword_1D513BA58[a3];
}

+ (unint64_t)channelsForColorSpace:(int)a3
{
  if (a3 > 3)
    return 0;
  else
    return qword_1D513BA58[a3];
}

- (unint64_t)bytesPerPixel
{
  return objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", self->_colorSpace);
}

- (unint64_t)numChannels
{
  return objc_msgSend((id)objc_opt_class(), "channelsForColorSpace:", self->_colorSpace);
}

+ (id)nameForColorSpace:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E98DBEC8[a3];
}

- (id)description
{
  void *v3;
  void *v4;
  __CVBuffer *pixelBuffer;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("CRImage (%@) %ldpx x %ldpx\n"), objc_opt_class(), -[CRImage width](self, "width"), -[CRImage height](self, "height"));
  objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", -[CRImage colorSpace](self, "colorSpace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("- colorSpace: '%@'\n"), v4);

  if (self->_sceneStabilityMetric)
    objc_msgSend(v3, "appendFormat:", CFSTR("- sceneStability: %@"), self->_sceneStabilityMetric);
  if (self->_vImageDataIsCopy)
    objc_msgSend(v3, "appendFormat:", CFSTR("- HAS vImage COPY (%p)"), self->_vImage.data);
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
    objc_msgSend(v3, "appendFormat:", CFSTR("- HAS pixelBuffer (format: %i)"), CVPixelBufferGetPixelFormatType(pixelBuffer));
  if (self->_ciImage)
    objc_msgSend(v3, "appendFormat:", CFSTR("- HAS ciImage"));
  if (self->_cgImage)
    objc_msgSend(v3, "appendFormat:", CFSTR("- HAS cgImage"));
  return v3;
}

- (CRImage)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 colorSpace:(int)a5
{
  uint64_t v5;
  CRImage *v8;
  CRImage *v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  v5 = *(_QWORD *)&a5;
  v8 = -[CRImage init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_colorSpace = v5;
    v8->_isFullRange = 1;
    v10 = (void *)objc_opt_class();
    if (v10)
    {
      objc_msgSend(v10, "allocateVImageBufferWithWidth:height:colorSpace:", a3, a4, v5);
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
    }
    *(_OWORD *)&v9->_vImage.data = v12;
    *(_OWORD *)&v9->_vImage.width = v13;
    v9->_vImageDataIsCopy = 1;
  }
  return v9;
}

- (CRImage)initWithVImageBuffer:(vImage_Buffer *)a3 inColorSpace:(int)a4 toColorSpace:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  CRImage *v8;
  CRImage *v9;
  size_t v10;
  void *v11;
  void **p_data;
  CRImage *v13;
  __int128 v15;
  __int128 v16;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = -[CRImage init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_colorSpace = v5;
    v8->_isFullRange = 1;
    v10 = objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", v5);
    v11 = (void *)objc_opt_class();
    if (v11)
    {
      objc_msgSend(v11, "allocateVImageBufferWithWidth:height:bytesPerPixel:", a3->width, a3->height, v10);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    p_data = &v9->_vImage.data;
    *(_OWORD *)&v9->_vImage.data = v15;
    *(_OWORD *)&v9->_vImage.width = v16;
    v9->_vImageDataIsCopy = 1;
    if ((_DWORD)v6 == (_DWORD)v5)
    {
      vImageCopyBuffer(a3, &v9->_vImage, v10, 0);
    }
    else if ((objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", a3, v6, &v9->_vImage, v5) & 1) == 0)
    {
      free(*p_data);
      v13 = 0;
      *(_OWORD *)p_data = 0u;
      *(_OWORD *)&v9->_vImage.width = 0u;
      goto LABEL_9;
    }
  }
  v13 = v9;
LABEL_9:

  return v13;
}

- (CRImage)initWithVImageBuffer:(vImage_Buffer *)a3 inColorSpace:(int)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a3->width;
  v6[0] = *(_OWORD *)&a3->data;
  v6[1] = v4;
  return -[CRImage initWithVImageBuffer:inColorSpace:toColorSpace:](self, "initWithVImageBuffer:inColorSpace:toColorSpace:", v6, *(_QWORD *)&a4, *(_QWORD *)&a4);
}

- (CRImage)initWithMat:(const Mat *)a3
{
  int var9;
  uint64_t v6;
  uint64_t var3;
  uint64_t v8;
  int v9;
  uint64_t var8;
  char *v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;
  char *v15;
  uint64_t var4;
  int v17;
  int v18;
  int v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  float v27;
  float v28;
  float *v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  CRImage *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _OWORD v46[2];
  __int128 v47;
  __int128 v48;
  void (**v49)(cv::Mat *__hidden);
  _BYTE v50[276];
  _QWORD v51[3];
  _BYTE v52[272];
  _OWORD v53[18];
  _QWORD v54[3];
  _DWORD v55[68];
  _QWORD v56[3];

  cv::Mat::Mat((cv::Mat *)&v49);
  var9 = a3->var9;
  if (var9 > 16)
  {
    if (var9 != 17)
    {
      if (var9 != 65)
        goto LABEL_30;
      cv::Mat::Mat(v53, a3->var3, a3->var4, 1);
      var3 = a3->var3;
      if ((int)var3 < 1)
      {
        v13 = 0x8000;
        v19 = 0x7FFF;
      }
      else
      {
        v8 = 0;
        v9 = a3->var6[0];
        var8 = a3->var8;
        v11 = &a3->var1[(a3->var10[1] + a3->var10[0] * (uint64_t)v9) * var8];
        v12 = v9 * (uint64_t)(int)var8;
        v13 = 0x8000;
        v14 = 0x7FFF;
        do
        {
          v15 = v11;
          var4 = a3->var4;
          if (a3->var4 >= 1)
          {
            do
            {
              v18 = *(__int16 *)v15;
              v15 += 2;
              v17 = v18;
              if (v18 > v13)
                v13 = v17;
              if (v17 < v14)
                v14 = v17;
              --var4;
            }
            while (var4);
          }
          ++v8;
          v11 += v12;
        }
        while (v8 != var3);
        v19 = v14;
        v20 = 0.0;
        if (v13 == v14)
          goto LABEL_33;
      }
      v20 = 255.0 / (float)(v13 - v19);
LABEL_33:
      if ((int)var3 >= 1)
      {
        v35 = 0;
        LODWORD(v36) = a3->var4;
        do
        {
          if ((int)v36 >= 1)
          {
            v37 = 0;
            v38 = *((_QWORD *)&v53[0] + 1) + v55[0] * (v55[3] + HIDWORD(v53[9]) * (v55[2] + v35));
            v39 = &a3->var1[a3->var8 * (a3->var10[1] + a3->var6[0] * (a3->var10[0] + v35))];
            do
            {
              *(_BYTE *)(v38 + v37) = (int)(float)((float)((float)(*(__int16 *)&v39[2 * v37] - v19) * v20) + 0.0);
              ++v37;
              v36 = a3->var4;
            }
            while (v37 < v36);
            LODWORD(var3) = a3->var3;
          }
          ++v35;
        }
        while (v35 < (int)var3);
      }
LABEL_50:
      memcpy(v50, (char *)v53 + 8, sizeof(v50));
      cv::SmartPtr::operator=((cv::SmartPtr *)v51, (cv::SmartPtr *)v54, v56);
      v56[0] = &off_1E98D92C0;
      cv::SmartPtr::release((cv::SmartPtr *)v56);
      memcpy(v52, v55, sizeof(v52));
      *(_QWORD *)&v53[0] = &off_1E98D92A0;
      v54[0] = &off_1E98D92C0;
      cv::SmartPtr::release((cv::SmartPtr *)v54);
      cv::Mat::vImage((cv::Mat *)&v49, (uint64_t)v53);
      goto LABEL_51;
    }
    cv::Mat::Mat(v53, a3->var3, a3->var4, 1);
    v21 = a3->var3;
    if ((int)v21 < 1)
    {
      v27 = 1.1755e-38;
      v28 = 3.4028e38;
    }
    else
    {
      v22 = 0;
      v23 = a3->var6[0];
      v24 = a3->var8;
      v25 = &a3->var1[(a3->var10[1] + a3->var10[0] * (uint64_t)v23) * v24];
      v26 = v23 * (uint64_t)(int)v24;
      v27 = 1.1755e-38;
      v28 = 3.4028e38;
      do
      {
        v29 = (float *)v25;
        v30 = a3->var4;
        if (a3->var4 >= 1)
        {
          do
          {
            v31 = *v29++;
            v32 = v31;
            if (v31 > v27)
              v27 = v32;
            if (v32 < v28)
              v28 = v32;
            --v30;
          }
          while (v30);
        }
        ++v22;
        v25 += v26;
      }
      while (v22 != v21);
      if (v27 == v28)
      {
        v33 = 0.0;
        goto LABEL_43;
      }
    }
    v33 = 255.0 / (float)(v27 - v28);
LABEL_43:
    if ((int)v21 >= 1)
    {
      v40 = 0;
      LODWORD(v41) = a3->var4;
      do
      {
        if ((int)v41 >= 1)
        {
          v42 = 0;
          v43 = *((_QWORD *)&v53[0] + 1) + v55[0] * (v55[3] + HIDWORD(v53[9]) * (v55[2] + v40));
          v44 = &a3->var1[a3->var8 * (a3->var10[1] + a3->var6[0] * (a3->var10[0] + v40))];
          do
          {
            *(_BYTE *)(v43 + v42) = (int)(float)((float)((float)(*(float *)&v44[4 * v42] - v28) * v33) + 0.0);
            ++v42;
            v41 = a3->var4;
          }
          while (v42 < v41);
          LODWORD(v21) = a3->var3;
        }
        ++v40;
      }
      while (v40 < (int)v21);
    }
    goto LABEL_50;
  }
  if (var9 == 1)
  {
    cv::Mat::vImage((cv::Mat *)a3, (uint64_t)v53);
LABEL_51:
    v6 = 0;
    v47 = v53[0];
    v48 = v53[1];
    goto LABEL_52;
  }
  if (var9 == 4)
  {
    cv::Mat::vImage((cv::Mat *)a3, (uint64_t)v53);
    v47 = v53[0];
    v48 = v53[1];
    v6 = 1;
LABEL_52:
    v46[0] = v47;
    v46[1] = v48;
    self = -[CRImage initWithVImageBuffer:inColorSpace:toColorSpace:](self, "initWithVImageBuffer:inColorSpace:toColorSpace:", v46, v6, 1);
    v34 = self;
    goto LABEL_53;
  }
LABEL_30:
  NSLog(CFSTR("Unsupported color space"));
  v34 = 0;
LABEL_53:
  v49 = &off_1E98D92A0;
  v51[0] = &off_1E98D92C0;
  cv::SmartPtr::release((cv::SmartPtr *)v51);

  return v34;
}

- (id)imageByCroppingRectangle:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  CRImage *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (double)-[CRImage width](self, "width");
  v22.size.height = (double)-[CRImage height](self, "height");
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v22.size.width = v8;
  v21 = CGRectIntersection(v20, v22);
  v9 = v21.origin.x;
  v10 = v21.origin.y;
  v11 = v21.size.width;
  v12 = v21.size.height;
  v18 = 0u;
  v19 = 0u;
  -[CRImage vImage](self, "vImage");
  v13 = v18;
  v14 = *((_QWORD *)&v19 + 1) * (int)v10;
  *(_QWORD *)&v18 = v13 + v14 + -[CRImage bytesPerPixel](self, "bytesPerPixel") * (int)v9;
  *((_QWORD *)&v18 + 1) = (int)v12;
  *(_QWORD *)&v19 = (int)v11;
  v15 = [CRImage alloc];
  return -[CRImage initWithVImageBuffer:inColorSpace:](v15, "initWithVImageBuffer:inColorSpace:", &v17, -[CRImage colorSpace](self, "colorSpace", v18, v19));
}

- (id)imageByCroppingRectangle:(CGRect)a3 textFeaturePoints:(id)a4 radians:(float)a5 rotatedRoi:(CGRect *)a6
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v13;
  unint64_t v14;
  __float2 v15;
  int8x16_t *v16;
  id v17;
  uint64_t v18;
  int v19;
  double v20;
  double v21;
  uint64_t v22;
  double cosval;
  double v24;
  uint64_t v25;
  int v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  float v36;
  unint64_t v37;
  double v38;
  float32x2_t v39;
  float32x2_t v40;
  float64x2_t v41;
  uint64_t v42;
  void *v43;
  uint64x2_t v44;
  int v45;
  vImagePixelCount v46;
  unsigned __int8 *data;
  vImagePixelCount v48;
  float v49;
  vImagePixelCount v50;
  unsigned __int8 *v51;
  unint64_t v52;
  int8x16_t v53;
  int8x16_t v54;
  void *v55;
  CRImage *v56;
  int8x16_t *v58;
  float angleInRadians;
  double v60;
  double v61;
  double v62;
  int64x2_t v63;
  id v64;
  void *v65;
  int64x2_t v66;
  size_t rowBytes;
  vImage_Buffer dest;
  vImage_Buffer src;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v75 = *MEMORY[0x1E0C80C00];
  v64 = a4;
  v13 = -[CRImage width](self, "width");
  v14 = -[CRImage height](self, "height");
  v78.size.width = (double)v13;
  v78.size.height = (double)v14;
  v78.origin.x = 0.0;
  v78.origin.y = 0.0;
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  v77 = CGRectIntersection(v76, v78);
  v60 = v77.origin.x;
  v61 = v77.size.width;
  v62 = v77.size.height;
  angleInRadians = a5;
  v15 = __sincosf_stret(a5);
  v16 = (int8x16_t *)malloc_type_calloc(objc_msgSend(v64, "count"), 0x10uLL, 0x1000040451B5BE8uLL);
  v58 = (int8x16_t *)a6;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v17 = v64;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v18)
  {
    v19 = 0;
    v20 = width * 0.5;
    v21 = height * 0.5;
    v22 = *(_QWORD *)v71;
    cosval = v15.__cosval;
    v24 = (float)-v15.__sinval;
    do
    {
      v25 = 0;
      v26 = v19;
      v27 = (double *)&v16[v19].i64[1];
      do
      {
        if (*(_QWORD *)v71 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v25), "pointValue");
        v29 = v28;
        v31 = v30;
        v32 = -[CRImage width](self, "width");
        v33 = -[CRImage height](self, "height");
        v34 = v29 * (double)v32 - x - v20;
        v35 = v31 * (double)v33 - y - v21;
        v36 = v34 * cosval - v35 * v24;
        *(float *)&v34 = v35 * cosval + v34 * v24;
        *(v27 - 1) = v20 + v36;
        *v27 = v21 + *(float *)&v34;
        ++v25;
        v27 += 2;
      }
      while (v18 != v25);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      v19 = v26 + v25;
    }
    while (v18);
  }

  v37 = 0;
  v38 = fmax((double)-[CRImage width](self, "width"), (double)-[CRImage height](self, "height"));
  *(float *)&v38 = v38;
  v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v38, 0);
  v40 = 0;
  while (objc_msgSend(v17, "count") > v37)
  {
    v41 = (float64x2_t)vextq_s8(v16[v37], v16[v37], 8uLL);
    v39 = vcvt_f32_f64(vminnmq_f64(vcvtq_f64_f32(v39), v41));
    v40 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(v40), v41));
    ++v37;
  }
  free(v16);
  *(_OWORD *)&src.width = 0u;
  -[CRImage vImage](self, "vImage");
  src.data = (void *)(-[CRImage bytesPerPixel](self, "bytesPerPixel") * (int)v60);
  src.height = (int)v62;
  src.width = (int)v61;
  v42 = objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", -[CRImage colorSpace](self, "colorSpace"));
  memset(&dest, 0, sizeof(dest));
  v43 = (void *)objc_opt_class();
  v44 = vcvtq_u64_f64(vcvtq_f64_f32(vsub_f32(v40, v39)));
  v63 = (int64x2_t)v44;
  if (v43)
    objc_msgSend(v43, "allocateVImageBufferWithWidth:height:bytesPerPixel:", v44.i64[1], v44.i64[0], v42);
  else
    memset(&dest, 0, sizeof(dest));
  v45 = 0;
  v46 = src.height - 1;
  if (src.width)
  {
    data = (unsigned __int8 *)src.data;
    v48 = src.width;
    v49 = angleInRadians;
    do
    {
      v45 += *data + data[src.rowBytes * v46];
      ++data;
      --v48;
    }
    while (v48);
  }
  else
  {
    v49 = angleInRadians;
  }
  if (v46 >= 2)
  {
    v50 = src.height - 2;
    v51 = (unsigned __int8 *)src.data + src.rowBytes;
    do
    {
      v45 += *v51 + v51[src.width - 1];
      v51 += src.rowBytes;
      --v50;
    }
    while (v50);
  }
  v52 = 2 * (src.height + src.width) - 4;
  if (2 * (src.height + src.width) != 4)
    v52 = v45 / v52;
  vImageRotate_Planar8(&src, &dest, 0, v49, v52, 0);
  if (v58)
  {
    v53 = (int8x16_t)vcvtq_f64_f32(v39);
    v54 = (int8x16_t)vcvtq_f64_u64((uint64x2_t)v63);
    *v58 = vextq_s8(v53, v53, 8uLL);
    v58[1] = vextq_s8(v54, v54, 8uLL);
  }
  v55 = dest.data;
  -[CRImage bytesPerPixel](self, "bytesPerPixel");
  v65 = v55;
  v66 = vshrq_n_s64(vshlq_n_s64(v63, 0x20uLL), 0x20uLL);
  rowBytes = dest.rowBytes;
  v56 = -[CRImage initWithVImageBuffer:inColorSpace:]([CRImage alloc], "initWithVImageBuffer:inColorSpace:", &v65, -[CRImage colorSpace](self, "colorSpace"));
  free(dest.data);

  return v56;
}

- (CGRect)rotatedRoiByCroppingRectangle:(CGRect)a3 textFeaturePoints:(id)a4 radians:(float)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  __float2 v12;
  double *v13;
  id v14;
  uint64_t v15;
  int v16;
  double v17;
  double v18;
  uint64_t v19;
  double cosval;
  double v21;
  uint64_t v22;
  int v23;
  double *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  float v33;
  unint64_t v34;
  float v35;
  double *v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v51 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = __sincosf_stret(a5);
  v13 = (double *)malloc_type_calloc(objc_msgSend(v11, "count"), 0x10uLL, 0x1000040451B5BE8uLL);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v15)
  {
    v16 = 0;
    v17 = width * 0.5;
    v18 = height * 0.5;
    v19 = *(_QWORD *)v47;
    cosval = v12.__cosval;
    v21 = (float)-v12.__sinval;
    do
    {
      v22 = 0;
      v23 = v16;
      v24 = &v13[2 * v16 + 1];
      do
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v22), "pointValue");
        v26 = v25;
        v28 = v27;
        v29 = -[CRImage width](self, "width");
        v30 = -[CRImage height](self, "height");
        v31 = v26 * (double)v29 - x - v17;
        v32 = v28 * (double)v30 - y - v18;
        v33 = v31 * cosval - v32 * v21;
        *(float *)&v31 = v32 * cosval + v31 * v21;
        *(v24 - 1) = v17 + v33;
        *v24 = v18 + *(float *)&v31;
        ++v22;
        v24 += 2;
      }
      while (v15 != v22);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v16 = v23 + v22;
    }
    while (v15);
  }

  v34 = 0;
  v35 = fmax((double)-[CRImage width](self, "width"), (double)-[CRImage height](self, "height"));
  v36 = v13 + 1;
  v37 = 0.0;
  v38 = v35;
  v39 = 0.0;
  while (objc_msgSend(v14, "count") > v34)
  {
    v40 = *(v36 - 1);
    v35 = fmin(v35, v40);
    v41 = *v36;
    v36 += 2;
    v38 = fmin(v38, v41);
    v37 = fmax(v37, v40);
    v39 = fmax(v39, v41);
    ++v34;
  }
  free(v13);

  v42 = v38;
  v43 = (float)(v37 - v35);
  v44 = (float)(v39 - v38);
  v45 = v35;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v45;
  return result;
}

- (id)imageByCroppingRectangle:(CGRect)a3 toHeight:(unint64_t)a4 andWidth:(unint64_t)a5 withRotationAngle:(float)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  CRImage *v20;
  CRImage *v21;
  CRImage *v22;
  __int128 v24;
  vImage_Buffer dest;
  vImage_Buffer v26;
  vImage_Buffer src;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = (double)-[CRImage width](self, "width");
  v30.size.height = (double)-[CRImage height](self, "height");
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v30.size.width = v14;
  v29 = CGRectIntersection(v28, v30);
  v15 = v29.origin.x;
  v16 = v29.size.width;
  v17 = v29.size.height;
  *(_OWORD *)&src.width = 0u;
  -[CRImage vImage](self, "vImage");
  src.data = (void *)(-[CRImage bytesPerPixel](self, "bytesPerPixel") * (int)v15);
  src.height = (int)v17;
  src.width = (int)v16;
  if (src.height <= a4)
  {
    v20 = [CRImage alloc];
    v26 = src;
    v21 = -[CRImage initWithVImageBuffer:inColorSpace:](v20, "initWithVImageBuffer:inColorSpace:", &v26, -[CRImage colorSpace](self, "colorSpace"));
  }
  else
  {
    memset(&dest, 0, sizeof(dest));
    v18 = (void *)objc_opt_class();
    v19 = -[CRImage bytesPerPixel](self, "bytesPerPixel");
    if (v18)
      objc_msgSend(v18, "allocateVImageBufferWithWidth:height:bytesPerPixel:", a5, a4, v19);
    else
      memset(&dest, 0, sizeof(dest));
    vImageRotate_Planar8(&src, &dest, 0, a6, 0, 0);
    v22 = [CRImage alloc];
    v21 = -[CRImage initWithVImageBuffer:inColorSpace:](v22, "initWithVImageBuffer:inColorSpace:", &v24, -[CRImage colorSpace](self, "colorSpace", dest.data, dest.height, dest.width, dest.rowBytes));
    if (dest.data)
      free(dest.data);
  }
  return v21;
}

- (id)imageByRectifyingRegion:(id)a3 homography:(id *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  CRImage *v38;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float32x2_t v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  _QWORD v59[10];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", -[CRImage pixelBuffer](self, "pixelBuffer"));
  v63[0] = CFSTR("inputTopLeft");
  objc_msgSend(v6, "topLeft");
  v9 = v8;
  v11 = v10;
  -[CRImage size](self, "size");
  CIImageCoordinateFromCGPoint(v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v14;
  v63[1] = CFSTR("inputTopRight");
  objc_msgSend(v6, "topRight");
  v16 = v15;
  v18 = v17;
  -[CRImage size](self, "size");
  CIImageCoordinateFromCGPoint(v16, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v21;
  v63[2] = CFSTR("inputBottomRight");
  objc_msgSend(v6, "bottomRight");
  v23 = v22;
  v25 = v24;
  -[CRImage size](self, "size");
  CIImageCoordinateFromCGPoint(v23, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v28;
  v63[3] = CFSTR("inputBottomLeft");
  objc_msgSend(v6, "bottomLeft");
  v30 = v29;
  v32 = v31;
  -[CRImage size](self, "size");
  CIImageCoordinateFromCGPoint(v30, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPerspectiveCorrection"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = -[CRImage initWithCIImage:toColorSpace:]([CRImage alloc], "initWithCIImage:toColorSpace:", v37, -[CRImage colorSpace](self, "colorSpace"));
  if (a4)
  {
    v59[8] = 0;
    v59[9] = 0;
    __asm { FMOV            V1.2D, #1.0 }
    v60 = xmmword_1D513A880;
    v61 = _Q1;
    v62 = xmmword_1D513A890;
    objc_msgSend(v6, "topLeft");
    objc_msgSend(v6, "topRight", v44, v45);
    v59[2] = v46;
    v59[3] = v47;
    objc_msgSend(v6, "bottomRight");
    v59[4] = v48;
    v59[5] = v49;
    objc_msgSend(v6, "bottomLeft");
    v59[6] = v50;
    v59[7] = v51;
    v52 = computeHomographyMatrix((uint64_t)v59);
    *((_DWORD *)a4 + 2) = v53;
    *((_DWORD *)a4 + 6) = v54;
    *(float32x2_t *)a4 = v52;
    *((_QWORD *)a4 + 2) = v55;
    *((_DWORD *)a4 + 10) = v56;
    *((_QWORD *)a4 + 4) = v57;
  }

  return v38;
}

- (void)writeToURL:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("file://"), &stru_1E98DC948);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRImage writeToFile:](self, "writeToFile:", v4);

}

- (void)writeToFile:(id)a3
{
  id v4;

  v4 = a3;
  writeCGImageWithMetadata(-[CRImage cgImage](self, "cgImage"), v4, 0);

}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  void *data;
  CGImage *cgImage;
  objc_super v6;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    CVPixelBufferRelease(self->_pixelBuffer);
    self->_pixelBuffer = 0;
  }
  if (self->_vImageDataIsCopy)
  {
    data = self->_vImage.data;
    if (data)
    {
      free(data);
      self->_vImage.data = 0;
      self->_vImageDataIsCopy = 0;
    }
  }
  cgImage = self->_cgImage;
  if (cgImage)
  {
    CGImageRelease(cgImage);
    self->_cgImage = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRImage;
  -[CRImage dealloc](&v6, sel_dealloc);
}

- (id)imageByInvertingIntensity
{
  CRImage *v3;
  CRImage *v4;
  CRImage *v5;
  uint64_t v6;
  unint64_t i;
  unint64_t j;
  char v9;
  uint64_t v11;
  char v12[32];

  v3 = [CRImage alloc];
  -[CRImage vImage](self, "vImage");
  v4 = -[CRImage initWithVImageBuffer:inColorSpace:](v3, "initWithVImageBuffer:inColorSpace:", v12, 0);
  v5 = v4;
  if (v4)
  {
    -[CRImage vImage](v4, "vImage");
    v6 = v11;
  }
  else
  {
    v6 = 0;
  }
  for (i = 0; -[CRImage width](v5, "width") > i; ++i)
  {
    for (j = 0; -[CRImage height](v5, "height") > j; ++j)
    {
      v9 = *(_BYTE *)(v6 + i + -[CRImage width](v5, "width") * j);
      *(_BYTE *)(v6 + i + -[CRImage width](v5, "width") * j) = ~v9;
    }
  }
  return v5;
}

- (CRImage)initWithCGImage:(CGImage *)a3 toColorSpace:(int)a4
{
  return -[CRImage initWithCGImage:properties:toColorSpace:](self, "initWithCGImage:properties:toColorSpace:", a3, 0, *(_QWORD *)&a4);
}

+ (void)cgOrientation:(unsigned int)a3 toVImageRotationMode:(char *)a4 andReflection:(int *)a5
{
  signed int v5;
  unint64_t v6;
  int v7;

  v5 = a3 - 2;
  if (a3 - 2 > 6)
  {
    LOBYTE(v6) = 0;
    v7 = 0;
  }
  else
  {
    v6 = 0x1030301020200uLL >> (8 * v5);
    v7 = dword_1D513BA78[v5];
  }
  *a4 = v6;
  *a5 = v7;
}

+ (vImage_Buffer)applyEXIFTransformsOnImage:(SEL)a3 inColorSpace:(const vImage_Buffer *)a4 properties:(int)a5
{
  uint64_t v6;
  __int128 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  vImage_Buffer *result;
  __int128 v22;
  __int128 v23;
  int v24;
  uint8_t rotationConstant;
  vImage_Buffer buf;
  uint64_t v27;

  v6 = *(_QWORD *)&a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)&a4->width;
  *(_OWORD *)&retstr->data = *(_OWORD *)&a4->data;
  *(_OWORD *)&retstr->width = v8;
  objc_msgSend(a6, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_34;
  rotationConstant = 0;
  v24 = 0;
  objc_msgSend((id)objc_opt_class(), "cgOrientation:toVImageRotationMode:andReflection:", objc_msgSend(v9, "intValue"), &rotationConstant, &v24);
  v11 = objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", v6);
  v12 = v11;
  if (v11 != 1 && v11 != 4)
  {
    CROSLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.data) = 138412290;
      *(void **)((char *)&buf.data + 4) = v16;
      _os_log_impl(&dword_1D4FB8000, v15, OS_LOG_TYPE_ERROR, "[CRImage applyEXIFTransformsOnImage:inColorSpace:properties:] Color space %@ not supported. Only color spaces with 1 or 4 bytes per pixel are supported.", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_34;
  }
  if (rotationConstant)
  {
    v13 = *(_OWORD *)&retstr->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&retstr->data;
    *(_OWORD *)&buf.width = v13;
    if ((rotationConstant & 1) != 0)
    {
      v17 = (void *)objc_opt_class();
      if (v17)
      {
        objc_msgSend(v17, "allocateVImageBufferWithWidth:height:bytesPerPixel:", buf.height, buf.width, v12);
        goto LABEL_14;
      }
    }
    else
    {
      v14 = (void *)objc_opt_class();
      if (v14)
      {
        objc_msgSend(v14, "allocateVImageBufferWithWidth:height:bytesPerPixel:", buf.width, buf.height, v12);
LABEL_14:
        *(_OWORD *)&retstr->data = v22;
        *(_OWORD *)&retstr->width = v23;
        if (v12 == 1)
          vImageRotate90_Planar8(&buf, retstr, rotationConstant, 0, 0);
        else
          vImageRotate90_ARGB8888(&buf, retstr, rotationConstant, black_ARGB8888, 0);
        free(buf.data);
        goto LABEL_18;
      }
    }
    v22 = 0u;
    v23 = 0u;
    goto LABEL_14;
  }
LABEL_18:
  if (v24)
  {
    v18 = *(_OWORD *)&retstr->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&retstr->data;
    *(_OWORD *)&buf.width = v18;
    if (v24 == 2)
    {
      v20 = (void *)objc_opt_class();
      if (v20)
      {
        objc_msgSend(v20, "allocateVImageBufferWithWidth:height:bytesPerPixel:", buf.width, buf.height, v12);
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
      }
      *(_OWORD *)&retstr->data = v22;
      *(_OWORD *)&retstr->width = v23;
      if (v12 == 1)
        vImageHorizontalReflect_Planar8(&buf, retstr, 0);
      else
        vImageHorizontalReflect_ARGB8888(&buf, retstr, 0);
      goto LABEL_33;
    }
    if (v24 == 1)
    {
      v19 = (void *)objc_opt_class();
      if (v19)
      {
        objc_msgSend(v19, "allocateVImageBufferWithWidth:height:bytesPerPixel:", buf.width, buf.height, v12);
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
      }
      *(_OWORD *)&retstr->data = v22;
      *(_OWORD *)&retstr->width = v23;
      if (v12 == 1)
        vImageVerticalReflect_Planar8(&buf, retstr, 0);
      else
        vImageVerticalReflect_ARGB8888(&buf, retstr, 0);
LABEL_33:
      free(buf.data);
    }
  }
LABEL_34:

  return result;
}

- (CRImage)initWithCGImage:(CGImage *)a3 properties:(id)a4 toColorSpace:(int)a5
{
  uint64_t v5;
  id v8;
  CRImage *v9;
  size_t Width;
  size_t Height;
  void *v12;
  CGColorSpace *DeviceRGB;
  vImage_Error v14;
  CRImage *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  __int128 v22;
  vImage_Buffer v24;
  vImage_Buffer v25;
  vImage_CGImageFormat format;
  vImage_Buffer buf;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = -[CRImage init](self, "init");
  if (!v9)
  {
LABEL_27:
    v15 = v9;
    goto LABEL_28;
  }
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  memset(&buf, 0, sizeof(buf));
  v12 = (void *)objc_opt_class();
  if (v12)
    objc_msgSend(v12, "allocateVImageBufferWithWidth:height:colorSpace:", Width, Height, 1);
  else
    memset(&buf, 0, sizeof(buf));
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_QWORD *)&format.bitsPerComponent = 0x2000000008;
  format.colorSpace = DeviceRGB;
  format.bitmapInfo = 4;
  memset(&format.version, 0, 20);
  v14 = vImageBuffer_InitWithCGImage(&buf, &format, 0, a3, 0x200u);
  CGColorSpaceRelease(DeviceRGB);
  if (v14)
    goto LABEL_6;
  v16 = objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", v5);
  v17 = v16;
  if (v16 != 1 && v16 != 4)
  {
    v18 = (void *)objc_opt_class();
    if (v18)
      objc_msgSend(v18, "applyEXIFTransformsOnImage:inColorSpace:properties:", &buf, 1, v8);
    else
      memset(&v25, 0, sizeof(v25));
    buf = v25;
  }
  if ((_DWORD)v5 == 1)
  {
    v25 = buf;
LABEL_19:
    if (v17 == 4 || v17 == 1)
    {
      v21 = (void *)objc_opt_class();
      if (v21)
        objc_msgSend(v21, "applyEXIFTransformsOnImage:inColorSpace:properties:", &v25, v5, v8);
      else
        memset(&v24, 0, sizeof(v24));
      v25 = v24;
    }
    v9->_colorSpace = v5;
    v9->_isFullRange = 1;
    v22 = *(_OWORD *)&v25.width;
    *(_OWORD *)&v9->_vImage.data = *(_OWORD *)&v25.data;
    *(_OWORD *)&v9->_vImage.width = v22;
    v9->_vImageDataIsCopy = 1;
    goto LABEL_27;
  }
  v19 = (void *)objc_opt_class();
  if (v19)
    objc_msgSend(v19, "allocateVImageBufferWithWidth:height:colorSpace:", Width, Height, v5);
  else
    memset(&v24, 0, sizeof(v24));
  v25 = v24;
  v20 = objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", &buf, 1, &v25, v5);
  free(buf.data);
  if ((v20 & 1) != 0)
    goto LABEL_19;
  free(v25.data);
LABEL_6:
  v15 = 0;
LABEL_28:

  return v15;
}

- (CRImage)initWithContentsOfURL:(id)a3 toColorSpace:(int)a4
{
  uint64_t v4;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImage *ImageAtIndex;
  CFDictionaryRef v9;
  CRImage *v10;

  v4 = *(_QWORD *)&a4;
  v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  v7 = v6;
  if (v6)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
    if (ImageAtIndex)
    {
      v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      v10 = -[CRImage initWithCGImage:properties:toColorSpace:](self, "initWithCGImage:properties:toColorSpace:", ImageAtIndex, v9, v4);

      CGImageRelease(ImageAtIndex);
      CFRelease(v7);
      self = v10;
      v7 = (CGImageSource *)self;
    }
    else
    {
      CFRelease(v7);
      v7 = 0;
    }
  }

  return (CRImage *)v7;
}

+ (BOOL)convertVImage:(const vImage_Buffer *)a3 inColorSpace:(int)a4 toVImage:(vImage_Buffer *)a5 toColorSpace:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  size_t v10;
  vImage_Error v11;
  NSObject *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  vImage_Error v19;
  void *data;
  void *v21;
  uint8_t v23[2];
  char v24;
  vImage_Buffer permuteMap;
  vImage_ARGBToYpCbCr buf;
  uint64_t v27;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  if (a4 != a6)
  {
    switch(a4)
    {
      case 0:
        if (a6 == 1)
        {
          v11 = vImageConvert_Planar8ToXRGB8888(0xFFu, a3, a3, a3, a5, 0);
          goto LABEL_3;
        }
        if (a6 == 3)
        {
          memset(&buf, 0, 32);
          v17 = (void *)objc_opt_class();
          if (v17)
            objc_msgSend(v17, "allocateVImageBufferWithWidth:height:colorSpace:", a3->width, a3->height, 1);
          else
            memset(&buf, 0, 32);
          if (!vImageOverwriteChannelsWithPixel_ARGB8888(black_AYpCbCr, (const vImage_Buffer *)&buf, (const vImage_Buffer *)&buf, 0xFu, 0)&& !vImageOverwriteChannels_ARGB8888(a3, (const vImage_Buffer *)&buf, (const vImage_Buffer *)&buf, 4u, 0))
          {
            v19 = vImageConvert_ARGB8888toRGB888((const vImage_Buffer *)&buf, a5, 0);
            data = *(void **)buf.opaque;
            goto LABEL_55;
          }
        }
        else if (a6 == 2 && !vImageOverwriteChannelsWithPixel_ARGB8888(black_AYpCbCr, a5, a5, 0xFu, 0))
        {
          v11 = vImageOverwriteChannels_ARGB8888(a3, a5, a5, 4u, 0);
          goto LABEL_3;
        }
        goto LABEL_4;
      case 1:
        if (a6 == 3)
        {
          if (!vImageConvert_ARGBToYpCbCr_GenerateConversion((const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x1E0C8BDA0], &fullYpCbCrPixelRange, &buf, kvImageARGB8888, kvImage444CrYpCb8, 0)&& !vImageConvert_ARGB8888To444CrYpCb8(a3, a5, &buf, 0, 0))
          {
            BYTE2(permuteMap.data) = 0;
            LOWORD(permuteMap.data) = 513;
            v11 = vImagePermuteChannels_RGB888(a5, a5, (const uint8_t *)&permuteMap, 0);
            goto LABEL_3;
          }
          goto LABEL_4;
        }
        if (a6 == 2)
        {
          if (vImageConvert_ARGBToYpCbCr_GenerateConversion((const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x1E0C8BDA0], &fullYpCbCrPixelRange, &buf, kvImageARGB8888, kvImage444AYpCbCr8, 0))
          {
            goto LABEL_4;
          }
          v11 = vImageConvert_ARGB8888To444AYpCbCr8(a3, a5, &buf, 0, 0);
        }
        else
        {
          if (a6)
            goto LABEL_4;
          *(_QWORD *)buf.opaque = 0x93B5B921B330000;
          v11 = vImageMatrixMultiply_ARGB8888ToPlanar8(a3, a5, (const int16_t *)&buf, 0x7FFF, 0, 0x3FFF, 0);
        }
        goto LABEL_3;
      case 2:
        if (!a6)
        {
          v15 = 1;
          if (vImageExtractChannel_ARGB8888(a3, a5, 1, 0))
            goto LABEL_4;
          return v15;
        }
        if (a6 == 3)
        {
          vImageConvert_ARGB8888toRGB888(a3, a5, 0);
          return 1;
        }
        if (a6 == 1
          && !vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E0C8BDB0], &fullYpCbCrPixelRange, (vImage_YpCbCrToARGB *)&buf, kvImage444AYpCbCr8, kvImageARGB8888, 0))
        {
          v11 = vImageConvert_444AYpCbCr8ToARGB8888(a3, a5, (const vImage_YpCbCrToARGB *)&buf, 0, 0);
          goto LABEL_3;
        }
        goto LABEL_4;
      case 3:
        if (a6)
        {
          if (a6 == 2)
          {
            v11 = vImageConvert_RGB888toARGB8888(a3, 0, 0xFFu, a5, 0, 0);
            goto LABEL_3;
          }
          if (a6 != 1)
            goto LABEL_4;
          memset(&permuteMap, 0, sizeof(permuteMap));
          v16 = (void *)objc_opt_class();
          if (v16)
            objc_msgSend(v16, "allocateVImageBufferWithWidth:height:colorSpace:", a3->width, a3->height, 3);
          else
            memset(&permuteMap, 0, sizeof(permuteMap));
          v24 = 1;
          *(_WORD *)v23 = 2;
          if (vImagePermuteChannels_RGB888(a3, &permuteMap, v23, 0)
            || vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E0C8BDB0], &fullYpCbCrPixelRange, (vImage_YpCbCrToARGB *)&buf, kvImage444CrYpCb8, kvImageARGB8888, 0))
          {
            free(permuteMap.data);
            goto LABEL_4;
          }
          v19 = vImageConvert_444CrYpCb8ToARGB8888(&permuteMap, a5, (const vImage_YpCbCrToARGB *)&buf, 0, 0xFFu, 0);
        }
        else
        {
          memset(&buf, 0, 32);
          v18 = (void *)objc_opt_class();
          if (v18)
            objc_msgSend(v18, "allocateVImageBufferWithWidth:height:bytesPerPixel:", a3->width, a3->height, 1);
          else
            memset(&buf, 0, 32);
          memset(&permuteMap, 0, sizeof(permuteMap));
          v21 = (void *)objc_opt_class();
          if (v21)
            objc_msgSend(v21, "allocateVImageBufferWithWidth:height:bytesPerPixel:", a3->width, a3->height, 1);
          else
            memset(&permuteMap, 0, sizeof(permuteMap));
          v19 = vImageConvert_RGB888toPlanar8(a3, a5, (const vImage_Buffer *)&buf, &permuteMap, 0);
          free(*(void **)buf.opaque);
        }
        data = permuteMap.data;
LABEL_55:
        free(data);
        if (!v19)
          return 1;
        goto LABEL_4;
      default:
        return 1;
    }
  }
  v10 = objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", *(_QWORD *)&a4);
  v11 = vImageCopyBuffer(a3, a5, v10, 0);
LABEL_3:
  if (!v11)
    return 1;
LABEL_4:
  CROSLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf.opaque = 138412546;
    *(_QWORD *)&buf.opaque[4] = v13;
    *(_WORD *)&buf.opaque[12] = 2112;
    *(_QWORD *)&buf.opaque[14] = v14;
    _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_ERROR, "[CRImage convertVImage:inColorSpace:toVImage:toColorSpace:] Unable to convert %@ to %@", buf.opaque, 0x16u);

  }
  return 0;
}

- (id)imageByConvertingToColorSpace:(int)a3
{
  CRImage *v4;
  uint64_t v5;
  CRImage *v6;

  if (self->_colorSpace == a3)
  {
    v4 = self;
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    v6 = -[CRImage initWithWidth:height:colorSpace:]([CRImage alloc], "initWithWidth:height:colorSpace:", -[CRImage width](self, "width"), -[CRImage height](self, "height"), *(_QWORD *)&a3);
    if (objc_msgSend((id)objc_opt_class(), "convertVImage:inColorSpace:toVImage:toColorSpace:", &self->_vImage, self->_colorSpace, &v6->_vImage, v5))v4 = v6;
    else
      v4 = 0;

  }
  return v4;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4 strings:(id)a5 lineWidth:(double)a6 red:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10
{
  id v18;
  CGImage *v19;
  size_t v20;
  size_t v21;
  uint64_t (*v22)();
  CGColorSpaceRef DeviceRGB;
  uint64_t (*v24)();
  CGContextRef v25;
  __int128 v26;
  uint64_t (*v27)();
  CGColorRef GenericRGB;
  uint64_t v29;
  CGRect *v30;
  uint64_t (*v31)();
  CGMutablePathRef Mutable;
  double height;
  uint64_t (*v34)();
  const __CFAttributedString *v35;
  CTFramesetterRef v36;
  uint64_t (*v37)();
  CTFrameRef v38;
  uint64_t (*v39)();
  CGImageRef Image;
  CRImage *v41;
  CRImage *v42;
  CTFrameRef frame;
  CFTypeRef cf;
  CGMutablePathRef path;
  CFTypeRef v47;
  CGAffineTransform transform;
  CGContextRef c;
  CGColorSpaceRef space;
  CFRange v51;
  CGRect v52;
  CGRect v53;

  v18 = a5;
  v19 = -[CRImage cgImage](self, "cgImage");
  v20 = -[CRImage width](self, "width");
  v21 = -[CRImage height](self, "height");
  v22 = makeCFPointer<CGColorSpace *>;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v22)((uint64_t)DeviceRGB, &space);
  v24 = makeCFPointer<CGContext *>;
  v25 = CGBitmapContextCreate(0, v20, v21, 8uLL, 4 * v20, space, 6u);
  ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v24)((uint64_t)v25, &c);
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&transform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&transform.c = v26;
  *(_OWORD *)&transform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGContextConcatCTM(c, &transform);
  v52.size.width = (double)v20;
  v52.size.height = (double)v21;
  v52.origin.x = 0.0;
  v52.origin.y = 0.0;
  CGContextDrawImage(c, v52, v19);
  CGContextSetRGBStrokeColor(c, a7, a8, a9, a10);
  CGContextSetRGBFillColor(c, a7, a8, a9, a10);
  if (a4 >= 1 && v18)
  {
    CGContextSetTextDrawingMode(c, kCGTextFill);
    v27 = makeCFPointer<CGColor *>;
    GenericRGB = CGColorCreateGenericRGB(a7, a8, a9, a10);
    ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v27)((uint64_t)GenericRGB, &v47);
    v29 = 0;
    v30 = a3;
    do
    {
      CGContextSetTextPosition(c, v30->origin.x, v30->origin.y);
      v31 = makeCFPointer<CGPath *>;
      Mutable = CGPathCreateMutable();
      ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v31)((uint64_t)Mutable, &path);
      v53.origin.x = v30->origin.x;
      v53.size.width = v30->size.width;
      height = v30->size.height;
      v53.origin.y = v30->origin.y - height;
      v53.size.height = height + height;
      CGPathAddRect(path, 0, v53);
      v34 = makeCFPointer<__CTFramesetter const*>;
      objc_msgSend(v18, "objectAtIndexedSubscript:", v29);
      v35 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
      v36 = CTFramesetterCreateWithAttributedString(v35);
      ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v34)((uint64_t)v36, &cf);

      v37 = makeCFPointer<__CTFrame const*>;
      v51.location = 0;
      v51.length = 0;
      v38 = CTFramesetterCreateFrame((CTFramesetterRef)cf, v51, path, 0);
      ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v37)((uint64_t)v38, &frame);
      CTFrameDraw(frame, c);
      if (frame)
        CFRelease(frame);
      if (cf)
        CFRelease(cf);
      if (path)
        CFRelease(path);
      ++v29;
      ++v30;
    }
    while (a4 != v29);
    if (v47)
      CFRelease(v47);
  }
  CGContextSetLineWidth(c, a6);
  CGContextAddRects(c, a3, a4);
  CGContextStrokePath(c);
  v39 = makeCFPointer<CGImage *>;
  Image = CGBitmapContextCreateImage(c);
  ((void (*)(uint64_t@<X0>, _QWORD *@<X8>))v39)((uint64_t)Image, &v47);
  v41 = [CRImage alloc];
  v42 = -[CRImage initWithCGImage:toColorSpace:](v41, "initWithCGImage:toColorSpace:", v47, 1);
  if (v47)
    CFRelease(v47);
  if (c)
    CFRelease(c);
  if (space)
    CFRelease(space);

  return v42;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4
{
  return -[CRImage imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:](self, "imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:", a3, a4, 0, 3.0, 1.0, 0.0, 0.0, 1.0);
}

- (id)imageByOverlayingRegions:(id)a3 strings:(id)a4 lineWidth:(double)a5 red:(double)a6 green:(double)a7 blue:(double)a8 alpha:(double)a9
{
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  double *v41;
  char *v42;
  __int128 v43;
  char *v44;
  char *v45;
  CRImage *v46;
  double v48;
  char *__p;
  char *v50;
  char *v51;

  v48 = a9;
  v15 = a3;
  v16 = a4;
  __p = 0;
  v50 = 0;
  v51 = 0;
  v17 = objc_msgSend(v15, "count");
  if (v17)
  {
    if (v17 >> 59)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    __p = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v51, v17);
    v50 = __p;
    v51 = &__p[32 * v18];
  }
  for (i = 0; i < objc_msgSend(v15, "count", *(_QWORD *)&v48); ++i)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "boundingQuad");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "denormalizedQuad");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "boundingBox");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    -[CRImage size](self, "size");
    v32 = v31 - v26 - v30;
    v33 = v50;
    if (v50 >= v51)
    {
      v35 = __p;
      v36 = (v50 - __p) >> 5;
      v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 59)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v38 = v51 - __p;
      if ((v51 - __p) >> 4 > v37)
        v37 = v38 >> 4;
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0)
        v39 = 0x7FFFFFFFFFFFFFFLL;
      else
        v39 = v37;
      if (v39)
      {
        v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v51, v39);
        v35 = __p;
        v33 = v50;
      }
      else
      {
        v40 = 0;
      }
      v41 = (double *)&v40[32 * v36];
      *(_QWORD *)v41 = v24;
      v41[1] = v32;
      *((_QWORD *)v41 + 2) = v28;
      v41[3] = v30;
      if (v33 == v35)
      {
        v44 = &v40[32 * v36];
      }
      else
      {
        v42 = &v40[32 * v36];
        do
        {
          v43 = *((_OWORD *)v33 - 1);
          v44 = v42 - 32;
          *((_OWORD *)v42 - 2) = *((_OWORD *)v33 - 2);
          *((_OWORD *)v42 - 1) = v43;
          v33 -= 32;
          v42 -= 32;
        }
        while (v33 != v35);
      }
      v34 = (char *)(v41 + 4);
      __p = v44;
      v51 = &v40[32 * v39];
      if (v35)
        operator delete(v35);
    }
    else
    {
      *(_QWORD *)v50 = v24;
      *((double *)v50 + 1) = v32;
      v34 = v50 + 32;
      *((_QWORD *)v50 + 2) = v28;
      *((double *)v50 + 3) = v30;
    }
    v50 = v34;
  }
  v45 = __p;
  if (__p == v50)
  {
    v46 = self;
    if (!__p)
      goto LABEL_28;
    goto LABEL_27;
  }
  -[CRImage imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:](self, "imageByOverlayingRects:count:strings:lineWidth:red:green:blue:alpha:", __p, (v50 - __p) >> 5, v16, a5, a6, a7, a8, v48);
  v46 = (CRImage *)objc_claimAutoreleasedReturnValue();
  v45 = __p;
  if (__p)
LABEL_27:
    operator delete(v45);
LABEL_28:

  return v46;
}

+ (void)drawVerticalLineAtXOffset:(double)a3 image:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "vImage");
    v7 = v11;
  }
  else
  {
    v7 = 0;
  }
  v8 = 0;
  v9 = llround(a3);
  v10 = v7 + (v9 & ~(v9 >> 31));
  while (objc_msgSend(v6, "height") > v8)
    *(_BYTE *)(v10 + objc_msgSend(v6, "width") * v8++) = 125;

}

- (vImage_Buffer)vImage
{
  vImage_Buffer *result;

  objc_copyStruct(retstr, &self->_vImage, 32, 1, 0);
  return result;
}

- (void)setCiImage:(id)a3
{
  objc_storeStrong((id *)&self->_ciImage, a3);
}

- (void)setCgImage:(CGImage *)a3
{
  self->_cgImage = a3;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)isFullRange
{
  return self->_isFullRange;
}

- (NSNumber)sceneStabilityMetric
{
  return self->_sceneStabilityMetric;
}

- (void)setSceneStabilityMetric:(id)a3
{
  objc_storeStrong((id *)&self->_sceneStabilityMetric, a3);
}

- (BOOL)vImageDataIsCopy
{
  return self->_vImageDataIsCopy;
}

- (void)setVImageDataIsCopy:(BOOL)a3
{
  self->_vImageDataIsCopy = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sceneStabilityMetric, 0);
  objc_storeStrong((id *)&self->_ciImage, 0);
}

@end
