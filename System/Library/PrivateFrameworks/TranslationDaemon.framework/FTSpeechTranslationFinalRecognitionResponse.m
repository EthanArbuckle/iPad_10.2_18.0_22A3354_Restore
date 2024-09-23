@implementation FTSpeechTranslationFinalRecognitionResponse

- (FTSpeechTranslationFinalRecognitionResponse)initWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationFinalRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationFinalRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTSpeechTranslationFinalRecognitionResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationFinalRecognitionResponse *)a4
{
  return -[FTSpeechTranslationFinalRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTSpeechTranslationFinalRecognitionResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationFinalRecognitionResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTSpeechTranslationFinalRecognitionResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SpeechTranslationFinalRecognitionResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse *v19;
  FTSpeechTranslationFinalRecognitionResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSpeechTranslationFinalRecognitionResponse;
  v10 = -[FTSpeechTranslationFinalRecognitionResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SpeechTranslationFinalRecognitionResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)conversation_id
{
  const SpeechTranslationFinalRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationFinalRecognitionResponse *v6;

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
  const SpeechTranslationFinalRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationFinalRecognitionResponse *v6;

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
  const SpeechTranslationFinalRecognitionResponse *root;
  const SpeechTranslationFinalRecognitionResponse *v3;
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
  const SpeechTranslationFinalRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationFinalRecognitionResponse *v6;

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

- (NSString)source_locale
{
  const SpeechTranslationFinalRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationFinalRecognitionResponse *v6;

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

- (NSString)recognition_text
{
  const SpeechTranslationFinalRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationFinalRecognitionResponse *v6;

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

- (FTRecognitionResult)recognition_result
{
  FTRecognitionResult *v3;
  FTRecognitionResult *v4;
  const SpeechTranslationFinalRecognitionResponse *root;
  const SpeechTranslationFinalRecognitionResponse *v6;
  uint64_t v7;
  const SpeechTranslationFinalRecognitionResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recognition_result"));
  v3 = (FTRecognitionResult *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTRecognitionResult alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (v7 = *(unsigned __int16 *)v6[16].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTRecognitionResult initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("recognition_result"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse>)addObjectToBuffer:(void *)a3
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
  __CFString *v21;
  __CFString *v22;
  const char *v23;
  size_t v24;
  int v25;
  __CFString *v26;
  __CFString *v27;
  const char *v28;
  size_t v29;
  void *v30;
  int v31;

  -[FTSpeechTranslationFinalRecognitionResponse conversation_id](self, "conversation_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTSpeechTranslationFinalRecognitionResponse request_id](self, "request_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_251A15610;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  v15 = -[FTSpeechTranslationFinalRecognitionResponse return_code](self, "return_code");
  -[FTSpeechTranslationFinalRecognitionResponse return_str](self, "return_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_251A15610;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v20 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);

  -[FTSpeechTranslationFinalRecognitionResponse source_locale](self, "source_locale");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_251A15610;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  -[FTSpeechTranslationFinalRecognitionResponse recognition_text](self, "recognition_text");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
    v26 = &stru_251A15610;
  v28 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v26), "UTF8String");
  v29 = strlen(v28);
  LODWORD(v28) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28, v29);

  -[FTSpeechTranslationFinalRecognitionResponse recognition_result](self, "recognition_result");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "addObjectToBuffer:", a3);

  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v30) = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v14);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v15, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v20);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v25);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, (int)v28);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v31);
  return (Offset<siri::speech::schema_fb::SpeechTranslationFinalRecognitionResponse>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (__int16)v30);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTSpeechTranslationFinalRecognitionResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __59__FTSpeechTranslationFinalRecognitionResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__59__FTSpeechTranslationFinalRecognitionResponse_flatbuffData__block_invoke(uint64_t a1)
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
