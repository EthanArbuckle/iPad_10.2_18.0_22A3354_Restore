@implementation QSSTranslationRequest

- (QSSTranslationRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4
{
  return -[QSSTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTranslationRequest *v10;
  QSSTranslationRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TranslationRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTranslationRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTranslationRequest;
  v10 = -[QSSTranslationRequest init](&v30, sel_init);
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
      a4 = (const TranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)task
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)source_language
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)target_language
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSArray)translation_phrase
{
  void *v3;
  const TranslationRequest *root;
  const TranslationRequest *v5;
  uint64_t v6;
  const TranslationRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const TranslationRequest *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
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
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_phrase"));
  }
  return (NSArray *)v3;
}

- (QSSSiriTranslationInfo)siri_translation_info
{
  QSSSiriTranslationInfo *v3;
  QSSSiriTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("siri_translation_info"));
  v3 = (QSSSiriTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSSiriTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (v7 = *(unsigned __int16 *)v6[16].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSSiriTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("siri_translation_info"));
  }
  return v3;
}

- (QSSSpeechTranslationInfo)speech_translation_info
{
  QSSSpeechTranslationInfo *v3;
  QSSSpeechTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_translation_info"));
  v3 = (QSSSpeechTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSSpeechTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (v7 = *(unsigned __int16 *)v6[18].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSSpeechTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("speech_translation_info"));
  }
  return v3;
}

- (QSSSiriPayloadTranslationInfo)siri_payload_translation_info
{
  QSSSiriPayloadTranslationInfo *v3;
  QSSSiriPayloadTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("siri_payload_translation_info"));
  v3 = (QSSSiriPayloadTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSSiriPayloadTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSSiriPayloadTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("siri_payload_translation_info"));
  }
  return v3;
}

- (NSString)sequence_id
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
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

- (QSSWebTranslationInfo)web_translation_info
{
  QSSWebTranslationInfo *v3;
  QSSWebTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("web_translation_info"));
  v3 = (QSSWebTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSWebTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSWebTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("web_translation_info"));
  }
  return v3;
}

- (BOOL)disable_log
{
  const TranslationRequest *root;
  const TranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Bu && (v4 = *(unsigned __int16 *)v3[26].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)opt_in_status
{
  const TranslationRequest *root;
  const TranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x1Du && (v4 = *(unsigned __int16 *)v3[28].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (NSString)app_id
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 30].var0;
  if (*(_WORD *)root[-v3 + 30].var0)
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

- (NSString)use_case
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 32].var0;
  if (*(_WORD *)root[-v3 + 32].var0)
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

- (Offset<siri::speech::schema_fb::TranslationRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v3;
  __CFString *v4;
  const char *v5;
  size_t v6;
  __CFString *v7;
  __CFString *v8;
  const char *v9;
  size_t v10;
  __CFString *v11;
  __CFString *v12;
  const char *v13;
  size_t v14;
  __CFString *v15;
  __CFString *v16;
  const char *v17;
  size_t v18;
  __CFString *v19;
  __CFString *v20;
  const char *v21;
  size_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int *begin;
  uint64_t v28;
  int *value;
  uint64_t i;
  const char *v31;
  size_t v32;
  int v33;
  int v34;
  std::vector<int>::pointer end;
  int *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int *v41;
  int v42;
  int *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  __CFString *v49;
  const char *v50;
  size_t v51;
  unsigned int v52;
  void *v53;
  unsigned int v54;
  int v55;
  int v56;
  __CFString *v57;
  __CFString *v58;
  const char *v59;
  size_t v60;
  unsigned int v61;
  __CFString *v62;
  __CFString *v63;
  const char *v64;
  size_t v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  Offset<siri::speech::schema_fb::TranslationRequest> v72;
  int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int String;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v84;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  std::vector<int> v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  -[QSSTranslationRequest speech_id](self, "speech_id");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24E246F88;
  v5 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String");
  v6 = strlen(v5);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v5, v6);

  -[QSSTranslationRequest request_id](self, "request_id");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_24E246F88;
  v9 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
  v10 = strlen(v9);
  v78 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v9, v10);

  -[QSSTranslationRequest task](self, "task");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = &stru_24E246F88;
  v13 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v11), "UTF8String");
  v14 = strlen(v13);
  v77 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v13, v14);

  -[QSSTranslationRequest source_language](self, "source_language");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v76 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSTranslationRequest target_language](self, "target_language");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = &stru_24E246F88;
  v21 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v19), "UTF8String");
  v22 = strlen(v21);
  v23 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);

  memset(&v90, 0, sizeof(v90));
  -[QSSTranslationRequest translation_phrase](self, "translation_phrase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v90, objc_msgSend(v24, "count"));

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[QSSTranslationRequest translation_phrase](self, "translation_phrase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  v75 = v23;
  begin = v90.__begin_;
  if (v26)
  {
    v28 = *(_QWORD *)v87;
    value = v90.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v87 != v28)
          objc_enumerationMutation(v25);
        v31 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i)), "UTF8String");
        v32 = strlen(v31);
        v33 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);
        v34 = v33;
        end = v90.__end_;
        if (v90.__end_ >= value)
        {
          v37 = v90.__end_ - begin;
          v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
          {
            v90.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v38)
            v38 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v38;
          if (v39)
            v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v39);
          else
            v40 = 0;
          v41 = (int *)(v39 + 4 * v37);
          *v41 = v34;
          v36 = v41 + 1;
          while (end != begin)
          {
            v42 = *--end;
            *--v41 = v42;
          }
          value = (int *)(v39 + 4 * v40);
          v90.__end_ = v36;
          if (begin)
            operator delete(begin);
          begin = v41;
        }
        else
        {
          *v90.__end_ = v33;
          v36 = end + 1;
        }
        v90.__end_ = v36;
      }
      v90.__end_cap_.__value_ = value;
      v90.__begin_ = begin;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
    }
    while (v26);
  }
  else
  {
    v36 = v90.__end_;
  }

  if (v36 == begin)
    v43 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v43 = begin;
  v44 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v43, v36 - begin);
  -[QSSTranslationRequest siri_translation_info](self, "siri_translation_info");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v45, "addObjectToBuffer:", a3);

  -[QSSTranslationRequest speech_translation_info](self, "speech_translation_info");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v46, "addObjectToBuffer:", a3);

  -[QSSTranslationRequest siri_payload_translation_info](self, "siri_payload_translation_info");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v47, "addObjectToBuffer:", a3);

  -[QSSTranslationRequest sequence_id](self, "sequence_id");
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (!v48)
    v48 = &stru_24E246F88;
  v50 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v48), "UTF8String");
  v51 = strlen(v50);
  v52 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v50, v51);

  -[QSSTranslationRequest web_translation_info](self, "web_translation_info");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "addObjectToBuffer:", a3);

  v55 = -[QSSTranslationRequest disable_log](self, "disable_log");
  v56 = -[QSSTranslationRequest opt_in_status](self, "opt_in_status");
  -[QSSTranslationRequest app_id](self, "app_id");
  v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (!v57)
    v57 = &stru_24E246F88;
  v59 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v57), "UTF8String");
  v60 = strlen(v59);
  v61 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v59, v60);

  -[QSSTranslationRequest use_case](self, "use_case");
  v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (!v62)
    v62 = &stru_24E246F88;
  v64 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v62), "UTF8String");
  v65 = strlen(v64);
  v84 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v64, v65);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v74 = *((_DWORD *)a3 + 8);
  v66 = *((_DWORD *)a3 + 12);
  v67 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v77);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v76);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v44);
  if (v82)
  {
    v68 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v82);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v68);
  }
  if (v81)
  {
    v69 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v81);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v69);
  }
  if (v80)
  {
    v70 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v80);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v70);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v52);
  if (v54)
  {
    v71 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v54);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 24, v71);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 26, v55);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 28, v56);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 30, v61);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 32, v84);
  v72.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v74 - v66 + v67);
  if (begin)
  {
    v90.__end_ = begin;
    operator delete(begin);
  }
  return v72;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TranslationRequest> v2;
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
  v2.var0 = -[QSSTranslationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__QSSTranslationRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__37__QSSTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
