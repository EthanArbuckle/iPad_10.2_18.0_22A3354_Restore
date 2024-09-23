@implementation VUIImageProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageDidWriteObserver, 0);
  objc_storeStrong((id *)&self->_decoratorRequestToken, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong(&self->_writeCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong(&self->_imageLoader, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)load
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  id v49[3];
  char v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD block[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id location[2];

  if (!-[VUIImageProxy isLoading](self, "isLoading"))
  {
    +[VUIPagePerformanceController postNotificationForImageProxy:withLoadingStatus:withError:](VUIPagePerformanceController, "postNotificationForImageProxy:withLoadingStatus:withError:", self, 1, 0);
    objc_initWeak(location, self);
    -[VUIImageProxy _imageLoaderKey](self, "_imageLoaderKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageProxy imageLoader](self, "imageLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[VUIImageProxy imageLoader](self, "imageLoader");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIImageProxy object](self, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLForObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageKey://%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLWithString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[VUIImageProxy requestLoader](self, "requestLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordForResource:withInitiator:", 3, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VUIImageProxy optimizedImageRendering](self, "optimizedImageRendering")
      || (-[VUIImageProxy decorator](self, "decorator"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[VUIImageProxy _originalImageAssetPath](self, "_originalImageAssetPath");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_13;
    }
    else
    {
      -[VUIImageProxy _decoratedImageAssetPath](self, "_decoratedImageAssetPath");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_13;
    }
    if (self->_writeToAssetLibrary)
    {
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "willSendRequest:", v13);

      if (self->_loadSynchronouslyIfCached)
      {
        +[VUIImage imageWithPath:cacheImmediately:](VUIImage, "imageWithPath:cacheImmediately:", v12, self->_cacheOnLoad);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUICoreUtilities image:didCompleteLoadingForCache:requestRecord:](VUICoreUtilities, "image:didCompleteLoadingForCache:requestRecord:", v14, 1, v10);
        -[VUIImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v14, 0, 1);
        -[VUIImageProxy _callWriteCompletionHandlerWithPath:error:finished:](self, "_callWriteCompletionHandlerWithPath:error:finished:", v12, 0, 1);

LABEL_30:
        objc_destroyWeak(location);
        return;
      }
      objc_msgSend((id)objc_opt_class(), "_imageDecoratorQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __21__VUIImageProxy_load__block_invoke;
      v60[3] = &unk_1E9F2C720;
      v30 = &v63;
      objc_copyWeak(&v63, location);
      v12 = v12;
      v61 = v12;
      v62 = v10;
      dispatch_async(v32, v60);

      v31 = v61;
LABEL_19:

      objc_destroyWeak(v30);
      goto LABEL_30;
    }
LABEL_13:
    -[VUIImageProxy setIsLoading:](self, "setIsLoading:", 1);
    if (v3)
    {
      -[VUIImageProxy _originalImageAssetKey](self, "_originalImageAssetKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIImageProxy _decoratedImageAssetKey](self, "_decoratedImageAssetKey");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIImageProxy decorator](self, "decorator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v15;
      if (v16)
      {
        -[VUIImageProxy decorator](self, "decorator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "loaderScaleToSize");
        v19 = v18;
        v21 = v20;

        -[VUIImageProxy decorator](self, "decorator");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "loaderCropToFit");

        -[VUIImageProxy _originalImageAssetPath](self, "_originalImageAssetPath");
        v24 = objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v7);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "willSendRequest:", v25);

          +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "assetExpiryDateForKey:inGroupOfType:", v42, -[VUIImageProxy groupType](self, "groupType"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIImageProxy _decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:](self, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", 0, v24, v23, 0, v43, v27, *(double *)&v19, *(double *)&v21, v28, v10);

          v12 = (id)v24;
LABEL_29:

          goto LABEL_30;
        }
        v12 = 0;
      }
      else
      {
        v23 = 0;
        v19 = (void *)*MEMORY[0x1E0C9D820];
        v21 = *(void **)(MEMORY[0x1E0C9D820] + 8);
      }
      v51 = 0;
      v52 = (id *)&v51;
      v53 = 0x3042000000;
      v54 = __Block_byref_object_copy__2;
      v55 = __Block_byref_object_dispose__2;
      v44[0] = MEMORY[0x1E0C809B0];
      v56 = 0;
      v44[2] = __21__VUIImageProxy_load__block_invoke_31;
      v44[3] = &unk_1E9F2C748;
      v44[1] = 3221225472;
      objc_copyWeak(v49, location);
      v48 = &v51;
      v44[4] = self;
      v45 = v15;
      v46 = v3;
      v49[1] = v19;
      v49[2] = v21;
      v50 = v23;
      v47 = v43;
      v33 = (void *)MEMORY[0x1DF08E588](v44);
      -[VUIImageProxy imageLoader](self, "imageLoader");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_opt_respondsToSelector();

      if ((v35 & 1) != 0)
      {
        -[VUIImageProxy imageLoader](self, "imageLoader");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIImageProxy object](self, "object");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v37, v23, -[VUIImageProxy imageDirection](self, "imageDirection"), v9, v33, *(double *)&v19, *(double *)&v21);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[VUIImageProxy imageLoader](self, "imageLoader");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_opt_respondsToSelector();

        -[VUIImageProxy imageLoader](self, "imageLoader");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIImageProxy object](self, "object");
        if ((v40 & 1) != 0)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", v37, v23, -[VUIImageProxy imageDirection](self, "imageDirection"), v33, *(double *)&v19, *(double *)&v21);
        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "loadImageForObject:scaleToSize:cropToFit:completionHandler:", v37, v23, v33, *(double *)&v19, *(double *)&v21);
        }
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v41 = (void *)v38;

      -[VUIImageProxy setRequestToken:](self, "setRequestToken:", v41);
      objc_storeWeak(v52 + 5, v41);

      objc_destroyWeak(v49);
      _Block_object_dispose(&v51, 8);
      objc_destroyWeak(&v56);
      goto LABEL_29;
    }
    objc_msgSend((id)objc_opt_class(), "_imageReadWriteQueue");
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__VUIImageProxy_load__block_invoke_2;
    block[3] = &unk_1E9F2C578;
    v30 = &v59;
    objc_copyWeak(&v59, location);
    v58 = v10;
    dispatch_async(v29, block);

    v31 = v58;
    goto LABEL_19;
  }
}

- (id)_imageLoaderKey
{
  void *v3;
  void *v4;
  void *v5;

  -[VUIImageProxy imageLoader](self, "imageLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageKeyForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[VUIImageProxy object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VUIImageProxy imageLoader](self, "imageLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  v7 = v6 + -[VUIImageProxy groupType](self, "groupType");

  return v7;
}

- (id)imageLoader
{
  return self->_imageLoader;
}

- (id)object
{
  return self->_object;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (VUINetworkRequestLoader)requestLoader
{
  return (VUINetworkRequestLoader *)objc_loadWeakRetained((id *)&self->_requestLoader);
}

- (BOOL)optimizedImageRendering
{
  return self->_optimizedImageRendering;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (id)_originalImageAssetPath
{
  void *v3;
  void *v4;

  -[VUIImageProxy _originalImageAssetKey](self, "_originalImageAssetKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy _imageAssetPathWithAssetKey:](self, "_imageAssetPathWithAssetKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_originalImageAssetKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  -[VUIImageProxy _imageLoaderKey](self, "_imageLoaderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy _assetKeyWithImageLoaderKey:decoratorIdentifier:](self, "_assetKeyWithImageLoaderKey:decoratorIdentifier:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIImageProxy allowsSubstitutionForOriginal](self, "allowsSubstitutionForOriginal"))
  {
    -[VUIImageProxy _imageAssetPathWithAssetKey:](self, "_imageAssetPathWithAssetKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyForAssetWithTags:inGroupOfType:", v7, -[VUIImageProxy groupType](self, "groupType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = v8;

        v4 = v9;
      }

    }
  }
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x100)
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v4, "length") - 255);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }

  return v4;
}

- (BOOL)allowsSubstitutionForOriginal
{
  return self->_allowsSubstitutionForOriginal;
}

- (id)_assetKeyWithImageLoaderKey:(id)a3 decoratorIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", CFSTR("_"));
    if (-[VUIImageProxy imageDirection](self, "imageDirection"))
      v9 = CFSTR("rtl");
    else
      v9 = CFSTR("ltr");
    objc_msgSend(v8, "appendString:", v9);
    if (v7)
    {
      objc_msgSend(v8, "appendString:", CFSTR("_"));
      objc_msgSend(v8, "appendString:", v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)imageDirection
{
  return self->_imageDirection;
}

+ (id)_imageDecoratorQueue
{
  if (_imageDecoratorQueue_onceToken != -1)
    dispatch_once(&_imageDecoratorQueue_onceToken, &__block_literal_global_18);
  return (id)_imageDecoratorQueue_sImageDecoratorQueue;
}

- (id)_imageAssetPathWithAssetKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetPathForKey:inGroupOfType:", v4, -[VUIImageProxy groupType](self, "groupType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setCacheOnLoad:(BOOL)a3
{
  self->_cacheOnLoad = a3;
}

- (VUIImageProxy)initWithObject:(id)a3 imageLoader:(id)a4 groupType:(int64_t)a5
{
  id v9;
  id v10;
  VUIImageProxy *v11;
  VUIImageProxy *v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VUIImageProxy;
  v11 = -[VUIImageProxy init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_object, a3);
    objc_storeStrong(&v12->_imageLoader, a4);
    v12->_groupType = a5;
    *(_WORD *)&v12->_writeToAssetLibrary = 257;
    v12->_imageDirection = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_returnImageAfterWrittenToDisk = objc_msgSend(v13, "BOOLForKey:", CFSTR("ImageProxyReturnImageAfterWrittenToDisk"));

  }
  return v12;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)isEqual:(id)a3
{
  VUIImageProxy *v4;
  VUIImageProxy *v5;
  void *v6;
  id object;
  VUIImageDecorator *v8;
  VUIImageDecorator *v9;
  VUIImageDecorator *v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  id imageLoader;
  VUIImageDecorator *v15;
  _BOOL4 v16;
  void *v17;
  VUIImageDecorator *decorator;
  VUIImageDecorator *v19;
  _BOOL4 v20;

  v4 = (VUIImageProxy *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VUIImageProxy object](v5, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      object = self->_object;
      v8 = v6;
      v9 = (VUIImageDecorator *)object;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if (!v8 || !v9)
          goto LABEL_22;
        v11 = -[VUIImageDecorator isEqual:](v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_23;
      }
      -[VUIImageProxy imageLoader](v5, "imageLoader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      imageLoader = self->_imageLoader;
      v8 = v13;
      v15 = (VUIImageDecorator *)imageLoader;
      if (v8 == v15)
      {

      }
      else
      {
        v10 = v15;
        if (!v8 || !v15)
          goto LABEL_22;
        v16 = -[VUIImageDecorator isEqual:](v8, "isEqual:", v15);

        if (!v16)
          goto LABEL_23;
      }
      -[VUIImageProxy decorator](v5, "decorator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      decorator = self->_decorator;
      v8 = v17;
      v19 = decorator;
      if (v8 == v19)
      {

LABEL_27:
        if (-[VUIImageProxy groupType](v5, "groupType") == self->_groupType
          && -[VUIImageProxy imageDirection](v5, "imageDirection") == self->_imageDirection)
        {
          v12 = self->_optimizedImageRendering == -[VUIImageProxy optimizedImageRendering](v5, "optimizedImageRendering");
          goto LABEL_24;
        }
LABEL_23:
        v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v10 = v19;
      if (v8 && v19)
      {
        v20 = -[VUIImageDecorator isEqual:](v8, "isEqual:", v19);

        if (!v20)
          goto LABEL_23;
        goto LABEL_27;
      }
LABEL_22:

      goto LABEL_23;
    }
    v12 = 0;
  }
LABEL_25:

  return v12;
}

- (void)setImageDirection:(int64_t)a3
{
  self->_imageDirection = a3;
}

- (CGSize)expectedSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VUIImageProxy decorator](self, "decorator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expectedSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (VUIImageDecorator)decorator
{
  return self->_decorator;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_imageDidWriteObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_imageDidWriteObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)VUIImageProxy;
  -[VUIImageProxy dealloc](&v4, sel_dealloc);
}

void __21__VUIImageProxy_load__block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    +[VUIImage imageWithPath:cacheImmediately:](VUIImage, "imageWithPath:cacheImmediately:", *(_QWORD *)(a1 + 32), WeakRetained[8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUICoreUtilities image:didCompleteLoadingForCache:requestRecord:](VUICoreUtilities, "image:didCompleteLoadingForCache:requestRecord:", v4, 1, *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "_callCompletionHandlerWithImage:error:finished:", v4, 0, 1);
    objc_msgSend(v6, "_callWriteCompletionHandlerWithPath:error:finished:", *(_QWORD *)(a1 + 32), 0, 1);
LABEL_5:

    v3 = v6;
    goto LABEL_6;
  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VideosUICoreErrorDomain"), 107, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_callWriteCompletionHandlerWithPath:(id)a3 error:(id)a4 finished:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[VUIImageProxy writeCompletionHandler](self, "writeCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(v9, "copy");

  if (v10)
    ((void (**)(_QWORD, id, id, _BOOL8))v10)[2](v10, v11, v8, v5);

}

- (id)writeCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)_callCompletionHandlerWithImage:(id)a3 error:(id)a4 finished:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  +[VUIPagePerformanceController postNotificationForImageProxy:withLoadingStatus:withError:](VUIPagePerformanceController, "postNotificationForImageProxy:withLoadingStatus:withError:", self, 0, v8);
  -[VUIImageProxy completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(v9, "copy");

  if (v10)
    ((void (**)(_QWORD, id, id, _BOOL8))v10)[2](v10, v11, v8, v5);

}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

void __37__VUIImageProxy__imageReadWriteQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.videosuicore.VUIImageProxy.imageReadWriteQueue", 0);
  v1 = (void *)_imageReadWriteQueue_sImageReadWriteQueue;
  _imageReadWriteQueue_sImageReadWriteQueue = (uint64_t)v0;

}

void __37__VUIImageProxy__imageDecoratorQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.VUIAssetLibrary.decoratorQueue", 0);
  v1 = (void *)_imageDecoratorQueue_sImageDecoratorQueue;
  _imageDecoratorQueue_sImageDecoratorQueue = (uint64_t)v0;

}

uint64_t __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

void __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  double *v10;
  double *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      +[VUIImage imageWithPath:cacheImmediately:](VUIImage, "imageWithPath:cacheImmediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 136));
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (objc_msgSend(WeakRetained, "optimizedImageRendering")
      && (objc_msgSend(*(id *)(a1 + 48), "statusCancelled") & 1) == 0)
    {
      if (v5)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend((id)objc_opt_class(), "_imageReadWriteQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2;
      v27[3] = &unk_1E9F2C7B0;
      v27[4] = WeakRetained;
      v28 = v5;
      v29 = *(id *)(a1 + 40);
      v30 = v13;
      v31 = *(id *)(a1 + 64);
      v32 = *(id *)(a1 + 72);
      v33 = *(id *)(a1 + 80);
      v34 = *(id *)(a1 + 88);
      v16 = v13;
      dispatch_async(v18, v27);

      v17 = v28;
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "statusCancelled") & 1) != 0)
      {
        v6 = *(void **)(a1 + 88);
        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VideosUICoreErrorDomain"), 107, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "didFailWithError:", v7);

        }
        goto LABEL_22;
      }
      v8 = *(_QWORD *)(a1 + 112);
      if (v8 == 2)
      {
        v10 = (double *)(a1 + 120);
        v11 = (double *)(a1 + 128);
        v12 = *(_BYTE *)(a1 + 137) != 0;
      }
      else
      {
        v9 = v8 == 1;
        v10 = (double *)(a1 + 120);
        if (v9)
        {
          v11 = (double *)(a1 + 128);
        }
        else
        {
          v10 = (double *)MEMORY[0x1E0C9D820];
          v11 = (double *)(MEMORY[0x1E0C9D820] + 8);
        }
        v12 = 0;
      }
      objc_msgSend(*(id *)(a1 + 96), "decorate:scaledWithSize:croppedToFit:", v5, v12, *v10, *v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_imageReadWriteQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_3;
      block[3] = &unk_1E9F2C7D8;
      v20 = *(id *)(a1 + 48);
      v21 = v14;
      v22 = WeakRetained;
      v23 = *(id *)(a1 + 64);
      v24 = *(id *)(a1 + 72);
      v25 = *(id *)(a1 + 80);
      v26 = *(id *)(a1 + 88);
      v16 = v14;
      dispatch_async(v15, block);

      v17 = v20;
    }

LABEL_22:
  }

}

void __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_imageDidWriteHandler:", v3);
    if (objc_msgSend(v5, "returnImageAfterWrittenToDisk"))
    {
      objc_msgSend(v3, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VUIAssetDidWriteNotificationAssetPathKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          +[VUIImage imageWithPath:](VUIImage, "imageWithPath:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            if (*(_BYTE *)(a1 + 48))
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke_2;
              block[3] = &unk_1E9F2C2B0;
              v13 = v9;
              v14 = *(id *)(a1 + 32);
              v15 = v5;
              dispatch_async(MEMORY[0x1E0C80D38], block);

            }
            else
            {
              +[VUICoreUtilities image:didCompleteLoadingForCache:requestRecord:](VUICoreUtilities, "image:didCompleteLoadingForCache:requestRecord:", v9, 1, *(_QWORD *)(a1 + 32));
              objc_msgSend(v5, "_callCompletionHandlerWithImage:error:finished:", v10, 0, 1);
            }
          }
          else
          {
            VUICImageLogObject();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v17 = v8;
              _os_log_impl(&dword_1D951F000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create image from file path %@", buf, 0xCu);
            }

          }
        }

      }
    }
  }

}

- (BOOL)writeToAssetLibrary
{
  return self->_writeToAssetLibrary;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong(&self->_requestToken, a3);
}

- (void)setOptimizedImageRendering:(BOOL)a3
{
  self->_optimizedImageRendering = a3;
}

- (void)setIsLoading:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    if (!a3)
      -[VUIImageProxy setDecoratorRequestToken:](self, "setDecoratorRequestToken:", 0);
  }
}

- (void)setDecoratorRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_decoratorRequestToken, a3);
}

- (void)setDecorator:(id)a3
{
  objc_storeStrong((id *)&self->_decorator, a3);
}

- (BOOL)returnImageAfterWrittenToDisk
{
  return self->_returnImageAfterWrittenToDisk;
}

- (id)requestToken
{
  return self->_requestToken;
}

- (BOOL)isOfSameOriginAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", self->_object))
  {
    objc_msgSend(v4, "imageLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", self->_imageLoader)
      && objc_msgSend(v4, "groupType") == self->_groupType
      && objc_msgSend(v4, "imageDirection") == self->_imageDirection;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_VUIDecoratorRequest)decoratorRequestToken
{
  return self->_decoratorRequestToken;
}

- (void)cancel
{
  void *v3;
  id imageDidWriteObserver;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIImageProxy *v9;

  if (-[VUIImageProxy isLoading](self, "isLoading"))
  {
    v9 = self;
    if (v9->_imageDidWriteObserver)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:", v9->_imageDidWriteObserver);

      imageDidWriteObserver = v9->_imageDidWriteObserver;
      v9->_imageDidWriteObserver = 0;

    }
    -[VUIImageProxy requestToken](v9, "requestToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIImageProxy imageLoader](v9, "imageLoader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIImageProxy requestToken](v9, "requestToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelLoad:", v7);

      -[VUIImageProxy setRequestToken:](v9, "setRequestToken:", 0);
    }
    -[VUIImageProxy decoratorRequestToken](v9, "decoratorRequestToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStatusCancelled:", 1);

    -[VUIImageProxy setDecoratorRequestToken:](v9, "setDecoratorRequestToken:", 0);
    -[VUIImageProxy setIsLoading:](v9, "setIsLoading:", 0);
    -[VUIImageProxy _callCompletionHandlerWithImage:error:finished:](v9, "_callCompletionHandlerWithImage:error:finished:", 0, 0, 0);
    -[VUIImageProxy _callWriteCompletionHandlerWithPath:error:finished:](v9, "_callWriteCompletionHandlerWithPath:error:finished:", 0, 0, 0);

  }
}

- (void)_imageDidWriteHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  VUIImageProxy *v7;

  v7 = self;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIImageProxy isLoading](v7, "isLoading"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("VUIAssetDidWriteNotificationAssetPathKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("VUIAssetDidWriteNotificationErrorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageProxy _callWriteCompletionHandlerWithPath:error:finished:](v7, "_callWriteCompletionHandlerWithPath:error:finished:", v5, v6, 1);

  }
  -[VUIImageProxy setIsLoading:](v7, "setIsLoading:", 0);

}

- (id)_decoratorIdentifier
{
  void *v2;
  void *v3;

  -[VUIImageProxy decorator](self, "decorator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decoratorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_decoratedImageAssetKey
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[VUIImageProxy _imageLoaderKey](self, "_imageLoaderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy _decoratorIdentifier](self, "_decoratorIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy _assetKeyWithImageLoaderKey:decoratorIdentifier:](self, "_assetKeyWithImageLoaderKey:decoratorIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x100)
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 255);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (void)_decorateAndWriteImage:(id)a3 imagePath:(id)a4 scaleToSize:(CGSize)a5 cropToFit:(BOOL)a6 scalingResult:(unint64_t)a7 assetKey:(id)a8 expiryDate:(id)a9 tags:(id)a10 requestRecord:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  void *v20;
  _VUIDecoratorRequest *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _VUIDecoratorRequest *v27;
  id v28;
  id v29;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  _VUIDecoratorRequest *v39;
  VUIImageProxy *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46[4];
  char v47;
  BOOL v48;
  id location[2];

  height = a5.height;
  width = a5.width;
  v35 = a3;
  v34 = a4;
  v33 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  -[VUIImageProxy decorator](self, "decorator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = self->_cacheOnLoad;
  v21 = objc_alloc_init(_VUIDecoratorRequest);
  -[VUIImageProxy setDecoratorRequestToken:](self, "setDecoratorRequestToken:", v21);
  objc_initWeak(location, self);
  objc_msgSend((id)objc_opt_class(), "_imageDecoratorQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke;
  block[3] = &unk_1E9F2C800;
  objc_copyWeak(v46, location);
  v37 = v35;
  v38 = v34;
  v47 = (char)a8;
  v39 = v21;
  v40 = self;
  v41 = v33;
  v42 = v17;
  v43 = v18;
  v44 = v19;
  v46[2] = *(id *)&width;
  v46[3] = *(id *)&height;
  v48 = a6;
  v46[1] = (id)a7;
  v45 = v20;
  v32 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v33;
  v27 = v21;
  v28 = v34;
  v29 = v35;
  dispatch_async(v22, block);

  objc_destroyWeak(v46);
  objc_destroyWeak(location);
}

- (void)_completeImageLoadWithImage:(id)a3 imagePath:(id)a4 error:(id)a5 assetKey:(id)a6 expiryDate:(id)a7 tags:(id)a8 requestRecord:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  char v26;
  void *v27;
  void *v28;
  VUIImageProxy *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  id imageDidWriteObserver;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  char v43;
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = v21;
  if (v16)
  {
    -[VUIImageProxy completionHandler](self, "completionHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      if (v15)
      {
        v24 = v15;
      }
      else
      {
        +[VUIImage imageWithPath:cacheImmediately:](VUIImage, "imageWithPath:cacheImmediately:", v16, self->_cacheOnLoad);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v24;
      -[VUIImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v24, 0, 1);

    }
    +[VUICoreUtilities image:didCompleteLoadingForCache:requestRecord:](VUICoreUtilities, "image:didCompleteLoadingForCache:requestRecord:", v15, 1, v22);
    v29 = self;
    v30 = v16;
    v31 = 0;
LABEL_12:
    -[VUIImageProxy _callWriteCompletionHandlerWithPath:error:finished:](v29, "_callWriteCompletionHandlerWithPath:error:finished:", v30, v31, 1);
LABEL_13:
    -[VUIImageProxy setIsLoading:](self, "setIsLoading:", 0, v37);
    goto LABEL_14;
  }
  if (!v15)
  {
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VideosUICoreErrorDomain"), 107, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didFailWithError:", v32);

    }
    -[VUIImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", 0, v17, 1);
    v29 = self;
    v30 = 0;
    v31 = v17;
    goto LABEL_12;
  }
  v25 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!self->_writeToAssetLibrary)
  {
    v33 = 0;
    goto LABEL_23;
  }
  v26 = v25;
  -[VUIImageProxy writeCompletionHandler](self, "writeCompletionHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {

LABEL_20:
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v37 = CFSTR("VUIAssetDidWriteNotification");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke;
    v40[3] = &unk_1E9F2C828;
    objc_copyWeak(&v42, &location);
    v43 = v26;
    v41 = v22;
    objc_msgSend(v38, "addObserverForName:object:queue:usingBlock:", CFSTR("VUIAssetDidWriteNotification"), v18, v39, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    imageDidWriteObserver = self->_imageDidWriteObserver;
    self->_imageDidWriteObserver = v34;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    v33 = 1;
    goto LABEL_21;
  }
  if (self->_returnImageAfterWrittenToDisk)
    goto LABEL_20;
  v33 = 0;
LABEL_21:
  if (self->_writeToAssetLibrary)
  {
    +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImageAsset:forKey:inGroupOfType:expiryDate:tags:", v15, v18, -[VUIImageProxy groupType](self, "groupType"), v19, v20);

  }
LABEL_23:
  if (!self->_returnImageAfterWrittenToDisk)
  {
    +[VUICoreUtilities image:didCompleteLoadingForCache:requestRecord:](VUICoreUtilities, "image:didCompleteLoadingForCache:requestRecord:", v15, 1, v22);
    -[VUIImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v15, 0, 1);
  }
  if ((v33 & 1) == 0)
    goto LABEL_13;
LABEL_14:

}

+ (id)_imageReadWriteQueue
{
  if (_imageReadWriteQueue_onceToken != -1)
    dispatch_once(&_imageReadWriteQueue_onceToken, &__block_literal_global_41);
  return (id)_imageReadWriteQueue_sImageReadWriteQueue;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)VUIImageProxy;
  -[VUIImageProxy description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[VUIImageProxy object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy imageLoader](self, "imageLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithObject:imageLoader:groupType:", v5, v6, -[VUIImageProxy groupType](self, "groupType"));

  -[VUIImageProxy decorator](self, "decorator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDecorator:", v8);

  objc_msgSend(v7, "setCacheOnLoad:", -[VUIImageProxy cacheOnLoad](self, "cacheOnLoad"));
  objc_msgSend(v7, "setLoadSynchronouslyIfCached:", -[VUIImageProxy loadSynchronouslyIfCached](self, "loadSynchronouslyIfCached"));
  objc_msgSend(v7, "setWriteToAssetLibrary:", -[VUIImageProxy writeToAssetLibrary](self, "writeToAssetLibrary"));
  return v7;
}

- (void)setWriteToAssetLibrary:(BOOL)a3
{
  self->_writeToAssetLibrary = a3;
  if (!a3)
    -[VUIImageProxy setReturnImageAfterWrittenToDisk:](self, "setReturnImageAfterWrittenToDisk:", 0);
}

- (BOOL)isImageAvailable
{
  void *v2;
  BOOL v3;

  -[VUIImageProxy _decoratedImageAssetPath](self, "_decoratedImageAssetPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

void __21__VUIImageProxy_load__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VideosUICoreErrorDomain"), 106, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", 0, 0, v2, 0, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "didFailWithError:", v2);

  }
}

void __21__VUIImageProxy_load__block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD block[4];
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "requestToken");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v16, "requestToken");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      if (v19 == v20)
      {
        objc_msgSend(v16, "setRequestToken:", 0);
        if (objc_msgSend(v16, "isLoading"))
        {
          objc_msgSend(v16, "decorator");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 && (v21, v11 | v12))
          {
            if (v11 && objc_msgSend(v16, "writeToAssetLibrary"))
            {
              objc_msgSend(v16, "imageLoader");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v22, "hasImageCache") & 1) == 0)
              {
                objc_msgSend((id)objc_opt_class(), "_imageReadWriteQueue");
                v23 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __21__VUIImageProxy_load__block_invoke_2_34;
                block[3] = &unk_1E9F2C170;
                v30 = (id)v11;
                v31 = *(id *)(a1 + 40);
                v32 = v16;
                v33 = v13;
                v34 = *(id *)(a1 + 48);
                dispatch_async(v23, block);

              }
            }
            v24 = *(unsigned __int8 *)(a1 + 96);
            v25 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", v11, v12, v24, a5, v25, v13, *(double *)(a1 + 80), *(double *)(a1 + 88), v26, 0);

          }
          else
          {
            v27 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", v11, v12, v14, v27, v13, v28, 0);

          }
        }
      }
    }
  }

}

void __21__VUIImageProxy_load__block_invoke_2_34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[VUIAssetLibrary sharedInstance](VUIAssetLibrary, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 48), "groupType");
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageAsset:forKey:inGroupOfType:expiryDate:tags:", v2, v3, v4, v5, v6);

}

void __125__VUIImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "statusCancelled") & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
      v2 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (id)v2;
    objc_msgSend(*(id *)(a1 + 48), "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", *(_QWORD *)(a1 + 40), 0, v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

  }
}

uint64_t __100__VUIImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke_2(uint64_t a1)
{
  +[VUICoreUtilities image:didCompleteLoadingForCache:requestRecord:](VUICoreUtilities, "image:didCompleteLoadingForCache:requestRecord:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_callCompletionHandlerWithImage:error:finished:", *(_QWORD *)(a1 + 32), 0, 1);
}

- (id)_decoratedImageAssetPath
{
  void *v3;
  void *v4;

  -[VUIImageProxy _decoratedImageAssetKey](self, "_decoratedImageAssetKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIImageProxy _imageAssetPathWithAssetKey:](self, "_imageAssetPathWithAssetKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setImageLoader:(id)a3
{
  objc_storeStrong(&self->_imageLoader, a3);
}

- (CGSize)dynamicProxyRequestedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_dynamicProxyRequestedSize.width;
  height = self->_dynamicProxyRequestedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDynamicProxyRequestedSize:(CGSize)a3
{
  self->_dynamicProxyRequestedSize = a3;
}

- (BOOL)cacheOnLoad
{
  return self->_cacheOnLoad;
}

- (void)setAllowsSubstitutionForOriginal:(BOOL)a3
{
  self->_allowsSubstitutionForOriginal = a3;
}

- (void)setWriteCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setRequestLoader:(id)a3
{
  objc_storeWeak((id *)&self->_requestLoader, a3);
}

- (BOOL)loadSynchronouslyIfCached
{
  return self->_loadSynchronouslyIfCached;
}

- (void)setLoadSynchronouslyIfCached:(BOOL)a3
{
  self->_loadSynchronouslyIfCached = a3;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (id)imageDidWriteObserver
{
  return self->_imageDidWriteObserver;
}

- (void)setImageDidWriteObserver:(id)a3
{
  objc_storeStrong(&self->_imageDidWriteObserver, a3);
}

- (void)setReturnImageAfterWrittenToDisk:(BOOL)a3
{
  self->_returnImageAfterWrittenToDisk = a3;
}

@end
