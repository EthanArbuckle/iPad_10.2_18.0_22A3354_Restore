@implementation PLPTPConversionSourceHints

- (PLPTPConversionSourceHints)initWithAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  id v8;
  PLPTPConversionSourceHints *v9;
  PLPTPConversionSourceHints *v10;
  void *v11;
  uint64_t v12;
  UTType *livePhotoImageContentType;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPTPConversionSourceHints;
  v9 = -[PLPTPConversionSourceHints init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isVideo = a4;
    v9->_isRender = a5;
    if (objc_msgSend(v8, "isPhotoIris"))
    {
      v10->_isLivePhoto = 1;
      if (a5)
        objc_msgSend(v8, "uniformTypeIdentifier");
      else
        objc_msgSend(v8, "originalUniformTypeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      livePhotoImageContentType = v10->_livePhotoImageContentType;
      v10->_livePhotoImageContentType = (UTType *)v12;

    }
  }

  return v10;
}

- (BOOL)livePhotoImageIsHEIC
{
  return self->_isLivePhoto
      && -[UTType conformsToType:](self->_livePhotoImageContentType, "conformsToType:", *MEMORY[0x1E0CEC508]);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isRender
{
  return self->_isRender;
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoImageContentType, 0);
}

+ (id)hintsForAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:isVideo:isRender:", v8, v6, v5);

  return v9;
}

@end
