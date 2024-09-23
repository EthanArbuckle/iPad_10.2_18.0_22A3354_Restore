@implementation OspreyZlibDataCompressor

- (OspreyZlibDataCompressor)init
{
  return -[OspreyZlibDataCompressor initWithOptions:](self, "initWithOptions:", 15);
}

- (OspreyZlibDataCompressor)initWithOptions:(int64_t)a3
{
  int v3;
  OspreyZlibDataCompressor *v4;
  OspreyZlibDataCompressor *v5;
  int v6;
  OspreyZlibDataCompressor *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyZlibDataCompressor;
  v4 = -[OspreyZlibDataCompressor init](&v9, sel_init);
  v5 = v4;
  if (!v4
    || (v4->_deflateStream.zalloc = 0,
        v4->_deflateStream.zfree = 0,
        v4->_deflateStream.opaque = 0,
        v6 = deflateInit2_(&v4->_deflateStream, 9, 8, v3, 8, 0, "1.2.12", 112),
        v7 = 0,
        !v6))
  {
    v7 = v5;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  deflateEnd(&self->_deflateStream);
  v3.receiver = self;
  v3.super_class = (Class)OspreyZlibDataCompressor;
  -[OspreyZlibDataCompressor dealloc](&v3, sel_dealloc);
}

- (id)compressedDataForData:(id)a3 error:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD applier[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = v6;
  if (v6 && dispatch_data_get_size(v6))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v8 = (void *)MEMORY[0x1E0C80D00];
    v9 = MEMORY[0x1E0C80D00];
    v24 = v8;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __56__OspreyZlibDataCompressor_compressedDataForData_error___block_invoke;
    applier[3] = &unk_1E7098200;
    applier[4] = self;
    applier[5] = &v15;
    applier[6] = &v19;
    dispatch_data_apply(v7, applier);
    if (*((_DWORD *)v16 + 6) >= 2u)
    {
      v10 = (void *)v20[5];
      v20[5] = 0;

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyCompressionErrorDomain"), *((int *)v16 + 6), 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v11 = (id)v20[5];
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C80D00];
    v12 = MEMORY[0x1E0C80D00];
  }

  return v11;
}

uint64_t __56__OspreyZlibDataCompressor_compressedDataForData_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  NSObject *v7;
  dispatch_data_t concat;
  uint64_t v9;
  void *v10;

  *(_QWORD *)(a1[4] + 8) = a4;
  *(_DWORD *)(a1[4] + 16) = a5;
  v6 = a1[4];
  while (1)
  {
    *(_QWORD *)(v6 + 32) = v6 + 120;
    *(_DWORD *)(a1[4] + 40) = 0x2000;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = deflate((z_streamp)(a1[4] + 8), 4);
    if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > 1u)
      break;
    v7 = dispatch_data_create((const void *)(a1[4] + 120), 0x2000 - *(unsigned int *)(a1[4] + 40), 0, 0);
    concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = concat;

    if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
      break;
    v6 = a1[4];
    if (*(_DWORD *)(v6 + 40))
      return 1;
  }
  return 0;
}

@end
