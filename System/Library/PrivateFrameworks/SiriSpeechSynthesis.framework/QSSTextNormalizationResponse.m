@implementation QSSTextNormalizationResponse

- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSTextNormalizationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextNormalizationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4
{
  return -[QSSTextNormalizationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextNormalizationResponse)initWithFlatbuffData:(id)a3 root:(const TextNormalizationResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextNormalizationResponse *v10;
  QSSTextNormalizationResponse *v11;
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
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 *v30;
  unsigned int v31;
  const unsigned __int8 *v32;
  uint64_t v33;
  NSMutableDictionary *storage;
  QSSTextNormalizationResponse *v35;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;
  uint64_t v40;
  char v41;
  objc_super v42;

  v5 = a5;
  v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)QSSTextNormalizationResponse;
  v10 = -[QSSTextNormalizationResponse init](&v42, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_46;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_47;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextNormalizationResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_45;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_47;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v37 = v18;
  v38 = v19;
  v39 = xmmword_21E34D540;
  v40 = 0;
  v41 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_45;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v37, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 4u))
  {
    goto LABEL_47;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 6u))
  {
    goto LABEL_47;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 8u))
  {
    goto LABEL_47;
  }
  v27 = 0;
  v28 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v28) < 9u)
    goto LABEL_34;
  if (*(_WORD *)((char *)root - v28 + 8))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v37, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v28 + 8)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v28 + 8)), 4uLL, 0))
    {
      v27 = 0;
      v28 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v28) < 9u)
        goto LABEL_34;
      goto LABEL_31;
    }
LABEL_47:
    v35 = 0;
    goto LABEL_48;
  }
LABEL_31:
  v29 = *(unsigned __int16 *)((char *)root - v28 + 8);
  if (v29)
    v27 = (_DWORD *)((char *)root + v29 + *(unsigned int *)((char *)root + v29));
  else
    v27 = 0;
LABEL_34:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::NormalizedToken>((flatbuffers::Verifier *)&v37, v27))goto LABEL_47;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v38 < 5 || v38 - 4 < (unint64_t)root + v30[5] - v37))
    goto LABEL_47;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xCu))
    goto LABEL_47;
  v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v32))
    goto LABEL_47;
LABEL_45:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v37);
  v33 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v33;

LABEL_46:
  v35 = v11;
LABEL_48:

  return v35;
}

- (NSString)speech_id
{
  const TextNormalizationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationResponse *v6;

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
  const TextNormalizationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationResponse *v6;

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
  const TextNormalizationResponse *root;
  const TextNormalizationResponse *v5;
  uint64_t v6;
  const TextNormalizationResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const TextNormalizationResponse *v10;
  uint64_t v11;
  QSSNormalizedToken *v12;

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
            v12 = -[QSSNormalizedToken initWithFlatbuffData:root:verify:]([QSSNormalizedToken alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
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

- (int)error_code
{
  const TextNormalizationResponse *root;
  const TextNormalizationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const TextNormalizationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextNormalizationResponse *v6;

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

- (Offset<siri::speech::schema_fb::TextNormalizationResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t i;
  int v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  int v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  int v39;
  __CFString *v40;
  __CFString *v41;
  const char *v42;
  size_t v43;
  unsigned int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  Offset<siri::speech::schema_fb::TextNormalizationResponse> v49;
  unsigned int v51;
  unsigned int String;
  QSSTextNormalizationResponse *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[QSSTextNormalizationResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSTextNormalizationResponse session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSTextNormalizationResponse tokens](self, "tokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = a3;
  if (v13)
  {
    if (v13 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v13);
    v17 = &v15[4 * v16];
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[QSSTextNormalizationResponse tokens](self, "tokens");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  v53 = self;
  if (v19)
  {
    v20 = *(_QWORD *)v56;
    v21 = v15;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v56 != v20)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "addObjectToBuffer:", v14);
        v24 = v23;
        if (v21 >= v17)
        {
          v25 = (v21 - v15) >> 2;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v17 - v15) >> 1 > v26)
            v26 = (v17 - v15) >> 1;
          if ((unint64_t)(v17 - v15) >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v26;
          if (v27)
            v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
          else
            v28 = 0;
          v29 = (char *)(v27 + 4 * v25);
          *(_DWORD *)v29 = v24;
          v30 = v29 + 4;
          while (v21 != v15)
          {
            v31 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v31;
            v29 -= 4;
          }
          v17 = (char *)(v27 + 4 * v28);
          if (v15)
            operator delete(v15);
          v15 = v29;
          v21 = v30;
          v14 = a3;
        }
        else
        {
          *(_DWORD *)v21 = v23;
          v21 += 4;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v19);
  }
  else
  {
    v21 = v15;
  }

  v32 = v21 - v15;
  if (v21 == v15)
    v33 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::NormalizedToken>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::NormalizedToken>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::NormalizedToken>> const&)::t;
  else
    v33 = v15;
  v34 = v32 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v32 >> 2, 4uLL);
  if (v15 == v21)
  {
    LODWORD(v34) = 0;
  }
  else
  {
    v35 = v33 - 4;
    v36 = v34;
    do
    {
      v37 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v35[4 * v36]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v37);
      --v36;
    }
    while (v36);
  }
  v38 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v34);
  v39 = -[QSSTextNormalizationResponse error_code](v53, "error_code");
  -[QSSTextNormalizationResponse error_str](v53, "error_str");
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
    v40 = &stru_24E246F88;
  v42 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v40), "UTF8String");
  v43 = strlen(v42);
  v44 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v42, v43);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v45 = *((_DWORD *)a3 + 8);
  v46 = *((_DWORD *)a3 + 12);
  v47 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v51);
  if (v38)
  {
    v48 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v38);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v48);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v39);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v44);
  v49.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v45 - v46 + v47);
  if (v15)
    operator delete(v15);
  return v49;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextNormalizationResponse> v2;
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
  v2.var0 = -[QSSTextNormalizationResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__QSSTextNormalizationResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__44__QSSTextNormalizationResponse_flatbuffData__block_invoke(uint64_t a1)
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
