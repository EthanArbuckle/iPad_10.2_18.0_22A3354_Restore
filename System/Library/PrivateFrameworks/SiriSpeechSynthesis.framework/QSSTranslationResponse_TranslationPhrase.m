@implementation QSSTranslationResponse_TranslationPhrase

- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3
{
  return -[QSSTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4
{
  return -[QSSTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTranslationResponse_TranslationPhrase)initWithFlatbuffData:(id)a3 root:(const TranslationPhrase *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTranslationResponse_TranslationPhrase *v10;
  QSSTranslationResponse_TranslationPhrase *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTranslationResponse_TranslationPhrase *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationResponse_TranslationPhrase;
  v10 = -[QSSTranslationResponse_TranslationPhrase init](&v30, sel_init);
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
      root = (siri::speech::schema_fb::TranslationResponse_::TranslationPhrase *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationResponse_::TranslationPhrase::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)translated_tokens
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
  QSSTranslationResponse_TranslationToken *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_tokens"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      v6 = *(unsigned __int16 *)v5[6].var0;
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
            v12 = -[QSSTranslationResponse_TranslationToken initWithFlatbuffData:root:verify:]([QSSTranslationResponse_TranslationToken alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translated_tokens"));
  }
  return (NSArray *)v3;
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

- (NSArray)spans
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

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("spans"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      v6 = *(unsigned __int16 *)v5[10].var0;
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

- (BOOL)low_confidence
{
  const TranslationPhrase *root;
  const TranslationPhrase *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>)addObjectToBuffer:(void *)a3
{
  float v5;
  float v6;
  void *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t i;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  const char *v34;
  size_t v35;
  int String;
  void *v37;
  void *v38;
  uint64_t v39;
  int *begin;
  int *value;
  uint64_t j;
  int v43;
  int v44;
  std::vector<int>::pointer end;
  int *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  int *v51;
  int v52;
  int *v53;
  unsigned int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase> v60;
  uint64_t v62;
  QSSTranslationResponse_TranslationPhrase *v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  std::vector<int> v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  -[QSSTranslationResponse_TranslationPhrase confidence](self, "confidence");
  v6 = v5;
  v63 = self;
  -[QSSTranslationResponse_TranslationPhrase translated_tokens](self, "translated_tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (v8 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v8);
    v11 = &v9[4 * v10];
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[QSSTranslationResponse_TranslationPhrase translated_tokens](v63, "translated_tokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  v65 = a3;
  if (v13)
  {
    v14 = *(_QWORD *)v72;
    v15 = v9;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v72 != v14)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v18 = v17;
        if (v15 >= v11)
        {
          v19 = (v15 - v9) >> 2;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v11 - v9) >> 1 > v20)
            v20 = (v11 - v9) >> 1;
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v20;
          if (v21)
            v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
          else
            v22 = 0;
          v23 = (char *)(v21 + 4 * v19);
          *(_DWORD *)v23 = v18;
          v24 = v23 + 4;
          while (v15 != v9)
          {
            v25 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v25;
            v23 -= 4;
          }
          v11 = (char *)(v21 + 4 * v22);
          if (v9)
            operator delete(v9);
          v9 = v23;
          v15 = v24;
          a3 = v65;
        }
        else
        {
          *(_DWORD *)v15 = v17;
          v15 += 4;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  v26 = v15 - v9;
  if (v15 == v9)
    v27 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationToken>> const&)::t;
  else
    v27 = v9;
  v28 = v26 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    v30 = v28;
    do
    {
      v31 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
  }
  HIDWORD(v62) = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v28);
  -[QSSTranslationResponse_TranslationPhrase meta_info](v63, "meta_info");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
    v32 = &stru_24E246F88;
  v34 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v32), "UTF8String");
  v35 = strlen(v34);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  memset(&v70, 0, sizeof(v70));
  -[QSSTranslationResponse_TranslationPhrase spans](v63, "spans");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v70, objc_msgSend(v37, "count"));

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[QSSTranslationResponse_TranslationPhrase spans](v63, "spans");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  LODWORD(v62) = String;
  begin = v70.__begin_;
  if (v39)
  {
    v64 = *(_QWORD *)v67;
    value = v70.__end_cap_.__value_;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v67 != v64)
          objc_enumerationMutation(v38);
        v43 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "addObjectToBuffer:", v65, v62);
        v44 = v43;
        end = v70.__end_;
        if (v70.__end_ >= value)
        {
          v47 = v70.__end_ - begin;
          v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 62)
          {
            v70.__end_cap_.__value_ = value;
            v70.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v48)
            v48 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v49 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v49 = v48;
          if (v49)
            v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v49);
          else
            v50 = 0;
          v51 = (int *)(v49 + 4 * v47);
          *v51 = v44;
          v46 = v51 + 1;
          while (end != begin)
          {
            v52 = *--end;
            *--v51 = v52;
          }
          value = (int *)(v49 + 4 * v50);
          v70.__end_ = v46;
          if (begin)
            operator delete(begin);
          begin = v51;
        }
        else
        {
          *v70.__end_ = v43;
          v46 = end + 1;
        }
        v70.__end_ = v46;
      }
      v70.__end_cap_.__value_ = value;
      v70.__begin_ = begin;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v39);
  }
  else
  {
    v46 = v70.__end_;
  }

  if (v46 == begin)
    v53 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  else
    v53 = begin;
  v54 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)v65, (uint64_t)v53, v46 - begin);
  v55 = -[QSSTranslationResponse_TranslationPhrase low_confidence](v63, "low_confidence");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v65);
  *((_BYTE *)v65 + 70) = 1;
  v56 = *((_DWORD *)v65 + 8);
  v57 = *((_DWORD *)v65 + 12);
  v58 = *((_DWORD *)v65 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<float>((flatbuffers::vector_downward *)v65, 4, v6);
  if (HIDWORD(v62))
  {
    v59 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v65, HIDWORD(v62));
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v65, 6, v59);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v65, 8, v62);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v65, 10, v54);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)v65, 12, v55);
  v60.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v65, v56 - v57 + v58);
  if (begin)
  {
    v70.__end_ = begin;
    operator delete(begin);
  }
  if (v9)
    operator delete(v9);
  return v60;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase> v2;
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
  v2.var0 = -[QSSTranslationResponse_TranslationPhrase addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__QSSTranslationResponse_TranslationPhrase_flatbuffData__block_invoke;
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
