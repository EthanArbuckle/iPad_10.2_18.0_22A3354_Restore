@implementation FTStartSpeechTranslationLoggingRequest

- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3
{
  return -[FTStartSpeechTranslationLoggingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTStartSpeechTranslationLoggingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4
{
  return -[FTStartSpeechTranslationLoggingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTStartSpeechTranslationLoggingRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationLoggingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTStartSpeechTranslationLoggingRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const StartSpeechTranslationLoggingRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *v19;
  FTStartSpeechTranslationLoggingRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartSpeechTranslationLoggingRequest;
  v10 = -[FTStartSpeechTranslationLoggingRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const StartSpeechTranslationLoggingRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::StartSpeechTranslationLoggingRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::StartSpeechTranslationLoggingRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)conversation_id
{
  const StartSpeechTranslationLoggingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationLoggingRequest *v6;

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
  const StartSpeechTranslationLoggingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationLoggingRequest *v6;

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

- (FTTranslationLocalePair)translation_locale_pair
{
  FTTranslationLocalePair *v3;
  FTTranslationLocalePair *v4;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationLoggingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pair"));
  v3 = (FTTranslationLocalePair *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationLocalePair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (v7 = *(unsigned __int16 *)v6[8].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationLocalePair initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_locale_pair"));
  }
  return v3;
}

- (FTLanguageDetected)detected_locale
{
  FTLanguageDetected *v3;
  FTLanguageDetected *v4;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationLoggingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("detected_locale"));
  v3 = (FTLanguageDetected *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTLanguageDetected alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTLanguageDetected initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("detected_locale"));
  }
  return v3;
}

- (NSString)user_selected_locale
{
  const StartSpeechTranslationLoggingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationLoggingRequest *v6;

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

- (NSArray)senses
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("senses"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__FTStartSpeechTranslationLoggingRequest_senses__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTStartSpeechTranslationLoggingRequest senses_enumerateObjectsUsingBlock:](self, "senses_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("senses"));

  }
  return (NSArray *)v3;
}

uint64_t __48__FTStartSpeechTranslationLoggingRequest_senses__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)senses_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("senses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
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
    v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13 + 1, *v13, 4);
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (unint64_t)senses_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("senses"));
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

- (void)senses_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v8;
  uint64_t v9;
  const StartSpeechTranslationLoggingRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *var0;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("senses"));
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
        v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        v11 = *(unsigned int *)v10->var0;
        if ((_DWORD)v11)
        {
          v12 = 4 - 4 * v11;
          v13 = 1;
          v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[v14 + *var0], *(unsigned int *)((char *)var0 + *var0), 4);
            v4[2](v4, v16, v13 - 1, &v19);
            v17 = v19;

            if (v17)
              break;
            v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }

}

- (NSString)user_selected_sense
{
  const StartSpeechTranslationLoggingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationLoggingRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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

- (NSArray)user_interacted_senses
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_interacted_senses"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64__FTStartSpeechTranslationLoggingRequest_user_interacted_senses__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTStartSpeechTranslationLoggingRequest user_interacted_senses_enumerateObjectsUsingBlock:](self, "user_interacted_senses_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_interacted_senses"));

  }
  return (NSArray *)v3;
}

uint64_t __64__FTStartSpeechTranslationLoggingRequest_user_interacted_senses__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)user_interacted_senses_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_interacted_senses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
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
    v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13 + 1, *v13, 4);
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (unint64_t)user_interacted_senses_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_interacted_senses"));
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

- (void)user_interacted_senses_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const StartSpeechTranslationLoggingRequest *root;
  const StartSpeechTranslationLoggingRequest *v8;
  uint64_t v9;
  const StartSpeechTranslationLoggingRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *var0;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_interacted_senses"));
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
        v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        v11 = *(unsigned int *)v10->var0;
        if ((_DWORD)v11)
        {
          v12 = 4 - 4 * v11;
          v13 = 1;
          v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[v14 + *var0], *(unsigned int *)((char *)var0 + *var0), 4);
            v4[2](v4, v16, v13 - 1, &v19);
            v17 = v19;

            if (v17)
              break;
            v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }

}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationLoggingRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  const char *v16;
  size_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  const char *v23;
  size_t v24;
  int v25;
  int v26;
  std::vector<int>::pointer end;
  int *v28;
  std::vector<int>::pointer begin;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  char *v34;
  int *v35;
  int v36;
  std::vector<int>::pointer v37;
  __CFString *v38;
  __CFString *v39;
  const char *v40;
  size_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  const char *v47;
  size_t v48;
  int v49;
  int v50;
  std::vector<int>::pointer v51;
  int *v52;
  std::vector<int>::pointer v53;
  int64_t v54;
  unint64_t v55;
  int64_t v56;
  unint64_t v57;
  char *v58;
  int *v59;
  int v60;
  std::vector<int>::pointer v61;
  int v62;
  int v63;
  int v64;
  int v65;
  Offset<siri::speech::schema_fb::StartSpeechTranslationLoggingRequest> v66;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int String;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  std::vector<int> v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  std::vector<int> v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  -[FTStartSpeechTranslationLoggingRequest conversation_id](self, "conversation_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_251A15610;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  -[FTStartSpeechTranslationLoggingRequest request_id](self, "request_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_251A15610;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);

  -[FTStartSpeechTranslationLoggingRequest translation_locale_pair](self, "translation_locale_pair");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  -[FTStartSpeechTranslationLoggingRequest detected_locale](self, "detected_locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v13, "addObjectToBuffer:", a3);

  -[FTStartSpeechTranslationLoggingRequest user_selected_locale](self, "user_selected_locale");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    v14 = &stru_251A15610;
  v16 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
  v17 = strlen(v16);
  v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v16, v17);

  memset(&v85, 0, sizeof(v85));
  -[FTStartSpeechTranslationLoggingRequest senses](self, "senses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v85, objc_msgSend(v18, "count"));

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[FTStartSpeechTranslationLoggingRequest senses](self, "senses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v82 != v21)
          objc_enumerationMutation(v19);
        v23 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i)), "UTF8String");
        v24 = strlen(v23);
        v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);
        v26 = v25;
        end = v85.__end_;
        if (v85.__end_ >= v85.__end_cap_.__value_)
        {
          begin = v85.__begin_;
          v30 = v85.__end_ - v85.__begin_;
          v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v32 = (char *)v85.__end_cap_.__value_ - (char *)v85.__begin_;
          if (((char *)v85.__end_cap_.__value_ - (char *)v85.__begin_) >> 1 > v31)
            v31 = v32 >> 1;
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
            v33 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v33 = v31;
          if (v33)
          {
            v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v85.__end_cap_, v33);
            begin = v85.__begin_;
            end = v85.__end_;
          }
          else
          {
            v34 = 0;
          }
          v35 = (int *)&v34[4 * v30];
          *v35 = v26;
          v28 = v35 + 1;
          while (end != begin)
          {
            v36 = *--end;
            *--v35 = v36;
          }
          v85.__begin_ = v35;
          v85.__end_ = v28;
          v85.__end_cap_.__value_ = (int *)&v34[4 * v33];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v85.__end_ = v25;
          v28 = end + 1;
        }
        v85.__end_ = v28;
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    }
    while (v20);
  }

  if (v85.__end_ == v85.__begin_)
    v37 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v37 = v85.__begin_;
  v69 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v37, v85.__end_ - v85.__begin_);
  -[FTStartSpeechTranslationLoggingRequest user_selected_sense](self, "user_selected_sense");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v38)
    v38 = &stru_251A15610;
  v40 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v38), "UTF8String");
  v41 = strlen(v40);
  v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v40, v41);

  memset(&v80, 0, sizeof(v80));
  -[FTStartSpeechTranslationLoggingRequest user_interacted_senses](self, "user_interacted_senses");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v80, objc_msgSend(v42, "count"));

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[FTStartSpeechTranslationLoggingRequest user_interacted_senses](self, "user_interacted_senses");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v77 != v45)
          objc_enumerationMutation(v43);
        v47 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j)), "UTF8String");
        v48 = strlen(v47);
        v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);
        v50 = v49;
        v51 = v80.__end_;
        if (v80.__end_ >= v80.__end_cap_.__value_)
        {
          v53 = v80.__begin_;
          v54 = v80.__end_ - v80.__begin_;
          v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v56 = (char *)v80.__end_cap_.__value_ - (char *)v80.__begin_;
          if (((char *)v80.__end_cap_.__value_ - (char *)v80.__begin_) >> 1 > v55)
            v55 = v56 >> 1;
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
            v57 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v57 = v55;
          if (v57)
          {
            v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v80.__end_cap_, v57);
            v53 = v80.__begin_;
            v51 = v80.__end_;
          }
          else
          {
            v58 = 0;
          }
          v59 = (int *)&v58[4 * v54];
          *v59 = v50;
          v52 = v59 + 1;
          while (v51 != v53)
          {
            v60 = *--v51;
            *--v59 = v60;
          }
          v80.__begin_ = v59;
          v80.__end_ = v52;
          v80.__end_cap_.__value_ = (int *)&v58[4 * v57];
          if (v53)
            operator delete(v53);
        }
        else
        {
          *v80.__end_ = v49;
          v52 = v51 + 1;
        }
        v80.__end_ = v52;
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v44);
  }

  if (v80.__end_ == v80.__begin_)
    v61 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v61 = v80.__begin_;
  v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v61, v80.__end_ - v80.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v63 = *((_DWORD *)a3 + 8);
  v64 = *((_DWORD *)a3 + 12);
  v65 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v62);
  v66.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v63 - (unsigned __int16)v64 + v65);
  if (v80.__begin_)
  {
    v80.__end_ = v80.__begin_;
    operator delete(v80.__begin_);
  }
  if (v85.__begin_)
  {
    v85.__end_ = v85.__begin_;
    operator delete(v85.__begin_);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTStartSpeechTranslationLoggingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __54__FTStartSpeechTranslationLoggingRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTStartSpeechTranslationLoggingRequest_flatbuffData__block_invoke(uint64_t a1)
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
