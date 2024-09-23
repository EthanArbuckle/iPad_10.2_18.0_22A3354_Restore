@implementation SIPeopleSegmentation

+ (CGSize)getInputResolution
{
  double v2;
  double v3;
  CGSize result;

  v2 = 192.0;
  v3 = 256.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)getOutputResolution
{
  double v2;
  double v3;
  CGSize result;

  v2 = 192.0;
  v3 = 256.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (SIPeopleSegmentation)initWithNetworkConfiguration:(id)a3
{
  id v4;
  SIPeopleSegmentation *v5;
  SIPixelBuffer *v6;
  SIPixelBuffer *v7;
  void *v8;
  SIPixelBuffer *v9;
  void *v10;
  SIPeopleSegmentation *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;
  SIPixelBuffer *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SIPeopleSegmentation;
  v5 = -[SIModel initWithNetworkConfiguration:](&v14, sel_initWithNetworkConfiguration_, v4);
  if (!v5)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v21[0] = kSIMPeopleSegmentationInputTensorName;
  v6 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
  v21[1] = kSIMPeopleSegmentationTemporalTensorName;
  v22[0] = v6;
  v7 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
  v22[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel setInputs:](v5, "setInputs:", v8);

  v19 = kSIMPeopleSegmentationOutputTensorName;
  v9 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
  v20 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel setOutputs:](v5, "setOutputs:", v10);

  -[SIPeopleSegmentation setSnapEveryFrameCount:](v5, "setSnapEveryFrameCount:", 30);
  if (!-[SIPeopleSegmentation _initTemporalBuffer](v5, "_initTemporalBuffer"))
  {
    __SceneIntelligenceLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentation.mm";
      v17 = 1025;
      v18 = 69;
      _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d ***  ***", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v11 = v5;
LABEL_8:

  return v11;
}

- (CGSize)getInputResolution
{
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SIModel network](self, "network");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getInputWidth:", kSIMPeopleSegmentationInputTensorName);
  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "getInputHeight:", kSIMPeopleSegmentationInputTensorName);

  v7 = (double)v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)getOutputResolution
{
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SIModel network](self, "network");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getOutputWidth:", kSIMPeopleSegmentationOutputTensorName);
  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "getOutputHeight:", kSIMPeopleSegmentationOutputTensorName);

  v7 = (double)v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)switchNetworkConfiguration:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  objc_super v10;

  -[SIModel config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "networkModeEnum");

  v10.receiver = self;
  v10.super_class = (Class)SIPeopleSegmentation;
  v7 = -[SIModel switchNetworkConfiguration:](&v10, sel_switchNetworkConfiguration_, a3);
  if (v7)
    v8 = 1;
  else
    v8 = v6 == a3;
  if (!v8)
  {
    CVPixelBufferRelease(self->_temporalBuffer);
    self->_frameCount = 0;
    -[SIPeopleSegmentation _initTemporalBuffer](self, "_initTemporalBuffer");
  }
  return (int64_t)v7;
}

- (BOOL)_initTemporalBuffer
{
  const __CFDictionary *v3;
  double v4;
  double v5;
  double v6;
  CVReturn v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  CVReturn v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16 = *MEMORY[0x24BDC5668];
  v17[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  -[SIPeopleSegmentation getOutputResolution](self, "getOutputResolution");
  v5 = v4;
  -[SIPeopleSegmentation getOutputResolution](self, "getOutputResolution");
  v7 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v5, (unint64_t)v6, 0x4C303038u, v3, &self->_temporalBuffer);
  if (v7)
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136381187;
      v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentation.mm";
      v12 = 1025;
      v13 = 110;
      v14 = 1024;
      v15 = v7;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** (Error %d) Could not create internal image buffer of uint8 type ***", (uint8_t *)&v10, 0x18u);
    }

  }
  return v7 == 0;
}

- (int64_t)evaluateForInput:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  void *v6;
  void *v7;
  __CVBuffer *temporalBuffer;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  -[SIModel inputs](self, "inputs", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", kSIMPeopleSegmentationInputTensorName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPixelBuffer:", a3);

  temporalBuffer = self->_temporalBuffer;
  -[SIModel inputs](self, "inputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", kSIMPeopleSegmentationTemporalTensorName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPixelBuffer:", temporalBuffer);

  -[SIModel inputs](self, "inputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel outputs](self, "outputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SIModel evaluateWithInput:outputs:](self, "evaluateWithInput:outputs:", v11, v12);

  return v13;
}

- (int64_t)evaluateForInput:(id)a3 output:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = -[SIPeopleSegmentation evaluateForInput:outputBuffer:](self, "evaluateForInput:outputBuffer:", objc_msgSend(v6, "inputImageBuffer"), objc_msgSend(v7, "segmentation"));

  return v8;
}

- (int64_t)copyResultsToData:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  __IOSurface *IOSurface;
  int v12;
  char *BaseAddress;
  size_t BytesPerRow;
  char *v15;
  size_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  SIPeopleSegmentation *v24;
  __IOSurface *buffer;
  void *v26;

  v4 = a3;
  v26 = v4;
  -[SIPeopleSegmentation getOutputResolution](self, "getOutputResolution");
  v6 = v5;
  -[SIPeopleSegmentation getOutputResolution](self, "getOutputResolution");
  v8 = v7;
  v9 = self->_frameCount + 1;
  self->_frameCount = v9;
  if (v9 % -[SIPeopleSegmentation snapEveryFrameCount](self, "snapEveryFrameCount"))
  {
    v10 = 1;
  }
  else
  {
    self->_frameCount = 0;
    v10 = 0x101010101010101;
  }
  IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v4, "segmentation"));
  v12 = (int)v6;
  kdebug_trace();
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
  BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  CVPixelBufferLockBaseAddress(self->_temporalBuffer, 0);
  v15 = (char *)CVPixelBufferGetBaseAddress(self->_temporalBuffer);
  v16 = CVPixelBufferGetBytesPerRow(self->_temporalBuffer);
  buffer = IOSurface;
  -[SIModel network](self, "network");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "getRawOutput:", kSIMPeopleSegmentationOutputTensorName);

  v24 = self;
  -[SIModel network](self, "network");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "getOutputRowElements:", kSIMPeopleSegmentationOutputTensorName);

  if ((int)v8 >= 1)
  {
    v21 = 0;
    do
    {
      if (v12 >= 1)
      {
        v22 = 0;
        do
        {
          *(_QWORD *)&v15[v22] = *(_QWORD *)(v18 + v22) & v10;
          *(_QWORD *)&BaseAddress[v22] = 255 * *(_QWORD *)(v18 + v22);
          v22 += 8;
        }
        while ((int)v22 < v12);
      }
      BaseAddress += BytesPerRow;
      v15 += v16;
      v18 += v20;
      ++v21;
    }
    while (v21 != (int)v8);
  }
  CVPixelBufferUnlockBaseAddress(v24->_temporalBuffer, 0);
  IOSurfaceUnlock(buffer, 0, 0);
  kdebug_trace();

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_temporalBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SIPeopleSegmentation;
  -[SIPeopleSegmentation dealloc](&v3, sel_dealloc);
}

- (unsigned)snapEveryFrameCount
{
  return self->snapEveryFrameCount;
}

- (void)setSnapEveryFrameCount:(unsigned __int8)a3
{
  self->snapEveryFrameCount = a3;
}

@end
