@implementation PXGViewTextureConverter

- (id)createPayloadTextureFromPayload:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2C38), "initWithPayload:presentationType:", v4, -[PXGViewTextureConverter presentationType](self, "presentationType"));
  else
    v5 = 0;

  return v5;
}

- (unsigned)presentationType
{
  return 1;
}

- (PXGImageTexture)transparentTexture
{
  return 0;
}

- (unint64_t)supportedContentTypes
{
  return 5;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (id)createTextureFromCGImage:(CGImage *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
  int v6;
  int v7;
  PXGViewImageTexture *v9;
  uint64_t v10;
  double v11;

  v7 = v6;
  v9 = [PXGViewImageTexture alloc];
  v10 = PXGSpriteTextureInfoOrientationToCGOrientation();
  LODWORD(v11) = v7;
  return -[PXGViewImageTexture initWithImage:orientation:alpha:](v9, "initWithImage:orientation:alpha:", a3, v10, v11);
}

- (id)createTextureFromCVPixelBuffer:(__CVBuffer *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewTextureConverter.m"), 28, CFSTR("PXGViewTextureConverter doesn't support CVPixelBufferRef."));

  abort();
}

- (id)applyAdjustment:(id)a3 toTexture:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewTextureConverter.m"), 33, CFSTR("PXGViewTextureConverter doesn't support adjustments."));

  abort();
}

- (id)createTextureAtlasManagerForImageDataSpec:(id *)a3 mipmapped:(BOOL)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewTextureConverter.m"), 54, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)createAtlasForTextureAtlasManager:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewTextureConverter.m"), 58, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

@end
