@implementation _PXGMediaRequestToken

- (_PXGMediaRequestToken)initWithMediaProvider:(id)a3 mediaRequestID:(int64_t)a4
{
  id v8;
  _PXGMediaRequestToken *v9;
  _PXGMediaRequestToken *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (v8)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDisplayAssetTextureProvider.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDisplayAssetTextureProvider.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaRequestID != PXInvalidMediaRequestID"));

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)_PXGMediaRequestToken;
  v9 = -[_PXGMediaRequestToken init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProvider, a3);
    v10->_mediaRequestID = a4;
  }

  return v10;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (int64_t)mediaRequestID
{
  return self->_mediaRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

@end
