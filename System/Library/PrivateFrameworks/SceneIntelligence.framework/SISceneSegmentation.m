@implementation SISceneSegmentation

- (SISceneSegmentation)initWithNetworkConfiguration:(id)a3
{
  id v5;
  SISceneSegmentation *v6;
  SIPixelBuffer *v7;
  void *v8;
  SIPixelBuffer *v9;
  SIPixelBuffer *v10;
  SIPixelBuffer *v11;
  void *v12;
  SISceneSegmentation *v13;
  objc_super v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SISceneSegmentation;
  v6 = -[SIModel initWithNetworkConfiguration:](&v15, sel_initWithNetworkConfiguration_, v5);
  if (v6)
  {
    v18 = kSIMLSceneSegmentationInputTensorName;
    v7 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIModel setInputs:](v6, "setInputs:", v8);

    v16[0] = kSIMLSceneSegmentationOutputLabelsTensorName;
    v9 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    v17[0] = v9;
    v16[1] = kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName;
    v10 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    v17[1] = v10;
    v16[2] = kSIMLSceneSegmentationOutputNormalizationTensorName;
    v11 = -[SIPixelBuffer initWithCVPixelBuffer:]([SIPixelBuffer alloc], "initWithCVPixelBuffer:", 0);
    v17[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIModel setOutputs:](v6, "setOutputs:", v12);

    objc_msgSend(v5, "uncertaintyThreshold");
    -[SISceneSegmentation _initializeUncertaintyThresholds:](v6, "_initializeUncertaintyThresholds:");
    objc_storeStrong((id *)&v6->_configuration, a3);
    v13 = v6;
  }

  return v6;
}

- (void)_initializeUncertaintyThresholds:(float)a3
{
  void *v5;
  uint64_t v6;
  float *v7;
  float *uncertaintyThresholds;
  float v9;

  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getOutputChannels:", kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName);

  self->_uncertaintyThresholds = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v7 = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  self->_probabilityThresholds = v7;
  if (v6)
  {
    uncertaintyThresholds = self->_uncertaintyThresholds;
    do
    {
      *uncertaintyThresholds++ = a3;
      v9 = 1.0 / (2.0 - a3);
      *v7++ = v9;
      --v6;
    }
    while (v6);
  }
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
  v4 = objc_msgSend(v3, "getInputWidth:", kSIMLSceneSegmentationInputTensorName);
  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "getInputHeight:", kSIMLSceneSegmentationInputTensorName);

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
  v4 = objc_msgSend(v3, "getOutputWidth:", kSIMLSceneSegmentationOutputLabelsTensorName);
  -[SIModel network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "getOutputHeight:", kSIMLSceneSegmentationOutputLabelsTensorName);

  v7 = (double)v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)dealloc
{
  float *uncertaintyThresholds;
  float *probabilityThresholds;
  objc_super v5;

  uncertaintyThresholds = self->_uncertaintyThresholds;
  if (uncertaintyThresholds)
    free(uncertaintyThresholds);
  probabilityThresholds = self->_probabilityThresholds;
  if (probabilityThresholds)
    free(probabilityThresholds);
  v5.receiver = self;
  v5.super_class = (Class)SISceneSegmentation;
  -[SISceneSegmentation dealloc](&v5, sel_dealloc);
}

- (int64_t)evaluateSemanticForImageData:(id)a3 output:(id)a4
{
  id v6;
  id v7;
  int64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = -[SISceneSegmentation evaluateSemanticForImage:semanticOutput:confidenceOutput:uncertaintyOutput:](self, "evaluateSemanticForImage:semanticOutput:confidenceOutput:uncertaintyOutput:", objc_msgSend(v6, "inputImageBuffer"), objc_msgSend(v7, "semantic"), objc_msgSend(v7, "confidence"), objc_msgSend(v7, "uncertainty"));

  return v8;
}

- (int64_t)evaluateSemanticForImage:(__CVBuffer *)a3 semanticOutput:(__CVBuffer *)a4 confidenceOutput:(__CVBuffer *)a5 uncertaintyOutput:(__CVBuffer *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[SIModel inputs](self, "inputs", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", kSIMLSceneSegmentationInputTensorName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPixelBuffer:", a3);

  -[SIModel outputs](self, "outputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", kSIMLSceneSegmentationOutputLabelsTensorName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPixelBuffer:", a4);

  -[SIModel inputs](self, "inputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel outputs](self, "outputs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIModel evaluateWithInput:outputs:](self, "evaluateWithInput:outputs:", v13, v14);

  return 0;
}

- (int64_t)postprocessingOutput:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[SISceneSegmentation postprocessingSemanticOutput:confidenceOutput:uncertaintyOutput:](self, "postprocessingSemanticOutput:confidenceOutput:uncertaintyOutput:", objc_msgSend(v4, "semantic"), objc_msgSend(v4, "confidence"), objc_msgSend(v4, "uncertainty"));

  return v5;
}

- (int64_t)postprocessingIOSSemanticOutput:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 uncertaintyOutput:(__CVBuffer *)a5
{
  void *v9;
  __IOSurface *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  size_t Width;
  size_t Height;
  size_t v16;
  __IOSurface *v17;
  char *BaseAddress;
  char *v19;
  unsigned __int8 *v20;
  char *v21;
  __int16 *v22;
  uint64_t v23;
  __int16 *v24;
  uint64_t v25;
  char *v26;
  float *probabilityThresholds;
  __int16 *v28;
  uint64_t v29;
  float v37;
  int v38;
  float v39;
  __int16 *v40;
  float v44;
  size_t BytesPerRow;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferRef v48;
  CVPixelBufferRef v49;
  __IOSurface *buffer;
  size_t v51;
  size_t v52;

  -[SIModel network](self, "network");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__IOSurface *)objc_msgSend(v9, "getOutputSurface:", kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName);

  -[SIModel network](self, "network");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  buffer = (__IOSurface *)objc_msgSend(v11, "getOutputSurface:", kSIMLSceneSegmentationOutputNormalizationTensorName);

  -[SIModel network](self, "network");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "getOutputChannels:", kSIMLSceneSegmentationOutputExponentiatedLogitsTensorName);

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v52 = CVPixelBufferGetBytesPerRow(a4);
  v51 = CVPixelBufferGetBytesPerRow(a5);
  v16 = IOSurfaceGetBytesPerRow(buffer);
  kdebug_trace();
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(a5, 0);
  IOSurfaceLock(v10, 0, 0);
  IOSurfaceLock(buffer, 0, 0);
  v48 = a4;
  v17 = v10;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  v49 = a5;
  v19 = (char *)CVPixelBufferGetBaseAddress(a5);
  pixelBuffer = a3;
  v20 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  v21 = (char *)IOSurfaceGetBaseAddress(buffer);
  v22 = (__int16 *)IOSurfaceGetBaseAddress(v17);
  if (Height)
  {
    v23 = 0;
    v24 = v22;
    do
    {
      if (Width)
      {
        v25 = 0;
        v26 = &v19[v23 * v51];
        probabilityThresholds = self->_probabilityThresholds;
        v28 = v24;
        do
        {
          v29 = v20[v23 * BytesPerRow + v25];
          _H1 = v22[v25 + v23 * Width + Height * Width * v29];
          _H2 = *(_WORD *)&v21[2 * v25 + v23 * v16];
          __asm
          {
            FCVT            S1, H1
            FCVT            S2, H2
          }
          v37 = _S1 / _S2;
          *(float *)&BaseAddress[4 * v25 + v23 * v52] = v37;
          if (v37 >= probabilityThresholds[v29])
          {
            *(_DWORD *)&v26[4 * v25] = 1065353216;
          }
          else
          {
            if (v13)
            {
              v38 = 0;
              v39 = 0.0;
              v40 = v28;
              do
              {
                _H3 = *v40;
                __asm { FCVT            S3, H3 }
                if (v39 < _S3 && v39 != _S1)
                  v39 = _S3;
                ++v38;
                v40 += Width * Height;
              }
              while (v13 > v38);
            }
            else
            {
              v39 = 0.0;
            }
            v44 = 1.0 - (float)(v39 / _S1);
            if (v44 >= self->_uncertaintyThresholds[v29])
              *(float *)&v26[4 * v25] = v44;
            else
              *(_DWORD *)&v26[4 * v25] = 0;
          }
          ++v25;
          ++v28;
        }
        while (v25 != Width);
      }
      ++v23;
      v24 += Width;
    }
    while (v23 != Height);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(v48, 0);
  CVPixelBufferUnlockBaseAddress(v49, 0);
  IOSurfaceUnlock(v17, 0, 0);
  IOSurfaceUnlock(buffer, 0, 0);
  kdebug_trace();
  return 0;
}

- (id)subLoggers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SISceneSegmentation;
  -[SIModel subLoggers](&v3, sel_subLoggers);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
