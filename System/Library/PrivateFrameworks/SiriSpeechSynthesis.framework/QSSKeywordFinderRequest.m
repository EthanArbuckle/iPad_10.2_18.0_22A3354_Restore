@implementation QSSKeywordFinderRequest

- (QSSKeywordFinderRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSKeywordFinderRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSKeywordFinderRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSKeywordFinderRequest)initWithFlatbuffData:(id)a3 root:(const KeywordFinderRequest *)a4
{
  return -[QSSKeywordFinderRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSKeywordFinderRequest)initWithFlatbuffData:(id)a3 root:(const KeywordFinderRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSKeywordFinderRequest *v10;
  QSSKeywordFinderRequest *v11;
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
  _DWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableDictionary *storage;
  QSSKeywordFinderRequest *v39;
  uint64_t v41;
  unint64_t v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  objc_super v46;

  v5 = a5;
  v9 = a3;
  v46.receiver = self;
  v46.super_class = (Class)QSSKeywordFinderRequest;
  v10 = -[QSSKeywordFinderRequest init](&v46, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_53;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_54;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const KeywordFinderRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_52;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_54;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v41 = v18;
  v42 = v19;
  v43 = xmmword_21E34D540;
  v44 = 0;
  v45 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_52;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v41, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v41, 4u))
  {
    goto LABEL_54;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v41, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v41, 6u))
  {
    goto LABEL_54;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v41, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v41, 8u))
  {
    goto LABEL_54;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (v28 = v27[4]) != 0)
    v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  else
    v29 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v41, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v41, 0xAu))
  {
    goto LABEL_54;
  }
  v30 = 0;
  v31 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v31) >= 0xBu)
  {
    if (!*(_WORD *)((char *)root - v31 + 10))
      goto LABEL_37;
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v41, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v31 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v31 + 10)), 4uLL, 0))goto LABEL_54;
    v30 = 0;
    v31 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v31) >= 0xBu)
    {
LABEL_37:
      v32 = *(unsigned __int16 *)((char *)root - v31 + 10);
      if (v32)
        v30 = (_DWORD *)((char *)root + v32 + *(unsigned int *)((char *)root + v32));
      else
        v30 = 0;
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>((flatbuffers::Verifier *)&v41, v30)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v41, 0xCu))
  {
    goto LABEL_54;
  }
  v33 = *(int *)root;
  v34 = *(unsigned __int16 *)((char *)root - v33);
  if (v34 >= 0xD)
  {
    if (*(_WORD *)((char *)root - v33 + 12))
    {
      if (!siri::speech::schema_fb::RecognitionResult::Verify((flatbuffers::Table *)((char *)root+ *(unsigned __int16 *)((char *)root - v33 + 12)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v33 + 12))), (flatbuffers::Verifier *)&v41))goto LABEL_54;
      v35 = *(int *)root;
      v36 = -v35;
      v34 = *(unsigned __int16 *)((char *)root - v35);
    }
    else
    {
      v36 = -v33;
    }
    if (v34 < 0xF
      || !*(_WORD *)((char *)root + v36 + 14)
      || v42 >= 2 && v42 - 1 >= (unint64_t)root + *(unsigned __int16 *)((char *)root + v36 + 14) - v41)
    {
      goto LABEL_52;
    }
LABEL_54:
    v39 = 0;
    goto LABEL_55;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v41);
  v37 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v37;

LABEL_53:
  v39 = v11;
LABEL_55:

  return v39;
}

- (NSString)speech_id
{
  const KeywordFinderRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderRequest *v6;

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
  const KeywordFinderRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderRequest *v6;

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
  const KeywordFinderRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const KeywordFinderRequest *v6;

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

- (NSArray)keywords
{
  void *v3;
  const KeywordFinderRequest *root;
  const KeywordFinderRequest *v5;
  uint64_t v6;
  const KeywordFinderRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const KeywordFinderRequest *v10;
  uint64_t v11;
  QSSKeyword *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("keywords"));
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
            v12 = -[QSSKeyword initWithFlatbuffData:root:verify:]([QSSKeyword alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("keywords"));
  }
  return (NSArray *)v3;
}

- (QSSRecognitionResult)recognition_result
{
  QSSRecognitionResult *v3;
  QSSRecognitionResult *v4;
  const KeywordFinderRequest *root;
  const KeywordFinderRequest *v6;
  uint64_t v7;
  const KeywordFinderRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recognition_result"));
  v3 = (QSSRecognitionResult *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSRecognitionResult alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSRecognitionResult initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("recognition_result"));
  }
  return v3;
}

- (BOOL)enable_sanitization
{
  const KeywordFinderRequest *root;
  const KeywordFinderRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::KeywordFinderRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  size_t v12;
  __CFString *v13;
  __CFString *v14;
  const char *v15;
  size_t v16;
  void *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t i;
  int v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  int v35;
  uint64_t v36;
  flatbuffers::FlatBufferBuilder *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  Offset<siri::speech::schema_fb::KeywordFinderRequest> v51;
  unsigned int v53;
  unsigned int v54;
  unsigned int String;
  QSSKeywordFinderRequest *v56;
  flatbuffers::FlatBufferBuilder *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[QSSKeywordFinderRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSKeywordFinderRequest session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v56 = self;
  if (!v9)
    v9 = &stru_24E246F88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v54 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  -[QSSKeywordFinderRequest language](v56, "language");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_24E246F88;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  -[QSSKeywordFinderRequest keywords](v56, "keywords");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
    if (v18 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
    v21 = &v19[4 * v20];
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[QSSKeywordFinderRequest keywords](v56, "keywords");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  v57 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v23)
  {
    v24 = *(_QWORD *)v59;
    v25 = v19;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v59 != v24)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v28 = v27;
        if (v25 >= v21)
        {
          v29 = (v25 - v19) >> 2;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v21 - v19) >> 1 > v30)
            v30 = (v21 - v19) >> 1;
          if ((unint64_t)(v21 - v19) >= 0x7FFFFFFFFFFFFFFCLL)
            v31 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          if (v31)
            v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          else
            v32 = 0;
          v33 = (char *)(v31 + 4 * v29);
          *(_DWORD *)v33 = v28;
          v34 = v33 + 4;
          while (v25 != v19)
          {
            v35 = *((_DWORD *)v25 - 1);
            v25 -= 4;
            *((_DWORD *)v33 - 1) = v35;
            v33 -= 4;
          }
          v21 = (char *)(v31 + 4 * v32);
          if (v19)
            operator delete(v19);
          v19 = v33;
          v25 = v34;
          a3 = v57;
        }
        else
        {
          *(_DWORD *)v25 = v27;
          v25 += 4;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v23);
  }
  else
  {
    v25 = v19;
  }

  v36 = v25 - v19;
  v37 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v25 == v19)
    v38 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Keyword>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Keyword>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Keyword>> const&)::t;
  else
    v38 = v19;
  v39 = v36 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v37, v36 >> 2, 4uLL);
  if (v19 == v25)
  {
    LODWORD(v39) = 0;
  }
  else
  {
    v40 = v38 - 4;
    v41 = v39;
    do
    {
      v42 = flatbuffers::FlatBufferBuilder::ReferTo(v57, *(_DWORD *)&v40[4 * v41]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v57, v42);
      --v41;
    }
    while (v41);
  }
  v43 = flatbuffers::FlatBufferBuilder::EndVector(v57, v39);
  -[QSSKeywordFinderRequest recognition_result](v56, "recognition_result");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "addObjectToBuffer:", v57);

  v46 = -[QSSKeywordFinderRequest enable_sanitization](v56, "enable_sanitization");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v57);
  *((_BYTE *)v57 + 70) = 1;
  v47 = *((_DWORD *)v57 + 8);
  v48 = *((_DWORD *)v57 + 12);
  v49 = *((_DWORD *)v57 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 6, v54);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 8, v53);
  if (v43)
  {
    v50 = flatbuffers::FlatBufferBuilder::ReferTo(v57, v43);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v57, 10, v50);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 12, v45);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>(v57, 14, v46);
  v51.var0 = flatbuffers::FlatBufferBuilder::EndTable(v57, v47 - v48 + v49);
  if (v19)
    operator delete(v19);
  return v51;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::KeywordFinderRequest> v2;
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
  v2.var0 = -[QSSKeywordFinderRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__QSSKeywordFinderRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__39__QSSKeywordFinderRequest_flatbuffData__block_invoke(uint64_t a1)
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
