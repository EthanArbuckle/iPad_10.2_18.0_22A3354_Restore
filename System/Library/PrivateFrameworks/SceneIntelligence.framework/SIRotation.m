@implementation SIRotation

- (CGRect)getCenterCropSrcSize:(CGSize)a3 dstSize:(CGSize)a4
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v4 = (a3.width - a4.width) * 0.5;
  v5 = (a3.height - a4.height) * 0.5;
  v6 = floor(v4 + 0.0);
  v7 = floor(v5 + 0.0);
  v8 = floor(a3.width - v4 * 2.0);
  v9 = floor(a3.height - v5 * 2.0);
  v10 = v6;
  v11 = v7;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)initForRotationDegree:(int)a3 resolution:(CGSize)a4 pixelFormat:(unsigned int)a5 algorithmKey:(id)a6
{
  uint64_t v6;
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  id v11;
  SIRotation *v12;
  SIRotation *v13;
  NSObject *v14;
  SIRotation *v15;
  id v16;
  int v17;
  unint64_t v18;
  objc_super v20;
  _BYTE buf[12];
  __int16 v22;
  int v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v9 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SIRotation;
  v12 = -[SIRotation init](&v20, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_10;
  }
  v12->_outputResolution.width = width;
  v12->_outputResolution.height = height;
  v12->_outputPixelFormat = v6;
  v12->_sessionRotate = -[SIRotation _createRotationSessionByRotationDegree:](v12, "_createRotationSessionByRotationDegree:", v9);
  v13->_rotationDegree = v9;
  if (SIPixelBufferPoolCreate((int)v13->_outputResolution.width, (int)v13->_outputResolution.height, v6, &v13->_pixelBufferCreatePool))
  {
    __SceneIntelligenceLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      v22 = 1025;
      v23 = 65;
      _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to create pixel buffer pool for rotation ***", buf, 0x12u);
    }

    goto LABEL_6;
  }
  *(_QWORD *)buf = 0;
  v16 = v11;
  v17 = objc_msgSend(v16, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v16, "length"), 0);

  v18 = *(_QWORD *)buf;
  if (!v17)
    v18 = 0;
  v13->_algorithmKey = v18;
  v15 = v13;
LABEL_10:

  return v15;
}

- (OpaqueVTPixelRotationSession)_createRotationSessionByRotationDegree:(int)a3
{
  NSObject *v3;
  VTPixelRotationSessionRef pixelRotationSessionOut;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pixelRotationSessionOut = 0;
  if (!VTPixelRotationSessionCreate(0, &pixelRotationSessionOut))
    return pixelRotationSessionOut;
  __SceneIntelligenceLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
    v8 = 1025;
    v9 = 73;
    _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to create vtImageRotationSession ***", buf, 0x12u);
  }

  return 0;
}

- (BOOL)rotateImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  NSObject *v7;
  void *v8;
  OSStatus v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 136380931;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      v15 = 1025;
      v16 = 79;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Recieved null image ***", (uint8_t *)&v13, 0x12u);
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  -[SIRotation getInputRotateOrientation](self, "getInputRotateOrientation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDF9648]);

  v9 = VTPixelRotationSessionRotateImage(self->_sessionRotate, a3, a4);
  v10 = v9 == 0;
  if (v9)
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136380931;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      v15 = 1025;
      v16 = 83;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to perform rotation via pixel transfer ***", (uint8_t *)&v13, 0x12u);
    }

LABEL_8:
    v10 = 0;
  }

  return v10;
}

- (__CVBuffer)rotateImage:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    pixelBufferOut = 0;
    if (CVPixelBufferPoolCreatePixelBuffer(0, self->_pixelBufferCreatePool, &pixelBufferOut))
    {
      __SceneIntelligenceLogSharedInstance();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
        v12 = 1025;
        v13 = 96;
        _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to create pixel buffer for rotation ***", buf, 0x12u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
      -[SIRotation getInputRotateOrientation](self, "getInputRotateOrientation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDF9648]);

      if (!VTPixelRotationSessionRotateImage(self->_sessionRotate, v3, pixelBufferOut))
      {
        v3 = pixelBufferOut;
        goto LABEL_10;
      }
      __SceneIntelligenceLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
        v12 = 1025;
        v13 = 101;
        _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to perform rotation via pixel transfer ***", buf, 0x12u);
      }

    }
    v3 = 0;
LABEL_10:

  }
  return v3;
}

- (__CVBuffer)rotateAndCropImage:(__CVBuffer *)a3
{
  double Width;
  NSObject *v6;
  const char *v7;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  Width = (double)CVPixelBufferGetWidth(a3);
  -[SIRotation getCenterCropSrcSize:dstSize:](self, "getCenterCropSrcSize:dstSize:", Width, (double)CVPixelBufferGetHeight(a3), self->_outputResolution.width, self->_outputResolution.height);
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_pixelBufferCreatePool, &pixelBufferOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      v12 = 1025;
      v13 = 124;
      v7 = " %{private}s:%{private}d *** Failure to create pixel buffer for rotation ***";
LABEL_8:
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (VTPixelRotationSessionRotateSubImage())
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      v12 = 1025;
      v13 = 127;
      v7 = " %{private}s:%{private}d *** Failure to perform rotation and crop via pixel transfer ***";
      goto LABEL_8;
    }
LABEL_9:

    return 0;
  }
  return pixelBufferOut;
}

- (BOOL)rotateAndCropImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  double Width;
  double v7;
  double v8;
  NSObject *v9;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  Width = (double)CVPixelBufferGetWidth(a3);
  -[SIRotation getCenterCropSrcSize:dstSize:](self, "getCenterCropSrcSize:dstSize:", Width, (double)CVPixelBufferGetHeight(a3), self->_outputResolution.width, self->_outputResolution.height);
  if (v8 != self->_outputResolution.width || v7 != self->_outputResolution.height)
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      return 0;
    }
    v12 = 136380931;
    v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
    v14 = 1025;
    v15 = 143;
    v10 = " %{private}s:%{private}d *** Wrong crop size for rotation ***";
LABEL_6:
    _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x12u);
    goto LABEL_7;
  }
  if (VTPixelRotationSessionRotateSubImage())
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = 136380931;
    v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
    v14 = 1025;
    v15 = 149;
    v10 = " %{private}s:%{private}d *** Failure to perform rotation and crop via pixel transfer ***";
    goto LABEL_6;
  }
  return 1;
}

- (__CVBuffer)_createCVPixelBufferWithResolution:(CGSize)a3 pixelFormat:(unsigned int)a4
{
  double height;
  double width;
  const __CFDictionary *v7;
  NSObject *v8;
  __CVBuffer *v9;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;
  _QWORD v17[2];

  height = a3.height;
  width = a3.width;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = *MEMORY[0x24BDC5668];
  v17[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)width, (unint64_t)height, a4, v7, &pixelBufferOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v13 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIRotation.m";
      v14 = 1025;
      v15 = 164;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not create pixel buffer for rotation ***", buf, 0x12u);
    }

    v9 = 0;
  }
  else
  {
    v9 = pixelBufferOut;
  }

  return v9;
}

- (id)getInputRotateOrientation
{
  id v3;
  int rotationDegree;
  id *v5;
  id v6;

  v3 = (id)*MEMORY[0x24BDF9860];
  rotationDegree = self->_rotationDegree;
  switch(rotationDegree)
  {
    case 90:
      v5 = (id *)MEMORY[0x24BDF9878];
      goto LABEL_7;
    case 270:
      v5 = (id *)MEMORY[0x24BDF9870];
      goto LABEL_7;
    case 180:
      v5 = (id *)MEMORY[0x24BDF9868];
LABEL_7:
      v6 = *v5;

      v3 = v6;
      break;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  VTPixelRotationSessionInvalidate(self->_sessionRotate);
  CFRelease(self->_sessionRotate);
  self->_sessionRotate = 0;
  CVPixelBufferPoolRelease(self->_pixelBufferCreatePool);
  v3.receiver = self;
  v3.super_class = (Class)SIRotation;
  -[SIRotation dealloc](&v3, sel_dealloc);
}

@end
