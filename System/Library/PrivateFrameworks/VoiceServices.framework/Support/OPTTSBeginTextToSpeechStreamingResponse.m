@implementation OPTTSBeginTextToSpeechStreamingResponse

- (OPTTSBeginTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[OPTTSBeginTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSBeginTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSBeginTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BeginTextToSpeechStreamingResponse *)a4
{
  return -[OPTTSBeginTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSBeginTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const BeginTextToSpeechStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSBeginTextToSpeechStreamingResponse *v10;
  OPTTSBeginTextToSpeechStreamingResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  OPTTSBeginTextToSpeechStreamingResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSBeginTextToSpeechStreamingResponse;
  v10 = -[OPTTSBeginTextToSpeechStreamingResponse init](&v30, sel_init);
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
      a4 = (const BeginTextToSpeechStreamingResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BeginTextToSpeechStreamingResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const BeginTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BeginTextToSpeechStreamingResponse *v6;

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
  const BeginTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BeginTextToSpeechStreamingResponse *v6;

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

- (int)error_code
{
  const BeginTextToSpeechStreamingResponse *root;
  const BeginTextToSpeechStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const BeginTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BeginTextToSpeechStreamingResponse *v6;

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

- (NSString)stream_id
{
  const BeginTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BeginTextToSpeechStreamingResponse *v6;

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

- (int64_t)audio_type
{
  const BeginTextToSpeechStreamingResponse *root;
  const BeginTextToSpeechStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (OPTTSAudioDescription)decoder_description
{
  OPTTSAudioDescription *v3;
  OPTTSAudioDescription *v4;
  const BeginTextToSpeechStreamingResponse *root;
  const BeginTextToSpeechStreamingResponse *v6;
  uint64_t v7;
  const BeginTextToSpeechStreamingResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("decoder_description"));
  v3 = (OPTTSAudioDescription *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (v7 = *(unsigned __int16 *)v6[16].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("decoder_description"));
  }
  return v3;
}

- (OPTTSAudioDescription)playback_description
{
  OPTTSAudioDescription *v3;
  OPTTSAudioDescription *v4;
  const BeginTextToSpeechStreamingResponse *root;
  const BeginTextToSpeechStreamingResponse *v6;
  uint64_t v7;
  const BeginTextToSpeechStreamingResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("playback_description"));
  v3 = (OPTTSAudioDescription *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (v7 = *(unsigned __int16 *)v6[18].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("playback_description"));
  }
  return v3;
}

- (OPTTSTextToSpeechMeta)meta_info
{
  OPTTSTextToSpeechMeta *v3;
  OPTTSTextToSpeechMeta *v4;
  const BeginTextToSpeechStreamingResponse *root;
  const BeginTextToSpeechStreamingResponse *v6;
  uint64_t v7;
  const BeginTextToSpeechStreamingResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (OPTTSTextToSpeechMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (float)streaming_playback_buffer_size_in_seconds
{
  const BeginTextToSpeechStreamingResponse *root;
  const BeginTextToSpeechStreamingResponse *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x17u)
  {
    v5 = *(unsigned __int16 *)v3[22].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (Offset<siri::speech::schema_fb::BeginTextToSpeechStreamingResponse>)addObjectToBuffer:(void *)a3
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
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  unsigned int v31;
  float v32;
  float v33;
  int v34;
  unsigned int v36;
  unsigned int v37;

  -[OPTTSBeginTextToSpeechStreamingResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24DD8EF88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[OPTTSBeginTextToSpeechStreamingResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24DD8EF88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = -[OPTTSBeginTextToSpeechStreamingResponse error_code](self, "error_code");
  -[OPTTSBeginTextToSpeechStreamingResponse error_str](self, "error_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24DD8EF88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v36 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);
  v37 = v14;
  v20 = String;

  -[OPTTSBeginTextToSpeechStreamingResponse stream_id](self, "stream_id");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_24DD8EF88;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v25 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v23, v24);

  v26 = -[OPTTSBeginTextToSpeechStreamingResponse audio_type](self, "audio_type");
  -[OPTTSBeginTextToSpeechStreamingResponse decoder_description](self, "decoder_description");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "addObjectToBuffer:", a3);

  -[OPTTSBeginTextToSpeechStreamingResponse playback_description](self, "playback_description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v29, "addObjectToBuffer:", a3);

  -[OPTTSBeginTextToSpeechStreamingResponse meta_info](self, "meta_info");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "addObjectToBuffer:", a3);

  -[OPTTSBeginTextToSpeechStreamingResponse streaming_playback_buffer_size_in_seconds](self, "streaming_playback_buffer_size_in_seconds");
  v33 = v32;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v34 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, v20);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v37);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v15);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 10, v36);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 12, v25);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v26);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 16, v28);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 18, v23);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 20, v31);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 22, v33);
  return (Offset<siri::speech::schema_fb::BeginTextToSpeechStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v34);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BeginTextToSpeechStreamingResponse> v2;
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
  v2.var0 = -[OPTTSBeginTextToSpeechStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__OPTTSBeginTextToSpeechStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__55__OPTTSBeginTextToSpeechStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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
