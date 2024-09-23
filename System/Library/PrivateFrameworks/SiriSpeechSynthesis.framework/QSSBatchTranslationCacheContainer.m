@implementation QSSBatchTranslationCacheContainer

- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationCacheContainer initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationCacheContainer initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4
{
  return -[QSSBatchTranslationCacheContainer initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchTranslationCacheContainer)initWithFlatbuffData:(id)a3 root:(const BatchTranslationCacheContainer *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchTranslationCacheContainer *v10;
  QSSBatchTranslationCacheContainer *v11;
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
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableDictionary *storage;
  QSSBatchTranslationCacheContainer *v34;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  objc_super v41;

  v5 = a5;
  v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)QSSBatchTranslationCacheContainer;
  v10 = -[QSSBatchTranslationCacheContainer init](&v41, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_40;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_41;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const BatchTranslationCacheContainer *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_39;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_41;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v36 = v18;
  v37 = v19;
  v38 = xmmword_21E34D540;
  v39 = 0;
  v40 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_39;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v36, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 4u))
  {
    goto LABEL_41;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 6u))
  {
    goto LABEL_41;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 8u))
  {
    goto LABEL_41;
  }
  v27 = 0;
  v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) < 9u)
    goto LABEL_34;
  if (*(_WORD *)((char *)root - v28 + 8))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v36, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 8)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 8)), 4uLL, 0))
    {
      v27 = 0;
      v28 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v28) < 9u)
        goto LABEL_34;
      goto LABEL_31;
    }
LABEL_41:
    v34 = 0;
    goto LABEL_42;
  }
LABEL_31:
  v29 = *(unsigned __int16 *)((char *)root - v28 + 8);
  if (v29)
    v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
  else
    v27 = 0;
LABEL_34:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RepeatedSpan>((flatbuffers::Verifier *)&v36, v27))goto LABEL_41;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v30 >= 0xBu)
  {
    v31 = v30[5];
    if (v31)
    {
      if (v37 < 5 || v37 - 4 < (unint64_t)root + v31 - v36)
        goto LABEL_41;
    }
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v36);
  v32 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v32;

LABEL_40:
  v34 = v11;
LABEL_42:

  return v34;
}

- (NSString)request_id
{
  const BatchTranslationCacheContainer *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationCacheContainer *v6;

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

- (NSString)translated_text
{
  const BatchTranslationCacheContainer *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationCacheContainer *v6;

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

- (NSArray)spans
{
  void *v3;
  const BatchTranslationCacheContainer *root;
  const BatchTranslationCacheContainer *v5;
  uint64_t v6;
  const BatchTranslationCacheContainer *v7;
  uint64_t v8;
  uint64_t v9;
  const BatchTranslationCacheContainer *v10;
  uint64_t v11;
  QSSRepeatedSpan *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("spans"));
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
            v12 = -[QSSRepeatedSpan initWithFlatbuffData:root:verify:]([QSSRepeatedSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("spans"));
  }
  return (NSArray *)v3;
}

- (int)sentence_count
{
  const BatchTranslationCacheContainer *root;
  const BatchTranslationCacheContainer *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationCacheContainer>)addObjectToBuffer:(void *)a3
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
  void *v15;
  void *v16;
  uint64_t v17;
  int *begin;
  uint64_t v19;
  int *value;
  uint64_t i;
  int v22;
  int v23;
  std::vector<int>::pointer end;
  int *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  int *v32;
  unsigned int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  Offset<siri::speech::schema_fb::BatchTranslationCacheContainer> v38;
  unsigned int v40;
  unsigned int v41;
  QSSBatchTranslationCacheContainer *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  std::vector<int> v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[QSSBatchTranslationCacheContainer request_id](self, "request_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSBatchTranslationCacheContainer translated_text](self, "translated_text");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  memset(&v48, 0, sizeof(v48));
  -[QSSBatchTranslationCacheContainer spans](self, "spans");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v48, objc_msgSend(v15, "count"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[QSSBatchTranslationCacheContainer spans](self, "spans");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  v40 = v14;
  v41 = String;
  v42 = self;
  begin = v48.__begin_;
  if (v17)
  {
    v19 = *(_QWORD *)v45;
    value = v48.__end_cap_.__value_;
    v43 = v16;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v19)
          objc_enumerationMutation(v16);
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v23 = v22;
        end = v48.__end_;
        if (v48.__end_ >= value)
        {
          v26 = v48.__end_ - begin;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 62)
          {
            v48.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v27)
            v27 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v28 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v28 = v27;
          if (v28)
            v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v28);
          else
            v29 = 0;
          v30 = (int *)(v28 + 4 * v26);
          *v30 = v23;
          v25 = v30 + 1;
          while (end != begin)
          {
            v31 = *--end;
            *--v30 = v31;
          }
          value = (int *)(v28 + 4 * v29);
          v48.__end_ = v25;
          if (begin)
            operator delete(begin);
          begin = v30;
          v16 = v43;
        }
        else
        {
          *v48.__end_ = v22;
          v25 = end + 1;
        }
        v48.__end_ = v25;
      }
      v48.__end_cap_.__value_ = value;
      v48.__begin_ = begin;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v17);
  }
  else
  {
    v25 = v48.__end_;
  }

  if (v25 == begin)
    v32 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  else
    v32 = begin;
  v33 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v32, v25 - begin);
  v34 = -[QSSBatchTranslationCacheContainer sentence_count](v42, "sentence_count");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v35 = *((_DWORD *)a3 + 8);
  v36 = *((_DWORD *)a3 + 12);
  v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v33);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v34);
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (begin)
  {
    v48.__end_ = begin;
    operator delete(begin);
  }
  return v38;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BatchTranslationCacheContainer> v2;
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
  v2.var0 = -[QSSBatchTranslationCacheContainer addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__QSSBatchTranslationCacheContainer_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__49__QSSBatchTranslationCacheContainer_flatbuffData__block_invoke(uint64_t a1)
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
