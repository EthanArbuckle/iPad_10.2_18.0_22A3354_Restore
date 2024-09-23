@implementation FTStartSpeechTranslationRequest

- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3
{
  return -[FTStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4
{
  return -[FTStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTStartSpeechTranslationRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const StartSpeechTranslationRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::StartSpeechTranslationRequest *v19;
  FTStartSpeechTranslationRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartSpeechTranslationRequest;
  v10 = -[FTStartSpeechTranslationRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const StartSpeechTranslationRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::StartSpeechTranslationRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)conversation_id
{
  const StartSpeechTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationRequest *v6;

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
  const StartSpeechTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationRequest *v6;

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

- (NSArray)translation_locale_pairs
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pairs"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__FTStartSpeechTranslationRequest_translation_locale_pairs__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTStartSpeechTranslationRequest translation_locale_pairs_enumerateObjectsUsingBlock:](self, "translation_locale_pairs_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_locale_pairs"));

  }
  return (NSArray *)v3;
}

uint64_t __59__FTStartSpeechTranslationRequest_translation_locale_pairs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)translation_locale_pairs_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTranslationLocalePair *v7;
  FTTranslationLocalePair *v8;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pairs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTranslationLocalePair *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTranslationLocalePair initWithFlatbuffData:root:verify:]([FTTranslationLocalePair alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)translation_locale_pairs_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pairs"));
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

- (void)translation_locale_pairs_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTranslationLocalePair *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v8;
  uint64_t v9;
  const StartSpeechTranslationRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTranslationLocalePair *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTranslationLocalePair *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pairs"));
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
            v17 = -[FTTranslationLocalePair initWithFlatbuffData:root:verify:]([FTTranslationLocalePair alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (FTStartSpeechRequest)start_speech_request
{
  FTStartSpeechRequest *v3;
  FTStartSpeechRequest *v4;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("start_speech_request"));
  v3 = (FTStartSpeechRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTStartSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("start_speech_request"));
  }
  return v3;
}

- (FTTranslationRequest)translation_request
{
  FTTranslationRequest *v3;
  FTTranslationRequest *v4;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_request"));
  v3 = (FTTranslationRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_request"));
  }
  return v3;
}

- (NSArray)text_to_speech_requests
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text_to_speech_requests"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__FTStartSpeechTranslationRequest_text_to_speech_requests__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTStartSpeechTranslationRequest text_to_speech_requests_enumerateObjectsUsingBlock:](self, "text_to_speech_requests_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("text_to_speech_requests"));

  }
  return (NSArray *)v3;
}

uint64_t __58__FTStartSpeechTranslationRequest_text_to_speech_requests__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)text_to_speech_requests_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTextToSpeechRequest *v7;
  FTTextToSpeechRequest *v8;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text_to_speech_requests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTextToSpeechRequest *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTextToSpeechRequest initWithFlatbuffData:root:verify:]([FTTextToSpeechRequest alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)text_to_speech_requests_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text_to_speech_requests"));
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

- (void)text_to_speech_requests_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTextToSpeechRequest *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v8;
  uint64_t v9;
  const StartSpeechTranslationRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTextToSpeechRequest *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTextToSpeechRequest *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text_to_speech_requests"));
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
            v17 = -[FTTextToSpeechRequest initWithFlatbuffData:root:verify:]([FTTextToSpeechRequest alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (BOOL)restricted_mode
{
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)app_id
{
  const StartSpeechTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationRequest *v6;

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

- (int64_t)opt_in_status
{
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (BOOL)streaming_mode
{
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x17u && (v4 = *(unsigned __int16 *)v3[22].var0) != 0 && root[v4].var0[0] != 0;
}

- (FTTranslationOptions)options
{
  FTTranslationOptions *v3;
  FTTranslationOptions *v4;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("options"));
  v3 = (FTTranslationOptions *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationOptions alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationOptions initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("options"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  size_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  int v19;
  std::vector<int>::pointer end;
  int *v21;
  std::vector<int>::pointer begin;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  char *v27;
  int *v28;
  int v29;
  std::vector<int>::pointer v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  int v38;
  int v39;
  std::vector<int>::pointer v40;
  int *v41;
  std::vector<int>::pointer v42;
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  char *v47;
  int *v48;
  int v49;
  std::vector<int>::pointer v50;
  int v51;
  int v52;
  __CFString *v53;
  __CFString *v54;
  const char *v55;
  size_t v56;
  int v57;
  int v58;
  void *v59;
  int v60;
  int v61;
  int v62;
  Offset<siri::speech::schema_fb::StartSpeechTranslationRequest> v63;
  int v65;
  int v66;
  int v67;
  int v68;
  int String;
  FTStartSpeechTranslationRequest *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  std::vector<int> v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  std::vector<int> v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  -[FTStartSpeechTranslationRequest conversation_id](self, "conversation_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTStartSpeechTranslationRequest request_id](self, "request_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  memset(&v80, 0, sizeof(v80));
  -[FTStartSpeechTranslationRequest translation_locale_pairs](self, "translation_locale_pairs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v80, objc_msgSend(v13, "count"));

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[FTStartSpeechTranslationRequest translation_locale_pairs](self, "translation_locale_pairs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = self;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v77 != v16)
          objc_enumerationMutation(v14);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v19 = v18;
        end = v80.__end_;
        if (v80.__end_ >= v80.__end_cap_.__value_)
        {
          begin = v80.__begin_;
          v23 = v80.__end_ - v80.__begin_;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v25 = (char *)v80.__end_cap_.__value_ - (char *)v80.__begin_;
          if (((char *)v80.__end_cap_.__value_ - (char *)v80.__begin_) >> 1 > v24)
            v24 = v25 >> 1;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
            v26 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v80.__end_cap_, v26);
            begin = v80.__begin_;
            end = v80.__end_;
          }
          else
          {
            v27 = 0;
          }
          v28 = (int *)&v27[4 * v23];
          *v28 = v19;
          v21 = v28 + 1;
          while (end != begin)
          {
            v29 = *--end;
            *--v28 = v29;
          }
          v80.__begin_ = v28;
          v80.__end_ = v21;
          v80.__end_cap_.__value_ = (int *)&v27[4 * v26];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v80.__end_ = v18;
          v21 = end + 1;
        }
        v80.__end_ = v21;
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v15);
  }

  if (v80.__end_ == v80.__begin_)
    v30 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationLocalePair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationLocalePair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationLocalePair>> const&)::t;
  else
    v30 = v80.__begin_;
  v67 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v30, v80.__end_ - v80.__begin_);
  -[FTStartSpeechTranslationRequest start_speech_request](v70, "start_speech_request");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v31, "addObjectToBuffer:", a3);

  -[FTStartSpeechTranslationRequest translation_request](v70, "translation_request");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v32, "addObjectToBuffer:", a3);

  memset(&v75, 0, sizeof(v75));
  -[FTStartSpeechTranslationRequest text_to_speech_requests](v70, "text_to_speech_requests");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v75, objc_msgSend(v33, "count"));

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[FTStartSpeechTranslationRequest text_to_speech_requests](v70, "text_to_speech_requests");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v72 != v36)
          objc_enumerationMutation(v34);
        v38 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v39 = v38;
        v40 = v75.__end_;
        if (v75.__end_ >= v75.__end_cap_.__value_)
        {
          v42 = v75.__begin_;
          v43 = v75.__end_ - v75.__begin_;
          v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v45 = (char *)v75.__end_cap_.__value_ - (char *)v75.__begin_;
          if (((char *)v75.__end_cap_.__value_ - (char *)v75.__begin_) >> 1 > v44)
            v44 = v45 >> 1;
          if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL)
            v46 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v46 = v44;
          if (v46)
          {
            v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v75.__end_cap_, v46);
            v42 = v75.__begin_;
            v40 = v75.__end_;
          }
          else
          {
            v47 = 0;
          }
          v48 = (int *)&v47[4 * v43];
          *v48 = v39;
          v41 = v48 + 1;
          while (v40 != v42)
          {
            v49 = *--v40;
            *--v48 = v49;
          }
          v75.__begin_ = v48;
          v75.__end_ = v41;
          v75.__end_cap_.__value_ = (int *)&v47[4 * v46];
          if (v42)
            operator delete(v42);
        }
        else
        {
          *v75.__end_ = v38;
          v41 = v40 + 1;
        }
        v75.__end_ = v41;
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v35);
  }

  if (v75.__end_ == v75.__begin_)
    v50 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest>> const&)::t;
  else
    v50 = v75.__begin_;
  v51 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v50, v75.__end_ - v75.__begin_);
  v52 = -[FTStartSpeechTranslationRequest restricted_mode](v70, "restricted_mode");
  -[FTStartSpeechTranslationRequest app_id](v70, "app_id");
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (!v53)
    v53 = &stru_251A15610;
  v55 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v53), "UTF8String");
  v56 = strlen(v55);
  LODWORD(v55) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v55, v56);

  v57 = -[FTStartSpeechTranslationRequest opt_in_status](v70, "opt_in_status");
  v58 = -[FTStartSpeechTranslationRequest streaming_mode](v70, "streaming_mode");
  -[FTStartSpeechTranslationRequest options](v70, "options");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "addObjectToBuffer:", a3);

  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v59) = *((_DWORD *)a3 + 8);
  v61 = *((_DWORD *)a3 + 12);
  v62 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 16, v52, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, (int)v55);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 20, v57, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 22, v58, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 24, v60);
  v63.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v59 - (unsigned __int16)v61 + v62);
  if (v75.__begin_)
  {
    v75.__end_ = v75.__begin_;
    operator delete(v75.__begin_);
  }
  if (v80.__begin_)
  {
    v80.__end_ = v80.__begin_;
    operator delete(v80.__begin_);
  }
  return v63;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTStartSpeechTranslationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __47__FTStartSpeechTranslationRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__47__FTStartSpeechTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
