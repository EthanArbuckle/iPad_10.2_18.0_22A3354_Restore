@implementation QSSRecoverPronsRequest

- (QSSRecoverPronsRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSRecoverPronsRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecoverPronsRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecoverPronsRequest)initWithFlatbuffData:(id)a3 root:(const RecoverPronsRequest *)a4
{
  return -[QSSRecoverPronsRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecoverPronsRequest)initWithFlatbuffData:(id)a3 root:(const RecoverPronsRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecoverPronsRequest *v10;
  QSSRecoverPronsRequest *v11;
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
  uint64_t v25;
  const unsigned __int8 *v26;
  unsigned __int16 *v27;
  uint64_t v28;
  const unsigned __int8 *v29;
  _DWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableDictionary *storage;
  QSSRecoverPronsRequest *v35;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v42;

  v5 = a5;
  v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)QSSRecoverPronsRequest;
  v10 = -[QSSRecoverPronsRequest init](&v42, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_43;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_44;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const RecoverPronsRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_42;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_44;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v37 = v18;
  v38 = v19;
  v39 = xmmword_21E34D540;
  v40 = 0;
  LOBYTE(v41) = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_42;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v37, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 4u))
  {
    goto LABEL_44;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 6u))
  {
    goto LABEL_44;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 8u))
  {
    goto LABEL_44;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (v28 = v27[4]) != 0)
    v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  else
    v29 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xAu))
  {
    goto LABEL_44;
  }
  v30 = 0;
  v31 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v31) < 0xBu)
    goto LABEL_41;
  if (*(_WORD *)((char *)root - v31 + 10))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v37, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v31 + 10)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v31 + 10)), 4uLL, 0))
    {
      v30 = 0;
      v31 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v31) < 0xBu)
        goto LABEL_41;
      goto LABEL_37;
    }
LABEL_44:
    v35 = 0;
    goto LABEL_45;
  }
LABEL_37:
  v32 = *(unsigned __int16 *)((char *)root - v31 + 10);
  if (v32)
    v30 = (_DWORD *)((char *)root + v32 + *(unsigned int *)((char *)root + v32));
  else
    v30 = 0;
LABEL_41:
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v37, v30))
    goto LABEL_44;
LABEL_42:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v37, v38, v39, v40, v41);
  v33 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v33;

LABEL_43:
  v35 = v11;
LABEL_45:

  return v35;
}

- (NSString)speech_id
{
  const RecoverPronsRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsRequest *v6;

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
  const RecoverPronsRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsRequest *v6;

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
  const RecoverPronsRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RecoverPronsRequest *v6;

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

- (NSArray)apg_ids
{
  void *v3;
  const RecoverPronsRequest *root;
  const RecoverPronsRequest *v5;
  uint64_t v6;
  const RecoverPronsRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const RecoverPronsRequest *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("apg_ids"));
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("apg_ids"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::RecoverPronsRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  size_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int *begin;
  uint64_t v21;
  int *value;
  void *v23;
  uint64_t i;
  const char *v25;
  size_t v26;
  int v27;
  int v28;
  std::vector<int>::pointer end;
  int *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int *v35;
  int v36;
  int *v37;
  unsigned int v38;
  int v39;
  int v40;
  int v41;
  Offset<siri::speech::schema_fb::RecoverPronsRequest> v42;
  unsigned int v44;
  unsigned int v45;
  unsigned int String;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  std::vector<int> v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[QSSRecoverPronsRequest speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSRecoverPronsRequest session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v45 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSRecoverPronsRequest language](self, "language");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v16 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  memset(&v52, 0, sizeof(v52));
  -[QSSRecoverPronsRequest apg_ids](self, "apg_ids");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v52, objc_msgSend(v17, "count"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[QSSRecoverPronsRequest apg_ids](self, "apg_ids");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v44 = v16;
  begin = v52.__begin_;
  if (v19)
  {
    v21 = *(_QWORD *)v49;
    value = v52.__end_cap_.__value_;
    v23 = v18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v18);
        v25 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i)), "UTF8String");
        v26 = strlen(v25);
        v27 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v25, v26);
        v28 = v27;
        end = v52.__end_;
        if (v52.__end_ >= value)
        {
          v31 = v52.__end_ - begin;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62)
          {
            v52.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v32)
            v32 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v33 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v33 = v32;
          if (v33)
            v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v33);
          else
            v34 = 0;
          v35 = (int *)(v33 + 4 * v31);
          *v35 = v28;
          v30 = v35 + 1;
          while (end != begin)
          {
            v36 = *--end;
            *--v35 = v36;
          }
          value = (int *)(v33 + 4 * v34);
          v52.__end_ = v30;
          if (begin)
            operator delete(begin);
          begin = v35;
          v18 = v23;
        }
        else
        {
          *v52.__end_ = v27;
          v30 = end + 1;
        }
        v52.__end_ = v30;
      }
      v52.__end_cap_.__value_ = value;
      v52.__begin_ = begin;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v19);
  }
  else
  {
    v30 = v52.__end_;
  }

  if (v30 == begin)
    v37 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v37 = begin;
  v38 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v37, v30 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v39 = *((_DWORD *)a3 + 8);
  v40 = *((_DWORD *)a3 + 12);
  v41 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v45);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v44);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v38);
  v42.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v39 - v40 + v41);
  if (begin)
  {
    v52.__end_ = begin;
    operator delete(begin);
  }
  return v42;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::RecoverPronsRequest> v2;
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
  v2.var0 = -[QSSRecoverPronsRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__QSSRecoverPronsRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__38__QSSRecoverPronsRequest_flatbuffData__block_invoke(uint64_t a1)
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
