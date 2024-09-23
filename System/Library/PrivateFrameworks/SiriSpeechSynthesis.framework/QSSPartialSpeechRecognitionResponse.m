@implementation QSSPartialSpeechRecognitionResponse

- (QSSPartialSpeechRecognitionResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSPartialSpeechRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSPartialSpeechRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSPartialSpeechRecognitionResponse)initWithFlatbuffData:(id)a3 root:(const PartialSpeechRecognitionResponse *)a4
{
  return -[QSSPartialSpeechRecognitionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSPartialSpeechRecognitionResponse)initWithFlatbuffData:(id)a3 root:(const PartialSpeechRecognitionResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSPartialSpeechRecognitionResponse *v10;
  QSSPartialSpeechRecognitionResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::PartialSpeechRecognitionResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSPartialSpeechRecognitionResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSPartialSpeechRecognitionResponse;
  v10 = -[QSSPartialSpeechRecognitionResponse init](&v30, sel_init);
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
      a4 = (const PartialSpeechRecognitionResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::PartialSpeechRecognitionResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::PartialSpeechRecognitionResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const PartialSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialSpeechRecognitionResponse *v6;

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
  const PartialSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialSpeechRecognitionResponse *v6;

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
  const PartialSpeechRecognitionResponse *root;
  const PartialSpeechRecognitionResponse *v3;
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
  const PartialSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialSpeechRecognitionResponse *v6;

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

- (NSString)recognition_text
{
  const PartialSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialSpeechRecognitionResponse *v6;

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

- (BOOL)is_stable_result
{
  const PartialSpeechRecognitionResponse *root;
  const PartialSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (int)audio_duration_ms
{
  const PartialSpeechRecognitionResponse *root;
  const PartialSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)confidence
{
  const PartialSpeechRecognitionResponse *root;
  const PartialSpeechRecognitionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)language
{
  const PartialSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialSpeechRecognitionResponse *v6;

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

- (NSString)request_locale
{
  const PartialSpeechRecognitionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialSpeechRecognitionResponse *v6;

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

- (Offset<siri::speech::schema_fb::PartialSpeechRecognitionResponse>)addObjectToBuffer:(void *)a3
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
  int v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  unsigned int v20;
  __CFString *v21;
  __CFString *v22;
  const char *v23;
  size_t v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  __CFString *v29;
  __CFString *v30;
  const char *v31;
  size_t v32;
  unsigned int v33;
  __CFString *v34;
  __CFString *v35;
  const char *v36;
  size_t v37;
  int v38;
  unsigned int v40;
  unsigned int v41;
  int v42;

  -[QSSPartialSpeechRecognitionResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSPartialSpeechRecognitionResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = -[QSSPartialSpeechRecognitionResponse return_code](self, "return_code");
  -[QSSPartialSpeechRecognitionResponse return_str](self, "return_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24E246F88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v40 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);
  v41 = v14;
  v42 = v15;
  v20 = String;

  -[QSSPartialSpeechRecognitionResponse recognition_text](self, "recognition_text");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_24E246F88;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v25 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v23, v24);

  v26 = -[QSSPartialSpeechRecognitionResponse is_stable_result](self, "is_stable_result");
  v27 = -[QSSPartialSpeechRecognitionResponse audio_duration_ms](self, "audio_duration_ms");
  v28 = -[QSSPartialSpeechRecognitionResponse confidence](self, "confidence");
  -[QSSPartialSpeechRecognitionResponse language](self, "language");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
    v29 = &stru_24E246F88;
  v31 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v29), "UTF8String");
  v32 = strlen(v31);
  v33 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);

  -[QSSPartialSpeechRecognitionResponse request_locale](self, "request_locale");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
    v34 = &stru_24E246F88;
  v36 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v34), "UTF8String");
  v37 = strlen(v36);
  LODWORD(v36) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v36, v37);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v20);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v41);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v42);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v25);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 14, v26);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v27);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v28);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v33);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v36);
  return (Offset<siri::speech::schema_fb::PartialSpeechRecognitionResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v38);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::PartialSpeechRecognitionResponse> v2;
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
  v2.var0 = -[QSSPartialSpeechRecognitionResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__QSSPartialSpeechRecognitionResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__51__QSSPartialSpeechRecognitionResponse_flatbuffData__block_invoke(uint64_t a1)
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
