@implementation QSSSetSpeechContext

- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3
{
  return -[QSSSetSpeechContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSSetSpeechContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4
{
  return -[QSSSetSpeechContext initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSSetSpeechContext)initWithFlatbuffData:(id)a3 root:(const SetSpeechContext *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSSetSpeechContext *v10;
  QSSSetSpeechContext *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::SetSpeechContext *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSSetSpeechContext *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSetSpeechContext;
  v10 = -[QSSSetSpeechContext init](&v30, sel_init);
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
      a4 = (const SetSpeechContext *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SetSpeechContext *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SetSpeechContext::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)contextual_text
{
  void *v3;
  const SetSpeechContext *root;
  const SetSpeechContext *v5;
  uint64_t v6;
  const SetSpeechContext *v7;
  uint64_t v8;
  uint64_t v9;
  const SetSpeechContext *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
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
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("contextual_text"));
  }
  return (NSArray *)v3;
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
  void *v3;
  const SetSpeechContext *root;
  const SetSpeechContext *v5;
  uint64_t v6;
  const SetSpeechContext *v7;
  uint64_t v8;
  uint64_t v9;
  const SetSpeechContext *v10;
  uint64_t v11;
  QSSContextWithPronHints *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_with_pron_hints"));
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
            v12 = -[QSSContextWithPronHints initWithFlatbuffData:root:verify:]([QSSContextWithPronHints alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_with_pron_hints"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::SetSpeechContext>)addObjectToBuffer:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int *begin;
  uint64_t v8;
  int *value;
  uint64_t i;
  const char *v11;
  size_t v12;
  int String;
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
  unsigned int v24;
  __CFString *v25;
  __CFString *v26;
  const char *v27;
  size_t v28;
  __CFString *v29;
  __CFString *v30;
  const char *v31;
  size_t v32;
  void *v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t j;
  int v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  flatbuffers::FlatBufferBuilder *v57;
  int v58;
  unsigned int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  Offset<siri::speech::schema_fb::SetSpeechContext> v64;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  std::vector<int> v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  memset(&v79, 0, sizeof(v79));
  -[QSSSetSpeechContext contextual_text](self, "contextual_text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v79, objc_msgSend(v3, "count"));

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[QSSSetSpeechContext contextual_text](self, "contextual_text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  v6 = v4;
  begin = v79.__begin_;
  if (v5)
  {
    v8 = *(_QWORD *)v76;
    value = v79.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v76 != v8)
          objc_enumerationMutation(v6);
        v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i)), "UTF8String");
        v12 = strlen(v11);
        String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);
        v14 = String;
        end = v79.__end_;
        if (v79.__end_ >= value)
        {
          v17 = v79.__end_ - begin;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v79.__begin_ = begin;
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
          v79.__end_ = v16;
          if (begin)
            operator delete(begin);
          begin = v21;
        }
        else
        {
          *v79.__end_ = String;
          v16 = end + 1;
        }
        v79.__end_ = v16;
      }
      v79.__end_cap_.__value_ = value;
      v79.__begin_ = begin;
      v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v5);
  }
  else
  {
    v16 = v79.__end_;
  }

  if (v16 == begin)
    v23 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v23 = begin;
  v24 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v23, v16 - begin);
  -[QSSSetSpeechContext left_context](self, "left_context");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v68 = v24;
  if (!v25)
    v25 = &stru_24E246F88;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v67 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v27, v28);

  -[QSSSetSpeechContext right_context](self, "right_context");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
    v29 = &stru_24E246F88;
  v31 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v29), "UTF8String");
  v32 = strlen(v31);
  v66 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v31, v32);

  -[QSSSetSpeechContext context_with_pron_hints](self, "context_with_pron_hints");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");
  if (v34)
  {
    if (v34 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v34);
    v37 = &v35[4 * v36];
  }
  else
  {
    v35 = 0;
    v37 = 0;
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[QSSSetSpeechContext context_with_pron_hints](self, "context_with_pron_hints");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v72;
    v41 = v35;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v72 != v40)
          objc_enumerationMutation(v38);
        v43 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v44 = v43;
        if (v41 >= v37)
        {
          v45 = (v41 - v35) >> 2;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v37 - v35) >> 1 > v46)
            v46 = (v37 - v35) >> 1;
          if ((unint64_t)(v37 - v35) >= 0x7FFFFFFFFFFFFFFCLL)
            v47 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v47 = v46;
          if (v47)
            v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v47);
          else
            v48 = 0;
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v44;
          v50 = v49 + 4;
          while (v41 != v35)
          {
            v51 = *((_DWORD *)v41 - 1);
            v41 -= 4;
            *((_DWORD *)v49 - 1) = v51;
            v49 -= 4;
          }
          v37 = (char *)(v47 + 4 * v48);
          if (v35)
            operator delete(v35);
          v35 = v49;
          v41 = v50;
        }
        else
        {
          *(_DWORD *)v41 = v43;
          v41 += 4;
        }
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    }
    while (v39);
  }
  else
  {
    v41 = v35;
  }

  v52 = v41 - v35;
  if (v41 == v35)
    v53 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::ContextWithPronHints>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::ContextWithPronHints>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::ContextWithPronHints>> const&)::t;
  else
    v53 = v35;
  v54 = v52 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v52 >> 2, 4uLL);
  if (v35 == v41)
  {
    LODWORD(v54) = 0;
    v57 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  else
  {
    v55 = v53 - 4;
    v56 = v54;
    v57 = (flatbuffers::FlatBufferBuilder *)a3;
    do
    {
      v58 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v55[4 * v56]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v58);
      --v56;
    }
    while (v56);
  }
  v59 = flatbuffers::FlatBufferBuilder::EndVector(v57, v54);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v57);
  *((_BYTE *)v57 + 70) = 1;
  v60 = *((_DWORD *)v57 + 8);
  v61 = *((_DWORD *)v57 + 12);
  v62 = *((_DWORD *)v57 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 4, v68);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 6, v67);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v57, 8, v66);
  if (v59)
  {
    v63 = flatbuffers::FlatBufferBuilder::ReferTo(v57, v59);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v57, 10, v63);
  }
  v64.var0 = flatbuffers::FlatBufferBuilder::EndTable(v57, v60 - v61 + v62);
  if (v35)
    operator delete(v35);
  if (v79.__begin_)
    operator delete(v79.__begin_);
  return v64;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::SetSpeechContext> v2;
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
  v2.var0 = -[QSSSetSpeechContext addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__QSSSetSpeechContext_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__35__QSSSetSpeechContext_flatbuffData__block_invoke(uint64_t a1)
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
