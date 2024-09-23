@implementation OspreyZlibDataDecompressor

- (OspreyZlibDataDecompressor)init
{
  return -[OspreyZlibDataDecompressor initWithOptions:](self, "initWithOptions:", 15);
}

- (OspreyZlibDataDecompressor)initWithOptions:(int64_t)a3
{
  int v3;
  OspreyZlibDataDecompressor *v4;
  OspreyZlibDataDecompressor *v5;
  int v6;
  OspreyZlibDataDecompressor *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyZlibDataDecompressor;
  v4 = -[OspreyZlibDataDecompressor init](&v9, sel_init);
  v5 = v4;
  if (!v4
    || (v4->_inflateStream.zalloc = 0,
        v4->_inflateStream.zfree = 0,
        v4->_inflateStream.opaque = 0,
        v6 = inflateInit2_(&v4->_inflateStream, v3, "1.2.12", 112),
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

  inflateEnd(&self->_inflateStream);
  v3.receiver = self;
  v3.super_class = (Class)OspreyZlibDataDecompressor;
  -[OspreyZlibDataDecompressor dealloc](&v3, sel_dealloc);
}

- (id)decompressedDataForData:(id)a3 error:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  unsigned int v10;
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
    applier[2] = __60__OspreyZlibDataDecompressor_decompressedDataForData_error___block_invoke;
    applier[3] = &unk_1E7098200;
    applier[4] = self;
    applier[5] = &v15;
    applier[6] = &v19;
    dispatch_data_apply(v7, applier);
    if (a4)
    {
      v10 = *((_DWORD *)v16 + 6);
      if (v10 >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyCompressionErrorDomain"), (int)v10, 0);
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

uint64_t __60__OspreyZlibDataDecompressor_decompressedDataForData_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
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
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = inflate((z_streamp)(a1[4] + 8), 4);
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
    if (*(_DWORD *)(v6 + 40) || !*(_DWORD *)(v6 + 16))
      return 1;
  }
  return 0;
}

@end
