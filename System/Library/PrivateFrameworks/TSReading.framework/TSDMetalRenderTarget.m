@implementation TSDMetalRenderTarget

- (TSDMetalRenderTarget)initWithSize:(CGSize)a3 metalContext:(id)a4
{
  return -[TSDMetalRenderTarget initWithSize:metalContext:numberOfAttachments:](self, "initWithSize:metalContext:numberOfAttachments:", a4, 1, a3.width, a3.height);
}

- (TSDMetalRenderTarget)initWithSize:(CGSize)a3 metalContext:(id)a4 numberOfAttachments:(unint64_t)a5
{
  double height;
  double width;
  id v9;
  TSDMetalRenderTarget *v10;
  TSDMetalRenderTarget *v11;
  unint64_t v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  MTLRenderPassDescriptor *passDescriptor;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *textures;
  objc_super v30;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)TSDMetalRenderTarget;
  v10 = -[TSDMetalRenderTarget init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_size.width = width;
    v10->_size.height = height;
    if (a5 >= 4)
      v12 = 4;
    else
      v12 = a5;
    objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v9, "pixelFormat"), (unint64_t)width, (unint64_t)height, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUsage:", 5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v15 = objc_claimAutoreleasedReturnValue();
    passDescriptor = v11->_passDescriptor;
    v11->_passDescriptor = (MTLRenderPassDescriptor *)v15;

    if (v12)
    {
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend(v9, "device");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "newTextureWithDescriptor:", v13);

        -[NSArray addObject:](v14, "addObject:", v19);
        -[MTLRenderPassDescriptor colorAttachments](v11->_passDescriptor, "colorAttachments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTexture:", v19);

        -[MTLRenderPassDescriptor colorAttachments](v11->_passDescriptor, "colorAttachments");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setLoadAction:", 2);

        -[MTLRenderPassDescriptor colorAttachments](v11->_passDescriptor, "colorAttachments");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setStoreAction:", 1);

        -[MTLRenderPassDescriptor colorAttachments](v11->_passDescriptor, "colorAttachments");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", i);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

      }
    }
    textures = v11->_textures;
    v11->_textures = v14;

  }
  return v11;
}

- (void)setTextureLoadAction:(unint64_t)a3
{
  MTLRenderPassDescriptor *passDescriptor;
  void *v5;
  id v6;

  passDescriptor = self->_passDescriptor;
  if (passDescriptor)
  {
    -[MTLRenderPassDescriptor colorAttachments](passDescriptor, "colorAttachments");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLoadAction:", a3);

  }
}

- (void)setTextureLoadAction:(unint64_t)a3 atAttachmentIndex:(unint64_t)a4
{
  void *v7;
  id v8;

  if (self->_passDescriptor)
  {
    if (-[NSArray count](self->_textures, "count") > a4)
    {
      -[MTLRenderPassDescriptor colorAttachments](self->_passDescriptor, "colorAttachments");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLoadAction:", a3);

    }
  }
}

- (CATransform3D)orthoProjectionWithVerticalFlip:(SEL)a3
{
  double v4;
  double v5;
  double v6;
  double height;
  CATransform3D *result;

  if (a4)
  {
    v4 = 0.0;
    v5 = -1.0;
    v6 = 1.0;
    height = self->_size.height;
  }
  else
  {
    height = 0.0;
    v5 = -1.0;
    v6 = 1.0;
    v4 = self->_size.height;
  }
  TSDTransform3DMakeOrtho((uint64_t)retstr, 0.0, self->_size.width, height, v4, v5, v6);
  return result;
}

- (MTLTexture)texture
{
  return (MTLTexture *)-[TSDMetalRenderTarget textureAtAttachmentIndex:](self, "textureAtAttachmentIndex:", 0);
}

- (id)textureAtAttachmentIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSArray count](self->_textures, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalRenderTarget textureAtAttachmentIndex:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalRenderTarget.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 77, CFSTR("Attachment index %lu is out of bounds."), a3);

    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setClearColor:(id)a3
{
  MTLRenderPassDescriptor *passDescriptor;
  double var3;
  double var2;
  double var1;
  double var0;
  void *v8;
  id v9;

  passDescriptor = self->_passDescriptor;
  if (passDescriptor)
  {
    var3 = a3.var3;
    var2 = a3.var2;
    var1 = a3.var1;
    var0 = a3.var0;
    -[MTLRenderPassDescriptor colorAttachments](passDescriptor, "colorAttachments");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClearColor:", var0, var1, var2, var3);

  }
}

- (void)setClearColor:(id)a3 atAttachmentIndex:(unint64_t)a4
{
  double var3;
  double var2;
  double var1;
  double var0;
  void *v10;
  id v11;

  if (self->_passDescriptor)
  {
    var3 = a3.var3;
    var2 = a3.var2;
    var1 = a3.var1;
    var0 = a3.var0;
    if (-[NSArray count](self->_textures, "count") > a4)
    {
      -[MTLRenderPassDescriptor colorAttachments](self->_passDescriptor, "colorAttachments");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setClearColor:", var0, var1, var2, var3);

    }
  }
}

- (NSArray)textures
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (MTLRenderPassDescriptor)passDescriptor
{
  return (MTLRenderPassDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passDescriptor, 0);
  objc_storeStrong((id *)&self->_textures, 0);
}

@end
