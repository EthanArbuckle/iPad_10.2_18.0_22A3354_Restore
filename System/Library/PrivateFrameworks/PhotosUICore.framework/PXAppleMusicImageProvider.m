@implementation PXAppleMusicImageProvider

- (id)imageCacheKeyForRequest:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 48, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("request.asset"), v18);
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 48, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("request.asset"), v18, v20);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v5, "targetSize");
  v8 = v7;
  v10 = v9;

  v11 = objc_alloc((Class)off_1E50B5CD8);
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithObjects:", v13);

  return v14;
}

- (id)createImageLoaderForRequest:(id)a3
{
  id v5;
  void *v6;
  _PXAppleMusicImageLoader *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _PXAppleMusicImageLoader *v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("request.asset"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("request.asset"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  v7 = [_PXAppleMusicImageLoader alloc];
  objc_msgSend(v5, "targetSize");
  v9 = v8;
  v11 = v10;

  v12 = -[_PXAppleMusicImageLoader initWithAsset:targetSize:](v7, "initWithAsset:targetSize:", v6, v9, v11);
  return v12;
}

- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 63, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("imageLoader"), v15);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 63, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("imageLoader"), v15, v17);

    goto LABEL_6;
  }
LABEL_3:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", objc_msgSend(v10, "image"));

  return v11;
}

@end
