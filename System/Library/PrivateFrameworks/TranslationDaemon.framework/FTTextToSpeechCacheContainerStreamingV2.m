@implementation FTTextToSpeechCacheContainerStreamingV2

- (FTTextToSpeechCacheContainerStreamingV2)initWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechCacheContainerStreamingV2 initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechCacheContainerStreamingV2 initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTextToSpeechCacheContainerStreamingV2)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainerStreamingV2 *)a4
{
  return -[FTTextToSpeechCacheContainerStreamingV2 initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTextToSpeechCacheContainerStreamingV2)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainerStreamingV2 *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTextToSpeechCacheContainerStreamingV2 *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechCacheContainerStreamingV2 *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TextToSpeechCacheContainerStreamingV2 *v19;
  FTTextToSpeechCacheContainerStreamingV2 *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechCacheContainerStreamingV2;
  v10 = -[FTTextToSpeechCacheContainerStreamingV2 init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechCacheContainerStreamingV2 *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_13;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_14;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v22[0] = v17;
  v22[1] = v18;
  v23 = xmmword_249338830;
  v24 = 0;
  v25 = 1;
  v19 = (siri::speech::schema_fb::TextToSpeechCacheContainerStreamingV2 *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TextToSpeechCacheContainerStreamingV2::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)original_session_id
{
  const TextToSpeechCacheContainerStreamingV2 *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechCacheContainerStreamingV2 *v6;

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

- (FTStartTextToSpeechStreamingRequest)cached_request
{
  FTStartTextToSpeechStreamingRequest *v3;
  FTStartTextToSpeechStreamingRequest *v4;
  const TextToSpeechCacheContainerStreamingV2 *root;
  const TextToSpeechCacheContainerStreamingV2 *v6;
  uint64_t v7;
  const TextToSpeechCacheContainerStreamingV2 *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_request"));
  v3 = (FTStartTextToSpeechStreamingRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTStartTextToSpeechStreamingRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("cached_request"));
  }
  return v3;
}

- (FTBeginTextToSpeechStreamingResponse)cached_begin_response
{
  FTBeginTextToSpeechStreamingResponse *v3;
  FTBeginTextToSpeechStreamingResponse *v4;
  const TextToSpeechCacheContainerStreamingV2 *root;
  const TextToSpeechCacheContainerStreamingV2 *v6;
  uint64_t v7;
  const TextToSpeechCacheContainerStreamingV2 *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_begin_response"));
  v3 = (FTBeginTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTBeginTextToSpeechStreamingResponse alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (v7 = *(unsigned __int16 *)v6[8].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTBeginTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("cached_begin_response"));
  }
  return v3;
}

- (NSArray)cached_partial_response
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_partial_response"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__FTTextToSpeechCacheContainerStreamingV2_cached_partial_response__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechCacheContainerStreamingV2 cached_partial_response_enumerateObjectsUsingBlock:](self, "cached_partial_response_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("cached_partial_response"));

  }
  return (NSArray *)v3;
}

uint64_t __66__FTTextToSpeechCacheContainerStreamingV2_cached_partial_response__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)cached_partial_response_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTPartialTextToSpeechStreamingResponse *v7;
  FTPartialTextToSpeechStreamingResponse *v8;
  const TextToSpeechCacheContainerStreamingV2 *root;
  const TextToSpeechCacheContainerStreamingV2 *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_partial_response"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTPartialTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:]([FTPartialTextToSpeechStreamingResponse alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)cached_partial_response_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechCacheContainerStreamingV2 *root;
  const TextToSpeechCacheContainerStreamingV2 *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_partial_response"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
  }
  else
  {
    root = self->_root;
    v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (v8 = *(unsigned __int16 *)v7[10].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)cached_partial_response_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTPartialTextToSpeechStreamingResponse *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechCacheContainerStreamingV2 *root;
  const TextToSpeechCacheContainerStreamingV2 *v8;
  uint64_t v9;
  const TextToSpeechCacheContainerStreamingV2 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTPartialTextToSpeechStreamingResponse *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTPartialTextToSpeechStreamingResponse *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_partial_response"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);
  }
  else
  {
    root = self->_root;
    v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      v9 = *(unsigned __int16 *)v8[10].var0;
      if (v9)
      {
        v20 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = (uint64_t)&v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 0;
          v16 = 4 * v12 - 4;
          do
          {
            v17 = -[FTPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:]([FTPartialTextToSpeechStreamingResponse alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
            v4[2](v4, v17, v15, &v20);
            v18 = v20;

            if (v18)
              break;
            ++v15;
            v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }

}

- (FTFinalTextToSpeechStreamingResponse)cached_final_response
{
  FTFinalTextToSpeechStreamingResponse *v3;
  FTFinalTextToSpeechStreamingResponse *v4;
  const TextToSpeechCacheContainerStreamingV2 *root;
  const TextToSpeechCacheContainerStreamingV2 *v6;
  uint64_t v7;
  const TextToSpeechCacheContainerStreamingV2 *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cached_final_response"));
  v3 = (FTFinalTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTFinalTextToSpeechStreamingResponse alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTFinalTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("cached_final_response"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechCacheContainerStreamingV2>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  int v18;
  std::vector<int>::pointer end;
  int *v20;
  std::vector<int>::pointer begin;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  char *v26;
  int *v27;
  int v28;
  std::vector<int>::pointer v29;
  int v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  Offset<siri::speech::schema_fb::TextToSpeechCacheContainerStreamingV2> v36;
  int v38;
  int v39;
  int v40;
  FTTextToSpeechCacheContainerStreamingV2 *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  std::vector<int> v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[FTTextToSpeechCacheContainerStreamingV2 original_session_id](self, "original_session_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  LODWORD(v7) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTTextToSpeechCacheContainerStreamingV2 cached_request](self, "cached_request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "addObjectToBuffer:", a3);

  -[FTTextToSpeechCacheContainerStreamingV2 cached_begin_response](self, "cached_begin_response");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "addObjectToBuffer:", a3);

  memset(&v46, 0, sizeof(v46));
  -[FTTextToSpeechCacheContainerStreamingV2 cached_partial_response](self, "cached_partial_response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (int)v9;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v46, objc_msgSend(v12, "count"));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[FTTextToSpeechCacheContainerStreamingV2 cached_partial_response](self, "cached_partial_response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  v40 = (int)v7;
  v41 = self;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v13);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v18 = v17;
        end = v46.__end_;
        if (v46.__end_ >= v46.__end_cap_.__value_)
        {
          begin = v46.__begin_;
          v22 = v46.__end_ - v46.__begin_;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v24 = (char *)v46.__end_cap_.__value_ - (char *)v46.__begin_;
          if (((char *)v46.__end_cap_.__value_ - (char *)v46.__begin_) >> 1 > v23)
            v23 = v24 >> 1;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
            v25 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v46.__end_cap_, v25);
            begin = v46.__begin_;
            end = v46.__end_;
          }
          else
          {
            v26 = 0;
          }
          v27 = (int *)&v26[4 * v22];
          *v27 = v18;
          v20 = v27 + 1;
          while (end != begin)
          {
            v28 = *--end;
            *--v27 = v28;
          }
          v46.__begin_ = v27;
          v46.__end_ = v20;
          v46.__end_cap_.__value_ = (int *)&v26[4 * v25];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v46.__end_ = v17;
          v20 = end + 1;
        }
        v46.__end_ = v20;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v14);
  }

  if (v46.__end_ == v46.__begin_)
    v29 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>> const&)::t;
  else
    v29 = v46.__begin_;
  v30 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v29, v46.__end_ - v46.__begin_);
  -[FTTextToSpeechCacheContainerStreamingV2 cached_final_response](v41, "cached_final_response");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "addObjectToBuffer:", a3);

  *((_BYTE *)a3 + 70) = 1;
  v33 = *((_DWORD *)a3 + 8);
  v34 = *((_DWORD *)a3 + 12);
  v35 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v40);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v39);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v38);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v30);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v32);
  v36.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v33 - (unsigned __int16)v34 + v35);
  if (v46.__begin_)
  {
    v46.__end_ = v46.__begin_;
    operator delete(v46.__begin_);
  }
  return v36;
}

- (id)flatbuffData
{
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_249338840;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTextToSpeechCacheContainerStreamingV2 addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
  v2 = operator new();
  v3 = v12;
  v4 = v14;
  v5 = v15;
  v6 = (v14 + DWORD2(v14) - v15);
  *(_QWORD *)v2 = v11;
  *(_BYTE *)(v2 + 8) = v3;
  *(_QWORD *)(v2 + 16) = *((_QWORD *)&v4 + 1);
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v6;
  if (v3)
  {
    v11 = 0;
    v12 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__FTTextToSpeechCacheContainerStreamingV2_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__55__FTTextToSpeechCacheContainerStreamingV2_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2495AE51CLL);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
