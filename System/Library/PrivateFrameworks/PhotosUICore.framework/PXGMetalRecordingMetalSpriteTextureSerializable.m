@implementation PXGMetalRecordingMetalSpriteTextureSerializable

- (PXGMetalRecordingMetalSpriteTextureSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGMetalRecordingMetalSpriteTextureSerializable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXGMetalRecordingMetalSpriteTextureSerializable;
  v5 = -[PXGMetalRecordingMetalSpriteTextureSerializable init](&v22, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("texture"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

    -[PXGMetalRecordingMetalSpriteTextureSerializable setTexture:](v5, "setTexture:", v8);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("size"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    -[PXGMetalRecordingMetalSpriteTextureSerializable setSize:](v5, "setSize:", v12, v15);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAtlas"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    -[PXGMetalRecordingMetalSpriteTextureSerializable setIsAtlas:](v5, "setIsAtlas:", v17);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pixelFormat"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v18;
    v20 = (int)objc_msgSend(v19, "intValue");

    -[PXGMetalRecordingMetalSpriteTextureSerializable setPixelFormat:](v5, "setPixelFormat:", v20);
  }

  return v5;
}

- (id)createSerializableObject
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("texture");
  v3 = -[PXGMetalRecordingMetalSpriteTextureSerializable texture](self, "texture");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = CFSTR("size");
  -[PXGMetalRecordingMetalSpriteTextureSerializable size](self, "size");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v9;
  v16[2] = CFSTR("isAtlas");
  v10 = -[PXGMetalRecordingMetalSpriteTextureSerializable isAtlas](self, "isAtlas");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  v16[3] = CFSTR("pixelFormat");
  v12 = -[PXGMetalRecordingMetalSpriteTextureSerializable pixelFormat](self, "pixelFormat");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)texture
{
  return self->_texture;
}

- (void)setTexture:(unint64_t)a3
{
  self->_texture = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)isAtlas
{
  return self->_isAtlas;
}

- (void)setIsAtlas:(BOOL)a3
{
  self->_isAtlas = a3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

@end
