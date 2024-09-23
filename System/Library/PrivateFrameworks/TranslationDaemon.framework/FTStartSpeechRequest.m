@implementation FTStartSpeechRequest

- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3
{
  return -[FTStartSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTStartSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4
{
  return -[FTStartSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTStartSpeechRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const StartSpeechRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::StartSpeechRequest *v19;
  FTStartSpeechRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartSpeechRequest;
  v10 = -[FTStartSpeechRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const StartSpeechRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::StartSpeechRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::StartSpeechRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
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
    return *(int *)root[v4].var0;
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
    return *(int *)root[v4].var0;
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
    return *(int *)root[v4].var0;
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

- (NSArray)multi_user_parameters
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("multi_user_parameters"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__FTStartSpeechRequest_multi_user_parameters__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTStartSpeechRequest multi_user_parameters_enumerateObjectsUsingBlock:](self, "multi_user_parameters_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("multi_user_parameters"));

  }
  return (NSArray *)v3;
}

uint64_t __45__FTStartSpeechRequest_multi_user_parameters__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)multi_user_parameters_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTUserParameters *v7;
  FTUserParameters *v8;
  const StartSpeechRequest *root;
  const StartSpeechRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("multi_user_parameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTUserParameters *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x4Bu || (v11 = *(unsigned __int16 *)v10[74].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTUserParameters initWithFlatbuffData:root:verify:]([FTUserParameters alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)multi_user_parameters_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const StartSpeechRequest *root;
  const StartSpeechRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("multi_user_parameters"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x4Bu && (v8 = *(unsigned __int16 *)v7[74].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)multi_user_parameters_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTUserParameters *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const StartSpeechRequest *root;
  const StartSpeechRequest *v8;
  uint64_t v9;
  const StartSpeechRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTUserParameters *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTUserParameters *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("multi_user_parameters"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x4Bu)
    {
      v9 = *(unsigned __int16 *)v8[74].var0;
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
            v17 = -[FTUserParameters initWithFlatbuffData:root:verify:]([FTUserParameters alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (unsigned)initial_result_candidate_id
{
  const StartSpeechRequest *root;
  const StartSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x4Du && (v4 = *(unsigned __int16 *)v3[76].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)self_session_id
{
  const StartSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 78].var0;
  if (*(_WORD *)root[-v3 + 78].var0)
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
  __CFString *v33;
  __CFString *v34;
  const char *v35;
  size_t v36;
  __CFString *v37;
  __CFString *v38;
  const char *v39;
  size_t v40;
  __CFString *v41;
  __CFString *v42;
  const char *v43;
  size_t v44;
  __CFString *v45;
  __CFString *v46;
  const char *v47;
  size_t v48;
  __CFString *v49;
  __CFString *v50;
  const char *v51;
  size_t v52;
  __CFString *v53;
  __CFString *v54;
  const char *v55;
  size_t v56;
  __CFString *v57;
  __CFString *v58;
  const char *v59;
  size_t v60;
  __CFString *v61;
  __CFString *v62;
  const char *v63;
  size_t v64;
  __CFString *v65;
  __CFString *v66;
  const char *v67;
  size_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  int v74;
  int v75;
  std::vector<int>::pointer end;
  int *v77;
  std::vector<int>::pointer begin;
  int64_t v79;
  unint64_t v80;
  int64_t v81;
  unint64_t v82;
  char *v83;
  int *v84;
  int v85;
  std::vector<int>::pointer v86;
  int v87;
  int v88;
  __CFString *v89;
  __CFString *v90;
  const char *v91;
  size_t v92;
  int v93;
  int v94;
  int v95;
  Offset<siri::speech::schema_fb::StartSpeechRequest> v96;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  int v113;
  int v114;
  FTStartSpeechRequest *v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int String;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  std::vector<int> v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x24BDAC8D0];
  -[FTStartSpeechRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTStartSpeechRequest session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v132 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  -[FTStartSpeechRequest language](self, "language");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v131 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTStartSpeechRequest task_name](self, "task_name");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_251A15610;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v130 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  v129 = -[FTStartSpeechRequest codec](self, "codec");
  v128 = -[FTStartSpeechRequest stream_results](self, "stream_results");
  v127 = -[FTStartSpeechRequest enable_server_side_endpoint](self, "enable_server_side_endpoint");
  -[FTStartSpeechRequest device_type](self, "device_type");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_251A15610;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v126 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  -[FTStartSpeechRequest device_os](self, "device_os");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_251A15610;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v125 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  -[FTStartSpeechRequest mic_type](self, "mic_type");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
    v29 = &stru_251A15610;
  v31 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v29), "UTF8String");
  v32 = strlen(v31);
  v124 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31, v32);

  -[FTStartSpeechRequest udm_host](self, "udm_host");
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
    v33 = &stru_251A15610;
  v35 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v33), "UTF8String");
  v36 = strlen(v35);
  v123 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v35, v36);

  v122 = -[FTStartSpeechRequest udm_port](self, "udm_port");
  v121 = -[FTStartSpeechRequest tandem_mode](self, "tandem_mode");
  v120 = -[FTStartSpeechRequest store_audio](self, "store_audio");
  v119 = -[FTStartSpeechRequest stream_unstable_results](self, "stream_unstable_results");
  -[FTStartSpeechRequest request_locale](self, "request_locale");
  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37)
    v37 = &stru_251A15610;
  v39 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v37), "UTF8String");
  v40 = strlen(v39);
  v118 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v39, v40);

  v117 = -[FTStartSpeechRequest end_point_mode](self, "end_point_mode");
  v116 = -[FTStartSpeechRequest start_audio_bookmark](self, "start_audio_bookmark");
  v114 = -[FTStartSpeechRequest is_far_field](self, "is_far_field");
  v113 = -[FTStartSpeechRequest enable_utterance_detection](self, "enable_utterance_detection");
  v112 = -[FTStartSpeechRequest enable_endpoint_candidate](self, "enable_endpoint_candidate");
  v111 = -[FTStartSpeechRequest start_recognition_at](self, "start_recognition_at");
  v110 = -[FTStartSpeechRequest start_endpointing_at](self, "start_endpointing_at");
  v109 = -[FTStartSpeechRequest enable_hybrid_endpoint](self, "enable_hybrid_endpoint");
  -[FTStartSpeechRequest client_endpointer_model_version](self, "client_endpointer_model_version");
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (!v41)
    v41 = &stru_251A15610;
  v43 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v41), "UTF8String");
  v44 = strlen(v43);
  v108 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v43, v44);

  -[FTStartSpeechRequest keyboard_identifier](self, "keyboard_identifier");
  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (!v45)
    v45 = &stru_251A15610;
  v47 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v45), "UTF8String");
  v48 = strlen(v47);
  v107 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);

  -[FTStartSpeechRequest input_origin](self, "input_origin");
  v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (!v49)
    v49 = &stru_251A15610;
  v51 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v49), "UTF8String");
  v52 = strlen(v51);
  v106 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v51, v52);

  v105 = -[FTStartSpeechRequest initial_recognition_candidate_id](self, "initial_recognition_candidate_id");
  v104 = -[FTStartSpeechRequest disable_auto_punctuation](self, "disable_auto_punctuation");
  v103 = -[FTStartSpeechRequest keyboard_dictation](self, "keyboard_dictation");
  -[FTStartSpeechRequest experiment_id](self, "experiment_id");
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (!v53)
    v53 = &stru_251A15610;
  v55 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v53), "UTF8String");
  v56 = strlen(v55);
  v102 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v55, v56);

  v101 = -[FTStartSpeechRequest speech_request_source](self, "speech_request_source");
  -[FTStartSpeechRequest fork_id](self, "fork_id");
  v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (!v57)
    v57 = &stru_251A15610;
  v59 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v57), "UTF8String");
  v60 = strlen(v59);
  v100 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v59, v60);

  -[FTStartSpeechRequest application_name](self, "application_name");
  v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (!v61)
    v61 = &stru_251A15610;
  v63 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v61), "UTF8String");
  v64 = strlen(v63);
  v99 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  -[FTStartSpeechRequest metadata](self, "metadata");
  v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (!v65)
    v65 = &stru_251A15610;
  v67 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v65), "UTF8String");
  v68 = strlen(v67);
  v98 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v67, v68);

  memset(&v138, 0, sizeof(v138));
  -[FTStartSpeechRequest multi_user_parameters](self, "multi_user_parameters");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v138, objc_msgSend(v69, "count"));

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  -[FTStartSpeechRequest multi_user_parameters](self, "multi_user_parameters");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = self;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v134, v139, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v135;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v135 != v72)
          objc_enumerationMutation(v70);
        v74 = objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v75 = v74;
        end = v138.__end_;
        if (v138.__end_ >= v138.__end_cap_.__value_)
        {
          begin = v138.__begin_;
          v79 = v138.__end_ - v138.__begin_;
          v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v81 = (char *)v138.__end_cap_.__value_ - (char *)v138.__begin_;
          if (((char *)v138.__end_cap_.__value_ - (char *)v138.__begin_) >> 1 > v80)
            v80 = v81 >> 1;
          if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL)
            v82 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v82 = v80;
          if (v82)
          {
            v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v138.__end_cap_, v82);
            begin = v138.__begin_;
            end = v138.__end_;
          }
          else
          {
            v83 = 0;
          }
          v84 = (int *)&v83[4 * v79];
          *v84 = v75;
          v77 = v84 + 1;
          while (end != begin)
          {
            v85 = *--end;
            *--v84 = v85;
          }
          v138.__begin_ = v84;
          v138.__end_ = v77;
          v138.__end_cap_.__value_ = (int *)&v83[4 * v82];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v138.__end_ = v74;
          v77 = end + 1;
        }
        v138.__end_ = v77;
      }
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v134, v139, 16);
    }
    while (v71);
  }

  if (v138.__end_ == v138.__begin_)
    v86 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::UserParameters>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::UserParameters>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::UserParameters>> const&)::t;
  else
    v86 = v138.__begin_;
  v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v86, v138.__end_ - v138.__begin_);
  v88 = -[FTStartSpeechRequest initial_result_candidate_id](v115, "initial_result_candidate_id");
  -[FTStartSpeechRequest self_session_id](v115, "self_session_id");
  v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v90 = v89;
  if (!v89)
    v89 = &stru_251A15610;
  v91 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v89), "UTF8String");
  v92 = strlen(v91);
  LODWORD(v91) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v91, v92);

  *((_BYTE *)a3 + 70) = 1;
  v93 = *((_DWORD *)a3 + 8);
  v94 = *((_DWORD *)a3 + 12);
  v95 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v132);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v131);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v130);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 12, v129, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 14, v128, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 16, v127, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v126);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 20, v125);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 22, v124);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 24, v123);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 26, v122, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 28, v121, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 30, v120, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 32, v119, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 34, v118);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 36, v117, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 38, v116, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 40, v114, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 42, v113, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 44, v112, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((char *)a3, 46, v111, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((char *)a3, 48, v110, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 50, v109, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 52, v108);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 54, v107);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 56, v106);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 58, v105, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 60, v104, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 62, v103, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 64, v102);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 66, v101, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 68, v100);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 70, v99);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 72, v98);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 74, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 76, v88, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 78, (int)v91);
  v96.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v93 - (unsigned __int16)v94 + v95);
  if (v138.__begin_)
  {
    v138.__end_ = v138.__begin_;
    operator delete(v138.__begin_);
  }
  return v96;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTStartSpeechRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __36__FTStartSpeechRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTStartSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
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
