@implementation QSSRequestStatsResponse

- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSRequestStatsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRequestStatsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4
{
  return -[QSSRequestStatsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRequestStatsResponse *v10;
  QSSRequestStatsResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::RequestStatsResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSRequestStatsResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRequestStatsResponse;
  v10 = -[QSSRequestStatsResponse init](&v30, sel_init);
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
      a4 = (const RequestStatsResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::RequestStatsResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RequestStatsResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)BOOL_stats
{
  void *v3;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v5;
  uint64_t v6;
  const RequestStatsResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const RequestStatsResponse *v10;
  uint64_t v11;
  QSSRequestStatsResponse_BoolStat *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("BOOL_stats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      v6 = *(unsigned __int16 *)v5[4].var0;
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
            v12 = -[QSSRequestStatsResponse_BoolStat initWithFlatbuffData:root:verify:]([QSSRequestStatsResponse_BoolStat alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("BOOL_stats"));
  }
  return (NSArray *)v3;
}

- (NSArray)int32_stats
{
  void *v3;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v5;
  uint64_t v6;
  const RequestStatsResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const RequestStatsResponse *v10;
  uint64_t v11;
  QSSRequestStatsResponse_Int32Stat *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("int32_stats"));
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
            v12 = -[QSSRequestStatsResponse_Int32Stat initWithFlatbuffData:root:verify:]([QSSRequestStatsResponse_Int32Stat alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("int32_stats"));
  }
  return (NSArray *)v3;
}

- (NSArray)double_stats
{
  void *v3;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v5;
  uint64_t v6;
  const RequestStatsResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const RequestStatsResponse *v10;
  uint64_t v11;
  QSSRequestStatsResponse_DoubleStat *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("double_stats"));
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
            v12 = -[QSSRequestStatsResponse_DoubleStat initWithFlatbuffData:root:verify:]([QSSRequestStatsResponse_DoubleStat alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("double_stats"));
  }
  return (NSArray *)v3;
}

- (NSString)language
{
  const RequestStatsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RequestStatsResponse *v6;

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

- (NSString)speech_id
{
  const RequestStatsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RequestStatsResponse *v6;

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

- (NSString)request_locale
{
  const RequestStatsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RequestStatsResponse *v6;

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

- (Offset<siri::speech::schema_fb::RequestStatsResponse>)addObjectToBuffer:(void *)a3
{
  void *v3;
  unint64_t v4;
  void *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t i;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  flatbuffers::FlatBufferBuilder *v26;
  char *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  void *v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t j;
  int v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  flatbuffers::FlatBufferBuilder *v53;
  char *v54;
  uint64_t v55;
  int v56;
  void *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  void *v62;
  uint64_t v63;
  char *v64;
  uint64_t k;
  int v66;
  int v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  int v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  flatbuffers::FlatBufferBuilder *v78;
  char *v79;
  uint64_t v80;
  int v81;
  __CFString *v82;
  __CFString *v83;
  const char *v84;
  size_t v85;
  unsigned int String;
  __CFString *v87;
  __CFString *v88;
  const char *v89;
  size_t v90;
  unsigned int v91;
  __CFString *v92;
  __CFString *v93;
  const char *v94;
  size_t v95;
  unsigned int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  Offset<siri::speech::schema_fb::RequestStatsResponse> v103;
  unsigned int v105;
  unsigned int v106;
  void *v108;
  unsigned int v109[2];
  unsigned int v110[2];
  unsigned int v111;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  -[QSSRequestStatsResponse BOOL_stats](self, "BOOL_stats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = a3;
  if (v4)
  {
    if (v4 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v4);
    v8 = &v6[4 * v7];
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  -[QSSRequestStatsResponse BOOL_stats](self, "BOOL_stats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v121, v127, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v122;
    v12 = v6;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v122 != v11)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "addObjectToBuffer:", v5);
        v15 = v14;
        if (v12 >= v8)
        {
          v16 = (v12 - v6) >> 2;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v8 - v6) >> 1 > v17)
            v17 = (v8 - v6) >> 1;
          if ((unint64_t)(v8 - v6) >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          else
            v19 = 0;
          v20 = (char *)(v18 + 4 * v16);
          *(_DWORD *)v20 = v15;
          v21 = v20 + 4;
          while (v12 != v6)
          {
            v22 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v20 - 1) = v22;
            v20 -= 4;
          }
          v8 = (char *)(v18 + 4 * v19);
          if (v6)
            operator delete(v6);
          v6 = v20;
          v12 = v21;
          v5 = a3;
        }
        else
        {
          *(_DWORD *)v12 = v14;
          v12 += 4;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v121, v127, 16);
    }
    while (v10);
  }
  else
  {
    v12 = v6;
  }

  v23 = v12 - v6;
  if (v12 == v6)
    v24 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>> const&)::t;
  else
    v24 = v6;
  v25 = v23 >> 2;
  v26 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v23 >> 2, 4uLL);
  if (v6 == v12)
  {
    LODWORD(v25) = 0;
  }
  else
  {
    v27 = v24 - 4;
    v28 = v25;
    do
    {
      v29 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
    v26 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  v30 = flatbuffers::FlatBufferBuilder::EndVector(v26, v25);
  -[QSSRequestStatsResponse int32_stats](self, "int32_stats");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");
  v105 = v30;
  if (v32)
  {
    if (v32 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v32);
    v35 = &v33[4 * v34];
  }
  else
  {
    v33 = 0;
    v35 = 0;
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[QSSRequestStatsResponse int32_stats](self, "int32_stats");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v118;
    v39 = v33;
    *(_QWORD *)v109 = v36;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v118 != v38)
          objc_enumerationMutation(v36);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v42 = v41;
        if (v39 >= v35)
        {
          v43 = (v39 - v33) >> 2;
          v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v35 - v33) >> 1 > v44)
            v44 = (v35 - v33) >> 1;
          if ((unint64_t)(v35 - v33) >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v44;
          if (v45)
            v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v45);
          else
            v46 = 0;
          v47 = (char *)(v45 + 4 * v43);
          *(_DWORD *)v47 = v42;
          v48 = v47 + 4;
          while (v39 != v33)
          {
            v49 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *((_DWORD *)v47 - 1) = v49;
            v47 -= 4;
          }
          v35 = (char *)(v45 + 4 * v46);
          if (v33)
            operator delete(v33);
          v33 = v47;
          v39 = v48;
          v36 = *(void **)v109;
        }
        else
        {
          *(_DWORD *)v39 = v41;
          v39 += 4;
        }
      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    }
    while (v37);
  }
  else
  {
    v39 = v33;
  }

  v50 = v39 - v33;
  if (v39 == v33)
    v51 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>> const&)::t;
  else
    v51 = v33;
  v52 = v50 >> 2;
  v53 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v50 >> 2, 4uLL);
  if (v33 == v39)
  {
    LODWORD(v52) = 0;
  }
  else
  {
    v54 = v51 - 4;
    v55 = v52;
    do
    {
      v56 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v54[4 * v55]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v56);
      --v55;
    }
    while (v55);
    v53 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  v106 = flatbuffers::FlatBufferBuilder::EndVector(v53, v52);
  -[QSSRequestStatsResponse double_stats](self, "double_stats");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");
  if (v58)
  {
    if (v58 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v58);
    v61 = &v59[4 * v60];
  }
  else
  {
    v59 = 0;
    v61 = 0;
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  -[QSSRequestStatsResponse double_stats](self, "double_stats");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
  if (v63)
  {
    v108 = v62;
    *(_QWORD *)v110 = *(_QWORD *)v114;
    v64 = v59;
    do
    {
      for (k = 0; k != v63; ++k)
      {
        if (*(_QWORD *)v114 != *(_QWORD *)v110)
          objc_enumerationMutation(v62);
        v66 = objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v67 = v66;
        if (v64 >= v61)
        {
          v68 = (v64 - v59) >> 2;
          v69 = v68 + 1;
          if ((unint64_t)(v68 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v61 - v59) >> 1 > v69)
            v69 = (v61 - v59) >> 1;
          if ((unint64_t)(v61 - v59) >= 0x7FFFFFFFFFFFFFFCLL)
            v70 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v70 = v69;
          if (v70)
            v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v70);
          else
            v71 = 0;
          v72 = (char *)(v70 + 4 * v68);
          *(_DWORD *)v72 = v67;
          v73 = v72 + 4;
          while (v64 != v59)
          {
            v74 = *((_DWORD *)v64 - 1);
            v64 -= 4;
            *((_DWORD *)v72 - 1) = v74;
            v72 -= 4;
          }
          v61 = (char *)(v70 + 4 * v71);
          if (v59)
            operator delete(v59);
          v59 = v72;
          v64 = v73;
          v62 = v108;
        }
        else
        {
          *(_DWORD *)v64 = v66;
          v64 += 4;
        }
      }
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
    }
    while (v63);
  }
  else
  {
    v64 = v59;
  }

  v75 = v64 - v59;
  if (v64 == v59)
    v76 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>> const&)::t;
  else
    v76 = v59;
  v77 = v75 >> 2;
  v78 = (flatbuffers::FlatBufferBuilder *)a3;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v75 >> 2, 4uLL);
  if (v59 == v64)
  {
    LODWORD(v77) = 0;
  }
  else
  {
    v79 = v76 - 4;
    v80 = v77;
    do
    {
      v81 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v79[4 * v80]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v81);
      --v80;
    }
    while (v80);
    v78 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  v111 = flatbuffers::FlatBufferBuilder::EndVector(v78, v77);
  -[QSSRequestStatsResponse language](self, "language");
  v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (!v82)
    v82 = &stru_24E246F88;
  v84 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v82), "UTF8String");
  v85 = strlen(v84);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v84, v85);

  -[QSSRequestStatsResponse speech_id](self, "speech_id");
  v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (!v87)
    v87 = &stru_24E246F88;
  v89 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v87), "UTF8String");
  v90 = strlen(v89);
  v91 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v89, v90);

  -[QSSRequestStatsResponse request_locale](self, "request_locale");
  v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v93 = v92;
  if (!v92)
    v92 = &stru_24E246F88;
  v94 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v92), "UTF8String");
  v95 = strlen(v94);
  v96 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v94, v95);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v97 = *((_DWORD *)a3 + 8);
  v98 = *((_DWORD *)a3 + 12);
  v99 = *((_DWORD *)a3 + 10);
  if (v105)
  {
    v100 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v105);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v100);
  }
  if (v106)
  {
    v101 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v106);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v101);
  }
  if (v111)
  {
    v102 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v111);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v102);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v91);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v96);
  v103.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v97 - v98 + v99);
  if (v59)
    operator delete(v59);
  if (v33)
    operator delete(v33);
  if (v6)
    operator delete(v6);
  return v103;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RequestStatsResponse> v2;
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
  v2.var0 = -[QSSRequestStatsResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__QSSRequestStatsResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__39__QSSRequestStatsResponse_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__50__QSSRequestStatsResponse_DoubleStat_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__49__QSSRequestStatsResponse_Int32Stat_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__48__QSSRequestStatsResponse_BoolStat_flatbuffData__block_invoke(uint64_t a1)
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
