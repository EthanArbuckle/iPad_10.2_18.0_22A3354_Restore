@implementation FTSpeechTranslationMtResponse

- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4
{
  return -[FTSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTSpeechTranslationMtResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SpeechTranslationMtResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::SpeechTranslationMtResponse *v19;
  FTSpeechTranslationMtResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSpeechTranslationMtResponse;
  v10 = -[FTSpeechTranslationMtResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SpeechTranslationMtResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SpeechTranslationMtResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::SpeechTranslationMtResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)conversation_id
{
  const SpeechTranslationMtResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationMtResponse *v6;

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

- (NSString)request_id
{
  const SpeechTranslationMtResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationMtResponse *v6;

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

- (int)return_code
{
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const SpeechTranslationMtResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationMtResponse *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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

- (FTTranslationLocalePair)translation_locale_pair
{
  FTTranslationLocalePair *v3;
  FTTranslationLocalePair *v4;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v6;
  uint64_t v7;
  const SpeechTranslationMtResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pair"));
  v3 = (FTTranslationLocalePair *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationLocalePair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationLocalePair initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_locale_pair"));
  }
  return v3;
}

- (NSArray)n_best_translated_phrases
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__FTSpeechTranslationMtResponse_n_best_translated_phrases__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSpeechTranslationMtResponse n_best_translated_phrases_enumerateObjectsUsingBlock:](self, "n_best_translated_phrases_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_translated_phrases"));

  }
  return (NSArray *)v3;
}

uint64_t __58__FTSpeechTranslationMtResponse_n_best_translated_phrases__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)n_best_translated_phrases_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTSpeechTranslationMtResponse_TranslationPhrase *v7;
  FTSpeechTranslationMtResponse_TranslationPhrase *v8;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTSpeechTranslationMtResponse_TranslationPhrase *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xFu || (v11 = *(unsigned __int16 *)v10[14].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTSpeechTranslationMtResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTSpeechTranslationMtResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)n_best_translated_phrases_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (v8 = *(unsigned __int16 *)v7[14].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)n_best_translated_phrases_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTSpeechTranslationMtResponse_TranslationPhrase *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v8;
  uint64_t v9;
  const SpeechTranslationMtResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTSpeechTranslationMtResponse_TranslationPhrase *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTSpeechTranslationMtResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      v9 = *(unsigned __int16 *)v8[14].var0;
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
            v17 = -[FTSpeechTranslationMtResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTSpeechTranslationMtResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (BOOL)is_final
{
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
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
    v6[2] = __57__FTSpeechTranslationMtResponse_alternative_descriptions__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSpeechTranslationMtResponse alternative_descriptions_enumerateObjectsUsingBlock:](self, "alternative_descriptions_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("alternative_descriptions"));

  }
  return (NSArray *)v3;
}

uint64_t __57__FTSpeechTranslationMtResponse_alternative_descriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTMTAlternativeDescription *v7;
  FTMTAlternativeDescription *v8;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v10;
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
    if (*(unsigned __int16 *)v10->var0 < 0x13u || (v11 = *(unsigned __int16 *)v10[18].var0) == 0)
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
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v7;
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
    if (*(unsigned __int16 *)v7->var0 >= 0x13u && (v8 = *(unsigned __int16 *)v7[18].var0) != 0)
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
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v8;
  uint64_t v9;
  const SpeechTranslationMtResponse *v10;
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
    if (*(unsigned __int16 *)v8->var0 >= 0x13u)
    {
      v9 = *(unsigned __int16 *)v8[18].var0;
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
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationMtResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  size_t v12;
  __CFString *v13;
  __CFString *v14;
  const char *v15;
  size_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  int v24;
  std::vector<int>::pointer end;
  int *v26;
  std::vector<int>::pointer begin;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  char *v32;
  int *v33;
  int v34;
  std::vector<int>::pointer v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  int v41;
  int v42;
  std::vector<int>::pointer v43;
  int *v44;
  std::vector<int>::pointer v45;
  int64_t v46;
  unint64_t v47;
  int64_t v48;
  unint64_t v49;
  char *v50;
  int *v51;
  int v52;
  std::vector<int>::pointer v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  Offset<siri::speech::schema_fb::SpeechTranslationMtResponse> v59;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int String;
  FTSpeechTranslationMtResponse *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  std::vector<int> v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  std::vector<int> v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  -[FTSpeechTranslationMtResponse conversation_id](self, "conversation_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTSpeechTranslationMtResponse request_id](self, "request_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v66 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  v65 = -[FTSpeechTranslationMtResponse return_code](self, "return_code");
  -[FTSpeechTranslationMtResponse return_str](self, "return_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v64 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTSpeechTranslationMtResponse translation_locale_pair](self, "translation_locale_pair");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v17, "addObjectToBuffer:", a3);

  memset(&v78, 0, sizeof(v78));
  -[FTSpeechTranslationMtResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v78, objc_msgSend(v18, "count"));

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  -[FTSpeechTranslationMtResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = self;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v75 != v21)
          objc_enumerationMutation(v19);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v24 = v23;
        end = v78.__end_;
        if (v78.__end_ >= v78.__end_cap_.__value_)
        {
          begin = v78.__begin_;
          v28 = v78.__end_ - v78.__begin_;
          v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v30 = (char *)v78.__end_cap_.__value_ - (char *)v78.__begin_;
          if (((char *)v78.__end_cap_.__value_ - (char *)v78.__begin_) >> 1 > v29)
            v29 = v30 >> 1;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL)
            v31 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v31 = v29;
          if (v31)
          {
            v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v78.__end_cap_, v31);
            begin = v78.__begin_;
            end = v78.__end_;
          }
          else
          {
            v32 = 0;
          }
          v33 = (int *)&v32[4 * v28];
          *v33 = v24;
          v26 = v33 + 1;
          while (end != begin)
          {
            v34 = *--end;
            *--v33 = v34;
          }
          v78.__begin_ = v33;
          v78.__end_ = v26;
          v78.__end_cap_.__value_ = (int *)&v32[4 * v31];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v78.__end_ = v23;
          v26 = end + 1;
        }
        v78.__end_ = v26;
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    }
    while (v20);
  }

  if (v78.__end_ == v78.__begin_)
    v35 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>> const&)::t;
  else
    v35 = v78.__begin_;
  v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v35, v78.__end_ - v78.__begin_);
  v61 = -[FTSpeechTranslationMtResponse is_final](v68, "is_final");
  memset(&v73, 0, sizeof(v73));
  -[FTSpeechTranslationMtResponse alternative_descriptions](v68, "alternative_descriptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v73, objc_msgSend(v36, "count"));

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[FTSpeechTranslationMtResponse alternative_descriptions](v68, "alternative_descriptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v70 != v39)
          objc_enumerationMutation(v37);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v42 = v41;
        v43 = v73.__end_;
        if (v73.__end_ >= v73.__end_cap_.__value_)
        {
          v45 = v73.__begin_;
          v46 = v73.__end_ - v73.__begin_;
          v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v48 = (char *)v73.__end_cap_.__value_ - (char *)v73.__begin_;
          if (((char *)v73.__end_cap_.__value_ - (char *)v73.__begin_) >> 1 > v47)
            v47 = v48 >> 1;
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL)
            v49 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v49 = v47;
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v73.__end_cap_, v49);
            v45 = v73.__begin_;
            v43 = v73.__end_;
          }
          else
          {
            v50 = 0;
          }
          v51 = (int *)&v50[4 * v46];
          *v51 = v42;
          v44 = v51 + 1;
          while (v43 != v45)
          {
            v52 = *--v43;
            *--v51 = v52;
          }
          v73.__begin_ = v51;
          v73.__end_ = v44;
          v73.__end_cap_.__value_ = (int *)&v50[4 * v49];
          if (v45)
            operator delete(v45);
        }
        else
        {
          *v73.__end_ = v41;
          v44 = v43 + 1;
        }
        v73.__end_ = v44;
      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    }
    while (v38);
  }

  if (v73.__end_ == v73.__begin_)
    v53 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>> const&)::t;
  else
    v53 = v73.__begin_;
  v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v53, v73.__end_ - v73.__begin_);
  v55 = -[FTSpeechTranslationMtResponse contains_masked_profanity](v68, "contains_masked_profanity");
  *((_BYTE *)a3 + 70) = 1;
  v56 = *((_DWORD *)a3 + 8);
  v57 = *((_DWORD *)a3 + 12);
  v58 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v65, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v64);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v63);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 16, v61, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 20, v55, 0);
  v59.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v56 - (unsigned __int16)v57 + v58);
  if (v73.__begin_)
  {
    v73.__end_ = v73.__begin_;
    operator delete(v73.__begin_);
  }
  if (v78.__begin_)
  {
    v78.__end_ = v78.__begin_;
    operator delete(v78.__begin_);
  }
  return v59;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTSpeechTranslationMtResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __45__FTSpeechTranslationMtResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__45__FTSpeechTranslationMtResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__63__FTSpeechTranslationMtResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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
