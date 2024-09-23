@implementation _UIImageAsyncCGImageContent

- (CGImage)CGImage
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  CGImage *v5;
  unint64_t *p_imageRef;
  CGImage *v7;
  SEL v8;

  if (!self)
    return (CGImage *)atomic_load((unint64_t *)&self->super._imageRef);
  v3 = (unsigned __int8 *)objc_getProperty(self, a2, 64, 1);
  if (!v3)
    return (CGImage *)atomic_load((unint64_t *)&self->super._imageRef);
  v4 = v3;
  v5 = CGImageRetain((CGImageRef)objc_msgSend(v3, "waitForImageRef"));
  p_imageRef = (unint64_t *)&self->super._imageRef;
  do
    v7 = (CGImage *)__ldaxr(p_imageRef);
  while (__stlxr((unint64_t)v5, p_imageRef));
  CGImageRelease(v7);
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)v4);
  self->_orientation = ((unint64_t)v4[64] >> 1) & 7;
  objc_setProperty_atomic(self, v8, 0, 64);

  return v5;
}

- (int64_t)orientation
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unint64_t v5;

  if (!self)
    return self->_orientation;
  v3 = (unsigned __int8 *)objc_getProperty(self, a2, 64, 1);
  if (!v3)
    return self->_orientation;
  v4 = v3;
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)v3);
  v5 = ((unint64_t)v4[64] >> 1) & 7;

  return v5;
}

- (_UIImageAsyncCGImageContent)initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6 cache:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  id v14;
  _UIImageAsyncCGImageContent *v15;
  id *v16;
  _UIOldCGImageDecompressor *decompressor;
  void *v19;
  objc_super v20;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1096, CFSTR("Need data"));

  }
  v20.receiver = self;
  v20.super_class = (Class)_UIImageAsyncCGImageContent;
  v15 = -[_UIImageContent initWithScale:](&v20, sel_initWithScale_, a5);
  if (v15)
  {
    v16 = -[_UIOldCGImageDecompressor initWithData:immediateLoadWithMaxSize:renderingIntent:cache:]((id *)[_UIOldCGImageDecompressor alloc], v14, (void *)a6, v7, width, height);
    decompressor = v15->_decompressor;
    v15->_decompressor = (_UIOldCGImageDecompressor *)v16;

  }
  return v15;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  const void *v7;

  if (self && (v3 = objc_getProperty(self, a2, 64, 1)) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "hash");

    return v5;
  }
  else
  {
    v7 = (const void *)atomic_load((unint64_t *)&self->super._imageRef);
    if (!v7)
      v7 = (const void *)*MEMORY[0x1E0C9B0D0];
    return CFHash(v7);
  }
}

- (id)typeName
{
  return CFSTR("async CGImage");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  if (self && (v3 = objc_getProperty(self, a2, 64, 1)) != 0)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p (decompressing) <%@:%p>>"), v6, self, objc_opt_class(), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIImageAsyncCGImageContent;
    -[_UIImageCGImageContent description](&v9, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  id Property;
  const char *v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!self ? (Property = 0) : (Property = objc_getProperty(self, v6, 64, 1)),
          (v9 = (unint64_t)Property, !v5) ? (v10 = 0) : (v10 = objc_getProperty(v5, v8, 64, 1)),
          v11 = (unint64_t)v10,
          v9 | v11))
    {
      v13 = (void *)v11;
      v14 = (id)v9;
      v15 = v13;
      v16 = v15;
      if (v14 == v15)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v14 && v15)
          v12 = objc_msgSend(v14, "isEqual:", v15);
      }

    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)_UIImageAsyncCGImageContent;
      v12 = -[_UIImageCGImageContent isEqual:](&v18, sel_isEqual_, v5);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isDecompressing
{
  if (self)
    self = (_UIImageAsyncCGImageContent *)objc_getProperty(self, a2, 64, 1);
  return self != 0;
}

- (BOOL)finishedDecompressing
{
  return self->_finishedDecompressing;
}

- (void)setFinishedDecompressing:(BOOL)a3
{
  self->_finishedDecompressing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decompressor, 0);
}

@end
