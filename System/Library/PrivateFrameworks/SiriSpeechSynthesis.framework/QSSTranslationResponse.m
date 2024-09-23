@implementation QSSTranslationResponse

- (QSSTranslationResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4
{
  return -[QSSTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTranslationResponse *v10;
  QSSTranslationResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TranslationResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTranslationResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationResponse;
  v10 = -[QSSTranslationResponse init](&v30, sel_init);
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
      a4 = (const TranslationResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TranslationResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (int)return_code
{
  const TranslationResponse *root;
  const TranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_string
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (NSArray)n_best_translated_phrases
{
  void *v3;
  const TranslationResponse *root;
  const TranslationResponse *v5;
  uint64_t v6;
  const TranslationResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const TranslationResponse *v10;
  uint64_t v11;
  QSSTranslationResponse_TranslationPhrase *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
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
            v12 = -[QSSTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([QSSTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_translated_phrases"));
  }
  return (NSArray *)v3;
}

- (NSString)engine_input
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (NSArray)engine_output
{
  void *v3;
  const TranslationResponse *root;
  const TranslationResponse *v5;
  uint64_t v6;
  const TranslationResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const TranslationResponse *v10;
  uint64_t v11;
  QSSTranslationResponse_TranslationPhrase *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("engine_output"));
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
            v12 = -[QSSTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([QSSTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("engine_output"));
  }
  return (NSArray *)v3;
}

- (NSString)sequence_id
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (BOOL)final_message
{
  const TranslationResponse *root;
  const TranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TranslationResponse>)addObjectToBuffer:(void *)a3
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
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int *begin;
  uint64_t v21;
  int *value;
  uint64_t i;
  int v24;
  int v25;
  std::vector<int>::pointer end;
  int *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int *v32;
  int v33;
  int *v34;
  __CFString *v35;
  __CFString *v36;
  const char *v37;
  size_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  int *v44;
  uint64_t j;
  int v46;
  int v47;
  std::vector<int>::pointer v48;
  int *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  int *v54;
  int v55;
  int *v56;
  unsigned int v57;
  __CFString *v58;
  __CFString *v59;
  const char *v60;
  size_t v61;
  unsigned int v62;
  int v63;
  int v64;
  int v65;
  Offset<siri::speech::schema_fb::TranslationResponse> v66;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  unsigned int String;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  std::vector<int> v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  std::vector<int> v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  -[QSSTranslationResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSTranslationResponse request_id](self, "request_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v72 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  v71 = -[QSSTranslationResponse return_code](self, "return_code");
  -[QSSTranslationResponse return_string](self, "return_string");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v16 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  memset(&v86, 0, sizeof(v86));
  -[QSSTranslationResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v86, objc_msgSend(v17, "count"));

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[QSSTranslationResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  v70 = v16;
  begin = v86.__begin_;
  if (v19)
  {
    v21 = *(_QWORD *)v83;
    value = v86.__end_cap_.__value_;
    v75 = v18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v83 != v21)
          objc_enumerationMutation(v18);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v25 = v24;
        end = v86.__end_;
        if (v86.__end_ >= value)
        {
          v28 = v86.__end_ - begin;
          v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 62)
          {
            v86.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v29)
            v29 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v30 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v30 = v29;
          if (v30)
            v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v30);
          else
            v31 = 0;
          v32 = (int *)(v30 + 4 * v28);
          *v32 = v25;
          v27 = v32 + 1;
          while (end != begin)
          {
            v33 = *--end;
            *--v32 = v33;
          }
          value = (int *)(v30 + 4 * v31);
          v86.__end_ = v27;
          if (begin)
            operator delete(begin);
          begin = v32;
          v18 = v75;
        }
        else
        {
          *v86.__end_ = v24;
          v27 = end + 1;
        }
        v86.__end_ = v27;
      }
      v86.__end_cap_.__value_ = value;
      v86.__begin_ = begin;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v19);
  }
  else
  {
    v27 = v86.__end_;
  }

  if (v27 == begin)
    v34 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  else
    v34 = begin;
  v69 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v34, v27 - begin);
  -[QSSTranslationResponse engine_input](self, "engine_input");
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
    v35 = &stru_24E246F88;
  v37 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v35), "UTF8String");
  v38 = strlen(v37);
  v68 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v37, v38);

  memset(&v81, 0, sizeof(v81));
  -[QSSTranslationResponse engine_output](self, "engine_output");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v81, objc_msgSend(v39, "count"));

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[QSSTranslationResponse engine_output](self, "engine_output");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
  v42 = v81.__begin_;
  if (v41)
  {
    v43 = *(_QWORD *)v78;
    v44 = v81.__end_cap_.__value_;
    v76 = v40;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v78 != v43)
          objc_enumerationMutation(v40);
        v46 = objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v47 = v46;
        v48 = v81.__end_;
        if (v81.__end_ >= v44)
        {
          v50 = v81.__end_ - v42;
          v51 = v50 + 1;
          if ((unint64_t)(v50 + 1) >> 62)
          {
            v81.__begin_ = v42;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v44 - (char *)v42) >> 1 > v51)
            v51 = ((char *)v44 - (char *)v42) >> 1;
          if ((unint64_t)((char *)v44 - (char *)v42) >= 0x7FFFFFFFFFFFFFFCLL)
            v52 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v52 = v51;
          if (v52)
            v52 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v52);
          else
            v53 = 0;
          v54 = (int *)(v52 + 4 * v50);
          *v54 = v47;
          v49 = v54 + 1;
          while (v48 != v42)
          {
            v55 = *--v48;
            *--v54 = v55;
          }
          v44 = (int *)(v52 + 4 * v53);
          v81.__end_ = v49;
          if (v42)
            operator delete(v42);
          v42 = v54;
          v40 = v76;
        }
        else
        {
          *v81.__end_ = v46;
          v49 = v48 + 1;
        }
        v81.__end_ = v49;
      }
      v81.__end_cap_.__value_ = v44;
      v81.__begin_ = v42;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    }
    while (v41);
  }
  else
  {
    v49 = v81.__end_;
  }

  if (v49 == v42)
    v56 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  else
    v56 = v42;
  v57 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v56, v49 - v42);
  -[QSSTranslationResponse sequence_id](self, "sequence_id");
  v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v58)
    v58 = &stru_24E246F88;
  v60 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v58), "UTF8String");
  v61 = strlen(v60);
  v62 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v60, v61);

  LODWORD(v60) = -[QSSTranslationResponse final_message](self, "final_message");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v63 = *((_DWORD *)a3 + 8);
  v64 = *((_DWORD *)a3 + 12);
  v65 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v72);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v71);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v69);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v57);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v62);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 20, (int)v60);
  v66.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v63 - v64 + v65);
  if (v42)
  {
    v81.__end_ = v42;
    operator delete(v42);
  }
  if (v86.__begin_)
    operator delete(v86.__begin_);
  return v66;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TranslationResponse> v2;
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
  v2.var0 = -[QSSTranslationResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__QSSTranslationResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__38__QSSTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__56__QSSTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__55__QSSTranslationResponse_TranslationToken_flatbuffData__block_invoke(uint64_t a1)
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
