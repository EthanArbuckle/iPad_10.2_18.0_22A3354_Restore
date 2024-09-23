@implementation QSSBatchTranslationRequest

- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4
{
  return -[QSSBatchTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchTranslationRequest)initWithFlatbuffData:(id)a3 root:(const BatchTranslationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchTranslationRequest *v10;
  QSSBatchTranslationRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::BatchTranslationRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSBatchTranslationRequest *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationRequest;
  v10 = -[QSSBatchTranslationRequest init](&v30, sel_init);
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
      a4 = (const BatchTranslationRequest *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationRequest::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

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

- (NSString)task
{
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

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

- (NSString)source_language
{
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

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

- (NSString)target_language
{
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

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

- (NSArray)paragraphs
{
  void *v3;
  const BatchTranslationRequest *root;
  const BatchTranslationRequest *v5;
  uint64_t v6;
  const BatchTranslationRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const BatchTranslationRequest *v10;
  uint64_t v11;
  QSSBatchTranslationRequest_Paragraph *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("paragraphs"));
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
            v12 = -[QSSBatchTranslationRequest_Paragraph initWithFlatbuffData:root:verify:]([QSSBatchTranslationRequest_Paragraph alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("paragraphs"));
  }
  return (NSArray *)v3;
}

- (NSString)app_id
{
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

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

- (NSString)session_id
{
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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

- (NSString)url
{
  const BatchTranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const BatchTranslationRequest *v6;

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
  const BatchTranslationRequest *root;
  const BatchTranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::BatchTranslationRequest>)addObjectToBuffer:(void *)a3
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
  void *v20;
  unint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t i;
  int v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  int v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  __CFString *v47;
  __CFString *v48;
  const char *v49;
  size_t v50;
  unsigned int String;
  __CFString *v52;
  __CFString *v53;
  const char *v54;
  size_t v55;
  unsigned int v56;
  __CFString *v57;
  __CFString *v58;
  const char *v59;
  size_t v60;
  unsigned int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  Offset<siri::speech::schema_fb::BatchTranslationRequest> v67;
  uint64_t v69;
  uint64_t v70;
  QSSBatchTranslationRequest *v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  -[QSSBatchTranslationRequest request_id](self, "request_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  HIDWORD(v70) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSBatchTranslationRequest task](self, "task");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  LODWORD(v70) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSBatchTranslationRequest source_language](self, "source_language");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  HIDWORD(v69) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  -[QSSBatchTranslationRequest target_language](self, "target_language");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24E246F88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  LODWORD(v69) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  -[QSSBatchTranslationRequest paragraphs](self, "paragraphs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  v22 = a3;
  if (v21)
  {
    if (v21 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
    v25 = &v23[4 * v24];
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[QSSBatchTranslationRequest paragraphs](self, "paragraphs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  v71 = self;
  if (v27)
  {
    v28 = *(_QWORD *)v74;
    v29 = v23;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v74 != v28)
          objc_enumerationMutation(v26);
        v31 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "addObjectToBuffer:", v22, v69, v70);
        v32 = v31;
        if (v29 >= v25)
        {
          v33 = (v29 - v23) >> 2;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v25 - v23) >> 1 > v34)
            v34 = (v25 - v23) >> 1;
          if ((unint64_t)(v25 - v23) >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v34;
          if (v35)
            v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v35);
          else
            v36 = 0;
          v37 = (char *)(v35 + 4 * v33);
          *(_DWORD *)v37 = v32;
          v38 = v37 + 4;
          while (v29 != v23)
          {
            v39 = *((_DWORD *)v29 - 1);
            v29 -= 4;
            *((_DWORD *)v37 - 1) = v39;
            v37 -= 4;
          }
          v25 = (char *)(v35 + 4 * v36);
          if (v23)
            operator delete(v23);
          v23 = v37;
          v29 = v38;
          v22 = a3;
        }
        else
        {
          *(_DWORD *)v29 = v31;
          v29 += 4;
        }
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    }
    while (v27);
  }
  else
  {
    v29 = v23;
  }

  v40 = v29 - v23;
  if (v29 == v23)
    v41 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationRequest_::Paragraph>> const&)::t;
  else
    v41 = v23;
  v42 = v40 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v40 >> 2, 4uLL);
  if (v23 == v29)
  {
    LODWORD(v42) = 0;
  }
  else
  {
    v43 = v41 - 4;
    v44 = v42;
    do
    {
      v45 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v43[4 * v44]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v45);
      --v44;
    }
    while (v44);
  }
  v46 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v42);
  -[QSSBatchTranslationRequest app_id](v71, "app_id");
  v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (!v47)
    v47 = &stru_24E246F88;
  v49 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v47), "UTF8String");
  v50 = strlen(v49);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v49, v50);

  -[QSSBatchTranslationRequest session_id](v71, "session_id");
  v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (!v52)
    v52 = &stru_24E246F88;
  v54 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v52), "UTF8String");
  v55 = strlen(v54);
  v56 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v54, v55);

  -[QSSBatchTranslationRequest url](v71, "url");
  v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (!v57)
    v57 = &stru_24E246F88;
  v59 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v57), "UTF8String");
  v60 = strlen(v59);
  v61 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v59, v60);

  v62 = -[QSSBatchTranslationRequest opt_in_status](v71, "opt_in_status");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v63 = *((_DWORD *)a3 + 8);
  v64 = *((_DWORD *)a3 + 12);
  v65 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, HIDWORD(v70));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v70);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, HIDWORD(v69));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v69);
  if (v46)
  {
    v66 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v46);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v66);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v56);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v61);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v62);
  v67.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v63 - v64 + v65);
  if (v23)
    operator delete(v23);
  return v67;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BatchTranslationRequest> v2;
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
  v2.var0 = -[QSSBatchTranslationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__QSSBatchTranslationRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__42__QSSBatchTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__52__QSSBatchTranslationRequest_Paragraph_flatbuffData__block_invoke(uint64_t a1)
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
