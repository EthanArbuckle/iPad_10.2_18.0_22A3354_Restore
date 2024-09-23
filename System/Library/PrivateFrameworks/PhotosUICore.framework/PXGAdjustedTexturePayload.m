@implementation PXGAdjustedTexturePayload

- (PXGAdjustedTexturePayload)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTextureManager.mm"), 1927, CFSTR("%s is not available as initializer"), "-[PXGAdjustedTexturePayload init]");

  abort();
}

- (PXGAdjustedTexturePayload)initWithTexture:(id)a3 adjustment:(id)a4 mipmaps:(BOOL)a5
{
  id v9;
  id v10;
  PXGAdjustedTexturePayload *v11;
  PXGAdjustedTexturePayload *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGAdjustedTexturePayload;
  v11 = -[PXGAdjustedTexturePayload init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_texture, a3);
    objc_storeStrong((id *)&v12->_adjustment, a4);
    v12->_mipmaps = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[PXGAdjustedTexturePayload texture](self, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXGAdjustedTexturePayload adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = (v6 ^ v4) + -[PXGAdjustedTexturePayload mipmaps](self, "mipmaps");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "texture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGAdjustedTexturePayload texture](self, "texture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = objc_msgSend(v6, "mipmaps");
    v11 = -[PXGAdjustedTexturePayload mipmaps](self, "mipmaps");
    objc_msgSend(v6, "adjustment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      || (-[PXGAdjustedTexturePayload adjustment](self, "adjustment"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v6, "adjustment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGAdjustedTexturePayload adjustment](self, "adjustment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v12)
      {
LABEL_9:

        v16 = v9 & v15 & (v10 ^ v11 ^ 1);
        goto LABEL_10;
      }
    }
    else
    {
      v15 = 1;
    }

    goto LABEL_9;
  }
  v16 = 0;
LABEL_10:

  return v16;
}

- (PXGImageTexture)texture
{
  return self->_texture;
}

- (PXGDisplayAssetAdjustment)adjustment
{
  return self->_adjustment;
}

- (BOOL)mipmaps
{
  return self->_mipmaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
