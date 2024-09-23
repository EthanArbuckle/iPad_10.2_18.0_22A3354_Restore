@implementation VUIMediaLibraryImageLoader

- (VUIMediaLibraryImageLoader)init
{
  VUIMediaLibraryImageLoader *v2;
  NSOperationQueue *v3;
  NSOperationQueue *imageLoadOperationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMediaLibraryImageLoader;
  v2 = -[VUIMediaLibraryImageLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    imageLoadOperationQueue = v2->_imageLoadOperationQueue;
    v2->_imageLoadOperationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_imageLoadOperationQueue, "setMaxConcurrentOperationCount:", 3);
  }
  return v2;
}

void __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "image");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "scalingResult");
      objc_msgSend(*(id *)(a1 + 32), "error");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
}

void __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "imageLoadContextsByImageIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "requestCount") - 1;
      objc_msgSend(v5, "setRequestCount:", v6);
      if (!v6)
      {
        objc_msgSend(v3, "imageLoadContextsByImageIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      }
    }

    objc_sync_exit(v3);
    WeakRetained = v8;
  }

}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  void *v17;
  VUIMediaLibraryImageLoader *v18;
  void *v19;
  VUIImageLoadContext *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location[2];

  v10 = a5;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  if (!v14)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("object"));
  -[VUIMediaLibraryImageLoader _imageLoadParamsForImageLoaderObject:](self, "_imageLoadParamsForImageLoaderObject:", v14);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryImageLoader _imageIdentifierWithImageLoadParams:](self, "_imageIdentifierWithImageLoadParams:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_scaledImageIdentifierWithImageIdentifier:scaleToSize:cropToFit:", v38, v10, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self;
  objc_sync_enter(v18);
  -[VUIMediaLibraryImageLoader imageLoadContextsByImageIdentifier](v18, "imageLoadContextsByImageIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v17);
  v20 = (VUIImageLoadContext *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[VUIImageLoadContext imageLoadOperation](v20, "imageLoadOperation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIMediaLibraryImageLoader _imageLoadOperationWithParams:scaleToSize:cropToFit:](v18, "_imageLoadOperationWithParams:scaleToSize:cropToFit:", v39, v10, width, height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(VUIImageLoadContext);
    -[VUIImageLoadContext setImageLoadOperation:](v20, "setImageLoadOperation:", v21);
    -[VUIMediaLibraryImageLoader imageLoadContextsByImageIdentifier](v18, "imageLoadContextsByImageIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v20, v17);

    -[VUIMediaLibraryImageLoader imageLoadOperationQueue](v18, "imageLoadOperationQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v21);

  }
  -[VUIImageLoadContext setRequestCount:](v20, "setRequestCount:", -[VUIImageLoadContext requestCount](v20, "requestCount") + 1);

  objc_sync_exit(v18);
  if (v21)
  {
    v37 = v14;
    objc_initWeak(location, v18);
    v24 = (void *)MEMORY[0x1E0CB34C8];
    v25 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v45[3] = &unk_1E9F9A938;
    objc_copyWeak(&v47, location);
    v46 = v17;
    objc_msgSend(v24, "blockOperationWithBlock:", v45);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addDependency:", v21);
    -[VUIMediaLibraryImageLoader imageLoadOperationQueue](v18, "imageLoadOperationQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addOperation:", v26);

    v28 = (void *)MEMORY[0x1E0CB34C8];
    v42[0] = v25;
    v42[1] = 3221225472;
    v42[2] = __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    v42[3] = &unk_1E9F99420;
    v44 = v16;
    v29 = v21;
    v43 = v29;
    objc_msgSend(v28, "blockOperationWithBlock:", v42);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addDependency:", v29);
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addOperation:", v30);

    objc_destroyWeak(&v47);
    objc_destroyWeak(location);
    v14 = v37;
  }
  else if (v16)
  {
    v32 = (void *)MEMORY[0x1E0CB34C8];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_3;
    v40[3] = &unk_1E9F98E68;
    v41 = v16;
    objc_msgSend(v32, "blockOperationWithBlock:", v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addOperation:", v33);

  }
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6978]), "initWithOperation:", v21);

  return v35;
}

- (NSOperationQueue)imageLoadOperationQueue
{
  return self->_imageLoadOperationQueue;
}

- (NSMutableDictionary)imageLoadContextsByImageIdentifier
{
  return self->_imageLoadContextsByImageIdentifier;
}

- (id)imageKeyForObject:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[VUIMediaLibraryImageLoader _imageLoadParamsForImageLoaderObject:](self, "_imageLoadParamsForImageLoaderObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaLibraryImageLoader _imageIdentifierWithImageLoadParams:](self, "_imageIdentifierWithImageLoadParams:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_imageIdentifierWithImageLoadParams:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VUIMediaLibraryImageLoader _imageLoaderIdentifier](self, "_imageLoaderIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_scaledImageIdentifierWithImageIdentifier:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "addObject:", v9);

  if (width != 0.0 && height != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lux%lu"), (unint64_t)width, (unint64_t)height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (v5)
    objc_msgSend(v10, "addObject:", CFSTR("crop"));
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[VUIMediaLibraryImageLoader _cancelAllImageLoads](self, "_cancelAllImageLoads");
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaLibraryImageLoader;
  -[VUIMediaLibraryImageLoader dealloc](&v3, sel_dealloc);
}

uint64_t __118__VUIMediaLibraryImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must be an instance of %@"), CFSTR("requestToken"), CFSTR("[VUIAsynchronousWorkToken class]"));
  objc_msgSend(v3, "cancel");

}

- (void)_cancelAllImageLoads
{
  id v2;

  -[VUIMediaLibraryImageLoader imageLoadOperationQueue](self, "imageLoadOperationQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllOperations");

}

- (id)_imageLoaderIdentifier
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclasses must override _imageLoaderIdentifier and not call super"));
  return 0;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclasses must override _imageLoadParamsForImageLoaderObject and not call super"));
  return 0;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclasses must override _imageLoadOperationWithParams and not call super"), a4.width, a4.height);
  return 0;
}

- (void)setImageLoadContextsByImageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadContextsByImageIdentifier, a3);
}

- (void)setImageLoadOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadOperationQueue, 0);
  objc_storeStrong((id *)&self->_imageLoadContextsByImageIdentifier, 0);
}

@end
