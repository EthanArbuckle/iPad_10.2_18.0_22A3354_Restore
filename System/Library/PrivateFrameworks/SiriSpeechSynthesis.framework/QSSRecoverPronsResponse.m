@implementation QSSRecoverPronsResponse

- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSRecoverPronsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecoverPronsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4
{
  return -[QSSRecoverPronsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecoverPronsResponse *v10;
  QSSRecoverPronsResponse *v11;
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
  unsigned int v28;
  const unsigned __int8 *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *storage;
  QSSRecoverPronsResponse *v37;
  uint64_t v39;
  unint64_t v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  objc_super v44;

  v5 = a5;
  v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSRecoverPronsResponse;
  v10 = -[QSSRecoverPronsResponse init](&v44, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_51;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_52;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const RecoverPronsResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_50;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_52;
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
  if (!root)
    goto LABEL_50;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
  {
    goto LABEL_52;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
  {
    goto LABEL_52;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26))
    goto LABEL_52;
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  v28 = *v27;
  if (v28 >= 9 && v27[4] && (v40 < 5 || v40 - 4 < (unint64_t)root + v27[4] - v39))
    goto LABEL_52;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu))
    goto LABEL_52;
  v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29))
    goto LABEL_52;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xCu))
    goto LABEL_52;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v30 >= 0xDu)
  {
    v31 = v30[6];
    if (v31)
    {
      if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v39, (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31), 4uLL, 0))goto LABEL_52;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xEu))
    goto LABEL_52;
  v32 = 0;
  v33 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v33) < 0xFu)
    goto LABEL_49;
  if (*(_WORD *)((char *)root - v33 + 14))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v39, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v33 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v33 + 14)), 4uLL, 0))
    {
      v32 = 0;
      v33 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v33) < 0xFu)
        goto LABEL_49;
      goto LABEL_45;
    }
LABEL_52:
    v37 = 0;
    goto LABEL_53;
  }
LABEL_45:
  v34 = *(unsigned __int16 *)((char *)root - v33 + 14);
  if (v34)
    v32 = (_DWORD *)((char *)root + v34 + *(unsigned int *)((char *)root + v34));
  else
    v32 = 0;
LABEL_49:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::VocToken>((flatbuffers::Verifier *)&v39, v32))goto LABEL_52;
LABEL_50:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v39);
  v35 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v35;

LABEL_51:
  v37 = v11;
LABEL_53:

  return v37;
}

- (NSString)speech_id
{
  const RecoverPronsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsResponse *v6;

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
  const RecoverPronsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsResponse *v6;

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

- (int)error_code
{
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const RecoverPronsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsResponse *v6;

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

- (NSArray)recovery_return_codes
{
  void *v3;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v5;
  uint64_t v6;
  const RecoverPronsResponse *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recovery_return_codes"));
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
        var0 = (unsigned int *)v7[v8 + 4].var0;
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *var0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("recovery_return_codes"));
  }
  return (NSArray *)v3;
}

- (NSArray)voc_tokens
{
  void *v3;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v5;
  uint64_t v6;
  const RecoverPronsResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const RecoverPronsResponse *v10;
  uint64_t v11;
  QSSVocToken *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_tokens"));
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
            v12 = -[QSSVocToken initWithFlatbuffData:root:verify:]([QSSVocToken alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("voc_tokens"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::RecoverPronsResponse>)addObjectToBuffer:(void *)a3
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
  unint64_t v34;
  int *v35;
  unsigned int v36;
  void *v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t j;
  int v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  int v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  Offset<siri::speech::schema_fb::RecoverPronsResponse> v67;
  unsigned int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  unsigned int String;
  flatbuffers::FlatBufferBuilder *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  std::vector<int> v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  -[QSSRecoverPronsResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v75 = (flatbuffers::FlatBufferBuilder *)a3;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSRecoverPronsResponse session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v72 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  v71 = -[QSSRecoverPronsResponse error_code](self, "error_code");
  -[QSSRecoverPronsResponse error_str](self, "error_str");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v16 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  memset(&v84, 0, sizeof(v84));
  -[QSSRecoverPronsResponse recovery_return_codes](self, "recovery_return_codes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v84, objc_msgSend(v17, "count"));

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[QSSRecoverPronsResponse recovery_return_codes](self, "recovery_return_codes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  v70 = v16;
  begin = v84.__begin_;
  if (v19)
  {
    v21 = *(_QWORD *)v81;
    value = v84.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v81 != v21)
          objc_enumerationMutation(v18);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "intValue");
        v25 = v24;
        end = v84.__end_;
        if (v84.__end_ >= value)
        {
          v28 = v84.__end_ - begin;
          v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 62)
          {
            v84.__begin_ = begin;
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
          v84.__end_ = v27;
          if (begin)
            operator delete(begin);
          begin = v32;
        }
        else
        {
          *v84.__end_ = v24;
          v27 = end + 1;
        }
        v84.__end_ = v27;
      }
      v84.__end_cap_.__value_ = value;
      v84.__begin_ = begin;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
    }
    while (v19);
  }
  else
  {
    v27 = v84.__end_;
  }

  v34 = (unint64_t)v75;
  if (v27 == begin)
    v35 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  else
    v35 = begin;
  v36 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v75, v35, v27 - begin);
  -[QSSRecoverPronsResponse voc_tokens](self, "voc_tokens");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");
  v69 = v36;
  if (v38)
  {
    if (v38 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v38);
    v41 = &v39[4 * v40];
  }
  else
  {
    v39 = 0;
    v41 = 0;
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[QSSRecoverPronsResponse voc_tokens](self, "voc_tokens");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v77;
    v45 = v39;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v77 != v44)
          objc_enumerationMutation(v42);
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "addObjectToBuffer:", v34);
        v48 = v47;
        if (v45 >= v41)
        {
          v49 = (v45 - v39) >> 2;
          v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v41 - v39) >> 1 > v50)
            v50 = (v41 - v39) >> 1;
          if ((unint64_t)(v41 - v39) >= 0x7FFFFFFFFFFFFFFCLL)
            v51 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v51 = v50;
          if (v51)
            v51 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v51);
          else
            v52 = 0;
          v53 = (char *)(v51 + 4 * v49);
          *(_DWORD *)v53 = v48;
          v54 = v53 + 4;
          while (v45 != v39)
          {
            v55 = *((_DWORD *)v45 - 1);
            v45 -= 4;
            *((_DWORD *)v53 - 1) = v55;
            v53 -= 4;
          }
          v41 = (char *)(v51 + 4 * v52);
          if (v39)
            operator delete(v39);
          v39 = v53;
          v45 = v54;
          v34 = (unint64_t)v75;
        }
        else
        {
          *(_DWORD *)v45 = v47;
          v45 += 4;
        }
      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v43);
  }
  else
  {
    v45 = v39;
  }

  v56 = v45 - v39;
  if (v45 == v39)
    v57 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::VocToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::VocToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::VocToken>> const&)::t;
  else
    v57 = v39;
  v58 = v56 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)v34, v56 >> 2, 4uLL);
  if (v39 == v45)
  {
    LODWORD(v58) = 0;
  }
  else
  {
    v59 = v57 - 4;
    v60 = v58;
    do
    {
      v61 = flatbuffers::FlatBufferBuilder::ReferTo(v75, *(_DWORD *)&v59[4 * v60]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v75, v61);
      --v60;
    }
    while (v60);
    v34 = (unint64_t)v75;
  }
  v62 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)v34, v58);
  flatbuffers::FlatBufferBuilder::NotNested(v34);
  *(_BYTE *)(v34 + 70) = 1;
  v63 = *(_DWORD *)(v34 + 32);
  v64 = *(_DWORD *)(v34 + 48);
  v65 = *(_DWORD *)(v34 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 6, v72);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v34, 8, v71);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 10, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v34, 12, v69);
  if (v62)
  {
    v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v34, v62);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v34, 14, v66);
  }
  v67.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v34, v63 - v64 + v65);
  if (v39)
    operator delete(v39);
  if (v84.__begin_)
    operator delete(v84.__begin_);
  return v67;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RecoverPronsResponse> v2;
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
  v2.var0 = -[QSSRecoverPronsResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__QSSRecoverPronsResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__39__QSSRecoverPronsResponse_flatbuffData__block_invoke(uint64_t a1)
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
