@implementation FTShortcutFuzzyMatchRequest

- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3
{
  return -[FTShortcutFuzzyMatchRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTShortcutFuzzyMatchRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4
{
  return -[FTShortcutFuzzyMatchRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTShortcutFuzzyMatchRequest)initWithFlatbuffData:(id)a3 root:(const ShortcutFuzzyMatchRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTShortcutFuzzyMatchRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const ShortcutFuzzyMatchRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::ShortcutFuzzyMatchRequest *v19;
  FTShortcutFuzzyMatchRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTShortcutFuzzyMatchRequest;
  v10 = -[FTShortcutFuzzyMatchRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ShortcutFuzzyMatchRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ShortcutFuzzyMatchRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::ShortcutFuzzyMatchRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTShortcutFuzzyMatchRequest_StringTokenPair)utterance
{
  FTShortcutFuzzyMatchRequest_StringTokenPair *v3;
  FTShortcutFuzzyMatchRequest_StringTokenPair *v4;
  const ShortcutFuzzyMatchRequest *root;
  const ShortcutFuzzyMatchRequest *v6;
  uint64_t v7;
  const ShortcutFuzzyMatchRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("utterance"));
  v3 = (FTShortcutFuzzyMatchRequest_StringTokenPair *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTShortcutFuzzyMatchRequest_StringTokenPair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("utterance"));
  }
  return v3;
}

- (NSArray)shortcuts
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcuts"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__FTShortcutFuzzyMatchRequest_shortcuts__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTShortcutFuzzyMatchRequest shortcuts_enumerateObjectsUsingBlock:](self, "shortcuts_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("shortcuts"));

  }
  return (NSArray *)v3;
}

uint64_t __40__FTShortcutFuzzyMatchRequest_shortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)shortcuts_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTShortcutFuzzyMatchRequest_StringTokenPair *v7;
  FTShortcutFuzzyMatchRequest_StringTokenPair *v8;
  const ShortcutFuzzyMatchRequest *root;
  const ShortcutFuzzyMatchRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcuts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTShortcutFuzzyMatchRequest_StringTokenPair *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:]([FTShortcutFuzzyMatchRequest_StringTokenPair alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)shortcuts_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const ShortcutFuzzyMatchRequest *root;
  const ShortcutFuzzyMatchRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcuts"));
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
    if (*(unsigned __int16 *)v7->var0 >= 7u && (v8 = *(unsigned __int16 *)v7[6].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)shortcuts_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTShortcutFuzzyMatchRequest_StringTokenPair *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const ShortcutFuzzyMatchRequest *root;
  const ShortcutFuzzyMatchRequest *v8;
  uint64_t v9;
  const ShortcutFuzzyMatchRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTShortcutFuzzyMatchRequest_StringTokenPair *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTShortcutFuzzyMatchRequest_StringTokenPair *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("shortcuts"));
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
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      v9 = *(unsigned __int16 *)v8[6].var0;
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
            v17 = -[FTShortcutFuzzyMatchRequest_StringTokenPair initWithFlatbuffData:root:verify:]([FTShortcutFuzzyMatchRequest_StringTokenPair alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  std::vector<int>::pointer end;
  int *v14;
  std::vector<int>::pointer begin;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  char *v20;
  int *v21;
  int v22;
  std::vector<int>::pointer v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  const char *v27;
  size_t v28;
  int String;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  size_t v33;
  int v34;
  __CFString *v35;
  __CFString *v36;
  const char *v37;
  size_t v38;
  int v39;
  __CFString *v40;
  __CFString *v41;
  const char *v42;
  size_t v43;
  int v44;
  __CFString *v45;
  __CFString *v46;
  const char *v47;
  size_t v48;
  int v49;
  __CFString *v50;
  __CFString *v51;
  const char *v52;
  size_t v53;
  int v54;
  int v55;
  Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest> v56;
  int v58;
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  std::vector<int> v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  -[FTShortcutFuzzyMatchRequest utterance](self, "utterance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  memset(&v65, 0, sizeof(v65));
  -[FTShortcutFuzzyMatchRequest shortcuts](self, "shortcuts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v5;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v65, objc_msgSend(v6, "count"));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[FTShortcutFuzzyMatchRequest shortcuts](self, "shortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(v7);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v12 = v11;
        end = v65.__end_;
        if (v65.__end_ >= v65.__end_cap_.__value_)
        {
          begin = v65.__begin_;
          v16 = v65.__end_ - v65.__begin_;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v18 = (char *)v65.__end_cap_.__value_ - (char *)v65.__begin_;
          if (((char *)v65.__end_cap_.__value_ - (char *)v65.__begin_) >> 1 > v17)
            v17 = v18 >> 1;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          if (v19)
          {
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v65.__end_cap_, v19);
            begin = v65.__begin_;
            end = v65.__end_;
          }
          else
          {
            v20 = 0;
          }
          v21 = (int *)&v20[4 * v16];
          *v21 = v12;
          v14 = v21 + 1;
          while (end != begin)
          {
            v22 = *--end;
            *--v21 = v22;
          }
          v65.__begin_ = v21;
          v65.__end_ = v14;
          v65.__end_cap_.__value_ = (int *)&v20[4 * v19];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v65.__end_ = v11;
          v14 = end + 1;
        }
        v65.__end_ = v14;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v8);
  }

  if (v65.__end_ == v65.__begin_)
    v23 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ShortcutFuzzyMatchRequest_::StringTokenPair>> const&)::t;
  else
    v23 = v65.__begin_;
  v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, v65.__end_ - v65.__begin_);
  -[FTShortcutFuzzyMatchRequest request_id](self, "request_id");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_251A15610;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  -[FTShortcutFuzzyMatchRequest session_id](self, "session_id");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
    v30 = &stru_251A15610;
  v32 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v30), "UTF8String");
  v33 = strlen(v32);
  v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32, v33);

  -[FTShortcutFuzzyMatchRequest interaction_id](self, "interaction_id");
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
    v35 = &stru_251A15610;
  v37 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v35), "UTF8String");
  v38 = strlen(v37);
  v39 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v37, v38);

  -[FTShortcutFuzzyMatchRequest locale](self, "locale");
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
    v40 = &stru_251A15610;
  v42 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v40), "UTF8String");
  v43 = strlen(v42);
  v44 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42, v43);

  -[FTShortcutFuzzyMatchRequest device_type](self, "device_type");
  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (!v45)
    v45 = &stru_251A15610;
  v47 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v45), "UTF8String");
  v48 = strlen(v47);
  v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);

  -[FTShortcutFuzzyMatchRequest context](self, "context");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (!v50)
    v50 = &stru_251A15610;
  v52 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v50), "UTF8String");
  v53 = strlen(v52);
  LODWORD(v52) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v52, v53);

  *((_BYTE *)a3 + 70) = 1;
  v60 = *((_DWORD *)a3 + 8);
  v54 = *((_DWORD *)a3 + 12);
  v55 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v34);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v39);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, (int)v52);
  v56.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v60 - (unsigned __int16)v54 + v55);
  if (v65.__begin_)
  {
    v65.__end_ = v65.__begin_;
    operator delete(v65.__begin_);
  }
  return v56;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTShortcutFuzzyMatchRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __43__FTShortcutFuzzyMatchRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTShortcutFuzzyMatchRequest_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __53__FTShortcutFuzzyMatchRequest_StringTokenPair_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

apple::aiml::flatbuffers2::DetachedBuffer *__59__FTShortcutFuzzyMatchRequest_StringTokenPair_flatbuffData__block_invoke(uint64_t a1)
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

@end
