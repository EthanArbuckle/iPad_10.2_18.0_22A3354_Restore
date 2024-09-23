@implementation QSSTokenProns

- (QSSTokenProns)initWithFlatbuffData:(id)a3
{
  return -[QSSTokenProns initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTokenProns initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4
{
  return -[QSSTokenProns initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTokenProns *v10;
  QSSTokenProns *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TokenProns *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTokenProns *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTokenProns;
  v10 = -[QSSTokenProns init](&v30, sel_init);
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
      a4 = (const TokenProns *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TokenProns *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TokenProns::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)orthography
{
  const TokenProns *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TokenProns *v6;

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

- (NSArray)sanitized_sequences
{
  void *v3;
  const TokenProns *root;
  const TokenProns *v5;
  uint64_t v6;
  const TokenProns *v7;
  uint64_t v8;
  uint64_t v9;
  const TokenProns *v10;
  uint64_t v11;
  QSSTokenProns_SanitizedSequence *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("sanitized_sequences"));
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
            v12 = -[QSSTokenProns_SanitizedSequence initWithFlatbuffData:root:verify:]([QSSTokenProns_SanitizedSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("sanitized_sequences"));
  }
  return (NSArray *)v3;
}

- (NSArray)prons
{
  void *v3;
  const TokenProns *root;
  const TokenProns *v5;
  uint64_t v6;
  const TokenProns *v7;
  uint64_t v8;
  uint64_t v9;
  const TokenProns *v10;
  uint64_t v11;
  QSSPronChoice *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prons"));
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
            v12 = -[QSSPronChoice initWithFlatbuffData:root:verify:]([QSSPronChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prons"));
  }
  return (NSArray *)v3;
}

- (NSArray)normalized_prons
{
  void *v3;
  const TokenProns *root;
  const TokenProns *v5;
  uint64_t v6;
  const TokenProns *v7;
  uint64_t v8;
  uint64_t v9;
  const TokenProns *v10;
  uint64_t v11;
  QSSPronChoice *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_prons"));
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
            v12 = -[QSSPronChoice initWithFlatbuffData:root:verify:]([QSSPronChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("normalized_prons"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::TokenProns>)addObjectToBuffer:(void *)a3
{
  __CFString *v3;
  __CFString *v4;
  const char *v5;
  size_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t i;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int *begin;
  uint64_t v37;
  int *value;
  uint64_t j;
  int v40;
  int v41;
  std::vector<int>::pointer end;
  int *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int *v48;
  int v49;
  int *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  int *v54;
  int *v55;
  uint64_t k;
  int v57;
  int v58;
  std::vector<int>::pointer v59;
  int *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  int *v65;
  int v66;
  int *v67;
  unsigned int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  Offset<siri::speech::schema_fb::TokenProns> v73;
  unsigned int v75;
  unsigned int String;
  unsigned int v77;
  id obj;
  id obja;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  std::vector<int> v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  std::vector<int> v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  -[QSSTokenProns orthography](self, "orthography");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24E246F88;
  v5 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String");
  v6 = strlen(v5);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v5, v6);

  -[QSSTokenProns sanitized_sequences](self, "sanitized_sequences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = a3;
  if (v8)
  {
    if (v8 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v8);
    v12 = &v10[4 * v11];
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[QSSTokenProns sanitized_sequences](self, "sanitized_sequences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v93;
    v16 = v10;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v93 != v15)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i), "addObjectToBuffer:", v9);
        v19 = v18;
        if (v16 >= v12)
        {
          v20 = (v16 - v10) >> 2;
          v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v12 - v10) >> 1 > v21)
            v21 = (v12 - v10) >> 1;
          if ((unint64_t)(v12 - v10) >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v21;
          if (v22)
            v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v22);
          else
            v23 = 0;
          v24 = (char *)(v22 + 4 * v20);
          *(_DWORD *)v24 = v19;
          v25 = v24 + 4;
          if (v16 == v10)
          {
            v9 = a3;
          }
          else
          {
            v9 = a3;
            do
            {
              v26 = *((_DWORD *)v16 - 1);
              v16 -= 4;
              *((_DWORD *)v24 - 1) = v26;
              v24 -= 4;
            }
            while (v16 != v10);
          }
          v12 = (char *)(v22 + 4 * v23);
          if (v10)
            operator delete(v10);
          v10 = v24;
          v16 = v25;
        }
        else
        {
          *(_DWORD *)v16 = v18;
          v16 += 4;
          v9 = a3;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
    }
    while (v14);
  }
  else
  {
    v16 = v10;
  }

  v27 = v16 - v10;
  if (v16 == v10)
    v28 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>> const&)::t;
  else
    v28 = v10;
  v29 = v27 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v27 >> 2, 4uLL);
  if (v10 == v16)
  {
    LODWORD(v29) = 0;
  }
  else
  {
    v30 = v28 - 4;
    v31 = v29;
    do
    {
      v32 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v30[4 * v31]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v32);
      --v31;
    }
    while (v31);
  }
  v77 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v29);
  memset(&v91, 0, sizeof(v91));
  -[QSSTokenProns prons](self, "prons");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v91, objc_msgSend(v33, "count"));

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  -[QSSTokenProns prons](self, "prons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = a3;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  begin = v91.__begin_;
  if (v35)
  {
    v37 = *(_QWORD *)v88;
    value = v91.__end_cap_.__value_;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v88 != v37)
          objc_enumerationMutation(obj);
        v40 = objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "addObjectToBuffer:", v34);
        v41 = v40;
        end = v91.__end_;
        if (v91.__end_ >= value)
        {
          v44 = v91.__end_ - begin;
          v45 = v44 + 1;
          if ((unint64_t)(v44 + 1) >> 62)
          {
            v91.__end_cap_.__value_ = value;
            v91.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v45)
            v45 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v46 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v46 = v45;
          if (v46)
            v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v46);
          else
            v47 = 0;
          v48 = (int *)(v46 + 4 * v44);
          *v48 = v41;
          v43 = v48 + 1;
          while (end != begin)
          {
            v49 = *--end;
            *--v48 = v49;
          }
          value = (int *)(v46 + 4 * v47);
          v91.__end_ = v43;
          if (begin)
            operator delete(begin);
          begin = v48;
          v34 = a3;
        }
        else
        {
          *v91.__end_ = v40;
          v43 = end + 1;
        }
        v91.__end_ = v43;
      }
      v91.__end_cap_.__value_ = value;
      v91.__begin_ = begin;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    }
    while (v35);
  }
  else
  {
    v43 = v91.__end_;
  }

  if (v43 == begin)
    v50 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  else
    v50 = begin;
  v75 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v50, v43 - begin);
  memset(&v86, 0, sizeof(v86));
  -[QSSTokenProns normalized_prons](self, "normalized_prons");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v86, objc_msgSend(v51, "count"));

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[QSSTokenProns normalized_prons](self, "normalized_prons");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
  v54 = v86.__begin_;
  if (v53)
  {
    obja = *(id *)v83;
    v55 = v86.__end_cap_.__value_;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(id *)v83 != obja)
          objc_enumerationMutation(v52);
        v57 = objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v58 = v57;
        v59 = v86.__end_;
        if (v86.__end_ >= v55)
        {
          v61 = v86.__end_ - v54;
          v62 = v61 + 1;
          if ((unint64_t)(v61 + 1) >> 62)
          {
            v86.__end_cap_.__value_ = v55;
            v86.__begin_ = v54;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)v55 - (char *)v54) >> 1 > v62)
            v62 = ((char *)v55 - (char *)v54) >> 1;
          if ((unint64_t)((char *)v55 - (char *)v54) >= 0x7FFFFFFFFFFFFFFCLL)
            v63 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v63 = v62;
          if (v63)
            v63 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v63);
          else
            v64 = 0;
          v65 = (int *)(v63 + 4 * v61);
          *v65 = v58;
          v60 = v65 + 1;
          while (v59 != v54)
          {
            v66 = *--v59;
            *--v65 = v66;
          }
          v55 = (int *)(v63 + 4 * v64);
          v86.__end_ = v60;
          if (v54)
            operator delete(v54);
          v54 = v65;
        }
        else
        {
          *v86.__end_ = v57;
          v60 = v59 + 1;
        }
        v86.__end_ = v60;
      }
      v86.__end_cap_.__value_ = v55;
      v86.__begin_ = v54;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    }
    while (v53);
  }
  else
  {
    v60 = v86.__end_;
  }

  if (v60 == v54)
    v67 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  else
    v67 = v54;
  v68 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v67, v60 - v54);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v69 = *((_DWORD *)a3 + 8);
  v70 = *((_DWORD *)a3 + 12);
  v71 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  if (v77)
  {
    v72 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v77);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v72);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v75);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v68);
  v73.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v69 - v70 + v71);
  if (v54)
  {
    v86.__end_ = v54;
    operator delete(v54);
  }
  if (v91.__begin_)
    operator delete(v91.__begin_);
  if (v10)
    operator delete(v10);
  return v73;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TokenProns> v2;
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
  v2.var0 = -[QSSTokenProns addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __29__QSSTokenProns_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__29__QSSTokenProns_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__47__QSSTokenProns_SanitizedSequence_flatbuffData__block_invoke(uint64_t a1)
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
