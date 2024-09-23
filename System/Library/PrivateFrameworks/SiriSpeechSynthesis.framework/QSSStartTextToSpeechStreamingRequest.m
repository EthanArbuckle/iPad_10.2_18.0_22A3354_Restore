@implementation QSSStartTextToSpeechStreamingRequest

- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4
{
  return -[QSSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSStartTextToSpeechStreamingRequest *v10;
  QSSStartTextToSpeechStreamingRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::StartTextToSpeechStreamingRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSStartTextToSpeechStreamingRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartTextToSpeechStreamingRequest;
  v10 = -[QSSStartTextToSpeechStreamingRequest init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_16;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const StartTextToSpeechStreamingRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_16;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v25 = v18;
      v26 = v19;
      v27 = xmmword_21E34D540;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::StartTextToSpeechStreamingRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartTextToSpeechStreamingRequest::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_17:

  return v23;
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
    return *(unsigned int *)root[v4].var0;
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
  void *v3;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v5;
  uint64_t v6;
  const StartTextToSpeechStreamingRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const StartTextToSpeechStreamingRequest *v10;
  uint64_t v11;
  QSSStartTextToSpeechStreamingRequest_ContextInfoEntry *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x17u)
    {
      v6 = *(unsigned __int16 *)v5[22].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        v10 = &v7[v8 + 4];
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            v12 = -[QSSStartTextToSpeechStreamingRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([QSSStartTextToSpeechStreamingRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_info"));
  }
  return (NSArray *)v3;
}

- (int64_t)preferred_voice_type
{
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x19u && (v4 = *(unsigned __int16 *)v3[24].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (QSSTextToSpeechRequestMeta)meta_info
{
  QSSTextToSpeechRequestMeta *v3;
  QSSTextToSpeechRequestMeta *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (QSSTextToSpeechRequestMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (v7 = *(unsigned __int16 *)v6[26].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (QSSTextToSpeechRequestContext)context
{
  QSSTextToSpeechRequestContext *v3;
  QSSTextToSpeechRequestContext *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context"));
  v3 = (QSSTextToSpeechRequestContext *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestContext alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (v7 = *(unsigned __int16 *)v6[28].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestContext initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context"));
  }
  return v3;
}

- (QSSTextToSpeechRequestExperiment)experiment
{
  QSSTextToSpeechRequestExperiment *v3;
  QSSTextToSpeechRequestExperiment *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("experiment"));
  v3 = (QSSTextToSpeechRequestExperiment *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestExperiment alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (v7 = *(unsigned __int16 *)v6[30].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestExperiment initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("experiment"));
  }
  return v3;
}

- (QSSTTSRequestFeatureFlags)feature_flags
{
  QSSTTSRequestFeatureFlags *v3;
  QSSTTSRequestFeatureFlags *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
  v3 = (QSSTTSRequestFeatureFlags *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTTSRequestFeatureFlags alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (v7 = *(unsigned __int16 *)v6[32].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("feature_flags"));
  }
  return v3;
}

- (QSSTextToSpeechRequestDebug)debug
{
  QSSTextToSpeechRequestDebug *v3;
  QSSTextToSpeechRequestDebug *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("debug"));
  v3 = (QSSTextToSpeechRequestDebug *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestDebug alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (v7 = *(unsigned __int16 *)v6[34].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestDebug initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("debug"));
  }
  return v3;
}

- (QSSTextToSpeechUserProfile)profile
{
  QSSTextToSpeechUserProfile *v3;
  QSSTextToSpeechUserProfile *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("profile"));
  v3 = (QSSTextToSpeechUserProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechUserProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (v7 = *(unsigned __int16 *)v6[36].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechUserProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("profile"));
  }
  return v3;
}

- (QSSTextToSpeechRequestDevConfig)dev_config
{
  QSSTextToSpeechRequestDevConfig *v3;
  QSSTextToSpeechRequestDevConfig *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("dev_config"));
  v3 = (QSSTextToSpeechRequestDevConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestDevConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (v7 = *(unsigned __int16 *)v6[38].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestDevConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("dev_config"));
  }
  return v3;
}

- (QSSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  QSSTextToSpeechRequestProsodyTransferConfig *v3;
  QSSTextToSpeechRequestProsodyTransferConfig *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_config"));
  v3 = (QSSTextToSpeechRequestProsodyTransferConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestProsodyTransferConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (v7 = *(unsigned __int16 *)v6[40].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestProsodyTransferConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_config"));
  }
  return v3;
}

- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  QSSTextToSpeechRequestProsodyControlConfig *v3;
  QSSTextToSpeechRequestProsodyControlConfig *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_control_config"));
  v3 = (QSSTextToSpeechRequestProsodyControlConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x2Bu && (v7 = *(unsigned __int16 *)v6[42].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechRequestProsodyControlConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_control_config"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  size_t v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  __CFString *v20;
  __CFString *v21;
  const char *v22;
  size_t v23;
  __CFString *v24;
  __CFString *v25;
  const char *v26;
  size_t v27;
  __CFString *v28;
  __CFString *v29;
  const char *v30;
  size_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t i;
  int v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  unsigned int v64;
  void *v65;
  unsigned int v66;
  void *v67;
  unsigned int v68;
  void *v69;
  unsigned int v70;
  void *v71;
  int v72;
  int v73;
  int v74;
  int v75;
  Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest> v76;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  int v81;
  unsigned int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int String;
  QSSStartTextToSpeechStreamingRequest *v91;
  unsigned int v92;
  unsigned int v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  -[QSSStartTextToSpeechStreamingRequest speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSStartTextToSpeechStreamingRequest session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v89 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSStartTextToSpeechStreamingRequest stream_id](self, "stream_id");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v88 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  -[QSSStartTextToSpeechStreamingRequest language](self, "language");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24E246F88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v87 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  -[QSSStartTextToSpeechStreamingRequest gender](self, "gender");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_24E246F88;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  v86 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  -[QSSStartTextToSpeechStreamingRequest text](self, "text");
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
    v24 = &stru_24E246F88;
  v26 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v24), "UTF8String");
  v27 = strlen(v26);
  v85 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v26, v27);

  v84 = -[QSSStartTextToSpeechStreamingRequest audio_type](self, "audio_type");
  v83 = -[QSSStartTextToSpeechStreamingRequest enable_word_timing_info](self, "enable_word_timing_info");
  -[QSSStartTextToSpeechStreamingRequest voice_name](self, "voice_name");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
    v28 = &stru_24E246F88;
  v30 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v28), "UTF8String");
  v31 = strlen(v30);
  v82 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v30, v31);

  -[QSSStartTextToSpeechStreamingRequest context_info](self, "context_info");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");
  v34 = a3;
  if (v33)
  {
    if (v33 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v33);
    v37 = &v35[4 * v36];
  }
  else
  {
    v35 = 0;
    v37 = 0;
  }

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[QSSStartTextToSpeechStreamingRequest context_info](self, "context_info");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  v91 = self;
  if (v39)
  {
    v40 = *(_QWORD *)v96;
    v41 = v35;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v96 != v40)
          objc_enumerationMutation(v38);
        v43 = objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "addObjectToBuffer:", v34);
        v44 = v43;
        if (v41 >= v37)
        {
          v45 = (v41 - v35) >> 2;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v37 - v35) >> 1 > v46)
            v46 = (v37 - v35) >> 1;
          if ((unint64_t)(v37 - v35) >= 0x7FFFFFFFFFFFFFFCLL)
            v47 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v47 = v46;
          if (v47)
            v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v47);
          else
            v48 = 0;
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v44;
          v50 = v49 + 4;
          if (v41 == v35)
          {
            v34 = a3;
          }
          else
          {
            v34 = a3;
            do
            {
              v51 = *((_DWORD *)v41 - 1);
              v41 -= 4;
              *((_DWORD *)v49 - 1) = v51;
              v49 -= 4;
            }
            while (v41 != v35);
          }
          v37 = (char *)(v47 + 4 * v48);
          if (v35)
            operator delete(v35);
          v35 = v49;
          v41 = v50;
        }
        else
        {
          *(_DWORD *)v41 = v43;
          v41 += 4;
          v34 = a3;
        }
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    }
    while (v39);
  }
  else
  {
    v41 = v35;
  }

  v52 = v41 - v35;
  if (v41 == v35)
    v53 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest_::ContextInfoEntry>> const&)::t;
  else
    v53 = v35;
  v54 = v52 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v52 >> 2, 4uLL);
  if (v35 == v41)
  {
    LODWORD(v54) = 0;
  }
  else
  {
    v55 = v53 - 4;
    v56 = v54;
    do
    {
      v57 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v55[4 * v56]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v57);
      --v56;
    }
    while (v56);
  }
  v93 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v54);
  v81 = -[QSSStartTextToSpeechStreamingRequest preferred_voice_type](v91, "preferred_voice_type");
  -[QSSStartTextToSpeechStreamingRequest meta_info](v91, "meta_info");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v58, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest context](v91, "context");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v59, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest experiment](v91, "experiment");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v60, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest feature_flags](v91, "feature_flags");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest debug](v91, "debug");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest profile](v91, "profile");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest dev_config](v91, "dev_config");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest prosody_config](v91, "prosody_config");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "addObjectToBuffer:", a3);

  -[QSSStartTextToSpeechStreamingRequest prosody_control_config](v91, "prosody_control_config");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v71, "addObjectToBuffer:", a3);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v72 = *((_DWORD *)a3 + 8);
  v73 = *((_DWORD *)a3 + 12);
  v74 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v89);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v88);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v87);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v86);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v85);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v84);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 18, v83);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v82);
  if (v93)
  {
    v75 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v93);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v75);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 24, v81);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 26, v80);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 28, v79);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 30, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 32, v62);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 34, v64);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 36, v66);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 38, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 40, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 42, v92);
  v76.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v72 - v73 + v74);
  if (v35)
    operator delete(v35);
  return v76;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest> v2;
  const char *v3;
  flatbuffers::FlatBufferBuilder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_21E34D550;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[QSSStartTextToSpeechStreamingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__QSSStartTextToSpeechStreamingRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

flatbuffers::DetachedBuffer *__52__QSSStartTextToSpeechStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2207ADCC8);
  }
  return result;
}

flatbuffers::DetachedBuffer *__69__QSSStartTextToSpeechStreamingRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2207ADCC8);
  }
  return result;
}

@end
