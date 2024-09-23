@implementation QSSServerEndpointFeatures

- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3
{
  return -[QSSServerEndpointFeatures initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSServerEndpointFeatures initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4
{
  return -[QSSServerEndpointFeatures initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSServerEndpointFeatures *v10;
  QSSServerEndpointFeatures *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::ServerEndpointFeatures *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSServerEndpointFeatures *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSServerEndpointFeatures;
  v10 = -[QSSServerEndpointFeatures init](&v30, sel_init);
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
      a4 = (const ServerEndpointFeatures *)v13 + *v13;
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
      root = (siri::speech::schema_fb::ServerEndpointFeatures *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::ServerEndpointFeatures::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (int)processed_audio_duration_ms
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)num_of_words
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)trailing_silence_duration
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (double)eos_likelihood
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSArray)pause_counts
{
  void *v3;
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v5;
  uint64_t v6;
  const ServerEndpointFeatures *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pause_counts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      v6 = *(unsigned __int16 *)v5[12].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        var0 = (unsigned int *)v7[v8 + 4].var0;
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *var0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pause_counts"));
  }
  return (NSArray *)v3;
}

- (double)silence_posterior
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSString)task_name
{
  const ServerEndpointFeatures *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ServerEndpointFeatures *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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

- (NSString)speech_id
{
  const ServerEndpointFeatures *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ServerEndpointFeatures *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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

- (Offset<siri::speech::schema_fb::ServerEndpointFeatures>)addObjectToBuffer:(void *)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int *begin;
  uint64_t v11;
  int *value;
  uint64_t i;
  int v14;
  int v15;
  std::vector<int>::pointer end;
  int *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int *v22;
  int v23;
  int *v24;
  unsigned int v25;
  double v26;
  double v27;
  __CFString *v28;
  __CFString *v29;
  const char *v30;
  size_t v31;
  unsigned int String;
  __CFString *v33;
  __CFString *v34;
  const char *v35;
  size_t v36;
  int v37;
  int v38;
  int v39;
  Offset<siri::speech::schema_fb::ServerEndpointFeatures> v40;
  int v42;
  int v43;
  int v44;
  QSSServerEndpointFeatures *v45;
  flatbuffers::FlatBufferBuilder *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  std::vector<int> v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v44 = -[QSSServerEndpointFeatures processed_audio_duration_ms](self, "processed_audio_duration_ms");
  v43 = -[QSSServerEndpointFeatures num_of_words](self, "num_of_words");
  v42 = -[QSSServerEndpointFeatures trailing_silence_duration](self, "trailing_silence_duration");
  -[QSSServerEndpointFeatures eos_likelihood](self, "eos_likelihood");
  v6 = v5;
  memset(&v51, 0, sizeof(v51));
  -[QSSServerEndpointFeatures pause_counts](self, "pause_counts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v51, objc_msgSend(v7, "count"));

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[QSSServerEndpointFeatures pause_counts](self, "pause_counts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  v45 = self;
  v46 = (flatbuffers::FlatBufferBuilder *)a3;
  begin = v51.__begin_;
  if (v9)
  {
    v11 = *(_QWORD *)v48;
    value = v51.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v8);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "intValue");
        v15 = v14;
        end = v51.__end_;
        if (v51.__end_ >= value)
        {
          v18 = v51.__end_ - begin;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v51.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v19)
            v19 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          else
            v21 = 0;
          v22 = (int *)(v20 + 4 * v18);
          *v22 = v15;
          v17 = v22 + 1;
          while (end != begin)
          {
            v23 = *--end;
            *--v22 = v23;
          }
          value = (int *)(v20 + 4 * v21);
          v51.__end_ = v17;
          if (begin)
            operator delete(begin);
          begin = v22;
        }
        else
        {
          *v51.__end_ = v14;
          v17 = end + 1;
        }
        v51.__end_ = v17;
      }
      v51.__end_cap_.__value_ = value;
      v51.__begin_ = begin;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v9);
  }
  else
  {
    v17 = v51.__end_;
  }

  if (v17 == begin)
    v24 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  else
    v24 = begin;
  v25 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v46, v24, v17 - begin);
  -[QSSServerEndpointFeatures silence_posterior](v45, "silence_posterior");
  v27 = v26;
  -[QSSServerEndpointFeatures task_name](v45, "task_name");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
    v28 = &stru_24E246F88;
  v30 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v28), "UTF8String");
  v31 = strlen(v30);
  String = flatbuffers::FlatBufferBuilder::CreateString(v46, v30, v31);

  -[QSSServerEndpointFeatures speech_id](v45, "speech_id");
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
    v33 = &stru_24E246F88;
  v35 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v33), "UTF8String");
  v36 = strlen(v35);
  LODWORD(v35) = flatbuffers::FlatBufferBuilder::CreateString(v46, v35, v36);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v46);
  *((_BYTE *)v46 + 70) = 1;
  v37 = *((_DWORD *)v46 + 8);
  v38 = *((_DWORD *)v46 + 12);
  v39 = *((_DWORD *)v46 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v46, 4, v44);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v46, 6, v43);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v46, 8, v42);
  flatbuffers::FlatBufferBuilder::AddElement<double>(v46, 10, v6);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v46, 12, v25);
  flatbuffers::FlatBufferBuilder::AddElement<double>(v46, 14, v27);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v46, 16, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v46, 18, v35);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable(v46, v37 - v38 + v39);
  if (begin)
  {
    v51.__end_ = begin;
    operator delete(begin);
  }
  return v40;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ServerEndpointFeatures> v2;
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
  v2.var0 = -[QSSServerEndpointFeatures addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__QSSServerEndpointFeatures_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__41__QSSServerEndpointFeatures_flatbuffData__block_invoke(uint64_t a1)
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
