@implementation SKUILayoutCache

- (SKUILayoutCache)init
{
  SKUILayoutCache *v3;
  id v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  NSMutableArray *v7;
  NSMutableArray *layouts;
  NSMutableArray *v9;
  NSMutableArray *requests;
  objc_super v12;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILayoutCache init].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUILayoutCache;
  v3 = -[SKUILayoutCache init](&v12, sel_init);
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreKitUI.SKUILayoutCache.%p"), v3));
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    layouts = v3->_layouts;
    v3->_layouts = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v3->_requests;
    v3->_requests = v9;

  }
  return v3;
}

- (_NSRange)addLayoutRequests:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *batchedRequests;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v4 = a3;
  if (!self->_batchedRequests)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    batchedRequests = self->_batchedRequests;
    self->_batchedRequests = v5;

  }
  v7 = -[NSMutableArray count](self->_requests, "count");
  v8 = -[NSMutableArray count](self->_batchedRequests, "count") + v7;
  v9 = objc_msgSend(v4, "count");
  -[NSMutableArray addObjectsFromArray:](self->_batchedRequests, "addObjectsFromArray:", v4);

  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)commitLayoutRequests
{
  NSMutableArray *batchedRequests;
  NSMutableArray *v4;
  id v5;

  batchedRequests = self->_batchedRequests;
  if (batchedRequests)
  {
    v5 = (id)-[NSMutableArray copy](batchedRequests, "copy");
    v4 = self->_batchedRequests;
    self->_batchedRequests = 0;

    -[SKUILayoutCache populateCacheWithLayoutRequests:](self, "populateCacheWithLayoutRequests:", v5);
  }
}

- (id)layoutForIndex:(int64_t)a3
{
  return -[SKUILayoutCache layoutForIndex:forced:](self, "layoutForIndex:forced:", a3, 0);
}

- (id)layoutForIndex:(int64_t)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a4;
  if (-[NSMutableArray count](self->_layouts, "count") <= (unint64_t)a3)
  {
    if (v4
      && (v8 = a3 - -[NSMutableArray count](self->_layouts, "count"),
          v8 < -[NSMutableArray count](self->_batchedRequests, "count")))
    {
      -[NSMutableArray objectAtIndex:](self->_batchedRequests, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "layoutClass")), "initWithLayoutRequest:", v9);

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_layouts, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (_NSRange)populateCacheWithLayoutRequests:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *dispatchQueue;
  NSUInteger v10;
  NSUInteger v11;
  _QWORD block[7];
  _NSRange result;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_requests, "count");
  v6 = objc_msgSend(v4, "count");
  if (self->_batchedRequests)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-populateCacheWithLayoutRequests: before -commitLayoutRequests"));
  }
  else
  {
    v7 = -[NSMutableArray count](self->_layouts, "count");
    v8 = -[NSMutableArray count](self->_requests, "count");
    -[NSMutableArray addObjectsFromArray:](self->_requests, "addObjectsFromArray:", v4);
    if (v7 == v8)
    {
      -[SKUILayoutCache _populateCache](self, "_populateCache");
    }
    else
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__SKUILayoutCache_populateCacheWithLayoutRequests___block_invoke;
      block[3] = &unk_1E73A3818;
      block[4] = self;
      block[5] = v5;
      block[6] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }

  v10 = v5;
  v11 = v6;
  result.length = v11;
  result.location = v10;
  return result;
}

uint64_t __51__SKUILayoutCache_populateCacheWithLayoutRequests___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutRequestsInRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addLayoutBatch:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[NSMutableArray addObjectsFromArray:](self->_layouts, "addObjectsFromArray:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "layoutCacheDidFinishBatch:", self);

  }
}

- (void)_layoutRequestsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  id v14;

  length = a3.length;
  location = a3.location;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (location < location + length)
  {
    v7 = MEMORY[0x1E0C80D38];
    do
    {
      -[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", location);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "layoutClass")), "initWithLayoutRequest:", v8);
      objc_msgSend(v6, "addObject:", v9);
      if (objc_msgSend(v6, "count") == 250)
      {
        v10 = v6;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__SKUILayoutCache__layoutRequestsInRange___block_invoke;
        block[3] = &unk_1E739FD10;
        block[4] = self;
        v14 = v10;
        dispatch_async(v7, block);
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

      }
      ++location;
      --length;
    }
    while (length);
  }
  if (objc_msgSend(v6, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__SKUILayoutCache__layoutRequestsInRange___block_invoke_2;
    v11[3] = &unk_1E739FD10;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

uint64_t __42__SKUILayoutCache__layoutRequestsInRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLayoutBatch:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__SKUILayoutCache__layoutRequestsInRange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addLayoutBatch:", *(_QWORD *)(a1 + 40));
}

- (void)_populateCache
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *dispatchQueue;
  _QWORD block[7];

  v3 = -[NSMutableArray count](self->_layouts, "count");
  v4 = -[NSMutableArray count](self->_requests, "count");
  v5 = v4 - v3;
  if (v4 - v3 >= 1)
  {
    v6 = v4;
    if (v5 >= 250)
      v5 = 250;
    v7 = v5 + v3;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "layoutClass")), "initWithLayoutRequest:", v8);
      -[NSMutableArray addObject:](self->_layouts, "addObject:", v9);

      ++v3;
    }
    while (v3 < v7);
    v10 = -[NSMutableArray count](self->_layouts, "count");
    if (v10 < v6)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__SKUILayoutCache__populateCache__block_invoke;
      block[3] = &unk_1E73A3818;
      block[4] = self;
      block[5] = v10;
      block[6] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
}

uint64_t __33__SKUILayoutCache__populateCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutRequestsInRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 40));
}

- (SKUILayoutCacheDelegate)delegate
{
  return (SKUILayoutCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_batchedRequests, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILayoutCache init]";
}

@end
