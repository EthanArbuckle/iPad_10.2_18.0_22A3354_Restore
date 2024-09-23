@implementation QSSTTSPrompts

- (QSSTTSPrompts)initWithFlatbuffData:(id)a3
{
  return -[QSSTTSPrompts initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTTSPrompts initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4
{
  return -[QSSTTSPrompts initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTTSPrompts *v10;
  QSSTTSPrompts *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TTSPrompts *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTTSPrompts *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTTSPrompts;
  v10 = -[QSSTTSPrompts init](&v30, sel_init);
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
      a4 = (const TTSPrompts *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TTSPrompts *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TTSPrompts::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)prompts
{
  void *v3;
  const TTSPrompts *root;
  const TTSPrompts *v5;
  uint64_t v6;
  const TTSPrompts *v7;
  uint64_t v8;
  uint64_t v9;
  const TTSPrompts *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
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
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prompts"));
  }
  return (NSArray *)v3;
}

- (NSData)prompts_v2
{
  const TTSPrompts *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TTSPrompts *v6;

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
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v6[4], *(unsigned int *)root[v4 + v5].var0);
}

- (void)prompts_v2:(id)a3
{
  id v4;
  const TTSPrompts *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const TTSPrompts *v9;
  id v10;

  v4 = a3;
  root = self->_root;
  v6 = *(int *)root->var0;
  v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    v8 = *(unsigned int *)root[v7].var0;
    v9 = &root[v7 + v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
    v8 = *(unsigned int *)root->var0;
  }
  v10 = v4;
  (*((void (**)(id, const TTSPrompts *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (Offset<siri::speech::schema_fb::TTSPrompts>)addObjectToBuffer:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int *begin;
  uint64_t v8;
  int *value;
  uint64_t i;
  const char *v11;
  size_t v12;
  int String;
  int v14;
  std::vector<int>::pointer end;
  int *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  int *v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  Offset<siri::speech::schema_fb::TTSPrompts> v28;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)();
  void *v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  std::vector<int> v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  memset(&v44, 0, sizeof(v44));
  -[QSSTTSPrompts prompts](self, "prompts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v44, objc_msgSend(v3, "count"));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[QSSTTSPrompts prompts](self, "prompts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  v6 = v4;
  begin = v44.__begin_;
  if (v5)
  {
    v8 = *(_QWORD *)v41;
    value = v44.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v6);
        v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i)), "UTF8String");
        v12 = strlen(v11);
        String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);
        v14 = String;
        end = v44.__end_;
        if (v44.__end_ >= value)
        {
          v17 = v44.__end_ - begin;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v44.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v18)
            v18 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          else
            v20 = 0;
          v21 = (int *)(v19 + 4 * v17);
          *v21 = v14;
          v16 = v21 + 1;
          while (end != begin)
          {
            v22 = *--end;
            *--v21 = v22;
          }
          value = (int *)(v19 + 4 * v20);
          v44.__end_ = v16;
          if (begin)
            operator delete(begin);
          begin = v21;
        }
        else
        {
          *v44.__end_ = String;
          v16 = end + 1;
        }
        v44.__end_ = v16;
      }
      v44.__end_cap_.__value_ = value;
      v44.__begin_ = begin;
      v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v5);
  }
  else
  {
    v16 = v44.__end_;
  }

  if (v16 == begin)
    v23 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v23 = begin;
  v24 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v23, v16 - begin);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3812000000;
  v36 = __Block_byref_object_copy__629;
  v37 = __Block_byref_object_dispose__630;
  v38 = &unk_21E36C185;
  v39 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __35__QSSTTSPrompts_addObjectToBuffer___block_invoke;
  v32[3] = &unk_24E246AC0;
  v32[4] = &v33;
  v32[5] = a3;
  -[QSSTTSPrompts prompts_v2:](self, "prompts_v2:", v32);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v25 = *((_DWORD *)a3 + 8);
  v26 = *((_DWORD *)a3 + 12);
  v27 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v24);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, *((_DWORD *)v34 + 12));
  v28.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v25 - v26 + v27);
  _Block_object_dispose(&v33, 8);
  if (begin)
  {
    v44.__end_ = begin;
    operator delete(begin);
  }
  return v28;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TTSPrompts> v2;
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
  v2.var0 = -[QSSTTSPrompts addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __29__QSSTTSPrompts_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__29__QSSTTSPrompts_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __35__QSSTTSPrompts_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
