@implementation FTBatchTranslationResponse_TranslatedSentence

- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3
{
  return -[FTBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4
{
  return -[FTBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTBatchTranslationResponse_TranslatedSentence *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TranslatedSentence *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *v19;
  FTBatchTranslationResponse_TranslatedSentence *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationResponse_TranslatedSentence;
  v10 = -[FTBatchTranslationResponse_TranslatedSentence init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TranslatedSentence *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTSpan)source_span
{
  FTSpan *v3;
  FTSpan *v4;
  const TranslatedSentence *root;
  const TranslatedSentence *v6;
  uint64_t v7;
  const TranslatedSentence *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("source_span"));
  v3 = (FTSpan *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTSpan alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTSpan initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("source_span"));
  }
  return v3;
}

- (NSString)engine_input
{
  const TranslatedSentence *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslatedSentence *v6;

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

- (FTSpan)target_span
{
  FTSpan *v3;
  FTSpan *v4;
  const TranslatedSentence *root;
  const TranslatedSentence *v6;
  uint64_t v7;
  const TranslatedSentence *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("target_span"));
  v3 = (FTSpan *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTSpan alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (v7 = *(unsigned __int16 *)v6[8].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTSpan initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("target_span"));
  }
  return v3;
}

- (NSArray)n_best_choices
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_choices"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__FTBatchTranslationResponse_TranslatedSentence_n_best_choices__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTBatchTranslationResponse_TranslatedSentence n_best_choices_enumerateObjectsUsingBlock:](self, "n_best_choices_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_choices"));

  }
  return (NSArray *)v3;
}

- (id)n_best_choices_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTBatchTranslationResponse_TranslationPhrase *v7;
  FTBatchTranslationResponse_TranslationPhrase *v8;
  const TranslatedSentence *root;
  const TranslatedSentence *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_choices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTBatchTranslationResponse_TranslationPhrase *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTBatchTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTBatchTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)n_best_choices_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslatedSentence *root;
  const TranslatedSentence *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_choices"));
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

- (void)n_best_choices_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTBatchTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslatedSentence *root;
  const TranslatedSentence *v8;
  uint64_t v9;
  const TranslatedSentence *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTBatchTranslationResponse_TranslationPhrase *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTBatchTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_choices"));
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
            v17 = -[FTBatchTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTBatchTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)alternative_descriptions
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__FTBatchTranslationResponse_TranslatedSentence_alternative_descriptions__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTBatchTranslationResponse_TranslatedSentence alternative_descriptions_enumerateObjectsUsingBlock:](self, "alternative_descriptions_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("alternative_descriptions"));

  }
  return (NSArray *)v3;
}

- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTMTAlternativeDescription *v7;
  FTMTAlternativeDescription *v8;
  const TranslatedSentence *root;
  const TranslatedSentence *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTMTAlternativeDescription *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xDu || (v11 = *(unsigned __int16 *)v10[12].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTMTAlternativeDescription initWithFlatbuffData:root:verify:]([FTMTAlternativeDescription alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)alternative_descriptions_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslatedSentence *root;
  const TranslatedSentence *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (v8 = *(unsigned __int16 *)v7[12].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTMTAlternativeDescription *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslatedSentence *root;
  const TranslatedSentence *v8;
  uint64_t v9;
  const TranslatedSentence *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTMTAlternativeDescription *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTMTAlternativeDescription *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      v9 = *(unsigned __int16 *)v8[12].var0;
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
            v17 = -[FTMTAlternativeDescription initWithFlatbuffData:root:verify:]([FTMTAlternativeDescription alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (BOOL)contains_masked_profanity
{
  const TranslatedSentence *root;
  const TranslatedSentence *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>)addObjectToBuffer:(void *)a3
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  const char *v8;
  size_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  int v17;
  std::vector<int>::pointer end;
  int *v19;
  std::vector<int>::pointer begin;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  char *v25;
  int *v26;
  int v27;
  std::vector<int>::pointer v28;
  int v29;
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
  int v50;
  int v51;
  int v52;
  Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence> v53;
  int v55;
  int v56;
  int String;
  int v58;
  FTBatchTranslationResponse_TranslatedSentence *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  std::vector<int> v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  std::vector<int> v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  -[FTBatchTranslationResponse_TranslatedSentence source_span](self, "source_span");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[FTBatchTranslationResponse_TranslatedSentence engine_input](self, "engine_input");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_251A15610;
  v8 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
  v9 = strlen(v8);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  -[FTBatchTranslationResponse_TranslatedSentence target_span](self, "target_span");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  memset(&v69, 0, sizeof(v69));
  -[FTBatchTranslationResponse_TranslatedSentence n_best_choices](self, "n_best_choices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v69, objc_msgSend(v11, "count"));

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[FTBatchTranslationResponse_TranslatedSentence n_best_choices](self, "n_best_choices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = self;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v12);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v17 = v16;
        end = v69.__end_;
        if (v69.__end_ >= v69.__end_cap_.__value_)
        {
          begin = v69.__begin_;
          v21 = v69.__end_ - v69.__begin_;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v23 = (char *)v69.__end_cap_.__value_ - (char *)v69.__begin_;
          if (((char *)v69.__end_cap_.__value_ - (char *)v69.__begin_) >> 1 > v22)
            v22 = v23 >> 1;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v22;
          if (v24)
          {
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v69.__end_cap_, v24);
            begin = v69.__begin_;
            end = v69.__end_;
          }
          else
          {
            v25 = 0;
          }
          v26 = (int *)&v25[4 * v21];
          *v26 = v17;
          v19 = v26 + 1;
          while (end != begin)
          {
            v27 = *--end;
            *--v26 = v27;
          }
          v69.__begin_ = v26;
          v69.__end_ = v19;
          v69.__end_cap_.__value_ = (int *)&v25[4 * v24];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v69.__end_ = v16;
          v19 = end + 1;
        }
        v69.__end_ = v19;
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v13);
  }

  if (v69.__end_ == v69.__begin_)
    v28 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>> const&)::t;
  else
    v28 = v69.__begin_;
  v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v28, v69.__end_ - v69.__begin_);
  memset(&v64, 0, sizeof(v64));
  -[FTBatchTranslationResponse_TranslatedSentence alternative_descriptions](v59, "alternative_descriptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v64, objc_msgSend(v30, "count"));

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[FTBatchTranslationResponse_TranslatedSentence alternative_descriptions](v59, "alternative_descriptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v29;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v61 != v33)
          objc_enumerationMutation(v31);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v36 = v35;
        v37 = v64.__end_;
        if (v64.__end_ >= v64.__end_cap_.__value_)
        {
          v39 = v64.__begin_;
          v40 = v64.__end_ - v64.__begin_;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v42 = (char *)v64.__end_cap_.__value_ - (char *)v64.__begin_;
          if (((char *)v64.__end_cap_.__value_ - (char *)v64.__begin_) >> 1 > v41)
            v41 = v42 >> 1;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFFCLL)
            v43 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v64.__end_cap_, v43);
            v39 = v64.__begin_;
            v37 = v64.__end_;
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
          v64.__begin_ = v45;
          v64.__end_ = v38;
          v64.__end_cap_.__value_ = (int *)&v44[4 * v43];
          if (v39)
            operator delete(v39);
        }
        else
        {
          *v64.__end_ = v35;
          v38 = v37 + 1;
        }
        v64.__end_ = v38;
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v32);
  }

  if (v64.__end_ == v64.__begin_)
    v47 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>> const&)::t;
  else
    v47 = v64.__begin_;
  v48 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v47, v64.__end_ - v64.__begin_);
  v49 = -[FTBatchTranslationResponse_TranslatedSentence contains_masked_profanity](v59, "contains_masked_profanity");
  *((_BYTE *)a3 + 70) = 1;
  v50 = *((_DWORD *)a3 + 8);
  v51 = *((_DWORD *)a3 + 12);
  v52 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v55);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 14, v49, 0);
  v53.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v50 - (unsigned __int16)v51 + v52);
  if (v64.__begin_)
  {
    v64.__end_ = v64.__begin_;
    operator delete(v64.__begin_);
  }
  if (v69.__begin_)
  {
    v69.__end_ = v69.__begin_;
    operator delete(v69.__begin_);
  }
  return v53;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTBatchTranslationResponse_TranslatedSentence addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __61__FTBatchTranslationResponse_TranslatedSentence_flatbuffData__block_invoke;
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
