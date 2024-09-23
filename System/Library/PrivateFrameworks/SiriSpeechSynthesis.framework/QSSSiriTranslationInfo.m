@implementation QSSSiriTranslationInfo

- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3
{
  return -[QSSSiriTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSSiriTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4
{
  return -[QSSSiriTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSSiriTranslationInfo *v10;
  QSSSiriTranslationInfo *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::SiriTranslationInfo *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSSiriTranslationInfo *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSiriTranslationInfo;
  v10 = -[QSSSiriTranslationInfo init](&v30, sel_init);
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
      a4 = (const SiriTranslationInfo *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SiriTranslationInfo *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SiriTranslationInfo::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSRecognitionSausage)raw_sausage
{
  QSSRecognitionSausage *v3;
  QSSRecognitionSausage *v4;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v6;
  uint64_t v7;
  const SiriTranslationInfo *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_sausage"));
  v3 = (QSSRecognitionSausage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("raw_sausage"));
  }
  return v3;
}

- (NSArray)raw_nbest_choices
{
  void *v3;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v5;
  uint64_t v6;
  const SiriTranslationInfo *v7;
  uint64_t v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  QSSRecognitionChoice *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
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
            v12 = -[QSSRecognitionChoice initWithFlatbuffData:root:verify:]([QSSRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("raw_nbest_choices"));
  }
  return (NSArray *)v3;
}

- (NSArray)post_itn_tokens
{
  void *v3;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v5;
  uint64_t v6;
  const SiriTranslationInfo *v7;
  uint64_t v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_tokens"));
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
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn_tokens"));
  }
  return (NSArray *)v3;
}

- (NSString)post_itn_recognition
{
  const SiriTranslationInfo *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SiriTranslationInfo *v6;

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

- (NSArray)itn_alignments
{
  void *v3;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v5;
  uint64_t v6;
  const SiriTranslationInfo *v7;
  uint64_t v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  QSSItnAlignment *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("itn_alignments"));
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
            v12 = -[QSSItnAlignment initWithFlatbuffData:root:verify:]([QSSItnAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("itn_alignments"));
  }
  return (NSArray *)v3;
}

- (NSArray)translation_phrase
{
  void *v3;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v5;
  uint64_t v6;
  const SiriTranslationInfo *v7;
  uint64_t v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  QSSSpan *v12;

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
            v12 = -[QSSSpan initWithFlatbuffData:root:verify:]([QSSSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
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

- (Offset<siri::speech::schema_fb::SiriTranslationInfo>)addObjectToBuffer:(void *)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int *begin;
  uint64_t v10;
  int *value;
  uint64_t i;
  int v13;
  int v14;
  std::vector<int>::pointer end;
  int *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  int *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  int *v29;
  uint64_t j;
  const char *v31;
  size_t v32;
  int String;
  int v34;
  std::vector<int>::pointer v35;
  int *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int *v41;
  int v42;
  int *v43;
  __CFString *v44;
  __CFString *v45;
  const char *v46;
  size_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  int *v53;
  uint64_t k;
  int v55;
  int v56;
  std::vector<int>::pointer v57;
  int *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int *v63;
  int v64;
  int *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  int *v70;
  uint64_t v71;
  int *v72;
  uint64_t m;
  int v74;
  int v75;
  std::vector<int>::pointer v76;
  int *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  int *v82;
  int v83;
  int *v84;
  unsigned int v85;
  int v86;
  int v87;
  int v88;
  Offset<siri::speech::schema_fb::SiriTranslationInfo> v89;
  uint64_t v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v95;
  id obj;
  id obja;
  id objb;
  id objc;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  std::vector<int> v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  std::vector<int> v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  std::vector<int> v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  std::vector<int> v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  -[QSSSiriTranslationInfo raw_sausage](self, "raw_sausage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  memset(&v119, 0, sizeof(v119));
  -[QSSSiriTranslationInfo raw_nbest_choices](self, "raw_nbest_choices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v119, objc_msgSend(v6, "count"));

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  -[QSSSiriTranslationInfo raw_nbest_choices](self, "raw_nbest_choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
  obj = v7;
  v93 = v5;
  begin = v119.__begin_;
  if (v8)
  {
    v10 = *(_QWORD *)v116;
    value = v119.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v116 != v10)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v14 = v13;
        end = v119.__end_;
        if (v119.__end_ >= value)
        {
          v17 = v119.__end_ - begin;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v119.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v18)
            v18 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          else
            v20 = 0;
          v21 = (int *)(v19 + 4 * v17);
          *v21 = v14;
          v16 = v21 + 1;
          while (end != begin)
          {
            v22 = *--end;
            *--v21 = v22;
          }
          value = (int *)(v19 + 4 * v20);
          v119.__end_ = v16;
          if (begin)
            operator delete(begin);
          begin = v21;
        }
        else
        {
          *v119.__end_ = v13;
          v16 = end + 1;
        }
        v119.__end_ = v16;
      }
      v119.__end_cap_.__value_ = value;
      v119.__begin_ = begin;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    }
    while (v8);
  }
  else
  {
    v16 = v119.__end_;
  }

  if (v16 == begin)
    v23 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v23 = begin;
  v92 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v23, v16 - begin);
  memset(&v114, 0, sizeof(v114));
  -[QSSSiriTranslationInfo post_itn_tokens](self, "post_itn_tokens");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v114, objc_msgSend(v24, "count"));

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[QSSSiriTranslationInfo post_itn_tokens](self, "post_itn_tokens");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
  v27 = v114.__begin_;
  if (v26)
  {
    v28 = *(_QWORD *)v111;
    v29 = v114.__end_cap_.__value_;
    obja = v25;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v111 != v28)
          objc_enumerationMutation(v25);
        v31 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v110 + 1) + 8 * j)), "UTF8String");
        v32 = strlen(v31);
        String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);
        v34 = String;
        v35 = v114.__end_;
        if (v114.__end_ >= v29)
        {
          v37 = v114.__end_ - v27;
          v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
          {
            v114.__begin_ = v27;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v29 - (char *)v27) >> 1 > v38)
            v38 = ((char *)v29 - (char *)v27) >> 1;
          if ((unint64_t)((char *)v29 - (char *)v27) >= 0x7FFFFFFFFFFFFFFCLL)
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
          while (v35 != v27)
          {
            v42 = *--v35;
            *--v41 = v42;
          }
          v29 = (int *)(v39 + 4 * v40);
          v114.__end_ = v36;
          if (v27)
            operator delete(v27);
          v27 = v41;
          v25 = obja;
        }
        else
        {
          *v114.__end_ = String;
          v36 = v35 + 1;
        }
        v114.__end_ = v36;
      }
      v114.__end_cap_.__value_ = v29;
      v114.__begin_ = v27;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
    }
    while (v26);
  }
  else
  {
    v36 = v114.__end_;
  }

  if (v36 == v27)
    v43 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v43 = v27;
  HIDWORD(v91) = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v43, v36 - v27);
  -[QSSSiriTranslationInfo post_itn_recognition](self, "post_itn_recognition");
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (!v44)
    v44 = &stru_24E246F88;
  v46 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v44), "UTF8String");
  v47 = strlen(v46);
  LODWORD(v91) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v46, v47);

  memset(&v109, 0, sizeof(v109));
  -[QSSSiriTranslationInfo itn_alignments](self, "itn_alignments");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v109, objc_msgSend(v48, "count"));

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  -[QSSSiriTranslationInfo itn_alignments](self, "itn_alignments");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
  v51 = v109.__begin_;
  if (v50)
  {
    v52 = *(_QWORD *)v106;
    v53 = v109.__end_cap_.__value_;
    objb = v49;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v106 != v52)
          objc_enumerationMutation(v49);
        v55 = objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * k), "addObjectToBuffer:", a3, v91);
        v56 = v55;
        v57 = v109.__end_;
        if (v109.__end_ >= v53)
        {
          v59 = v109.__end_ - v51;
          v60 = v59 + 1;
          if ((unint64_t)(v59 + 1) >> 62)
          {
            v109.__begin_ = v51;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v53 - (char *)v51) >> 1 > v60)
            v60 = ((char *)v53 - (char *)v51) >> 1;
          if ((unint64_t)((char *)v53 - (char *)v51) >= 0x7FFFFFFFFFFFFFFCLL)
            v61 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v61 = v60;
          if (v61)
            v61 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v61);
          else
            v62 = 0;
          v63 = (int *)(v61 + 4 * v59);
          *v63 = v56;
          v58 = v63 + 1;
          while (v57 != v51)
          {
            v64 = *--v57;
            *--v63 = v64;
          }
          v53 = (int *)(v61 + 4 * v62);
          v109.__end_ = v58;
          if (v51)
            operator delete(v51);
          v51 = v63;
          v49 = objb;
        }
        else
        {
          *v109.__end_ = v55;
          v58 = v57 + 1;
        }
        v109.__end_ = v58;
      }
      v109.__end_cap_.__value_ = v53;
      v109.__begin_ = v51;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    }
    while (v50);
  }
  else
  {
    v58 = v109.__end_;
  }

  if (v58 == v51)
    v65 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  else
    v65 = v51;
  v66 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v65, v58 - v51);
  memset(&v104, 0, sizeof(v104));
  -[QSSSiriTranslationInfo translation_phrase](self, "translation_phrase");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v104, objc_msgSend(v67, "count"));

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[QSSSiriTranslationInfo translation_phrase](self, "translation_phrase");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
  objc = v68;
  v95 = v66;
  v70 = v104.__begin_;
  if (v69)
  {
    v71 = *(_QWORD *)v101;
    v72 = v104.__end_cap_.__value_;
    do
    {
      for (m = 0; m != v69; ++m)
      {
        if (*(_QWORD *)v101 != v71)
          objc_enumerationMutation(objc);
        v74 = objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * m), "addObjectToBuffer:", a3, v91);
        v75 = v74;
        v76 = v104.__end_;
        if (v104.__end_ >= v72)
        {
          v78 = v104.__end_ - v70;
          v79 = v78 + 1;
          if ((unint64_t)(v78 + 1) >> 62)
          {
            v104.__begin_ = v70;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v72 - (char *)v70) >> 1 > v79)
            v79 = ((char *)v72 - (char *)v70) >> 1;
          if ((unint64_t)((char *)v72 - (char *)v70) >= 0x7FFFFFFFFFFFFFFCLL)
            v80 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v80 = v79;
          if (v80)
            v80 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v80);
          else
            v81 = 0;
          v82 = (int *)(v80 + 4 * v78);
          *v82 = v75;
          v77 = v82 + 1;
          while (v76 != v70)
          {
            v83 = *--v76;
            *--v82 = v83;
          }
          v72 = (int *)(v80 + 4 * v81);
          v104.__end_ = v77;
          if (v70)
            operator delete(v70);
          v70 = v82;
        }
        else
        {
          *v104.__end_ = v74;
          v77 = v76 + 1;
        }
        v104.__end_ = v77;
      }
      v104.__end_cap_.__value_ = v72;
      v104.__begin_ = v70;
      v69 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
    }
    while (v69);
  }
  else
  {
    v77 = v104.__end_;
  }

  if (v77 == v70)
    v84 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::Span>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::Span>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::Span>> const&)::t;
  else
    v84 = v70;
  v85 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v84, v77 - v70);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v86 = *((_DWORD *)a3 + 8);
  v87 = *((_DWORD *)a3 + 12);
  v88 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v93);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v92);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, HIDWORD(v91));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v91);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v95);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v85);
  v89.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v86 - v87 + v88);
  if (v70)
  {
    v104.__end_ = v70;
    operator delete(v70);
  }
  if (v109.__begin_)
    operator delete(v109.__begin_);
  if (v114.__begin_)
    operator delete(v114.__begin_);
  if (v119.__begin_)
    operator delete(v119.__begin_);
  return v89;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::SiriTranslationInfo> v2;
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
  v2.var0 = -[QSSSiriTranslationInfo addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__QSSSiriTranslationInfo_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__38__QSSSiriTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
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
