@implementation QSSStreamingTranslationRequest

- (QSSStreamingTranslationRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSStreamingTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSStreamingTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSStreamingTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StreamingTranslationRequest *)a4
{
  return -[QSSStreamingTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSStreamingTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StreamingTranslationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSStreamingTranslationRequest *v10;
  QSSStreamingTranslationRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::StreamingTranslationRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSStreamingTranslationRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStreamingTranslationRequest;
  v10 = -[QSSStreamingTranslationRequest init](&v30, sel_init);
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
      a4 = (const StreamingTranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StreamingTranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StreamingTranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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

- (NSString)task
{
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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

- (NSString)source_language
{
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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

- (NSString)target_language
{
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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

- (NSString)translation_text
{
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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

- (NSString)sequence_id
{
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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

- (BOOL)disable_log
{
  const StreamingTranslationRequest *root;
  const StreamingTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)opt_in_status
{
  const StreamingTranslationRequest *root;
  const StreamingTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (NSString)app_id
{
  const StreamingTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StreamingTranslationRequest *v6;

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

- (BOOL)final_message
{
  const StreamingTranslationRequest *root;
  const StreamingTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x19u && (v4 = *(unsigned __int16 *)v3[24].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::StreamingTranslationRequest>)addObjectToBuffer:(void *)a3
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
  unsigned int v24;
  __CFString *v25;
  __CFString *v26;
  const char *v27;
  size_t v28;
  unsigned int v29;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  size_t v33;
  unsigned int v34;
  __CFString *v35;
  __CFString *v36;
  const char *v37;
  size_t v38;
  unsigned int v39;
  int v40;
  int v41;
  __CFString *v42;
  __CFString *v43;
  const char *v44;
  size_t v45;
  int v46;
  int v47;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;

  -[QSSStreamingTranslationRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSStreamingTranslationRequest request_id](self, "request_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSStreamingTranslationRequest task](self, "task");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSStreamingTranslationRequest source_language](self, "source_language");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_24E246F88;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  v24 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  -[QSSStreamingTranslationRequest target_language](self, "target_language");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_24E246F88;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v29 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v27, v28);

  -[QSSStreamingTranslationRequest translation_text](self, "translation_text");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
    v30 = &stru_24E246F88;
  v32 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v30), "UTF8String");
  v33 = strlen(v32);
  v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v32, v33);
  v49 = v29;
  v50 = v24;
  v34 = v19;

  -[QSSStreamingTranslationRequest sequence_id](self, "sequence_id");
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
    v35 = &stru_24E246F88;
  v37 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v35), "UTF8String");
  v38 = strlen(v37);
  v39 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v37, v38);

  v40 = -[QSSStreamingTranslationRequest disable_log](self, "disable_log");
  v41 = -[QSSStreamingTranslationRequest opt_in_status](self, "opt_in_status");
  -[QSSStreamingTranslationRequest app_id](self, "app_id");
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42)
    v42 = &stru_24E246F88;
  v44 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v42), "UTF8String");
  v45 = strlen(v44);
  LODWORD(v44) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v44, v45);

  v46 = -[QSSStreamingTranslationRequest final_message](self, "final_message");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v47 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v34);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v39);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 18, v40);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v44);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 24, v46);
  return (Offset<siri::speech::schema_fb::StreamingTranslationRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v47);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::StreamingTranslationRequest> v2;
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
  v2.var0 = -[QSSStreamingTranslationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__QSSStreamingTranslationRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__46__QSSStreamingTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
