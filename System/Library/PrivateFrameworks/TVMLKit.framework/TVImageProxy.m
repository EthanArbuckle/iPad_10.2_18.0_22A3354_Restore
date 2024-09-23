@implementation TVImageProxy

- (TVImageProxy)initWithObject:(id)a3 imageLoader:(id)a4 groupType:(int64_t)a5
{
  id v9;
  id v10;
  TVImageProxy *v11;
  TVImageProxy *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVImageProxy;
  v11 = -[TVImageProxy init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_object, a3);
    objc_storeStrong(&v12->_imageLoader, a4);
    v12->_writeToAssetLibrary = 1;
    v12->_imageDirection = 0;
    v12->_groupType = a5;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_imageDidWriteObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_imageDidWriteObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)TVImageProxy;
  -[TVImageProxy dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TVImageProxy;
  -[TVImageProxy description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  TVImageProxy *v4;
  TVImageProxy *v5;
  void *v6;
  id object;
  TVImageDecorator *v8;
  TVImageDecorator *v9;
  TVImageDecorator *v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  id imageLoader;
  TVImageDecorator *v15;
  _BOOL4 v16;
  void *v17;
  TVImageDecorator *decorator;
  TVImageDecorator *v19;
  _BOOL4 v20;

  v4 = (TVImageProxy *)a3;
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
      -[TVImageProxy object](v5, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      object = self->_object;
      v8 = v6;
      v9 = (TVImageDecorator *)object;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if (!v8 || !v9)
          goto LABEL_22;
        v11 = -[TVImageDecorator isEqual:](v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_23;
      }
      -[TVImageProxy imageLoader](v5, "imageLoader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      imageLoader = self->_imageLoader;
      v8 = v13;
      v15 = (TVImageDecorator *)imageLoader;
      if (v8 == v15)
      {

      }
      else
      {
        v10 = v15;
        if (!v8 || !v15)
          goto LABEL_22;
        v16 = -[TVImageDecorator isEqual:](v8, "isEqual:", v15);

        if (!v16)
          goto LABEL_23;
      }
      -[TVImageProxy decorator](v5, "decorator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      decorator = self->_decorator;
      v8 = v17;
      v19 = decorator;
      if (v8 == v19)
      {

LABEL_27:
        if (-[TVImageProxy groupType](v5, "groupType") == self->_groupType)
        {
          v12 = -[TVImageProxy imageDirection](v5, "imageDirection") == self->_imageDirection;
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
        v20 = -[TVImageDecorator isEqual:](v8, "isEqual:", v19);

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

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[TVImageProxy object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TVImageProxy imageLoader](self, "imageLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  v7 = v6 + -[TVImageProxy groupType](self, "groupType");

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
  -[TVImageProxy object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy imageLoader](self, "imageLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithObject:imageLoader:groupType:", v5, v6, -[TVImageProxy groupType](self, "groupType"));

  -[TVImageProxy decorator](self, "decorator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDecorator:", v8);

  objc_msgSend(v7, "setCacheOnLoad:", -[TVImageProxy cacheOnLoad](self, "cacheOnLoad"));
  objc_msgSend(v7, "setLoadSynchronouslyIfCached:", -[TVImageProxy loadSynchronouslyIfCached](self, "loadSynchronouslyIfCached"));
  objc_msgSend(v7, "setWriteToAssetLibrary:", -[TVImageProxy writeToAssetLibrary](self, "writeToAssetLibrary"));
  return v7;
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

  -[TVImageProxy decorator](self, "decorator");
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

- (void)setIsLoading:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    if (!a3)
      -[TVImageProxy setDecoratorRequestToken:](self, "setDecoratorRequestToken:", 0);
  }
}

- (BOOL)isImageAvailable
{
  void *v2;
  BOOL v3;

  -[TVImageProxy _decoratedImageAssetPath](self, "_decoratedImageAssetPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  int64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  unsigned int v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  id v52[3];
  char v53;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD block[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id location[2];

  if (!-[TVImageProxy isLoading](self, "isLoading"))
  {
    +[_TVPagePerformanceController postNotificationForImageProxy:withLoadingStatus:](_TVPagePerformanceController, "postNotificationForImageProxy:withLoadingStatus:", self, 1);
    objc_initWeak(location, self);
    -[TVImageProxy _imageLoaderKey](self, "_imageLoaderKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVImageProxy imageLoader](self, "imageLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TVImageProxy imageLoader](self, "imageLoader");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVImageProxy object](self, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLForObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("imageKey://%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLWithString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[TVImageProxy requestLoader](self, "requestLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordForResource:withInitiator:", 3, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVImageProxy decorator](self, "decorator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[TVImageProxy _decoratedImageAssetPath](self, "_decoratedImageAssetPath");
    else
      -[TVImageProxy _originalImageAssetPath](self, "_originalImageAssetPath");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 && self->_writeToAssetLibrary)
    {
      objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "willSendRequest:", v13);

      if (self->_loadSynchronouslyIfCached)
      {
        +[TVImage imageWithPath:cacheImmediately:](TVImage, "imageWithPath:cacheImmediately:", v12, self->_cacheOnLoad);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v14, 1, v10);
        -[TVImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v14, 0, 1);
        -[TVImageProxy _callWriteCompletionHandlerWithPath:error:finished:](self, "_callWriteCompletionHandlerWithPath:error:finished:", v12, 0, 1);

LABEL_29:
        objc_destroyWeak(location);
        return;
      }
      objc_msgSend((id)objc_opt_class(), "_imageDecoratorQueue");
      v33 = objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __20__TVImageProxy_load__block_invoke;
      v63[3] = &unk_24EB86238;
      v31 = &v66;
      objc_copyWeak(&v66, location);
      v12 = v12;
      v64 = v12;
      v65 = v10;
      dispatch_async(v33, v63);

      v32 = v64;
LABEL_18:

      objc_destroyWeak(v31);
      goto LABEL_29;
    }
    -[TVImageProxy setIsLoading:](self, "setIsLoading:", 1);
    if (!v3)
    {
      dispatch_get_global_queue(0, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __20__TVImageProxy_load__block_invoke_2;
      block[3] = &unk_24EB85398;
      v31 = &v62;
      objc_copyWeak(&v62, location);
      v61 = v10;
      dispatch_async(v30, block);

      v32 = v61;
      goto LABEL_18;
    }
    -[TVImageProxy _originalImageAssetKey](self, "_originalImageAssetKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVImageProxy _decoratedImageAssetKey](self, "_decoratedImageAssetKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVImageProxy decorator](self, "decorator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[TVImageProxy decorator](self, "decorator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loaderScaleToSize");
      v20 = v19;
      v22 = v21;

      -[TVImageProxy decorator](self, "decorator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "loaderCropToFit");

      -[TVImageProxy _originalImageAssetPath](self, "_originalImageAssetPath");
      v25 = objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v7);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "willSendRequest:", v26);

        +[TVAssetLibrary sharedInstance](TVAssetLibrary, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "assetExpiryDateForKey:inGroupOfType:", v15, -[TVImageProxy groupType](self, "groupType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVImageProxy _decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:](self, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", 0, v25, v24, 0, v16, v28, *(double *)&v20, *(double *)&v22, v29, v10);

        v12 = (id)v25;
LABEL_28:

        goto LABEL_29;
      }
      v12 = 0;
    }
    else
    {
      LODWORD(v24) = 0;
      v20 = (void *)*MEMORY[0x24BDBF148];
      v22 = *(void **)(MEMORY[0x24BDBF148] + 8);
    }
    v54 = 0;
    v55 = (id *)&v54;
    v56 = 0x3042000000;
    v57 = __Block_byref_object_copy__2;
    v58 = __Block_byref_object_dispose__2;
    v47[0] = MEMORY[0x24BDAC760];
    v59 = 0;
    v47[2] = __20__TVImageProxy_load__block_invoke_28;
    v47[3] = &unk_24EB862F0;
    v47[1] = 3221225472;
    objc_copyWeak(v52, location);
    v51 = &v54;
    v45 = v15;
    v48 = v15;
    v49 = v3;
    v52[1] = v20;
    v52[2] = v22;
    v46 = v24;
    v53 = v24;
    v44 = v16;
    v50 = v16;
    v34 = (void *)MEMORY[0x22767F470](v47);
    -[TVImageProxy imageLoader](self, "imageLoader");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_respondsToSelector();

    if ((v36 & 1) != 0)
    {
      -[TVImageProxy imageLoader](self, "imageLoader");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVImageProxy object](self, "object");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[TVImageProxy imageDirection](self, "imageDirection");
      -[TVImageProxy requestLoader](self, "requestLoader");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v38, v46, v39, v40, v34, *(double *)&v20, *(double *)&v22);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[TVImageProxy imageLoader](self, "imageLoader");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_opt_respondsToSelector();

      -[TVImageProxy imageLoader](self, "imageLoader");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVImageProxy object](self, "object");
      if ((v43 & 1) != 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", v38, v24, -[TVImageProxy imageDirection](self, "imageDirection"), v34, *(double *)&v20, *(double *)&v22);
      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "loadImageForObject:scaleToSize:cropToFit:completionHandler:", v38, v24, v34, *(double *)&v20, *(double *)&v22);
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[TVImageProxy setRequestToken:](self, "setRequestToken:", v41);
    objc_storeWeak(v55 + 5, v41);

    objc_destroyWeak(v52);
    _Block_object_dispose(&v54, 8);
    objc_destroyWeak(&v59);
    v16 = v44;
    v15 = v45;
    goto LABEL_28;
  }
}

void __20__TVImageProxy_load__block_invoke(uint64_t a1)
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
    +[TVImage imageWithPath:cacheImmediately:](TVImage, "imageWithPath:cacheImmediately:", *(_QWORD *)(a1 + 32), WeakRetained[8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v4, 1, *(_QWORD *)(a1 + 40));
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
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 11, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

void __20__TVImageProxy_load__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 10, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", 0, 0, v2, 0, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "didFailWithError:", v2);

  }
}

void __20__TVImageProxy_load__block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
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
      v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

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
                dispatch_get_global_queue(0, 0);
                v23 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __20__TVImageProxy_load__block_invoke_2_31;
                block[3] = &unk_24EB862C8;
                v30 = (id)v11;
                v31 = *(id *)(a1 + 32);
                v32 = v16;
                v33 = v13;
                v34 = *(id *)(a1 + 40);
                dispatch_async(v23, block);

              }
            }
            v24 = *(unsigned __int8 *)(a1 + 88);
            v25 = *(_QWORD *)(a1 + 48);
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_decorateAndWriteImage:imagePath:scaleToSize:cropToFit:scalingResult:assetKey:expiryDate:tags:requestRecord:", v11, v12, v24, a5, v25, v13, *(double *)(a1 + 72), *(double *)(a1 + 80), v26, 0);

          }
          else
          {
            v27 = *(_QWORD *)(a1 + 48);
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", v11, v12, v14, v27, v13, v28, 0);

          }
        }
      }
    }
  }

}

void __20__TVImageProxy_load__block_invoke_2_31(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[TVAssetLibrary sharedInstance](TVAssetLibrary, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 48), "groupType");
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageAsset:forKey:inGroupOfType:expiryDate:tags:", v2, v3, v4, v5, v6);

}

+ (id)_imageDecoratorQueue
{
  if (_imageDecoratorQueue_onceToken != -1)
    dispatch_once(&_imageDecoratorQueue_onceToken, &__block_literal_global_21);
  return (id)_imageDecoratorQueue_sImageDecoratorQueue;
}

void __36__TVImageProxy__imageDecoratorQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.TVAssetLibrary.decoratorQueue", 0);
  v1 = (void *)_imageDecoratorQueue_sImageDecoratorQueue;
  _imageDecoratorQueue_sImageDecoratorQueue = (uint64_t)v0;

}

- (void)_decorateAndWriteImage:(id)a3 imagePath:(id)a4 scaleToSize:(CGSize)a5 cropToFit:(BOOL)a6 scalingResult:(unint64_t)a7 assetKey:(id)a8 expiryDate:(id)a9 tags:(id)a10 requestRecord:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  BOOL cacheOnLoad;
  _TVDecoratorRequest *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _TVDecoratorRequest *v31;
  id v32;
  id v33;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  _TVDecoratorRequest *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46[4];
  BOOL v47;
  BOOL v48;
  id location[2];

  height = a5.height;
  width = a5.width;
  v36 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  -[TVImageProxy decorator](self, "decorator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  cacheOnLoad = self->_cacheOnLoad;
  v24 = objc_alloc_init(_TVDecoratorRequest);
  -[TVImageProxy setDecoratorRequestToken:](self, "setDecoratorRequestToken:", v24);
  objc_initWeak(location, self);
  objc_msgSend((id)objc_opt_class(), "_imageDecoratorQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke;
  block[3] = &unk_24EB86360;
  objc_copyWeak(v46, location);
  v38 = v36;
  v39 = v17;
  v47 = cacheOnLoad;
  v46[1] = (id)a7;
  v46[2] = *(id *)&width;
  v46[3] = *(id *)&height;
  v48 = a6;
  v40 = v24;
  v41 = v22;
  v42 = v18;
  v43 = v19;
  v44 = v20;
  v45 = v21;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v22;
  v31 = v24;
  v32 = v17;
  v33 = v36;
  dispatch_async(v25, block);

  objc_destroyWeak(v46);
  objc_destroyWeak(location);
}

void __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1)
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
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      +[TVImage imageWithPath:cacheImmediately:](TVImage, "imageWithPath:cacheImmediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 128));
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if ((objc_msgSend(*(id *)(a1 + 48), "statusCancelled") & 1) != 0)
    {
      v6 = *(void **)(a1 + 88);
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 11, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "didFailWithError:", v7);

      }
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 104);
      if (v8 == 2)
      {
        v10 = (double *)(a1 + 112);
        v11 = (double *)(a1 + 120);
        v12 = *(_BYTE *)(a1 + 129) != 0;
      }
      else
      {
        v9 = v8 == 1;
        v10 = (double *)(a1 + 112);
        if (v9)
        {
          v11 = (double *)(a1 + 120);
        }
        else
        {
          v10 = (double *)MEMORY[0x24BDBF148];
          v11 = (double *)(MEMORY[0x24BDBF148] + 8);
        }
        v12 = 0;
      }
      objc_msgSend(*(id *)(a1 + 56), "decorate:scaledWithSize:croppedToFit:", v5, v12, *v10, *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2;
      block[3] = &unk_24EB86338;
      v17 = *(id *)(a1 + 48);
      v18 = v13;
      v19 = WeakRetained;
      v20 = *(id *)(a1 + 64);
      v21 = *(id *)(a1 + 72);
      v22 = *(id *)(a1 + 80);
      v23 = *(id *)(a1 + 88);
      v15 = v13;
      dispatch_async(v14, block);

    }
  }

}

void __124__TVImageProxy__decorateAndWriteImage_imagePath_scaleToSize_cropToFit_scalingResult_assetKey_expiryDate_tags_requestRecord___block_invoke_2(uint64_t a1)
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
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
      v2 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (id)v2;
    objc_msgSend(*(id *)(a1 + 48), "_completeImageLoadWithImage:imagePath:error:assetKey:expiryDate:tags:requestRecord:", *(_QWORD *)(a1 + 40), 0, v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

  }
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
  void *v25;
  void *v26;
  id imageDidWriteObserver;
  void *v28;
  void *v29;
  TVImageProxy *v30;
  id v31;
  id v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
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
    -[TVImageProxy completionHandler](self, "completionHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      if (v15)
      {
        v24 = v15;
      }
      else
      {
        +[TVImage imageWithPath:cacheImmediately:](TVImage, "imageWithPath:cacheImmediately:", v16, self->_cacheOnLoad);
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v29 = v24;
      -[TVImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v24, 0, 1);

    }
    +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v15, 1, v22);
    v30 = self;
    v31 = v16;
    v32 = 0;
LABEL_16:
    -[TVImageProxy _callWriteCompletionHandlerWithPath:error:finished:](v30, "_callWriteCompletionHandlerWithPath:error:finished:", v31, v32, 1);
LABEL_17:
    -[TVImageProxy setIsLoading:](self, "setIsLoading:", 0);
    goto LABEL_18;
  }
  if (!v15)
  {
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 11, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didFailWithError:", v33);

    }
    -[TVImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", 0, v17, 1);
    v30 = self;
    v31 = 0;
    v32 = v17;
    goto LABEL_16;
  }
  if (!self->_writeToAssetLibrary)
  {
    +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v15, 1, v21);
    -[TVImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v15, 0, 1);
    goto LABEL_17;
  }
  -[TVImageProxy writeCompletionHandler](self, "writeCompletionHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(MEMORY[0x24BDD1710]);
    v34 = CFSTR("ATVAssetDidWriteNotification");
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __99__TVImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke;
    v37[3] = &unk_24EB86388;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v35, "addObserverForName:object:queue:usingBlock:", CFSTR("ATVAssetDidWriteNotification"), v18, v36, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    imageDidWriteObserver = self->_imageDidWriteObserver;
    self->_imageDidWriteObserver = v26;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  if (self->_writeToAssetLibrary)
  {
    +[TVAssetLibrary sharedInstance](TVAssetLibrary, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setImageAsset:forKey:inGroupOfType:expiryDate:tags:", v15, v18, -[TVImageProxy groupType](self, "groupType"), v19, v20);

  }
  +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v15, 1, v22, v34);
  -[TVImageProxy _callCompletionHandlerWithImage:error:finished:](self, "_callCompletionHandlerWithImage:error:finished:", v15, 0, 1);
  if (!v25)
    goto LABEL_17;
LABEL_18:

}

void __99__TVImageProxy__completeImageLoadWithImage_imagePath_error_assetKey_expiryDate_tags_requestRecord___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_imageDidWriteHandler:", v5);

}

- (void)_imageDidWriteHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  TVImageProxy *v7;

  v7 = self;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TVImageProxy isLoading](v7, "isLoading"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ATVAssetDidWriteNotificationAssetPathKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ATVAssetDidWriteNotificationErrorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVImageProxy _callWriteCompletionHandlerWithPath:error:finished:](v7, "_callWriteCompletionHandlerWithPath:error:finished:", v5, v6, 1);

  }
  -[TVImageProxy setIsLoading:](v7, "setIsLoading:", 0);

}

- (id)_decoratorIdentifier
{
  void *v2;
  void *v3;

  -[TVImageProxy decorator](self, "decorator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decoratorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", CFSTR("_"));
    if (-[TVImageProxy imageDirection](self, "imageDirection"))
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

- (id)_imageLoaderKey
{
  void *v3;
  void *v4;
  void *v5;

  -[TVImageProxy imageLoader](self, "imageLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageKeyForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

  -[TVImageProxy _imageLoaderKey](self, "_imageLoaderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy _assetKeyWithImageLoaderKey:decoratorIdentifier:](self, "_assetKeyWithImageLoaderKey:decoratorIdentifier:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TVImageProxy allowsSubstitutionForOriginal](self, "allowsSubstitutionForOriginal"))
  {
    -[TVImageProxy _imageAssetPathWithAssetKey:](self, "_imageAssetPathWithAssetKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[TVAssetLibrary sharedInstance](TVAssetLibrary, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyForAssetWithTags:inGroupOfType:", v7, -[TVImageProxy groupType](self, "groupType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = v8;

        v4 = v9;
      }

    }
  }

  return v4;
}

- (id)_decoratedImageAssetKey
{
  void *v3;
  void *v4;
  void *v5;

  -[TVImageProxy _imageLoaderKey](self, "_imageLoaderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy _decoratorIdentifier](self, "_decoratorIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy _assetKeyWithImageLoaderKey:decoratorIdentifier:](self, "_assetKeyWithImageLoaderKey:decoratorIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_originalImageAssetPath
{
  void *v3;
  void *v4;

  -[TVImageProxy _originalImageAssetKey](self, "_originalImageAssetKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy _imageAssetPathWithAssetKey:](self, "_imageAssetPathWithAssetKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_decoratedImageAssetPath
{
  void *v3;
  void *v4;

  -[TVImageProxy _decoratedImageAssetKey](self, "_decoratedImageAssetKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVImageProxy _imageAssetPathWithAssetKey:](self, "_imageAssetPathWithAssetKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_imageAssetPathWithAssetKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    +[TVAssetLibrary sharedInstance](TVAssetLibrary, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetPathForKey:inGroupOfType:", v4, -[TVImageProxy groupType](self, "groupType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)cancel
{
  void *v3;
  id imageDidWriteObserver;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TVImageProxy *v9;

  if (-[TVImageProxy isLoading](self, "isLoading"))
  {
    v9 = self;
    if (v9->_imageDidWriteObserver)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:", v9->_imageDidWriteObserver);

      imageDidWriteObserver = v9->_imageDidWriteObserver;
      v9->_imageDidWriteObserver = 0;

    }
    -[TVImageProxy requestToken](v9, "requestToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TVImageProxy imageLoader](v9, "imageLoader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVImageProxy requestToken](v9, "requestToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelLoad:", v7);

      -[TVImageProxy setRequestToken:](v9, "setRequestToken:", 0);
    }
    -[TVImageProxy decoratorRequestToken](v9, "decoratorRequestToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStatusCancelled:", 1);

    -[TVImageProxy setDecoratorRequestToken:](v9, "setDecoratorRequestToken:", 0);
    -[TVImageProxy setIsLoading:](v9, "setIsLoading:", 0);
    -[TVImageProxy _callCompletionHandlerWithImage:error:finished:](v9, "_callCompletionHandlerWithImage:error:finished:", 0, 0, 0);
    -[TVImageProxy _callWriteCompletionHandlerWithPath:error:finished:](v9, "_callWriteCompletionHandlerWithPath:error:finished:", 0, 0, 0);

  }
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
  +[_TVPagePerformanceController postNotificationForImageProxy:withLoadingStatus:](_TVPagePerformanceController, "postNotificationForImageProxy:withLoadingStatus:", self, 0);
  -[TVImageProxy completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(v9, "copy");

  if (v10)
    ((void (**)(_QWORD, id, id, _BOOL8))v10)[2](v10, v11, v8, v5);

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
  -[TVImageProxy writeCompletionHandler](self, "writeCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(v9, "copy");

  if (v10)
    ((void (**)(_QWORD, id, id, _BOOL8))v10)[2](v10, v11, v8, v5);

}

- (id)object
{
  return self->_object;
}

- (id)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
  objc_storeStrong(&self->_imageLoader, a3);
}

- (BOOL)cacheOnLoad
{
  return self->_cacheOnLoad;
}

- (void)setCacheOnLoad:(BOOL)a3
{
  self->_cacheOnLoad = a3;
}

- (BOOL)allowsSubstitutionForOriginal
{
  return self->_allowsSubstitutionForOriginal;
}

- (void)setAllowsSubstitutionForOriginal:(BOOL)a3
{
  self->_allowsSubstitutionForOriginal = a3;
}

- (TVImageDecorator)decorator
{
  return self->_decorator;
}

- (void)setDecorator:(id)a3
{
  objc_storeStrong((id *)&self->_decorator, a3);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)writeCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setWriteCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setImageAvailable:(BOOL)a3
{
  self->_imageAvailable = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (int64_t)imageDirection
{
  return self->_imageDirection;
}

- (void)setImageDirection:(int64_t)a3
{
  self->_imageDirection = a3;
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(int64_t)a3
{
  self->_groupType = a3;
}

- (id)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong(&self->_requestToken, a3);
}

- (_TVDecoratorRequest)decoratorRequestToken
{
  return self->_decoratorRequestToken;
}

- (void)setDecoratorRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_decoratorRequestToken, a3);
}

- (id)imageDidWriteObserver
{
  return self->_imageDidWriteObserver;
}

- (void)setImageDidWriteObserver:(id)a3
{
  objc_storeStrong(&self->_imageDidWriteObserver, a3);
}

- (IKNetworkRequestLoader)requestLoader
{
  return (IKNetworkRequestLoader *)objc_loadWeakRetained((id *)&self->_requestLoader);
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

- (BOOL)writeToAssetLibrary
{
  return self->_writeToAssetLibrary;
}

- (void)setWriteToAssetLibrary:(BOOL)a3
{
  self->_writeToAssetLibrary = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestLoader);
  objc_storeStrong(&self->_imageDidWriteObserver, 0);
  objc_storeStrong((id *)&self->_decoratorRequestToken, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong(&self->_writeCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong(&self->_imageLoader, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)loadWithWeakObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, v6);
  objc_initWeak(&from, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__TVImageProxy_TVMLKitAdditions__loadWithWeakObject_completionHandler___block_invoke;
  v9[3] = &unk_24EB86698;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v10 = v8;
  -[TVImageProxy setCompletionHandler:](self, "setCompletionHandler:", v9);
  -[TVImageProxy load](self, "load");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __71__TVImageProxy_TVMLKitAdditions__loadWithWeakObject_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCompletionHandler:", 0);

  v9 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id, id, id, uint64_t))(v10 + 16))(v10, v9, v11, v7, a4);
  }

}

@end
