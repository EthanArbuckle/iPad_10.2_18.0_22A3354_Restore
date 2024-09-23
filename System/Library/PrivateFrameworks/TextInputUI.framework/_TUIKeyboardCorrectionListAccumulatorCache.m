@implementation _TUIKeyboardCorrectionListAccumulatorCache

- (_TUIKeyboardCorrectionListAccumulatorCache)initWithSize:(unint64_t)a3
{
  _TUIKeyboardCorrectionListAccumulatorCache *v4;
  uint64_t v5;
  NSMutableDictionary *requestCache;
  uint64_t v7;
  NSMutableArray *requestQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TUIKeyboardCorrectionListAccumulatorCache;
  v4 = -[_TUIKeyboardCorrectionListAccumulatorCache init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    requestCache = v4->_requestCache;
    v4->_requestCache = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    requestQueue = v4->_requestQueue;
    v4->_requestQueue = (NSMutableArray *)v7;

    v4->_maxSize = a3;
  }
  return v4;
}

- (id)accumulatorForToken:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[_TUIKeyboardCorrectionListAccumulatorCache requestCache](self, "requestCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(":%d"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)addToCache:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(":%d"), v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[_TUIKeyboardCorrectionListAccumulatorCache requestCache](self, "requestCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v18);

  -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v18);

  -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    goto LABEL_4;
  -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = -[_TUIKeyboardCorrectionListAccumulatorCache maxSize](self, "maxSize");

  if (v13 > v14)
  {
    -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", 0);

    -[_TUIKeyboardCorrectionListAccumulatorCache requestCache](self, "requestCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v11);

LABEL_4:
  }

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)emptyCache
{
  void *v3;
  id v4;

  -[_TUIKeyboardCorrectionListAccumulatorCache requestQueue](self, "requestQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[_TUIKeyboardCorrectionListAccumulatorCache requestCache](self, "requestCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (NSMutableDictionary)requestCache
{
  return self->_requestCache;
}

- (void)setRequestCache:(id)a3
{
  objc_storeStrong((id *)&self->_requestCache, a3);
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_maxSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_requestCache, 0);
}

@end
