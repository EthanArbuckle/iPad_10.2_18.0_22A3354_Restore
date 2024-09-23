@implementation VIImageScaler

- (VIImageScaler)init
{
  VIImageScaler *v2;
  VIImageScaler *v3;
  CFTypeRef *p_transferSession;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VIImageScaler;
  v2 = -[VIImageScaler init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    p_transferSession = (CFTypeRef *)&v2->_transferSession;
    if (VTPixelTransferSessionCreate(0, &v2->_transferSession))
    {
      if (*p_transferSession)
        CFRelease(*p_transferSession);
      *p_transferSession = 0;
    }
    v3->useFill = 0;
    *(int32x2_t *)&v3->fillColor[3] = vdup_n_s32(0xFF000000);
    v3->scaleMode = 3;
    v3->needFill = 0;
    v3->entireImage.origin.x = 0.0;
    v3->entireImage.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v3->entireImage.size = _Q0;
  }
  return v3;
}

- (int)setScalingMode:(unint64_t)a3
{
  void *v5;
  BOOL v6;
  uint64_t *v7;
  uint64_t *v8;
  NSObject *v9;
  int v10;
  void *v11;
  _DWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1uLL:
      v16 = *MEMORY[0x1E0CED848];
      v17 = *MEMORY[0x1E0CEDB48];
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = 1;
      v7 = &v17;
      v8 = &v16;
      goto LABEL_11;
    case 2uLL:
      v20 = *MEMORY[0x1E0CED848];
      v21[0] = *MEMORY[0x1E0CEDB38];
      v6 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3uLL:
      v14 = *MEMORY[0x1E0CED848];
      v15 = *MEMORY[0x1E0CEDB40];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      goto LABEL_12;
    case 4uLL:
      v18 = *MEMORY[0x1E0CED848];
      v19 = *MEMORY[0x1E0CEDB40];
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = 1;
      v7 = &v19;
      v8 = &v18;
LABEL_11:
      objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v10 = -[VIImageScaler setVTTransferSessionProperties:](self, "setVTTransferSessionProperties:", v11);

      self->needFill = v6;
      self->scaleMode = a3;
      break;
    default:
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v13[0] = 67109120;
          v13[1] = a3;
          _os_log_impl(&dword_1D467C000, v9, OS_LOG_TYPE_ERROR, "VIImageScaler.setScalingMode unsupported scaling mode: %d", (uint8_t *)v13, 8u);
        }

      }
      v10 = -1;
      break;
  }
  return v10;
}

- (int)setVTTransferSessionProperties:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  OpaqueVTPixelTransferSession *transferSession;
  void *v11;
  OSStatus v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = *(const __CFString **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      transferSession = self->_transferSession;
      objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = VTSessionSetProperty(transferSession, v9, v11);

      if (v12)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (int)setFillColorBGRA:(VIImageScaler *)self
{
  __int32 v2;
  uint8x8_t v3;
  int8x8_t v4;
  int16x4_t v5;
  int8x8_t v6;
  CFTypeRef *v7;

  v3.i32[0] = *(_DWORD *)&self->defaultBlackOpaqueColor[3];
  v5 = (int16x4_t)vmovl_u8(v3).u64[0];
  v4.i32[0] = v2;
  v6 = (int8x8_t)vceq_s16(v5, (int16x4_t)(*(_QWORD *)&vzip1_s8(v4, (int8x8_t)v5) & 0xFF00FF00FF00FFLL));
  if ((vminv_u8((uint8x8_t)vuzp1_s8(v6, v6)) & 0x80) != 0)
  {
    self->useFill = 0;
    v7 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  }
  else
  {
    self->useFill = 1;
    *(_DWORD *)&self->fillColor[3] = v2;
    v7 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  }
  return VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E0CED868], *v7);
}

- (int)unsetFillColor
{
  self->useFill = 0;
  *(_DWORD *)&self->fillColor[3] = *(_DWORD *)&self->defaultBlackOpaqueColor[3];
  return VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E0CED868], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *transferSession;
  OpaqueVTPixelTransferSession *v4;
  objc_super v5;

  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v4 = self->_transferSession;
    if (v4)
      CFRelease(v4);
    self->_transferSession = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VIImageScaler;
  -[VIImageScaler dealloc](&v5, sel_dealloc);
}

- (__CVBuffer)createScaledImageWithSource:(const __CVBuffer *)a3 size:(CGSize)a4
{
  size_t width;
  size_t height;
  OSType PixelFormatType;
  __CVBuffer *v9;
  int v10;
  int v11;
  NSObject *v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  width = (unint64_t)a4.width;
  height = (unint64_t)a4.height;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v9 = VICreateCVPixelBufferWithFormat(width, height, PixelFormatType);
  if (v9)
  {
    v10 = -[VIImageScaler scaleImageFromSource:destination:](self, "scaleImageFromSource:destination:", a3, v9);
    if (v10)
    {
      v11 = v10;
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14[0] = 67109120;
          v14[1] = v11;
          _os_log_impl(&dword_1D467C000, v12, OS_LOG_TYPE_ERROR, "-scaleImageFromSource:destination: failed with error %d", (uint8_t *)v14, 8u);
        }

      }
      CVPixelBufferRelease(v9);
      return 0;
    }
  }
  return v9;
}

- (__CVBuffer)createCroppedImageWithSource:(const __CVBuffer *)a3 regionOfInterest:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  size_t v10;
  size_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int IsPlanar;
  void (*v17)(double, double, double, double);
  double v18;
  size_t v19;
  double v20;
  size_t v21;
  OSType PixelFormatType;
  __CVBuffer *v23;
  int v24;
  int v25;
  NSObject *v26;
  _DWORD v28[2];
  uint64_t v29;
  CGRect v30;
  CGRect v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = VIPixelBufferSize(a3);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v31 = VNImageRectForNormalizedRect(v30, v10, v11);
  v12 = v31.origin.x;
  v13 = v31.origin.y;
  v14 = v31.size.width;
  v15 = v31.size.height;
  IsPlanar = CVPixelBufferIsPlanar(a3);
  v17 = (void (*)(double, double, double, double))_CGRectIntegralEven;
  if (!IsPlanar)
    v17 = (void (*)(double, double, double, double))MEMORY[0x1E0C9D5F0];
  v17(v12, v13, v14, v15);
  v19 = (unint64_t)v18;
  v21 = (unint64_t)v20;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v23 = VICreateCVPixelBufferWithFormat(v19, v21, PixelFormatType);
  if (v23)
  {
    v24 = -[VIImageScaler cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:](self, "cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:", a3, v23, 1, x, y, width, height);
    if (v24)
    {
      v25 = v24;
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v28[0] = 67109120;
          v28[1] = v25;
          _os_log_impl(&dword_1D467C000, v26, OS_LOG_TYPE_ERROR, "-cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin: failed with error %d", (uint8_t *)v28, 8u);
        }

      }
      CVPixelBufferRelease(v23);
      return 0;
    }
  }
  return v23;
}

- (__CVBuffer)createImageWithSource:(const __CVBuffer *)a3 format:(unsigned int)a4
{
  size_t Width;
  size_t Height;
  __CVBuffer *v9;
  int v10;
  int v11;
  NSObject *v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v9 = VICreateCVPixelBufferWithFormat(Width, Height, a4);
  v10 = -[VIImageScaler scaleImageFromSource:destination:](self, "scaleImageFromSource:destination:", a3, v9);
  if (v10)
  {
    v11 = v10;
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 67109120;
        v14[1] = v11;
        _os_log_impl(&dword_1D467C000, v12, OS_LOG_TYPE_ERROR, "-scaleImageFromSource:destination: failed with error %d", (uint8_t *)v14, 8u);
      }

    }
    CVPixelBufferRelease(v9);
    return 0;
  }
  return v9;
}

- (int)scaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4
{
  return -[VIImageScaler cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:](self, "cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:", a3, a4, 0, self->entireImage.origin.x, self->entireImage.origin.y, self->entireImage.size.width, self->entireImage.size.height);
}

- (int)cropScaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4 regionOfInterest:(CGRect)a5
{
  return -[VIImageScaler cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:](self, "cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:", a3, a4, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (int)cropScaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4 normalizedBoundingBox:(CGRect)a5 bottomLeftBoxOrigin:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  OSType PixelFormatType;
  OSType v24;
  CFDictionaryRef DictionaryRepresentation;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  float v32;
  CFDictionaryRef v33;
  float v34;
  float v35;
  NSObject *v36;
  VIImageScaler *v37;
  int v38;
  NSObject *v39;
  const __CFString *v40;
  int v41;
  NSObject *v42;
  const __CFString *v43;
  int v44;
  NSObject *v45;
  OSStatus v46;
  NSObject *v47;
  int v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  int v53;
  unint64_t v54;
  __int16 v55;
  size_t v56;
  __int16 v57;
  OSType v58;
  __int16 v59;
  size_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  OSType v64;
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v65 = *MEMORY[0x1E0C80C00];
  v14 = VIPixelBufferSize(a3);
  v16 = v15;
  v17 = VIPixelBufferSize(a4);
  v19 = v18;
  if (CVPixelBufferIsPlanar(a3)
    && ((v14 | v16) & 1) != 0
    && +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_1D467C000, v20, OS_LOG_TYPE_ERROR, "VIScaler: planar odd source image is not supported", (uint8_t *)&v53, 2u);
    }

  }
  if (CVPixelBufferIsPlanar(a4)
    && ((v17 | v19) & 1) != 0
    && +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_1D467C000, v21, OS_LOG_TYPE_ERROR, "VIScaler: planar odd destination image is not supported", (uint8_t *)&v53, 2u);
    }

  }
  if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
  {
    +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      v24 = CVPixelBufferGetPixelFormatType(a4);
      v53 = 134219264;
      v54 = v14;
      v55 = 2048;
      v56 = v16;
      v57 = 1024;
      v58 = PixelFormatType;
      v59 = 2048;
      v60 = v17;
      v61 = 2048;
      v62 = v19;
      v63 = 1024;
      v64 = v24;
      _os_log_impl(&dword_1D467C000, v22, OS_LOG_TYPE_DEBUG, "VIScaler (w, h, pixtype): from (%zu, %zu, %d) to (%zu ,%zu, %d)", (uint8_t *)&v53, 0x36u);
    }

  }
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  if (CGRectEqualToRect(v66, self->entireImage))
  {
    if (self->scaleMode != 4)
    {
      DictionaryRepresentation = 0;
LABEL_29:
      v33 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    if (v6)
    {
      x = VIFlipOriginNormalizedRect(x, y, width, height);
      y = v26;
      width = v27;
      height = v28;
    }
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v68 = VNImageRectForNormalizedRect(v67, v14, v16);
    v69.origin.x = VIRectIntegral(a3, 1, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height);
    v29 = v69.size.width;
    v30 = v69.size.height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v69);
    if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
    {
      +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v53 = 138543362;
        v54 = (unint64_t)DictionaryRepresentation;
        _os_log_impl(&dword_1D467C000, v31, OS_LOG_TYPE_DEBUG, "VIScaler: sourceRectDict %{public}@", (uint8_t *)&v53, 0xCu);
      }

    }
    if (self->scaleMode != 4)
      goto LABEL_29;
    if (DictionaryRepresentation)
    {
      v32 = v29 / v30;
      goto LABEL_31;
    }
  }
  DictionaryRepresentation = 0;
  v32 = (float)v14 / (float)v16;
LABEL_31:
  v34 = (float)v17;
  v35 = (float)v19;
  if ((float)((float)v17 / (float)v19) >= v32)
    v34 = v32 * v35;
  else
    v35 = v34 / v32;
  v70.origin.x = VIRectIntegral(a4, 1, 0.0, 0.0, v34, v35);
  v33 = CGRectCreateDictionaryRepresentation(v70);
  if (+[VILogger shouldLogVerboseMessage](_TtC18VisualIntelligence8VILogger, "shouldLogVerboseMessage"))
  {
    +[VILogger verboseLog](_TtC18VisualIntelligence8VILogger, "verboseLog");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v53 = 138543362;
      v54 = (unint64_t)v33;
      _os_log_impl(&dword_1D467C000, v36, OS_LOG_TYPE_DEBUG, "VIScaler: destRectDict %{public}@", (uint8_t *)&v53, 0xCu);
    }

  }
LABEL_38:
  v37 = self;
  objc_sync_enter(v37);
  if (v37->useFill && v37->needFill)
  {
    v38 = _VTModifyPixelBufferWithColor(a4, *(_DWORD *)&v37->fillColor[3]);
    if (v38 && +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v53 = 67109120;
        LODWORD(v54) = 0;
        _os_log_impl(&dword_1D467C000, v39, OS_LOG_TYPE_ERROR, "Fill color failed (%d)", (uint8_t *)&v53, 8u);
      }

    }
  }
  else
  {
    v38 = 0;
  }
  v40 = (const __CFString *)*MEMORY[0x1E0CED850];
  v41 = VTSessionSetProperty(v37->_transferSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation) | v38;
  if (v38 != v41)
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1D467C000, v42, OS_LOG_TYPE_ERROR, "Failed to set source crop rect property.", (uint8_t *)&v53, 2u);
      }

    }
    v38 = v41;
  }
  v43 = (const __CFString *)*MEMORY[0x1E0CED7D0];
  v44 = VTSessionSetProperty(v37->_transferSession, (CFStringRef)*MEMORY[0x1E0CED7D0], v33) | v41;
  if (v38 != v44)
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1D467C000, v45, OS_LOG_TYPE_ERROR, "Failed to set destination rect property.", (uint8_t *)&v53, 2u);
      }

    }
    v38 = v44;
  }
  CVPixelBufferRetain(a3);
  CVPixelBufferRetain(a4);
  v46 = VTPixelTransferSessionTransferImage(v37->_transferSession, a3, a4);
  CVPixelBufferRelease(a3);
  CVPixelBufferRelease(a4);
  if (v38 != (v46 | v44))
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v53 = 67109120;
        LODWORD(v54) = v38;
        _os_log_impl(&dword_1D467C000, v47, OS_LOG_TYPE_ERROR, "Transfer failed (%d)", (uint8_t *)&v53, 8u);
      }

    }
    v38 = v46 | v44;
  }
  v48 = VTSessionSetProperty(v37->_transferSession, v40, 0) | v46 | v44;
  if (v38 != v48)
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1D467C000, v49, OS_LOG_TYPE_ERROR, "Failed to unset source crop property.", (uint8_t *)&v53, 2u);
      }

    }
    v38 = v48;
  }
  v50 = VTSessionSetProperty(v37->_transferSession, v43, 0) | v48;
  if (v38 != v50)
  {
    if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
    {
      +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1D467C000, v51, OS_LOG_TYPE_ERROR, "Failed to unset destination rect property.", (uint8_t *)&v53, 2u);
      }

    }
    v38 = v50;
  }
  objc_sync_exit(v37);

  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if (v33)
    CFRelease(v33);
  return v38;
}

@end
