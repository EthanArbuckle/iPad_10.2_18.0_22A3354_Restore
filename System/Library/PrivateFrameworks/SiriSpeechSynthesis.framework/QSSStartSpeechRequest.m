@implementation QSSStartSpeechRequest

- (QSSStartSpeechRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSStartSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSStartSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4
{
  return -[QSSStartSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSStartSpeechRequest *v10;
  QSSStartSpeechRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::StartSpeechRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSStartSpeechRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartSpeechRequest;
  v10 = -[QSSStartSpeechRequest init](&v30, sel_init);
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
      a4 = (const StartSpeechRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartSpeechRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartSpeechRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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

- (NSString)task_name
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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

- (int64_t)codec
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (BOOL)stream_results
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)enable_server_side_endpoint
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)device_type
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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

- (NSString)device_os
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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

- (NSString)mic_type
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

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

- (NSString)udm_host
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 24].var0;
  if (*(_WORD *)root[-v3 + 24].var0)
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

- (int)udm_port
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x1Bu && (v4 = *(unsigned __int16 *)v3[26].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (BOOL)tandem_mode
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Du && (v4 = *(unsigned __int16 *)v3[28].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)store_audio
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Fu && (v4 = *(unsigned __int16 *)v3[30].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)stream_unstable_results
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x21u && (v4 = *(unsigned __int16 *)v3[32].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)request_locale
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 34].var0;
  if (*(_WORD *)root[-v3 + 34].var0)
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

- (int64_t)end_point_mode
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x25u && (v4 = *(unsigned __int16 *)v3[36].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (int)start_audio_bookmark
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x27u && (v4 = *(unsigned __int16 *)v3[38].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (BOOL)is_far_field
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x29u && (v4 = *(unsigned __int16 *)v3[40].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)enable_utterance_detection
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x2Bu && (v4 = *(unsigned __int16 *)v3[42].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)enable_endpoint_candidate
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x2Du && (v4 = *(unsigned __int16 *)v3[44].var0) != 0 && root[v4].var0[0] != 0;
}

- (unint64_t)start_recognition_at
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x2Fu && (v4 = *(unsigned __int16 *)v3[46].var0) != 0)
    return *(_QWORD *)root[v4].var0;
  else
    return 0;
}

- (unint64_t)start_endpointing_at
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x31u && (v4 = *(unsigned __int16 *)v3[48].var0) != 0)
    return *(_QWORD *)root[v4].var0;
  else
    return 0;
}

- (BOOL)enable_hybrid_endpoint
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x33u && (v4 = *(unsigned __int16 *)v3[50].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)client_endpointer_model_version
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 52].var0;
  if (*(_WORD *)root[-v3 + 52].var0)
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

- (NSString)keyboard_identifier
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 54].var0;
  if (*(_WORD *)root[-v3 + 54].var0)
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

- (NSString)input_origin
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 56].var0;
  if (*(_WORD *)root[-v3 + 56].var0)
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

- (unsigned)initial_recognition_candidate_id
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x3Bu && (v4 = *(unsigned __int16 *)v3[58].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (BOOL)disable_auto_punctuation
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x3Du && (v4 = *(unsigned __int16 *)v3[60].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)keyboard_dictation
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x3Fu && (v4 = *(unsigned __int16 *)v3[62].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)experiment_id
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 64].var0;
  if (*(_WORD *)root[-v3 + 64].var0)
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

- (int64_t)speech_request_source
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x43u && (v4 = *(unsigned __int16 *)v3[66].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (NSString)fork_id
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 68].var0;
  if (*(_WORD *)root[-v3 + 68].var0)
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

- (NSString)application_name
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 70].var0;
  if (*(_WORD *)root[-v3 + 70].var0)
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

- (NSString)metadata
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 72].var0;
  if (*(_WORD *)root[-v3 + 72].var0)
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

- (Offset<siri::speech::schema_fb::StartSpeechRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  unsigned int String;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  const char *v17;
  size_t v18;
  unsigned int v19;
  __CFString *v20;
  __CFString *v21;
  const char *v22;
  size_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  __CFString *v26;
  __CFString *v27;
  const char *v28;
  size_t v29;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  size_t v33;
  __CFString *v34;
  __CFString *v35;
  const char *v36;
  size_t v37;
  __CFString *v38;
  __CFString *v39;
  const char *v40;
  size_t v41;
  __CFString *v42;
  __CFString *v43;
  const char *v44;
  size_t v45;
  __CFString *v46;
  __CFString *v47;
  const char *v48;
  size_t v49;
  __CFString *v50;
  __CFString *v51;
  const char *v52;
  size_t v53;
  __CFString *v54;
  __CFString *v55;
  const char *v56;
  size_t v57;
  unsigned int v58;
  __CFString *v59;
  __CFString *v60;
  const char *v61;
  size_t v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  __CFString *v66;
  __CFString *v67;
  const char *v68;
  size_t v69;
  unsigned int v70;
  __CFString *v71;
  __CFString *v72;
  const char *v73;
  size_t v74;
  unsigned int v75;
  __CFString *v76;
  __CFString *v77;
  const char *v78;
  size_t v79;
  int v80;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  unsigned int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  unsigned int v109;

  -[QSSStartSpeechRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSStartSpeechRequest session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSStartSpeechRequest language](self, "language");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSStartSpeechRequest task_name](self, "task_name");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_24E246F88;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  v109 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  v108 = -[QSSStartSpeechRequest codec](self, "codec");
  v24 = -[QSSStartSpeechRequest stream_results](self, "stream_results");
  v25 = -[QSSStartSpeechRequest enable_server_side_endpoint](self, "enable_server_side_endpoint");
  -[QSSStartSpeechRequest device_type](self, "device_type");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
    v26 = &stru_24E246F88;
  v28 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v26), "UTF8String");
  v29 = strlen(v28);
  v107 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v28, v29);

  -[QSSStartSpeechRequest device_os](self, "device_os");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
    v30 = &stru_24E246F88;
  v32 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v30), "UTF8String");
  v33 = strlen(v32);
  v106 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v32, v33);

  -[QSSStartSpeechRequest mic_type](self, "mic_type");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
    v34 = &stru_24E246F88;
  v36 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v34), "UTF8String");
  v37 = strlen(v36);
  v105 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v36, v37);

  -[QSSStartSpeechRequest udm_host](self, "udm_host");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v38)
    v38 = &stru_24E246F88;
  v40 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v38), "UTF8String");
  v41 = strlen(v40);
  v104 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v40, v41);

  v100 = -[QSSStartSpeechRequest udm_port](self, "udm_port");
  v101 = -[QSSStartSpeechRequest tandem_mode](self, "tandem_mode");
  v102 = -[QSSStartSpeechRequest store_audio](self, "store_audio");
  v103 = -[QSSStartSpeechRequest stream_unstable_results](self, "stream_unstable_results");
  -[QSSStartSpeechRequest request_locale](self, "request_locale");
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42)
    v42 = &stru_24E246F88;
  v44 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v42), "UTF8String");
  v45 = strlen(v44);
  v99 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v44, v45);

  v91 = -[QSSStartSpeechRequest end_point_mode](self, "end_point_mode");
  v92 = -[QSSStartSpeechRequest start_audio_bookmark](self, "start_audio_bookmark");
  v93 = -[QSSStartSpeechRequest is_far_field](self, "is_far_field");
  v94 = -[QSSStartSpeechRequest enable_utterance_detection](self, "enable_utterance_detection");
  v95 = -[QSSStartSpeechRequest enable_endpoint_candidate](self, "enable_endpoint_candidate");
  v96 = -[QSSStartSpeechRequest start_recognition_at](self, "start_recognition_at");
  v97 = -[QSSStartSpeechRequest start_endpointing_at](self, "start_endpointing_at");
  v98 = -[QSSStartSpeechRequest enable_hybrid_endpoint](self, "enable_hybrid_endpoint");
  -[QSSStartSpeechRequest client_endpointer_model_version](self, "client_endpointer_model_version");
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
    v46 = &stru_24E246F88;
  v48 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v46), "UTF8String");
  v49 = strlen(v48);
  v90 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v48, v49);

  -[QSSStartSpeechRequest keyboard_identifier](self, "keyboard_identifier");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (!v50)
    v50 = &stru_24E246F88;
  v52 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v50), "UTF8String");
  v53 = strlen(v52);
  v89 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v52, v53);
  v87 = v24;
  v88 = v25;

  -[QSSStartSpeechRequest input_origin](self, "input_origin");
  v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (!v54)
    v54 = &stru_24E246F88;
  v56 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v54), "UTF8String");
  v57 = strlen(v56);
  v83 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v56, v57);
  v58 = v19;

  v84 = -[QSSStartSpeechRequest initial_recognition_candidate_id](self, "initial_recognition_candidate_id");
  v85 = -[QSSStartSpeechRequest disable_auto_punctuation](self, "disable_auto_punctuation");
  v86 = -[QSSStartSpeechRequest keyboard_dictation](self, "keyboard_dictation");
  -[QSSStartSpeechRequest experiment_id](self, "experiment_id");
  v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (!v59)
    v59 = &stru_24E246F88;
  v61 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v59), "UTF8String");
  v62 = strlen(v61);
  v63 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v61, v62);
  v64 = v14;
  v65 = String;

  v82 = -[QSSStartSpeechRequest speech_request_source](self, "speech_request_source");
  -[QSSStartSpeechRequest fork_id](self, "fork_id");
  v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (!v66)
    v66 = &stru_24E246F88;
  v68 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v66), "UTF8String");
  v69 = strlen(v68);
  v70 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v68, v69);

  -[QSSStartSpeechRequest application_name](self, "application_name");
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (!v71)
    v71 = &stru_24E246F88;
  v73 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v71), "UTF8String");
  v74 = strlen(v73);
  v75 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v73, v74);

  -[QSSStartSpeechRequest metadata](self, "metadata");
  v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (!v76)
    v76 = &stru_24E246F88;
  v78 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v76), "UTF8String");
  v79 = strlen(v78);
  LODWORD(v78) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v78, v79);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v80 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v65);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v64);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v58);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v109);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v108);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 14, v87);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v88);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v107);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v106);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v105);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 24, v104);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 26, v100);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 28, v101);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 30, v102);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 32, v103);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 34, v99);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 36, v91);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 38, v92);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 40, v93);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 42, v94);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 44, v95);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((flatbuffers::vector_downward *)a3, 46, v96);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((flatbuffers::vector_downward *)a3, 48, v97);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 50, v98);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 52, v90);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 54, v89);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 56, v83);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 58, v84);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 60, v85);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 62, v86);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 64, v63);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 66, v82);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 68, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 70, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 72, v78);
  return (Offset<siri::speech::schema_fb::StartSpeechRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v80);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::StartSpeechRequest> v2;
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
  v2.var0 = -[QSSStartSpeechRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__QSSStartSpeechRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__37__QSSStartSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
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
