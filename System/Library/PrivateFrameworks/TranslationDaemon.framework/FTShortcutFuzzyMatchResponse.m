@implementation FTShortcutFuzzyMatchResponse

- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3
{
  return -[FTShortcutFuzzyMatchResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTShortcutFuzzyMatchResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4
{
  return -[FTShortcutFuzzyMatchResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTShortcutFuzzyMatchResponse)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTShortcutFuzzyMatchResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const ShortcutFuzzyMatchResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::ShortcutFuzzyMatchResponse *v19;
  FTShortcutFuzzyMatchResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTShortcutFuzzyMatchResponse;
  v10 = -[FTShortcutFuzzyMatchResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ShortcutFuzzyMatchResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ShortcutFuzzyMatchResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::ShortcutFuzzyMatchResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)utterance
{
  const ShortcutFuzzyMatchResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchResponse *v6;

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

- (NSArray)shortcut_score_pairs
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcut_score_pairs"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__FTShortcutFuzzyMatchResponse_shortcut_score_pairs__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTShortcutFuzzyMatchResponse shortcut_score_pairs_enumerateObjectsUsingBlock:](self, "shortcut_score_pairs_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("shortcut_score_pairs"));

  }
  return (NSArray *)v3;
}

uint64_t __52__FTShortcutFuzzyMatchResponse_shortcut_score_pairs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)shortcut_score_pairs_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTShortcutFuzzyMatchResponse_ShortcutScorePair *v7;
  FTShortcutFuzzyMatchResponse_ShortcutScorePair *v8;
  const ShortcutFuzzyMatchResponse *root;
  const ShortcutFuzzyMatchResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcut_score_pairs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTShortcutFuzzyMatchResponse_ShortcutScorePair *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTShortcutFuzzyMatchResponse_ShortcutScorePair initWithFlatbuffData:root:verify:]([FTShortcutFuzzyMatchResponse_ShortcutScorePair alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)shortcut_score_pairs_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const ShortcutFuzzyMatchResponse *root;
  const ShortcutFuzzyMatchResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcut_score_pairs"));
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
    if (*(unsigned __int16 *)v7->var0 >= 7u && (v8 = *(unsigned __int16 *)v7[6].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)shortcut_score_pairs_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTShortcutFuzzyMatchResponse_ShortcutScorePair *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const ShortcutFuzzyMatchResponse *root;
  const ShortcutFuzzyMatchResponse *v8;
  uint64_t v9;
  const ShortcutFuzzyMatchResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTShortcutFuzzyMatchResponse_ShortcutScorePair *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTShortcutFuzzyMatchResponse_ShortcutScorePair *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcut_score_pairs"));
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
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      v9 = *(unsigned __int16 *)v8[6].var0;
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
            v17 = -[FTShortcutFuzzyMatchResponse_ShortcutScorePair initWithFlatbuffData:root:verify:]([FTShortcutFuzzyMatchResponse_ShortcutScorePair alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (int)return_code
{
  const ShortcutFuzzyMatchResponse *root;
  const ShortcutFuzzyMatchResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  int v15;
  std::vector<int>::pointer end;
  int *v17;
  std::vector<int>::pointer begin;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  char *v23;
  int *v24;
  int v25;
  std::vector<int>::pointer v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse> v32;
  int v34;
  FTShortcutFuzzyMatchResponse *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  std::vector<int> v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[FTShortcutFuzzyMatchResponse utterance](self, "utterance");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  LODWORD(v7) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  memset(&v40, 0, sizeof(v40));
  -[FTShortcutFuzzyMatchResponse shortcut_score_pairs](self, "shortcut_score_pairs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v40, objc_msgSend(v9, "count"));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[FTShortcutFuzzyMatchResponse shortcut_score_pairs](self, "shortcut_score_pairs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (int)v7;
  v35 = self;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v10);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v15 = v14;
        end = v40.__end_;
        if (v40.__end_ >= v40.__end_cap_.__value_)
        {
          begin = v40.__begin_;
          v19 = v40.__end_ - v40.__begin_;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v21 = (char *)v40.__end_cap_.__value_ - (char *)v40.__begin_;
          if (((char *)v40.__end_cap_.__value_ - (char *)v40.__begin_) >> 1 > v20)
            v20 = v21 >> 1;
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v20;
          if (v22)
          {
            v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v40.__end_cap_, v22);
            begin = v40.__begin_;
            end = v40.__end_;
          }
          else
          {
            v23 = 0;
          }
          v24 = (int *)&v23[4 * v19];
          *v24 = v15;
          v17 = v24 + 1;
          while (end != begin)
          {
            v25 = *--end;
            *--v24 = v25;
          }
          v40.__begin_ = v24;
          v40.__end_ = v17;
          v40.__end_cap_.__value_ = (int *)&v23[4 * v22];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v40.__end_ = v14;
          v17 = end + 1;
        }
        v40.__end_ = v17;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v11);
  }

  if (v40.__end_ == v40.__begin_)
    v26 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchResponse_::ShortcutScorePair>> const&)::t;
  else
    v26 = v40.__begin_;
  v27 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v26, v40.__end_ - v40.__begin_);
  v28 = -[FTShortcutFuzzyMatchResponse return_code](v35, "return_code");
  *((_BYTE *)a3 + 70) = 1;
  v29 = *((_DWORD *)a3 + 8);
  v30 = *((_DWORD *)a3 + 12);
  v31 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v34);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v27);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v28, 0);
  v32.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v29 - (unsigned __int16)v30 + v31);
  if (v40.__begin_)
  {
    v40.__end_ = v40.__begin_;
    operator delete(v40.__begin_);
  }
  return v32;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTShortcutFuzzyMatchResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __44__FTShortcutFuzzyMatchResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__44__FTShortcutFuzzyMatchResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__62__FTShortcutFuzzyMatchResponse_ShortcutScorePair_flatbuffData__block_invoke(uint64_t a1)
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

@end
