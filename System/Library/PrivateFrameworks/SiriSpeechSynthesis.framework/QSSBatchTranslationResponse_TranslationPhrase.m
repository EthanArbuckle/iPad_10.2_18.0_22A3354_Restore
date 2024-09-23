@implementation QSSBatchTranslationResponse_TranslationPhrase

- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return -[QSSBatchTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchTranslationResponse_TranslationPhrase *v10;
  QSSBatchTranslationResponse_TranslationPhrase *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSBatchTranslationResponse_TranslationPhrase *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationResponse_TranslationPhrase;
  v10 = -[QSSBatchTranslationResponse_TranslationPhrase init](&v30, sel_init);
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
      a4 = (const TranslationPhrase *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (float)confidence
{
  const TranslationPhrase *root;
  const TranslationPhrase *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (NSString)translation_phrase
{
  const TranslationPhrase *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationPhrase *v6;

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

- (NSString)meta_info
{
  const TranslationPhrase *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationPhrase *v6;

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

- (BOOL)low_confidence
{
  const TranslationPhrase *root;
  const TranslationPhrase *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)repeated_spans
{
  void *v3;
  const TranslationPhrase *root;
  const TranslationPhrase *v5;
  uint64_t v6;
  const TranslationPhrase *v7;
  uint64_t v8;
  uint64_t v9;
  const TranslationPhrase *v10;
  uint64_t v11;
  QSSRepeatedSpan *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("repeated_spans"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      v6 = *(unsigned __int16 *)v5[12].var0;
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("repeated_spans"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  float v5;
  float v6;
  __CFString *v7;
  __CFString *v8;
  const char *v9;
  size_t v10;
  unsigned int String;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  size_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int *begin;
  uint64_t v21;
  int *value;
  uint64_t i;
  void *v24;
  int v25;
  int v26;
  std::vector<int>::pointer end;
  int *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int *v33;
  int v34;
  int *v35;
  unsigned int v36;
  int v37;
  int v38;
  int v39;
  Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase> v40;
  int v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  std::vector<int> v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  -[QSSBatchTranslationResponse_TranslationPhrase confidence](self, "confidence");
  v6 = v5;
  -[QSSBatchTranslationResponse_TranslationPhrase translation_phrase](self, "translation_phrase");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_24E246F88;
  v9 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
  v10 = strlen(v9);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v9, v10);

  -[QSSBatchTranslationResponse_TranslationPhrase meta_info](self, "meta_info");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  LODWORD(v14) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v16 = -[QSSBatchTranslationResponse_TranslationPhrase low_confidence](self, "low_confidence");
  memset(&v50, 0, sizeof(v50));
  -[QSSBatchTranslationResponse_TranslationPhrase repeated_spans](self, "repeated_spans");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, objc_msgSend(v17, "count"));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[QSSBatchTranslationResponse_TranslationPhrase repeated_spans](self, "repeated_spans");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v42 = v16;
  v43 = v14;
  v44 = String;
  begin = v50.__begin_;
  if (v19)
  {
    v21 = *(_QWORD *)v47;
    value = v50.__end_cap_.__value_;
    v45 = v18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v47 != v21)
          objc_enumerationMutation(v18);
        v24 = a3;
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v26 = v25;
        end = v50.__end_;
        if (v50.__end_ >= value)
        {
          v29 = v50.__end_ - begin;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
          {
            v50.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v30)
            v30 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v31 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          if (v31)
            v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          else
            v32 = 0;
          v33 = (int *)(v31 + 4 * v29);
          *v33 = v26;
          v28 = v33 + 1;
          a3 = v24;
          while (end != begin)
          {
            v34 = *--end;
            *--v33 = v34;
          }
          value = (int *)(v31 + 4 * v32);
          v50.__end_ = v28;
          if (begin)
            operator delete(begin);
          begin = v33;
          v18 = v45;
        }
        else
        {
          *v50.__end_ = v25;
          v28 = end + 1;
          a3 = v24;
        }
        v50.__end_ = v28;
      }
      v50.__end_cap_.__value_ = value;
      v50.__begin_ = begin;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v19);
  }
  else
  {
    v28 = v50.__end_;
  }

  if (v28 == begin)
    v35 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  else
    v35 = begin;
  v36 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v35, v28 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v37 = *((_DWORD *)a3 + 8);
  v38 = *((_DWORD *)a3 + 12);
  v39 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)a3, 4, v6);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v44);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v43);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 10, v42);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v36);
  v40.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v37 - v38 + v39);
  if (begin)
  {
    v50.__end_ = begin;
    operator delete(begin);
  }
  return v40;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase> v2;
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
  v2.var0 = -[QSSBatchTranslationResponse_TranslationPhrase addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__QSSBatchTranslationResponse_TranslationPhrase_flatbuffData__block_invoke;
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
