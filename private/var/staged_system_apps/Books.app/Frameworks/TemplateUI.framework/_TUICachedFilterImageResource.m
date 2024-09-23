@implementation _TUICachedFilterImageResource

- (_TUICachedFilterImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8 filter:(id)a9
{
  double height;
  double width;
  id v18;
  _TUICachedFilterImageResource *v19;
  _TUICachedFilterImageResource *v20;
  objc_super v22;

  height = a6.height;
  width = a6.width;
  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)_TUICachedFilterImageResource;
  v19 = -[_TUICachedPipelineImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:](&v22, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:", a3, a4, a5, a8, width, height, a7);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_filter, a9);
    v20->_operationLock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

- (id)debugFunctionalDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugFunctionalDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCUImageFilter identifier](self->_filter, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@).filter(%@)"), v4, v5));

  return v6;
}

- (id)_filterOptions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
  v4 = objc_opt_respondsToSelector(v3, "filterOptions");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filterOptions"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_startFilterOperation:(id)a3
{
  BCUOperation *v4;
  os_unfair_lock_s *p_operationLock;
  BCUOperation *filterOperation;
  BCUOperation *v7;
  BCUOperation *v8;

  v4 = (BCUOperation *)a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  filterOperation = self->_filterOperation;
  self->_filterOperation = v4;
  v8 = v4;
  v7 = filterOperation;

  os_unfair_lock_unlock(p_operationLock);
  -[BCUOperation cancel](v7, "cancel");
  -[BCUOperation start](v8, "start");

}

- (void)_endFilterOperation:(id)a3
{
  BCUOperation *v4;

  v4 = (BCUOperation *)a3;
  os_unfair_lock_lock(&self->_operationLock);
  if (self->_filterOperation == v4)
  {
    self->_filterOperation = 0;

  }
  os_unfair_lock_unlock(&self->_operationLock);

}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6;
  BCUImageFilter *filter;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  id v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *, double, double, double, double);
  void *v23;
  _TUICachedFilterImageResource *v24;
  id v25;

  v6 = a4;
  filter = self->_filter;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "image"));
  v9 = objc_msgSend(v8, "CGImage");
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v11 = v10;
  v13 = v12;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedFilterImageResource _filterOptions](self, "_filterOptions"));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_9F580;
  v23 = &unk_240578;
  v24 = self;
  v25 = v6;
  v17 = v6;
  LODWORD(v18) = 1056964608;
  v19 = -[BCUImageFilter newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:](filter, "newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:", v9, v16, 0, 0, &v20, v11, v13, v15, v18);

  -[_TUICachedFilterImageResource _startFilterOperation:](self, "_startFilterOperation:", v19, v20, v21, v22, v23, v24);
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  void *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._cache);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
  v8 = objc_msgSend(v7, "newImageResourceWithSize:", width, height);
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCUImageFilter identifier](self->_filter, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedFilterImageResource _filterOptions](self, "_filterOptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageResource:naturalSize:contentsScale:withFilter:filterOptions:", v8, v11, v12, width, height, v10));

  return v13;
}

+ (id)sizedKeyForFilter:(id)a3 naturalSize:(CGSize)a4 contentsScale:(double)a5 imageResource:(id)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  _TUICachedImageFilterInfo *v12;
  void *v13;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "sizedKey"));
  v12 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", v10, width, height, a5);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cacheKeyWithFilterInfo:", v12));
  return v13;
}

+ (id)unsizedKeyForFilter:(id)a3 contentsScale:(double)a4 imageResource:(id)a5
{
  id v7;
  void *v8;
  _TUICachedImageFilterInfo *v9;
  void *v10;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "unsizedKey"));
  v9 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", v7, CGSizeZero.width, CGSizeZero.height, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cacheKeyWithFilterInfo:", v9));
  return v10;
}

- (id)sizedKey
{
  id v3;
  void *v4;
  _TUICachedImageFilterInfo *v5;
  BCUImageFilter *filter;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _TUICachedImageFilterInfo *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_TUICachedFilterImageResource;
  v3 = -[_TUICachedPipelineImageResource sizedKey](&v15, "sizedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = [_TUICachedImageFilterInfo alloc];
  filter = self->_filter;
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v8 = v7;
  v10 = v9;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v12 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v5, "initWithFilter:naturalSize:contentsScale:", filter, v8, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyWithFilterInfo:", v12));

  return v13;
}

- (id)unsizedKey
{
  id v3;
  void *v4;
  _TUICachedImageFilterInfo *v5;
  BCUImageFilter *filter;
  double v7;
  _TUICachedImageFilterInfo *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_TUICachedFilterImageResource;
  v3 = -[_TUICachedPipelineImageResource unsizedKey](&v11, "unsizedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = [_TUICachedImageFilterInfo alloc];
  filter = self->_filter;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v8 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v5, "initWithFilter:naturalSize:contentsScale:", filter, CGSizeZero.width, CGSizeZero.height, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyWithFilterInfo:", v8));

  return v9;
}

- (BCUOperation)filterOperation
{
  return self->_filterOperation;
}

- (BCUImageFilter)filter
{
  return self->_filter;
}

- (NSDictionary)filterOptions
{
  return self->_filterOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOptions, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_filterOperation, 0);
}

@end
