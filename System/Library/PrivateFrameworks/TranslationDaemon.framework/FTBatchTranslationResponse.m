@implementation FTBatchTranslationResponse

- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3
{
  return -[FTBatchTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTBatchTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4
{
  return -[FTBatchTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTBatchTranslationResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const BatchTranslationResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::BatchTranslationResponse *v19;
  FTBatchTranslationResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTBatchTranslationResponse;
  v10 = -[FTBatchTranslationResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const BatchTranslationResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::BatchTranslationResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::BatchTranslationResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)request_id
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (int)return_code
{
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_string
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (NSString)paragraph_id
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (NSString)translated_text
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (NSArray)span
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("span"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __34__FTBatchTranslationResponse_span__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTBatchTranslationResponse span_enumerateObjectsUsingBlock:](self, "span_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("span"));

  }
  return (NSArray *)v3;
}

uint64_t __34__FTBatchTranslationResponse_span__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)span_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRepeatedSpan *v7;
  FTRepeatedSpan *v8;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("span"));
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
    if (*(unsigned __int16 *)v10->var0 < 0xFu || (v11 = *(unsigned __int16 *)v10[14].var0) == 0)
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

- (unint64_t)span_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("span"));
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

- (void)span_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRepeatedSpan *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v8;
  uint64_t v9;
  const BatchTranslationResponse *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("span"));
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

- (NSArray)translated_sentences
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_sentences"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__FTBatchTranslationResponse_translated_sentences__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTBatchTranslationResponse translated_sentences_enumerateObjectsUsingBlock:](self, "translated_sentences_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translated_sentences"));

  }
  return (NSArray *)v3;
}

uint64_t __50__FTBatchTranslationResponse_translated_sentences__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)translated_sentences_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTBatchTranslationResponse_TranslatedSentence *v7;
  FTBatchTranslationResponse_TranslatedSentence *v8;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_sentences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTBatchTranslationResponse_TranslatedSentence *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x11u || (v11 = *(unsigned __int16 *)v10[16].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:]([FTBatchTranslationResponse_TranslatedSentence alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)translated_sentences_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_sentences"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x11u && (v8 = *(unsigned __int16 *)v7[16].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)translated_sentences_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTBatchTranslationResponse_TranslatedSentence *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v8;
  uint64_t v9;
  const BatchTranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTBatchTranslationResponse_TranslatedSentence *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTBatchTranslationResponse_TranslatedSentence *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_sentences"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x11u)
    {
      v9 = *(unsigned __int16 *)v8[16].var0;
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
            v17 = -[FTBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:]([FTBatchTranslationResponse_TranslatedSentence alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSString)translated_text_romanized
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (BOOL)contains_masked_profanity
{
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse>)addObjectToBuffer:(void *)a3
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
  __CFString *v17;
  __CFString *v18;
  const char *v19;
  size_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  int v26;
  int v27;
  std::vector<int>::pointer end;
  int *v29;
  std::vector<int>::pointer begin;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  char *v35;
  int *v36;
  int v37;
  std::vector<int>::pointer v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  int v44;
  int v45;
  std::vector<int>::pointer v46;
  int *v47;
  std::vector<int>::pointer v48;
  int64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  char *v53;
  int *v54;
  int v55;
  std::vector<int>::pointer v56;
  int v57;
  __CFString *v58;
  __CFString *v59;
  const char *v60;
  size_t v61;
  int v62;
  int v63;
  int v64;
  int v65;
  Offset<siri::speech::schema_fb::BatchTranslationResponse> v66;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int String;
  FTBatchTranslationResponse *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  std::vector<int> v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  std::vector<int> v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  -[FTBatchTranslationResponse request_id](self, "request_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  v72 = -[FTBatchTranslationResponse return_code](self, "return_code");
  -[FTBatchTranslationResponse return_string](self, "return_string");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v71 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  -[FTBatchTranslationResponse paragraph_id](self, "paragraph_id");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTBatchTranslationResponse translated_text](self, "translated_text");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_251A15610;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v69 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  memset(&v84, 0, sizeof(v84));
  -[FTBatchTranslationResponse span](self, "span");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v84, objc_msgSend(v21, "count"));

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[FTBatchTranslationResponse span](self, "span");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = self;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v81 != v24)
          objc_enumerationMutation(v22);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v27 = v26;
        end = v84.__end_;
        if (v84.__end_ >= v84.__end_cap_.__value_)
        {
          begin = v84.__begin_;
          v31 = v84.__end_ - v84.__begin_;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v33 = (char *)v84.__end_cap_.__value_ - (char *)v84.__begin_;
          if (((char *)v84.__end_cap_.__value_ - (char *)v84.__begin_) >> 1 > v32)
            v32 = v33 >> 1;
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
            v34 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v34 = v32;
          if (v34)
          {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v84.__end_cap_, v34);
            begin = v84.__begin_;
            end = v84.__end_;
          }
          else
          {
            v35 = 0;
          }
          v36 = (int *)&v35[4 * v31];
          *v36 = v27;
          v29 = v36 + 1;
          while (end != begin)
          {
            v37 = *--end;
            *--v36 = v37;
          }
          v84.__begin_ = v36;
          v84.__end_ = v29;
          v84.__end_cap_.__value_ = (int *)&v35[4 * v34];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v84.__end_ = v26;
          v29 = end + 1;
        }
        v84.__end_ = v29;
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    }
    while (v23);
  }

  if (v84.__end_ == v84.__begin_)
    v38 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  else
    v38 = v84.__begin_;
  v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v38, v84.__end_ - v84.__begin_);
  memset(&v79, 0, sizeof(v79));
  -[FTBatchTranslationResponse translated_sentences](v74, "translated_sentences");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v79, objc_msgSend(v39, "count"));

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[FTBatchTranslationResponse translated_sentences](v74, "translated_sentences");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v76 != v42)
          objc_enumerationMutation(v40);
        v44 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v45 = v44;
        v46 = v79.__end_;
        if (v79.__end_ >= v79.__end_cap_.__value_)
        {
          v48 = v79.__begin_;
          v49 = v79.__end_ - v79.__begin_;
          v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v51 = (char *)v79.__end_cap_.__value_ - (char *)v79.__begin_;
          if (((char *)v79.__end_cap_.__value_ - (char *)v79.__begin_) >> 1 > v50)
            v50 = v51 >> 1;
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL)
            v52 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v52 = v50;
          if (v52)
          {
            v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v79.__end_cap_, v52);
            v48 = v79.__begin_;
            v46 = v79.__end_;
          }
          else
          {
            v53 = 0;
          }
          v54 = (int *)&v53[4 * v49];
          *v54 = v45;
          v47 = v54 + 1;
          while (v46 != v48)
          {
            v55 = *--v46;
            *--v54 = v55;
          }
          v79.__begin_ = v54;
          v79.__end_ = v47;
          v79.__end_cap_.__value_ = (int *)&v53[4 * v52];
          if (v48)
            operator delete(v48);
        }
        else
        {
          *v79.__end_ = v44;
          v47 = v46 + 1;
        }
        v79.__end_ = v47;
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    }
    while (v41);
  }

  if (v79.__end_ == v79.__begin_)
    v56 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>> const&)::t;
  else
    v56 = v79.__begin_;
  v57 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v56, v79.__end_ - v79.__begin_);
  -[FTBatchTranslationResponse translated_text_romanized](v74, "translated_text_romanized");
  v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v58)
    v58 = &stru_251A15610;
  v60 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v58), "UTF8String");
  v61 = strlen(v60);
  LODWORD(v60) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v60, v61);

  v62 = -[FTBatchTranslationResponse contains_masked_profanity](v74, "contains_masked_profanity");
  *((_BYTE *)a3 + 70) = 1;
  v63 = *((_DWORD *)a3 + 8);
  v64 = *((_DWORD *)a3 + 12);
  v65 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 6, v72, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v57);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, (int)v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 20, v62, 0);
  v66.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v63 - (unsigned __int16)v64 + v65);
  if (v79.__begin_)
  {
    v79.__end_ = v79.__begin_;
    operator delete(v79.__begin_);
  }
  if (v84.__begin_)
  {
    v84.__end_ = v84.__begin_;
    operator delete(v84.__begin_);
  }
  return v66;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTBatchTranslationResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __42__FTBatchTranslationResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FTBatchTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __62__FTBatchTranslationResponse_TranslationPhrase_repeated_spans__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

apple::aiml::flatbuffers2::DetachedBuffer *__60__FTBatchTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __63__FTBatchTranslationResponse_TranslatedSentence_n_best_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __73__FTBatchTranslationResponse_TranslatedSentence_alternative_descriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

apple::aiml::flatbuffers2::DetachedBuffer *__61__FTBatchTranslationResponse_TranslatedSentence_flatbuffData__block_invoke(uint64_t a1)
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
