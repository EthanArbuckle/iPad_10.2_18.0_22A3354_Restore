@implementation PXGMetalRecordingMetalSpriteTexture

- (PXGMetalRecordingMetalSpriteTexture)initWithTexture:(id)a3
{
  id v4;
  PXGMetalRecordingMetalSpriteTexture *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *textureAddress;
  void *v14;
  uint64_t v15;
  NSIndexSet *spriteIndexes;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGMetalRecordingMetalSpriteTexture;
  v5 = -[PXGMetalRecordingMetalSpriteTexture init](&v18, sel_init);
  if (v5)
  {
    v5->_isAtlas = objc_msgSend(v4, "isAtlas");
    objc_msgSend(v4, "texture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_width = objc_msgSend(v6, "width");

    objc_msgSend(v4, "texture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_height = objc_msgSend(v7, "height");

    objc_msgSend(v4, "texture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pixelFormat = objc_msgSend(v8, "pixelFormat");

    objc_msgSend(v4, "texture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mipmapLevelCount = objc_msgSend(v9, "mipmapLevelCount");

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "texture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    textureAddress = v5->_textureAddress;
    v5->_textureAddress = (NSNumber *)v12;

    objc_msgSend(v4, "spriteIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    spriteIndexes = v5->_spriteIndexes;
    v5->_spriteIndexes = (NSIndexSet *)v15;

  }
  return v5;
}

- (id)serializable
{
  PXGMetalRecordingMetalSpriteTextureSerializable *v3;
  void *v4;

  v3 = objc_alloc_init(PXGMetalRecordingMetalSpriteTextureSerializable);
  -[PXGMetalRecordingMetalSpriteTexture textureAddress](self, "textureAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGMetalRecordingMetalSpriteTextureSerializable setTexture:](v3, "setTexture:", objc_msgSend(v4, "unsignedIntegerValue"));

  -[PXGMetalRecordingMetalSpriteTextureSerializable setSize:](v3, "setSize:", (double)-[PXGMetalRecordingMetalSpriteTexture width](self, "width"), (double)-[PXGMetalRecordingMetalSpriteTexture height](self, "height"));
  -[PXGMetalRecordingMetalSpriteTextureSerializable setIsAtlas:](v3, "setIsAtlas:", -[PXGMetalRecordingMetalSpriteTexture isAtlas](self, "isAtlas"));
  -[PXGMetalRecordingMetalSpriteTextureSerializable setPixelFormat:](v3, "setPixelFormat:", -[PXGMetalRecordingMetalSpriteTexture pixelFormat](self, "pixelFormat"));
  return v3;
}

- (NSNumber)textureAddress
{
  return self->_textureAddress;
}

- (BOOL)isAtlas
{
  return self->_isAtlas;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (NSIndexSet)spriteIndexes
{
  return self->_spriteIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndexes, 0);
  objc_storeStrong((id *)&self->_textureAddress, 0);
}

@end
