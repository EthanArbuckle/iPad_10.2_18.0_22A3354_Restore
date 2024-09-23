@implementation TXRDeferredTextureInfo

- (TXRDeferredTextureInfo)initWithMipmapLevelCount:(unint64_t)a3 arrayLength:(unint64_t)a4 cubemap:(BOOL)a5
{
  _BOOL8 v5;
  TXRDeferredTextureInfo *v8;
  uint64_t v9;
  NSMutableArray *mipmaps;
  TXRDeferredMipmapInfo *v11;
  TXRDeferredMipmapInfo *v12;
  objc_super v14;

  v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TXRDeferredTextureInfo;
  v8 = -[TXRDeferredTextureInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    mipmaps = v8->_mipmaps;
    v8->_mipmaps = (NSMutableArray *)v9;

    if (a3)
    {
      v11 = 0;
      do
      {
        v12 = v11;
        v11 = -[TXRDeferredMipmapInfo initWithArrayLength:cubemap:]([TXRDeferredMipmapInfo alloc], "initWithArrayLength:cubemap:", a4, v5);

        -[NSMutableArray addObject:](v8->_mipmaps, "addObject:", v11);
        --a3;
      }
      while (a3);

    }
  }
  return v8;
}

- (TXRTextureInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (NSMutableArray)mipmaps
{
  return self->_mipmaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mipmaps, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
