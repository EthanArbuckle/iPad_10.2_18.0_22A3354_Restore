@implementation PISliderNetBaseJob

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NURenderJob request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NUPurgeableStorage *v13;
  NUPurgeableStorage *storage;
  uint64_t v15;
  void *v16;
  NUPurgeableStorage *v17;
  uint64_t v18;
  uint64_t v19;
  CIRenderTask *v20;
  id v21;
  CIRenderTask *renderTask;
  CIRenderTask *v23;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[4];

  -[NURenderJob renderNode](self, "renderNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "surfaceStoragePool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[NURenderJob imageSize](self, "imageSize");
  v13 = (NUPurgeableStorage *)objc_msgSend(v10, "newStorageWithSize:format:", v11, v12, v7);
  storage = self->_storage;
  self->_storage = v13;

  v28[0] = 0;
  v28[1] = 0;
  v28[2] = -[NURenderJob imageSize](self, "imageSize");
  v28[3] = v15;
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_storage;
  v18 = -[NURenderJob imageSize](self, "imageSize");
  v27 = 0;
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v6, v17, v8, v16, v18, v19, &v27);
  v20 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  v21 = v27;
  renderTask = self->_renderTask;
  self->_renderTask = v20;

  v23 = self->_renderTask;
  if (!v23)
  {
    v24 = (void *)MEMORY[0x1E0D520A0];
    -[NURenderJob request](self, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create CIRenderTask for thumbnail render"), v25, *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v23 != 0;
}

- (BOOL)complete:(id *)a3
{
  CIRenderTask *renderTask;
  void *v6;
  id v7;
  CIRenderTask *v8;
  void *v9;
  NUPurgeableStorage *storage;
  id v11;
  BOOL v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  PISliderNetBaseJob *v17;
  uint64_t *v18;
  id *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  id v24;

  renderTask = self->_renderTask;
  v24 = 0;
  -[CIRenderTask nu_waitUntilCompletedAndReturnError:](renderTask, "nu_waitUntilCompletedAndReturnError:", &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;
  if (v6)
  {
    v8 = self->_renderTask;
    self->_renderTask = 0;

    -[NURenderJob request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    storage = self->_storage;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __31__PISliderNetBaseJob_complete___block_invoke;
    v15[3] = &unk_1E5016B60;
    v11 = v9;
    v16 = v11;
    v17 = self;
    v18 = &v20;
    v19 = a3;
    -[NUPurgeableStorage useAsCVPixelBufferWithBlock:](storage, "useAsCVPixelBufferWithBlock:", v15);
    v12 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D520A0];
    -[NURenderJob request](self, "request");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render thumbnail"), v11, v7);
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
}

uint64_t __31__PISliderNetBaseJob_complete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t result;

  v3 = objc_msgSend(a2, "CVPixelBuffer");
  objc_msgSend(*(id *)(a1 + 32), "colorSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGColorSpace");
  CVImageBufferSetColorSpace();

  result = objc_msgSend(*(id *)(a1 + 40), "networkProcessingWithResultingPixelBuffer:error:", v3, *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
