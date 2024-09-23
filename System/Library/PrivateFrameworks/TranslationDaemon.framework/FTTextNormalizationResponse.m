@implementation FTTextNormalizationResponse

- (FTTextNormalizationResponse)initWithFlatbuffData:(id)a3
{
  return -[FTTextNormalizationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTextNormalizationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4
{
  return -[FTTextNormalizationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTextNormalizationResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextNormalizationResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TextNormalizationResponse *v19;
  FTTextNormalizationResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextNormalizationResponse;
  v10 = -[FTTextNormalizationResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextNormalizationResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextNormalizationResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TextNormalizationResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const TextNormalizationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationResponse *v6;

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
  const TextNormalizationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationResponse *v6;

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

- (NSArray)tokens
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTTextNormalizationResponse_tokens__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextNormalizationResponse tokens_enumerateObjectsUsingBlock:](self, "tokens_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tokens"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTTextNormalizationResponse_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)tokens_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTNormalizedToken *v7;
  FTNormalizedToken *v8;
  const TextNormalizationResponse *root;
  const TextNormalizationResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTNormalizedToken *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 9u || (v11 = *(unsigned __int16 *)v10[8].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTNormalizedToken initWithFlatbuffData:root:verify:]([FTNormalizedToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)tokens_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextNormalizationResponse *root;
  const TextNormalizationResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
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
    if (*(unsigned __int16 *)v7->var0 >= 9u && (v8 = *(unsigned __int16 *)v7[8].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)tokens_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTNormalizedToken *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextNormalizationResponse *root;
  const TextNormalizationResponse *v8;
  uint64_t v9;
  const TextNormalizationResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTNormalizedToken *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTNormalizedToken *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
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
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      v9 = *(unsigned __int16 *)v8[8].var0;
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
            v17 = -[FTNormalizedToken initWithFlatbuffData:root:verify:]([FTNormalizedToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (int)error_code
{
  const TextNormalizationResponse *root;
  const TextNormalizationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const TextNormalizationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationResponse *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (Offset<siri::speech::schema_fb::TextNormalizationResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  int String;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int v19;
  int v20;
  std::vector<int>::pointer end;
  int *v22;
  std::vector<int>::pointer begin;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  char *v28;
  int *v29;
  int v30;
  std::vector<int>::pointer v31;
  int v32;
  int v33;
  __CFString *v34;
  __CFString *v35;
  const char *v36;
  size_t v37;
  int v38;
  int v39;
  int v40;
  Offset<siri::speech::schema_fb::TextNormalizationResponse> v41;
  int v43;
  FTTextNormalizationResponse *v44;
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  std::vector<int> v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  -[FTTextNormalizationResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTTextNormalizationResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_251A15610;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  LODWORD(v12) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  memset(&v50, 0, sizeof(v50));
  -[FTTextNormalizationResponse tokens](self, "tokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (int)v12;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, objc_msgSend(v14, "count"));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[FTTextNormalizationResponse tokens](self, "tokens");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = self;
  v45 = String;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v15);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v20 = v19;
        end = v50.__end_;
        if (v50.__end_ >= v50.__end_cap_.__value_)
        {
          begin = v50.__begin_;
          v24 = v50.__end_ - v50.__begin_;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v26 = (char *)v50.__end_cap_.__value_ - (char *)v50.__begin_;
          if (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v50.__end_cap_, v27);
            begin = v50.__begin_;
            end = v50.__end_;
          }
          else
          {
            v28 = 0;
          }
          v29 = (int *)&v28[4 * v24];
          *v29 = v20;
          v22 = v29 + 1;
          while (end != begin)
          {
            v30 = *--end;
            *--v29 = v30;
          }
          v50.__begin_ = v29;
          v50.__end_ = v22;
          v50.__end_cap_.__value_ = (int *)&v28[4 * v27];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v50.__end_ = v19;
          v22 = end + 1;
        }
        v50.__end_ = v22;
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v16);
  }

  if (v50.__end_ == v50.__begin_)
    v31 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::NormalizedToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::NormalizedToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::NormalizedToken>> const&)::t;
  else
    v31 = v50.__begin_;
  v32 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v31, v50.__end_ - v50.__begin_);
  v33 = -[FTTextNormalizationResponse error_code](v44, "error_code");
  -[FTTextNormalizationResponse error_str](v44, "error_str");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
    v34 = &stru_251A15610;
  v36 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v34), "UTF8String");
  v37 = strlen(v36);
  LODWORD(v36) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v36, v37);

  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_DWORD *)a3 + 8);
  v39 = *((_DWORD *)a3 + 12);
  v40 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v45);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v43);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v32);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 10, v33, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, (int)v36);
  v41.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v38 - (unsigned __int16)v39 + v40);
  if (v50.__begin_)
  {
    v50.__end_ = v50.__begin_;
    operator delete(v50.__begin_);
  }
  return v41;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTextNormalizationResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __43__FTTextNormalizationResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTTextNormalizationResponse_flatbuffData__block_invoke(uint64_t a1)
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
