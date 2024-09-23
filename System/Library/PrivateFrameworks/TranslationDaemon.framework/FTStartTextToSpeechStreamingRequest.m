@implementation FTStartTextToSpeechStreamingRequest

- (FTStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3
{
  return -[FTStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4
{
  return -[FTStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTStartTextToSpeechStreamingRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::StartTextToSpeechStreamingRequest *v19;
  FTStartTextToSpeechStreamingRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartTextToSpeechStreamingRequest;
  v10 = -[FTStartTextToSpeechStreamingRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const StartTextToSpeechStreamingRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::StartTextToSpeechStreamingRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

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
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

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

- (NSString)stream_id
{
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

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

- (NSString)language
{
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

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

- (NSString)gender
{
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

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

- (NSString)text
{
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (BOOL)enable_word_timing_info
{
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)voice_name
{
  const StartTextToSpeechStreamingRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartTextToSpeechStreamingRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 20].var0;
  if (*(_WORD *)root[-v3 + 20].var0)
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
    v6[2] = __51__FTStartTextToSpeechStreamingRequest_context_info__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTStartTextToSpeechStreamingRequest context_info_enumerateObjectsUsingBlock:](self, "context_info_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_info"));

  }
  return (NSArray *)v3;
}

uint64_t __51__FTStartTextToSpeechStreamingRequest_context_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)context_info_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTStartTextToSpeechStreamingRequest_ContextInfoEntry *v7;
  FTStartTextToSpeechStreamingRequest_ContextInfoEntry *v8;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTStartTextToSpeechStreamingRequest_ContextInfoEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x17u || (v11 = *(unsigned __int16 *)v10[22].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTStartTextToSpeechStreamingRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([FTStartTextToSpeechStreamingRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v7;
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
    if (*(unsigned __int16 *)v7->var0 >= 0x17u && (v8 = *(unsigned __int16 *)v7[22].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)context_info_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTStartTextToSpeechStreamingRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v8;
  uint64_t v9;
  const StartTextToSpeechStreamingRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTStartTextToSpeechStreamingRequest_ContextInfoEntry *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTStartTextToSpeechStreamingRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *))a3;
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
    if (*(unsigned __int16 *)v8->var0 >= 0x17u)
    {
      v9 = *(unsigned __int16 *)v8[22].var0;
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
            v17 = -[FTStartTextToSpeechStreamingRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([FTStartTextToSpeechStreamingRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x19u && (v4 = *(unsigned __int16 *)v3[24].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (FTTextToSpeechRequestMeta)meta_info
{
  FTTextToSpeechRequestMeta *v3;
  FTTextToSpeechRequestMeta *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (FTTextToSpeechRequestMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (v7 = *(unsigned __int16 *)v6[26].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context"));
  v3 = (FTTextToSpeechRequestContext *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestContext alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (v7 = *(unsigned __int16 *)v6[28].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("experiment"));
  v3 = (FTTextToSpeechRequestExperiment *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestExperiment alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (v7 = *(unsigned __int16 *)v6[30].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
  v3 = (FTTTSRequestFeatureFlags *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTTSRequestFeatureFlags alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (v7 = *(unsigned __int16 *)v6[32].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("debug"));
  v3 = (FTTextToSpeechRequestDebug *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestDebug alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (v7 = *(unsigned __int16 *)v6[34].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("profile"));
  v3 = (FTTextToSpeechUserProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechUserProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (v7 = *(unsigned __int16 *)v6[36].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("dev_config"));
  v3 = (FTTextToSpeechRequestDevConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestDevConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (v7 = *(unsigned __int16 *)v6[38].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_config"));
  v3 = (FTTextToSpeechRequestProsodyTransferConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestProsodyTransferConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (v7 = *(unsigned __int16 *)v6[40].var0) != 0)
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
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_control_config"));
  v3 = (FTTextToSpeechRequestProsodyControlConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x2Bu && (v7 = *(unsigned __int16 *)v6[42].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechRequestProsodyControlConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_control_config"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest>)addObjectToBuffer:(void *)a3
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
  __CFString *v29;
  __CFString *v30;
  const char *v31;
  size_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  int v38;
  int v39;
  std::vector<int>::pointer end;
  int *v41;
  std::vector<int>::pointer begin;
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
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest> v65;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int String;
  FTStartTextToSpeechStreamingRequest *v80;
  int v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  std::vector<int> v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  -[FTStartTextToSpeechStreamingRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTStartTextToSpeechStreamingRequest session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v78 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  -[FTStartTextToSpeechStreamingRequest stream_id](self, "stream_id");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v77 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTStartTextToSpeechStreamingRequest language](self, "language");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_251A15610;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v76 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  -[FTStartTextToSpeechStreamingRequest gender](self, "gender");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_251A15610;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v75 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  -[FTStartTextToSpeechStreamingRequest text](self, "text");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_251A15610;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v74 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  v73 = -[FTStartTextToSpeechStreamingRequest audio_type](self, "audio_type");
  v72 = -[FTStartTextToSpeechStreamingRequest enable_word_timing_info](self, "enable_word_timing_info");
  -[FTStartTextToSpeechStreamingRequest voice_name](self, "voice_name");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
    v29 = &stru_251A15610;
  v31 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v29), "UTF8String");
  v32 = strlen(v31);
  v71 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31, v32);

  memset(&v86, 0, sizeof(v86));
  -[FTStartTextToSpeechStreamingRequest context_info](self, "context_info");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v86, objc_msgSend(v33, "count"));

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[FTStartTextToSpeechStreamingRequest context_info](self, "context_info");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = self;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v83 != v36)
          objc_enumerationMutation(v34);
        v38 = objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v39 = v38;
        end = v86.__end_;
        if (v86.__end_ >= v86.__end_cap_.__value_)
        {
          begin = v86.__begin_;
          v43 = v86.__end_ - v86.__begin_;
          v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v45 = (char *)v86.__end_cap_.__value_ - (char *)v86.__begin_;
          if (((char *)v86.__end_cap_.__value_ - (char *)v86.__begin_) >> 1 > v44)
            v44 = v45 >> 1;
          if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL)
            v46 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v46 = v44;
          if (v46)
          {
            v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v86.__end_cap_, v46);
            begin = v86.__begin_;
            end = v86.__end_;
          }
          else
          {
            v47 = 0;
          }
          v48 = (int *)&v47[4 * v43];
          *v48 = v39;
          v41 = v48 + 1;
          while (end != begin)
          {
            v49 = *--end;
            *--v48 = v49;
          }
          v86.__begin_ = v48;
          v86.__end_ = v41;
          v86.__end_cap_.__value_ = (int *)&v47[4 * v46];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v86.__end_ = v38;
          v41 = end + 1;
        }
        v86.__end_ = v41;
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v35);
  }

  if (v86.__end_ == v86.__begin_)
    v50 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>> const&)::t;
  else
    v50 = v86.__begin_;
  v51 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v50, v86.__end_ - v86.__begin_);
  v52 = -[FTStartTextToSpeechStreamingRequest preferred_voice_type](v80, "preferred_voice_type");
  -[FTStartTextToSpeechStreamingRequest meta_info](v80, "meta_info");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest context](v80, "context");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest experiment](v80, "experiment");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v57, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest feature_flags](v80, "feature_flags");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v58, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest debug](v80, "debug");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v59, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest profile](v80, "profile");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v59) = objc_msgSend(v60, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest dev_config](v80, "dev_config");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v60) = objc_msgSend(v61, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest prosody_config](v80, "prosody_config");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = objc_msgSend(v62, "addObjectToBuffer:", a3);

  -[FTStartTextToSpeechStreamingRequest prosody_control_config](v80, "prosody_control_config");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "addObjectToBuffer:", a3);

  *((_BYTE *)a3 + 70) = 1;
  v81 = *((_DWORD *)a3 + 8);
  v67 = *((_DWORD *)a3 + 12);
  LODWORD(v63) = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v78);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v77);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v76);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v75);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 16, v73, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 18, v72, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 20, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 22, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 24, v52, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 26, v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 28, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 30, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 32, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 34, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 36, (int)v59);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 38, (int)v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 40, (int)v61);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 42, v64);
  v65.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v81 - (unsigned __int16)v67 + (unsigned __int16)v63);
  if (v86.__begin_)
  {
    v86.__end_ = v86.__begin_;
    operator delete(v86.__begin_);
  }
  return v65;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTStartTextToSpeechStreamingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __51__FTStartTextToSpeechStreamingRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__51__FTStartTextToSpeechStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__68__FTStartTextToSpeechStreamingRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
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
