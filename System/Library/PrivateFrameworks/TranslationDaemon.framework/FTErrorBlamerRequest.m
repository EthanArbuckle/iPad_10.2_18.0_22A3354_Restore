@implementation FTErrorBlamerRequest

- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3
{
  return -[FTErrorBlamerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTErrorBlamerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4
{
  return -[FTErrorBlamerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTErrorBlamerRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const ErrorBlamerRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::ErrorBlamerRequest *v19;
  FTErrorBlamerRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTErrorBlamerRequest;
  v10 = -[FTErrorBlamerRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ErrorBlamerRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ErrorBlamerRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::ErrorBlamerRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTStartSpeechRequest)start_speech_request
{
  FTStartSpeechRequest *v3;
  FTStartSpeechRequest *v4;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v6;
  uint64_t v7;
  const ErrorBlamerRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("start_speech_request"));
  v3 = (FTStartSpeechRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTStartSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("start_speech_request"));
  }
  return v3;
}

- (NSArray)contextual_text
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__FTErrorBlamerRequest_contextual_text__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTErrorBlamerRequest contextual_text_enumerateObjectsUsingBlock:](self, "contextual_text_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("contextual_text"));

  }
  return (NSArray *)v3;
}

uint64_t __39__FTErrorBlamerRequest_contextual_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)contextual_text_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
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

- (unint64_t)contextual_text_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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

- (void)contextual_text_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v8;
  uint64_t v9;
  const ErrorBlamerRequest *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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

- (NSString)left_context
{
  const ErrorBlamerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ErrorBlamerRequest *v6;

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

- (NSString)right_context
{
  const ErrorBlamerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ErrorBlamerRequest *v6;

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

- (FTUserLanguageProfile)user_language_profile
{
  FTUserLanguageProfile *v3;
  FTUserLanguageProfile *v4;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v6;
  uint64_t v7;
  const ErrorBlamerRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_language_profile"));
  v3 = (FTUserLanguageProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTUserLanguageProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTUserLanguageProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_language_profile"));
  }
  return v3;
}

- (FTUserAcousticProfile)user_acoustic_profile
{
  FTUserAcousticProfile *v3;
  FTUserAcousticProfile *v4;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v6;
  uint64_t v7;
  const ErrorBlamerRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_acoustic_profile"));
  v3 = (FTUserAcousticProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTUserAcousticProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (v7 = *(unsigned __int16 *)v6[14].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTUserAcousticProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_acoustic_profile"));
  }
  return v3;
}

- (double)latitude
{
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x11u)
  {
    v5 = *(unsigned __int16 *)v3[16].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (double)longitude
{
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x13u)
  {
    v5 = *(unsigned __int16 *)v3[18].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSArray)audio_packets
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("audio_packets"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTErrorBlamerRequest_audio_packets__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTErrorBlamerRequest audio_packets_enumerateObjectsUsingBlock:](self, "audio_packets_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("audio_packets"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTErrorBlamerRequest_audio_packets__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)audio_packets_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTAudioPacket *v7;
  FTAudioPacket *v8;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("audio_packets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTAudioPacket *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTAudioPacket initWithFlatbuffData:root:verify:]([FTAudioPacket alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)audio_packets_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("audio_packets"));
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

- (void)audio_packets_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTAudioPacket *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v8;
  uint64_t v9;
  const ErrorBlamerRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTAudioPacket *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTAudioPacket *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("audio_packets"));
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
            v17 = -[FTAudioPacket initWithFlatbuffData:root:verify:]([FTAudioPacket alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSString)ref_transcript
{
  const ErrorBlamerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ErrorBlamerRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
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

- (Offset<siri::speech::schema_fb::ErrorBlamerRequest>)addObjectToBuffer:(void *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  size_t v12;
  int String;
  int v14;
  std::vector<int>::pointer end;
  int *v16;
  std::vector<int>::pointer begin;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  int *v23;
  int v24;
  std::vector<int>::pointer v25;
  int v26;
  __CFString *v27;
  __CFString *v28;
  const char *v29;
  size_t v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  const char *v34;
  size_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  int v47;
  int v48;
  std::vector<int>::pointer v49;
  int *v50;
  std::vector<int>::pointer v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  unint64_t v55;
  char *v56;
  int *v57;
  int v58;
  std::vector<int>::pointer v59;
  int v60;
  __CFString *v61;
  __CFString *v62;
  const char *v63;
  size_t v64;
  int v65;
  int v66;
  int v67;
  Offset<siri::speech::schema_fb::ErrorBlamerRequest> v68;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  int v74;
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
  -[FTErrorBlamerRequest start_speech_request](self, "start_speech_request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  memset(&v85, 0, sizeof(v85));
  -[FTErrorBlamerRequest contextual_text](self, "contextual_text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v5;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v85, objc_msgSend(v6, "count"));

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[FTErrorBlamerRequest contextual_text](self, "contextual_text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v82 != v9)
          objc_enumerationMutation(v7);
        v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i)), "UTF8String");
        v12 = strlen(v11);
        String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);
        v14 = String;
        end = v85.__end_;
        if (v85.__end_ >= v85.__end_cap_.__value_)
        {
          begin = v85.__begin_;
          v18 = v85.__end_ - v85.__begin_;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v20 = (char *)v85.__end_cap_.__value_ - (char *)v85.__begin_;
          if (((char *)v85.__end_cap_.__value_ - (char *)v85.__begin_) >> 1 > v19)
            v19 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v85.__end_cap_, v21);
            begin = v85.__begin_;
            end = v85.__end_;
          }
          else
          {
            v22 = 0;
          }
          v23 = (int *)&v22[4 * v18];
          *v23 = v14;
          v16 = v23 + 1;
          while (end != begin)
          {
            v24 = *--end;
            *--v23 = v24;
          }
          v85.__begin_ = v23;
          v85.__end_ = v16;
          v85.__end_cap_.__value_ = (int *)&v22[4 * v21];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v85.__end_ = String;
          v16 = end + 1;
        }
        v85.__end_ = v16;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    }
    while (v8);
  }

  if (v85.__end_ == v85.__begin_)
    v25 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v25 = v85.__begin_;
  v26 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v25, v85.__end_ - v85.__begin_);
  -[FTErrorBlamerRequest left_context](self, "left_context");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
    v27 = &stru_251A15610;
  v29 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v27), "UTF8String");
  v30 = strlen(v29);
  v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29, v30);

  -[FTErrorBlamerRequest right_context](self, "right_context");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
    v32 = &stru_251A15610;
  v34 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v32), "UTF8String");
  v35 = strlen(v34);
  v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v34, v35);

  -[FTErrorBlamerRequest user_language_profile](self, "user_language_profile");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v36, "addObjectToBuffer:", a3);

  -[FTErrorBlamerRequest user_acoustic_profile](self, "user_acoustic_profile");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = objc_msgSend(v37, "addObjectToBuffer:", a3);

  -[FTErrorBlamerRequest latitude](self, "latitude");
  v39 = v38;
  -[FTErrorBlamerRequest longitude](self, "longitude");
  v41 = v40;
  memset(&v80, 0, sizeof(v80));
  -[FTErrorBlamerRequest audio_packets](self, "audio_packets");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v80, objc_msgSend(v42, "count"));

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[FTErrorBlamerRequest audio_packets](self, "audio_packets");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v70) = v31;
  v71 = v26;
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
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "addObjectToBuffer:", a3, v70);
        v48 = v47;
        v49 = v80.__end_;
        if (v80.__end_ >= v80.__end_cap_.__value_)
        {
          v51 = v80.__begin_;
          v52 = v80.__end_ - v80.__begin_;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v54 = (char *)v80.__end_cap_.__value_ - (char *)v80.__begin_;
          if (((char *)v80.__end_cap_.__value_ - (char *)v80.__begin_) >> 1 > v53)
            v53 = v54 >> 1;
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
            v55 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v55 = v53;
          if (v55)
          {
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v80.__end_cap_, v55);
            v51 = v80.__begin_;
            v49 = v80.__end_;
          }
          else
          {
            v56 = 0;
          }
          v57 = (int *)&v56[4 * v52];
          *v57 = v48;
          v50 = v57 + 1;
          while (v49 != v51)
          {
            v58 = *--v49;
            *--v57 = v58;
          }
          v80.__begin_ = v57;
          v80.__end_ = v50;
          v80.__end_cap_.__value_ = (int *)&v56[4 * v55];
          if (v51)
            operator delete(v51);
        }
        else
        {
          *v80.__end_ = v47;
          v50 = v49 + 1;
        }
        v80.__end_ = v50;
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v44);
  }

  if (v80.__end_ == v80.__begin_)
    v59 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioPacket>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioPacket>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioPacket>> const&)::t;
  else
    v59 = v80.__begin_;
  v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v59, v80.__end_ - v80.__begin_);
  -[FTErrorBlamerRequest ref_transcript](self, "ref_transcript");
  v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (!v61)
    v61 = &stru_251A15610;
  v63 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v61), "UTF8String");
  v64 = strlen(v63);
  LODWORD(v63) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  *((_BYTE *)a3 + 70) = 1;
  v65 = *((_DWORD *)a3 + 8);
  v66 = *((_DWORD *)a3 + 12);
  v67 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, SHIDWORD(v70));
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 16, v39, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 18, v41, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 20, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 22, (int)v63);
  v68.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v65 - (unsigned __int16)v66 + v67);
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
  return v68;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTErrorBlamerRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __36__FTErrorBlamerRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTErrorBlamerRequest_flatbuffData__block_invoke(uint64_t a1)
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
