@implementation KtraceLoggingDataSource

- (void)dealloc
{
  objc_super v3;

  -[KtraceLoggingDataSource set_metadata:](self, "set_metadata:", 0);
  v3.receiver = self;
  v3.super_class = (Class)KtraceLoggingDataSource;
  -[KtraceLoggingDataSource dealloc](&v3, sel_dealloc);
}

- (KtraceLoggingDataSource)initWithKtraceFile:(ktrace_file *)a3
{
  KtraceLoggingDataSource *v4;
  KtraceLoggingDataSource *v5;
  uint64_t v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KtraceLoggingDataSource;
  v4 = -[KtraceLoggingDataSource init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v4->_ktfile = a3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __46__KtraceLoggingDataSource_initWithKtraceFile___block_invoke;
    v8[3] = &unk_1E5F6FFD0;
    v8[4] = v4;
    if (ktrace_file_iterate((uint64_t)a3, 0, (uint64_t)v8) || !v5->_metadata)
    {
      -[KtraceLoggingDataSource set_metadata:](v5, "set_metadata:", 0);
      return 0;
    }
  }
  return v5;
}

BOOL __46__KtraceLoggingDataSource_initWithKtraceFile___block_invoke(uint64_t a1, uint64_t *a2)
{
  int v4;
  size_t v5;
  void *v6;
  void *v7;

  v4 = ktrace_chunk_tag((uint64_t)a2);
  if (v4 == 32786)
  {
    v5 = ktrace_chunk_size_t(a2);
    v6 = malloc_type_malloc(v5, 0x21B70593uLL);
    if (!v6)
      ktrace_remotetime_update_params_cold_1();
    v7 = v6;
    if (ktrace_chunk_copy_data(a2, 0, v6, v5))
      free(v7);
    else
      objc_msgSend(*(id *)(a1 + 32), "set_metadata:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v7, v5));
  }
  return v4 != 32786;
}

- (id)nextEventDataChunk
{
  ktrace_chunk *nextChunk;
  ktrace_file *ktfile;
  int v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  ktfile = self->_ktfile;
  nextChunk = self->_nextChunk;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__KtraceLoggingDataSource_nextEventDataChunk__block_invoke;
  v7[3] = &unk_1E5F6FFF8;
  v7[4] = self;
  v7[5] = &v8;
  v4 = ktrace_file_iterate((uint64_t)ktfile, nextChunk, (uint64_t)v7);
  v5 = (void *)v9[5];
  if (v4)
  {

    v5 = 0;
    v9[5] = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __45__KtraceLoggingDataSource_nextEventDataChunk__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  size_t v5;
  void *v6;
  void *v7;
  uint64_t result;
  uint64_t v9;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 0;
    return 1;
  }
  if (ktrace_chunk_tag((uint64_t)a2) != 32785)
    return 1;
  v5 = ktrace_chunk_size_t(a2);
  v6 = malloc_type_malloc(v5, 0x20EE61B2uLL);
  if (!v6)
    ktrace_remotetime_update_params_cold_1();
  v7 = v6;
  if (ktrace_chunk_copy_data(a2, 0, v6, v5))
  {
    free(v7);
    return 0;
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v7, v5);
    result = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v9;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
  return result;
}

- (id)metadataChunk
{
  return self->_metadata;
}

- (ktrace_file)_ktfile
{
  return self->_ktfile;
}

- (void)set_ktfile:(ktrace_file *)a3
{
  self->_ktfile = a3;
}

- (ktrace_chunk)_nextChunk
{
  return self->_nextChunk;
}

- (void)set_nextChunk:(ktrace_chunk *)a3
{
  self->_nextChunk = a3;
}

- (NSData)_metadata
{
  return self->_metadata;
}

- (void)set_metadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)_skipFirst
{
  return self->_skipFirst;
}

- (void)set_skipFirst:(BOOL)a3
{
  self->_skipFirst = a3;
}

@end
