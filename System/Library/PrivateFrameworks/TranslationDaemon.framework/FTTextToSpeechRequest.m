@implementation FTTextToSpeechRequest

- (FTTextToSpeechRequest)initWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4
{
  return -[FTTextToSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTextToSpeechRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TextToSpeechRequest *v19;
  FTTextToSpeechRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechRequest;
  v10 = -[FTTextToSpeechRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TextToSpeechRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (NSString)language
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (NSString)gender
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (NSString)text
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (int64_t)audio_type
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (BOOL)enable_word_timing_info
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)voice_name
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (NSArray)context_info
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTTextToSpeechRequest_context_info__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechRequest context_info_enumerateObjectsUsingBlock:](self, "context_info_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_info"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTTextToSpeechRequest_context_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)context_info_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTextToSpeechRequest_ContextInfoEntry *v7;
  FTTextToSpeechRequest_ContextInfoEntry *v8;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTextToSpeechRequest_ContextInfoEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x15u || (v11 = *(unsigned __int16 *)v10[20].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTextToSpeechRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([FTTextToSpeechRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)context_info_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x15u && (v8 = *(unsigned __int16 *)v7[20].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)context_info_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTextToSpeechRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v8;
  uint64_t v9;
  const TextToSpeechRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTextToSpeechRequest_ContextInfoEntry *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTextToSpeechRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x15u)
    {
      v9 = *(unsigned __int16 *)v8[20].var0;
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
            v17 = -[FTTextToSpeechRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([FTTextToSpeechRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (int64_t)preferred_voice_type
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (v4 = *(unsigned __int16 *)v3[22].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (FTTextToSpeechRequestMeta)meta_info
{
  FTTextToSpeechRequestMeta *v3;
  FTTextToSpeechRequestMeta *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (FTTextToSpeechRequestMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (FTTextToSpeechRequestContext)context
{
  FTTextToSpeechRequestContext *v3;
  FTTextToSpeechRequestContext *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context"));
  v3 = (FTTextToSpeechRequestContext *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestContext alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (v7 = *(unsigned __int16 *)v6[26].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestContext initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context"));
  }
  return v3;
}

- (FTTextToSpeechRequestExperiment)experiment
{
  FTTextToSpeechRequestExperiment *v3;
  FTTextToSpeechRequestExperiment *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("experiment"));
  v3 = (FTTextToSpeechRequestExperiment *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestExperiment alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (v7 = *(unsigned __int16 *)v6[28].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestExperiment initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("experiment"));
  }
  return v3;
}

- (FTTTSRequestFeatureFlags)feature_flags
{
  FTTTSRequestFeatureFlags *v3;
  FTTTSRequestFeatureFlags *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
  v3 = (FTTTSRequestFeatureFlags *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTTSRequestFeatureFlags alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (v7 = *(unsigned __int16 *)v6[30].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("feature_flags"));
  }
  return v3;
}

- (FTTextToSpeechRequestDebug)debug
{
  FTTextToSpeechRequestDebug *v3;
  FTTextToSpeechRequestDebug *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("debug"));
  v3 = (FTTextToSpeechRequestDebug *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestDebug alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (v7 = *(unsigned __int16 *)v6[32].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestDebug initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("debug"));
  }
  return v3;
}

- (FTTextToSpeechUserProfile)profile
{
  FTTextToSpeechUserProfile *v3;
  FTTextToSpeechUserProfile *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("profile"));
  v3 = (FTTextToSpeechUserProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechUserProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (v7 = *(unsigned __int16 *)v6[34].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechUserProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("profile"));
  }
  return v3;
}

- (FTTextToSpeechRequestDevConfig)dev_config
{
  FTTextToSpeechRequestDevConfig *v3;
  FTTextToSpeechRequestDevConfig *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("dev_config"));
  v3 = (FTTextToSpeechRequestDevConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestDevConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (v7 = *(unsigned __int16 *)v6[36].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestDevConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("dev_config"));
  }
  return v3;
}

- (FTTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  FTTextToSpeechRequestProsodyTransferConfig *v3;
  FTTextToSpeechRequestProsodyTransferConfig *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_config"));
  v3 = (FTTextToSpeechRequestProsodyTransferConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestProsodyTransferConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (v7 = *(unsigned __int16 *)v6[38].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestProsodyTransferConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_config"));
  }
  return v3;
}

- (FTTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  FTTextToSpeechRequestProsodyControlConfig *v3;
  FTTextToSpeechRequestProsodyControlConfig *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_control_config"));
  v3 = (FTTextToSpeechRequestProsodyControlConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (v7 = *(unsigned __int16 *)v6[40].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestProsodyControlConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_control_config"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3
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
  __CFString *v21;
  __CFString *v22;
  const char *v23;
  size_t v24;
  __CFString *v25;
  __CFString *v26;
  const char *v27;
  size_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  int v34;
  int v35;
  std::vector<int>::pointer end;
  int *v37;
  std::vector<int>::pointer begin;
  int64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  char *v43;
  int *v44;
  int v45;
  std::vector<int>::pointer v46;
  int v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  Offset<siri::speech::schema_fb::TextToSpeechRequest> v62;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int String;
  FTTextToSpeechRequest *v76;
  int v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  std::vector<int> v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  -[FTTextToSpeechRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTTextToSpeechRequest session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v74 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  -[FTTextToSpeechRequest language](self, "language");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTTextToSpeechRequest gender](self, "gender");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_251A15610;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v72 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  -[FTTextToSpeechRequest text](self, "text");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_251A15610;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v71 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  v70 = -[FTTextToSpeechRequest audio_type](self, "audio_type");
  v69 = -[FTTextToSpeechRequest enable_word_timing_info](self, "enable_word_timing_info");
  -[FTTextToSpeechRequest voice_name](self, "voice_name");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_251A15610;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  memset(&v82, 0, sizeof(v82));
  -[FTTextToSpeechRequest context_info](self, "context_info");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v82, objc_msgSend(v29, "count"));

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[FTTextToSpeechRequest context_info](self, "context_info");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = self;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v79 != v32)
          objc_enumerationMutation(v30);
        v34 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v35 = v34;
        end = v82.__end_;
        if (v82.__end_ >= v82.__end_cap_.__value_)
        {
          begin = v82.__begin_;
          v39 = v82.__end_ - v82.__begin_;
          v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v41 = (char *)v82.__end_cap_.__value_ - (char *)v82.__begin_;
          if (((char *)v82.__end_cap_.__value_ - (char *)v82.__begin_) >> 1 > v40)
            v40 = v41 >> 1;
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL)
            v42 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v42 = v40;
          if (v42)
          {
            v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v82.__end_cap_, v42);
            begin = v82.__begin_;
            end = v82.__end_;
          }
          else
          {
            v43 = 0;
          }
          v44 = (int *)&v43[4 * v39];
          *v44 = v35;
          v37 = v44 + 1;
          while (end != begin)
          {
            v45 = *--end;
            *--v44 = v45;
          }
          v82.__begin_ = v44;
          v82.__end_ = v37;
          v82.__end_cap_.__value_ = (int *)&v43[4 * v42];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v82.__end_ = v34;
          v37 = end + 1;
        }
        v82.__end_ = v37;
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    }
    while (v31);
  }

  if (v82.__end_ == v82.__begin_)
    v46 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  else
    v46 = v82.__begin_;
  v47 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v46, v82.__end_ - v82.__begin_);
  v48 = -[FTTextToSpeechRequest preferred_voice_type](v76, "preferred_voice_type");
  -[FTTextToSpeechRequest meta_info](v76, "meta_info");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest context](v76, "context");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest experiment](v76, "experiment");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest feature_flags](v76, "feature_flags");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v55, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest debug](v76, "debug");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v56, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest profile](v76, "profile");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v57, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest dev_config](v76, "dev_config");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = objc_msgSend(v58, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest prosody_config](v76, "prosody_config");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v58) = objc_msgSend(v59, "addObjectToBuffer:", a3);

  -[FTTextToSpeechRequest prosody_control_config](v76, "prosody_control_config");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "addObjectToBuffer:", a3);

  *((_BYTE *)a3 + 70) = 1;
  v77 = *((_DWORD *)a3 + 8);
  v64 = *((_DWORD *)a3 + 12);
  LODWORD(v60) = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 14, v70, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 16, v69, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 20, v47);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 22, v48, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 24, v50);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 26, v52);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 28, v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 30, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 32, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 34, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 36, (int)v57);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 38, (int)v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 40, v61);
  v62.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v77 - (unsigned __int16)v64 + (unsigned __int16)v60);
  if (v82.__begin_)
  {
    v82.__end_ = v82.__begin_;
    operator delete(v82.__begin_);
  }
  return v62;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTextToSpeechRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __37__FTTextToSpeechRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTTextToSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTTextToSpeechRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
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
