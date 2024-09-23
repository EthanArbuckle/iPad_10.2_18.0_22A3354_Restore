@implementation FTTranslationResponse_TranslationPhrase

- (NSString)lt_formattedString
{
  void *v2;
  void *v3;
  void *v4;

  -[FTTranslationResponse_TranslationPhrase translated_tokens](self, "translated_tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ltCompactMap:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", &stru_251A15610);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTranslationResponse_TranslationPhrase *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TranslationPhrase *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *v19;
  FTTranslationResponse_TranslationPhrase *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationResponse_TranslationPhrase;
  v10 = -[FTTranslationResponse_TranslationPhrase init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TranslationPhrase *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TranslationResponse_::TranslationPhrase::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (float)confidence
{
  const TranslationPhrase *root;
  const TranslationPhrase *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (NSArray)translated_tokens
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_tokens"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__FTTranslationResponse_TranslationPhrase_translated_tokens__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationResponse_TranslationPhrase translated_tokens_enumerateObjectsUsingBlock:](self, "translated_tokens_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translated_tokens"));

  }
  return (NSArray *)v3;
}

- (id)translated_tokens_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTranslationResponse_TranslationToken *v7;
  FTTranslationResponse_TranslationToken *v8;
  const TranslationPhrase *root;
  const TranslationPhrase *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTranslationResponse_TranslationToken *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTranslationResponse_TranslationToken initWithFlatbuffData:root:verify:]([FTTranslationResponse_TranslationToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)translated_tokens_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslationPhrase *root;
  const TranslationPhrase *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_tokens"));
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

- (void)translated_tokens_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTranslationResponse_TranslationToken *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslationPhrase *root;
  const TranslationPhrase *v8;
  uint64_t v9;
  const TranslationPhrase *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTranslationResponse_TranslationToken *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTranslationResponse_TranslationToken *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_tokens"));
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
            v17 = -[FTTranslationResponse_TranslationToken initWithFlatbuffData:root:verify:]([FTTranslationResponse_TranslationToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSString)meta_info
{
  const TranslationPhrase *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationPhrase *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (NSArray)spans
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("spans"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__FTTranslationResponse_TranslationPhrase_spans__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationResponse_TranslationPhrase spans_enumerateObjectsUsingBlock:](self, "spans_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("spans"));

  }
  return (NSArray *)v3;
}

- (id)spans_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRepeatedSpan *v7;
  FTRepeatedSpan *v8;
  const TranslationPhrase *root;
  const TranslationPhrase *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("spans"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRepeatedSpan *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTRepeatedSpan initWithFlatbuffData:root:verify:]([FTRepeatedSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)spans_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslationPhrase *root;
  const TranslationPhrase *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("spans"));
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

- (void)spans_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslationPhrase *root;
  const TranslationPhrase *v8;
  uint64_t v9;
  const TranslationPhrase *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRepeatedSpan *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("spans"));
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
            v17 = -[FTRepeatedSpan initWithFlatbuffData:root:verify:]([FTRepeatedSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (BOOL)low_confidence
{
  const TranslationPhrase *root;
  const TranslationPhrase *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (FTTranslationPhraseMetaInfo)meta_info_data
{
  FTTranslationPhraseMetaInfo *v3;
  FTTranslationPhraseMetaInfo *v4;
  const TranslationPhrase *root;
  const TranslationPhrase *v6;
  uint64_t v7;
  const TranslationPhrase *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info_data"));
  v3 = (FTTranslationPhraseMetaInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationPhraseMetaInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (v7 = *(unsigned __int16 *)v6[14].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationPhraseMetaInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info_data"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  float v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  std::vector<int>::pointer end;
  int *v15;
  std::vector<int>::pointer begin;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char *v21;
  int *v22;
  int v23;
  std::vector<int>::pointer v24;
  int v25;
  __CFString *v26;
  __CFString *v27;
  const char *v28;
  size_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  int v35;
  int v36;
  std::vector<int>::pointer v37;
  int *v38;
  std::vector<int>::pointer v39;
  int64_t v40;
  unint64_t v41;
  int64_t v42;
  unint64_t v43;
  char *v44;
  int *v45;
  int v46;
  std::vector<int>::pointer v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  int v53;
  Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase> v54;
  uint64_t v56;
  FTTranslationResponse_TranslationPhrase *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  std::vector<int> v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  std::vector<int> v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  -[FTTranslationResponse_TranslationPhrase confidence](self, "confidence");
  v6 = v5;
  memset(&v67, 0, sizeof(v67));
  -[FTTranslationResponse_TranslationPhrase translated_tokens](self, "translated_tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v67, objc_msgSend(v7, "count"));

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[FTTranslationResponse_TranslationPhrase translated_tokens](self, "translated_tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = self;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v64 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v13 = v12;
        end = v67.__end_;
        if (v67.__end_ >= v67.__end_cap_.__value_)
        {
          begin = v67.__begin_;
          v17 = v67.__end_ - v67.__begin_;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v19 = (char *)v67.__end_cap_.__value_ - (char *)v67.__begin_;
          if (((char *)v67.__end_cap_.__value_ - (char *)v67.__begin_) >> 1 > v18)
            v18 = v19 >> 1;
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v18;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v67.__end_cap_, v20);
            begin = v67.__begin_;
            end = v67.__end_;
          }
          else
          {
            v21 = 0;
          }
          v22 = (int *)&v21[4 * v17];
          *v22 = v13;
          v15 = v22 + 1;
          while (end != begin)
          {
            v23 = *--end;
            *--v22 = v23;
          }
          v67.__begin_ = v22;
          v67.__end_ = v15;
          v67.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v67.__end_ = v12;
          v15 = end + 1;
        }
        v67.__end_ = v15;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v9);
  }

  if (v67.__end_ == v67.__begin_)
    v24 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>> const&)::t;
  else
    v24 = v67.__begin_;
  v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, v67.__end_ - v67.__begin_);
  -[FTTranslationResponse_TranslationPhrase meta_info](v57, "meta_info");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
    v26 = &stru_251A15610;
  v28 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v26), "UTF8String");
  v29 = strlen(v28);
  LODWORD(v56) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28, v29);

  memset(&v62, 0, sizeof(v62));
  -[FTTranslationResponse_TranslationPhrase spans](v57, "spans");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v62, objc_msgSend(v30, "count"));

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[FTTranslationResponse_TranslationPhrase spans](v57, "spans");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v56) = v25;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v59 != v33)
          objc_enumerationMutation(v31);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "addObjectToBuffer:", a3, v56);
        v36 = v35;
        v37 = v62.__end_;
        if (v62.__end_ >= v62.__end_cap_.__value_)
        {
          v39 = v62.__begin_;
          v40 = v62.__end_ - v62.__begin_;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v42 = (char *)v62.__end_cap_.__value_ - (char *)v62.__begin_;
          if (((char *)v62.__end_cap_.__value_ - (char *)v62.__begin_) >> 1 > v41)
            v41 = v42 >> 1;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFFCLL)
            v43 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v62.__end_cap_, v43);
            v39 = v62.__begin_;
            v37 = v62.__end_;
          }
          else
          {
            v44 = 0;
          }
          v45 = (int *)&v44[4 * v40];
          *v45 = v36;
          v38 = v45 + 1;
          while (v37 != v39)
          {
            v46 = *--v37;
            *--v45 = v46;
          }
          v62.__begin_ = v45;
          v62.__end_ = v38;
          v62.__end_cap_.__value_ = (int *)&v44[4 * v43];
          if (v39)
            operator delete(v39);
        }
        else
        {
          *v62.__end_ = v35;
          v38 = v37 + 1;
        }
        v62.__end_ = v38;
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v32);
  }

  if (v62.__end_ == v62.__begin_)
    v47 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  else
    v47 = v62.__begin_;
  v48 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v47, v62.__end_ - v62.__begin_);
  v49 = -[FTTranslationResponse_TranslationPhrase low_confidence](v57, "low_confidence");
  -[FTTranslationResponse_TranslationPhrase meta_info_data](v57, "meta_info_data");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "addObjectToBuffer:", a3);

  *((_BYTE *)a3 + 70) = 1;
  v52 = *((_DWORD *)a3 + 8);
  v53 = *((_DWORD *)a3 + 12);
  LODWORD(v50) = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((char *)a3, 4, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, SHIDWORD(v56));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 12, v49, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v51);
  v54.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v52 - (unsigned __int16)v53 + (unsigned __int16)v50);
  if (v62.__begin_)
  {
    v62.__end_ = v62.__begin_;
    operator delete(v62.__begin_);
  }
  if (v67.__begin_)
  {
    v67.__end_ = v67.__begin_;
    operator delete(v67.__begin_);
  }
  return v54;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTranslationResponse_TranslationPhrase addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __55__FTTranslationResponse_TranslationPhrase_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
