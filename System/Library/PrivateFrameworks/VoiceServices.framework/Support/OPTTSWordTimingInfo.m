@implementation OPTTSWordTimingInfo

- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3
{
  return -[OPTTSWordTimingInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSWordTimingInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3 root:(const WordTimingInfo *)a4
{
  return -[OPTTSWordTimingInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSWordTimingInfo)initWithFlatbuffData:(id)a3 root:(const WordTimingInfo *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSWordTimingInfo *v10;
  OPTTSWordTimingInfo *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::WordTimingInfo *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  OPTTSWordTimingInfo *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSWordTimingInfo;
  v10 = -[OPTTSWordTimingInfo init](&v30, sel_init);
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
      a4 = (const WordTimingInfo *)v13 + *v13;
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
      v27 = xmmword_21AACED40;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::WordTimingInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::WordTimingInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)word
{
  const WordTimingInfo *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const WordTimingInfo *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v5 = *(unsigned int *)root->var0;
  }
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (unsigned)sample_idx
{
  const WordTimingInfo *root;
  const WordTimingInfo *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)offset
{
  const WordTimingInfo *root;
  const WordTimingInfo *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)length
{
  const WordTimingInfo *root;
  const WordTimingInfo *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (float)timestamp
{
  const WordTimingInfo *root;
  const WordTimingInfo *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xDu)
  {
    v5 = *(unsigned __int16 *)v3[12].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (Offset<siri::speech::schema_fb::WordTimingInfo>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  int v9;
  int v10;
  int v11;
  float v12;
  float v13;
  int v14;

  -[OPTTSWordTimingInfo word](self, "word");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24DD8EF88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  LODWORD(v7) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  v9 = -[OPTTSWordTimingInfo sample_idx](self, "sample_idx");
  v10 = -[OPTTSWordTimingInfo offset](self, "offset");
  v11 = -[OPTTSWordTimingInfo length](self, "length");
  -[OPTTSWordTimingInfo timestamp](self, "timestamp");
  v13 = v12;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v14 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v9);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v11);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 12, v13);
  return (Offset<siri::speech::schema_fb::WordTimingInfo>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v14);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::WordTimingInfo> v2;
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
  v13 = xmmword_21AACED50;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[OPTTSWordTimingInfo addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__OPTTSWordTimingInfo_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__35__OPTTSWordTimingInfo_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x220750954);
  }
  return result;
}

+ (id)vs_wordTimingInfos:(id)a3 withText:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  float v16;
  void *v17;
  unint64_t v18;
  id v19;
  int v20;
  float v21;
  void *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  v9 = 0x24BEC0000uLL;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        VSGetLogDefault();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v26 = objc_msgSend(v13, "offset");
          v25 = objc_msgSend(v13, "length");
          objc_msgSend(v13, "word");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v9;
          v19 = v7;
          v20 = objc_msgSend(v13, "sample_idx");
          objc_msgSend(v13, "timestamp");
          *(_DWORD *)buf = 134219010;
          v32 = v26;
          v33 = 2048;
          v34 = v25;
          v35 = 2112;
          v36 = v17;
          v37 = 1024;
          v38 = v20;
          v7 = v19;
          v9 = v18;
          v39 = 2048;
          v40 = (float)(v21 / 1000.0);
          _os_log_debug_impl(&dword_21AA84000, v14, OS_LOG_TYPE_DEBUG, "OPTTSTextToSpeechResponse word timing info, offset: %ld, length: %ld, word: %@, sampleIndex: %d, timestamp: %.2f", buf, 0x30u);

        }
        v15 = objc_alloc_init(*(Class *)(v9 + 3600));
        objc_msgSend(v15, "setTextRange:", objc_msgSend(v13, "offset"), objc_msgSend(v13, "length"));
        objc_msgSend(v13, "timestamp");
        objc_msgSend(v15, "setStartTime:", (float)(v16 / 1000.0));
        objc_msgSend(v6, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(v9 + 3600), "utf16TimingInfoWithUTF8Range:withText:", v6, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
