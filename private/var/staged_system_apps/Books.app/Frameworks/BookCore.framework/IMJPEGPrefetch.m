@implementation IMJPEGPrefetch

- (IMJPEGPrefetch)initWithData:(id)a3 optimalSize:(CGSize)a4
{
  return -[IMJPEGPrefetch initWithData:optimalSize:options:](self, "initWithData:optimalSize:options:", a3, 0, a4.width, a4.height);
}

- (IMJPEGPrefetch)initWithData:(id)a3 optimalSize:(CGSize)a4 options:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_group_t v13;
  void *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMJPEGPrefetch;
  v10 = -[IMJPEGPrefetch init](&v16, "init");
  if (v10)
  {
    v11 = dispatch_queue_create("IMJPEGPrefetch", 0);
    v12 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = v11;

    v13 = dispatch_group_create();
    v14 = (void *)*((_QWORD *)v10 + 5);
    *((_QWORD *)v10 + 5) = v13;

    *((_DWORD *)v10 + 12) = 0;
    *((CGFloat *)v10 + 2) = width;
    *((CGFloat *)v10 + 3) = height;
    *((_QWORD *)v10 + 9) = a5;
    dispatch_group_enter(*((dispatch_group_t *)v10 + 5));
    if (v9)
      objc_msgSend(v10, "_startDecodeWithData:", v9);
  }

  return (IMJPEGPrefetch *)v10;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_cachedImage);
  v3.receiver = self;
  v3.super_class = (Class)IMJPEGPrefetch;
  -[IMJPEGPrefetch dealloc](&v3, "dealloc");
}

- (void)_startDecodeWithData:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  id *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  dispatch_queue_global_t v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  _QWORD *v20;
  _QWORD v21[5];
  _QWORD block[4];
  id v23;
  IMJPEGPrefetch *v24;

  v4 = a3;
  if (v4)
  {
    if ((self->_options & 1) != 0)
    {
      global_queue = dispatch_get_global_queue(2, 0);
      v11 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_FCC4;
      block[3] = &unk_28BAC0;
      v23 = v4;
      v24 = self;
      dispatch_async(v11, block);

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMJPEGPrefetch _decodeSessionOptionsWithOptimalSize:highPriority:](self, "_decodeSessionOptionsWithOptimalSize:highPriority:", 1, self->_optimalSize.width, self->_optimalSize.height));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FD3C;
      v21[3] = &unk_28BB10;
      v21[4] = self;
      v6 = objc_retainBlock(v21);
      if ((self->_options & 2) != 0)
      {
        v12 = dispatch_get_global_queue(2, 0);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_FEA8;
        v15[3] = &unk_28BB60;
        v9 = &v16;
        v16 = v4;
        v17 = v5;
        v18 = v6;
        v14 = v6;
        dispatch_async(v13, v15);

      }
      else
      {
        if (qword_30D500 != -1)
          dispatch_once(&qword_30D500, &stru_28BC20);
        v7 = qword_30D4E8;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_FE98;
        v19[3] = &unk_28BB38;
        v20 = v6;
        v8 = v6;
        v9 = (id *)&v20;
        self->_requestID = CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously(v7, v4, v5, v19);
      }

    }
  }
  else
  {
    dispatch_group_leave((dispatch_group_t)self->_requestGroup);
  }

}

- (id)_decodeSessionOptionsWithOptimalSize:(CGSize)a3 highPriority:(BOOL)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  id v10;
  double v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  _QWORD v16[4];

  height = a3.height;
  width = a3.width;
  v15[0] = kCMPhotoJPEGDecodeSessionImageOptionKey_ApplyTransform;
  v15[1] = kCMPhotoJPEGDecodeSessionImageOptionKey_HighPriority;
  v16[0] = &__kCFBooleanFalse;
  v16[1] = &__kCFBooleanFalse;
  v15[2] = kCMPhotoJPEGDecodeSessionImageOptionKey_BackCGImageWithIOSurface;
  v15[3] = kCMPhotoJPEGDecodeSessionImageOptionKey_ForceHighSpeedDecode;
  v16[2] = &__kCFBooleanTrue;
  v16[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
  v7 = v6;
  v8 = CGSizeZero.height;
  if (CGSizeZero.width != width || v8 != height)
  {
    v10 = objc_msgSend(v6, "mutableCopy", CGSizeZero.width, v8);
    if (width <= height)
      v11 = height;
    else
      v11 = width;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)v11));
    objc_msgSend(v10, "setObject:forKey:", v12, kCMPhotoJPEGDecodeSessionImageOptionKey_MaxPixelSize);

    v13 = objc_msgSend(v10, "copy");
    v7 = v13;
  }
  return v7;
}

- (void)_cancel
{
  atomic<int> *p_cancelled;
  unsigned int v3;

  p_cancelled = &self->_cancelled;
  do
    v3 = __ldaxr((unsigned int *)p_cancelled);
  while (__stlxr(v3 | 1, (unsigned int *)p_cancelled));
}

- (void)_uncancel
{
  atomic<int> *p_cancelled;

  p_cancelled = &self->_cancelled;
  do
    __ldaxr((unsigned int *)p_cancelled);
  while (__stlxr(0, (unsigned int *)p_cancelled));
}

- (CGImage)cachedImage
{
  NSObject *sync;
  NSObject *v4;
  const void *v5;
  CGImage *v6;
  _QWORD v8[6];
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10210;
  block[3] = &unk_28BB88;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v14;
  dispatch_sync(sync, block);
  if (*((_BYTE *)v11 + 24))
  {
    dispatch_group_wait((dispatch_group_t)self->_requestGroup, 0xFFFFFFFFFFFFFFFFLL);
    v4 = self->_sync;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1025C;
    v8[3] = &unk_28BBB0;
    v8[4] = self;
    v8[5] = &v14;
    dispatch_sync(v4, v8);
  }
  v5 = (const void *)v15[3];
  if (v5)
    v6 = (CGImage *)CFAutorelease(v5);
  else
    v6 = 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (CGImage)cachedImageIfAvailable
{
  return 0;
}

- (void)cancelPrefetchRequest
{
  NSObject *sync;
  _QWORD block[5];

  -[IMJPEGPrefetch _cancel](self, "_cancel");
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_102FC;
  block[3] = &unk_28BBD8;
  block[4] = self;
  dispatch_sync(sync, block);
}

- (void)addImageHandler:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *sync;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    v8 = &_dispatch_main_q;
  }
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10438;
  block[3] = &unk_28BB60;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_sync(sync, block);

}

- (BOOL)isPrefetchCancelled
{
  unsigned int v2;

  v2 = atomic_load((unsigned int *)&self->_cancelled);
  return v2 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestGroup, 0);
  objc_storeStrong((id *)&self->_sync, 0);
}

@end
