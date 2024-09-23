@implementation PXGImageRequestQueue

uint64_t __40__PXGImageRequestQueue__discardIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "count");
  _PXGArrayRemoveRange();
  return objc_msgSend(*(id *)(a1 + 32), "setCount:", objc_msgSend(*(id *)(a1 + 32), "count") - a3);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  int64_t capacity;

  if (self->_count != a3)
  {
    self->_count = a3;
    capacity = self->_capacity;
    if (capacity < a3)
    {
      if (!capacity)
      {
        capacity = 32;
        self->_capacity = 32;
      }
      if (capacity < a3)
      {
        do
          capacity *= 2;
        while (capacity < a3);
        self->_capacity = capacity;
      }
      _PXGArrayResize();
    }
  }
}

- (void)performRequestsWithAllowedIDs:(id)a3
{
  id v4;
  void *v5;
  int64_t count;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  PXGImageRequest *requests;
  int v15;
  PXGImageRequest *v16;
  uint64_t var0;
  uint64_t var1;
  void *var2;
  CFTypeRef v20;
  CFTypeRef v21;
  void *v22;
  id v23;

  v4 = a3;
  v5 = v4;
  count = self->_count;
  if (count)
  {
    v23 = v4;
    if (!v4 || (v7 = objc_msgSend(v4, "count"), v5 = v23, v7))
    {
      -[PXGImageRequestQueue imageRequestPerformer](self, "imageRequestPerformer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v10 = v23;
      v11 = v9;
      if (count >= 1)
      {
        v12 = 0;
        for (i = 0; i != count; ++i)
        {
          requests = self->_requests;
          if (!v10 || (v15 = objc_msgSend(v10, "containsIndex:", requests[v12].var1), v10 = v23, v15))
          {
            v16 = &requests[v12];
            var0 = requests[v12].var0;
            var1 = v16->var1;
            var2 = v16->var2;
            if (var2)
            {
              v20 = CFRetain(var2);
              v21 = CFAutorelease(v20);
            }
            else
            {
              v21 = 0;
            }
            objc_msgSend(v8, "performRequestForSpriteIndex:textureRequestID:sharedState:", var0, var1, v21);
            v22 = v16->var2;
            if (v22)
            {

              v16->var2 = 0;
            }
            objc_msgSend(v11, "addIndex:", i);
            v10 = v23;
          }
          ++v12;
        }
      }
      -[PXGImageRequestQueue _discardIndexes:](self, "_discardIndexes:", v11);

      v5 = v23;
    }
  }

}

- (PXGImageRequestPerformer)imageRequestPerformer
{
  return (PXGImageRequestPerformer *)objc_loadWeakRetained((id *)&self->_imageRequestPerformer);
}

- (void)_discardIndexes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PXGImageRequestQueue__discardIndexes___block_invoke;
  v3[3] = &unk_1E5140880;
  v3[4] = self;
  objc_msgSend(a3, "enumerateRangesWithOptions:usingBlock:", 2, v3);
}

- (void)setImageRequestPerformer:(id)a3
{
  objc_storeWeak((id *)&self->_imageRequestPerformer, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[PXGImageRequestQueue _removeAllRequests](self, "_removeAllRequests");
  free(self->_requests);
  v3.receiver = self;
  v3.super_class = (Class)PXGImageRequestQueue;
  -[PXGImageRequestQueue dealloc](&v3, sel_dealloc);
}

- (void)enqueueRequestsWithSpriteIndexRange:(_PXGSpriteIndexRange)a3 textureRequestIDs:(_NSRange)a4 displayAssetFetchResult:(id)a5 observer:(id)a6 presentationStyles:(unint64_t)a7 targetSize:(CGSize)a8 screenScale:(double)a9 screenMaxHeadroom:(double)a10 adjustment:(id)a11 intent:(unint64_t)a12 useLowMemoryDecode:(BOOL)a13 applyCleanApertureCrop:(BOOL)a14 mediaProvider:(id)a15
{
  int location;
  double height;
  double width;
  _PXGSpriteIndexRange v21;
  unint64_t length;
  id v24;
  id v25;
  id v26;
  PXGImageRequestSharedState *v27;
  int64_t v28;
  uint64_t v29;
  void **p_var2;
  PXGImageRequestSharedState *v31;
  uint64_t v32;
  id v34;

  location = a4.location;
  height = a8.height;
  width = a8.width;
  v21 = a3;
  length = a3.length;
  v34 = a5;
  v24 = a6;
  v25 = a11;
  v26 = a15;
  LOBYTE(v32) = a14;
  v27 = -[PXGImageRequestSharedState initWithDisplayAssetFetchResult:observer:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:]([PXGImageRequestSharedState alloc], "initWithDisplayAssetFetchResult:observer:presentationStyles:targetSize:screenScale:screenMaxHeadroom:adjustment:intent:useLowMemoryDecode:applyCleanApertureCrop:mediaProvider:", v34, v24, a7, v25, a12, a13, width, height, a9, a10, v32, v26);
  v28 = -[PXGImageRequestQueue count](self, "count");
  -[PXGImageRequestQueue setCount:](self, "setCount:", -[PXGImageRequestQueue count](self, "count") + HIDWORD(*(unint64_t *)&v21));
  if (length)
  {
    if (length <= 1)
      v29 = 1;
    else
      v29 = length;
    p_var2 = &self->_requests[v28].var2;
    do
    {
      *((_DWORD *)p_var2 - 2) = v21.location;
      *((_DWORD *)p_var2 - 1) = location;
      *p_var2 = 0;
      v31 = v27;
      if (*p_var2 != v31)
      {

        *p_var2 = v31;
      }

      p_var2 += 2;
      ++location;
      ++v21.location;
      --v29;
    }
    while (v29);
  }

}

- (void)cancelTextureRequests:(id)a3
{
  id v4;
  void *v5;
  int64_t count;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  PXGImageRequest *v11;
  void *var2;
  void *v13;

  v4 = a3;
  v5 = v4;
  count = self->_count;
  if (count)
  {
    v13 = v4;
    v7 = objc_msgSend(v4, "count");
    v5 = v13;
    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      if (count >= 1)
      {
        v9 = 0;
        for (i = 0; i != count; ++i)
        {
          v11 = &self->_requests[v9];
          if (objc_msgSend(v13, "containsIndex:", v11->var1))
          {
            var2 = v11->var2;
            if (var2)
            {

              v11->var2 = 0;
            }
            objc_msgSend(v8, "addIndex:", i);
          }
          ++v9;
        }
      }
      -[PXGImageRequestQueue _discardIndexes:](self, "_discardIndexes:", v8);

      v5 = v13;
    }
  }

}

- (void)_removeAllRequests
{
  int64_t count;
  uint64_t v4;
  PXGImageRequest *requests;
  void *v6;

  count = self->_count;
  if (count >= 1)
  {
    v4 = 8;
    do
    {
      requests = self->_requests;
      v6 = *(void **)((char *)&requests->var0 + v4);
      if (v6)
      {

        *(_QWORD *)((char *)&requests->var0 + v4) = 0;
      }
      v4 += 16;
      --count;
    }
    while (count);
  }
  -[PXGImageRequestQueue setCount:](self, "setCount:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageRequestPerformer);
}

@end
