@implementation OUCVPixelBufferRotate

- (id)initForRotationDegree:(int)a3 resolution:(CGSize)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  OUCVPixelBufferRotate *v9;
  OUCVPixelBufferRotate *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  NSObject *v15;
  OUCVPixelBufferRotate *v16;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v8 = *(_QWORD *)&a3;
  v20[4] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)OUCVPixelBufferRotate;
  v9 = -[OUCVPixelBufferRotate init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_outputResolution.width = width;
    v9->_outputResolution.height = height;
    v9->_outputPixelFormat = v5;
    v9->_sessionRotate = -[OUCVPixelBufferRotate _createRotationSessionByRotationDegree:](v9, "_createRotationSessionByRotationDegree:", v8);
    v19[0] = *MEMORY[0x24BDC56B8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v19[1] = *MEMORY[0x24BDC5708];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_outputResolution.width);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    v19[2] = *MEMORY[0x24BDC5650];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10->_outputResolution.height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = *MEMORY[0x24BDC5668];
    v20[2] = v13;
    v20[3] = MEMORY[0x24BDBD1B8];
    v14 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);

    if (!CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v14, &v10->_pixelBufferCreatePool))
    {
      v16 = v10;
      goto LABEL_8;
    }
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:].cold.1();

  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (OpaqueVTPixelRotationSession)_createRotationSessionByRotationDegree:(int)a3
{
  NSObject *v3;

  if (VTImageRotationSessionCreate())
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[OUCVPixelBufferRotate _createRotationSessionByRotationDegree:].cold.1();

  }
  return 0;
}

- (__CVBuffer)rotateImage:(__CVBuffer *)a3
{
  __CVBuffer **p_rotatePixelBuffer;
  NSObject *v6;

  if (!a3)
    return 0;
  p_rotatePixelBuffer = &self->_rotatePixelBuffer;
  if (!self->_rotatePixelBuffer
    && CVPixelBufferPoolCreatePixelBuffer(0, self->_pixelBufferCreatePool, p_rotatePixelBuffer))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[OUCVPixelBufferRotate rotateImage:].cold.2();
    goto LABEL_10;
  }
  if (MEMORY[0x22E2CA71C](self->_sessionRotate, a3))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[OUCVPixelBufferRotate rotateImage:].cold.1();
LABEL_10:

    return 0;
  }
  return *p_rotatePixelBuffer;
}

- (void)dealloc
{
  __CVBuffer *rotatePixelBuffer;
  objc_super v4;

  MEMORY[0x22E2CA710](self->_sessionRotate, a2);
  CFRelease(self->_sessionRotate);
  self->_sessionRotate = 0;
  CVPixelBufferPoolRelease(self->_pixelBufferCreatePool);
  rotatePixelBuffer = self->_rotatePixelBuffer;
  if (rotatePixelBuffer)
  {
    CVPixelBufferRelease(rotatePixelBuffer);
    self->_rotatePixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OUCVPixelBufferRotate;
  -[OUCVPixelBufferRotate dealloc](&v4, sel_dealloc);
}

- (void)initForRotationDegree:resolution:pixelFormat:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_2294C8000, v0, OS_LOG_TYPE_ERROR, "Create pixelbufferPool for image rotation failed.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_createRotationSessionByRotationDegree:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "Failure to create vtImageRotationSession", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rotateImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "Failure to perform rotation via pixel transfer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)rotateImage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "Failure to create pixel buffer for rotation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
