@implementation OPTTSTextToSpeechRequestContext

- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRequestContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRequestContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4
{
  return -[OPTTSTextToSpeechRequestContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechRequestContext)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequestContext *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechRequestContext *v10;
  OPTTSTextToSpeechRequestContext *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TextToSpeechRequestContext *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  OPTTSTextToSpeechRequestContext *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSTextToSpeechRequestContext;
  v10 = -[OPTTSTextToSpeechRequestContext init](&v30, sel_init);
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
      a4 = (const TextToSpeechRequestContext *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechRequestContext *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechRequestContext::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)context_info
{
  void *v3;
  const TextToSpeechRequestContext *root;
  const TextToSpeechRequestContext *v5;
  uint64_t v6;
  const TextToSpeechRequestContext *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechRequestContext *v10;
  uint64_t v11;
  OPTTSTextToSpeechRequest_ContextInfoEntry *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        v10 = &v7[v8 + 4];
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            v12 = -[OPTTSTextToSpeechRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([OPTTSTextToSpeechRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_info"));
  }
  return (NSArray *)v3;
}

- (NSString)dialog_identifier
{
  const TextToSpeechRequestContext *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequestContext *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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

- (Offset<siri::speech::schema_fb::TextToSpeechRequestContext>)addObjectToBuffer:(void *)a3
{
  void *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  int v20;
  void *v21;
  unsigned int v22;
  __CFString *v23;
  __CFString *v24;
  const char *v25;
  size_t v26;
  int v27;
  int v28;
  int v29;
  Offset<siri::speech::schema_fb::TextToSpeechRequestContext> v30;
  OPTTSTextToSpeechRequestContext *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE *v38;
  char *v39;
  unint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = 0;
  v40 = 0;
  -[OPTTSTextToSpeechRequestContext context_info](self, "context_info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v38, objc_msgSend(v5, "count"));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[OPTTSTextToSpeechRequestContext context_info](self, "context_info");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  v32 = self;
  v7 = v38;
  if (v6)
  {
    v8 = *(_QWORD *)v35;
    v9 = v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "addObjectToBuffer:", a3, v32);
        v12 = v11;
        v13 = v39;
        if ((unint64_t)v39 >= v9)
        {
          v15 = (v39 - v7) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
          {
            v38 = v7;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v9 - (_QWORD)v7) >> 1 > v16)
            v16 = (uint64_t)(v9 - (_QWORD)v7) >> 1;
          if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v16;
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v17);
          else
            v18 = 0;
          v19 = (_DWORD *)(v17 + 4 * v15);
          *v19 = v12;
          v14 = (char *)(v19 + 1);
          while (v13 != v7)
          {
            v20 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *--v19 = v20;
          }
          v9 = v17 + 4 * v18;
          v39 = v14;
          if (v7)
            operator delete(v7);
          v7 = v19;
        }
        else
        {
          *(_DWORD *)v39 = v11;
          v14 = v13 + 4;
        }
        v39 = v14;
      }
      v40 = v9;
      v38 = v7;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v6);
  }
  else
  {
    v14 = v39;
  }

  if (v14 == v7)
    v21 = &flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  else
    v21 = v7;
  v22 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v21, (v14 - v7) >> 2);
  -[OPTTSTextToSpeechRequestContext dialog_identifier](v32, "dialog_identifier");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
    v23 = &stru_24DD8EF88;
  v25 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v23), "UTF8String");
  v26 = strlen(v25);
  LODWORD(v25) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v25, v26);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v27 = *((_DWORD *)a3 + 8);
  v28 = *((_DWORD *)a3 + 12);
  v29 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, v22);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v25);
  v30.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v27 - v28 + v29);
  if (v7)
  {
    v39 = v7;
    operator delete(v7);
  }
  return v30;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechRequestContext> v2;
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
  v2.var0 = -[OPTTSTextToSpeechRequestContext addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__OPTTSTextToSpeechRequestContext_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__47__OPTTSTextToSpeechRequestContext_flatbuffData__block_invoke(uint64_t a1)
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

@end
