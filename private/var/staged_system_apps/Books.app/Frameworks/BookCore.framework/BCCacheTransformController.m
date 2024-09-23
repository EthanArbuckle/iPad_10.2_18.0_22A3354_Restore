@implementation BCCacheTransformController

- (BCCacheTransformController)initWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 transformer:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCCacheTransformController *v11;
  BCCacheTransformController *v12;
  uint64_t v13;
  NSMutableArray *imagesProcessing;
  uint64_t v15;
  BICWorkQueue *workQueue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BCCacheTransformController;
  v11 = -[BCCacheTransformController init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    v11->_accessLock._os_unfair_lock_opaque = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    imagesProcessing = v12->_imagesProcessing;
    v12->_imagesProcessing = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_transformer, a5);
    v15 = objc_claimAutoreleasedReturnValue(+[BICWorkQueue workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:](BICWorkQueue, "workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:", v8, v9, 1));
    workQueue = v12->_workQueue;
    v12->_workQueue = (BICWorkQueue *)v15;

    -[BICWorkQueue setIdentifier:](v12->_workQueue, "setIdentifier:", CFSTR("TransformController"));
  }

  return v12;
}

- (void)transformSource:(id)a3 to:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  BICDescribedImagePair *v11;
  BICDescribedImagePair *v12;
  _QWORD *v13;
  id v14;
  NSObject *v15;
  unsigned int v16;
  __CFString **v17;
  BICDescribedImagePair *v18;
  _QWORD *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  BICDescribedImagePair *v25;
  id v26;
  _QWORD v27[2];
  void (*v28)(uint64_t);
  void *v29;
  BCCacheTransformController *v30;
  BICDescribedImagePair *v31;
  _QWORD v32[2];
  void (*v33)(uint64_t);
  void *v34;
  BCCacheTransformController *v35;
  BICDescribedImagePair *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(BICDescribedImagePair);
  -[BICDescribedImagePair setSourceImage:](v11, "setSourceImage:", v8);
  -[BICDescribedImagePair setDestinationImage:](v11, "setDestinationImage:", v9);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v33 = sub_125FB8;
  v34 = &unk_28B7E0;
  v37 = &v38;
  v35 = self;
  v12 = v11;
  v36 = v12;
  v13 = v32;
  os_unfair_lock_lock(&self->_accessLock);
  v33((uint64_t)v13);
  os_unfair_lock_unlock(&self->_accessLock);

  if (*((_BYTE *)v39 + 24))
  {
    v14 = BCImageCacheLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v9;
      v44 = 2112;
      v45 = v10;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "BCCacheTransformController: Transform is already in progress for: %@ for request: %@", buf, 0x16u);
    }

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v16 = objc_msgSend(v9, "processingOptions");
    v17 = kBICCacheStatsCounterTransformSpine;
    if (!v16)
      v17 = kBICCacheStatsCounterTransformResize;
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", *v17);
    +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationTransformQueueStart[0], v10);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v28 = sub_126004;
    v29 = &unk_28B808;
    v30 = self;
    v18 = v12;
    v31 = v18;
    v19 = v27;
    os_unfair_lock_lock(&self->_accessLock);
    v28((uint64_t)v19);
    os_unfair_lock_unlock(&self->_accessLock);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheTransformController workQueue](self, "workQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_126044;
    v21[3] = &unk_291AD8;
    v22 = v10;
    objc_copyWeak(&v26, (id *)buf);
    v23 = v8;
    v24 = v9;
    v25 = v18;
    objc_msgSend(v20, "addWorkItemWithPriority:description:block:", v22, CFSTR("Transformer transform"), v21);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v38, 8);
}

- (void)_transformCompleteSource:(id)a3 to:(id)a4 forRequest:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = BICCacheStatsOperationTransformEnd[0];
  v10 = a3;
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", v9, v8);
  if (objc_msgSend(v12, "quality") == 101)
    +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationTransformedFromSmaller[0], v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheTransformController delegate](self, "delegate"));
  objc_msgSend(v11, "transformResultSrc:result:forRequest:", v10, v12, v8);

}

- (BCCacheTransformDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (BCCacheTransformDelegate *)a3;
}

- (BCCacheImageTransforming)transformer
{
  return self->_transformer;
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableArray)imagesProcessing
{
  return self->_imagesProcessing;
}

- (void)setImagesProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_imagesProcessing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesProcessing, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

@end
