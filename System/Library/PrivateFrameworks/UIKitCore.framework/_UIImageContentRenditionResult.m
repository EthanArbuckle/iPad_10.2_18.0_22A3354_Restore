@implementation _UIImageContentRenditionResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_drawingProvider, 0);
  objc_storeStrong(&self->_configProvider, 0);
  objc_storeStrong(&self->_imageProvider, 0);
}

+ (_QWORD)resultWithDrawingProvider:(void *)a3 CGImageProvider:(void *)a4 rbSymbolConfigurationProvider:
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_opt_self();
  v9 = (_QWORD *)objc_opt_new();
  v10 = _Block_copy(v8);

  v11 = (void *)v9[3];
  v9[3] = v10;

  v12 = _Block_copy(v7);
  v13 = (void *)v9[1];
  v9[1] = v12;

  v14 = _Block_copy(v6);
  v15 = (void *)v9[2];
  v9[2] = v14;

  return v9;
}

- (_QWORD)resultWithCGImageProvider:(uint64_t)a1
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v3 = a2;
    v4 = (_QWORD *)objc_opt_new();
    v5 = _Block_copy(*(const void **)(a1 + 24));
    v6 = (void *)v4[3];
    v4[3] = v5;

    v7 = _Block_copy(v3);
    v8 = (void *)v4[1];
    v4[1] = v7;

    v9 = _Block_copy(*(const void **)(a1 + 16));
    v10 = (void *)v4[2];
    v4[2] = v9;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_QWORD)CGImageProvider
{
  const void *v1;

  if (a1)
  {
    if (a1[1])
      v1 = (const void *)a1[1];
    else
      v1 = &__block_literal_global_655;
    a1 = _Block_copy(v1);
  }
  return a1;
}

- (_QWORD)rbSymbolConfigurationProvider
{
  const void *v1;

  if (a1)
  {
    if (a1[2])
      v1 = (const void *)a1[2];
    else
      v1 = &__block_literal_global_27_4;
    a1 = _Block_copy(v1);
  }
  return a1;
}

@end
