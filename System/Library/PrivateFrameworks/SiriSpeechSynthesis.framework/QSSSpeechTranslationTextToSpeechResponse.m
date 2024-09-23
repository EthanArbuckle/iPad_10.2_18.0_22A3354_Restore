@implementation QSSSpeechTranslationTextToSpeechResponse

- (QSSSpeechTranslationTextToSpeechResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSSpeechTranslationTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSSpeechTranslationTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSSpeechTranslationTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationTextToSpeechResponse *)a4
{
  return -[QSSSpeechTranslationTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSSpeechTranslationTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationTextToSpeechResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSSpeechTranslationTextToSpeechResponse *v10;
  QSSSpeechTranslationTextToSpeechResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSSpeechTranslationTextToSpeechResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSpeechTranslationTextToSpeechResponse;
  v10 = -[QSSSpeechTranslationTextToSpeechResponse init](&v30, sel_init);
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
      a4 = (const SpeechTranslationTextToSpeechResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)conversation_id
{
  const SpeechTranslationTextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationTextToSpeechResponse *v6;

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
  const SpeechTranslationTextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationTextToSpeechResponse *v6;

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

- (NSString)target_locale
{
  const SpeechTranslationTextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationTextToSpeechResponse *v6;

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

- (QSSTextToSpeechResponse)text_to_speech_response
{
  QSSTextToSpeechResponse *v3;
  QSSTextToSpeechResponse *v4;
  const SpeechTranslationTextToSpeechResponse *root;
  const SpeechTranslationTextToSpeechResponse *v6;
  uint64_t v7;
  const SpeechTranslationTextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text_to_speech_response"));
  v3 = (QSSTextToSpeechResponse *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechResponse alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("text_to_speech_response"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse>)addObjectToBuffer:(void *)a3
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
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;

  -[QSSSpeechTranslationTextToSpeechResponse conversation_id](self, "conversation_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSSpeechTranslationTextToSpeechResponse request_id](self, "request_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSSpeechTranslationTextToSpeechResponse target_locale](self, "target_locale");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  LODWORD(v17) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSSpeechTranslationTextToSpeechResponse text_to_speech_response](self, "text_to_speech_response");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v22 = *((_QWORD *)a3 + 5);
  v21 = *((_QWORD *)a3 + 6);
  v23 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v17);
  if (v20)
  {
    v24 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v20);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v24);
  }
  return (Offset<siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v23 - (int)v21 + (int)v22);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::SpeechTranslationTextToSpeechResponse> v2;
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
  v2.var0 = -[QSSSpeechTranslationTextToSpeechResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__QSSSpeechTranslationTextToSpeechResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__56__QSSSpeechTranslationTextToSpeechResponse_flatbuffData__block_invoke(uint64_t a1)
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
