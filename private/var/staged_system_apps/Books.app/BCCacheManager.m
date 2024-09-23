@implementation BCCacheManager

- (void)addImageResource:(id)a3 withIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v9, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadImage"));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "image"));
      -[BCCacheManager _addTUIPurgeableImage:withIdentifier:](self, "_addTUIPurgeableImage:withIdentifier:", v13, v9);

      v14 = objc_retainBlock(v10);
      v15 = v14;
      if (v14)
        (*((void (**)(id))v14 + 2))(v14);

    }
    else
    {
      v16 = BCImageCacheLog();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_10069C874((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);

      objc_setAssociatedObject(v8, CFSTR("BCCoverCacheAssetIDKey"), v9, (void *)3);
      v24 = objc_retainBlock(v10);
      objc_setAssociatedObject(v8, CFSTR("BCCoverCacheCompletionKey"), v24, (void *)1);

      objc_msgSend(v8, "addObserver:", self);
    }

  }
}

- (void)_addTUIPurgeableImage:(id)a3 withIdentifier:(id)a4
{
  id v5;
  CGImage *v6;
  CGImage *v7;
  double Width;
  BICDescribedImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v5 = a4;
  v6 = (CGImage *)objc_msgSend(a3, "CGImage");
  if (v6)
  {
    v7 = v6;
    Width = (double)CGImageGetWidth(v6);
    v9 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v5, 0, Width, (double)CGImageGetHeight(v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BICImage imageWithCGImage:](BICImage, "imageWithCGImage:", v7));
    objc_msgSend(v10, "setImage:", v11);

    objc_msgSend(v10, "setQuality:", 203);
    objc_msgSend(v10, "setPriority:", 6);
    objc_msgSend(v10, "setRequestOptions:", 1024);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v22 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    objc_msgSend(v12, "addDescribedImages:", v13);

    v14 = BCImageCacheLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_10069C8DC((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);

  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  void *v4;
  id AssociatedObject;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id object;

  object = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(object, "loadImage"));
  AssociatedObject = objc_getAssociatedObject(object, CFSTR("BCCoverCacheAssetIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
  -[BCCacheManager _addTUIPurgeableImage:withIdentifier:](self, "_addTUIPurgeableImage:withIdentifier:", v7, v6);

  v8 = objc_getAssociatedObject(object, CFSTR("BCCoverCacheCompletionKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_retainBlock(v9);
  v11 = v10;
  if (v10)
    (*((void (**)(id))v10 + 2))(v10);

  objc_msgSend(object, "removeObserver:", self);
  objc_setAssociatedObject(object, CFSTR("BCCoverCacheCompletionKey"), 0, (void *)1);

}

@end
