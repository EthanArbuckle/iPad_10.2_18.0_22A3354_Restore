@implementation PXGTextureProvider

- (void)setViewEnvironment:(id)a3
{
  PXGViewEnvironment *v4;
  PXGViewEnvironment *v5;
  PXGViewEnvironment *v6;
  BOOL v7;
  PXGViewEnvironment *viewEnvironment;
  PXGViewEnvironment *v9;
  PXGViewEnvironment *v10;
  PXGViewEnvironment *v11;

  v11 = (PXGViewEnvironment *)a3;
  v4 = self->_viewEnvironment;
  v5 = v11;
  if (v4 == v11)
    goto LABEL_4;
  v6 = v4;
  v7 = -[PXGViewEnvironment isEqual:](v4, "isEqual:", v11);

  if (!v7)
  {
    viewEnvironment = self->_viewEnvironment;
    v9 = v11;
    v10 = self->_viewEnvironment;
    self->_viewEnvironment = v9;
    v5 = viewEnvironment;

    -[PXGTextureProvider viewEnvironmentDidChange:](self, "viewEnvironmentDidChange:", v5);
LABEL_4:

  }
}

- (void)setRequestIDsInTargetRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setInteractionState:(id *)a3
{
  $BA7BDB6EEB5AADB2B0666EA7A1098C2A *p_interactionState;
  __int128 v6;
  CGSize size;
  CGSize v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];

  p_interactionState = &self->_interactionState;
  if (self->_interactionState.scrollRegime != a3->var0
    || self->_interactionState.isAnimatingScroll != a3->var1
    || self->_interactionState.isScrubbing != a3->var2
    || self->_interactionState.isAnimatingContent != a3->var3
    || self->_interactionState.contentChangeTrend != a3->var4
    || self->_interactionState.isViewBoundsChanging != a3->var5
    || self->_interactionState.isInitialLoad != a3->var6
    || self->_interactionState.isVisible != a3->var7
    || !CGRectEqualToRect(self->_interactionState.targetRect, a3->var8))
  {
    v6 = *(_OWORD *)&p_interactionState->contentChangeTrend;
    v11[0] = *(_OWORD *)&p_interactionState->scrollRegime;
    v11[1] = v6;
    size = p_interactionState->targetRect.size;
    v11[2] = p_interactionState->targetRect.origin;
    v11[3] = size;
    v8 = a3->var8.size;
    v10 = *(_OWORD *)&a3->var0;
    v9 = *(_OWORD *)&a3->var4;
    p_interactionState->targetRect.origin = a3->var8.origin;
    p_interactionState->targetRect.size = v8;
    *(_OWORD *)&p_interactionState->scrollRegime = v10;
    *(_OWORD *)&p_interactionState->contentChangeTrend = v9;
    -[PXGTextureProvider interactionStateDidChange:](self, "interactionStateDidChange:", v11);
  }
}

- (void)performDeferredCancellations
{
  id v3;

  if (-[NSMutableIndexSet count](self->_requestIDsPendingCancellation, "count"))
  {
    v3 = (id)-[NSMutableIndexSet copy](self->_requestIDsPendingCancellation, "copy");
    -[NSMutableIndexSet removeAllIndexes](self->_requestIDsPendingCancellation, "removeAllIndexes");
    -[PXGTextureProvider cancelTextureRequests:](self, "cancelTextureRequests:", v3);

  }
}

- (void)cancelTextureRequests:(id)a3
{
  os_unfair_lock_s *p_lookupLock;
  id v5;

  p_lookupLock = &self->_lookupLock;
  v5 = a3;
  os_unfair_lock_lock(p_lookupLock);
  -[NSMutableIndexSet removeIndexes:](self->_lookupLock_activeRequests, "removeIndexes:", v5);

  os_unfair_lock_unlock(p_lookupLock);
}

- (void)provideNothingForRequestID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PXGTextureProvider delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textureProvider:didProvideNothingForRequestID:", self, v3);

}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (PXGTextureProviderDelegate)delegate
{
  return (PXGTextureProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  NSUInteger length;
  signed int v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  length = a3.length;
  do
    v9 = __ldaxr((unsigned int *)&PXMakeNextTextureRequestIDRange_lastRequestID);
  while (__stlxr(v9 + a3.length, (unsigned int *)&PXMakeNextTextureRequestIDRange_lastRequestID));
  v10 = v9;
  os_unfair_lock_lock(&self->_lookupLock);
  -[NSMutableIndexSet addIndexesInRange:](self->_lookupLock_activeRequests, "addIndexesInRange:", v10, length);
  os_unfair_lock_unlock(&self->_lookupLock);
  v11 = v10;
  v12 = length;
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)cancelTextureRequestDeferred:(int)a3
{
  -[NSMutableIndexSet addIndex:](self->_requestIDsPendingCancellation, "addIndex:", a3);
}

- (BOOL)isRequestActive:(int)a3
{
  os_unfair_lock_s *p_lookupLock;

  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  LOBYTE(a3) = -[NSMutableIndexSet containsIndex:](self->_lookupLock_activeRequests, "containsIndex:", a3);
  os_unfair_lock_unlock(p_lookupLock);
  return a3;
}

- (void)providePayload:(id)a3 forRequestID:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[PXGTextureProvider delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textureProvider:didProvidePayload:forRequestID:", self, v6, v4);

}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  __int128 v3;
  CGSize v4;

  v3 = *(_OWORD *)&self[2].var8.size.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var8.origin.y;
  *(_OWORD *)&retstr->var4 = v3;
  v4 = *(CGSize *)&self[3].var5;
  retstr->var8.origin = *(CGPoint *)&self[3].var1;
  retstr->var8.size = v4;
  return self;
}

- (NSIndexSet)requestIDsInTargetRect
{
  return self->_requestIDsInTargetRect;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)preferMipmaps
{
  return self->_preferMipmaps;
}

- (BOOL)canDeliverThumbnailData
{
  return self->_canDeliverThumbnailData;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (int64_t)requestQueue_indexForImageDataSpec:(id *)a3
{
  __CFString *var1;
  int var2;
  int var3;
  int64_t imageDataSpecsCount;
  int64_t result;
  unsigned __int16 *i;
  BOOL v14;
  BOOL v15;
  __int128 v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  if (self->_lastImageDataSpec.pixelFormat == a3->var0
    && self->_lastImageDataSpec.colorSpaceName == var1
    && self->_lastImageDataSpec.width == var2
    && self->_lastImageDataSpec.height == var3)
  {
    return self->_lastImageDataSpecIndex;
  }
  imageDataSpecsCount = self->_imageDataSpecsCount;
  if (imageDataSpecsCount < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = 0;
  for (i = &self->_imageDataSpecs->var2; ; i += 10)
  {
    v14 = *((_QWORD *)i - 2) == a3->var0 && *((_QWORD *)i - 1) == (_QWORD)var1;
    v15 = v14 && *i == var2;
    if (v15 && i[1] == var3)
      break;
    if (imageDataSpecsCount == ++result)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v17 = *(_OWORD *)&a3->var0;
  *(_DWORD *)&self->_lastImageDataSpec.width = *(_DWORD *)&a3->var2;
  *(_OWORD *)&self->_lastImageDataSpec.pixelFormat = v17;
  self->_lastImageDataSpecIndex = result;
  return result;
}

- (void)provideImageData:(id)a3 withSpecAtIndex:(int64_t)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7 forRequestID:(int)a8
{
  uint64_t v8;
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  void *v19;
  void *v20;
  id v21;

  v8 = *(_QWORD *)&a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v14 = a5.height;
  v15 = a5.width;
  v21 = a3;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTextureProvider.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageData != nil"));

  }
  -[PXGTextureProvider delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textureProvider:didProvideImageData:withSpecAtIndex:size:bytesPerRow:contentsRect:forRequestID:", self, v21, a4, a6, v8, v15, v14, x, y, width, height);

}

- (id)textureAtlasManagerAtSpecIndex:(int64_t)a3
{
  return self->_textureAtlasManagers[a3];
}

- (int64_t)registerImageDataSpec:(id *)a3
{
  NSObject *v5;
  uint64_t imageDataSpecsCount;
  int64_t v7;
  unsigned __int16 *p_var2;
  BOOL v9;
  BOOL v10;
  int64_t imageDataSpecsCapacity;
  char *v13;
  __int128 v14;

  -[PXGTextureProvider layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  imageDataSpecsCount = self->_imageDataSpecsCount;
  if (imageDataSpecsCount < 1)
  {
LABEL_14:
    self->_imageDataSpecsCount = imageDataSpecsCount + 1;
    imageDataSpecsCapacity = self->_imageDataSpecsCapacity;
    if (imageDataSpecsCount >= imageDataSpecsCapacity)
    {
      if (!imageDataSpecsCapacity)
      {
        imageDataSpecsCapacity = 10;
        self->_imageDataSpecsCapacity = 10;
      }
      if (imageDataSpecsCapacity <= imageDataSpecsCount)
      {
        do
          imageDataSpecsCapacity *= 2;
        while (imageDataSpecsCapacity <= imageDataSpecsCount);
        self->_imageDataSpecsCapacity = imageDataSpecsCapacity;
      }
      _PXGArrayResize();
      _PXGArrayResize();
    }
    v13 = (char *)self->_imageDataSpecs + 20 * imageDataSpecsCount;
    v14 = *(_OWORD *)&a3->var0;
    *((_DWORD *)v13 + 4) = *(_DWORD *)&a3->var2;
    *(_OWORD *)v13 = v14;
    self->_textureAtlasManagers[imageDataSpecsCount] = 0;
  }
  else
  {
    v7 = 0;
    p_var2 = &self->_imageDataSpecs->var2;
    while (1)
    {
      v9 = *((_QWORD *)p_var2 - 2) == a3->var0 && (__CFString *)*((_QWORD *)p_var2 - 1) == a3->var1;
      v10 = v9 && *p_var2 == a3->var2;
      if (v10 && p_var2[1] == a3->var3)
        return v7;
      p_var2 += 10;
      if (imageDataSpecsCount == ++v7)
        goto LABEL_14;
    }
  }
  return imageDataSpecsCount;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)setTextureAtlasManager:(id)a3 atSpecIndex:(int64_t)a4
{
  self->_textureAtlasManagers[a4] = a3;
}

- ($1A6826BF57289069BF3D0425E726B057)imageDataSpecAtIndex:(SEL)a3
{
  *retstr = *($1A6826BF57289069BF3D0425E726B057 *)(self[1].var0 + 20 * a4);
  return self;
}

- (void)setLayoutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_layoutQueue, a3);
}

- (void)setPreferredColorSpaceName:(unint64_t)a3
{
  self->_preferredColorSpaceName = a3;
}

- (void)setPreferMipmaps:(BOOL)a3
{
  self->_preferMipmaps = a3;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
  {
    self->_lowMemoryMode = a3;
    -[PXGTextureProvider lowMemoryModeDidChange](self, "lowMemoryModeDidChange");
  }
}

- (void)setCanDeliverThumbnailData:(BOOL)a3
{
  self->_canDeliverThumbnailData = a3;
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (void)setPreferBGRA:(BOOL)a3
{
  self->_preferBGRA = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)prepareImageDataSpecs
{
  -[PXGTextureProvider registerImageDataSpecs:](self, "registerImageDataSpecs:", self);
}

- (PXGTextureProvider)init
{
  PXGTextureProvider *v2;
  PXGTextureProvider *v3;
  uint64_t v4;
  NSMutableIndexSet *lookupLock_activeRequests;
  uint64_t v6;
  NSMutableIndexSet *requestIDsPendingCancellation;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGTextureProvider;
  v2 = -[PXGTextureProvider init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lookupLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = objc_claimAutoreleasedReturnValue();
    lookupLock_activeRequests = v3->_lookupLock_activeRequests;
    v3->_lookupLock_activeRequests = (NSMutableIndexSet *)v4;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v6 = objc_claimAutoreleasedReturnValue();
    requestIDsPendingCancellation = v3->_requestIDsPendingCancellation;
    v3->_requestIDsPendingCancellation = (NSMutableIndexSet *)v6;

    v3->_canDeliverThumbnailData = 1;
    v3->_preferredColorSpaceName = 12;
  }
  return v3;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 forRequestID:(int)a5
{
  __int128 v5;
  _OWORD v6[2];

  v5 = *(_OWORD *)(*(_QWORD *)&a4.var0 + 16);
  v6[0] = *(_OWORD *)*(_QWORD *)&a4.var0;
  v6[1] = v5;
  -[PXGTextureProvider provideCGImage:options:isDegraded:forRequestID:](self, "provideCGImage:options:isDegraded:forRequestID:", a3, v6, 0, *(_QWORD *)&a4.var2);
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 isDegraded:(BOOL)a5 forRequestID:(int)a6
{
  __int128 v6;
  _OWORD v7[2];

  v6 = *(_OWORD *)(*(_QWORD *)&a4.var0 + 16);
  v7[0] = *(_OWORD *)*(_QWORD *)&a4.var0;
  v7[1] = v6;
  -[PXGTextureProvider provideCGImage:options:adjustment:isDegraded:forRequestID:](self, "provideCGImage:options:adjustment:isDegraded:forRequestID:", a3, v7, 0, 0, a5);
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 forRequestID:(int)a7
{
  _BOOL8 v7;
  _OWORD *v9;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  void *v17;
  _OWORD v18[2];

  v7 = a6;
  v9 = *(_OWORD **)&a4.var0;
  v13 = *(id *)&a4.var2;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTextureProvider.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageRef != nil"));

  }
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[PXGTextureProvider delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9[1];
  v18[0] = *v9;
  v18[1] = v16;
  objc_msgSend(v15, "textureProvider:didProvideCGImage:options:adjustment:isDegraded:forRequestID:", self, a3, v18, v13, a5, v7);

}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (BOOL)preferBGRA
{
  return self->_preferBGRA;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_imageDataSpecs);
  free(self->_textureAtlasManagers);
  v3.receiver = self;
  v3.super_class = (Class)PXGTextureProvider;
  -[PXGTextureProvider dealloc](&v3, sel_dealloc);
}

- (void)provideCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 forRequestID:(int)a6
{
  __int128 v6;
  _OWORD v7[2];

  v6 = *(_OWORD *)(*(_QWORD *)&a4.var0 + 16);
  v7[0] = *(_OWORD *)*(_QWORD *)&a4.var0;
  v7[1] = v6;
  -[PXGTextureProvider provideCGImage:options:adjustment:isDegraded:forRequestID:](self, "provideCGImage:options:adjustment:isDegraded:forRequestID:", a3, v7, *(_QWORD *)&a4.var2, 0, a5);
}

- (void)provideCGImage:(CGImage *)a3 forRequestID:(int)a4
{
  __int128 v4;
  _OWORD v5[2];

  v4 = *((_OWORD *)off_1E50B83F8 + 1);
  v5[0] = *(_OWORD *)off_1E50B83F8;
  v5[1] = v4;
  -[PXGTextureProvider provideCGImage:options:forRequestID:](self, "provideCGImage:options:forRequestID:", a3, v5, *(_QWORD *)&a4);
}

- (void)providePixelBuffer:(__CVBuffer *)a3 options:(id)a4 adjustment:(id)a5 forRequestID:(int)a6
{
  _OWORD *v7;
  id v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  void *v15;
  _OWORD v16[2];

  v7 = *(_OWORD **)&a4.var0;
  v11 = *(id *)&a4.var2;
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTextureProvider.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pixelBufferRef != nil"));

  }
  -[PXGTextureProvider delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7[1];
  v16[0] = *v7;
  v16[1] = v14;
  objc_msgSend(v13, "textureProvider:didProvidePixelBuffer:options:adjustment:forRequestID:", self, a3, v16, v11, a5);

}

- (void)providePixelBuffer:(__CVBuffer *)a3 options:(id)a4 forRequestID:(int)a5
{
  __int128 v5;
  _OWORD v6[2];

  v5 = *(_OWORD *)(*(_QWORD *)&a4.var0 + 16);
  v6[0] = *(_OWORD *)*(_QWORD *)&a4.var0;
  v6[1] = v5;
  -[PXGTextureProvider providePixelBuffer:options:adjustment:forRequestID:](self, "providePixelBuffer:options:adjustment:forRequestID:", a3, v6, 0, *(_QWORD *)&a4.var2);
}

- (void)provideFailureWithError:(id)a3 forRequestID:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[PXGTextureProvider delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textureProvider:didProvideFailureWithError:forRequestID:", self, v6, v4);

}

- (void)setNeedsRegisterToDisplayLinkUpdates
{
  NSObject *v3;
  id v4;

  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXGTextureProvider delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textureProviderNeedsToRegisterToDisplayLinkUpdates:", self);

}

- (void)setNeedsUnregisterFromDisplayLinkUpdates
{
  NSObject *v3;
  id v4;

  -[PXGTextureProvider requestQueue](self, "requestQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXGTextureProvider delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textureProviderNeedsToUnregisterFromDisplayLinkUpdates:", self);

}

- (id)requestRenderSnapshot:(id *)a3
{
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[2];
  CGFloat height;

  -[PXGTextureProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var1.origin.y;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v6;
  height = a3->var1.size.height;
  objc_msgSend(v5, "textureProvider:requestRenderSnapshot:", self, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)clearTextureAtlasManagerCache
{
  int64_t imageDataSpecsCapacity;
  uint64_t i;

  imageDataSpecsCapacity = self->_imageDataSpecsCapacity;
  if (imageDataSpecsCapacity >= 1)
  {
    for (i = 0; i != imageDataSpecsCapacity; ++i)
      self->_textureAtlasManagers[i] = 0;
  }
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (unint64_t)preferredColorSpaceName
{
  return self->_preferredColorSpaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_requestIDsInTargetRect, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_requestIDsPendingCancellation, 0);
  objc_storeStrong((id *)&self->_lookupLock_activeRequests, 0);
}

@end
