@implementation FTPostItnHammerRequest

- (FTPostItnHammerRequest)initWithFlatbuffData:(id)a3
{
  return -[FTPostItnHammerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTPostItnHammerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTPostItnHammerRequest)initWithFlatbuffData:(id)a3 root:(const PostItnHammerRequest *)a4
{
  return -[FTPostItnHammerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTPostItnHammerRequest)initWithFlatbuffData:(id)a3 root:(const PostItnHammerRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTPostItnHammerRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const PostItnHammerRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::PostItnHammerRequest *v19;
  FTPostItnHammerRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTPostItnHammerRequest;
  v10 = -[FTPostItnHammerRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const PostItnHammerRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::PostItnHammerRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::PostItnHammerRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const PostItnHammerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PostItnHammerRequest *v6;

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
  const PostItnHammerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PostItnHammerRequest *v6;

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

- (NSString)language
{
  const PostItnHammerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PostItnHammerRequest *v6;

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

- (NSString)post_itn_string
{
  const PostItnHammerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PostItnHammerRequest *v6;

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

- (NSArray)tokens
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__FTPostItnHammerRequest_tokens__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTPostItnHammerRequest tokens_enumerateObjectsUsingBlock:](self, "tokens_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tokens"));

  }
  return (NSArray *)v3;
}

uint64_t __32__FTPostItnHammerRequest_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)tokens_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRecognitionToken *v7;
  FTRecognitionToken *v8;
  const PostItnHammerRequest *root;
  const PostItnHammerRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRecognitionToken *)objc_claimAutoreleasedReturnValue();
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
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTRecognitionToken initWithFlatbuffData:root:verify:]([FTRecognitionToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)tokens_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const PostItnHammerRequest *root;
  const PostItnHammerRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
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

- (void)tokens_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRecognitionToken *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const PostItnHammerRequest *root;
  const PostItnHammerRequest *v8;
  uint64_t v9;
  const PostItnHammerRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRecognitionToken *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRecognitionToken *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
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
            v17 = -[FTRecognitionToken initWithFlatbuffData:root:verify:]([FTRecognitionToken alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::PostItnHammerRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  int String;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  const char *v17;
  size_t v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  const char *v22;
  size_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  int v29;
  int v30;
  std::vector<int>::pointer end;
  int *v32;
  std::vector<int>::pointer begin;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  char *v38;
  int *v39;
  int v40;
  std::vector<int>::pointer v41;
  int v42;
  int v43;
  int v44;
  int v45;
  Offset<siri::speech::schema_fb::PostItnHammerRequest> v46;
  int v48;
  int v49;
  int v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  std::vector<int> v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[FTPostItnHammerRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTPostItnHammerRequest session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_251A15610;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  -[FTPostItnHammerRequest language](self, "language");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_251A15610;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v19 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v17, v18);

  -[FTPostItnHammerRequest post_itn_string](self, "post_itn_string");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_251A15610;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  LODWORD(v22) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22, v23);

  memset(&v56, 0, sizeof(v56));
  -[FTPostItnHammerRequest tokens](self, "tokens");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, objc_msgSend(v24, "count"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[FTPostItnHammerRequest tokens](self, "tokens");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (int)v22;
  v49 = v19;
  v50 = v14;
  v51 = String;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(v25);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v30 = v29;
        end = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          begin = v56.__begin_;
          v34 = v56.__end_ - v56.__begin_;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v36 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v35)
            v35 = v36 >> 1;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
            v37 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v37);
            begin = v56.__begin_;
            end = v56.__end_;
          }
          else
          {
            v38 = 0;
          }
          v39 = (int *)&v38[4 * v34];
          *v39 = v30;
          v32 = v39 + 1;
          while (end != begin)
          {
            v40 = *--end;
            *--v39 = v40;
          }
          v56.__begin_ = v39;
          v56.__end_ = v32;
          v56.__end_cap_.__value_ = (int *)&v38[4 * v37];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v56.__end_ = v29;
          v32 = end + 1;
        }
        v56.__end_ = v32;
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v26);
  }

  if (v56.__end_ == v56.__begin_)
    v41 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>> const&)::t;
  else
    v41 = v56.__begin_;
  v42 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v41, v56.__end_ - v56.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v43 = *((_DWORD *)a3 + 8);
  v44 = *((_DWORD *)a3 + 12);
  v45 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v50);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v42);
  v46.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v43 - (unsigned __int16)v44 + v45);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  return v46;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTPostItnHammerRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __38__FTPostItnHammerRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FTPostItnHammerRequest_flatbuffData__block_invoke(uint64_t a1)
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
