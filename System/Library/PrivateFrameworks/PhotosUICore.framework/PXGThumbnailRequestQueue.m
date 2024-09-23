@implementation PXGThumbnailRequestQueue

uint64_t __40__PXGThumbnailRequestQueue_sortRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a3 + 16));
}

- (void)enqueueRequestsWithItemRange:(_NSRange)a3 textureRequestIDs:(_NSRange)a4 displayAssetFetchResult:(id)a5 targetSize:(CGSize)a6 applyCleanApertureCrop:(BOOL)a7 mediaProvider:(id)a8
{
  _BOOL4 v8;
  double height;
  double width;
  unsigned int location;
  NSUInteger length;
  NSUInteger v13;
  id v15;
  int64_t v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  PXGThumbnailRequest *v19;
  float v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v8 = a7;
  height = a6.height;
  width = a6.width;
  location = a4.location;
  length = a3.length;
  v13 = a3.location;
  v25 = a5;
  v15 = a8;
  v16 = -[PXGThumbnailRequestQueue count](self, "count");
  -[PXGThumbnailRequestQueue setCount:](self, "setCount:", -[PXGThumbnailRequestQueue count](self, "count") + length);
  if (length)
  {
    v17 = llround(width);
    v18 = llround(height);
    v19 = &self->_requests[v16];
    do
    {
      v20 = 0.0;
      if (v8)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "playbackStyle") == 3)
          v20 = 0.9;
        else
          v20 = 1.0;

      }
      objc_msgSend(v25, "thumbnailAssetAtIndex:", v13);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v15;
      v24 = objc_msgSend(v22, "thumbnailIndex");
      v19->var0 = v22;
      v19->var1 = v23;
      v19->var2 = v24;
      v19->var3 = location;
      v19->var4 = v17;
      v19->var5 = v18;
      v19->var6 = v20;

      ++location;
      ++v13;
      ++v19;
      --length;
    }
    while (length);
  }

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

- (void)sortRequests
{
  qsort_b(self->_requests, self->_count, 0x28uLL, &__block_literal_global_134685);
}

- (PXGThumbnailRequest)requests
{
  return self->_requests;
}

- (void)removeAllRequests
{
  uint64_t v3;
  uint64_t v4;
  PXGThumbnailRequest *requests;

  v3 = -[PXGThumbnailRequestQueue count](self, "count");
  if (v3 >= 1)
  {
    v4 = v3;
    requests = self->_requests;
    do
    {
      CFRelease(requests->var0);
      requests->var0 = 0;
      CFRelease(requests->var1);
      requests->var1 = 0;
      ++requests;
      --v4;
    }
    while (v4);
  }
  -[PXGThumbnailRequestQueue setCount:](self, "setCount:", 0);
}

- (int64_t)count
{
  return self->_count;
}

- (PXGThumbnailRequestQueue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGThumbnailRequestQueue;
  return -[PXGThumbnailRequestQueue init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  -[PXGThumbnailRequestQueue removeAllRequests](self, "removeAllRequests");
  free(self->_requests);
  v3.receiver = self;
  v3.super_class = (Class)PXGThumbnailRequestQueue;
  -[PXGThumbnailRequestQueue dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  int64_t count;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; count:%ld requests:["), v5, self, self->_count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_count >= 1)
  {
    v7 = 0;
    v8 = 16;
    do
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("%lu"), *(void **)((char *)&self->_requests->var0 + v8));
      ++v7;
      count = self->_count;
      if (v7 < count)
      {
        objc_msgSend(v6, "appendString:", CFSTR(", "));
        count = self->_count;
      }
      v8 += 40;
    }
    while (v7 < count);
  }
  objc_msgSend(v6, "appendString:", CFSTR("]>"));
  return v6;
}

@end
