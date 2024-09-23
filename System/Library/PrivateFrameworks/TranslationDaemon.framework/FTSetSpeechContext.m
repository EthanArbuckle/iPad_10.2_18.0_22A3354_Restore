@implementation FTSetSpeechContext

- (FTSetSpeechContext)initWithFlatbuffData:(id)a3
{
  return -[FTSetSpeechContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTSetSpeechContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4
{
  return -[FTSetSpeechContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTSetSpeechContext *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SetSpeechContext *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::SetSpeechContext *v19;
  FTSetSpeechContext *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSetSpeechContext;
  v10 = -[FTSetSpeechContext init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SetSpeechContext *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SetSpeechContext *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::SetSpeechContext::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSArray)contextual_text
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTSetSpeechContext_contextual_text__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSetSpeechContext contextual_text_enumerateObjectsUsingBlock:](self, "contextual_text_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("contextual_text"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTSetSpeechContext_contextual_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)contextual_text_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const SetSpeechContext *root;
  const SetSpeechContext *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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
    if (*(unsigned __int16 *)v10->var0 < 5u || (v11 = *(unsigned __int16 *)v10[4].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13 + 1, *v13, 4);
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (unint64_t)contextual_text_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SetSpeechContext *root;
  const SetSpeechContext *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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
    if (*(unsigned __int16 *)v7->var0 >= 5u && (v8 = *(unsigned __int16 *)v7[4].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)contextual_text_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const SetSpeechContext *root;
  const SetSpeechContext *v8;
  uint64_t v9;
  const SetSpeechContext *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *var0;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        v19 = 0;
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        v11 = *(unsigned int *)v10->var0;
        if ((_DWORD)v11)
        {
          v12 = 4 - 4 * v11;
          v13 = 1;
          v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[v14 + *var0], *(unsigned int *)((char *)var0 + *var0), 4);
            v4[2](v4, v16, v13 - 1, &v19);
            v17 = v19;

            if (v17)
              break;
            v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }

}

- (NSString)left_context
{
  const SetSpeechContext *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SetSpeechContext *v6;

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

- (NSString)right_context
{
  const SetSpeechContext *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SetSpeechContext *v6;

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

- (NSArray)context_with_pron_hints
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_with_pron_hints"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__FTSetSpeechContext_context_with_pron_hints__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSetSpeechContext context_with_pron_hints_enumerateObjectsUsingBlock:](self, "context_with_pron_hints_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_with_pron_hints"));

  }
  return (NSArray *)v3;
}

uint64_t __45__FTSetSpeechContext_context_with_pron_hints__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)context_with_pron_hints_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTContextWithPronHints *v7;
  FTContextWithPronHints *v8;
  const SetSpeechContext *root;
  const SetSpeechContext *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_with_pron_hints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTContextWithPronHints *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTContextWithPronHints initWithFlatbuffData:root:verify:]([FTContextWithPronHints alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)context_with_pron_hints_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SetSpeechContext *root;
  const SetSpeechContext *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_with_pron_hints"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (v8 = *(unsigned __int16 *)v7[10].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)context_with_pron_hints_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTContextWithPronHints *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SetSpeechContext *root;
  const SetSpeechContext *v8;
  uint64_t v9;
  const SetSpeechContext *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTContextWithPronHints *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTContextWithPronHints *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_with_pron_hints"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      v9 = *(unsigned __int16 *)v8[10].var0;
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
            v17 = -[FTContextWithPronHints initWithFlatbuffData:root:verify:]([FTContextWithPronHints alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::SetSpeechContext>)addObjectToBuffer:(void *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const char *v9;
  size_t v10;
  int String;
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
  int v29;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  size_t v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  int v40;
  int v41;
  std::vector<int>::pointer v42;
  int *v43;
  std::vector<int>::pointer v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  unint64_t v48;
  char *v49;
  int *v50;
  int v51;
  std::vector<int>::pointer v52;
  int v53;
  int v54;
  int v55;
  int v56;
  Offset<siri::speech::schema_fb::SetSpeechContext> v57;
  int v59;
  int v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  std::vector<int> v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  std::vector<int> v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  memset(&v71, 0, sizeof(v71));
  -[FTSetSpeechContext contextual_text](self, "contextual_text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v71, objc_msgSend(v4, "count"));

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[FTSetSpeechContext contextual_text](self, "contextual_text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v68 != v7)
          objc_enumerationMutation(v5);
        v9 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i)), "UTF8String");
        v10 = strlen(v9);
        String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v9, v10);
        v12 = String;
        end = v71.__end_;
        if (v71.__end_ >= v71.__end_cap_.__value_)
        {
          begin = v71.__begin_;
          v16 = v71.__end_ - v71.__begin_;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v18 = (char *)v71.__end_cap_.__value_ - (char *)v71.__begin_;
          if (((char *)v71.__end_cap_.__value_ - (char *)v71.__begin_) >> 1 > v17)
            v17 = v18 >> 1;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          if (v19)
          {
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v71.__end_cap_, v19);
            begin = v71.__begin_;
            end = v71.__end_;
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
          v71.__begin_ = v21;
          v71.__end_ = v14;
          v71.__end_cap_.__value_ = (int *)&v20[4 * v19];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v71.__end_ = String;
          v14 = end + 1;
        }
        v71.__end_ = v14;
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v6);
  }

  if (v71.__end_ == v71.__begin_)
    v23 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v23 = v71.__begin_;
  v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, v71.__end_ - v71.__begin_);
  -[FTSetSpeechContext left_context](self, "left_context");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_251A15610;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  -[FTSetSpeechContext right_context](self, "right_context");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
    v30 = &stru_251A15610;
  v32 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v30), "UTF8String");
  v33 = strlen(v32);
  v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32, v33);

  memset(&v66, 0, sizeof(v66));
  -[FTSetSpeechContext context_with_pron_hints](self, "context_with_pron_hints");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v66, objc_msgSend(v35, "count"));

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[FTSetSpeechContext context_with_pron_hints](self, "context_with_pron_hints");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v34;
  v60 = v29;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(v36);
        v40 = objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v41 = v40;
        v42 = v66.__end_;
        if (v66.__end_ >= v66.__end_cap_.__value_)
        {
          v44 = v66.__begin_;
          v45 = v66.__end_ - v66.__begin_;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v47 = (char *)v66.__end_cap_.__value_ - (char *)v66.__begin_;
          if (((char *)v66.__end_cap_.__value_ - (char *)v66.__begin_) >> 1 > v46)
            v46 = v47 >> 1;
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
            v48 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v48 = v46;
          if (v48)
          {
            v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v66.__end_cap_, v48);
            v44 = v66.__begin_;
            v42 = v66.__end_;
          }
          else
          {
            v49 = 0;
          }
          v50 = (int *)&v49[4 * v45];
          *v50 = v41;
          v43 = v50 + 1;
          while (v42 != v44)
          {
            v51 = *--v42;
            *--v50 = v51;
          }
          v66.__begin_ = v50;
          v66.__end_ = v43;
          v66.__end_cap_.__value_ = (int *)&v49[4 * v48];
          if (v44)
            operator delete(v44);
        }
        else
        {
          *v66.__end_ = v40;
          v43 = v42 + 1;
        }
        v66.__end_ = v43;
      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v37);
  }

  if (v66.__end_ == v66.__begin_)
    v52 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ContextWithPronHints>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ContextWithPronHints>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ContextWithPronHints>> const&)::t;
  else
    v52 = v66.__begin_;
  v53 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v52, v66.__end_ - v66.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v54 = *((_DWORD *)a3 + 8);
  v55 = *((_DWORD *)a3 + 12);
  v56 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v59);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v53);
  v57.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v54 - (unsigned __int16)v55 + v56);
  if (v66.__begin_)
  {
    v66.__end_ = v66.__begin_;
    operator delete(v66.__begin_);
  }
  if (v71.__begin_)
  {
    v71.__end_ = v71.__begin_;
    operator delete(v71.__begin_);
  }
  return v57;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTSetSpeechContext addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __34__FTSetSpeechContext_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTSetSpeechContext_flatbuffData__block_invoke(uint64_t a1)
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
