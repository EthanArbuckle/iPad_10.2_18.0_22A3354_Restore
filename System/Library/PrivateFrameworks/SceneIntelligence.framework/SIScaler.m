@implementation SIScaler

- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5 bytePerRowAlignment:(unint64_t)a6 algorithmKey:(id)a7
{
  uint64_t v9;
  double height;
  double width;
  id v13;
  SIScaler *v14;
  SIScaler *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  CFTypeRef *v20;
  CFTypeRef *v21;
  uint64_t outputBufferBytePerRowAlignment;
  uint64_t v23;
  uint64_t v24;
  SIScaler *v25;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v9 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SIScaler;
  v14 = -[SIScaler init](&v27, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_23;
  if (width == 0.0 || height == 0.0)
  {
    __SceneIntelligenceLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      v30 = 1025;
      v31 = 43;
      v32 = 2048;
      v33 = width;
      v34 = 2048;
      v35 = height;
      v17 = " %{private}s:%{private}d *** Failed to initialize the scale: Unsupported Resolution (%.2f, %.2f) ***";
      v18 = v16;
      v19 = 38;
LABEL_21:
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v14->_outputResolution.width = width;
  v14->_outputResolution.height = height;
  v14->_outputPixelFormat = v9;
  v14->_outputBufferBytePerRowAlignment = a6;
  if (VTPixelTransferSessionCreate(0, &v14->_session))
  {
    __SceneIntelligenceLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      v30 = 1025;
      v31 = 50;
      v17 = " %{private}s:%{private}d *** Failure to create vtPixelTransferSession ***";
LABEL_20:
      v18 = v16;
      v19 = 18;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v20 = (CFTypeRef *)MEMORY[0x24BDF98E8];
  v21 = (CFTypeRef *)MEMORY[0x24BDF98F8];
  if (a5 != 1)
    v21 = (CFTypeRef *)MEMORY[0x24BDF98F0];
  if (a5 != 2)
    v20 = v21;
  if (!VTSessionSetProperty(v15->_session, (CFStringRef)*MEMORY[0x24BDF9680], *v20))
  {
    outputBufferBytePerRowAlignment = v15->_outputBufferBytePerRowAlignment;
    v23 = (int)v15->_outputResolution.width;
    v24 = (int)v15->_outputResolution.height;
    if (outputBufferBytePerRowAlignment)
    {
      if (SIPixelBufferPoolCreateWithBytePerRowAlignment(v23, v24, v9, outputBufferBytePerRowAlignment, &v15->_pool))goto LABEL_18;
    }
    else if (SIPixelBufferPoolCreate(v23, v24, v9, &v15->_pool))
    {
LABEL_18:
      __SceneIntelligenceLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
        v30 = 1025;
        v31 = 76;
        v17 = " %{private}s:%{private}d *** Failure to create pixel buffer pool for downscaling ***";
        goto LABEL_20;
      }
      goto LABEL_22;
    }
    v15->_algorithmKey = UInt64BitsFromString(v13);
    v25 = v15;
    goto LABEL_24;
  }
  __SceneIntelligenceLogSharedInstance();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
    v30 = 1025;
    v31 = 64;
    v17 = " %{private}s:%{private}d *** Failure to set scaling mode on pixel transfer session ***";
    goto LABEL_20;
  }
LABEL_22:

LABEL_23:
  v25 = 0;
LABEL_24:

  return v25;
}

- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5 algorithmKey:(id)a6
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:bytePerRowAlignment:algorithmKey:](self, "initForOutputResolution:outputPixelFormat:mode:bytePerRowAlignment:algorithmKey:", *(_QWORD *)&a4, a5, 0, a6, a3.width, a3.height);
}

- (id)initForOutputResolution:(CGSize)a3 outputPixelFormat:(unsigned int)a4 mode:(unint64_t)a5
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](self, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", *(_QWORD *)&a4, a5, CFSTR("Unknown"), a3.width, a3.height);
}

- (id)initForInputResolution:(CGSize)a3 outputResolution:(CGSize)a4 outputPixelFormat:(unsigned int)a5 mode:(unint64_t)a6
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:](self, "initForOutputResolution:outputPixelFormat:mode:", *(_QWORD *)&a5, a6, a4.width, a4.height);
}

- (id)initForInputResolution:(CGSize)a3 outputResolution:(CGSize)a4 outputPixelFormat:(unsigned int)a5
{
  return -[SIScaler initForOutputResolution:outputPixelFormat:mode:](self, "initForOutputResolution:outputPixelFormat:mode:", *(_QWORD *)&a5, 0, a4.width, a4.height);
}

- (BOOL)scaleImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  return a3 && VTPixelTransferSessionTransferImage(self->_session, a3, a4) == 0;
}

- (__CVBuffer)createScaledImage:(__CVBuffer *)a3
{
  NSObject *v6;
  const char *v7;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      v11 = 1025;
      v12 = 143;
      v7 = " %{private}s:%{private}d *** Error! Scaler gets nil input. ***";
LABEL_12:
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
    }
LABEL_13:

    return 0;
  }
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);
  kdebug_trace();
  if (-[SIScaler _imageConformsToOutput:](self, "_imageConformsToOutput:", a3))
  {
    kdebug_trace();
    return CVPixelBufferRetain(a3);
  }
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_pool, &pixelBufferOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      v11 = 1025;
      v12 = 159;
      v7 = " %{private}s:%{private}d *** Failure to create pixel buffer for downscaling ***";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (VTPixelTransferSessionTransferImage(self->_session, a3, pixelBufferOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIScaler.m";
      v11 = 1025;
      v12 = 162;
      v7 = " %{private}s:%{private}d *** Failure to perform downscaling/conversion via pixel transfer ***";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  kdebug_trace();
  return pixelBufferOut;
}

- (BOOL)_imageConformsToOutput:(__CVBuffer *)a3
{
  IOSurfaceRef IOSurface;
  double width;
  double height;
  unsigned int outputPixelFormat;
  unint64_t outputBufferBytePerRowAlignment;

  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    width = self->_outputResolution.width;
    if (width == (double)CVPixelBufferGetWidth(a3)
      && (height = self->_outputResolution.height, height == (double)CVPixelBufferGetHeight(a3))
      && (outputPixelFormat = self->_outputPixelFormat, outputPixelFormat == CVPixelBufferGetPixelFormatType(a3)))
    {
      outputBufferBytePerRowAlignment = self->_outputBufferBytePerRowAlignment;
      if (outputBufferBytePerRowAlignment)
        LOBYTE(IOSurface) = outputBufferBytePerRowAlignment == CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      else
        LOBYTE(IOSurface) = 1;
    }
    else
    {
      LOBYTE(IOSurface) = 0;
    }
  }
  return (char)IOSurface;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *session;
  objc_super v4;

  CVPixelBufferPoolRelease(self->_pool);
  session = self->_session;
  if (session)
  {
    VTPixelTransferSessionInvalidate(session);
    CFRelease(self->_session);
  }
  v4.receiver = self;
  v4.super_class = (Class)SIScaler;
  -[SIScaler dealloc](&v4, sel_dealloc);
}

@end
