@implementation QSSRecognitionResult

- (QSSRecognitionResult)initWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionResult initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionResult initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4
{
  return -[QSSRecognitionResult initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecognitionResult *v10;
  QSSRecognitionResult *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::RecognitionResult *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSRecognitionResult *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionResult;
  v10 = -[QSSRecognitionResult init](&v30, sel_init);
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
      a4 = (const RecognitionResult *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RecognitionResult *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionResult::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSRecognitionSausage)pre_itn
{
  QSSRecognitionSausage *v3;
  QSSRecognitionSausage *v4;
  const RecognitionResult *root;
  const RecognitionResult *v6;
  uint64_t v7;
  const RecognitionResult *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn"));
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn"));
  }
  return v3;
}

- (QSSRecognitionSausage)post_itn
{
  QSSRecognitionSausage *v3;
  QSSRecognitionSausage *v4;
  const RecognitionResult *root;
  const RecognitionResult *v6;
  uint64_t v7;
  const RecognitionResult *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn"));
  v3 = (QSSRecognitionSausage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn"));
  }
  return v3;
}

- (NSArray)pre_itn_nbest_choices
{
  void *v3;
  const RecognitionResult *root;
  const RecognitionResult *v5;
  uint64_t v6;
  const RecognitionResult *v7;
  uint64_t v8;
  uint64_t v9;
  const RecognitionResult *v10;
  uint64_t v11;
  QSSRecognitionChoice *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_nbest_choices"));
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
            v12 = -[QSSRecognitionChoice initWithFlatbuffData:root:verify:]([QSSRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn_nbest_choices"));
  }
  return (NSArray *)v3;
}

- (NSArray)post_itn_nbest_choices
{
  void *v3;
  const RecognitionResult *root;
  const RecognitionResult *v5;
  uint64_t v6;
  const RecognitionResult *v7;
  uint64_t v8;
  uint64_t v9;
  const RecognitionResult *v10;
  uint64_t v11;
  QSSRecognitionChoice *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_nbest_choices"));
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
            v12 = -[QSSRecognitionChoice initWithFlatbuffData:root:verify:]([QSSRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn_nbest_choices"));
  }
  return (NSArray *)v3;
}

- (NSArray)pre_itn_token_to_post_itn_char_alignment
{
  void *v3;
  const RecognitionResult *root;
  const RecognitionResult *v5;
  uint64_t v6;
  const RecognitionResult *v7;
  uint64_t v8;
  uint64_t v9;
  const RecognitionResult *v10;
  uint64_t v11;
  QSSItnAlignment *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_token_to_post_itn_char_alignment"));
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn_token_to_post_itn_char_alignment"));
  }
  return (NSArray *)v3;
}

- (NSArray)choice_alignments
{
  void *v3;
  const RecognitionResult *root;
  const RecognitionResult *v5;
  uint64_t v6;
  const RecognitionResult *v7;
  uint64_t v8;
  uint64_t v9;
  const RecognitionResult *v10;
  uint64_t v11;
  QSSChoiceAlignment *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("choice_alignments"));
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
            v12 = -[QSSChoiceAlignment initWithFlatbuffData:root:verify:]([QSSChoiceAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("choice_alignments"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::RecognitionResult>)addObjectToBuffer:(void *)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int *begin;
  uint64_t v11;
  int *value;
  uint64_t i;
  int v14;
  int v15;
  std::vector<int>::pointer end;
  int *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int *v22;
  int v23;
  int *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  int *v30;
  uint64_t j;
  int v32;
  int v33;
  std::vector<int>::pointer v34;
  int *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int *v40;
  int v41;
  int *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  int *v48;
  uint64_t k;
  int v50;
  int v51;
  std::vector<int>::pointer v52;
  int *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  int *v58;
  int v59;
  int *v60;
  void *v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t m;
  int v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  int v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  int v85;
  unsigned int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  Offset<siri::speech::schema_fb::RecognitionResult> v91;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  id obj;
  id obja;
  id objb;
  id objc;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  std::vector<int> v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  std::vector<int> v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  std::vector<int> v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  -[QSSRecognitionResult pre_itn](self, "pre_itn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  -[QSSRecognitionResult post_itn](self, "post_itn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  memset(&v121, 0, sizeof(v121));
  -[QSSRecognitionResult pre_itn_nbest_choices](self, "pre_itn_nbest_choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v121, objc_msgSend(v7, "count"));

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[QSSRecognitionResult pre_itn_nbest_choices](self, "pre_itn_nbest_choices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
  obj = v8;
  v96 = v6;
  begin = v121.__begin_;
  if (v9)
  {
    v11 = *(_QWORD *)v118;
    value = v121.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v118 != v11)
          objc_enumerationMutation(obj);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v15 = v14;
        end = v121.__end_;
        if (v121.__end_ >= value)
        {
          v18 = v121.__end_ - begin;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v121.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v19)
            v19 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          else
            v21 = 0;
          v22 = (int *)(v20 + 4 * v18);
          *v22 = v15;
          v17 = v22 + 1;
          while (end != begin)
          {
            v23 = *--end;
            *--v22 = v23;
          }
          value = (int *)(v20 + 4 * v21);
          v121.__end_ = v17;
          if (begin)
            operator delete(begin);
          begin = v22;
        }
        else
        {
          *v121.__end_ = v14;
          v17 = end + 1;
        }
        v121.__end_ = v17;
      }
      v121.__end_cap_.__value_ = value;
      v121.__begin_ = begin;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    }
    while (v9);
  }
  else
  {
    v17 = v121.__end_;
  }

  if (v17 == begin)
    v24 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v24 = begin;
  v95 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v24, v17 - begin);
  memset(&v116, 0, sizeof(v116));
  -[QSSRecognitionResult post_itn_nbest_choices](self, "post_itn_nbest_choices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v116, objc_msgSend(v25, "count"));

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  -[QSSRecognitionResult post_itn_nbest_choices](self, "post_itn_nbest_choices");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
  v28 = v116.__begin_;
  if (v27)
  {
    v29 = *(_QWORD *)v113;
    v30 = v116.__end_cap_.__value_;
    obja = v26;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v113 != v29)
          objc_enumerationMutation(v26);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v33 = v32;
        v34 = v116.__end_;
        if (v116.__end_ >= v30)
        {
          v36 = v116.__end_ - v28;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
          {
            v116.__begin_ = v28;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v30 - (char *)v28) >> 1 > v37)
            v37 = ((char *)v30 - (char *)v28) >> 1;
          if ((unint64_t)((char *)v30 - (char *)v28) >= 0x7FFFFFFFFFFFFFFCLL)
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
          while (v34 != v28)
          {
            v41 = *--v34;
            *--v40 = v41;
          }
          v30 = (int *)(v38 + 4 * v39);
          v116.__end_ = v35;
          if (v28)
            operator delete(v28);
          v28 = v40;
          v26 = obja;
        }
        else
        {
          *v116.__end_ = v32;
          v35 = v34 + 1;
        }
        v116.__end_ = v35;
      }
      v116.__end_cap_.__value_ = v30;
      v116.__begin_ = v28;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
    }
    while (v27);
  }
  else
  {
    v35 = v116.__end_;
  }

  if (v35 == v28)
    v42 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v42 = v28;
  v94 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v42, v35 - v28);
  memset(&v111, 0, sizeof(v111));
  -[QSSRecognitionResult pre_itn_token_to_post_itn_char_alignment](self, "pre_itn_token_to_post_itn_char_alignment");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, objc_msgSend(v43, "count"));

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  -[QSSRecognitionResult pre_itn_token_to_post_itn_char_alignment](self, "pre_itn_token_to_post_itn_char_alignment");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
  v46 = v111.__begin_;
  if (v45)
  {
    v47 = *(_QWORD *)v108;
    v48 = v111.__end_cap_.__value_;
    objb = v44;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v108 != v47)
          objc_enumerationMutation(v44);
        v50 = objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v51 = v50;
        v52 = v111.__end_;
        if (v111.__end_ >= v48)
        {
          v54 = v111.__end_ - v46;
          v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62)
          {
            v111.__begin_ = v46;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v48 - (char *)v46) >> 1 > v55)
            v55 = ((char *)v48 - (char *)v46) >> 1;
          if ((unint64_t)((char *)v48 - (char *)v46) >= 0x7FFFFFFFFFFFFFFCLL)
            v56 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v56 = v55;
          if (v56)
            v56 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v56);
          else
            v57 = 0;
          v58 = (int *)(v56 + 4 * v54);
          *v58 = v51;
          v53 = v58 + 1;
          while (v52 != v46)
          {
            v59 = *--v52;
            *--v58 = v59;
          }
          v48 = (int *)(v56 + 4 * v57);
          v111.__end_ = v53;
          if (v46)
            operator delete(v46);
          v46 = v58;
          v44 = objb;
        }
        else
        {
          *v111.__end_ = v50;
          v53 = v52 + 1;
        }
        v111.__end_ = v53;
      }
      v111.__end_cap_.__value_ = v48;
      v111.__begin_ = v46;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
    }
    while (v45);
  }
  else
  {
    v53 = v111.__end_;
  }

  if (v53 == v46)
    v60 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  else
    v60 = v46;
  v93 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v60, v53 - v46);
  -[QSSRecognitionResult choice_alignments](self, "choice_alignments");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");
  if (v62)
  {
    if (v62 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v62);
    v65 = &v63[4 * v64];
  }
  else
  {
    v63 = 0;
    v65 = 0;
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  -[QSSRecognitionResult choice_alignments](self, "choice_alignments");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v103, v122, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v104;
    v69 = v63;
    objc = v66;
    do
    {
      for (m = 0; m != v67; ++m)
      {
        if (*(_QWORD *)v104 != v68)
          objc_enumerationMutation(v66);
        v71 = objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * m), "addObjectToBuffer:", a3);
        v72 = v71;
        if (v69 >= v65)
        {
          v73 = (v69 - v63) >> 2;
          v74 = v73 + 1;
          if ((unint64_t)(v73 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v65 - v63) >> 1 > v74)
            v74 = (v65 - v63) >> 1;
          if ((unint64_t)(v65 - v63) >= 0x7FFFFFFFFFFFFFFCLL)
            v75 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v75 = v74;
          if (v75)
            v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v75);
          else
            v76 = 0;
          v77 = (char *)(v75 + 4 * v73);
          *(_DWORD *)v77 = v72;
          v78 = v77 + 4;
          while (v69 != v63)
          {
            v79 = *((_DWORD *)v69 - 1);
            v69 -= 4;
            *((_DWORD *)v77 - 1) = v79;
            v77 -= 4;
          }
          v65 = (char *)(v75 + 4 * v76);
          if (v63)
            operator delete(v63);
          v63 = v77;
          v69 = v78;
          v66 = objc;
        }
        else
        {
          *(_DWORD *)v69 = v71;
          v69 += 4;
        }
      }
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v103, v122, 16);
    }
    while (v67);
  }
  else
  {
    v69 = v63;
  }

  v80 = v69 - v63;
  if (v69 == v63)
    v81 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ChoiceAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ChoiceAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ChoiceAlignment>> const&)::t;
  else
    v81 = v63;
  v82 = v80 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v80 >> 2, 4uLL);
  if (v63 == v69)
  {
    LODWORD(v82) = 0;
  }
  else
  {
    v83 = v81 - 4;
    v84 = v82;
    do
    {
      v85 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v83[4 * v84]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v85);
      --v84;
    }
    while (v84);
  }
  v86 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v82);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v87 = *((_DWORD *)a3 + 8);
  v88 = *((_DWORD *)a3 + 12);
  v89 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v97);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v96);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v95);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v94);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v93);
  if (v86)
  {
    v90 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v86);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v90);
  }
  v91.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v87 - v88 + v89);
  if (v63)
    operator delete(v63);
  if (v111.__begin_)
    operator delete(v111.__begin_);
  if (v116.__begin_)
    operator delete(v116.__begin_);
  if (v121.__begin_)
    operator delete(v121.__begin_);
  return v91;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RecognitionResult> v2;
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
  v2.var0 = -[QSSRecognitionResult addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__QSSRecognitionResult_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__36__QSSRecognitionResult_flatbuffData__block_invoke(uint64_t a1)
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
