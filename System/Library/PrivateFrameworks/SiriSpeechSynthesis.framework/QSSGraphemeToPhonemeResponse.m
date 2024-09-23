@implementation QSSGraphemeToPhonemeResponse

- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSGraphemeToPhonemeResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSGraphemeToPhonemeResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4
{
  return -[QSSGraphemeToPhonemeResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSGraphemeToPhonemeResponse *v10;
  QSSGraphemeToPhonemeResponse *v11;
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
  unsigned int v25;
  const unsigned __int8 *v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 *v30;
  unsigned int v31;
  const unsigned __int8 *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  const unsigned __int8 *v35;
  unsigned __int16 *v36;
  uint64_t v37;
  const unsigned __int8 *v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _DWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSMutableDictionary *storage;
  QSSGraphemeToPhonemeResponse *v47;
  uint64_t v49;
  unint64_t v50;
  __int128 v51;
  uint64_t v52;
  char v53;
  objc_super v54;

  v5 = a5;
  v9 = a3;
  v54.receiver = self;
  v54.super_class = (Class)QSSGraphemeToPhonemeResponse;
  v10 = -[QSSGraphemeToPhonemeResponse init](&v54, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_81;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_82;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const GraphemeToPhonemeResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_80;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_82;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v49 = v18;
  v50 = v19;
  v51 = xmmword_21E34D540;
  v52 = 0;
  v53 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_80;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v49, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 4u))
  {
    goto LABEL_82;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v23))
    goto LABEL_82;
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  v25 = *v24;
  if (v25 >= 7 && v24[3] && (v50 < 5 || v50 - 4 < (unint64_t)root + v24[3] - v49))
    goto LABEL_82;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 8u))
    goto LABEL_82;
  v26 = v25 >= 9 && v24[4] ? (const unsigned __int8 *)root + v24[4] + *(unsigned int *)((char *)root + v24[4]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0xAu))
  {
    goto LABEL_82;
  }
  v27 = 0;
  v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) >= 0xBu)
  {
    if (!*(_WORD *)((char *)root - v28 + 10))
      goto LABEL_35;
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v49, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 10)), 4uLL, 0))goto LABEL_82;
    v27 = 0;
    v28 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v28) >= 0xBu)
    {
LABEL_35:
      v29 = *(unsigned __int16 *)((char *)root - v28 + 10);
      if (v29)
        v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
      else
        v27 = 0;
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v49, v27))
    goto LABEL_82;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  v31 = *v30;
  if (v31 >= 0xD && v30[6] && (v50 < 2 || v50 - 1 < (unint64_t)root + v30[6] - v49))
    goto LABEL_82;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0xEu))
    goto LABEL_82;
  v32 = v31 >= 0xF && v30[7] ? (const unsigned __int8 *)root + v30[7] + *(unsigned int *)((char *)root + v30[7]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x10u))
  {
    goto LABEL_82;
  }
  v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0x11u && (v34 = v33[8]) != 0)
    v35 = (const unsigned __int8 *)root + v34 + *(unsigned int *)((char *)root + v34);
  else
    v35 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v35)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x12u))
  {
    goto LABEL_82;
  }
  v36 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v36 >= 0x13u && (v37 = v36[9]) != 0)
    v38 = (const unsigned __int8 *)root + v37 + *(unsigned int *)((char *)root + v37);
  else
    v38 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v49, v38)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x14u))
  {
    goto LABEL_82;
  }
  v39 = 0;
  v40 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v40) >= 0x15u)
  {
    if (!*(_WORD *)((char *)root - v40 + 20))
      goto LABEL_67;
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v49, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v40 + 20)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v40 + 20)), 4uLL, 0))goto LABEL_82;
    v39 = 0;
    v40 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v40) >= 0x15u)
    {
LABEL_67:
      v41 = *(unsigned __int16 *)((char *)root - v40 + 20);
      if (v41)
        v39 = (_DWORD *)((char *)root + v41 + *(unsigned int *)((char *)root + v41));
      else
        v39 = 0;
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TokenProns>((flatbuffers::Verifier *)&v49, v39)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v49, 0x16u))
  {
    goto LABEL_82;
  }
  v42 = 0;
  v43 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v43) >= 0x17u)
  {
    if (!*(_WORD *)((char *)root - v43 + 22))
    {
LABEL_76:
      v44 = *(unsigned __int16 *)((char *)root - v43 + 22);
      if (v44)
        v42 = (_DWORD *)((char *)root + v44 + *(unsigned int *)((char *)root + v44));
      else
        v42 = 0;
      goto LABEL_79;
    }
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v49, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v43 + 22)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v43 + 22)), 4uLL, 0))
    {
      v42 = 0;
      v43 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v43) < 0x17u)
        goto LABEL_79;
      goto LABEL_76;
    }
LABEL_82:
    v47 = 0;
    goto LABEL_83;
  }
LABEL_79:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TokenProns>((flatbuffers::Verifier *)&v49, v42))goto LABEL_82;
LABEL_80:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v49);
  v45 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v45;

LABEL_81:
  v47 = v11;
LABEL_83:

  return v47;
}

- (NSString)session_id
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (int)return_code
{
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSArray)phonemes
{
  void *v3;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v5;
  uint64_t v6;
  const GraphemeToPhonemeResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
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
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("phonemes"));
  }
  return (NSArray *)v3;
}

- (BOOL)is_pron_guessed
{
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)g2p_version
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSString)g2p_model_version
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSString)phoneset_version
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSArray)aot_token_prons
{
  void *v3;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v5;
  uint64_t v6;
  const GraphemeToPhonemeResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  QSSTokenProns *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("aot_token_prons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x15u)
    {
      v6 = *(unsigned __int16 *)v5[20].var0;
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
            v12 = -[QSSTokenProns initWithFlatbuffData:root:verify:]([QSSTokenProns alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("aot_token_prons"));
  }
  return (NSArray *)v3;
}

- (NSArray)jit_token_prons
{
  void *v3;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v5;
  uint64_t v6;
  const GraphemeToPhonemeResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  QSSTokenProns *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("jit_token_prons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x17u)
    {
      v6 = *(unsigned __int16 *)v5[22].var0;
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
            v12 = -[QSSTokenProns initWithFlatbuffData:root:verify:]([QSSTokenProns alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("jit_token_prons"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v3;
  __CFString *v4;
  const char *v5;
  size_t v6;
  __CFString *v7;
  __CFString *v8;
  const char *v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int *begin;
  uint64_t v16;
  int *value;
  uint64_t i;
  const char *v19;
  size_t v20;
  int v21;
  int v22;
  std::vector<int>::pointer end;
  int *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int *v29;
  int v30;
  int *v31;
  __CFString *v32;
  __CFString *v33;
  const char *v34;
  size_t v35;
  __CFString *v36;
  __CFString *v37;
  const char *v38;
  size_t v39;
  __CFString *v40;
  __CFString *v41;
  const char *v42;
  size_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  int *v49;
  uint64_t j;
  int v51;
  int v52;
  std::vector<int>::pointer v53;
  int *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int *v59;
  int v60;
  int *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  int *v67;
  uint64_t k;
  int v69;
  int v70;
  std::vector<int>::pointer v71;
  int *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  int *v77;
  int v78;
  int *v79;
  unsigned int v80;
  int v81;
  int v82;
  int v83;
  Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse> v84;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  int v93;
  unsigned int String;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  std::vector<int> v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  std::vector<int> v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  std::vector<int> v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  -[QSSGraphemeToPhonemeResponse session_id](self, "session_id");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24E246F88;
  v5 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String");
  v6 = strlen(v5);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v5, v6);

  v93 = -[QSSGraphemeToPhonemeResponse return_code](self, "return_code");
  -[QSSGraphemeToPhonemeResponse return_str](self, "return_str");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_24E246F88;
  v9 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
  v10 = strlen(v9);
  LODWORD(v9) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v9, v10);

  memset(&v111, 0, sizeof(v111));
  -[QSSGraphemeToPhonemeResponse phonemes](self, "phonemes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, objc_msgSend(v11, "count"));

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  -[QSSGraphemeToPhonemeResponse phonemes](self, "phonemes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
  v14 = v12;
  v92 = v9;
  begin = v111.__begin_;
  if (v13)
  {
    v16 = *(_QWORD *)v108;
    value = v111.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v108 != v16)
          objc_enumerationMutation(v14);
        v19 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i)), "UTF8String");
        v20 = strlen(v19);
        v21 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v19, v20);
        v22 = v21;
        end = v111.__end_;
        if (v111.__end_ >= value)
        {
          v25 = v111.__end_ - begin;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62)
          {
            v111.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v26)
            v26 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v26;
          if (v27)
            v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          else
            v28 = 0;
          v29 = (int *)(v27 + 4 * v25);
          *v29 = v22;
          v24 = v29 + 1;
          while (end != begin)
          {
            v30 = *--end;
            *--v29 = v30;
          }
          value = (int *)(v27 + 4 * v28);
          v111.__end_ = v24;
          if (begin)
            operator delete(begin);
          begin = v29;
        }
        else
        {
          *v111.__end_ = v21;
          v24 = end + 1;
        }
        v111.__end_ = v24;
      }
      v111.__end_cap_.__value_ = value;
      v111.__begin_ = begin;
      v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
    }
    while (v13);
  }
  else
  {
    v24 = v111.__end_;
  }

  if (v24 == begin)
    v31 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v31 = begin;
  v91 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v31, v24 - begin);
  v90 = -[QSSGraphemeToPhonemeResponse is_pron_guessed](self, "is_pron_guessed");
  -[QSSGraphemeToPhonemeResponse g2p_version](self, "g2p_version");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
    v32 = &stru_24E246F88;
  v34 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v32), "UTF8String");
  v35 = strlen(v34);
  v89 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v34, v35);

  -[QSSGraphemeToPhonemeResponse g2p_model_version](self, "g2p_model_version");
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36)
    v36 = &stru_24E246F88;
  v38 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v36), "UTF8String");
  v39 = strlen(v38);
  v88 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v38, v39);

  -[QSSGraphemeToPhonemeResponse phoneset_version](self, "phoneset_version");
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
    v40 = &stru_24E246F88;
  v42 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v40), "UTF8String");
  v43 = strlen(v42);
  v87 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v42, v43);

  memset(&v106, 0, sizeof(v106));
  -[QSSGraphemeToPhonemeResponse aot_token_prons](self, "aot_token_prons");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v106, objc_msgSend(v44, "count"));

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  -[QSSGraphemeToPhonemeResponse aot_token_prons](self, "aot_token_prons");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
  v47 = v106.__begin_;
  if (v46)
  {
    v48 = *(_QWORD *)v103;
    v49 = v106.__end_cap_.__value_;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v103 != v48)
          objc_enumerationMutation(v45);
        v51 = objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v52 = v51;
        v53 = v106.__end_;
        if (v106.__end_ >= v49)
        {
          v55 = v106.__end_ - v47;
          v56 = v55 + 1;
          if ((unint64_t)(v55 + 1) >> 62)
          {
            v106.__begin_ = v47;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v49 - (char *)v47) >> 1 > v56)
            v56 = ((char *)v49 - (char *)v47) >> 1;
          if ((unint64_t)((char *)v49 - (char *)v47) >= 0x7FFFFFFFFFFFFFFCLL)
            v57 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v57 = v56;
          if (v57)
            v57 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v57);
          else
            v58 = 0;
          v59 = (int *)(v57 + 4 * v55);
          *v59 = v52;
          v54 = v59 + 1;
          while (v53 != v47)
          {
            v60 = *--v53;
            *--v59 = v60;
          }
          v49 = (int *)(v57 + 4 * v58);
          v106.__end_ = v54;
          if (v47)
            operator delete(v47);
          v47 = v59;
        }
        else
        {
          *v106.__end_ = v51;
          v54 = v53 + 1;
        }
        v106.__end_ = v54;
      }
      v106.__end_cap_.__value_ = v49;
      v106.__begin_ = v47;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
    }
    while (v46);
  }
  else
  {
    v54 = v106.__end_;
  }

  if (v54 == v47)
    v61 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  else
    v61 = v47;
  v86 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v61, v54 - v47);
  memset(&v101, 0, sizeof(v101));
  -[QSSGraphemeToPhonemeResponse jit_token_prons](self, "jit_token_prons");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v101, objc_msgSend(v62, "count"));

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[QSSGraphemeToPhonemeResponse jit_token_prons](self, "jit_token_prons");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
  v65 = v101.__begin_;
  if (v64)
  {
    v66 = *(_QWORD *)v98;
    v67 = v101.__end_cap_.__value_;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v98 != v66)
          objc_enumerationMutation(v63);
        v69 = objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v70 = v69;
        v71 = v101.__end_;
        if (v101.__end_ >= v67)
        {
          v73 = v101.__end_ - v65;
          v74 = v73 + 1;
          if ((unint64_t)(v73 + 1) >> 62)
          {
            v101.__begin_ = v65;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v67 - (char *)v65) >> 1 > v74)
            v74 = ((char *)v67 - (char *)v65) >> 1;
          if ((unint64_t)((char *)v67 - (char *)v65) >= 0x7FFFFFFFFFFFFFFCLL)
            v75 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v75 = v74;
          if (v75)
            v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v75);
          else
            v76 = 0;
          v77 = (int *)(v75 + 4 * v73);
          *v77 = v70;
          v72 = v77 + 1;
          while (v71 != v65)
          {
            v78 = *--v71;
            *--v77 = v78;
          }
          v67 = (int *)(v75 + 4 * v76);
          v101.__end_ = v72;
          if (v65)
            operator delete(v65);
          v65 = v77;
        }
        else
        {
          *v101.__end_ = v69;
          v72 = v71 + 1;
        }
        v101.__end_ = v72;
      }
      v101.__end_cap_.__value_ = v67;
      v101.__begin_ = v65;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
    }
    while (v64);
  }
  else
  {
    v72 = v101.__end_;
  }

  if (v72 == v65)
    v79 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  else
    v79 = v65;
  v80 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v79, v72 - v65);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v81 = *((_DWORD *)a3 + 8);
  v82 = *((_DWORD *)a3 + 12);
  v83 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v93);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v92);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v91);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 12, v90);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v89);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, v88);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v87);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v86);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v80);
  v84.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v81 - v82 + v83);
  if (v65)
  {
    v101.__end_ = v65;
    operator delete(v65);
  }
  if (v106.__begin_)
    operator delete(v106.__begin_);
  if (v111.__begin_)
    operator delete(v111.__begin_);
  return v84;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse> v2;
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
  v2.var0 = -[QSSGraphemeToPhonemeResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__QSSGraphemeToPhonemeResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__44__QSSGraphemeToPhonemeResponse_flatbuffData__block_invoke(uint64_t a1)
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
