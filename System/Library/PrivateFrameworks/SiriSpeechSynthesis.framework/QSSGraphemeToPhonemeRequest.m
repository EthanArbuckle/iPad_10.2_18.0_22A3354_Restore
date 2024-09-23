@implementation QSSGraphemeToPhonemeRequest

- (QSSGraphemeToPhonemeRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSGraphemeToPhonemeRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSGraphemeToPhonemeRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSGraphemeToPhonemeRequest)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeRequest *)a4
{
  return -[QSSGraphemeToPhonemeRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSGraphemeToPhonemeRequest)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSGraphemeToPhonemeRequest *v10;
  QSSGraphemeToPhonemeRequest *v11;
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
  uint64_t v32;
  NSMutableDictionary *storage;
  QSSGraphemeToPhonemeRequest *v34;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;

  v5 = a5;
  v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)QSSGraphemeToPhonemeRequest;
  v10 = -[QSSGraphemeToPhonemeRequest init](&v41, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_38;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const GraphemeToPhonemeRequest *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_38;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v36 = v18;
      v37 = v19;
      v38 = xmmword_21E34D540;
      v39 = 0;
      LOBYTE(v40) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (flatbuffers::Table *)v11->_root;
      if (root)
      {
        if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v36, v11->_root->var0)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 4u))
        {
          goto LABEL_38;
        }
        v21 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v21 >= 5u && (v22 = v21[2]) != 0)
          v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
        else
          v23 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v23)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 6u))
        {
          goto LABEL_38;
        }
        v24 = (unsigned __int16 *)((char *)root - *(int *)root);
        if (*v24 >= 7u && (v25 = v24[3]) != 0)
          v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
        else
          v26 = 0;
        if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v26)
          || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 8u)
          || ((v27 = (unsigned __int16 *)((char *)root - *(int *)root), *v27 < 9u) || (v28 = v27[4]) == 0
            ? (v29 = 0)
            : (v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28)),
              !flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v29)
           || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 0xAu)
           || (v30 = (unsigned __int16 *)((char *)root - *(int *)root), *v30 >= 0xBu)
           && (v31 = v30[5]) != 0
           && !siri::speech::schema_fb::ContextWithPronHints::Verify((flatbuffers::Table *)((char *)root + v31 + *(unsigned int *)((char *)root + v31)), (flatbuffers::Verifier *)&v36)))
        {
LABEL_38:
          v34 = 0;
          goto LABEL_39;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v36, v37, v38, v39, v40);
    v32 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v32;

  }
  v34 = v11;
LABEL_39:

  return v34;
}

- (NSString)session_id
{
  const GraphemeToPhonemeRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeRequest *v6;

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

- (NSString)language
{
  const GraphemeToPhonemeRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeRequest *v6;

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

- (NSString)orthography
{
  const GraphemeToPhonemeRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeRequest *v6;

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

- (QSSContextWithPronHints)context_with_pron_hints
{
  QSSContextWithPronHints *v3;
  QSSContextWithPronHints *v4;
  const GraphemeToPhonemeRequest *root;
  const GraphemeToPhonemeRequest *v6;
  uint64_t v7;
  const GraphemeToPhonemeRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_with_pron_hints"));
  v3 = (QSSContextWithPronHints *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSContextWithPronHints alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSContextWithPronHints initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_with_pron_hints"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::GraphemeToPhonemeRequest>)addObjectToBuffer:(void *)a3
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

  -[QSSGraphemeToPhonemeRequest session_id](self, "session_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSGraphemeToPhonemeRequest language](self, "language");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSGraphemeToPhonemeRequest orthography](self, "orthography");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  LODWORD(v17) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSGraphemeToPhonemeRequest context_with_pron_hints](self, "context_with_pron_hints");
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
  return (Offset<siri::speech::schema_fb::GraphemeToPhonemeRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v23 - (int)v21 + (int)v22);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::GraphemeToPhonemeRequest> v2;
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
  v2.var0 = -[QSSGraphemeToPhonemeRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__QSSGraphemeToPhonemeRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__43__QSSGraphemeToPhonemeRequest_flatbuffData__block_invoke(uint64_t a1)
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
