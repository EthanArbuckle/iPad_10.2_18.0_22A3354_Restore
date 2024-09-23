@implementation PXFlexMusicImageProvider

- (PXFlexMusicImageProvider)init
{
  PXFlexMusicImageProvider *v2;
  uint64_t v3;
  OS_dispatch_queue *imageLoadingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXFlexMusicImageProvider;
  v2 = -[PXAudioAssetImageProvider init](&v6, sel_init);
  if (v2)
  {
    px_dispatch_queue_create_serial();
    v3 = objc_claimAutoreleasedReturnValue();
    imageLoadingQueue = v2->_imageLoadingQueue;
    v2->_imageLoadingQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)imageCacheKeyForRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  CGSize v23;

  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 83, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("request.asset"), v20);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 83, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("request.asset"), v20, v22);

    goto LABEL_6;
  }
LABEL_3:

  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "audioAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetSize");
  v12 = v11;
  v14 = v13;

  v23.width = v12;
  v23.height = v14;
  NSStringFromCGSize(v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)createImageLoaderForRequest:(id)a3
{
  id v5;
  void *v6;
  _PXFlexMusicImageLoader *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _PXFlexMusicImageLoader *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;

  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 94, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("request.asset"), v18);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 94, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("request.asset"), v18, v20);

    goto LABEL_6;
  }
LABEL_3:

  v7 = [_PXFlexMusicImageLoader alloc];
  objc_msgSend(v5, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetSize");
  v10 = v9;
  v12 = v11;

  -[PXFlexMusicImageProvider imageLoadingQueue](self, "imageLoadingQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_PXFlexMusicImageLoader initWithArtworkAsset:maxSize:sharedImageLoadingQueue:](v7, "initWithArtworkAsset:maxSize:sharedImageLoadingQueue:", v8, v13, v10, v12);

  return v14;
}

- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;

  v9 = a3;
  objc_msgSend(a4, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 99, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("request.asset"), v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 99, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("request.asset"), v17);
  }

LABEL_3:
  v11 = v9;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("imageLoader"), v22, v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicImageProvider.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("imageLoader"), v22);
  }

LABEL_5:
  v12 = (void *)objc_msgSend(v11, "image");
  objc_msgSend(v11, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v12);
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (OS_dispatch_queue)imageLoadingQueue
{
  return self->_imageLoadingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
}

@end
