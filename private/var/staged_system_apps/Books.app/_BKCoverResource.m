@implementation _BKCoverResource

- (_BKCoverResource)initWithQueue:(id)a3 notifyQueue:(id)a4 assetID:(id)a5 resourceOptions:(id)a6 naturalSize:(CGSize)a7 contentsScale:(double)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  id v18;
  id v19;
  _BKCoverResource *v20;
  _BKCoverResource *v21;
  NSString *v22;
  NSString *assetID;
  uint64_t v24;
  NSHashTable *observers;
  __int128 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSNumber *intrinsicAspectRatio;
  NSNumber *v31;
  double v32;
  double v33;
  double v34;
  char v35;
  objc_super v37;

  height = a7.height;
  width = a7.width;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v37.receiver = self;
  v37.super_class = (Class)_BKCoverResource;
  v20 = -[_BKCoverResource init](&v37, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_queue, a3);
    objc_storeStrong((id *)&v21->_notifyQueue, a4);
    v22 = (NSString *)objc_msgSend(v18, "copy");
    assetID = v21->_assetID;
    v21->_assetID = v22;

    objc_storeStrong((id *)&v21->_resourceOptions, a6);
    v21->_naturalSize.width = width;
    v21->_naturalSize.height = height;
    v21->_contentsScale = a8;
    v24 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v21->_observers;
    v21->_observers = (NSHashTable *)v24;

    v21->_interestCount = 0;
    v26 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v21->_imageContextInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v21->_imageContextInsets.bottom = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "metadataForIdentifier:", v18));

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "intrinsicAspectRatio"));
    intrinsicAspectRatio = v21->_intrinsicAspectRatio;
    v21->_intrinsicAspectRatio = (NSNumber *)v29;

    v31 = v21->_intrinsicAspectRatio;
    v32 = 156.0;
    if (v31 && (-[NSNumber doubleValue](v31, "doubleValue"), v33 > 0.0))
    {
      -[NSNumber doubleValue](v21->_intrinsicAspectRatio, "doubleValue");
      v32 = v34 * 100.0;
      v35 = 1;
    }
    else
    {
      v35 = 0;
    }
    v21->_intrinsicSize.width = 100.0;
    v21->_intrinsicSize.height = v32;
    v21->_hasIntrinsic = v35;

  }
  return v21;
}

- (id)debugFunctionalDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("assetid:%@"), self->_assetID);
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  return -[_BKCoverResource initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:]([_BKCoverResource alloc], "initWithQueue:notifyQueue:assetID:resourceOptions:naturalSize:contentsScale:", self->_queue, self->_notifyQueue, self->_assetID, self->_resourceOptions, a3.width, a3.height, self->_contentsScale);
}

- (TUIImageResourceCacheKey)sizedKey
{
  double contentsScale;
  CGFloat v3;
  double v4;
  void *v5;
  void *v6;

  contentsScale = self->_contentsScale;
  v3 = self->_naturalSize.width * contentsScale;
  v4 = contentsScale * self->_naturalSize.height;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKCoverResource unsizedKey](self, "unsizedKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheKeyWithSize:", v3, v4));

  return (TUIImageResourceCacheKey *)v6;
}

- (TUIImageResourceCacheKey)unsizedKey
{
  return (TUIImageResourceCacheKey *)objc_msgSend(objc_alloc((Class)TUIImageResourceCacheKey), "initWithID:", self->_assetID);
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001189E8;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)_BKCoverResource;
  -[_BKCoverResource dealloc](&v4, "dealloc");
}

- (NSURL)url
{
  return 0;
}

- (TUIResource)resource
{
  return 0;
}

- (BOOL)isImageLoaded
{
  return 0;
}

- (BOOL)isImageLoading
{
  return 0;
}

- (id)imageContentWithOptions:(unint64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10004E408;
  v11 = sub_10004E278;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118AD8;
  block[3] = &unk_1008EB458;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)loadIntrinsicSize
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118C50;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)loadImage
{
  NSObject *queue;
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
  v9 = sub_10004E408;
  v10 = sub_10004E278;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100118D18;
  v5[3] = &unk_1008E76D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = sub_100118E7C;
    block[3] = &unk_1008E7338;
    block[4] = self;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = sub_100118F08;
    block[3] = &unk_1008E7338;
    block[4] = self;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)addInterest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118F6C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeInterest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118FDC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_q_loadIfNeeded
{
  void *v3;
  id inited;
  double v5;
  double height;
  double width;
  void *v8;
  uint64_t v9;
  float v10;
  float v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19[2];
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_loading)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKCoverResource coverImage](self, "coverImage"));

    if (!v3)
    {
      self->_loading = 1;
      inited = objc_initWeak(&location, self);
      v5 = mainScreenScaleFactor(inited);
      width = self->_naturalSize.width;
      height = self->_naturalSize.height;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_resourceOptions, "objectForKeyedSubscript:", CFSTR("filter")));
      if ((objc_msgSend(v8, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackDiagonal) & 1) != 0)
      {
        v9 = 32;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackHorizontal) & 1) != 0)
      {
        v9 = 4128;
      }
      else if (objc_msgSend(v8, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackHorizontalRTL))
      {
        v9 = 4256;
      }
      else
      {
        v9 = 0;
      }
      v10 = v5 * width;
      v11 = v5 * height;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", self->_assetID, v9, floorf(v10), floorf(v11)));
      objc_msgSend(v12, "setRequestOptions:", 8);
      objc_msgSend(v12, "setPriority:", 5);
      v13 = _os_activity_create((void *)&_mh_execute_header, "BKCoverResourceProvider/fetching-cover", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100119220;
      block[3] = &unk_1008EB520;
      v17 = v12;
      v18 = v8;
      v14 = v8;
      v15 = v12;
      objc_copyWeak(v19, &location);
      v19[1] = *(id *)&v5;
      os_activity_apply(v13, block);
      objc_destroyWeak(v19);

      objc_destroyWeak(&location);
    }
  }
}

- (void)_q_unload
{
  __int128 v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_BKCoverResource setCoverImage:](self, "setCoverImage:", 0);
  v3 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_imageContextInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_imageContextInsets.bottom = v3;
}

- (void)_nq_loadedImage:(id)a3 withIntrinsicSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];

  height = a4.height;
  width = a4.width;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notifyQueue);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10004E408;
  v37 = sub_10004E278;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_imageContextInsets.top, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_imageContextInsets.bottom, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) != 0)
  {
    v8 = height / width;
    width = 100.0;
    height = v8 * 100.0;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100119EC4;
  block[3] = &unk_1008EB548;
  block[4] = self;
  v25 = &v33;
  v27 = width;
  v28 = height;
  v10 = v7;
  v24 = v10;
  v26 = &v29;
  dispatch_sync(queue, block);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)v34[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v39, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v15, "imageResourceDidChangeImage:") & 1) != 0)
          objc_msgSend(v15, "imageResourceDidChangeImage:", self);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v39, 16);
    }
    while (v12);
  }

  if (*((_BYTE *)v30 + 24))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions noAnimationOptions](TUITransactionOptions, "noAnimationOptions"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100119F5C;
    v18[3] = &unk_1008EB570;
    v18[4] = self;
    v18[5] = &v33;
    v17 = +[TUITransaction currentOrNewTransactionWithOptions:block:](TUITransaction, "currentOrNewTransactionWithOptions:block:", v16, v18);

  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSDictionary)resourceOptions
{
  return self->_resourceOptions;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalSize.width;
  height = self->_naturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
  objc_storeStrong((id *)&self->_coverImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverImage, 0);
  objc_storeStrong((id *)&self->_resourceOptions, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_intrinsicAspectRatio, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
