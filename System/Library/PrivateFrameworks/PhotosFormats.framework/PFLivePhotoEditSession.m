@implementation PFLivePhotoEditSession

- (PFLivePhotoEditSession)init
{

  return 0;
}

- (PFLivePhotoEditSession)initWithPhotoURL:(id)a3 videoURL:(id)a4 photoTime:(id *)a5 photoOrientation:(unsigned int)a6
{
  id v9;
  const __CFURL *v10;
  char *v11;
  CGImageSourceRef v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  PFLivePhotoEditSession *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PFLivePhotoEditSession;
  v9 = a4;
  v10 = (const __CFURL *)a3;
  v11 = -[PFLivePhotoEditSession init](&v25, sel_init);
  v12 = CGImageSourceCreateWithURL(v10, 0);

  *((_QWORD *)v11 + 10) = v12;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v9, v25.receiver, v25.super_class);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)*((_QWORD *)v11 + 3);
  *((_QWORD *)v11 + 3) = v13;

  v15 = *(_OWORD *)&a5->var0;
  *((_QWORD *)v11 + 9) = a5->var3;
  *(_OWORD *)(v11 + 56) = v15;
  *((_DWORD *)v11 + 22) = a6;
  v16 = dispatch_queue_create("PFLivePhotoEditSession.state", 0);
  v17 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v16;

  v18 = dispatch_queue_create("PFLivePhotoEditSession.render", 0);
  v19 = (void *)*((_QWORD *)v11 + 2);
  *((_QWORD *)v11 + 2) = v18;

  v20 = objc_alloc(MEMORY[0x1E0C9DD90]);
  v21 = objc_msgSend(v20, "initWithOptions:", MEMORY[0x1E0C9AA70]);
  v22 = (void *)*((_QWORD *)v11 + 13);
  *((_QWORD *)v11 + 13) = v21;

  *((_DWORD *)v11 + 55) = 1065353216;
  if (*((_QWORD *)v11 + 10) && *((_QWORD *)v11 + 3))
    v23 = v11;
  else
    v23 = 0;

  return v23;
}

- (void)dealloc
{
  CGImageSource *inputImageSource;
  objc_super v4;

  inputImageSource = self->_inputImageSource;
  if (inputImageSource)
    CFRelease(inputImageSource);
  v4.receiver = self;
  v4.super_class = (Class)PFLivePhotoEditSession;
  -[PFLivePhotoEditSession dealloc](&v4, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  NSObject *stateQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A17D2676;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PFLivePhotoEditSession_duration__block_invoke;
  block[3] = &unk_1E45A4B68;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(stateQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_inputVideoDuration
{
  int *p_var1;
  __int128 v5;
  uint64_t v6;

  p_var1 = &self[1].var1;
  if ((self[1].var3 & 0x100000000) == 0)
  {
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _loadInputVideoDuration](self, "_loadInputVideoDuration");
    *(_OWORD *)p_var1 = v5;
    *((_QWORD *)p_var1 + 2) = v6;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var1;
  retstr->var3 = *((_QWORD *)p_var1 + 2);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_loadInputVideoDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_videoAsset;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](result, "duration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (unsigned)orientation
{
  NSObject *stateQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PFLivePhotoEditSession_orientation__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)_inputOrientation
{
  unsigned int result;

  result = self->_inputOrientation;
  if (!result)
  {
    result = -[PFLivePhotoEditSession _loadInputImageOrientation](self, "_loadInputImageOrientation");
    self->_inputOrientation = result;
  }
  return result;
}

- (unsigned)_loadInputImageOrientation
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  -[PFLivePhotoEditSession _inputImageProperties](self, "_inputImageProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 1;

  return v5;
}

- (id)frameProcessor
{
  NSObject *stateQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PFLivePhotoEditSession_frameProcessor__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (void *)MEMORY[0x1A1B0CFA4](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setFrameProcessor:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PFLivePhotoEditSession_setFrameProcessor___block_invoke;
  block[3] = &unk_1E45A4590;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (id)imageProperties
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__74;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PFLivePhotoEditSession_imageProperties__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_inputImageProperties
{
  NSDictionary *inputImageProperties;
  NSDictionary *v4;
  NSDictionary *v5;

  inputImageProperties = self->_inputImageProperties;
  if (!inputImageProperties)
  {
    -[PFLivePhotoEditSession _loadInputImageProperties](self, "_loadInputImageProperties");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_inputImageProperties;
    self->_inputImageProperties = v4;

    inputImageProperties = self->_inputImageProperties;
  }
  return inputImageProperties;
}

- (id)_loadInputImageProperties
{
  return CGImageSourceCopyPropertiesAtIndex(self->_inputImageSource, 0, 0);
}

- (CIImage)inputImage
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__74;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PFLivePhotoEditSession_inputImage__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CIImage *)v3;
}

- (id)_inputImage
{
  CIImage *inputImage;
  CIImage *v4;
  CIImage *v5;

  inputImage = self->_inputImage;
  if (!inputImage)
  {
    -[PFLivePhotoEditSession _loadInputImage](self, "_loadInputImage");
    v4 = (CIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_inputImage;
    self->_inputImage = v4;

    inputImage = self->_inputImage;
  }
  return inputImage;
}

- (id)_loadInputImage
{
  return -[PFLivePhotoEditSession _loadInputImageWithSubsampleFactor:](self, "_loadInputImageWithSubsampleFactor:", 1);
}

- (id)_loadInputImageWithSubsampleFactor:(int64_t)a3
{
  id v5;
  void *v6;
  CGImageRef ImageAtIndex;
  CGImageRef v8;
  void *v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBD290]);

  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_inputImageSource, 0, (CFDictionaryRef)v5);
  if (ImageAtIndex)
  {
    v8 = ImageAtIndex;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", ImageAtIndex);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_scaledInputImageForTargetScale:(double)a3
{
  int64_t v5;
  uint64_t v6;
  CIImage *subsampledInputImage;
  CIImage *v8;
  CIImage *v9;
  CGAffineTransform v11;

  v5 = 1;
  if (a3 < 1.0)
  {
    v6 = vcvtmd_s64_f64(log2(1.0 / a3));
    if (v6 >= 3)
      LOBYTE(v6) = 3;
    v5 = 1 << v6;
  }
  subsampledInputImage = self->_subsampledInputImage;
  if (!subsampledInputImage || v5 != self->_subsampleFactor)
  {
    self->_subsampleFactor = v5;
    if (v5 == 1)
      -[PFLivePhotoEditSession _inputImage](self, "_inputImage");
    else
      -[PFLivePhotoEditSession _loadInputImageWithSubsampleFactor:](self, "_loadInputImageWithSubsampleFactor:", v5);
    v8 = (CIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_subsampledInputImage;
    self->_subsampledInputImage = v8;

    subsampledInputImage = self->_subsampledInputImage;
  }
  CGAffineTransformMakeScale(&v11, a3 / (1.0 / (double)v5), a3 / (1.0 / (double)v5));
  -[CIImage imageByApplyingTransform:](subsampledInputImage, "imageByApplyingTransform:", &v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)inputImageForRenderScale:(double)a3
{
  NSObject *stateQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__73;
  v11 = __Block_byref_object_dispose__74;
  v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PFLivePhotoEditSession_inputImageForRenderScale___block_invoke;
  block[3] = &unk_1E45A26A8;
  block[4] = self;
  block[5] = &v7;
  *(double *)&block[6] = a3;
  dispatch_sync(stateQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CGSize)_inputImageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PFLivePhotoEditSession _inputImage](self, "_inputImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extent");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_inputVideoTrack
{
  void *v2;
  void *v3;

  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], self->_videoAsset);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)_inputVideoSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PFLivePhotoEditSession _inputVideoTrack](self, "_inputVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimensions");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGAffineTransform)_inputVideoTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[PFLivePhotoEditSession _inputVideoTrack](self, "_inputVideoTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "preferredTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (double)_inputVideoScale
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  uint64_t v17;

  result = self->_inputVideoScale;
  if (result <= 0.0)
  {
    -[PFLivePhotoEditSession _inputImageSize](self, "_inputImageSize");
    v5 = v4;
    v7 = v6;
    -[PFLivePhotoEditSession _inputVideoSize](self, "_inputVideoSize");
    v9 = v8 / v5;
    v11 = v10 / v7;
    v12 = -(v10 - v8 / v5 * v7);
    v13 = -(v8 - v11 * v5);
    v14 = fabs(v12);
    v15 = fabs(v13);
    v16 = v14 < v15;
    if (v14 >= v15)
      result = v11;
    else
      result = v9;
    v17 = 168;
    if (v16)
      v17 = 176;
    else
      v12 = v13;
    self->_inputVideoScale = result;
    *(double *)((char *)&self->super.isa + v17) = v12;
  }
  return result;
}

- (id)outputImage
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__73;
  v10 = __Block_byref_object_dispose__74;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PFLivePhotoEditSession_outputImage__block_invoke;
  v5[3] = &unk_1E45A4B68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_outputImage
{
  CIImage *outputImage;
  void *v4;
  CIImage *v5;
  id v6;
  CIImage *v7;
  id v9;

  outputImage = self->_outputImage;
  if (!outputImage)
  {
    -[PFLivePhotoEditSession _inputImage](self, "_inputImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v9 = 0;
      -[PFLivePhotoEditSession _processImage:scale:error:](self, "_processImage:scale:error:", v4, &v9, 1.0);
      v5 = (CIImage *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = self->_outputImage;
      self->_outputImage = v5;

      if (!self->_outputImage)
        NSLog(CFSTR("*** failed to process image, error: %@"), v6);

    }
    outputImage = self->_outputImage;
  }
  return outputImage;
}

- (CGSize)outputImageSize
{
  NSObject *stateQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1A17D2676;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PFLivePhotoEditSession_outputImageSize__block_invoke;
  v7[3] = &unk_1E45A4B68;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)_outputImageSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PFLivePhotoEditSession _outputImage](self, "_outputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "extent");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[PFLivePhotoEditSession _inputImageSize](self, "_inputImageSize");
    v6 = v9;
    v8 = v10;
  }

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)outputVideoSize
{
  NSObject *stateQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1A17D2676;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PFLivePhotoEditSession_outputVideoSize__block_invoke;
  v7[3] = &unk_1E45A4B68;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)_outputVideoSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGSize result;

  -[PFLivePhotoEditSession _outputImageSize](self, "_outputImageSize");
  v4 = v3;
  v6 = v5;
  -[PFLivePhotoEditSession _inputVideoScale](self, "_inputVideoScale");
  v8 = v7 * v4;
  v9 = v7 * v6;
  memset(&v14, 0, sizeof(v14));
  -[PFLivePhotoEditSession _inputVideoTransform](self, "_inputVideoTransform");
  v12 = v14;
  CGAffineTransformInvert(&v13, &v12);
  v10 = round((v9 * v13.d + v13.b * v8 + self->_inputVideoScaleRoundingError.height) * v14.c+ v14.a * (v9 * v13.c + v13.a * v8 + self->_inputVideoScaleRoundingError.width));
  v11 = round(v9);
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)_videoCompositionForTargetSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  PFLivePhotoFrameProcessingRequest *v10;
  void *v11;
  void *v12;
  AVAsset *videoAsset;
  id v14;
  PFLivePhotoFrameProcessingRequest *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[4];
  PFLivePhotoFrameProcessingRequest *v26;
  PFLivePhotoEditSession *v27;
  id v28;
  double v29;
  double v30;

  height = a3.height;
  width = a3.width;
  -[PFLivePhotoEditSession _inputVideoScale](self, "_inputVideoScale");
  v7 = v6;
  -[PFLivePhotoEditSession _targetScaleForTargetSize:](self, "_targetScaleForTargetSize:", width, height);
  v9 = fmin(v7, v8);
  v10 = objc_alloc_init(PFLivePhotoFrameProcessingRequest);
  v11 = (void *)MEMORY[0x1A1B0CFA4](self->_frameProcessor);
  v12 = (void *)MEMORY[0x1E0C8B288];
  videoAsset = self->_videoAsset;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke;
  v25[3] = &unk_1E45A26F8;
  v29 = v9;
  v30 = v7;
  v27 = self;
  v28 = v11;
  v26 = v10;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "videoCompositionWithAsset:applyingCIFiltersWithHandler:", videoAsset, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFLivePhotoEditSession _outputVideoSizeForScale:](self, "_outputVideoSizeForScale:", v9);
  if (v18 > 0.0 && v17 > 0.0)
    objc_msgSend(v16, "setRenderSize:");
  -[PFLivePhotoEditSession _inputVideoTrack](self, "_inputVideoTrack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSourceTrackIDForFrameTiming:", objc_msgSend(v19, "trackID"));
  if (v19)
  {
    objc_msgSend(v19, "minFrameDuration");
  }
  else
  {
    v23 = 0uLL;
    v24 = 0;
  }
  v21 = v23;
  v22 = v24;
  objc_msgSend(v16, "setFrameDuration:", &v21);
  objc_msgSend(v16, "setColorPrimaries:", *MEMORY[0x1E0C8AEA0]);
  objc_msgSend(v16, "setColorTransferFunction:", *MEMORY[0x1E0C8AF50]);
  objc_msgSend(v16, "setColorYCbCrMatrix:", *MEMORY[0x1E0C8AF70]);

  return v16;
}

- (CGSize)_outputVideoSizeForScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PFLivePhotoEditSession _inputVideoScale](self, "_inputVideoScale");
  v6 = v5;
  -[PFLivePhotoEditSession _outputVideoSize](self, "_outputVideoSize");
  if (v6 > a3)
  {
    v7 = round(a3 / v6 * v7);
    v8 = round(a3 / v6 * v8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_processImage:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8;
  PFLivePhotoFrameProcessingRequest *v9;
  void *v10;
  void (**frameProcessor)(id, PFLivePhotoFrameProcessingRequest *, id *);
  void *v12;
  $95D729B680665BEAEFA1D6FCA8238556 photoTime;

  v8 = a3;
  v9 = objc_alloc_init(PFLivePhotoFrameProcessingRequest);
  objc_msgSend(v8, "imageByApplyingOrientation:", -[PFLivePhotoEditSession _inputOrientation](self, "_inputOrientation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFLivePhotoFrameProcessingRequest setImage:](v9, "setImage:", v10);
  photoTime = self->_photoTime;
  -[PFLivePhotoFrameProcessingRequest setTime:](v9, "setTime:", &photoTime);
  -[PFLivePhotoFrameProcessingRequest setRenderScale:](v9, "setRenderScale:", a4);
  -[PFLivePhotoFrameProcessingRequest setType:](v9, "setType:", 0);
  frameProcessor = (void (**)(id, PFLivePhotoFrameProcessingRequest *, id *))self->_frameProcessor;
  if (frameProcessor)
    frameProcessor[2](frameProcessor, v9, a5);
  else
    -[PFLivePhotoFrameProcessingRequest image](v9, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)prepareForPlaybackWithTargetSize:(CGSize)a3 options:(id)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  NSObject *stateQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  CGFloat v17;
  CGFloat v18;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PFLivePhotoEditSession_prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke;
  block[3] = &unk_1E45A2720;
  v17 = width;
  v18 = height;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(stateQueue, block);

}

- (void)_cancelCurrentExportIfNeeded
{
  void *v3;
  void *v4;
  AVAssetExportSession *exportSession;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_isExporting)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[AVAssetExportSession outputURL](self->_exportSession, "outputURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "aborting export session at path %@", (uint8_t *)&v6, 0xCu);

    }
    -[CIContext abort](self->_renderContext, "abort");
    -[AVAssetExportSession cancelExport](self->_exportSession, "cancelExport");
    exportSession = self->_exportSession;
    self->_exportSession = 0;

    self->_isExporting = 0;
  }
}

- (void)_prepareForPlaybackWithTargetSize:(CGSize)a3 options:(id)a4 completionHandler:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  void *v15;
  NSString *v16;
  NSString *uniqueIdentifier;
  float audioVolume;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  double v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  PFLivePhotoEditSession *v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t *v33;
  __int128 v34;
  int64_t v35;
  float v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  PFLivePhotoEditSession *v40;
  uint64_t *v41;
  _QWORD *v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD *v45;
  _QWORD *v46;
  __int128 v47;
  int64_t epoch;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[4];
  _QWORD v56[5];
  id v57;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LivePhotoShouldRenderAtPlaybackTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
    v14 = -[PFLivePhotoEditSession _canRenderAtPlaybackTime](self, "_canRenderAtPlaybackTime");
  else
    v14 = 0;
  self->_isExporting = 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v16;

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__73;
  v56[4] = __Block_byref_object_dispose__74;
  v57 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v55[3] = 0;
  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__73;
  v53 = __Block_byref_object_dispose__74;
  v54 = 0;
  audioVolume = self->_audioVolume;
  v47 = *(_OWORD *)&self->_photoTime.value;
  epoch = self->_photoTime.epoch;
  dispatch_group_enter(v11);
  v19 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke;
  v43[3] = &unk_1E45A2748;
  v45 = v55;
  v46 = v56;
  v20 = v11;
  v44 = v20;
  -[PFLivePhotoEditSession _renderImageWithTargetSize:completionHandler:](self, "_renderImageWithTargetSize:completionHandler:", v43, width, height);
  if (v14)
  {
    objc_storeStrong(v50 + 5, self->_videoAsset);
    -[PFLivePhotoEditSession _videoCompositionForTargetSize:](self, "_videoCompositionForTargetSize:", width, height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_group_enter(v20);
    v22 = *MEMORY[0x1E0C8A2E8];
    -[PFLivePhotoEditSession _temporaryURLOfType:](self, "_temporaryURLOfType:", *MEMORY[0x1E0C8A2E8]);
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2;
    v37[3] = &unk_1E45A27C0;
    v41 = &v49;
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v38 = v23;
    v42 = v56;
    v39 = v20;
    v40 = self;
    LODWORD(v24) = 1.0;
    -[PFLivePhotoEditSession _renderVideoToURL:fileType:targetSize:volume:completionHandler:](self, "_renderVideoToURL:fileType:targetSize:volume:completionHandler:", v23, v22, v37, width, height, v24);

    v21 = 0;
  }
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_96;
  v27[3] = &unk_1E45A27E8;
  v32 = v55;
  v33 = &v49;
  v35 = epoch;
  v34 = v47;
  v36 = audioVolume;
  v28 = v21;
  v29 = self;
  v30 = v10;
  v31 = v56;
  v25 = v10;
  v26 = v21;
  dispatch_group_notify(v20, MEMORY[0x1E0C80D38], v27);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v56, 8);

}

- (BOOL)_canRenderAtPlaybackTime
{
  return 0;
}

- (void)_renderImageToURL:(id)a3 fileType:(id)a4 targetSize:(CGSize)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  -[PFLivePhotoEditSession _outputImageProperties](self, "_outputImageProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__PFLivePhotoEditSession__renderImageToURL_fileType_targetSize_completionHandler___block_invoke;
  v19[3] = &unk_1E45A2810;
  v20 = v11;
  v21 = v12;
  v22 = v14;
  v23 = v13;
  v15 = v13;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  -[PFLivePhotoEditSession _renderImageWithTargetSize:completionHandler:](self, "_renderImageWithTargetSize:completionHandler:", v19, width, height);

}

- (void)_renderImageWithTargetSize:(CGSize)a3 completionHandler:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *renderQueue;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PFLivePhotoEditSession _targetScaleForTargetSize:](self, "_targetScaleForTargetSize:", width, height);
  v9 = v8;
  -[PFLivePhotoEditSession _scaledInputImageForTargetScale:](self, "_scaledInputImageForTargetScale:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[PFLivePhotoEditSession _processImage:scale:error:](self, "_processImage:scale:error:", v10, &v18, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  v13 = v12;
  if (v11)
  {
    renderQueue = self->_renderQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PFLivePhotoEditSession__renderImageWithTargetSize_completionHandler___block_invoke;
    block[3] = &unk_1E45A3E58;
    block[4] = self;
    v16 = v11;
    v17 = v7;
    dispatch_async(renderQueue, block);

  }
  else
  {
    NSLog(CFSTR("*** failed to process scaled image %@, error: %@"), v10, v12);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
  }

}

- (double)_targetScaleForTargetSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  if (a3.width <= 0.0)
    return 1.0;
  height = a3.height;
  if (a3.height <= 0.0)
    return 1.0;
  width = a3.width;
  -[PFLivePhotoEditSession _outputImageSize](self, "_outputImageSize");
  if (v5 <= 0.0 || v6 <= 0.0)
    return 1.0;
  else
    return fmin(width / v5, height / v6);
}

- (id)_outputImageProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[PFLivePhotoEditSession _inputImageProperties](self, "_inputImageProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = *MEMORY[0x1E0CBCF70];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_uniqueIdentifier, *MEMORY[0x1E0C89C70]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E45CA5F8, *MEMORY[0x1E0CBCFF0]);
  v8 = *MEMORY[0x1E0CBD090];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E45CA5F8, *MEMORY[0x1E0CBD0C0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v8);

  return v4;
}

- (void)_renderVideoToURL:(id)a3 fileType:(id)a4 targetSize:(CGSize)a5 volume:(float)a6 completionHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  AVAsset *v16;
  AVAssetExportSession *v17;
  CMTimeEpoch epoch;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CMTimeEpoch v35;
  uint64_t i;
  void *v37;
  double v38;
  AVAssetExportSession *v39;
  AVAssetExportSession *exportSession;
  void *v41;
  AVAsset *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  AVAssetExportSession *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  CMTime duration;
  CMTimeRange v62;
  _BYTE v63[128];
  _BYTE v64[128];
  CMTime start;
  uint64_t v66;

  height = a5.height;
  width = a5.width;
  v66 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = self->_videoAsset;
  if (a6 > 0.0)
  {
LABEL_14:
    v27 = objc_alloc(MEMORY[0x1E0C8AFC0]);
    v28 = (void *)objc_msgSend(v27, "initWithAsset:presetName:", v16, *MEMORY[0x1E0C89E28]);
    objc_msgSend(v28, "setOutputURL:", v13);
    objc_msgSend(v28, "setOutputFileType:", v14);
    -[PFLivePhotoEditSession _videoCompositionForTargetSize:](self, "_videoCompositionForTargetSize:", width, height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setVideoComposition:", v21);
    -[PFLivePhotoEditSession _outputVideoMetadata](self, "_outputVideoMetadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMetadata:", v29);

    if (a6 > 0.0 && a6 < 1.0)
    {
      v44 = v13;
      v46 = v21;
      v43 = v15;
      objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v42 = v16;
      +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v53;
        v48 = *MEMORY[0x1E0CA2E68];
        v35 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v53 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v38 = self->_audioVolume;
            *(_OWORD *)&start.value = v48;
            start.epoch = v35;
            objc_msgSend(v37, "setVolume:atTime:", &start, v38);
            objc_msgSend(v30, "addObject:", v37);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
        }
        while (v33);
      }

      objc_msgSend(v41, "setInputParameters:", v30);
      objc_msgSend(v28, "setAudioMix:", v41);

      v13 = v44;
      v16 = v42;
      v15 = v43;
      v21 = v46;
    }
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __89__PFLivePhotoEditSession__renderVideoToURL_fileType_targetSize_volume_completionHandler___block_invoke;
    v49[3] = &unk_1E45A4590;
    v39 = v28;
    v50 = v39;
    v51 = v15;
    -[AVAssetExportSession exportAsynchronouslyWithCompletionHandler:](v39, "exportAsynchronouslyWithCompletionHandler:", v49);
    exportSession = self->_exportSession;
    self->_exportSession = v39;
    v17 = v39;

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v17 = (AVAssetExportSession *)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[AVAsset duration](v16, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v47 = *(_OWORD *)&start.value;
  epoch = start.epoch;
  CMTimeRangeMake(&v62, &start, &duration);
  v60 = 0;
  *(_OWORD *)&start.value = v47;
  start.epoch = epoch;
  v19 = +[PFMediaUtilities insertTimeRange:ofAsset:atTime:intoMutableComposition:error:](PFMediaUtilities, "insertTimeRange:ofAsset:atTime:intoMutableComposition:error:", &v62, v16, &start, v17, &v60);
  v20 = v60;
  v21 = v20;
  if (v19)
  {
    v45 = v20;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[AVAssetExportSession tracksWithMediaType:](v17, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v57 != v25)
            objc_enumerationMutation(v22);
          -[AVAssetExportSession removeTrack:](v17, "removeTrack:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v24);
    }

    v16 = (AVAsset *)v17;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(start.value) = 138412546;
    *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v16;
    LOWORD(start.flags) = 2112;
    *(_QWORD *)((char *)&start.flags + 2) = v21;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to insert tracks of asset: %@, error: %@", (uint8_t *)&start, 0x16u);
  }
  (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v21);
LABEL_28:

}

- (id)_outputVideoMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[AVAsset metadata](self->_videoAsset, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_3462);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "removeObjectAtIndex:", v5);
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", *MEMORY[0x1E0C8A948]);
  objc_msgSend(v6, "setValue:", self->_uniqueIdentifier);
  objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (id)_temporaryURLOfType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFilenameExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "temporaryDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)exportToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *stateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  stateQueue = self->_stateQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PFLivePhotoEditSession_exportToDestination_options_completionHandler___block_invoke;
  v15[3] = &unk_1E45A2878;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(stateQueue, v15);

}

- (void)_exportToDestination:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSString *v11;
  NSString *uniqueIdentifier;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  float audioVolume;
  NSObject *v22;
  double v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[4];
  NSObject *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[3];
  char v48;

  v8 = a3;
  v26 = a4;
  v25 = a5;
  v9 = dispatch_group_create();
  self->_isExporting = 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v11;

  dispatch_group_enter(v9);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__73;
  v45[4] = __Block_byref_object_dispose__74;
  v46 = 0;
  objc_msgSend(v8, "photoURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke;
  v41[3] = &unk_1E45A28A0;
  v43 = v47;
  v44 = v45;
  v16 = v9;
  v42 = v16;
  v17 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PFLivePhotoEditSession _renderImageToURL:fileType:targetSize:completionHandler:](self, "_renderImageToURL:fileType:targetSize:completionHandler:", v13, v14, v41, *MEMORY[0x1E0C9D820], v18);

  dispatch_group_enter(v16);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__73;
  v37[4] = __Block_byref_object_dispose__74;
  v38 = 0;
  objc_msgSend(v8, "videoURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0C8A2E8];
  audioVolume = self->_audioVolume;
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_2;
  v33[3] = &unk_1E45A28A0;
  v35 = v39;
  v36 = v37;
  v22 = v16;
  v34 = v22;
  *(float *)&v23 = audioVolume;
  -[PFLivePhotoEditSession _renderVideoToURL:fileType:targetSize:volume:completionHandler:](self, "_renderVideoToURL:fileType:targetSize:volume:completionHandler:", v19, v20, v33, v17, v18, v23);

  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_3;
  block[3] = &unk_1E45A28C8;
  v29 = v47;
  v30 = v39;
  v31 = v45;
  v32 = v37;
  block[4] = self;
  v28 = v25;
  v24 = v25;
  dispatch_group_notify(v22, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);

}

- (void)cancel
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PFLivePhotoEditSession_cancel__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_photoTime, 24, 1, 0);
  return result;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_lastTemporaryVideoURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong(&self->_frameProcessor, 0);
  objc_storeStrong((id *)&self->_scaledOutputImage, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_subsampledInputImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_inputImageProperties, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

uint64_t __32__PFLivePhotoEditSession_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentExportIfNeeded");
}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];

  v2 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v3 = *(id *)(*(_QWORD *)(a1[9] + 8) + 40);
    if (!v3)
    {
      v8 = 0;
      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "domain", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.PhotosFormats")) & 1) != 0)
  {
    v5 = objc_msgSend(v8, "code");

    if (v5 == 3)
      goto LABEL_10;
  }
  else
  {

  }
LABEL_9:
  v6 = a1[4];
  v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_4;
  block[3] = &unk_1E45A4AC8;
  block[4] = v6;
  dispatch_sync(v7, block);
LABEL_10:
  (*(void (**)(void))(a1[5] + 16))();

}

void __73__PFLivePhotoEditSession__exportToDestination_options_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;

}

uint64_t __72__PFLivePhotoEditSession_exportToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentExportIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_exportToDestination:options:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __46__PFLivePhotoEditSession__outputVideoMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0C8A948]);

  return v3;
}

void __89__PFLivePhotoEditSession__renderVideoToURL_fileType_targetSize_volume_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "status") == 3)
    goto LABEL_7;
  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  v3 = *(void **)(a1 + 32);
  if (v2 != 4)
  {
    if (objc_msgSend(v3, "status") == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 3, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "error");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = (void *)v4;
LABEL_8:
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__PFLivePhotoEditSession__renderImageWithTargetSize_completionHandler___block_invoke(_QWORD *a1)
{
  CGColorSpace *v2;
  void *v3;
  void *v4;
  CGImage *v5;
  uint64_t v6;
  void *v7;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  v3 = (void *)a1[5];
  v4 = *(void **)(a1[4] + 104);
  objc_msgSend(v3, "extent");
  v5 = (CGImage *)objc_msgSend(v4, "createCGImage:fromRect:format:colorSpace:", v3, *MEMORY[0x1E0C9DFF8], v2);
  CGColorSpaceRelease(v2);
  if (!v5)
  {
    NSLog(CFSTR("*** failed to render scaled image %@"), a1[5]);
    v6 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  (*(void (**)(void))(a1[6] + 16))();
  CGImageRelease(v5);
}

void __82__PFLivePhotoEditSession__renderImageToURL_fileType_targetSize_completionHandler___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  CGImageDestination *v5;
  CGImageDestination *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a2)
  {
    v5 = CGImageDestinationCreateWithURL(*(CFURLRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), 1uLL, 0);
    if (v5)
    {
      v6 = v5;
      CGImageDestinationAddImage(v5, a2, *(CFDictionaryRef *)(a1 + 48));
      if (CGImageDestinationFinalize(v6))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 5, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
      CFRelease(v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGImageRetain(a2);
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_3;
    v31[3] = &unk_1E45A2770;
    v32 = &unk_1E45CB2A0;
    v34 = *(_OWORD *)(a1 + 56);
    v33 = *(id *)(a1 + 40);
    objc_msgSend(v10, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E45CB2A0, v31);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__73;
    v29 = __Block_byref_object_dispose__74;
    v30 = 0;
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(NSObject **)(v12 + 8);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_4;
    block[3] = &unk_1E45A2798;
    v24 = &v25;
    block[4] = v12;
    v23 = *(id *)(a1 + 32);
    dispatch_sync(v13, block);
    if (v26[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26[5];
      v21 = 0;
      v16 = objc_msgSend(v14, "removeItemAtURL:error:", v15, &v21);
      v17 = v21;

      if ((v16 & 1) == 0)
      {
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v26[5], "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v20;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to delete temporary file: %@", buf, 0xCu);

        }
      }

    }
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_96(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  CGImage *v5;
  char v6;
  PFLivePhotoPlaybackResult *v7;
  PFLivePhotoPlaybackSettings *v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  __int128 v13;
  uint64_t v14;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PhotosFormats")))
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code") == 3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  v5 = *(CGImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v5 && (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) ? (v6 = 1) : (v6 = v4), (v6 & 1) == 0))
  {
    v7 = objc_alloc_init(PFLivePhotoPlaybackResult);
    -[PFLivePhotoPlaybackResult setVideoAsset:](v7, "setVideoAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    -[PFLivePhotoPlaybackResult setPhoto:](v7, "setPhoto:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v13 = *(_OWORD *)(a1 + 80);
    v14 = *(_QWORD *)(a1 + 96);
    -[PFLivePhotoPlaybackResult setPhotoTime:](v7, "setPhotoTime:", &v13);
    -[PFLivePhotoPlaybackResult setPhotoExifOrientation:](v7, "setPhotoExifOrientation:", 1);
    v8 = objc_alloc_init(PFLivePhotoPlaybackSettings);
    -[PFLivePhotoPlaybackSettings setVideoComposition:](v8, "setVideoComposition:", *(_QWORD *)(a1 + 32));
    LODWORD(v9) = *(_DWORD *)(a1 + 104);
    -[PFLivePhotoPlaybackSettings setAudioVolume:](v8, "setAudioVolume:", v9);
    v5 = *(CGImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  CGImageRelease(v5);
  if (!v4)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2_99;
    block[3] = &unk_1E45A4AC8;
    block[4] = v10;
    dispatch_sync(v11, block);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_2_99(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;

}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v16 = 0;
        v9 = objc_msgSend(v8, "statusOfValueForKey:error:", v7, &v16);
        v10 = v16;
        v11 = v10;
        if (v9 == 3)
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = 0;

          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v11;

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __86__PFLivePhotoEditSession__prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 200));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), *(id *)(a1 + 40));
}

uint64_t __85__PFLivePhotoEditSession_prepareForPlaybackWithTargetSize_options_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentExportIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForPlaybackWithTargetSize:options:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  uint64_t v17;
  CGColorSpace *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  CGAffineTransform v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  CGAffineTransform v34;

  v3 = a2;
  v4 = v3;
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  if (v5 >= v6)
  {
    objc_msgSend(v3, "sourceImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v8);
  }
  else
  {
    v7 = v5 / v6;
    objc_msgSend(v3, "sourceImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v34, v7, v7);
    objc_msgSend(v8, "imageByApplyingTransform:", &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v9);

  }
  if (v4)
  {
    objc_msgSend(v4, "compositionTime");
  }
  else
  {
    v32 = 0uLL;
    v33 = 0;
  }
  v10 = *(void **)(a1 + 32);
  v30 = v32;
  v31 = v33;
  objc_msgSend(v10, "setTime:", &v30);
  objc_msgSend(*(id *)(a1 + 32), "setRenderScale:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setType:", 1);
  v11 = *(_QWORD *)(a1 + 48);
  v29 = 0;
  (*(void (**)(void))(v11 + 16))();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (v12)
  {
    objc_msgSend(v12, "extent");
    if (v14 != *MEMORY[0x1E0C9D538] || v15 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      CGAffineTransformMakeTranslation(&v28, -v14, -v15);
      objc_msgSend(v12, "imageByApplyingTransform:", &v28);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    objc_msgSend(v12, "imageByColorMatchingWorkingSpaceToColorSpace:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorClamp"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "imageByColorMatchingColorSpaceToWorkingSpace:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    CGColorSpaceRelease(v18);
    v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke_2;
    v24[3] = &unk_1E45A26D0;
    v25 = v4;
    v26 = v21;
    v27 = *(_QWORD *)(a1 + 40);
    v23 = v21;
    dispatch_sync(v22, v24);

  }
  else
  {
    objc_msgSend(v4, "finishWithError:", v13);
  }

}

uint64_t __57__PFLivePhotoEditSession__videoCompositionForTargetSize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithImage:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104));
}

uint64_t __41__PFLivePhotoEditSession_outputVideoSize__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_outputVideoSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

uint64_t __41__PFLivePhotoEditSession_outputImageSize__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_outputImageSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

void __37__PFLivePhotoEditSession_outputImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_outputImage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__PFLivePhotoEditSession_inputImageForRenderScale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_scaledInputImageForTargetScale:", *(double *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__PFLivePhotoEditSession_inputImage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inputImage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__PFLivePhotoEditSession_imageProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inputImageProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__PFLivePhotoEditSession_setFrameProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 152);
  *(_QWORD *)(v7 + 152) = 0;

}

void __40__PFLivePhotoEditSession_frameProcessor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A1B0CFA4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __37__PFLivePhotoEditSession_orientation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inputOrientation");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __34__PFLivePhotoEditSession_duration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_inputVideoDuration");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

+ (id)temporaryDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PFLivePhotoEditSession_temporaryDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (temporaryDirectory_onceToken != -1)
    dispatch_once(&temporaryDirectory_onceToken, block);
  return (id)temporaryDirectory_s_temporaryDirectory;
}

+ (id)_createTemporaryDirectory
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("live-photo-renders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  if (objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v4, &v23))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v2, "enumeratorAtPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          v11 = objc_msgSend(v2, "removeItemAtPath:error:", v10, &v18);
          v12 = v18;
          v13 = v12;
          if ((v11 & 1) == 0)
            NSLog(CFSTR("Couldn't remove temporary file: %@, error: %@"), v10, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }
  }
  else
  {
    v17 = 0;
    v14 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, &v17);
    v15 = v17;
    v5 = v15;
    if ((v14 & 1) == 0)
      NSLog(CFSTR("Couldn't create temporary directory: %@, error: %@"), v4, v15);
  }

  return v4;
}

void __44__PFLivePhotoEditSession_temporaryDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createTemporaryDirectory");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)temporaryDirectory_s_temporaryDirectory;
  temporaryDirectory_s_temporaryDirectory = v1;

}

@end
