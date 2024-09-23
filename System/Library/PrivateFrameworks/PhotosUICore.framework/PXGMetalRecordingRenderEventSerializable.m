@implementation PXGMetalRecordingRenderEventSerializable

- (PXGMetalRecordingRenderEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGMetalRecordingRenderEventSerializable *v5;
  id v6;
  PXGMetalRecordingMetalSpriteTextureSerializable *v7;
  void *v8;
  uint64_t v9;
  PXGMetalRecordingMetalSpriteTextureSerializable *texture;
  void *v11;
  void *v12;
  NSUInteger v13;
  void *v14;
  NSUInteger v15;
  id v16;
  float v17;
  float v18;
  id v19;
  id v20;
  uint64_t v21;
  NSArray *spriteIndices;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXGMetalRecordingRenderEventSerializable;
  v5 = -[PXGMetalRecordingRenderEventSerializable init](&v24, sel_init);
  if (v5)
  {
    v6 = v4;
    v7 = [PXGMetalRecordingMetalSpriteTextureSerializable alloc];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("texture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXGMetalRecordingMetalSpriteTextureSerializable initWithSerializableObject:](v7, "initWithSerializableObject:", v8);
    texture = v5->_texture;
    v5->_texture = (PXGMetalRecordingMetalSpriteTextureSerializable *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bufferRange"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntValue");

    v5->_bufferRange.location = v13;
    v5->_bufferRange.length = v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zPosition"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    v5->_zPosition = v18;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentsGravity"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v19, "unsignedIntValue");

    v5->_contentsGravity = v12;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isOpaque"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v20, "BOOLValue");

    v5->_isOpaque = (char)v12;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteIndices"));
    v21 = objc_claimAutoreleasedReturnValue();

    spriteIndices = v5->_spriteIndices;
    v5->_spriteIndices = (NSArray *)v21;

  }
  return v5;
}

- (id)createSerializableObject
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("texture");
  -[PXGMetalRecordingRenderEventSerializable texture](self, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createSerializableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = CFSTR("bufferRange");
  v5 = -[PXGMetalRecordingRenderEventSerializable bufferRange](self, "bufferRange");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20[1] = v10;
  v19[2] = CFSTR("zPosition");
  -[PXGMetalRecordingRenderEventSerializable zPosition](self, "zPosition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  v19[3] = CFSTR("contentsGravity");
  v12 = -[PXGMetalRecordingRenderEventSerializable contentsGravity](self, "contentsGravity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  v19[4] = CFSTR("isOpaque");
  v14 = -[PXGMetalRecordingRenderEventSerializable isOpaque](self, "isOpaque");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v15;
  v19[5] = CFSTR("spriteIndices");
  -[PXGMetalRecordingRenderEventSerializable spriteIndices](self, "spriteIndices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (PXGMetalRecordingMetalSpriteTextureSerializable)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- (_NSRange)bufferRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_bufferRange.length;
  location = self->_bufferRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setBufferRange:(_NSRange)a3
{
  self->_bufferRange = a3;
}

- (float)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(float)a3
{
  self->_zPosition = a3;
}

- (unsigned)contentsGravity
{
  return self->_contentsGravity;
}

- (void)setContentsGravity:(unsigned __int8)a3
{
  self->_contentsGravity = a3;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (NSArray)spriteIndices
{
  return self->_spriteIndices;
}

- (void)setSpriteIndices:(id)a3
{
  objc_storeStrong((id *)&self->_spriteIndices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndices, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
