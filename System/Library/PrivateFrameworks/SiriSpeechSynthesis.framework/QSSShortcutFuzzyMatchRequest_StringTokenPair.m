@implementation QSSShortcutFuzzyMatchRequest_StringTokenPair

- (QSSShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3
{
  return -[QSSShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3 root:(const StringTokenPair *)a4
{
  return -[QSSShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSShortcutFuzzyMatchRequest_StringTokenPair)initWithFlatbuffData:(id)a3 root:(const StringTokenPair *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSShortcutFuzzyMatchRequest_StringTokenPair *v10;
  QSSShortcutFuzzyMatchRequest_StringTokenPair *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::ContextWithPronHints *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSShortcutFuzzyMatchRequest_StringTokenPair *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSShortcutFuzzyMatchRequest_StringTokenPair;
  v10 = -[QSSShortcutFuzzyMatchRequest_StringTokenPair init](&v30, sel_init);
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
      a4 = (const StringTokenPair *)v13 + *v13;
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
      root = (siri::speech::schema_fb::ContextWithPronHints *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::ContextWithPronHints::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)raw_string
{
  const StringTokenPair *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StringTokenPair *v6;

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

- (NSArray)tokens
{
  void *v3;
  const StringTokenPair *root;
  const StringTokenPair *v5;
  uint64_t v6;
  const StringTokenPair *v7;
  uint64_t v8;
  uint64_t v9;
  const StringTokenPair *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      v6 = *(unsigned __int16 *)v5[6].var0;
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tokens"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int *begin;
  uint64_t v13;
  int *value;
  uint64_t i;
  const char *v16;
  size_t v17;
  int String;
  int v19;
  std::vector<int>::pointer end;
  int *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int *v26;
  int v27;
  int *v28;
  unsigned int v29;
  int v30;
  int v31;
  int v32;
  Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair> v33;
  unsigned int v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::vector<int> v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[QSSShortcutFuzzyMatchRequest_StringTokenPair raw_string](self, "raw_string");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  LODWORD(v6) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  memset(&v41, 0, sizeof(v41));
  -[QSSShortcutFuzzyMatchRequest_StringTokenPair tokens](self, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v41, objc_msgSend(v8, "count"));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[QSSShortcutFuzzyMatchRequest_StringTokenPair tokens](self, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v11 = v9;
  v35 = v6;
  begin = v41.__begin_;
  if (v10)
  {
    v13 = *(_QWORD *)v38;
    value = v41.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v16 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i)), "UTF8String");
        v17 = strlen(v16);
        String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);
        v19 = String;
        end = v41.__end_;
        if (v41.__end_ >= value)
        {
          v22 = v41.__end_ - begin;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
          {
            v41.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v23)
            v23 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          if (v24)
            v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v24);
          else
            v25 = 0;
          v26 = (int *)(v24 + 4 * v22);
          *v26 = v19;
          v21 = v26 + 1;
          while (end != begin)
          {
            v27 = *--end;
            *--v26 = v27;
          }
          value = (int *)(v24 + 4 * v25);
          v41.__end_ = v21;
          if (begin)
            operator delete(begin);
          begin = v26;
        }
        else
        {
          *v41.__end_ = String;
          v21 = end + 1;
        }
        v41.__end_ = v21;
      }
      v41.__end_cap_.__value_ = value;
      v41.__begin_ = begin;
      v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);
  }
  else
  {
    v21 = v41.__end_;
  }

  if (v21 == begin)
    v28 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v28 = begin;
  v29 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v28, v21 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v30 = *((_DWORD *)a3 + 8);
  v31 = *((_DWORD *)a3 + 12);
  v32 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v35);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v29);
  v33.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v30 - v31 + v32);
  if (begin)
  {
    v41.__end_ = begin;
    operator delete(begin);
  }
  return v33;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair> v2;
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
  v2.var0 = -[QSSShortcutFuzzyMatchRequest_StringTokenPair addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__QSSShortcutFuzzyMatchRequest_StringTokenPair_flatbuffData__block_invoke;
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

@end
