@implementation OSASymbolInfo

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (id)get_uuid
{
  _BYTE v3[37];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  uuid_unparse_lower(self->_uuid, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)start
{
  return self->_start;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuArch, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->legacy_arch, 0);
}

- (void)setPath:(id)a3
{
  id v5;
  BOOL v6;

  objc_storeStrong((id *)&self->_path, a3);
  v5 = a3;
  v6 = +[OSABinaryImageCatalog isApplePath:orBundle:](OSABinaryImageCatalog, "isApplePath:orBundle:", v5, 0);

  self->_isAppleCode = v6;
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setCpuArch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OSASymbolInfo)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16]
{
  OSASymbolInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OSASymbolInfo;
  result = -[OSASymbolInfo init](&v9, sel_init);
  if (result)
  {
    if (a5)
      *(_OWORD *)result->_uuid = *(_OWORD *)a5;
    result->_start = a3;
    result->_size = a4;
  }
  return result;
}

- (OSASymbolInfo)initWithSharedCache:(unsigned __int8)a3[16] atBaseAddress:(unint64_t)a4
{
  char *v6;
  OSASymbolInfo *v7;
  char *v8;
  unint64_t v9;
  unint64_t start;
  BOOL v11;
  uint64_t v12;
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)OSASymbolInfo;
  v6 = -[OSASymbolInfo init](&v20, sel_init);
  v7 = (OSASymbolInfo *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = *(_OWORD *)a3;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 0;
    *((_QWORD *)v6 + 5) = a4;
    v8 = v6;
    dyld_shared_cache_iterate_text();
    v9 = v17[3];
    start = v7->_start;
    v11 = v9 > start;
    v12 = v9 - start;
    if (!v11)
      v12 = 0x40000000;
    *((_QWORD *)v8 + 6) = v12;

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v16, 8);
  }
  return v7;
}

_QWORD *__51__OSASymbolInfo_initWithSharedCache_atBaseAddress___block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(v2 + 40) - 1 >= v3)
  {
    *(_QWORD *)(v2 + 40) = v3;
    v3 = *(_QWORD *)(a2 + 8);
  }
  v4 = *(_QWORD *)(a2 + 16) + v3;
  v5 = *(_QWORD *)(result[5] + 8);
  if (v4 > *(_QWORD *)(v5 + 24))
    *(_QWORD *)(v5 + 24) = v4;
  ++*(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24);
  return result;
}

- (void)setStart:(unint64_t)a3
{
  self->_start = a3;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (BOOL)isAppleCode
{
  return self->_isAppleCode;
}

- (void)setIsAppleCode:(BOOL)a3
{
  self->_isAppleCode = a3;
}

- (NSString)cpuArch
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

@end
