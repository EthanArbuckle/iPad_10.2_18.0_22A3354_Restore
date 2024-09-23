@implementation QSSTextNormalizationRequest

- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSTextNormalizationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextNormalizationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3 root:(const TextNormalizationRequest *)a4
{
  return -[QSSTextNormalizationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextNormalizationRequest)initWithFlatbuffData:(id)a3 root:(const TextNormalizationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextNormalizationRequest *v10;
  QSSTextNormalizationRequest *v11;
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
  const unsigned __int8 *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *storage;
  QSSTextNormalizationRequest *v37;
  uint64_t v39;
  unint64_t v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  objc_super v44;

  v5 = a5;
  v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSTextNormalizationRequest;
  v10 = -[QSSTextNormalizationRequest init](&v44, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_44;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const TextNormalizationRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_44;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v39 = v18;
      v40 = v19;
      v41 = xmmword_21E34D540;
      v42 = 0;
      v43 = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
        {
          goto LABEL_44;
        }
        v21 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v21 >= 5u && (v22 = v21[2]) != 0)
          v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
        else
          v23 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
        {
          goto LABEL_44;
        }
        v24 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v24 >= 7u && (v25 = v24[3]) != 0)
          v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
        else
          v26 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 8u))
        {
          goto LABEL_44;
        }
        v27 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v27 >= 9u && (v28 = v27[4]) != 0)
          v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
        else
          v29 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu)
          || ((v30 = (unsigned __int16 *)((char *)root - *(int *)root), *v30 < 0xBu) || (v31 = v30[5]) == 0
            ? (v32 = 0)
            : (v32 = (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31)),
              !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v32)
           || (v33 = (unsigned __int16 *)((char *)root - *(int *)root), *v33 >= 0xDu)
           && (v34 = v33[6]) != 0
           && (v40 < 5 || v40 - 4 < (unint64_t)root + v34 - v39)))
        {
LABEL_44:
          v37 = 0;
          goto LABEL_45;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v39);
    v35 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v35;

  }
  v37 = v11;
LABEL_45:

  return v37;
}

- (NSString)speech_id
{
  const TextNormalizationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationRequest *v6;

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
  const TextNormalizationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationRequest *v6;

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
  const TextNormalizationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationRequest *v6;

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

- (NSString)text
{
  const TextNormalizationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationRequest *v6;

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

- (int)nbest_variants_max
{
  const TextNormalizationRequest *root;
  const TextNormalizationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::TextNormalizationRequest>)addObjectToBuffer:(void *)a3
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
  int v24;
  int v25;

  -[QSSTextNormalizationRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSTextNormalizationRequest session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSTextNormalizationRequest language](self, "language");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v19 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSTextNormalizationRequest text](self, "text");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_24E246F88;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  LODWORD(v22) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  v24 = -[QSSTextNormalizationRequest nbest_variants_max](self, "nbest_variants_max");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v25 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v19);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v22);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v24);
  return (Offset<siri::speech::schema_fb::TextNormalizationRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v25);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextNormalizationRequest> v2;
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
  v2.var0 = -[QSSTextNormalizationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__QSSTextNormalizationRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__43__QSSTextNormalizationRequest_flatbuffData__block_invoke(uint64_t a1)
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
