@implementation QSSStartSpeechTranslationRequest

- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4
{
  return -[QSSStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSStartSpeechTranslationRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechTranslationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSStartSpeechTranslationRequest *v10;
  QSSStartSpeechTranslationRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::StartSpeechTranslationRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSStartSpeechTranslationRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSStartSpeechTranslationRequest;
  v10 = -[QSSStartSpeechTranslationRequest init](&v30, sel_init);
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
      a4 = (const StartSpeechTranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::StartSpeechTranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)conversation_id
{
  const StartSpeechTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationRequest *v6;

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
  const StartSpeechTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationRequest *v6;

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

- (NSArray)translation_locale_pairs
{
  void *v3;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v5;
  uint64_t v6;
  const StartSpeechTranslationRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const StartSpeechTranslationRequest *v10;
  uint64_t v11;
  QSSTranslationLocalePair *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pairs"));
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
            v12 = -[QSSTranslationLocalePair initWithFlatbuffData:root:verify:]([QSSTranslationLocalePair alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_locale_pairs"));
  }
  return (NSArray *)v3;
}

- (QSSStartSpeechRequest)start_speech_request
{
  QSSStartSpeechRequest *v3;
  QSSStartSpeechRequest *v4;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("start_speech_request"));
  v3 = (QSSStartSpeechRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSStartSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("start_speech_request"));
  }
  return v3;
}

- (QSSTranslationRequest)translation_request
{
  QSSTranslationRequest *v3;
  QSSTranslationRequest *v4;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v6;
  uint64_t v7;
  const StartSpeechTranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_request"));
  v3 = (QSSTranslationRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTranslationRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTranslationRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_request"));
  }
  return v3;
}

- (NSArray)text_to_speech_requests
{
  void *v3;
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v5;
  uint64_t v6;
  const StartSpeechTranslationRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const StartSpeechTranslationRequest *v10;
  uint64_t v11;
  QSSTextToSpeechRequest *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text_to_speech_requests"));
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
            v12 = -[QSSTextToSpeechRequest initWithFlatbuffData:root:verify:]([QSSTextToSpeechRequest alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("text_to_speech_requests"));
  }
  return (NSArray *)v3;
}

- (BOOL)restricted_mode
{
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)app_id
{
  const StartSpeechTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const StartSpeechTranslationRequest *v6;

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

- (int64_t)opt_in_status
{
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (BOOL)streaming_mode
{
  const StartSpeechTranslationRequest *root;
  const StartSpeechTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x17u && (v4 = *(unsigned __int16 *)v3[22].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::StartSpeechTranslationRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t i;
  int v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int v31;
  QSSStartSpeechTranslationRequest *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t j;
  int v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  int v59;
  QSSStartSpeechTranslationRequest *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  int v68;
  __CFString *v69;
  __CFString *v70;
  const char *v71;
  size_t v72;
  unsigned int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  Offset<siri::speech::schema_fb::StartSpeechTranslationRequest> v81;
  unsigned int v83;
  unsigned int v84;
  unsigned int String;
  unsigned int v86;
  unsigned int v87;
  QSSStartSpeechTranslationRequest *v88;
  id obj;
  int obja;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  -[QSSStartSpeechTranslationRequest conversation_id](self, "conversation_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSStartSpeechTranslationRequest request_id](self, "request_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v84 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSStartSpeechTranslationRequest translation_locale_pairs](self, "translation_locale_pairs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = a3;
  v88 = self;
  if (v13)
  {
    if (v13 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v13);
    v17 = &v15[4 * v16];
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[QSSStartSpeechTranslationRequest translation_locale_pairs](v88, "translation_locale_pairs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v97;
    v21 = v15;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v97 != v20)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "addObjectToBuffer:", v14);
        v24 = v23;
        if (v21 >= v17)
        {
          v25 = (v21 - v15) >> 2;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v17 - v15) >> 1 > v26)
            v26 = (v17 - v15) >> 1;
          if ((unint64_t)(v17 - v15) >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v26;
          if (v27)
            v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          else
            v28 = 0;
          v29 = (char *)(v27 + 4 * v25);
          *(_DWORD *)v29 = v24;
          v30 = v29 + 4;
          while (v21 != v15)
          {
            v31 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v31;
            v29 -= 4;
          }
          v17 = (char *)(v27 + 4 * v28);
          if (v15)
            operator delete(v15);
          v15 = v29;
          v21 = v30;
          v14 = a3;
        }
        else
        {
          *(_DWORD *)v21 = v23;
          v21 += 4;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    }
    while (v19);
  }
  else
  {
    v21 = v15;
  }

  v32 = v88;
  v33 = v21 - v15;
  if (v21 == v15)
    v34 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TranslationLocalePair>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TranslationLocalePair>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TranslationLocalePair>> const&)::t;
  else
    v34 = v15;
  v35 = v33 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v33 >> 2, 4uLL);
  if (v15 == v21)
  {
    LODWORD(v35) = 0;
  }
  else
  {
    v36 = v34 - 4;
    v37 = v35;
    do
    {
      v38 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v36[4 * v37]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v38);
      --v37;
    }
    while (v37);
    v32 = v88;
  }
  v87 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v35);
  -[QSSStartSpeechTranslationRequest start_speech_request](v32, "start_speech_request");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v39, "addObjectToBuffer:", a3);

  -[QSSStartSpeechTranslationRequest translation_request](v32, "translation_request");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v40, "addObjectToBuffer:", a3);

  -[QSSStartSpeechTranslationRequest text_to_speech_requests](v32, "text_to_speech_requests");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");
  if (v42)
  {
    if (v42 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v42);
    v45 = &v43[4 * v44];
  }
  else
  {
    v43 = 0;
    v45 = 0;
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[QSSStartSpeechTranslationRequest text_to_speech_requests](v32, "text_to_speech_requests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = a3;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v93;
    v49 = v43;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v93 != v48)
          objc_enumerationMutation(obj);
        v51 = objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * j), "addObjectToBuffer:", v46);
        v52 = v51;
        if (v49 >= v45)
        {
          v53 = (v49 - v43) >> 2;
          v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v45 - v43) >> 1 > v54)
            v54 = (v45 - v43) >> 1;
          if ((unint64_t)(v45 - v43) >= 0x7FFFFFFFFFFFFFFCLL)
            v55 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v55 = v54;
          if (v55)
            v55 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v55);
          else
            v56 = 0;
          v57 = (char *)(v55 + 4 * v53);
          *(_DWORD *)v57 = v52;
          v58 = v57 + 4;
          while (v49 != v43)
          {
            v59 = *((_DWORD *)v49 - 1);
            v49 -= 4;
            *((_DWORD *)v57 - 1) = v59;
            v57 -= 4;
          }
          v45 = (char *)(v55 + 4 * v56);
          if (v43)
            operator delete(v43);
          v43 = v57;
          v49 = v58;
          v46 = a3;
        }
        else
        {
          *(_DWORD *)v49 = v51;
          v49 += 4;
        }
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
    }
    while (v47);
  }
  else
  {
    v49 = v43;
  }

  v60 = v88;
  v61 = v49 - v43;
  if (v49 == v43)
    v62 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest>> const&)::t;
  else
    v62 = v43;
  v63 = v61 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v61 >> 2, 4uLL);
  if (v43 == v49)
  {
    LODWORD(v63) = 0;
  }
  else
  {
    v64 = v62 - 4;
    v65 = v63;
    do
    {
      v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v64[4 * v65]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v66);
      --v65;
    }
    while (v65);
    v60 = v88;
  }
  v67 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v63);
  v68 = -[QSSStartSpeechTranslationRequest restricted_mode](v60, "restricted_mode");
  -[QSSStartSpeechTranslationRequest app_id](v60, "app_id");
  v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (!v69)
    v69 = &stru_24E246F88;
  v71 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v69), "UTF8String");
  v72 = strlen(v71);
  v73 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v71, v72);

  v74 = -[QSSStartSpeechTranslationRequest opt_in_status](v60, "opt_in_status");
  obja = -[QSSStartSpeechTranslationRequest streaming_mode](v60, "streaming_mode");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v75 = *((_DWORD *)a3 + 8);
  v76 = *((_DWORD *)a3 + 12);
  v77 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v84);
  if (v87)
  {
    v78 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v87);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v78);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v83);
  if (v86)
  {
    v79 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v86);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v79);
  }
  if (v67)
  {
    v80 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v67);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v80);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v73);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v74);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 22, obja);
  v81.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v75 - v76 + v77);
  if (v43)
    operator delete(v43);
  if (v15)
    operator delete(v15);
  return v81;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::StartSpeechTranslationRequest> v2;
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
  v2.var0 = -[QSSStartSpeechTranslationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__QSSStartSpeechTranslationRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__48__QSSStartSpeechTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
