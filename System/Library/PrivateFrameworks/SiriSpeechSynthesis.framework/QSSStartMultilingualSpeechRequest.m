@implementation QSSStartMultilingualSpeechRequest

- (QSSStartMultilingualSpeechRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSStartMultilingualSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSStartMultilingualSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSStartMultilingualSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartMultilingualSpeechRequest *)a4
{
  return -[QSSStartMultilingualSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSStartMultilingualSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartMultilingualSpeechRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSStartMultilingualSpeechRequest *v10;
  QSSStartMultilingualSpeechRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::StartMultilingualSpeechRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSStartMultilingualSpeechRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartMultilingualSpeechRequest;
  v10 = -[QSSStartMultilingualSpeechRequest init](&v30, sel_init);
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
      a4 = (const StartMultilingualSpeechRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartMultilingualSpeechRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartMultilingualSpeechRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSStartSpeechRequest)start_speech_request
{
  QSSStartSpeechRequest *v3;
  QSSStartSpeechRequest *v4;
  const StartMultilingualSpeechRequest *root;
  const StartMultilingualSpeechRequest *v6;
  uint64_t v7;
  const StartMultilingualSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("start_speech_request"));
  v3 = (QSSStartSpeechRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSStartSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("start_speech_request"));
  }
  return v3;
}

- (NSArray)language_parameters_by_id
{
  void *v3;
  const StartMultilingualSpeechRequest *root;
  const StartMultilingualSpeechRequest *v5;
  uint64_t v6;
  const StartMultilingualSpeechRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const StartMultilingualSpeechRequest *v10;
  uint64_t v11;
  QSSLanguageParameters *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("language_parameters_by_id"));
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
            v12 = -[QSSLanguageParameters initWithFlatbuffData:root:verify:]([QSSLanguageParameters alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("language_parameters_by_id"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::StartMultilingualSpeechRequest>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t i;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  Offset<siri::speech::schema_fb::StartMultilingualSpeechRequest> v36;
  unsigned int v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[QSSStartMultilingualSpeechRequest start_speech_request](self, "start_speech_request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[QSSStartMultilingualSpeechRequest language_parameters_by_id](self, "language_parameters_by_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    if (v7 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v7);
    v10 = &v8[4 * v9];
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[QSSStartMultilingualSpeechRequest language_parameters_by_id](self, "language_parameters_by_id");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v41;
    v14 = v8;
    v39 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v17 = v16;
        if (v14 >= v10)
        {
          v18 = (v14 - v8) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v10 - v8) >> 1 > v19)
            v19 = (v10 - v8) >> 1;
          if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          else
            v21 = 0;
          v22 = (char *)(v20 + 4 * v18);
          *(_DWORD *)v22 = v17;
          v23 = v22 + 4;
          while (v14 != v8)
          {
            v24 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }
          v10 = (char *)(v20 + 4 * v21);
          if (v8)
            operator delete(v8);
          v8 = v22;
          v14 = v23;
          v11 = v39;
        }
        else
        {
          *(_DWORD *)v14 = v16;
          v14 += 4;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  v25 = v14 - v8;
  if (v14 == v8)
    v26 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::LanguageParameters>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::LanguageParameters>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::LanguageParameters>> const&)::t;
  else
    v26 = v8;
  v27 = v25 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v25 >> 2, 4uLL);
  if (v8 == v14)
  {
    LODWORD(v27) = 0;
  }
  else
  {
    v28 = v26 - 4;
    v29 = v27;
    do
    {
      v30 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v28[4 * v29]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v30);
      --v29;
    }
    while (v29);
  }
  v31 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v27);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v32 = *((_DWORD *)a3 + 8);
  v33 = *((_DWORD *)a3 + 12);
  v34 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v38);
  if (v31)
  {
    v35 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v31);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v35);
  }
  v36.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v32 - v33 + v34);
  if (v8)
    operator delete(v8);
  return v36;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::StartMultilingualSpeechRequest> v2;
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
  v2.var0 = -[QSSStartMultilingualSpeechRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__QSSStartMultilingualSpeechRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__49__QSSStartMultilingualSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
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
