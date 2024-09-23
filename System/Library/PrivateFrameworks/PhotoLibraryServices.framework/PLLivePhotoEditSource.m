@implementation PLLivePhotoEditSource

- (id)_initWithPhotoSource:(id)a3 videoComplement:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLLivePhotoEditSource *v14;
  id *p_isa;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEditSource.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photo != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEditSource.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("video != nil"));

LABEL_3:
  objc_msgSend(v8, "resolvedSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPIPhotoEditHelperClass_72665(), "livePhotoSourceWithPhotoSource:videoSource:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PLLivePhotoEditSource;
  v14 = -[PLEditSource initWithResolvedSource:mediaType:](&v19, sel_initWithResolvedSource_mediaType_, v13, 3);
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_photoEditSource, a3);
    objc_storeStrong(p_isa + 4, a4);
  }

  return p_isa;
}

- (PLEditSource)photoEditSource
{
  return self->_photoEditSource;
}

- (PLVideoEditSource)videoEditSource
{
  return self->_videoEditSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoEditSource, 0);
  objc_storeStrong((id *)&self->_photoEditSource, 0);
}

+ (id)livePhotoSourceWithPhotoURL:(id)a3 videoComplementURL:(id)a4
{
  id v6;
  id v7;
  PLPhotoEditSource *v8;
  PLVideoEditSource *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[PLPhotoEditSource initWithURL:type:image:useEmbeddedPreview:]([PLPhotoEditSource alloc], "initWithURL:type:image:useEmbeddedPreview:", v7, 0, 0, 0);

  v9 = -[PLVideoEditSource initWithVideoURL:]([PLVideoEditSource alloc], "initWithVideoURL:", v6);
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhotoSource:videoComplement:", v8, v9);

  return v10;
}

@end
