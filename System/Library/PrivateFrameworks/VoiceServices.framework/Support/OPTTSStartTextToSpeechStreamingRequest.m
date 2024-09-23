@implementation OPTTSStartTextToSpeechStreamingRequest

- (OPTTSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3
{
  return -[OPTTSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4
{
  return -[OPTTSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSStartTextToSpeechStreamingRequest)initWithFlatbuffData:(id)a3 root:(const StartTextToSpeechStreamingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSStartTextToSpeechStreamingRequest *v10;
  OPTTSStartTextToSpeechStreamingRequest *v11;
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
  OPTTSStartTextToSpeechStreamingRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSStartTextToSpeechStreamingRequest;
  v10 = -[OPTTSStartTextToSpeechStreamingRequest init](&v30, sel_init);
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
      v27 = xmmword_21AACED40;
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
  OPTTSStartTextToSpeechStreamingRequest_ContextInfoEntry *v12;

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
            v12 = -[OPTTSStartTextToSpeechStreamingRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([OPTTSStartTextToSpeechStreamingRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
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

- (OPTTSTextToSpeechRequestMeta)meta_info
{
  OPTTSTextToSpeechRequestMeta *v3;
  OPTTSTextToSpeechRequestMeta *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (OPTTSTextToSpeechRequestMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (v7 = *(unsigned __int16 *)v6[26].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestContext)context
{
  OPTTSTextToSpeechRequestContext *v3;
  OPTTSTextToSpeechRequestContext *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context"));
  v3 = (OPTTSTextToSpeechRequestContext *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestContext alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (v7 = *(unsigned __int16 *)v6[28].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestContext initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestExperiment)experiment
{
  OPTTSTextToSpeechRequestExperiment *v3;
  OPTTSTextToSpeechRequestExperiment *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("experiment"));
  v3 = (OPTTSTextToSpeechRequestExperiment *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestExperiment alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (v7 = *(unsigned __int16 *)v6[30].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestExperiment initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("experiment"));
  }
  return v3;
}

- (OPTTSTTSRequestFeatureFlags)feature_flags
{
  OPTTSTTSRequestFeatureFlags *v3;
  OPTTSTTSRequestFeatureFlags *v4;
  const StartTextToSpeechStreamingRequest *root;
  const StartTextToSpeechStreamingRequest *v6;
  uint64_t v7;
  const StartTextToSpeechStreamingRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
  v3 = (OPTTSTTSRequestFeatureFlags *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTTSRequestFeatureFlags alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (v7 = *(unsigned __int16 *)v6[32].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("feature_flags"));
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
  unsigned int v58;
  int v59;
  void *v60;
  unsigned int v61;
  void *v62;
  unsigned int v63;
  void *v64;
  unsigned int v65;
  void *v66;
  int v67;
  int v68;
  int v69;
  int v70;
  Offset<siri::speech::schema_fb::StartTextToSpeechStreamingRequest> v71;
  uint64_t v73;
  int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  OPTTSStartTextToSpeechStreamingRequest *v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int String;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  -[OPTTSStartTextToSpeechStreamingRequest speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24DD8EF88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[OPTTSStartTextToSpeechStreamingRequest session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24DD8EF88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v81 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[OPTTSStartTextToSpeechStreamingRequest stream_id](self, "stream_id");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24DD8EF88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v80 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  -[OPTTSStartTextToSpeechStreamingRequest language](self, "language");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24DD8EF88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v77 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  -[OPTTSStartTextToSpeechStreamingRequest gender](self, "gender");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_24DD8EF88;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  v76 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  -[OPTTSStartTextToSpeechStreamingRequest text](self, "text");
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
    v24 = &stru_24DD8EF88;
  v26 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v24), "UTF8String");
  v27 = strlen(v26);
  v75 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v26, v27);

  v74 = -[OPTTSStartTextToSpeechStreamingRequest audio_type](self, "audio_type");
  HIDWORD(v73) = -[OPTTSStartTextToSpeechStreamingRequest enable_word_timing_info](self, "enable_word_timing_info");
  -[OPTTSStartTextToSpeechStreamingRequest voice_name](self, "voice_name");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
    v28 = &stru_24DD8EF88;
  v30 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v28), "UTF8String");
  v31 = strlen(v30);
  LODWORD(v73) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v30, v31);

  -[OPTTSStartTextToSpeechStreamingRequest context_info](self, "context_info");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");
  v34 = a3;
  if (v33)
  {
    if (v33 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v33);
    v37 = &v35[4 * v36];
  }
  else
  {
    v35 = 0;
    v37 = 0;
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[OPTTSStartTextToSpeechStreamingRequest context_info](self, "context_info");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
  v78 = self;
  if (v39)
  {
    v40 = *(_QWORD *)v85;
    v41 = v35;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v85 != v40)
          objc_enumerationMutation(v38);
        v43 = objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "addObjectToBuffer:", v34, v73);
        v44 = v43;
        if (v41 >= v37)
        {
          v45 = (v41 - v35) >> 2;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
          if ((v37 - v35) >> 1 > v46)
            v46 = (v37 - v35) >> 1;
          if ((unint64_t)(v37 - v35) >= 0x7FFFFFFFFFFFFFFCLL)
            v47 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v47 = v46;
          if (v47)
            v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v47);
          else
            v48 = 0;
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v44;
          v50 = v49 + 4;
          while (v41 != v35)
          {
            v51 = *((_DWORD *)v41 - 1);
            v41 -= 4;
            *((_DWORD *)v49 - 1) = v51;
            v49 -= 4;
          }
          v37 = (char *)(v47 + 4 * v48);
          if (v35)
            operator delete(v35);
          v35 = v49;
          v41 = v50;
          v34 = a3;
        }
        else
        {
          *(_DWORD *)v41 = v43;
          v41 += 4;
        }
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
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
  v58 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v54);
  v59 = -[OPTTSStartTextToSpeechStreamingRequest preferred_voice_type](v78, "preferred_voice_type");
  -[OPTTSStartTextToSpeechStreamingRequest meta_info](v78, "meta_info");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "addObjectToBuffer:", a3);

  -[OPTTSStartTextToSpeechStreamingRequest context](v78, "context");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "addObjectToBuffer:", a3);

  -[OPTTSStartTextToSpeechStreamingRequest experiment](v78, "experiment");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "addObjectToBuffer:", a3);

  -[OPTTSStartTextToSpeechStreamingRequest feature_flags](v78, "feature_flags");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v66, "addObjectToBuffer:", a3);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v67 = *((_DWORD *)a3 + 8);
  v68 = *((_DWORD *)a3 + 12);
  v69 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v81);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 8, v80);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 10, v77);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 12, v76);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 14, v75);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v74);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 18, SHIDWORD(v73));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 20, v73);
  if (v58)
  {
    v70 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v58);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v70);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 24, v59);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 26, v61);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 28, v63);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 30, v65);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 32, v79);
  v71.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v67 - v68 + v69);
  if (v35)
    operator delete(v35);
  return v71;
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
  v13 = xmmword_21AACED50;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[OPTTSStartTextToSpeechStreamingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__OPTTSStartTextToSpeechStreamingRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__54__OPTTSStartTextToSpeechStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x220750954);
  }
  return result;
}

flatbuffers::DetachedBuffer *__71__OPTTSStartTextToSpeechStreamingRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x220750954);
  }
  return result;
}

@end
