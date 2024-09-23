@implementation FTRecoverPronsResponse

- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3
{
  return -[FTRecoverPronsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTRecoverPronsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4
{
  return -[FTRecoverPronsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTRecoverPronsResponse)initWithFlatbuffData:(id)a3 root:(const RecoverPronsResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTRecoverPronsResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const RecoverPronsResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::RecoverPronsResponse *v19;
  FTRecoverPronsResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTRecoverPronsResponse;
  v10 = -[FTRecoverPronsResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const RecoverPronsResponse *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_13;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_14;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v22[0] = v17;
  v22[1] = v18;
  v23 = xmmword_249338830;
  v24 = 0;
  v25 = 1;
  v19 = (siri::speech::schema_fb::RecoverPronsResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::RecoverPronsResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const RecoverPronsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsResponse *v6;

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
  const RecoverPronsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsResponse *v6;

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
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v3;
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
  const RecoverPronsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsResponse *v6;

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

- (NSArray)recovery_return_codes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recovery_return_codes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__FTRecoverPronsResponse_recovery_return_codes__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRecoverPronsResponse recovery_return_codes_enumerateObjectsUsingBlock:](self, "recovery_return_codes_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("recovery_return_codes"));

  }
  return (NSArray *)v3;
}

uint64_t __47__FTRecoverPronsResponse_recovery_return_codes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)recovery_return_codes_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v10;
  uint64_t v11;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recovery_return_codes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xDu || (v11 = *(unsigned __int16 *)v10[12].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)root[4 * a3 + 4 + v11 + *(unsigned int *)root[v11].var0].var0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (unint64_t)recovery_return_codes_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recovery_return_codes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
  }
  else
  {
    root = self->_root;
    v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (v8 = *(unsigned __int16 *)v7[12].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)recovery_return_codes_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  unsigned __int8 v18;

  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("recovery_return_codes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);
  }
  else
  {
    root = self->_root;
    v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      v9 = *(unsigned __int16 *)v8[12].var0;
      if (v9)
      {
        v18 = 0;
        v10 = *(unsigned int *)root[v9].var0;
        v11 = *(unsigned int *)root[v9 + v10].var0;
        if ((_DWORD)v11)
        {
          v12 = 0;
          v13 = 4 * v11 - 4;
          v14 = (uint64_t)&root[v9 + 4 + v10];
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v14 + 4 * v12));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v15, v12, &v18);
            v16 = v18;

            if (v16)
              break;
            ++v12;
            v17 = v13;
            v13 -= 4;
          }
          while (v17);
        }
      }
    }
  }

}

- (NSArray)voc_tokens
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_tokens"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__FTRecoverPronsResponse_voc_tokens__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRecoverPronsResponse voc_tokens_enumerateObjectsUsingBlock:](self, "voc_tokens_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("voc_tokens"));

  }
  return (NSArray *)v3;
}

uint64_t __36__FTRecoverPronsResponse_voc_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)voc_tokens_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTVocToken *v7;
  FTVocToken *v8;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTVocToken *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xFu || (v11 = *(unsigned __int16 *)v10[14].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTVocToken initWithFlatbuffData:root:verify:]([FTVocToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)voc_tokens_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_tokens"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
  }
  else
  {
    root = self->_root;
    v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (v8 = *(unsigned __int16 *)v7[14].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)voc_tokens_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTVocToken *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RecoverPronsResponse *root;
  const RecoverPronsResponse *v8;
  uint64_t v9;
  const RecoverPronsResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTVocToken *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTVocToken *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);
  }
  else
  {
    root = self->_root;
    v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      v9 = *(unsigned __int16 *)v8[14].var0;
      if (v9)
      {
        v20 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = (uint64_t)&v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 0;
          v16 = 4 * v12 - 4;
          do
          {
            v17 = -[FTVocToken initWithFlatbuffData:root:verify:]([FTVocToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
            v4[2](v4, v17, v15, &v20);
            v18 = v20;

            if (v18)
              break;
            ++v15;
            v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }

}

- (Offset<siri::speech::schema_fb::RecoverPronsResponse>)addObjectToBuffer:(void *)a3
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
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int v22;
  int v23;
  std::vector<int>::pointer end;
  int *v25;
  std::vector<int>::pointer begin;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  char *v31;
  int *v32;
  int v33;
  const unsigned __int8 *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  int v41;
  int v42;
  std::vector<int>::pointer v43;
  int *v44;
  std::vector<int>::pointer v45;
  int64_t v46;
  unint64_t v47;
  int64_t v48;
  unint64_t v49;
  char *v50;
  int *v51;
  int v52;
  std::vector<int>::pointer v53;
  int v54;
  int v55;
  int v56;
  int v57;
  Offset<siri::speech::schema_fb::RecoverPronsResponse> v58;
  int v60;
  int v61;
  int v62;
  int String;
  FTRecoverPronsResponse *v64;
  int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  std::vector<int> v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  std::vector<int> v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  -[FTRecoverPronsResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTRecoverPronsResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  v61 = -[FTRecoverPronsResponse error_code](self, "error_code");
  -[FTRecoverPronsResponse error_str](self, "error_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  memset(&v75, 0, sizeof(v75));
  -[FTRecoverPronsResponse recovery_return_codes](self, "recovery_return_codes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v75, objc_msgSend(v17, "count"));

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[FTRecoverPronsResponse recovery_return_codes](self, "recovery_return_codes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = self;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v72 != v20)
          objc_enumerationMutation(v18);
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "intValue");
        v23 = v22;
        end = v75.__end_;
        if (v75.__end_ >= v75.__end_cap_.__value_)
        {
          begin = v75.__begin_;
          v27 = v75.__end_ - v75.__begin_;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v29 = (char *)v75.__end_cap_.__value_ - (char *)v75.__begin_;
          if (((char *)v75.__end_cap_.__value_ - (char *)v75.__begin_) >> 1 > v28)
            v28 = v29 >> 1;
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL)
            v30 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v30 = v28;
          if (v30)
          {
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v75.__end_cap_, v30);
            begin = v75.__begin_;
            end = v75.__end_;
          }
          else
          {
            v31 = 0;
          }
          v32 = (int *)&v31[4 * v27];
          *v32 = v23;
          v25 = v32 + 1;
          while (end != begin)
          {
            v33 = *--end;
            *--v32 = v33;
          }
          v75.__begin_ = v32;
          v75.__end_ = v25;
          v75.__end_cap_.__value_ = (int *)&v31[4 * v30];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v75.__end_ = v22;
          v25 = end + 1;
        }
        v75.__end_ = v25;
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v19);
  }

  if (v75.__end_ == v75.__begin_)
    v34 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  else
    v34 = (const unsigned __int8 *)v75.__begin_;
  v35 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v34, v75.__end_ - v75.__begin_);
  memset(&v70, 0, sizeof(v70));
  -[FTRecoverPronsResponse voc_tokens](v64, "voc_tokens");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v70, objc_msgSend(v36, "count"));

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[FTRecoverPronsResponse voc_tokens](v64, "voc_tokens");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v35;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v67 != v39)
          objc_enumerationMutation(v37);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v42 = v41;
        v43 = v70.__end_;
        if (v70.__end_ >= v70.__end_cap_.__value_)
        {
          v45 = v70.__begin_;
          v46 = v70.__end_ - v70.__begin_;
          v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v48 = (char *)v70.__end_cap_.__value_ - (char *)v70.__begin_;
          if (((char *)v70.__end_cap_.__value_ - (char *)v70.__begin_) >> 1 > v47)
            v47 = v48 >> 1;
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL)
            v49 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v49 = v47;
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v70.__end_cap_, v49);
            v45 = v70.__begin_;
            v43 = v70.__end_;
          }
          else
          {
            v50 = 0;
          }
          v51 = (int *)&v50[4 * v46];
          *v51 = v42;
          v44 = v51 + 1;
          while (v43 != v45)
          {
            v52 = *--v43;
            *--v51 = v52;
          }
          v70.__begin_ = v51;
          v70.__end_ = v44;
          v70.__end_cap_.__value_ = (int *)&v50[4 * v49];
          if (v45)
            operator delete(v45);
        }
        else
        {
          *v70.__end_ = v41;
          v44 = v43 + 1;
        }
        v70.__end_ = v44;
      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v38);
  }

  if (v70.__end_ == v70.__begin_)
    v53 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::VocToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::VocToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::VocToken>> const&)::t;
  else
    v53 = v70.__begin_;
  v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v53, v70.__end_ - v70.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v55 = *((_DWORD *)a3 + 8);
  v56 = *((_DWORD *)a3 + 12);
  v57 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v61, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v54);
  v58.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v55 - (unsigned __int16)v56 + v57);
  if (v70.__begin_)
  {
    v70.__end_ = v70.__begin_;
    operator delete(v70.__begin_);
  }
  if (v75.__begin_)
  {
    v75.__end_ = v75.__begin_;
    operator delete(v75.__begin_);
  }
  return v58;
}

- (id)flatbuffData
{
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_249338840;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTRecoverPronsResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
  v2 = operator new();
  v3 = v12;
  v4 = v14;
  v5 = v15;
  v6 = (v14 + DWORD2(v14) - v15);
  *(_QWORD *)v2 = v11;
  *(_BYTE *)(v2 + 8) = v3;
  *(_QWORD *)(v2 + 16) = *((_QWORD *)&v4 + 1);
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v6;
  if (v3)
  {
    v11 = 0;
    v12 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__FTRecoverPronsResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FTRecoverPronsResponse_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2495AE51CLL);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
