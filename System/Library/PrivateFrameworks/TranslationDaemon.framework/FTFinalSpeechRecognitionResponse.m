@implementation FTFinalSpeechRecognitionResponse

- (FTFinalSpeechRecognitionResponse)initWithFlatbuffData:(id)a3
{
  return -[FTFinalSpeechRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTFinalSpeechRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTFinalSpeechRecognitionResponse)initWithFlatbuffData:(id)a3 root:(const FinalSpeechRecognitionResponse *)a4
{
  return -[FTFinalSpeechRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTFinalSpeechRecognitionResponse)initWithFlatbuffData:(id)a3 root:(const FinalSpeechRecognitionResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTFinalSpeechRecognitionResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const FinalSpeechRecognitionResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::FinalSpeechRecognitionResponse *v19;
  FTFinalSpeechRecognitionResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTFinalSpeechRecognitionResponse;
  v10 = -[FTFinalSpeechRecognitionResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const FinalSpeechRecognitionResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::FinalSpeechRecognitionResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::FinalSpeechRecognitionResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const FinalSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const FinalSpeechRecognitionResponse *v6;

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
  const FinalSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const FinalSpeechRecognitionResponse *v6;

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

- (int)return_code
{
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const FinalSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const FinalSpeechRecognitionResponse *v6;

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

- (FTRecognitionResult)recognition_result
{
  FTRecognitionResult *v3;
  FTRecognitionResult *v4;
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v6;
  uint64_t v7;
  const FinalSpeechRecognitionResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recognition_result"));
  v3 = (FTRecognitionResult *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTRecognitionResult alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTRecognitionResult initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("recognition_result"));
  }
  return v3;
}

- (int64_t)lang_profile_recreate_codes
{
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (FTAudioAnalytics)audio_analytics
{
  FTAudioAnalytics *v3;
  FTAudioAnalytics *v4;
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v6;
  uint64_t v7;
  const FinalSpeechRecognitionResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("audio_analytics"));
  v3 = (FTAudioAnalytics *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTAudioAnalytics alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (v7 = *(unsigned __int16 *)v6[16].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTAudioAnalytics initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("audio_analytics"));
  }
  return v3;
}

- (int64_t)watermark_detection
{
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (double)watermark_peak_average
{
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x15u)
  {
    v5 = *(unsigned __int16 *)v3[20].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSString)language
{
  const FinalSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const FinalSpeechRecognitionResponse *v6;

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

- (FTLatnnMitigatorResult)latnn_mitigator_result
{
  FTLatnnMitigatorResult *v3;
  FTLatnnMitigatorResult *v4;
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v6;
  uint64_t v7;
  const FinalSpeechRecognitionResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("latnn_mitigator_result"));
  v3 = (FTLatnnMitigatorResult *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTLatnnMitigatorResult alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTLatnnMitigatorResult initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("latnn_mitigator_result"));
  }
  return v3;
}

- (NSString)request_locale
{
  const FinalSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const FinalSpeechRecognitionResponse *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 26].var0;
  if (*(_WORD *)root[-v3 + 26].var0)
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

- (BOOL)has_result
{
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Du && (v4 = *(unsigned __int16 *)v3[28].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)speech_profile_used
{
  const FinalSpeechRecognitionResponse *root;
  const FinalSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Fu && (v4 = *(unsigned __int16 *)v3[30].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::FinalSpeechRecognitionResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  int String;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  int v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  __CFString *v27;
  __CFString *v28;
  const char *v29;
  size_t v30;
  int v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  const char *v35;
  size_t v36;
  int v37;
  int v38;
  int v39;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;

  -[FTFinalSpeechRecognitionResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTFinalSpeechRecognitionResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_251A15610;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  v15 = -[FTFinalSpeechRecognitionResponse return_code](self, "return_code");
  -[FTFinalSpeechRecognitionResponse return_str](self, "return_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_251A15610;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v20 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);

  -[FTFinalSpeechRecognitionResponse recognition_result](self, "recognition_result");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  v23 = -[FTFinalSpeechRecognitionResponse lang_profile_recreate_codes](self, "lang_profile_recreate_codes");
  -[FTFinalSpeechRecognitionResponse audio_analytics](self, "audio_analytics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v24, "addObjectToBuffer:", a3);
  v43 = v22;
  v44 = v23;

  v42 = -[FTFinalSpeechRecognitionResponse watermark_detection](self, "watermark_detection");
  -[FTFinalSpeechRecognitionResponse watermark_peak_average](self, "watermark_peak_average");
  v26 = v25;
  -[FTFinalSpeechRecognitionResponse language](self, "language");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
    v27 = &stru_251A15610;
  v29 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v27), "UTF8String");
  v30 = strlen(v29);
  v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29, v30);

  -[FTFinalSpeechRecognitionResponse latnn_mitigator_result](self, "latnn_mitigator_result");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v32, "addObjectToBuffer:", a3);

  -[FTFinalSpeechRecognitionResponse request_locale](self, "request_locale");
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
    v33 = &stru_251A15610;
  v35 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v33), "UTF8String");
  v36 = strlen(v35);
  LODWORD(v35) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v35, v36);

  v37 = -[FTFinalSpeechRecognitionResponse has_result](self, "has_result");
  v38 = -[FTFinalSpeechRecognitionResponse speech_profile_used](self, "speech_profile_used");
  *((_BYTE *)a3 + 70) = 1;
  v39 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v14);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v15, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v20);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v43);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 14, v44, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v45);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 18, v42, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 20, v26, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 22, v31);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 24, v41);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 26, (int)v35);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 28, v37, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 30, v38, 0);
  return (Offset<siri::speech::schema_fb::FinalSpeechRecognitionResponse>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v39);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTFinalSpeechRecognitionResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __48__FTFinalSpeechRecognitionResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__48__FTFinalSpeechRecognitionResponse_flatbuffData__block_invoke(uint64_t a1)
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
