@implementation QSSCorrectionsValidatorRequest

- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSCorrectionsValidatorRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSCorrectionsValidatorRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorRequest *)a4
{
  return -[QSSCorrectionsValidatorRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSCorrectionsValidatorRequest)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSCorrectionsValidatorRequest *v10;
  QSSCorrectionsValidatorRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  flatbuffers::Table *root;
  unsigned __int16 *v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  const unsigned __int8 *v26;
  unsigned __int16 *v27;
  uint64_t v28;
  const unsigned __int8 *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  unsigned __int16 *v32;
  uint64_t v33;
  const unsigned __int8 *v34;
  unsigned __int16 *v35;
  uint64_t v36;
  const unsigned __int8 *v37;
  uint64_t v38;
  NSMutableDictionary *storage;
  QSSCorrectionsValidatorRequest *v40;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v47;

  v5 = a5;
  v9 = a3;
  v47.receiver = self;
  v47.super_class = (Class)QSSCorrectionsValidatorRequest;
  v10 = -[QSSCorrectionsValidatorRequest init](&v47, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_51;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const CorrectionsValidatorRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_51;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v42 = v18;
      v43 = v19;
      v44 = xmmword_21E34D540;
      v45 = 0;
      LOBYTE(v46) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v42, v11->_root->var0)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 4u))
        {
          goto LABEL_51;
        }
        v21 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v21 >= 5u && (v22 = v21[2]) != 0)
          v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
        else
          v23 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v23)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 6u))
        {
          goto LABEL_51;
        }
        v24 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v24 >= 7u && (v25 = v24[3]) != 0)
          v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
        else
          v26 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v26)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 8u))
        {
          goto LABEL_51;
        }
        v27 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v27 >= 9u && (v28 = v27[4]) != 0)
          v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
        else
          v29 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v29))
          goto LABEL_51;
        if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xAu))
          goto LABEL_51;
        v30 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v30 >= 0xBu)
        {
          v31 = v30[5];
          if (v31)
          {
            if (!siri::speech::schema_fb::RecognitionResult::Verify((flatbuffers::Table *)((char *)root + v31 + *(unsigned int *)((char *)root + v31)), (flatbuffers::Verifier *)&v42))goto LABEL_51;
          }
        }
        if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xCu))
          goto LABEL_51;
        v32 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v32 >= 0xDu && (v33 = v32[6]) != 0)
          v34 = (const unsigned __int8 *)root + v33 + *(unsigned int *)((char *)root + v33);
        else
          v34 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v34)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xEu)
          || ((v35 = (unsigned __int16 *)((char *)root - *(int *)root), *v35 < 0xFu) || (v36 = v35[7]) == 0
            ? (v37 = 0)
            : (v37 = (const unsigned __int8 *)root + v36 + *(unsigned int *)((char *)root + v36)),
              !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v37)))
        {
LABEL_51:
          v40 = 0;
          goto LABEL_52;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v42, v43, v44, v45, v46);
    v38 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v38;

  }
  v40 = v11;
LABEL_52:

  return v40;
}

- (NSString)speech_id
{
  const CorrectionsValidatorRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorRequest *v6;

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
  const CorrectionsValidatorRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorRequest *v6;

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
  const CorrectionsValidatorRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorRequest *v6;

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

- (QSSRecognitionResult)recognition_result
{
  QSSRecognitionResult *v3;
  QSSRecognitionResult *v4;
  const CorrectionsValidatorRequest *root;
  const CorrectionsValidatorRequest *v6;
  uint64_t v7;
  const CorrectionsValidatorRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recognition_result"));
  v3 = (QSSRecognitionResult *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSRecognitionResult alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSRecognitionResult initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("recognition_result"));
  }
  return v3;
}

- (NSString)original_utterance
{
  const CorrectionsValidatorRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorRequest *v6;

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

- (NSString)corrected_utterance
{
  const CorrectionsValidatorRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorRequest *v6;

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

- (Offset<siri::speech::schema_fb::CorrectionsValidatorRequest>)addObjectToBuffer:(void *)a3
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
  void *v20;
  unsigned int v21;
  __CFString *v22;
  __CFString *v23;
  const char *v24;
  size_t v25;
  unsigned int v26;
  __CFString *v27;
  __CFString *v28;
  const char *v29;
  size_t v30;
  int v31;

  -[QSSCorrectionsValidatorRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSCorrectionsValidatorRequest session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSCorrectionsValidatorRequest language](self, "language");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSCorrectionsValidatorRequest recognition_result](self, "recognition_result");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  -[QSSCorrectionsValidatorRequest original_utterance](self, "original_utterance");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
    v22 = &stru_24E246F88;
  v24 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v22), "UTF8String");
  v25 = strlen(v24);
  v26 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v24, v25);

  -[QSSCorrectionsValidatorRequest corrected_utterance](self, "corrected_utterance");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
    v27 = &stru_24E246F88;
  v29 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v27), "UTF8String");
  v30 = strlen(v29);
  LODWORD(v29) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v29, v30);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v31 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v19);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v21);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v26);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v29);
  return (Offset<siri::speech::schema_fb::CorrectionsValidatorRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v31);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::CorrectionsValidatorRequest> v2;
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
  v2.var0 = -[QSSCorrectionsValidatorRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__QSSCorrectionsValidatorRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__46__QSSCorrectionsValidatorRequest_flatbuffData__block_invoke(uint64_t a1)
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
