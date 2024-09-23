@implementation QSSBatchTranslationRequest_Paragraph

- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationRequest_Paragraph initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationRequest_Paragraph initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3 root:(const Paragraph *)a4
{
  return -[QSSBatchTranslationRequest_Paragraph initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchTranslationRequest_Paragraph)initWithFlatbuffData:(id)a3 root:(const Paragraph *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchTranslationRequest_Paragraph *v10;
  QSSBatchTranslationRequest_Paragraph *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::BatchTranslationRequest_::Paragraph *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSBatchTranslationRequest_Paragraph *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationRequest_Paragraph;
  v10 = -[QSSBatchTranslationRequest_Paragraph init](&v30, sel_init);
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
      a4 = (const Paragraph *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationRequest_::Paragraph *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationRequest_::Paragraph::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)paragraph_id
{
  const Paragraph *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const Paragraph *v6;

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

- (NSString)text
{
  const Paragraph *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const Paragraph *v6;

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

- (NSArray)span
{
  void *v3;
  const Paragraph *root;
  const Paragraph *v5;
  uint64_t v6;
  const Paragraph *v7;
  uint64_t v8;
  uint64_t v9;
  const Paragraph *v10;
  uint64_t v11;
  QSSSpan *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("span"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      v6 = *(unsigned __int16 *)v5[8].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        v10 = &v7[v8 + 4];
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            v12 = -[QSSSpan initWithFlatbuffData:root:verify:]([QSSSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("span"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>)addObjectToBuffer:(void *)a3
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
  void *v14;
  uint64_t v15;
  int *begin;
  uint64_t v17;
  int *value;
  uint64_t i;
  int v20;
  int v21;
  std::vector<int>::pointer end;
  int *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int *v28;
  int v29;
  int *v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph> v35;
  unint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  std::vector<int> v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[QSSBatchTranslationRequest_Paragraph paragraph_id](self, "paragraph_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSBatchTranslationRequest_Paragraph text](self, "text");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  LODWORD(v12) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  memset(&v43, 0, sizeof(v43));
  -[QSSBatchTranslationRequest_Paragraph span](self, "span");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v43, objc_msgSend(v14, "count"));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[QSSBatchTranslationRequest_Paragraph span](self, "span");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v37 = __PAIR64__(String, v12);
  begin = v43.__begin_;
  if (v15)
  {
    v17 = *(_QWORD *)v40;
    value = v43.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(obj);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "addObjectToBuffer:", a3, v37);
        v21 = v20;
        end = v43.__end_;
        if (v43.__end_ >= value)
        {
          v24 = v43.__end_ - begin;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
          {
            v43.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v25)
            v25 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v26 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v26 = v25;
          if (v26)
            v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v26);
          else
            v27 = 0;
          v28 = (int *)(v26 + 4 * v24);
          *v28 = v21;
          v23 = v28 + 1;
          while (end != begin)
          {
            v29 = *--end;
            *--v28 = v29;
          }
          value = (int *)(v26 + 4 * v27);
          v43.__end_ = v23;
          if (begin)
            operator delete(begin);
          begin = v28;
        }
        else
        {
          *v43.__end_ = v20;
          v23 = end + 1;
        }
        v43.__end_ = v23;
      }
      v43.__end_cap_.__value_ = value;
      v43.__begin_ = begin;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v15);
  }
  else
  {
    v23 = v43.__end_;
  }

  if (v23 == begin)
    v30 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Span>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Span>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Span>> const&)::t;
  else
    v30 = begin;
  v31 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v30, v23 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v32 = *((_DWORD *)a3 + 8);
  v33 = *((_DWORD *)a3 + 12);
  v34 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, HIDWORD(v37));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v37);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v31);
  v35.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v32 - v33 + v34);
  if (begin)
  {
    v43.__end_ = begin;
    operator delete(begin);
  }
  return v35;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph> v2;
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
  v2.var0 = -[QSSBatchTranslationRequest_Paragraph addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__QSSBatchTranslationRequest_Paragraph_flatbuffData__block_invoke;
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

@end
