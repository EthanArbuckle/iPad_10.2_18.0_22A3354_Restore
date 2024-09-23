@implementation QSSLmScorerResponse

- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSLmScorerResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSLmScorerResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4
{
  return -[QSSLmScorerResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSLmScorerResponse)initWithFlatbuffData:(id)a3 root:(const LmScorerResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSLmScorerResponse *v10;
  QSSLmScorerResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  flatbuffers::Table *root;
  unsigned __int16 *v21;
  unsigned int v22;
  const unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  unsigned int *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableDictionary *storage;
  QSSLmScorerResponse *v34;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  objc_super v41;

  v5 = a5;
  v9 = a3;
  v41.receiver = self;
  v41.super_class = (Class)QSSLmScorerResponse;
  v10 = -[QSSLmScorerResponse init](&v41, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_42;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_43;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const LmScorerResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_41;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_43;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v36 = v18;
  v37 = v19;
  v38 = xmmword_21E34D540;
  v39 = 0;
  v40 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_41;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v36, v11->_root->var0))
    goto LABEL_43;
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  v22 = *v21;
  if (v22 >= 5 && v21[2] && (v37 < 5 || v37 - 4 < (unint64_t)root + v21[2] - v36))
    goto LABEL_43;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 6u))
    goto LABEL_43;
  v23 = v22 >= 7 && v21[3] ? (const unsigned __int8 *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v36, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v36, 8u))
  {
    goto LABEL_43;
  }
  v24 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v24) < 9u)
    goto LABEL_37;
  if (*(_WORD *)((char *)root - v24 + 8))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v36, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v24 + 8)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v24 + 8)), 4uLL, 0))
    {
      v24 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v24) < 9u)
        goto LABEL_37;
      v25 = -v24;
      goto LABEL_31;
    }
LABEL_43:
    v34 = 0;
    goto LABEL_44;
  }
  v25 = -v24;
LABEL_31:
  v26 = *(unsigned __int16 *)((char *)root + v25 + 8);
  if (v26)
  {
    v27 = (_DWORD *)((char *)root + v26 + *(unsigned int *)((char *)root + v26));
    if (*v27)
    {
      v28 = 0;
      v29 = v27 + 1;
      while (siri::speech::schema_fb::LmScorerToken::Verify((siri::speech::schema_fb::LmScorerToken *)((char *)v29 + *v29), (flatbuffers::Verifier *)&v36))
      {
        ++v28;
        ++v29;
        if (v28 >= *v27)
        {
          LODWORD(v24) = *(_DWORD *)root;
          goto LABEL_37;
        }
      }
      goto LABEL_43;
    }
  }
LABEL_37:
  v30 = (unsigned __int16 *)((char *)root - (int)v24);
  if (*v30 >= 0xBu)
  {
    v31 = v30[5];
    if (v31)
    {
      if (v37 < 9 || v37 - 8 < (unint64_t)root + v31 - v36)
        goto LABEL_43;
    }
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v36);
  v32 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v32;

LABEL_42:
  v34 = v11;
LABEL_44:

  return v34;
}

- (int)return_code
{
  const LmScorerResponse *root;
  const LmScorerResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const LmScorerResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LmScorerResponse *v6;

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

- (NSArray)tokens
{
  void *v3;
  const LmScorerResponse *root;
  const LmScorerResponse *v5;
  uint64_t v6;
  const LmScorerResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const LmScorerResponse *v10;
  uint64_t v11;
  QSSLmScorerToken *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tokens"));
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
            v12 = -[QSSLmScorerToken initWithFlatbuffData:root:verify:]([QSSLmScorerToken alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tokens"));
  }
  return (NSArray *)v3;
}

- (double)ppl
{
  const LmScorerResponse *root;
  const LmScorerResponse *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (Offset<siri::speech::schema_fb::LmScorerResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  void *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t i;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  double v36;
  double v37;
  int v38;
  int v39;
  int v40;
  int v41;
  Offset<siri::speech::schema_fb::LmScorerResponse> v42;
  unsigned int String;
  int v45;
  QSSLmScorerResponse *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v45 = -[QSSLmScorerResponse return_code](self, "return_code");
  -[QSSLmScorerResponse return_str](self, "return_str");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSLmScorerResponse tokens](self, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    if (v10 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v10);
    v13 = &v11[4 * v12];
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[QSSLmScorerResponse tokens](self, "tokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v46 = self;
  if (v15)
  {
    v16 = *(_QWORD *)v49;
    v17 = v11;
    v47 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v14);
        v19 = a3;
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v21 = v20;
        if (v17 >= v13)
        {
          v22 = (v17 - v11) >> 2;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v13 - v11) >> 1 > v23)
            v23 = (v13 - v11) >> 1;
          if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          if (v24)
            v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v24);
          else
            v25 = 0;
          v26 = (char *)(v24 + 4 * v22);
          *(_DWORD *)v26 = v21;
          v27 = v26 + 4;
          a3 = v19;
          while (v17 != v11)
          {
            v28 = *((_DWORD *)v17 - 1);
            v17 -= 4;
            *((_DWORD *)v26 - 1) = v28;
            v26 -= 4;
          }
          v13 = (char *)(v24 + 4 * v25);
          if (v11)
            operator delete(v11);
          v11 = v26;
          v17 = v27;
          v14 = v47;
        }
        else
        {
          *(_DWORD *)v17 = v20;
          v17 += 4;
          a3 = v19;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  v29 = v17 - v11;
  if (v17 == v11)
    v30 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::LmScorerToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::LmScorerToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::LmScorerToken>> const&)::t;
  else
    v30 = v11;
  v31 = v29 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v29 >> 2, 4uLL);
  if (v11 == v17)
  {
    LODWORD(v31) = 0;
  }
  else
  {
    v32 = v30 - 4;
    v33 = v31;
    do
    {
      v34 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v32[4 * v33]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v34);
      --v33;
    }
    while (v33);
  }
  v35 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v31);
  -[QSSLmScorerResponse ppl](v46, "ppl");
  v37 = v36;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_DWORD *)a3 + 8);
  v39 = *((_DWORD *)a3 + 12);
  v40 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v45);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, String);
  if (v35)
  {
    v41 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v35);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v41);
  }
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 10, v37);
  v42.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v38 - v39 + v40);
  if (v11)
    operator delete(v11);
  return v42;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::LmScorerResponse> v2;
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
  v2.var0 = -[QSSLmScorerResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__QSSLmScorerResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__35__QSSLmScorerResponse_flatbuffData__block_invoke(uint64_t a1)
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
