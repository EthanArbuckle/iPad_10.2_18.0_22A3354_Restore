@implementation QSSPronGuessResponse

- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSPronGuessResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSPronGuessResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4
{
  return -[QSSPronGuessResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSPronGuessResponse *v10;
  QSSPronGuessResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::PronGuessResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSPronGuessResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSPronGuessResponse;
  v10 = -[QSSPronGuessResponse init](&v30, sel_init);
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
      a4 = (const PronGuessResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::PronGuessResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::PronGuessResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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
  const PronGuessResponse *root;
  const PronGuessResponse *v3;
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
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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

- (NSString)apg_id
{
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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

- (QSSVocToken)voc_token
{
  QSSVocToken *v3;
  QSSVocToken *v4;
  const PronGuessResponse *root;
  const PronGuessResponse *v6;
  uint64_t v7;
  const PronGuessResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_token"));
  v3 = (QSSVocToken *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSVocToken alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (v7 = *(unsigned __int16 *)v6[14].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSVocToken initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("voc_token"));
  }
  return v3;
}

- (NSArray)tts_pronunciations
{
  void *v3;
  const PronGuessResponse *root;
  const PronGuessResponse *v5;
  uint64_t v6;
  const PronGuessResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const PronGuessResponse *v10;
  uint64_t v11;
  QSSPronunciation *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tts_pronunciations"));
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
            v12 = -[QSSPronunciation initWithFlatbuffData:root:verify:]([QSSPronunciation alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tts_pronunciations"));
  }
  return (NSArray *)v3;
}

- (NSArray)human_readable_prons
{
  void *v3;
  const PronGuessResponse *root;
  const PronGuessResponse *v5;
  uint64_t v6;
  const PronGuessResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const PronGuessResponse *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("human_readable_prons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x13u)
    {
      v6 = *(unsigned __int16 *)v5[18].var0;
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
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("human_readable_prons"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::PronGuessResponse>)addObjectToBuffer:(void *)a3
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
  __CFString *v17;
  __CFString *v18;
  const char *v19;
  size_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t i;
  int v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  int v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  int v47;
  void *v48;
  uint64_t v49;
  int *begin;
  uint64_t v51;
  int *value;
  uint64_t j;
  const char *v54;
  size_t v55;
  int v56;
  int v57;
  std::vector<int>::pointer end;
  int *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  int *v64;
  int v65;
  int *v66;
  unsigned int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  Offset<siri::speech::schema_fb::PronGuessResponse> v73;
  unsigned int v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  unsigned int String;
  unsigned int v80;
  unsigned int v81;
  QSSPronGuessResponse *obj;
  id obja;
  flatbuffers::FlatBufferBuilder *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  std::vector<int> v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  -[QSSPronGuessResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSPronGuessResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24E246F88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v78 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  v77 = -[QSSPronGuessResponse error_code](self, "error_code");
  -[QSSPronGuessResponse error_str](self, "error_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_24E246F88;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v76 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  -[QSSPronGuessResponse apg_id](self, "apg_id");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_24E246F88;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v75 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v19, v20);

  -[QSSPronGuessResponse voc_token](self, "voc_token");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  -[QSSPronGuessResponse tts_pronunciations](self, "tts_pronunciations");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  v84 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v23)
  {
    if (v23 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v23);
    v26 = &v24[4 * v25];
  }
  else
  {
    v24 = 0;
    v26 = 0;
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[QSSPronGuessResponse tts_pronunciations](self, "tts_pronunciations");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  obj = self;
  if (v28)
  {
    v29 = *(_QWORD *)v91;
    v30 = v24;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v91 != v29)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "addObjectToBuffer:", v84);
        v33 = v32;
        if (v30 >= v26)
        {
          v34 = (v30 - v24) >> 2;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v26 - v24) >> 1 > v35)
            v35 = (v26 - v24) >> 1;
          if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFFCLL)
            v36 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v36 = v35;
          if (v36)
            v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v36);
          else
            v37 = 0;
          v38 = (char *)(v36 + 4 * v34);
          *(_DWORD *)v38 = v33;
          v39 = v38 + 4;
          while (v30 != v24)
          {
            v40 = *((_DWORD *)v30 - 1);
            v30 -= 4;
            *((_DWORD *)v38 - 1) = v40;
            v38 -= 4;
          }
          v26 = (char *)(v36 + 4 * v37);
          if (v24)
            operator delete(v24);
          v24 = v38;
          v30 = v39;
        }
        else
        {
          *(_DWORD *)v30 = v32;
          v30 += 4;
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v28);
  }
  else
  {
    v30 = v24;
  }

  v41 = (unint64_t)v84;
  v42 = v30 - v24;
  if (v30 == v24)
    v43 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Pronunciation>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Pronunciation>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Pronunciation>> const&)::t;
  else
    v43 = v24;
  v44 = v42 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v84, v42 >> 2, 4uLL);
  if (v24 == v30)
  {
    LODWORD(v44) = 0;
  }
  else
  {
    v45 = v43 - 4;
    v46 = v44;
    do
    {
      v47 = flatbuffers::FlatBufferBuilder::ReferTo(v84, *(_DWORD *)&v45[4 * v46]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v84, v47);
      --v46;
    }
    while (v46);
  }
  v80 = flatbuffers::FlatBufferBuilder::EndVector(v84, v44);
  memset(&v89, 0, sizeof(v89));
  -[QSSPronGuessResponse human_readable_prons](obj, "human_readable_prons");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v89, objc_msgSend(v48, "count"));

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[QSSPronGuessResponse human_readable_prons](obj, "human_readable_prons");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  begin = v89.__begin_;
  if (v49)
  {
    v51 = *(_QWORD *)v86;
    value = v89.__end_cap_.__value_;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v86 != v51)
          objc_enumerationMutation(obja);
        v54 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j)), "UTF8String");
        v55 = strlen(v54);
        v56 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)v41, v54, v55);
        v57 = v56;
        end = v89.__end_;
        if (v89.__end_ >= value)
        {
          v60 = v89.__end_ - begin;
          v61 = v60 + 1;
          if ((unint64_t)(v60 + 1) >> 62)
          {
            v89.__end_cap_.__value_ = value;
            v89.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v61)
            v61 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v62 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v62 = v61;
          if (v62)
            v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v62);
          else
            v63 = 0;
          v64 = (int *)(v62 + 4 * v60);
          *v64 = v57;
          v59 = v64 + 1;
          while (end != begin)
          {
            v65 = *--end;
            *--v64 = v65;
          }
          value = (int *)(v62 + 4 * v63);
          v89.__end_ = v59;
          if (begin)
            operator delete(begin);
          begin = v64;
          v41 = (unint64_t)v84;
        }
        else
        {
          *v89.__end_ = v56;
          v59 = end + 1;
        }
        v89.__end_ = v59;
      }
      v89.__end_cap_.__value_ = value;
      v89.__begin_ = begin;
      v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v49);
  }
  else
  {
    v59 = v89.__end_;
  }

  if (v59 == begin)
    v66 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v66 = begin;
  v67 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)v41, (uint64_t)v66, v59 - begin);
  flatbuffers::FlatBufferBuilder::NotNested(v41);
  *(_BYTE *)(v41 + 70) = 1;
  v68 = *(_DWORD *)(v41 + 32);
  v69 = *(_DWORD *)(v41 + 48);
  v70 = *(_DWORD *)(v41 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 6, v78);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v41, 8, v77);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 10, v76);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 12, v75);
  if (v81)
  {
    v71 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v41, v81);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v41, 14, v71);
  }
  if (v80)
  {
    v72 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v41, v80);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v41, 16, v72);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v41, 18, v67);
  v73.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v41, v68 - v69 + v70);
  if (begin)
  {
    v89.__end_ = begin;
    operator delete(begin);
  }
  if (v24)
    operator delete(v24);
  return v73;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::PronGuessResponse> v2;
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
  v2.var0 = -[QSSPronGuessResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__QSSPronGuessResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__36__QSSPronGuessResponse_flatbuffData__block_invoke(uint64_t a1)
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
