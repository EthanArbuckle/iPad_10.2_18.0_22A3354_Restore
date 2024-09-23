@implementation PXGMetalRenderPassState

- ($3BA783FF50B239963188BE194EBFFEBA)textureInfos
{
  return self->_textureInfos;
}

- (unsigned)spriteIndexes
{
  return self->_spriteIndexes;
}

- (MTLBuffer)spriteTextureInfosMetalBuffer
{
  return self->_spriteTextureInfosMetalBuffer;
}

- (MTLBuffer)spriteIndexesMetalBuffer
{
  return self->_spriteIndexesMetalBuffer;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (PXGMetalRenderPassState)initWithDevice:(id)a3 capacity:(int64_t)a4
{
  id v7;
  PXGMetalRenderPassState *v8;
  PXGMetalRenderPassState *v9;
  uint64_t v10;
  MTLBuffer *spriteIndexesMetalBuffer;
  uint64_t v12;
  MTLBuffer *spriteTextureInfosMetalBuffer;
  MTLBuffer *v14;
  PXGMetalRenderPassState *v15;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGMetalRenderPassState;
  v8 = -[PXGMetalRenderPassState init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_capacity = a4;
    v10 = objc_msgSend(v7, "newBufferWithLength:options:", 4 * a4, 0);
    spriteIndexesMetalBuffer = v9->_spriteIndexesMetalBuffer;
    v9->_spriteIndexesMetalBuffer = (MTLBuffer *)v10;

    v12 = objc_msgSend(v7, "newBufferWithLength:options:", a4 << 6, 0);
    spriteTextureInfosMetalBuffer = v9->_spriteTextureInfosMetalBuffer;
    v9->_spriteTextureInfosMetalBuffer = (MTLBuffer *)v12;

    v14 = v9->_spriteIndexesMetalBuffer;
    if (!v14 || !v9->_spriteTextureInfosMetalBuffer)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v9->_spriteIndexes = (unsigned int *)-[MTLBuffer contents](v14, "contents");
    v9->_textureInfos = ($3BA783FF50B239963188BE194EBFFEBA *)-[MTLBuffer contents](v9->_spriteTextureInfosMetalBuffer, "contents");
  }
  v15 = v9;
LABEL_7:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_spriteTextureInfosMetalBuffer, 0);
  objc_storeStrong((id *)&self->_spriteIndexesMetalBuffer, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; capacity:%ld>"), v5, self, self->_capacity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MTLDevice)device
{
  return self->_device;
}

@end
