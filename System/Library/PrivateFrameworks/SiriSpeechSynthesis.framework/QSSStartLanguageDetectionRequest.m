@implementation QSSStartLanguageDetectionRequest

- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSStartLanguageDetectionRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSStartLanguageDetectionRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3 root:(const StartLanguageDetectionRequest *)a4
{
  return -[QSSStartLanguageDetectionRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSStartLanguageDetectionRequest)initWithFlatbuffData:(id)a3 root:(const StartLanguageDetectionRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSStartLanguageDetectionRequest *v10;
  QSSStartLanguageDetectionRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::StartLanguageDetectionRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSStartLanguageDetectionRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartLanguageDetectionRequest;
  v10 = -[QSSStartLanguageDetectionRequest init](&v30, sel_init);
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
      a4 = (const StartLanguageDetectionRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartLanguageDetectionRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartLanguageDetectionRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)speech_id
{
  const StartLanguageDetectionRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartLanguageDetectionRequest *v6;

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

- (NSString)session_id
{
  const StartLanguageDetectionRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartLanguageDetectionRequest *v6;

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

- (NSArray)locales
{
  void *v3;
  const StartLanguageDetectionRequest *root;
  const StartLanguageDetectionRequest *v5;
  uint64_t v6;
  const StartLanguageDetectionRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const StartLanguageDetectionRequest *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("locales"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      v6 = *(unsigned __int16 *)v5[8].var0;
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("locales"));
  }
  return (NSArray *)v3;
}

- (int64_t)codec
{
  const StartLanguageDetectionRequest *root;
  const StartLanguageDetectionRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::StartLanguageDetectionRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int *begin;
  uint64_t v17;
  int *value;
  uint64_t i;
  const char *v20;
  size_t v21;
  int v22;
  int v23;
  std::vector<int>::pointer end;
  int *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  int *v32;
  unsigned int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  Offset<siri::speech::schema_fb::StartLanguageDetectionRequest> v38;
  unsigned int v40;
  unsigned int String;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  std::vector<int> v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[QSSStartLanguageDetectionRequest speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSStartLanguageDetectionRequest session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v12 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  memset(&v48, 0, sizeof(v48));
  -[QSSStartLanguageDetectionRequest locales](self, "locales");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v48, objc_msgSend(v13, "count"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[QSSStartLanguageDetectionRequest locales](self, "locales");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  v40 = v12;
  begin = v48.__begin_;
  if (v15)
  {
    v17 = *(_QWORD *)v45;
    value = v48.__end_cap_.__value_;
    v43 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v14);
        v20 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i)), "UTF8String");
        v21 = strlen(v20);
        v22 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);
        v23 = v22;
        end = v48.__end_;
        if (v48.__end_ >= value)
        {
          v26 = v48.__end_ - begin;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 62)
          {
            v48.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v27)
            v27 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v28 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v28 = v27;
          if (v28)
            v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v28);
          else
            v29 = 0;
          v30 = (int *)(v28 + 4 * v26);
          *v30 = v23;
          v25 = v30 + 1;
          while (end != begin)
          {
            v31 = *--end;
            *--v30 = v31;
          }
          value = (int *)(v28 + 4 * v29);
          v48.__end_ = v25;
          if (begin)
            operator delete(begin);
          begin = v30;
          v14 = v43;
        }
        else
        {
          *v48.__end_ = v22;
          v25 = end + 1;
        }
        v48.__end_ = v25;
      }
      v48.__end_cap_.__value_ = value;
      v48.__begin_ = begin;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v15);
  }
  else
  {
    v25 = v48.__end_;
  }

  if (v25 == begin)
    v32 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v32 = begin;
  v33 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v32, v25 - begin);
  v34 = -[QSSStartLanguageDetectionRequest codec](self, "codec");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v35 = *((_DWORD *)a3 + 8);
  v36 = *((_DWORD *)a3 + 12);
  v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v33);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v34);
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (begin)
  {
    v48.__end_ = begin;
    operator delete(begin);
  }
  return v38;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::StartLanguageDetectionRequest> v2;
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
  v2.var0 = -[QSSStartLanguageDetectionRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__QSSStartLanguageDetectionRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__48__QSSStartLanguageDetectionRequest_flatbuffData__block_invoke(uint64_t a1)
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
