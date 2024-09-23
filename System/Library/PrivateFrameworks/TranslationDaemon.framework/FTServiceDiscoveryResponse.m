@implementation FTServiceDiscoveryResponse

- (FTServiceDiscoveryResponse)initWithFlatbuffData:(id)a3
{
  return -[FTServiceDiscoveryResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTServiceDiscoveryResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4
{
  return -[FTServiceDiscoveryResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTServiceDiscoveryResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const ServiceDiscoveryResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::ServiceDiscoveryResponse *v19;
  FTServiceDiscoveryResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTServiceDiscoveryResponse;
  v10 = -[FTServiceDiscoveryResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ServiceDiscoveryResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ServiceDiscoveryResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::ServiceDiscoveryResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)session_id
{
  const ServiceDiscoveryResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ServiceDiscoveryResponse *v6;

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

- (int)error_code
{
  const ServiceDiscoveryResponse *root;
  const ServiceDiscoveryResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const ServiceDiscoveryResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ServiceDiscoveryResponse *v6;

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

- (NSArray)zk_node
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("zk_node"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTServiceDiscoveryResponse_zk_node__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTServiceDiscoveryResponse zk_node_enumerateObjectsUsingBlock:](self, "zk_node_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("zk_node"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTServiceDiscoveryResponse_zk_node__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)zk_node_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const ServiceDiscoveryResponse *root;
  const ServiceDiscoveryResponse *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("zk_node"));
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
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
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

- (unint64_t)zk_node_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const ServiceDiscoveryResponse *root;
  const ServiceDiscoveryResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("zk_node"));
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

- (void)zk_node_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const ServiceDiscoveryResponse *root;
  const ServiceDiscoveryResponse *v8;
  uint64_t v9;
  const ServiceDiscoveryResponse *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("zk_node"));
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

- (Offset<siri::speech::schema_fb::ServiceDiscoveryResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  size_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const char *v18;
  size_t v19;
  int v20;
  int v21;
  std::vector<int>::pointer end;
  int *v23;
  std::vector<int>::pointer begin;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  char *v29;
  int *v30;
  int v31;
  std::vector<int>::pointer v32;
  int v33;
  int v34;
  int v35;
  int v36;
  Offset<siri::speech::schema_fb::ServiceDiscoveryResponse> v37;
  int v39;
  int v40;
  int String;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  std::vector<int> v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[FTServiceDiscoveryResponse session_id](self, "session_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  v40 = -[FTServiceDiscoveryResponse error_code](self, "error_code");
  -[FTServiceDiscoveryResponse error_str](self, "error_str");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v39 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  memset(&v46, 0, sizeof(v46));
  -[FTServiceDiscoveryResponse zk_node](self, "zk_node");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v46, objc_msgSend(v13, "count"));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[FTServiceDiscoveryResponse zk_node](self, "zk_node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v14);
        v18 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i)), "UTF8String");
        v19 = strlen(v18);
        v20 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);
        v21 = v20;
        end = v46.__end_;
        if (v46.__end_ >= v46.__end_cap_.__value_)
        {
          begin = v46.__begin_;
          v25 = v46.__end_ - v46.__begin_;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v27 = (char *)v46.__end_cap_.__value_ - (char *)v46.__begin_;
          if (((char *)v46.__end_cap_.__value_ - (char *)v46.__begin_) >> 1 > v26)
            v26 = v27 >> 1;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
            v28 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v28 = v26;
          if (v28)
          {
            v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v46.__end_cap_, v28);
            begin = v46.__begin_;
            end = v46.__end_;
          }
          else
          {
            v29 = 0;
          }
          v30 = (int *)&v29[4 * v25];
          *v30 = v21;
          v23 = v30 + 1;
          while (end != begin)
          {
            v31 = *--end;
            *--v30 = v31;
          }
          v46.__begin_ = v30;
          v46.__end_ = v23;
          v46.__end_cap_.__value_ = (int *)&v29[4 * v28];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v46.__end_ = v20;
          v23 = end + 1;
        }
        v46.__end_ = v23;
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v15);
  }

  if (v46.__end_ == v46.__begin_)
    v32 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v32 = v46.__begin_;
  v33 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v32, v46.__end_ - v46.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v34 = *((_DWORD *)a3 + 8);
  v35 = *((_DWORD *)a3 + 12);
  v36 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 6, v40, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v39);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v33);
  v37.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v34 - (unsigned __int16)v35 + v36);
  if (v46.__begin_)
  {
    v46.__end_ = v46.__begin_;
    operator delete(v46.__begin_);
  }
  return v37;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTServiceDiscoveryResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __42__FTServiceDiscoveryResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__42__FTServiceDiscoveryResponse_flatbuffData__block_invoke(uint64_t a1)
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
