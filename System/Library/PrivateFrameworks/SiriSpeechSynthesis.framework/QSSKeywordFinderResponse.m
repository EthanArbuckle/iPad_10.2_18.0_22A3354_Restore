@implementation QSSKeywordFinderResponse

- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSKeywordFinderResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSKeywordFinderResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3 root:(const KeywordFinderResponse *)a4
{
  return -[QSSKeywordFinderResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSKeywordFinderResponse)initWithFlatbuffData:(id)a3 root:(const KeywordFinderResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSKeywordFinderResponse *v10;
  QSSKeywordFinderResponse *v11;
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
  unsigned int v31;
  const unsigned __int8 *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  _DWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableDictionary *storage;
  QSSKeywordFinderResponse *v40;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;
  char v46;
  objc_super v47;

  v5 = a5;
  v9 = a3;
  v47.receiver = self;
  v47.super_class = (Class)QSSKeywordFinderResponse;
  v10 = -[QSSKeywordFinderResponse init](&v47, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_57;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_58;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const KeywordFinderResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_56;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_58;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v42 = v18;
  v43 = v19;
  v44 = xmmword_21E34D540;
  v45 = 0;
  v46 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_56;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v42, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 4u))
  {
    goto LABEL_58;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 6u))
  {
    goto LABEL_58;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 8u))
  {
    goto LABEL_58;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (v28 = v27[4]) != 0)
    v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  else
    v29 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v29))
    goto LABEL_58;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v43 < 5 || v43 - 4 < (unint64_t)root + v30[5] - v42))
    goto LABEL_58;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xCu))
    goto LABEL_58;
  v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v42, v32))
    goto LABEL_58;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0xEu))
    goto LABEL_58;
  v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0xFu)
  {
    v34 = v33[7];
    if (v34)
    {
      if (!siri::speech::schema_fb::RecognitionSausage::Verify((flatbuffers::Table *)((char *)root + v34 + *(unsigned int *)((char *)root + v34)), (flatbuffers::Verifier *)&v42))goto LABEL_58;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v42, 0x10u))
    goto LABEL_58;
  v35 = 0;
  v36 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v36) < 0x11u)
    goto LABEL_55;
  if (*(_WORD *)((char *)root - v36 + 16))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v42, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v36 + 16)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v36 + 16)), 4uLL, 0))
    {
      v35 = 0;
      v36 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v36) < 0x11u)
        goto LABEL_55;
      goto LABEL_51;
    }
LABEL_58:
    v40 = 0;
    goto LABEL_59;
  }
LABEL_51:
  v37 = *(unsigned __int16 *)((char *)root - v36 + 16);
  if (v37)
    v35 = (_DWORD *)((char *)root + v37 + *(unsigned int *)((char *)root + v37));
  else
    v35 = 0;
LABEL_55:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionChoice>((flatbuffers::Verifier *)&v42, v35))goto LABEL_58;
LABEL_56:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v42);
  v38 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v38;

LABEL_57:
  v40 = v11;
LABEL_59:

  return v40;
}

- (NSString)speech_id
{
  const KeywordFinderResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderResponse *v6;

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
  const KeywordFinderResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderResponse *v6;

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
  const KeywordFinderResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderResponse *v6;

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

- (int)return_code
{
  const KeywordFinderResponse *root;
  const KeywordFinderResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const KeywordFinderResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderResponse *v6;

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

- (QSSRecognitionSausage)corrected_sausage
{
  QSSRecognitionSausage *v3;
  QSSRecognitionSausage *v4;
  const KeywordFinderResponse *root;
  const KeywordFinderResponse *v6;
  uint64_t v7;
  const KeywordFinderResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("corrected_sausage"));
  v3 = (QSSRecognitionSausage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (v7 = *(unsigned __int16 *)v6[14].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("corrected_sausage"));
  }
  return v3;
}

- (NSArray)n_best_list
{
  void *v3;
  const KeywordFinderResponse *root;
  const KeywordFinderResponse *v5;
  uint64_t v6;
  const KeywordFinderResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const KeywordFinderResponse *v10;
  uint64_t v11;
  QSSRecognitionChoice *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_list"));
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
            v12 = -[QSSRecognitionChoice initWithFlatbuffData:root:verify:]([QSSRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_list"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::KeywordFinderResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  unsigned int String;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  size_t v12;
  unsigned int v13;
  __CFString *v14;
  __CFString *v15;
  const char *v16;
  size_t v17;
  __CFString *v18;
  __CFString *v19;
  const char *v20;
  size_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int *begin;
  uint64_t v29;
  int *value;
  uint64_t i;
  int v32;
  int v33;
  std::vector<int>::pointer end;
  int *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int *v40;
  int v41;
  int *v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  Offset<siri::speech::schema_fb::KeywordFinderResponse> v47;
  unint64_t v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  std::vector<int> v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  -[QSSKeywordFinderResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSKeywordFinderResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24E246F88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v13 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  -[QSSKeywordFinderResponse language](self, "language");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    v14 = &stru_24E246F88;
  v16 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
  v17 = strlen(v16);
  v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  v52 = -[QSSKeywordFinderResponse return_code](self, "return_code");
  -[QSSKeywordFinderResponse return_str](self, "return_str");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v18 = &stru_24E246F88;
  v20 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
  v21 = strlen(v20);
  v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);

  -[QSSKeywordFinderResponse corrected_sausage](self, "corrected_sausage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "addObjectToBuffer:", a3);

  memset(&v59, 0, sizeof(v59));
  -[QSSKeywordFinderResponse n_best_list](self, "n_best_list");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v59, objc_msgSend(v24, "count"));

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[QSSKeywordFinderResponse n_best_list](self, "n_best_list");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = a3;
  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  v49 = __PAIR64__(v13, v23);
  v50 = String;
  begin = v59.__begin_;
  if (v27)
  {
    v29 = *(_QWORD *)v56;
    value = v59.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v56 != v29)
          objc_enumerationMutation(v25);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "addObjectToBuffer:", v26, v49);
        v33 = v32;
        end = v59.__end_;
        if (v59.__end_ >= value)
        {
          v36 = v59.__end_ - begin;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
          {
            v59.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v37)
            v37 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v38 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v38 = v37;
          if (v38)
            v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v38);
          else
            v39 = 0;
          v40 = (int *)(v38 + 4 * v36);
          *v40 = v33;
          v35 = v40 + 1;
          while (end != begin)
          {
            v41 = *--end;
            *--v40 = v41;
          }
          value = (int *)(v38 + 4 * v39);
          v59.__end_ = v35;
          if (begin)
            operator delete(begin);
          begin = v40;
          v26 = a3;
        }
        else
        {
          *v59.__end_ = v32;
          v35 = end + 1;
        }
        v59.__end_ = v35;
      }
      v59.__end_cap_.__value_ = value;
      v59.__begin_ = begin;
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v27);
  }
  else
  {
    v35 = v59.__end_;
  }

  if (v35 == begin)
    v42 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v42 = begin;
  v43 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v42, v35 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v44 = *((_DWORD *)a3 + 8);
  v45 = *((_DWORD *)a3 + 12);
  v46 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, HIDWORD(v49));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v53);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v52);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v43);
  v47.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v44 - v45 + v46);
  if (begin)
  {
    v59.__end_ = begin;
    operator delete(begin);
  }
  return v47;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::KeywordFinderResponse> v2;
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
  v2.var0 = -[QSSKeywordFinderResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__QSSKeywordFinderResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__40__QSSKeywordFinderResponse_flatbuffData__block_invoke(uint64_t a1)
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
