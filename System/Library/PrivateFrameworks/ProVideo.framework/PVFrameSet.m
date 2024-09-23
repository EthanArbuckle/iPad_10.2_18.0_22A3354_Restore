@implementation PVFrameSet

+ (PVFrameSet)frameSetWithARMetadata:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 matte:(id)a6 dilatedDepth:(id)a7 timestamp:(id *)a8 frameDuration:(id *)a9 metadata:(id)a10
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PVFrameSet *v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27;
  __int128 v28;
  int64_t var3;
  _QWORD v30[2];
  _QWORD v31[3];

  v13 = *(_QWORD *)&a5;
  v31[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  v30[0] = CFSTR("kPVARMetadataKey");
  v30[1] = CFSTR("kPVARDepthFreshnessKey");
  v31[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v22, "addEntriesFromDictionary:", v19);

  }
  else
  {
    v22 = v21;
  }
  +[PVImageBuffer imageWithCVPixelBuffer:](PVImageBuffer, "imageWithCVPixelBuffer:", objc_msgSend(v15, "imageBuffer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_OWORD *)&a8->var0;
  var3 = a8->var3;
  v27 = *a9;
  +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:timestamp:frameDuration:](PVCMSampleBuffer, "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v23, &v28, &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PVFrameSet initWithColorBuffer:depthData:metadata:matte:dilatedDepth:]([PVFrameSet alloc], "initWithColorBuffer:depthData:metadata:matte:dilatedDepth:", v24, v16, v22, v17, v18);

  return v25;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 frameDuration:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v6 = a3;
  objc_msgSend(v6, "capturedDepthData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a4;
  objc_msgSend(a1, "frameSetWithARFrame:depthData:depthFreshness:frameDuration:", v6, v7, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVFrameSet *)v8;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 frameDuration:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  PVARMetadata *v12;
  Float64 v13;
  void *v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  CMTime v17;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = -[PVARMetadata initWithARFrame:depthData:depthFreshness:]([PVARMetadata alloc], "initWithARFrame:depthData:depthFreshness:", v10, v11, v7);
  objc_msgSend(v10, "timestamp");
  CMTimeMakeWithSeconds(&v17, v13, 1000000000);
  v16 = *a6;
  objc_msgSend(a1, "frameSetWithARMetadata:depthData:depthFreshness:matte:dilatedDepth:timestamp:frameDuration:metadata:", v12, v11, v7, 0, 0, &v17, &v16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVFrameSet *)v14;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 depthData:(id)a4 depthFreshness:(int)a5 frameDuration:(id *)a6 matte:(id)a7 dilatedDepth:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  PVARMetadata *v18;
  Float64 v19;
  void *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22;
  CMTime v23;

  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = -[PVARMetadata initWithARFrame:depthData:depthFreshness:]([PVARMetadata alloc], "initWithARFrame:depthData:depthFreshness:", v14, v15, v11);
  objc_msgSend(v14, "timestamp");
  CMTimeMakeWithSeconds(&v23, v19, 1000000000);
  v22 = *a6;
  objc_msgSend(a1, "frameSetWithARMetadata:depthData:depthFreshness:matte:dilatedDepth:timestamp:frameDuration:metadata:", v18, v15, v11, v16, v17, &v23, &v22, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVFrameSet *)v20;
}

+ (PVFrameSet)frameSetWithARFrame:(id)a3 frameDuration:(id *)a4 matte:(id)a5 dilatedDepth:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PVARMetadata *v14;
  Float64 v15;
  void *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  CMTime v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "capturedDepthData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PVARMetadata initWithARFrame:depthData:depthFreshness:]([PVARMetadata alloc], "initWithARFrame:depthData:depthFreshness:", v10, v13, 0);
  objc_msgSend(v10, "timestamp");
  CMTimeMakeWithSeconds(&v19, v15, 1000000000);
  v18 = *a4;
  objc_msgSend(a1, "frameSetWithARMetadata:depthData:depthFreshness:matte:dilatedDepth:timestamp:frameDuration:metadata:", v14, v13, 0, v11, v12, &v19, &v18, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (PVFrameSet *)v16;
}

- (PVFrameSet)initWithColorBuffer:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  PVFrameSet *v8;
  PVFrameSet *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PVFrameSet;
  v8 = -[PVFrameSet init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[PVFrameSet commonInitWithColorBuffer:depthData:metadata:matte:dilatedDepth:](v8, "commonInitWithColorBuffer:depthData:metadata:matte:dilatedDepth:", v6, 0, v7, 0, 0);

  return v9;
}

- (PVFrameSet)initWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  PVFrameSet *v11;
  PVFrameSet *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PVFrameSet;
  v11 = -[PVFrameSet init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[PVFrameSet commonInitWithColorBuffer:depthData:metadata:matte:dilatedDepth:](v11, "commonInitWithColorBuffer:depthData:metadata:matte:dilatedDepth:", v8, v9, v10, 0, 0);

  return v12;
}

- (PVFrameSet)initWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5 matte:(id)a6 dilatedDepth:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PVFrameSet *v17;
  PVFrameSet *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PVFrameSet;
  v17 = -[PVFrameSet init](&v20, sel_init);
  v18 = v17;
  if (v17)
    -[PVFrameSet commonInitWithColorBuffer:depthData:metadata:matte:dilatedDepth:](v17, "commonInitWithColorBuffer:depthData:metadata:matte:dilatedDepth:", v12, v13, v14, v15, v16);

  return v18;
}

- (void)commonInitWithColorBuffer:(id)a3 depthData:(id)a4 metadata:(id)a5 matte:(id)a6 dilatedDepth:(id)a7
{
  id v13;
  AVDepthData *v14;
  id v15;
  MTLTexture *v16;
  MTLTexture *v17;
  AVDepthData *depthData;
  AVDepthData *v19;
  PVImageBuffer *alphaMaskImageBuffer;
  MTLTexture *matte;
  MTLTexture *v22;
  MTLTexture *dilatedDepth;
  id *v24;
  id *v25;

  v13 = a3;
  v14 = (AVDepthData *)a4;
  v15 = a5;
  v16 = (MTLTexture *)a6;
  v17 = (MTLTexture *)a7;
  objc_storeStrong((id *)&self->_colorSampleBuffer, a3);
  depthData = self->_depthData;
  self->_depthData = v14;
  v19 = v14;

  alphaMaskImageBuffer = self->_alphaMaskImageBuffer;
  self->_alphaMaskImageBuffer = 0;

  matte = self->_matte;
  self->_matte = v16;
  v22 = v16;

  dilatedDepth = self->_dilatedDepth;
  self->_dilatedDepth = v17;

  v24 = (id *)operator new();
  *v24 = dispatch_queue_create("com.apple.PVFrameSet.metadataLock", 0);
  v25 = 0;
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_mdLock, v24);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v25, 0);
  -[PVFrameSet setMetadataDict:](self, "setMetadataDict:", v15);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  void *v5;
  void *v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v9;

  -[PVFrameSet colorSampleBuffer](self, "colorSampleBuffer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PVFrameSet colorSampleBuffer](self, "colorSampleBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "presentationTimeStamp");
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }

  }
  else
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v7 + 16);
  }

  return result;
}

- (PVImageBuffer)colorImageBuffer
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CVImageBufferRef ImageBuffer;

  -[PVFrameSet colorSampleBuffer](self, "colorSampleBuffer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[PVFrameSet colorSampleBuffer](self, "colorSampleBuffer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "sampleBufferRef"),
        v5,
        v4,
        v6))
  {
    -[PVFrameSet colorSampleBuffer](self, "colorSampleBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backingPVImageBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PVFrameSet colorSampleBuffer](self, "colorSampleBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "backingPVImageBuffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(v9, "sampleBufferRef"));

      +[PVImageBuffer imageWithCVPixelBuffer:](PVImageBuffer, "imageWithCVPixelBuffer:", ImageBuffer);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }
  return (PVImageBuffer *)v11;
}

- (id)metadataDict
{
  PVGCDLock *value;
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
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  value = self->_mdLock.__ptr_.__value_;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__PVFrameSet_metadataDict__block_invoke;
  v5[3] = &unk_1E64D5490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(*(dispatch_queue_t *)value, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__PVFrameSet_metadataDict__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setMetadataDict:(id)a3
{
  id v4;
  PVGCDLock *value;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  PVFrameSet *v10;

  v4 = a3;
  value = self->_mdLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PVFrameSet_setMetadataDict___block_invoke;
  block[3] = &unk_1E64D47E8;
  v9 = v4;
  v10 = self;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __30__PVFrameSet_setMetadataDict___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = objc_msgSend(v2, "mutableCopy");
  else
    v3 = objc_opt_new();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;

}

- (id)metadataObjectForKey:(id)a3
{
  id v4;
  PVGCDLock *value;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  value = self->_mdLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PVFrameSet_metadataObjectForKey___block_invoke;
  block[3] = &unk_1E64D8760;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v6 = *(NSObject **)value;
  v7 = v4;
  dispatch_sync(v6, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __35__PVFrameSet_metadataObjectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  PVGCDLock *value;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  PVFrameSet *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  value = self->_mdLock.__ptr_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PVFrameSet_setMetadataObject_forKey___block_invoke;
  block[3] = &unk_1E64D8788;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v9 = *(NSObject **)value;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, block);

}

uint64_t __39__PVFrameSet_setMetadataObject_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 16);
  if (v2)
    return objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PVFrameSet;
  -[PVFrameSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVFrameSet metadataDict](self, "metadataDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PVCMSampleBuffer)colorSampleBuffer
{
  return self->_colorSampleBuffer;
}

- (AVDepthData)depthData
{
  return self->_depthData;
}

- (PVImageBuffer)alphaMaskImageBuffer
{
  return (PVImageBuffer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAlphaMaskImageBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MTLTexture)matte
{
  return self->_matte;
}

- (MTLTexture)dilatedDepth
{
  return self->_dilatedDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dilatedDepth, 0);
  objc_storeStrong((id *)&self->_matte, 0);
  objc_storeStrong((id *)&self->_alphaMaskImageBuffer, 0);
  objc_storeStrong((id *)&self->_depthData, 0);
  objc_storeStrong((id *)&self->_colorSampleBuffer, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&self->_mdLock, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
