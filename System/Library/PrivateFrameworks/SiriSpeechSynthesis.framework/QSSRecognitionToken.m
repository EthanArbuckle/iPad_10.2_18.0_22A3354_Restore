@implementation QSSRecognitionToken

- (QSSRecognitionToken)initWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionToken initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionToken initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecognitionToken)initWithFlatbuffData:(id)a3 root:(const RecognitionToken *)a4
{
  return -[QSSRecognitionToken initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecognitionToken)initWithFlatbuffData:(id)a3 root:(const RecognitionToken *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecognitionToken *v10;
  QSSRecognitionToken *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::RecognitionToken *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSRecognitionToken *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionToken;
  v10 = -[QSSRecognitionToken init](&v30, sel_init);
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
      a4 = (const RecognitionToken *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionToken *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionToken::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)token_text
{
  const RecognitionToken *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecognitionToken *v6;

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

- (int)start_milli_seconds
{
  const RecognitionToken *root;
  const RecognitionToken *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)end_milli_seconds
{
  const RecognitionToken *root;
  const RecognitionToken *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)silence_start_milli_seconds
{
  const RecognitionToken *root;
  const RecognitionToken *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)confidence
{
  const RecognitionToken *root;
  const RecognitionToken *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (BOOL)add_space_after
{
  const RecognitionToken *root;
  const RecognitionToken *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)phone_seq
{
  const RecognitionToken *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecognitionToken *v6;

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

- (NSString)ipa_phone_seq
{
  const RecognitionToken *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecognitionToken *v6;

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

- (Offset<siri::speech::schema_fb::RecognitionToken>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  unsigned int String;
  int v10;
  int v11;
  int v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  const char *v16;
  size_t v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  const char *v21;
  size_t v22;
  int v23;
  int v25;

  -[QSSRecognitionToken token_text](self, "token_text");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  v10 = -[QSSRecognitionToken start_milli_seconds](self, "start_milli_seconds");
  v11 = -[QSSRecognitionToken end_milli_seconds](self, "end_milli_seconds");
  v12 = -[QSSRecognitionToken silence_start_milli_seconds](self, "silence_start_milli_seconds");
  v13 = -[QSSRecognitionToken confidence](self, "confidence");
  v25 = -[QSSRecognitionToken add_space_after](self, "add_space_after");
  -[QSSRecognitionToken phone_seq](self, "phone_seq");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    v14 = &stru_24E246F88;
  v16 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
  v17 = strlen(v16);
  v18 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  -[QSSRecognitionToken ipa_phone_seq](self, "ipa_phone_seq");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = &stru_24E246F88;
  v21 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v19), "UTF8String");
  v22 = strlen(v21);
  LODWORD(v21) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v23 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v11);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v12);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v13);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 14, v25);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v18);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v21);
  return (Offset<siri::speech::schema_fb::RecognitionToken>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v23);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RecognitionToken> v2;
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
  v2.var0 = -[QSSRecognitionToken addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__QSSRecognitionToken_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__35__QSSRecognitionToken_flatbuffData__block_invoke(uint64_t a1)
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
