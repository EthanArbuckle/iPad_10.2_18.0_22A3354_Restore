@implementation PXGUniform

- (PXGUniform)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGUniform.m"), 44, CFSTR("%s is not available as initializer"), "-[PXGUniform init]");

  abort();
}

- (PXGUniform)initWithName:(id)a3 type:(unint64_t)a4
{
  id v7;
  PXGUniform *v8;
  PXGUniform *v9;
  uint64_t v10;
  const void *p_floatValue;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGUniform;
  v8 = -[PXGUniform init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_type = a4;
    switch(a4)
    {
      case 0uLL:
        v10 = 4;
        p_floatValue = &v9->_floatValue;
        goto LABEL_8;
      case 1uLL:
        v10 = 8;
        p_floatValue = v9->_float2Value;
        goto LABEL_8;
      case 2uLL:
        v10 = 16;
        p_floatValue = v9->_float3Value;
        goto LABEL_8;
      case 3uLL:
        v10 = 16;
        p_floatValue = v9->_float4Value;
LABEL_8:
        v9->_bytesLength = v10;
        v9->_bytes = p_floatValue;
        break;
      case 4uLL:
      case 5uLL:
        v9->_bytesLength = 0;
        break;
      default:
        break;
    }
  }

  return v9;
}

- (void)setTextureProvider:(id)a3
{
  void *v4;
  id textureProvider;

  if (self->_textureProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    textureProvider = self->_textureProvider;
    self->_textureProvider = v4;

    -[PXGUniform setCachedTexture:](self, "setCachedTexture:", 0);
  }
}

- (unint64_t)bindType
{
  unint64_t v2;
  void *v4;
  void *v5;

  v2 = -[PXGUniform type](self, "type");
  if (v2 >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "PXGUniformBindType bindTypeForUniformType(PXGUniformType)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXGUniform.m"), 34, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return qword_24945FB00[v2];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGUniform name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXGUniform type](self, "type");
  if (v7 > 5)
    v8 = 0;
  else
    v8 = off_251A6EB48[v7];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; name:%@ type:%@>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEquivalentToUniform:(id)a3
{
  PXGUniform *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (PXGUniform *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    -[PXGUniform name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGUniform name](v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v7 = -[PXGUniform type](self, "type");
      v8 = v7 == -[PXGUniform type](v4, "type");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)parameterDeclarationWithBindingIndex:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v5 = -[PXGUniform bindType](self, "bindType");
  if (v5 == 1)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = -[PXGUniform type](self, "type");
    if (v10 > 5)
      v11 = 0;
    else
      v11 = off_251A6EB48[v10];
    -[PXGUniform name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@ [[ texture(%ld) ]]"), v11, v12, a3);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PXGUniform parameterDeclarationWithBindingIndex:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXGUniform.m"), 107, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = -[PXGUniform type](self, "type");
    if (v7 > 5)
      v8 = 0;
    else
      v8 = off_251A6EB48[v7];
    -[PXGUniform name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("constant %@ &%@ [[ buffer(%ld) ]]"), v8, v12, a3);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (__n128)encodableValue
{
  __n128 result;
  void *v5;
  void *v6;
  uint64_t v7;
  __n128 *v8;
  uint64_t v9;

  switch(-[__n128 type](a1, "type"))
  {
    case 0:
      result.n128_u32[0] = a1->n128_u32[2];
      return result;
    case 1:
      result.n128_u64[0] = a1[2].n128_u64[0];
      return result;
    case 2:
      return a1[5];
    case 3:
      return a1[6];
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = a2;
      v8 = a1;
      v9 = 126;
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = a2;
      v8 = a1;
      v9 = 129;
      break;
  }
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("PXGUniform.m"), v9, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)bindableTextureForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXGUniform *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;

  v4 = a3;
  if (-[PXGUniform bindType](self, "bindType") == 1)
  {
    -[PXGUniform cachedTexture](self, "cachedTexture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[PXGUniform cachedTexture](self, "cachedTexture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PXGUniform textureProvider](self, "textureProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = self;
      if (v8)
      {
        -[PXGUniform textureProvider](self, "textureProvider");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v10)[2](v10, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = self;
        v11 = v8;
      }
      else
      {
        v11 = 0;
      }
      -[PXGUniform setCachedTexture:](v9, "setCachedTexture:", v11);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)declaration
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[PXGUniform type](self, "type");
  if (v4 > 5)
    v5 = 0;
  else
    v5 = off_251A6EB48[v4];
  -[PXGUniform name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (void)setFloatValue:(float)a3
{
  self->_floatValue = a3;
}

- (double)float2Value
{
  return *(double *)(a1 + 32);
}

- (void)setFloat2Value:(PXGUniform *)self
{
  uint64_t v2;

  *(_QWORD *)self->_float2Value = v2;
}

- (__n128)float3Value
{
  return a1[5];
}

- (void)setFloat3Value:(PXGUniform *)self
{
  __int128 v2;

  *(_OWORD *)self->_float3Value = v2;
}

- (__n128)float4Value
{
  return a1[6];
}

- (void)setFloat4Value:(PXGUniform *)self
{
  __int128 v2;

  *(_OWORD *)self->_float4Value = v2;
}

- (CGImage)image
{
  return self->_image;
}

- (void)setImage:(CGImage *)a3
{
  self->_image = a3;
}

- (id)textureProvider
{
  return self->_textureProvider;
}

- (int64_t)bytesLength
{
  return self->_bytesLength;
}

- (const)bytes
{
  return self->_bytes;
}

- (MTLTexture)cachedTexture
{
  return self->_cachedTexture;
}

- (void)setCachedTexture:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTexture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTexture, 0);
  objc_storeStrong(&self->_textureProvider, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
