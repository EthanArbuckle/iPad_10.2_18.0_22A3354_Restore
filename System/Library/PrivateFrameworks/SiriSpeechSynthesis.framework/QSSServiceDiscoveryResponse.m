@implementation QSSServiceDiscoveryResponse

- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSServiceDiscoveryResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSServiceDiscoveryResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4
{
  return -[QSSServiceDiscoveryResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSServiceDiscoveryResponse)initWithFlatbuffData:(id)a3 root:(const ServiceDiscoveryResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSServiceDiscoveryResponse *v10;
  QSSServiceDiscoveryResponse *v11;
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
  uint64_t v30;
  NSMutableDictionary *storage;
  QSSServiceDiscoveryResponse *v32;
  uint64_t v34;
  unint64_t v35;
  __int128 v36;
  uint64_t v37;
  char v38;
  objc_super v39;

  v5 = a5;
  v9 = a3;
  v39.receiver = self;
  v39.super_class = (Class)QSSServiceDiscoveryResponse;
  v10 = -[QSSServiceDiscoveryResponse init](&v39, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_40;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_41;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ServiceDiscoveryResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_39;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_41;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v34 = v18;
  v35 = v19;
  v36 = xmmword_21E34D540;
  v37 = 0;
  v38 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_39;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v34, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v34, 4u))
  {
    goto LABEL_41;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v34, v23))
    goto LABEL_41;
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  v25 = *v24;
  if (v25 >= 7 && v24[3] && (v35 < 5 || v35 - 4 < (unint64_t)root + v24[3] - v34))
    goto LABEL_41;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v34, 8u))
    goto LABEL_41;
  v26 = v25 >= 9 && v24[4] ? (const unsigned __int8 *)root + v24[4] + *(unsigned int *)((char *)root + v24[4]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v34, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v34, 0xAu))
  {
    goto LABEL_41;
  }
  v27 = 0;
  v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) < 0xBu)
    goto LABEL_38;
  if (*(_WORD *)((char *)root - v28 + 10))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v34, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 10)), 4uLL, 0))
    {
      v27 = 0;
      v28 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v28) < 0xBu)
        goto LABEL_38;
      goto LABEL_35;
    }
LABEL_41:
    v32 = 0;
    goto LABEL_42;
  }
LABEL_35:
  v29 = *(unsigned __int16 *)((char *)root - v28 + 10);
  if (v29)
    v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
  else
    v27 = 0;
LABEL_38:
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v34, v27))
    goto LABEL_41;
LABEL_39:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v34);
  v30 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v30;

LABEL_40:
  v32 = v11;
LABEL_42:

  return v32;
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
  void *v3;
  const ServiceDiscoveryResponse *root;
  const ServiceDiscoveryResponse *v5;
  uint64_t v6;
  const ServiceDiscoveryResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const ServiceDiscoveryResponse *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("zk_node"));
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("zk_node"));
  }
  return (NSArray *)v3;
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
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int *begin;
  uint64_t v18;
  int *value;
  uint64_t i;
  const char *v21;
  size_t v22;
  int v23;
  int v24;
  std::vector<int>::pointer end;
  int *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int *v31;
  int v32;
  int *v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  Offset<siri::speech::schema_fb::ServiceDiscoveryResponse> v38;
  unsigned int v40;
  int v41;
  unsigned int String;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  std::vector<int> v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[QSSServiceDiscoveryResponse session_id](self, "session_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  v41 = -[QSSServiceDiscoveryResponse error_code](self, "error_code");
  -[QSSServiceDiscoveryResponse error_str](self, "error_str");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24E246F88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v13 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  memset(&v48, 0, sizeof(v48));
  -[QSSServiceDiscoveryResponse zk_node](self, "zk_node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v48, objc_msgSend(v14, "count"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[QSSServiceDiscoveryResponse zk_node](self, "zk_node");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  v40 = v13;
  begin = v48.__begin_;
  if (v16)
  {
    v18 = *(_QWORD *)v45;
    value = v48.__end_cap_.__value_;
    v43 = v15;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        v21 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i)), "UTF8String");
        v22 = strlen(v21);
        v23 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);
        v24 = v23;
        end = v48.__end_;
        if (v48.__end_ >= value)
        {
          v27 = v48.__end_ - begin;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62)
          {
            v48.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v28)
            v28 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v29 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v29 = v28;
          if (v29)
            v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v29);
          else
            v30 = 0;
          v31 = (int *)(v29 + 4 * v27);
          *v31 = v24;
          v26 = v31 + 1;
          while (end != begin)
          {
            v32 = *--end;
            *--v31 = v32;
          }
          value = (int *)(v29 + 4 * v30);
          v48.__end_ = v26;
          if (begin)
            operator delete(begin);
          begin = v31;
          v15 = v43;
        }
        else
        {
          *v48.__end_ = v23;
          v26 = end + 1;
        }
        v48.__end_ = v26;
      }
      v48.__end_cap_.__value_ = value;
      v48.__begin_ = begin;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v16);
  }
  else
  {
    v26 = v48.__end_;
  }

  if (v26 == begin)
    v33 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v33 = begin;
  v34 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v33, v26 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v35 = *((_DWORD *)a3 + 8);
  v36 = *((_DWORD *)a3 + 12);
  v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v34);
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (begin)
  {
    v48.__end_ = begin;
    operator delete(begin);
  }
  return v38;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ServiceDiscoveryResponse> v2;
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
  v2.var0 = -[QSSServiceDiscoveryResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__QSSServiceDiscoveryResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__43__QSSServiceDiscoveryResponse_flatbuffData__block_invoke(uint64_t a1)
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
