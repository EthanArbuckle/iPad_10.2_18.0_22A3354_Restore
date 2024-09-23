@implementation FTLmScorerResponse

- (FTLmScorerResponse)initWithFlatbuffData:(id)a3
{
  return -[FTLmScorerResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTLmScorerResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4
{
  return -[FTLmScorerResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTLmScorerResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const LmScorerResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::LmScorerResponse *v19;
  FTLmScorerResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTLmScorerResponse;
  v10 = -[FTLmScorerResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const LmScorerResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::LmScorerResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::LmScorerResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (int)return_code
{
  const LmScorerResponse *root;
  const LmScorerResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const LmScorerResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LmScorerResponse *v6;

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
    v6[2] = __28__FTLmScorerResponse_tokens__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTLmScorerResponse tokens_enumerateObjectsUsingBlock:](self, "tokens_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tokens"));

  }
  return (NSArray *)v3;
}

uint64_t __28__FTLmScorerResponse_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)tokens_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTLmScorerToken *v7;
  FTLmScorerToken *v8;
  const LmScorerResponse *root;
  const LmScorerResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTLmScorerToken *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTLmScorerToken initWithFlatbuffData:root:verify:]([FTLmScorerToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
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
  const LmScorerResponse *root;
  const LmScorerResponse *v7;
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
  void (**v4)(id, FTLmScorerToken *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const LmScorerResponse *root;
  const LmScorerResponse *v8;
  uint64_t v9;
  const LmScorerResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTLmScorerToken *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTLmScorerToken *, uint64_t, unsigned __int8 *))a3;
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
            v17 = -[FTLmScorerToken initWithFlatbuffData:root:verify:]([FTLmScorerToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (double)ppl
{
  const LmScorerResponse *root;
  const LmScorerResponse *v3;
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

- (Offset<siri::speech::schema_fb::LmScorerResponse>)addObjectToBuffer:(void *)a3
{
  int v5;
  __CFString *v6;
  __CFString *v7;
  const char *v8;
  size_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int v16;
  std::vector<int>::pointer end;
  int *v18;
  std::vector<int>::pointer begin;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  char *v24;
  int *v25;
  int v26;
  std::vector<int>::pointer v27;
  int v28;
  double v29;
  double v30;
  int v31;
  int v32;
  int v33;
  Offset<siri::speech::schema_fb::LmScorerResponse> v34;
  int v36;
  FTLmScorerResponse *v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  std::vector<int> v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = -[FTLmScorerResponse return_code](self, "return_code");
  -[FTLmScorerResponse return_str](self, "return_str");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_251A15610;
  v8 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
  v9 = strlen(v8);
  LODWORD(v8) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  memset(&v43, 0, sizeof(v43));
  -[FTLmScorerResponse tokens](self, "tokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v43, objc_msgSend(v10, "count"));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[FTLmScorerResponse tokens](self, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (int)v8;
  v37 = self;
  v38 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v11);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v16 = v15;
        end = v43.__end_;
        if (v43.__end_ >= v43.__end_cap_.__value_)
        {
          begin = v43.__begin_;
          v20 = v43.__end_ - v43.__begin_;
          v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v22 = (char *)v43.__end_cap_.__value_ - (char *)v43.__begin_;
          if (((char *)v43.__end_cap_.__value_ - (char *)v43.__begin_) >> 1 > v21)
            v21 = v22 >> 1;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
            v23 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v23 = v21;
          if (v23)
          {
            v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v43.__end_cap_, v23);
            begin = v43.__begin_;
            end = v43.__end_;
          }
          else
          {
            v24 = 0;
          }
          v25 = (int *)&v24[4 * v20];
          *v25 = v16;
          v18 = v25 + 1;
          while (end != begin)
          {
            v26 = *--end;
            *--v25 = v26;
          }
          v43.__begin_ = v25;
          v43.__end_ = v18;
          v43.__end_cap_.__value_ = (int *)&v24[4 * v23];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v43.__end_ = v15;
          v18 = end + 1;
        }
        v43.__end_ = v18;
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v12);
  }

  if (v43.__end_ == v43.__begin_)
    v27 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LmScorerToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LmScorerToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LmScorerToken>> const&)::t;
  else
    v27 = v43.__begin_;
  v28 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v27, v43.__end_ - v43.__begin_);
  -[FTLmScorerResponse ppl](v37, "ppl");
  v30 = v29;
  *((_BYTE *)a3 + 70) = 1;
  v31 = *((_DWORD *)a3 + 8);
  v32 = *((_DWORD *)a3 + 12);
  v33 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 4, v38, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v36);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v28);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 10, v30, 0.0);
  v34.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v31 - (unsigned __int16)v32 + v33);
  if (v43.__begin_)
  {
    v43.__end_ = v43.__begin_;
    operator delete(v43.__begin_);
  }
  return v34;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTLmScorerResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __34__FTLmScorerResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTLmScorerResponse_flatbuffData__block_invoke(uint64_t a1)
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
