@implementation _UIImageContentRendition

- (void)dealloc
{
  CGImage *CGImage;
  objc_super v4;

  CGImage = self->_CGImage;
  if (CGImage)
    CGImageRelease(CGImage);
  v4.receiver = self;
  v4.super_class = (Class)_UIImageContentRendition;
  -[_UIImageContentRendition dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
  objc_storeStrong((id *)&self->_multiplyColor, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_rbSymbolConfig, 0);
}

+ (id)renditionWithResult:(void *)a3 color:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[_UIImageContentRendition renditionWithResult:color:effects:](v6, v5, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)CGImage
{
  uint64_t v1;
  uint64_t (**v2)(void);
  CGImage *v3;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 8);
    if (!result)
    {
      -[_UIImageContentRenditionResult CGImageProvider](*(_QWORD **)(v1 + 32));
      v2 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v3 = (CGImage *)v2[2]();
      *(_QWORD *)(v1 + 8) = CGImageRetain(v3);

      return *(_QWORD *)(v1 + 8);
    }
  }
  return result;
}

+ (id)renditionWithResult:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  +[_UIImageContentRendition renditionWithResult:color:](v3, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)renditionWithResult:(void *)a3 color:(void *)a4 effects:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = objc_opt_self();
  +[_UIImageContentRendition renditionWithResult:color:effects:drawMode:](v9, v8, v7, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)renditionWithResult:(void *)a3 color:(void *)a4 effects:(int)a5 drawMode:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_opt_self();
  v11 = objc_opt_new();
  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v8;
  v13 = v8;

  v14 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v15 = v9;

  v16 = *(void **)(v11 + 48);
  *(_QWORD *)(v11 + 48) = v10;

  *(_DWORD *)(v11 + 24) = a5;
  return (id)v11;
}

- (uint64_t)drawInContext:(uint64_t)result
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    if (v1)
    {
      result = *(_QWORD *)(v1 + 24);
      if (result)
        return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (_QWORD)rbSymbolConfiguration
{
  _QWORD *v1;
  void *v2;
  void (**v3)(void);
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      -[_UIImageContentRenditionResult rbSymbolConfigurationProvider]((_QWORD *)a1[4]);
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[2];
      v1[2] = v4;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

@end
