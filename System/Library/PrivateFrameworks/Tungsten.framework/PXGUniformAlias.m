@implementation PXGUniformAlias

- (PXGUniformAlias)initWithName:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGUniform.m"), 157, CFSTR("%s is not available as initializer"), "-[PXGUniformAlias initWithName:type:]");

  abort();
}

- (PXGUniformAlias)initWithIndex:(int64_t)a3 aliasing:(id)a4
{
  id v7;
  void *v8;
  PXGUniformAlias *v9;
  objc_super v11;

  v7 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PXGUniformAlias;
  v9 = -[PXGUniform initWithName:type:](&v11, sel_initWithName_type_, v8, objc_msgSend(v7, "type"));

  if (v9)
  {
    objc_storeStrong((id *)&v9->_original, a4);
    v9->_index = a3;
  }

  return v9;
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PXGUniformAlias original](self, "original");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@Alias%ld"), v5, -[PXGUniformAlias index](self, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGUniformAlias name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGUniformAlias original](self, "original");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; name:%@ original:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEquivalentToUniform:(id)a3
{
  PXGUniformAlias *v4;
  PXGUniformAlias *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  BOOL v12;
  int64_t v13;
  unint64_t v14;

  v4 = (PXGUniformAlias *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGUniformAlias original](self, "original");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PXGUniformAlias original](v5, "original");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v9)
      {

      }
      else
      {
        v10 = v9;
        v11 = objc_msgSend(v7, "isEqual:", v9);

        if ((v11 & 1) == 0)
          goto LABEL_11;
      }
      v13 = -[PXGUniformAlias index](self, "index");
      if (v13 == -[PXGUniformAlias index](v5, "index"))
      {
        v14 = -[PXGUniform type](self, "type");
        v12 = v14 == -[PXGUniform type](v5, "type");
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:
      v12 = 0;
      goto LABEL_12;
    }
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (float)floatValue
{
  void *v2;
  float v3;
  float v4;

  -[PXGUniformAlias original](self, "original");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (double)float2Value
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "original");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "float2Value");
  v3 = v2;

  return v3;
}

- (__n128)float3Value
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "original");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "float3Value");
  v4 = v2;

  return (__n128)v4;
}

- (__n128)float4Value
{
  void *v1;
  __int128 v2;
  __int128 v4;

  objc_msgSend(a1, "original");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "float4Value");
  v4 = v2;

  return (__n128)v4;
}

- (CGImage)image
{
  void *v2;
  CGImage *v3;

  -[PXGUniformAlias original](self, "original");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "image");

  return v3;
}

- (id)textureProvider
{
  void *v2;
  void *v3;

  -[PXGUniformAlias original](self, "original");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textureProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCachedTexture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGUniformAlias original](self, "original");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCachedTexture:", v4);

}

- (id)cachedTexture
{
  void *v2;
  void *v3;

  -[PXGUniformAlias original](self, "original");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)bytesLength
{
  void *v2;
  int64_t v3;

  -[PXGUniformAlias original](self, "original");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bytesLength");

  return v3;
}

- (const)bytes
{
  id v2;
  const void *v3;

  -[PXGUniformAlias original](self, "original");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const void *)objc_msgSend(v2, "bytes");

  return v3;
}

- (PXGUniform)original
{
  return self->_original;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
}

@end
