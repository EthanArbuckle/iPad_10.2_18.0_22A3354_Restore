@implementation TSDMetalTextureInfo

+ (id)textureInfoWithName:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 containsMipmaps:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:width:height:containsMipmaps:", v9, v8, v7, v6);

  return v10;
}

+ (id)textureInfoWithCGImage:(CGImage *)a3 forDevice:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = (objc_class *)MEMORY[0x24BDDDB48];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDevice:", v6);

  v11 = 0;
  v8 = (void *)objc_msgSend(v7, "newTextureWithCGImage:options:error:", a3, 0, &v11);
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:width:height:containsMipmaps:", v8, objc_msgSend(v8, "width"), objc_msgSend(v8, "height"), 0);

  return v9;
}

- (TSDMetalTextureInfo)initWithName:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 containsMipmaps:(BOOL)a6
{
  id v11;
  TSDMetalTextureInfo *v12;
  TSDMetalTextureInfo *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSDMetalTextureInfo;
  v12 = -[TSDMetalTextureInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_containsMipmaps = a6;
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_height = a5;
    v13->_width = a4;
  }

  return v13;
}

- (CGSize)size
{
  unint64_t v2;
  unint64_t v3;
  double v4;
  double v5;
  CGSize result;

  LODWORD(v3) = self->_height;
  LODWORD(v2) = self->_width;
  v4 = (double)v2;
  v5 = (double)v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)teardown
{
  MTLTexture *name;

  name = self->_name;
  self->_name = 0;

  self->_height = 0;
  self->_width = 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)TSDMetalTextureInfo;
  -[TSDMetalTextureInfo description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_containsMipmaps)
    v6 = CFSTR(", mipmapped");
  else
    v6 = &stru_24D82FEB0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {name:%d, size:(%d,%d)%@}"), v4, self->_name, self->_width, self->_height, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsMipmaps
{
  return self->_containsMipmaps;
}

- (MTLTexture)name
{
  return self->_name;
}

- (unsigned)height
{
  return self->_height;
}

- (unsigned)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
