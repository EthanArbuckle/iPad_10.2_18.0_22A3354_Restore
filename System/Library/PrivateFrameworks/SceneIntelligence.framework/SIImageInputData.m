@implementation SIImageInputData

- (SIImageInputData)init
{
  SIImageInputData *v2;
  SIPixelBuffer *v3;
  SIPixelBuffer *inputImageBuffer;
  SIPixelBuffer *v5;
  SIPixelBuffer *inputNormalBuffer;
  SIPixelBuffer *v7;
  SIPixelBuffer *inputDepthBuffer;
  SIImageInputData *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SIImageInputData;
  v2 = -[SIImageInputData init](&v11, sel_init);
  if (v2)
  {
    v3 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    inputImageBuffer = v2->_inputImageBuffer;
    v2->_inputImageBuffer = v3;

    v5 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    inputNormalBuffer = v2->_inputNormalBuffer;
    v2->_inputNormalBuffer = v5;

    v7 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    inputDepthBuffer = v2->_inputDepthBuffer;
    v2->_inputDepthBuffer = v7;

    v2->_inputImageLuxValue = -1;
    v9 = v2;
  }

  return v2;
}

- (BOOL)copyDataTo:(id)a3
{
  id v4;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  IOSurfaceRef IOSurface;
  void *v9;
  int v10;
  __CVBuffer *v11;
  size_t BytesPerRowOfPlane;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  __CVBuffer *v16;
  BOOL v17;
  size_t v19;
  size_t v20;
  OSType v21;
  _BOOL4 v22;
  size_t BytesPerRow;
  __CVBuffer *v24;
  size_t v25;
  size_t v26;
  OSType v27;
  _BOOL4 v28;
  size_t v29;
  __CVBuffer *v30;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
  {
    -[SIImageInputData worldFromDevice](self, "worldFromDevice");
    objc_msgSend(v4, "setWorldFromDevice:");
    -[SIImageInputData deviceTransform](self, "deviceTransform");
    objc_msgSend(v4, "setDeviceTransform:");
    if (!objc_msgSend(v4, "inputImageBuffer")
      || (SIPixelBufferHasSameAttr(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"), (__CVBuffer *)objc_msgSend(v4, "inputImageBuffer")) & 1) == 0)
    {
      Width = CVPixelBufferGetWidth(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"));
      Height = CVPixelBufferGetHeight(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"));
      PixelFormatType = CVPixelBufferGetPixelFormatType(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"));
      IOSurface = CVPixelBufferGetIOSurface(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"));
      SIPixelFormatToStr(PixelFormatType);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("444f"));
      v11 = -[SIImageInputData inputImageBuffer](self, "inputImageBuffer");
      if (v10)
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v11, 0);
      else
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(v11);
      v15 = BytesPerRowOfPlane;

      v16 = SICreateCVPixelBufferWithCustomStride(Width, Height, PixelFormatType, v15, IOSurface != 0);
      objc_msgSend(v4, "setInputImageBuffer:", v16);
      CVPixelBufferRelease(v16);
    }
    if (!SIPixelBufferCopy(-[SIImageInputData inputImageBuffer](self, "inputImageBuffer"), (__CVBuffer *)objc_msgSend(v4, "inputImageBuffer")))
    {
      if (-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"))
      {
        if (!objc_msgSend(v4, "inputDepthBuffer")
          || (SIPixelBufferHasSameAttr(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"), (__CVBuffer *)objc_msgSend(v4, "inputDepthBuffer")) & 1) == 0)
        {
          v19 = CVPixelBufferGetWidth(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"));
          v20 = CVPixelBufferGetHeight(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"));
          v21 = CVPixelBufferGetPixelFormatType(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"));
          v22 = CVPixelBufferGetIOSurface(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer")) != 0;
          BytesPerRow = CVPixelBufferGetBytesPerRow(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"));
          v24 = SICreateCVPixelBufferWithCustomStride(v19, v20, v21, BytesPerRow, v22);
          objc_msgSend(v4, "setInputDepthBuffer:", v24);
          CVPixelBufferRelease(v24);
        }
        if (SIPixelBufferCopy(-[SIImageInputData inputDepthBuffer](self, "inputDepthBuffer"), (__CVBuffer *)objc_msgSend(v4, "inputDepthBuffer")))
        {
          __SceneIntelligenceLogSharedInstance();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          v31 = 136380931;
          v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
          v33 = 1025;
          v34 = 76;
          v14 = " %{private}s:%{private}d *** Failed to copy image depth for SIImageInputData ***";
          goto LABEL_13;
        }
      }
      else
      {
        objc_msgSend(v4, "setInputDepthBuffer:", 0);
      }
      if (-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"))
      {
        if (!objc_msgSend(v4, "inputNormalBuffer")
          || (SIPixelBufferHasSameAttr(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"), (__CVBuffer *)objc_msgSend(v4, "inputNormalBuffer")) & 1) == 0)
        {
          v25 = CVPixelBufferGetWidth(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"));
          v26 = CVPixelBufferGetHeight(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"));
          v27 = CVPixelBufferGetPixelFormatType(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"));
          v28 = CVPixelBufferGetIOSurface(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer")) != 0;
          v29 = CVPixelBufferGetBytesPerRow(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"));
          v30 = SICreateCVPixelBufferWithCustomStride(v25, v26, v27, v29, v28);
          objc_msgSend(v4, "setInputNormalBuffer:", v30);
          CVPixelBufferRelease(v30);
        }
        if (SIPixelBufferCopy(-[SIImageInputData inputNormalBuffer](self, "inputNormalBuffer"), (__CVBuffer *)objc_msgSend(v4, "inputNormalBuffer")))
        {
          __SceneIntelligenceLogSharedInstance();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          v31 = 136380931;
          v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
          v33 = 1025;
          v34 = 96;
          v14 = " %{private}s:%{private}d *** Failed to copy image depth for SIImageInputData ***";
          goto LABEL_13;
        }
      }
      else
      {
        objc_msgSend(v4, "setInputNormalBuffer:", 0);
      }
      v17 = 1;
      goto LABEL_15;
    }
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v31 = 136380931;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
      v33 = 1025;
      v34 = 60;
      v14 = " %{private}s:%{private}d *** Failed to copy image input for SIImageInputData ***";
      goto LABEL_13;
    }
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v31 = 136380931;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageInputData.m";
      v33 = 1025;
      v34 = 41;
      v14 = " %{private}s:%{private}d *** Trying to copy a nil SIImageInputData ***";
LABEL_13:
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v31, 0x12u);
    }
  }
LABEL_14:

  v17 = 0;
LABEL_15:

  return v17;
}

- (void)setInputImageBuffer:(__CVBuffer *)a3
{
  -[SIPixelBuffer setPixelBuffer:](self->_inputImageBuffer, "setPixelBuffer:", a3);
}

- (__CVBuffer)inputImageBuffer
{
  return -[SIPixelBuffer pixelBuffer](self->_inputImageBuffer, "pixelBuffer");
}

- (void)setInputDepthBuffer:(__CVBuffer *)a3
{
  -[SIPixelBuffer setPixelBuffer:](self->_inputDepthBuffer, "setPixelBuffer:", a3);
}

- (__CVBuffer)inputDepthBuffer
{
  return -[SIPixelBuffer pixelBuffer](self->_inputDepthBuffer, "pixelBuffer");
}

- (void)setInputNormalBuffer:(__CVBuffer *)a3
{
  -[SIPixelBuffer setPixelBuffer:](self->_inputNormalBuffer, "setPixelBuffer:", a3);
}

- (__CVBuffer)inputNormalBuffer
{
  return -[SIPixelBuffer pixelBuffer](self->_inputNormalBuffer, "pixelBuffer");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)inputImageLuxValue
{
  return self->_inputImageLuxValue;
}

- (void)setInputImageLuxValue:(int)a3
{
  self->_inputImageLuxValue = a3;
}

- (__n128)deviceTransform
{
  return a1[4];
}

- (__n128)setDeviceTransform:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (__n128)worldFromDevice
{
  return a1[8];
}

- (__n128)setWorldFromDevice:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (__n128)deviceFromCamera
{
  return a1[12];
}

- (__n128)setDeviceFromCamera:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_inputNormalBuffer, 0);
  objc_storeStrong((id *)&self->_inputDepthBuffer, 0);
  objc_storeStrong((id *)&self->_inputImageBuffer, 0);
}

@end
