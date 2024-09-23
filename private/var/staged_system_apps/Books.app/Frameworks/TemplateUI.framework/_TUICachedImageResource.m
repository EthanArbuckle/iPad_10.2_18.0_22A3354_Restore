@implementation _TUICachedImageResource

- (_TUICachedImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  _TUICachedImageResource *v16;
  _TUICachedImageResource *v17;
  uint64_t v18;
  NSHashTable *observers;
  objc_super v21;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_TUICachedImageResource;
  v16 = -[_TUICachedImageResource init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_cache, v13);
    objc_storeStrong((id *)&v17->_unsizedCacheSet, a4);
    objc_storeStrong((id *)&v17->_queue, a5);
    v17->_naturalSize.width = width;
    v17->_naturalSize.height = height;
    v17->_contentsScale = a7;
    v18 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v17->_observers;
    v17->_observers = (NSHashTable *)v18;

    *(_BYTE *)&v17->_state &= 0xF8u;
    v17->_intrinsicSize = CGSizeZero;
    -[_TUIImageResourceUnsizedCacheSet addImageResource:](v17->_unsizedCacheSet, "addImageResource:", v17);
  }

  return v17;
}

- (TUIImageResourceCacheKey)sizedKey
{
  return objc_alloc_init(TUIImageResourceCacheKey);
}

- (TUIImageResourceCacheKey)unsizedKey
{
  return objc_alloc_init(TUIImageResourceCacheKey);
}

- (id)newImageResourceWithSize:(CGSize)a3
{
  return 0;
}

- (TUIResource)resource
{
  return (TUIResource *)self->_url;
}

- (BOOL)allowsMultipleUpdates
{
  return 0;
}

- (void)addInterest
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9C6E0;
  v4[3] = &unk_23D988;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((_BYTE *)v6 + 24))
    -[_TUICachedImageResource loadResource](self, "loadResource");
  _Block_object_dispose(&v5, 8);
}

- (void)removeInterest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9C77C;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)addNonVolatileInterest
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9C85C;
  v4[3] = &unk_23D988;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((_BYTE *)v6 + 24))
    -[_TUICachedImageResource loadResource](self, "loadResource");
  _Block_object_dispose(&v5, 8);
}

- (void)deferredLoadImageIfNeeded
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9C998;
  v4[3] = &unk_23D988;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((_BYTE *)v6 + 24))
    -[_TUICachedImageResource loadResource](self, "loadResource");
  _Block_object_dispose(&v5, 8);
}

- (void)removeNonVolatileInterest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9CA34;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)loadImage
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
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_9CB9C;
  v11 = sub_9CBAC;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9CBB4;
  block[3] = &unk_240460;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v7;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v14 + 24))
    -[_TUICachedImageResource loadResource](self, "loadResource");
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (BOOL)_q_shouldLoadResourceIfNeededAllowDefer:(BOOL)a3
{
  _BOOL4 v3;
  char state;
  BOOL v7;
  id WeakRetained;
  unsigned __int8 v9;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  state = (char)self->_state;
  if ((state & 0xA) == 2 || (state & 1) != 0)
    return 0;
  if (self->_image)
    v7 = !v3;
  else
    v7 = 1;
  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
    v9 = objc_msgSend(WeakRetained, "shouldDeferLoadForResource:", self);

    if ((v9 & 1) != 0)
      return 0;
    state = (char)self->_state;
  }
  *(_BYTE *)&self->_state = state | 1;
  return 1;
}

- (void)_q_unloadResource
{
  TUIPurgeableImage *image;
  __int128 v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  image = self->_image;
  self->_image = 0;

  v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->_insets.bottom = v4;
  *(_BYTE *)&self->_state &= 0xFCu;
}

- (void)_refresh
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9CDE8;
  v4[3] = &unk_23D988;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((_BYTE *)v6 + 24))
    -[_TUICachedImageResource loadResource](self, "loadResource");
  _Block_object_dispose(&v5, 8);
}

- (void)pauseUnload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9CE84;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resumeUnload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9CEF0;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_loadedImage:(id)a3 insets:(UIEdgeInsets)a4
{
  -[_TUICachedImageResource _loadedImage:insets:temporary:](self, "_loadedImage:insets:temporary:", a3, 0, a4.top, a4.left, a4.bottom, a4.right);
}

- (void)_loadedImage:(id)a3 insets:(UIEdgeInsets)a4 temporary:(BOOL)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v11;
  NSObject *queue;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[6];
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[5];
  id v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[4];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_9CB9C;
  v53 = sub_9CBAC;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9D274;
  block[3] = &unk_240488;
  v39 = a5;
  block[4] = self;
  v31 = &v45;
  v32 = v44;
  v13 = v11;
  v35 = top;
  v36 = left;
  v37 = bottom;
  v38 = right;
  v30 = v13;
  v33 = &v40;
  v34 = &v49;
  dispatch_sync(queue, block);
  v14 = (void *)v50[5];
  if (v14)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v55, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v19, "imageResourceDidChangeImage:") & 1) != 0)
            objc_msgSend(v19, "imageResourceDidChangeImage:", self);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v55, 16);
      }
      while (v16);
    }

    if (*((_BYTE *)v41 + 24))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions defaultImplicitOptions](TUITransactionOptions, "defaultImplicitOptions"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_9D47C;
      v24[3] = &unk_2404B0;
      v24[4] = self;
      v24[5] = &v49;
      v21 = +[TUITransaction currentOrNewTransactionWithOptions:block:](TUITransaction, "currentOrNewTransactionWithOptions:block:", v20, v24);

    }
  }
  if (*((_BYTE *)v46 + 24))
  {
    v22 = self->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_9D5A0;
    v23[3] = &unk_23D988;
    v23[4] = self;
    v23[5] = v44;
    dispatch_sync(v22, v23);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

}

- (void)_q_loadIntrinsicSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_intrinsicSize.width = width;
  self->_intrinsicSize.height = height;
  *(_BYTE *)&self->_state |= 4u;
}

- (void)_q_loadedImage:(id)a3 insets:(UIEdgeInsets)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)updateImage:(id)a3
{
  -[_TUICachedImageResource updateImage:allowUnload:temporary:](self, "updateImage:allowUnload:temporary:", a3, 1, 0);
}

- (void)updateImage:(id)a3 allowUnload:(BOOL)a4 temporary:(BOOL)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *queue;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  NSObject *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[5];
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  BOOL v42;
  _QWORD v43[4];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];

  v8 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_9CB9C;
  v52 = sub_9CBAC;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
  objc_msgSend(v8, "insets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9D918;
  block[3] = &unk_2404D8;
  block[4] = self;
  v19 = v9;
  v37 = v11;
  v38 = v13;
  v39 = v15;
  v40 = v17;
  v41 = a5;
  v33 = v19;
  v34 = &v44;
  v42 = a4;
  v35 = v43;
  v36 = &v48;
  dispatch_sync(queue, block);
  v20 = (void *)v49[5];
  if (v20)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v54, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v25, "imageResourceDidChangeImage:") & 1) != 0)
            objc_msgSend(v25, "imageResourceDidChangeImage:", self);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v54, 16);
      }
      while (v22);
    }

  }
  if (*((_BYTE *)v45 + 24))
  {
    v26 = self->_queue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_9DA50;
    v27[3] = &unk_23D988;
    v27[4] = self;
    v27[5] = v43;
    dispatch_sync(v26, v27);
  }

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

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
  v10 = sub_9CB9C;
  v11 = sub_9CBAC;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9DB30;
  block[3] = &unk_240500;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)isImageLoaded
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9DC68;
  v5[3] = &unk_23EAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isImageLoading
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9DD24;
  v5[3] = &unk_23EAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadIntrinsicSize
{
  NSObject *queue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9DDF4;
  v4[3] = &unk_23D988;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(queue, v4);
  if (*((_BYTE *)v6 + 24))
    -[_TUICachedImageResource loadResource](self, "loadResource");
  _Block_object_dispose(&v5, 8);
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
    block[2] = sub_9DEB0;
    block[3] = &unk_23D7D0;
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
    block[2] = sub_9DF3C;
    block[3] = &unk_23D7D0;
    block[4] = self;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)loadLargestLoadedImageAsTemporary
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_TUIImageResourceUnsizedCacheSet largestResourceWithContentAndNaturalSize:contentsScale:](self->_unsizedCacheSet, "largestResourceWithContentAndNaturalSize:contentsScale:", self->_naturalSize.width, self->_naturalSize.height, self->_contentsScale));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageContentWithOptions:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  if (v4)
    -[_TUICachedImageResource updateImage:allowUnload:temporary:](self, "updateImage:allowUnload:temporary:", v3, 0, 1);

}

- (id)debugFunctionalDescription
{
  return CFSTR("unknown");
}

- (NSURL)url
{
  return self->_url;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_unsizedCacheSet, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
