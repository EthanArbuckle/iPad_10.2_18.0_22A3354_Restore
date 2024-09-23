@implementation QSSShortcutFuzzyMatchRequest

- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSShortcutFuzzyMatchRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSShortcutFuzzyMatchRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4
{
  return -[QSSShortcutFuzzyMatchRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSShortcutFuzzyMatchRequest *v10;
  QSSShortcutFuzzyMatchRequest *v11;
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
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  unint64_t v26;
  unsigned int *v27;
  unsigned __int16 *v28;
  uint64_t v29;
  const unsigned __int8 *v30;
  unsigned __int16 *v31;
  uint64_t v32;
  const unsigned __int8 *v33;
  unsigned __int16 *v34;
  uint64_t v35;
  const unsigned __int8 *v36;
  unsigned __int16 *v37;
  uint64_t v38;
  const unsigned __int8 *v39;
  unsigned __int16 *v40;
  uint64_t v41;
  const unsigned __int8 *v42;
  unsigned __int16 *v43;
  uint64_t v44;
  const unsigned __int8 *v45;
  uint64_t v46;
  NSMutableDictionary *storage;
  QSSShortcutFuzzyMatchRequest *v48;
  uint64_t v50;
  unint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;

  v5 = a5;
  v9 = a3;
  v55.receiver = self;
  v55.super_class = (Class)QSSShortcutFuzzyMatchRequest;
  v10 = -[QSSShortcutFuzzyMatchRequest init](&v55, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_66;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_67;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ShortcutFuzzyMatchRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_65;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_67;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v50 = v18;
  v51 = v19;
  v52 = xmmword_21E34D540;
  v53 = 0;
  LOBYTE(v54) = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_65;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v50, v11->_root->var0))
    goto LABEL_67;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 4u))
    goto LABEL_67;
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u)
  {
    v22 = v21[2];
    if (v22)
    {
      if (!siri::speech::schema_fb::ContextWithPronHints::Verify((flatbuffers::Table *)((char *)root + v22 + *(unsigned int *)((char *)root + v22)), (flatbuffers::Verifier *)&v50))goto LABEL_67;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 6u))
    goto LABEL_67;
  v23 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v23) < 7u)
    goto LABEL_28;
  if (*(_WORD *)((char *)root - v23 + 6))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v50, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v23 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v23 + 6)), 4uLL, 0))
    {
      v23 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v23) < 7u)
        goto LABEL_28;
      goto LABEL_23;
    }
LABEL_67:
    v48 = 0;
    goto LABEL_68;
  }
LABEL_23:
  v24 = *(unsigned __int16 *)((char *)root - v23 + 6);
  if (v24)
  {
    v25 = (_DWORD *)((char *)root + v24 + *(unsigned int *)((char *)root + v24));
    if (*v25)
    {
      v26 = 0;
      v27 = v25 + 1;
      while (siri::speech::schema_fb::ContextWithPronHints::Verify((siri::speech::schema_fb::ContextWithPronHints *)((char *)v27 + *v27), (flatbuffers::Verifier *)&v50))
      {
        ++v26;
        ++v27;
        if (v26 >= *v25)
          goto LABEL_28;
      }
      goto LABEL_67;
    }
  }
LABEL_28:
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 8u))
    goto LABEL_67;
  v28 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v28 >= 9u && (v29 = v28[4]) != 0)
    v30 = (const unsigned __int8 *)root + v29 + *(unsigned int *)((char *)root + v29);
  else
    v30 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v30)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0xAu))
  {
    goto LABEL_67;
  }
  v31 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v31 >= 0xBu && (v32 = v31[5]) != 0)
    v33 = (const unsigned __int8 *)root + v32 + *(unsigned int *)((char *)root + v32);
  else
    v33 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v33)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0xCu))
  {
    goto LABEL_67;
  }
  v34 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v34 >= 0xDu && (v35 = v34[6]) != 0)
    v36 = (const unsigned __int8 *)root + v35 + *(unsigned int *)((char *)root + v35);
  else
    v36 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v36)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0xEu))
  {
    goto LABEL_67;
  }
  v37 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v37 >= 0xFu && (v38 = v37[7]) != 0)
    v39 = (const unsigned __int8 *)root + v38 + *(unsigned int *)((char *)root + v38);
  else
    v39 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v39)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0x10u))
  {
    goto LABEL_67;
  }
  v40 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v40 >= 0x11u && (v41 = v40[8]) != 0)
    v42 = (const unsigned __int8 *)root + v41 + *(unsigned int *)((char *)root + v41);
  else
    v42 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v42)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v50, 0x12u))
  {
    goto LABEL_67;
  }
  v43 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v43 >= 0x13u && (v44 = v43[9]) != 0)
    v45 = (const unsigned __int8 *)root + v44 + *(unsigned int *)((char *)root + v44);
  else
    v45 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v50, v45))
    goto LABEL_67;
LABEL_65:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v50, v51, v52, v53, v54);
  v46 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v46;

LABEL_66:
  v48 = v11;
LABEL_68:

  return v48;
}

- (QSSShortcutFuzzyMatchRequest_StringTokenPair)utterance
{
  QSSShortcutFuzzyMatchRequest_StringTokenPair *v3;
  QSSShortcutFuzzyMatchRequest_StringTokenPair *v4;
  const ShortcutFuzzyMatchRequest *root;
  const ShortcutFuzzyMatchRequest *v6;
  uint64_t v7;
  const ShortcutFuzzyMatchRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("utterance"));
  v3 = (QSSShortcutFuzzyMatchRequest_StringTokenPair *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSShortcutFuzzyMatchRequest_StringTokenPair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("utterance"));
  }
  return v3;
}

- (NSArray)shortcuts
{
  void *v3;
  const ShortcutFuzzyMatchRequest *root;
  const ShortcutFuzzyMatchRequest *v5;
  uint64_t v6;
  const ShortcutFuzzyMatchRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const ShortcutFuzzyMatchRequest *v10;
  uint64_t v11;
  QSSShortcutFuzzyMatchRequest_StringTokenPair *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcuts"));
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
            v12 = -[QSSShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:]([QSSShortcutFuzzyMatchRequest_StringTokenPair alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("shortcuts"));
  }
  return (NSArray *)v3;
}

- (NSString)request_id
{
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchRequest *v6;

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

- (NSString)session_id
{
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchRequest *v6;

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

- (NSString)interaction_id
{
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchRequest *v6;

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

- (NSString)locale
{
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchRequest *v6;

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

- (NSString)device_type
{
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchRequest *v6;

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

- (NSString)context
{
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ShortcutFuzzyMatchRequest *v6;

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

- (Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest>)addObjectToBuffer:(void *)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t i;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  int v24;
  QSSShortcutFuzzyMatchRequest *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  const char *v34;
  size_t v35;
  __CFString *v36;
  __CFString *v37;
  const char *v38;
  size_t v39;
  unsigned int v40;
  __CFString *v41;
  __CFString *v42;
  const char *v43;
  size_t v44;
  unsigned int v45;
  __CFString *v46;
  __CFString *v47;
  const char *v48;
  size_t v49;
  unsigned int v50;
  __CFString *v51;
  __CFString *v52;
  const char *v53;
  size_t v54;
  unsigned int v55;
  __CFString *v56;
  __CFString *v57;
  const char *v58;
  size_t v59;
  unsigned int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest> v66;
  unsigned int String;
  unsigned int v69;
  unsigned int v70;
  QSSShortcutFuzzyMatchRequest *v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  -[QSSShortcutFuzzyMatchRequest utterance](self, "utterance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  -[QSSShortcutFuzzyMatchRequest shortcuts](self, "shortcuts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = a3;
  v71 = self;
  if (v6)
  {
    if (v6 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v6);
    v10 = &v8[4 * v9];
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[QSSShortcutFuzzyMatchRequest shortcuts](self, "shortcuts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v74;
    v14 = v8;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v74 != v13)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "addObjectToBuffer:", v7);
        v17 = v16;
        if (v14 >= v10)
        {
          v18 = (v14 - v8) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v10 - v8) >> 1 > v19)
            v19 = (v10 - v8) >> 1;
          if ((unint64_t)(v10 - v8) >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          else
            v21 = 0;
          v22 = (char *)(v20 + 4 * v18);
          *(_DWORD *)v22 = v17;
          v23 = v22 + 4;
          while (v14 != v8)
          {
            v24 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }
          v10 = (char *)(v20 + 4 * v21);
          if (v8)
            operator delete(v8);
          v8 = v22;
          v14 = v23;
          v7 = a3;
        }
        else
        {
          *(_DWORD *)v14 = v16;
          v14 += 4;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  v25 = v71;
  v26 = v14 - v8;
  if (v14 == v8)
    v27 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>> const&)::t;
  else
    v27 = v8;
  v28 = v26 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v8 == v14)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    v30 = v28;
    do
    {
      v31 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
    v25 = v71;
  }
  v70 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v28);
  -[QSSShortcutFuzzyMatchRequest request_id](v25, "request_id");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
    v32 = &stru_24E246F88;
  v34 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v32), "UTF8String");
  v35 = strlen(v34);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  -[QSSShortcutFuzzyMatchRequest session_id](v25, "session_id");
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36)
    v36 = &stru_24E246F88;
  v38 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v36), "UTF8String");
  v39 = strlen(v38);
  v40 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v38, v39);

  -[QSSShortcutFuzzyMatchRequest interaction_id](v25, "interaction_id");
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (!v41)
    v41 = &stru_24E246F88;
  v43 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v41), "UTF8String");
  v44 = strlen(v43);
  v45 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v43, v44);

  -[QSSShortcutFuzzyMatchRequest locale](v25, "locale");
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
    v46 = &stru_24E246F88;
  v48 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v46), "UTF8String");
  v49 = strlen(v48);
  v50 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v48, v49);

  -[QSSShortcutFuzzyMatchRequest device_type](v25, "device_type");
  v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (!v51)
    v51 = &stru_24E246F88;
  v53 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v51), "UTF8String");
  v54 = strlen(v53);
  v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v53, v54);

  -[QSSShortcutFuzzyMatchRequest context](v25, "context");
  v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (!v56)
    v56 = &stru_24E246F88;
  v58 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v56), "UTF8String");
  v59 = strlen(v58);
  v60 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v58, v59);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v61 = *((_DWORD *)a3 + 8);
  v62 = *((_DWORD *)a3 + 12);
  v63 = *((_DWORD *)a3 + 10);
  if (v69)
  {
    v64 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v69);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v64);
  }
  if (v70)
  {
    v65 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v70);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v65);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v45);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v55);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v60);
  v66.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v61 - v62 + v63);
  if (v8)
    operator delete(v8);
  return v66;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest> v2;
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
  v2.var0 = -[QSSShortcutFuzzyMatchRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__QSSShortcutFuzzyMatchRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__44__QSSShortcutFuzzyMatchRequest_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__60__QSSShortcutFuzzyMatchRequest_StringTokenPair_flatbuffData__block_invoke(uint64_t a1)
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
