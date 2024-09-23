@implementation FTTranslationPhraseMetaInfo_AlternativeSelectedSpan

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3
{
  return -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3 root:(const AlternativeSelectedSpan *)a4
{
  return -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan)initWithFlatbuffData:(id)a3 root:(const AlternativeSelectedSpan *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const AlternativeSelectedSpan *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan *v19;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationPhraseMetaInfo_AlternativeSelectedSpan;
  v10 = -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const AlternativeSelectedSpan *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range)source_range
{
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *v3;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *v4;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v6;
  uint64_t v7;
  const AlternativeSelectedSpan *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("source_range"));
  v3 = (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("source_range"));
  }
  return v3;
}

- (NSArray)projection_ranges
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("projection_ranges"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __72__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_projection_ranges__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan projection_ranges_enumerateObjectsUsingBlock:](self, "projection_ranges_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("projection_ranges"));

  }
  return (NSArray *)v3;
}

- (id)projection_ranges_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *v7;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *v8;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("projection_ranges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range initWithFlatbuffData:root:verify:]([FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)projection_ranges_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("projection_ranges"));
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

- (void)projection_ranges_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v8;
  uint64_t v9;
  const AlternativeSelectedSpan *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("projection_ranges"));
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
            v17 = -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range initWithFlatbuffData:root:verify:]([FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Range alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)alternatives
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternatives"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_alternatives__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan alternatives_enumerateObjectsUsingBlock:](self, "alternatives_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("alternatives"));

  }
  return (NSArray *)v3;
}

- (id)alternatives_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *v7;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *v8;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternatives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative initWithFlatbuffData:root:verify:]([FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)alternatives_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternatives"));
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

- (void)alternatives_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const AlternativeSelectedSpan *root;
  const AlternativeSelectedSpan *v8;
  uint64_t v9;
  const AlternativeSelectedSpan *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternatives"));
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
            v17 = -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative initWithFlatbuffData:root:verify:]([FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_Alternative alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  std::vector<int>::pointer end;
  int *v14;
  std::vector<int>::pointer begin;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  char *v20;
  int *v21;
  int v22;
  std::vector<int>::pointer v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  int v30;
  int v31;
  std::vector<int>::pointer v32;
  int *v33;
  std::vector<int>::pointer v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;
  char *v39;
  int *v40;
  int v41;
  std::vector<int>::pointer v42;
  int v43;
  int v44;
  int v45;
  int v46;
  Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan> v47;
  int v49;
  FTTranslationPhraseMetaInfo_AlternativeSelectedSpan *v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  std::vector<int> v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  std::vector<int> v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan source_range](self, "source_range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  memset(&v61, 0, sizeof(v61));
  -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan projection_ranges](self, "projection_ranges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v61, objc_msgSend(v6, "count"));

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan projection_ranges](self, "projection_ranges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = self;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v7);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v12 = v11;
        end = v61.__end_;
        if (v61.__end_ >= v61.__end_cap_.__value_)
        {
          begin = v61.__begin_;
          v16 = v61.__end_ - v61.__begin_;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v18 = (char *)v61.__end_cap_.__value_ - (char *)v61.__begin_;
          if (((char *)v61.__end_cap_.__value_ - (char *)v61.__begin_) >> 1 > v17)
            v17 = v18 >> 1;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          if (v19)
          {
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v61.__end_cap_, v19);
            begin = v61.__begin_;
            end = v61.__end_;
          }
          else
          {
            v20 = 0;
          }
          v21 = (int *)&v20[4 * v16];
          *v21 = v12;
          v14 = v21 + 1;
          while (end != begin)
          {
            v22 = *--end;
            *--v21 = v22;
          }
          v61.__begin_ = v21;
          v61.__end_ = v14;
          v61.__end_cap_.__value_ = (int *)&v20[4 * v19];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v61.__end_ = v11;
          v14 = end + 1;
        }
        v61.__end_ = v14;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v8);
  }

  if (v61.__end_ == v61.__begin_)
    v23 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Range>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Range>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Range>> const&)::t;
  else
    v23 = v61.__begin_;
  v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, v61.__end_ - v61.__begin_);
  memset(&v56, 0, sizeof(v56));
  -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan alternatives](v50, "alternatives");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, objc_msgSend(v25, "count"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan alternatives](v50, "alternatives");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v24;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v53 != v28)
          objc_enumerationMutation(v26);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v31 = v30;
        v32 = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          v34 = v56.__begin_;
          v35 = v56.__end_ - v56.__begin_;
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v37 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v36)
            v36 = v37 >> 1;
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
            v38 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v38 = v36;
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v38);
            v34 = v56.__begin_;
            v32 = v56.__end_;
          }
          else
          {
            v39 = 0;
          }
          v40 = (int *)&v39[4 * v35];
          *v40 = v31;
          v33 = v40 + 1;
          while (v32 != v34)
          {
            v41 = *--v32;
            *--v40 = v41;
          }
          v56.__begin_ = v40;
          v56.__end_ = v33;
          v56.__end_cap_.__value_ = (int *)&v39[4 * v38];
          if (v34)
            operator delete(v34);
        }
        else
        {
          *v56.__end_ = v30;
          v33 = v32 + 1;
        }
        v56.__end_ = v33;
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v27);
  }

  if (v56.__end_ == v56.__begin_)
    v42 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationPhraseMetaInfo_::AlternativeSelectedSpan_::Alternative>> const&)::t;
  else
    v42 = v56.__begin_;
  v43 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v42, v56.__end_ - v56.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v44 = *((_DWORD *)a3 + 8);
  v45 = *((_DWORD *)a3 + 12);
  v46 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v43);
  v47.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v44 - (unsigned __int16)v45 + v46);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  if (v61.__begin_)
  {
    v61.__end_ = v61.__begin_;
    operator delete(v61.__begin_);
  }
  return v47;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTranslationPhraseMetaInfo_AlternativeSelectedSpan addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __67__FTTranslationPhraseMetaInfo_AlternativeSelectedSpan_flatbuffData__block_invoke;
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
