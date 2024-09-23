@implementation QSSBatchTranslationResponse

- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4
{
  return -[QSSBatchTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchTranslationResponse)initWithFlatbuffData:(id)a3 root:(const BatchTranslationResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchTranslationResponse *v10;
  QSSBatchTranslationResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::BatchTranslationResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSBatchTranslationResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationResponse;
  v10 = -[QSSBatchTranslationResponse init](&v30, sel_init);
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
      a4 = (const BatchTranslationResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)request_id
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (int)return_code
{
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_string
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (NSString)paragraph_id
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (NSString)translated_text
{
  const BatchTranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationResponse *v6;

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

- (NSArray)span
{
  void *v3;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v5;
  uint64_t v6;
  const BatchTranslationResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const BatchTranslationResponse *v10;
  uint64_t v11;
  QSSRepeatedSpan *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("span"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xFu)
    {
      v6 = *(unsigned __int16 *)v5[14].var0;
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("span"));
  }
  return (NSArray *)v3;
}

- (NSArray)translated_sentences
{
  void *v3;
  const BatchTranslationResponse *root;
  const BatchTranslationResponse *v5;
  uint64_t v6;
  const BatchTranslationResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const BatchTranslationResponse *v10;
  uint64_t v11;
  QSSBatchTranslationResponse_TranslatedSentence *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translated_sentences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x11u)
    {
      v6 = *(unsigned __int16 *)v5[16].var0;
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
            v12 = -[QSSBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:]([QSSBatchTranslationResponse_TranslatedSentence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translated_sentences"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  size_t v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int *begin;
  uint64_t v25;
  int *value;
  uint64_t i;
  int v28;
  int v29;
  std::vector<int>::pointer end;
  int *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int *v36;
  int v37;
  int *v38;
  void *v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t j;
  int v49;
  int v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  int v63;
  unsigned int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  Offset<siri::speech::schema_fb::BatchTranslationResponse> v69;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  unsigned int String;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  std::vector<int> v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  -[QSSBatchTranslationResponse request_id](self, "request_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  v75 = -[QSSBatchTranslationResponse return_code](self, "return_code");
  -[QSSBatchTranslationResponse return_string](self, "return_string");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v74 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSBatchTranslationResponse paragraph_id](self, "paragraph_id");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v73 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  -[QSSBatchTranslationResponse translated_text](self, "translated_text");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24E246F88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v20 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  memset(&v88, 0, sizeof(v88));
  -[QSSBatchTranslationResponse span](self, "span");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v88, objc_msgSend(v21, "count"));

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[QSSBatchTranslationResponse span](self, "span");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  v72 = v20;
  begin = v88.__begin_;
  if (v23)
  {
    v25 = *(_QWORD *)v85;
    value = v88.__end_cap_.__value_;
    v78 = v22;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v85 != v25)
          objc_enumerationMutation(v22);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v29 = v28;
        end = v88.__end_;
        if (v88.__end_ >= value)
        {
          v32 = v88.__end_ - begin;
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 62)
          {
            v88.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v33)
            v33 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v34 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v34 = v33;
          if (v34)
            v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v34);
          else
            v35 = 0;
          v36 = (int *)(v34 + 4 * v32);
          *v36 = v29;
          v31 = v36 + 1;
          while (end != begin)
          {
            v37 = *--end;
            *--v36 = v37;
          }
          value = (int *)(v34 + 4 * v35);
          v88.__end_ = v31;
          if (begin)
            operator delete(begin);
          begin = v36;
          v22 = v78;
        }
        else
        {
          *v88.__end_ = v28;
          v31 = end + 1;
        }
        v88.__end_ = v31;
      }
      v88.__end_cap_.__value_ = value;
      v88.__begin_ = begin;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    }
    while (v23);
  }
  else
  {
    v31 = v88.__end_;
  }

  if (v31 == begin)
    v38 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedSpan>> const&)::t;
  else
    v38 = begin;
  v71 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v38, v31 - begin);
  -[QSSBatchTranslationResponse translated_sentences](self, "translated_sentences");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");
  if (v40)
  {
    if (v40 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v40);
    v43 = &v41[4 * v42];
  }
  else
  {
    v41 = 0;
    v43 = 0;
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[QSSBatchTranslationResponse translated_sentences](self, "translated_sentences");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v81;
    v47 = v41;
    v79 = v44;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v81 != v46)
          objc_enumerationMutation(v44);
        v49 = objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v50 = v49;
        if (v47 >= v43)
        {
          v51 = (v47 - v41) >> 2;
          v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v43 - v41) >> 1 > v52)
            v52 = (v43 - v41) >> 1;
          if ((unint64_t)(v43 - v41) >= 0x7FFFFFFFFFFFFFFCLL)
            v53 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v53 = v52;
          if (v53)
            v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v53);
          else
            v54 = 0;
          v55 = (char *)(v53 + 4 * v51);
          *(_DWORD *)v55 = v50;
          v56 = v55 + 4;
          while (v47 != v41)
          {
            v57 = *((_DWORD *)v47 - 1);
            v47 -= 4;
            *((_DWORD *)v55 - 1) = v57;
            v55 -= 4;
          }
          v43 = (char *)(v53 + 4 * v54);
          if (v41)
            operator delete(v41);
          v41 = v55;
          v47 = v56;
          v44 = v79;
        }
        else
        {
          *(_DWORD *)v47 = v49;
          v47 += 4;
        }
      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v45);
  }
  else
  {
    v47 = v41;
  }

  v58 = v47 - v41;
  if (v47 == v41)
    v59 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>> const&)::t;
  else
    v59 = v41;
  v60 = v58 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v58 >> 2, 4uLL);
  if (v41 == v47)
  {
    LODWORD(v60) = 0;
  }
  else
  {
    v61 = v59 - 4;
    v62 = v60;
    do
    {
      v63 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v61[4 * v62]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v63);
      --v62;
    }
    while (v62);
  }
  v64 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v60);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v65 = *((_DWORD *)a3 + 8);
  v66 = *((_DWORD *)a3 + 12);
  v67 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v74);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v73);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v72);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v71);
  if (v64)
  {
    v68 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v64);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v68);
  }
  v69.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v65 - v66 + v67);
  if (v41)
    operator delete(v41);
  if (v88.__begin_)
    operator delete(v88.__begin_);
  return v69;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BatchTranslationResponse> v2;
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
  v2.var0 = -[QSSBatchTranslationResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__QSSBatchTranslationResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__43__QSSBatchTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__62__QSSBatchTranslationResponse_TranslatedSentence_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__61__QSSBatchTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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
