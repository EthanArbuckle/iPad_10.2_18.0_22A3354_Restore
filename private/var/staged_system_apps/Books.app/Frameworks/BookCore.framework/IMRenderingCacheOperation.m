@implementation IMRenderingCacheOperation

- (IMRenderingCacheOperation)initWithOptions:(int64_t)a3
{
  IMRenderingCacheOperation *v4;
  IMRenderingCacheOperation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMRenderingCacheOperation;
  v4 = -[IMRenderingCacheOperation init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[IMRenderingCacheOperation setSerializeFormat:](v4, "setSerializeFormat:", 1);
    v5->_options = a3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[IMRenderingCacheOperation clearCallbackState](self, "clearCallbackState");
  v3.receiver = self;
  v3.super_class = (Class)IMRenderingCacheOperation;
  -[IMRenderingCacheOperation dealloc](&v3, "dealloc");
}

- (void)clearCallbackState
{
  id context;
  IMRenderingCacheOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_storeWeak(&obj->_target, 0);
  obj->_selector = 0;
  context = obj->_context;
  obj->_context = 0;

  objc_sync_exit(obj);
}

- (void)cancel
{
  objc_super v3;

  -[IMRenderingCacheOperation clearCallbackState](self, "clearCallbackState");
  v3.receiver = self;
  v3.super_class = (Class)IMRenderingCacheOperation;
  -[IMRenderingCacheOperation cancel](&v3, "cancel");
}

- (id)generateImage:(CGSize)a3
{
  return 0;
}

- (id)callbackInvocationWithImage:(id)a3
{
  return 0;
}

- (id)renderingCacheCallbackInvocationWithImage:(id)a3 pageNumber:(int64_t)a4
{
  id v6;
  IMRenderingCacheOperation *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  AEBookRenderingCallbackTargetProxy *v12;
  void *v13;
  char *v14;
  void *v16;
  id v17;
  int64_t v18;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation target](v7, "target"));
  v9 = -[IMRenderingCacheOperation selector](v7, "selector");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation context](v7, "context"));
  objc_sync_exit(v7);

  v11 = 0;
  if (v8 && v9)
  {
    v12 = -[AEBookRenderingCallbackTargetProxy initWithTarget:]([AEBookRenderingCallbackTargetProxy alloc], "initWithTarget:", v8);
    v18 = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "methodSignatureForSelector:", v9));
    v14 = (char *)objc_msgSend(v13, "numberOfArguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v13));
    objc_msgSend(v11, "setSelector:", v9);
    objc_msgSend(v11, "setTarget:", v12);
    v17 = v6;
    objc_msgSend(v11, "setArgument:atIndex:", &v17, 2);
    if ((unint64_t)(v14 - 2) >= 2)
    {
      v16 = v10;
      objc_msgSend(v11, "setArgument:atIndex:", &v16, 3);
      if ((unint64_t)(v14 - 2) >= 3)
        objc_msgSend(v11, "setArgument:atIndex:", &v18, 4);
    }
    objc_msgSend(v11, "retainArguments");

    v10 = 0;
    v8 = 0;
  }

  return v11;
}

- (id)renderingCacheCallbackInvocationWithImage:(id)a3
{
  return -[IMRenderingCacheOperation renderingCacheCallbackInvocationWithImage:pageNumber:](self, "renderingCacheCallbackInvocationWithImage:pageNumber:", a3, 1);
}

- (void)storeImage:(id)a3 forKey:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  id v11;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation imageCache](self, "imageCache"));
  objc_msgSend(v11, "storeImage:forKey:size:format:", v10, v9, -[IMRenderingCacheOperation serializeFormat](self, "serializeFormat"), width, height);

}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGSize *p_desiredSize;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  double width;
  double height;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if ((-[IMRenderingCacheOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation target](self, "target"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation imageCache](self, "imageCache"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation storageKey](self, "storageKey"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation storageKey](self, "storageKey"));
      if (v3)
      {
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchImageForKey:", v6));

        if (v24)
        {
LABEL_22:
          if ((-[IMRenderingCacheOperation isCancelled](self, "isCancelled") & 1) == 0)
            -[IMRenderingCacheOperation performCallbackWithImage:](self, "performCallbackWithImage:", v24);
          goto LABEL_24;
        }
LABEL_9:
        objc_msgSend(v4, "primaryImageSize");
        v11 = v9;
        v12 = v10;
        v13 = v9 == CGSizeZero.width && v10 == CGSizeZero.height;
        if (v13
          || ((p_desiredSize = &self->_desiredSize, self->_desiredSize.width == v9)
            ? (v15 = self->_desiredSize.height == v10)
            : (v15 = 0),
              v15
           || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation masterImageKey](self, "masterImageKey")),
               v17 = objc_msgSend(v16, "length"),
               v16,
               !v17)
           || p_desiredSize->width > v11
           || self->_desiredSize.height > v12))
        {
          v24 = (id)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation generateImage:](self, "generateImage:", self->_desiredSize.width, self->_desiredSize.height));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation storageKey](self, "storageKey"));
          width = self->_desiredSize.width;
          height = self->_desiredSize.height;
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation masterImageKey](self, "masterImageKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchImageForKey:canAcceptSurfaceBacked:", v21, 0));

          if (!v22)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation generateImage:](self, "generateImage:", v11, v12));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation masterImageKey](self, "masterImageKey"));
            -[IMRenderingCacheOperation storeImage:forKey:size:](self, "storeImage:forKey:size:", v22, v23, v11, v12);

          }
          v24 = (id)objc_claimAutoreleasedReturnValue(+[IMThumbnailUtilities scaleImage:toSize:options:](IMThumbnailUtilities, "scaleImage:toSize:options:", v22, -[IMRenderingCacheOperation options](self, "options"), self->_desiredSize.width, self->_desiredSize.height));

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation storageKey](self, "storageKey"));
          width = p_desiredSize->width;
          height = self->_desiredSize.height;
        }
        -[IMRenderingCacheOperation storeImage:forKey:size:](self, "storeImage:forKey:size:", v24, v18, width, height);

        goto LABEL_22;
      }
      v8 = objc_msgSend(v4, "hasImageForKey:", v6);

      if ((v8 & 1) == 0)
        goto LABEL_9;
    }
    else
    {
      -[IMRenderingCacheOperation desiredSize](self, "desiredSize");
      v7 = -[IMRenderingCacheOperation generateImage:](self, "generateImage:");
    }
    v24 = 0;
LABEL_24:

  }
}

- (void)performCallbackWithImage:(id)a3
{
  IMRenderingCacheOperation *v4;
  id WeakRetained;
  SEL selector;
  unsigned __int8 v7;
  IMRenderingCacheOperation *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  WeakRetained = objc_loadWeakRetained(&v4->_target);
  if (!WeakRetained)
  {
    objc_sync_exit(v4);
    goto LABEL_10;
  }
  selector = v4->_selector;

  objc_sync_exit(v4);
  if (selector && (-[IMRenderingCacheOperation isCancelled](v4, "isCancelled") & 1) == 0)
  {
    v7 = +[NSThread isMainThread](NSThread, "isMainThread");
    v8 = (IMRenderingCacheOperation *)objc_claimAutoreleasedReturnValue(-[IMRenderingCacheOperation callbackInvocationWithImage:](v4, "callbackInvocationWithImage:", v9));
    v4 = v8;
    if ((v7 & 1) == 0)
    {
      -[IMRenderingCacheOperation performSelectorOnMainThread:withObject:waitUntilDone:](v8, "performSelectorOnMainThread:withObject:waitUntilDone:", "invoke", 0, 1);
      goto LABEL_9;
    }
    if (v8)
    {
      -[IMRenderingCacheOperation invoke](v8, "invoke");
LABEL_9:
      -[IMRenderingCacheOperation setTarget:](v4, "setTarget:", 0);
    }
LABEL_10:

  }
}

- (void)main
{
  void *v3;

  if ((-[IMRenderingCacheOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = objc_autoreleasePoolPush();
    -[IMRenderingCacheOperation performOperation](self, "performOperation");
    objc_autoreleasePoolPop(v3);
  }
}

- (id)description
{
  uint64_t v3;
  NSString *assetID;
  NSString *storageKey;
  id WeakRetained;
  id context;
  NSString *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_class(self);
  assetID = self->_assetID;
  storageKey = self->_storageKey;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  context = self->_context;
  v8 = NSStringFromCGSize(self->_desiredSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> [AssetID: %@] [Key: %@] [Target: %p; %p] [Size: %@]"),
                    v3,
                    self,
                    assetID,
                    storageKey,
                    WeakRetained,
                    context,
                    v9));

  return v10;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->_desiredSize = a3;
}

- (NSString)storageKey
{
  return self->_storageKey;
}

- (void)setStorageKey:(id)a3
{
  objc_storeStrong((id *)&self->_storageKey, a3);
}

- (NSString)masterImageKey
{
  return self->_masterImageKey;
}

- (void)setMasterImageKey:(id)a3
{
  objc_storeStrong((id *)&self->_masterImageKey, a3);
}

- (IMRenderingCache)imageCache
{
  return (IMRenderingCache *)objc_loadWeakRetained((id *)&self->_imageCache);
}

- (void)setImageCache:(id)a3
{
  objc_storeWeak((id *)&self->_imageCache, a3);
}

- (int64_t)options
{
  return self->_options;
}

- (int)serializeFormat
{
  return self->_serializeFormat;
}

- (void)setSerializeFormat:(int)a3
{
  self->_serializeFormat = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageCache);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_masterImageKey, 0);
  objc_storeStrong((id *)&self->_storageKey, 0);
}

@end
