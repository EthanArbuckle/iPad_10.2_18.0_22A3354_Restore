@implementation QSSTTSRequestFeatureFlags

- (QSSTTSRequestFeatureFlags)initWithFlatbuffData:(id)a3
{
  return -[QSSTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTTSRequestFeatureFlags)initWithFlatbuffData:(id)a3 root:(const TTSRequestFeatureFlags *)a4
{
  return -[QSSTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTTSRequestFeatureFlags)initWithFlatbuffData:(id)a3 root:(const TTSRequestFeatureFlags *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTTSRequestFeatureFlags *v10;
  QSSTTSRequestFeatureFlags *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TTSRequestFeatureFlags *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTTSRequestFeatureFlags *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTTSRequestFeatureFlags;
  v10 = -[QSSTTSRequestFeatureFlags init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_16;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const TTSRequestFeatureFlags *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_16;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v25 = v18;
      v26 = v19;
      v27 = xmmword_21E34D540;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::TTSRequestFeatureFlags *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TTSRequestFeatureFlags::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (BOOL)fe_feature
{
  const TTSRequestFeatureFlags *root;
  const TTSRequestFeatureFlags *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)fe_feature_only
{
  const TTSRequestFeatureFlags *root;
  const TTSRequestFeatureFlags *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)disable_prompts
{
  const TTSRequestFeatureFlags *root;
  const TTSRequestFeatureFlags *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)cache_only
{
  const TTSRequestFeatureFlags *root;
  const TTSRequestFeatureFlags *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)phoneset_type
{
  const TTSRequestFeatureFlags *root;
  const TTSRequestFeatureFlags *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::TTSRequestFeatureFlags>)addObjectToBuffer:(void *)a3
{
  QSSTTSRequestFeatureFlags *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v4 = self;
  v5 = -[QSSTTSRequestFeatureFlags fe_feature](self, "fe_feature");
  v6 = -[QSSTTSRequestFeatureFlags fe_feature_only](v4, "fe_feature_only");
  v7 = -[QSSTTSRequestFeatureFlags disable_prompts](v4, "disable_prompts");
  v8 = -[QSSTTSRequestFeatureFlags cache_only](v4, "cache_only");
  LODWORD(v4) = -[QSSTTSRequestFeatureFlags phoneset_type](v4, "phoneset_type");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v9 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 6, v6);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 8, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 10, v8);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, (int)v4);
  return (Offset<siri::speech::schema_fb::TTSRequestFeatureFlags>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v9);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TTSRequestFeatureFlags> v2;
  const char *v3;
  flatbuffers::FlatBufferBuilder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_21E34D550;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[QSSTTSRequestFeatureFlags addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__QSSTTSRequestFeatureFlags_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

flatbuffers::DetachedBuffer *__41__QSSTTSRequestFeatureFlags_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2207ADCC8);
  }
  return result;
}

@end
