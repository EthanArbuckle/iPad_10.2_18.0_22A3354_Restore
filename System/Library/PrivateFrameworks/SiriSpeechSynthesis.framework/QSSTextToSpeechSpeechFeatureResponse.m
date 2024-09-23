@implementation QSSTextToSpeechSpeechFeatureResponse

- (QSSTextToSpeechSpeechFeatureResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechSpeechFeatureResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechSpeechFeatureResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextToSpeechSpeechFeatureResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureResponse *)a4
{
  return -[QSSTextToSpeechSpeechFeatureResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextToSpeechSpeechFeatureResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextToSpeechSpeechFeatureResponse *v10;
  QSSTextToSpeechSpeechFeatureResponse *v11;
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
  unsigned int v28;
  const unsigned __int8 *v29;
  _DWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableDictionary *storage;
  QSSTextToSpeechSpeechFeatureResponse *v35;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;
  uint64_t v40;
  char v41;
  objc_super v42;

  v5 = a5;
  v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)QSSTextToSpeechSpeechFeatureResponse;
  v10 = -[QSSTextToSpeechSpeechFeatureResponse init](&v42, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_47;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_48;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechSpeechFeatureResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_46;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_48;
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
    goto LABEL_46;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v37, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 4u))
  {
    goto LABEL_48;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 6u))
  {
    goto LABEL_48;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v26))
    goto LABEL_48;
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  v28 = *v27;
  if (v28 >= 9 && v27[4] && (v38 < 5 || v38 - 4 < (unint64_t)root + v27[4] - v37))
    goto LABEL_48;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xAu))
    goto LABEL_48;
  v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v37, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v37, 0xCu))
  {
    goto LABEL_48;
  }
  v30 = 0;
  v31 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v31) < 0xDu)
    goto LABEL_45;
  if (*(_WORD *)((char *)root - v31 + 12))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v37, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v31 + 12)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v31 + 12)), 4uLL, 0))
    {
      v30 = 0;
      v31 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v31) < 0xDu)
        goto LABEL_45;
      goto LABEL_41;
    }
LABEL_48:
    v35 = 0;
    goto LABEL_49;
  }
LABEL_41:
  v32 = *(unsigned __int16 *)((char *)root - v31 + 12);
  if (v32)
    v30 = (_DWORD *)((char *)root + v32 + *(unsigned int *)((char *)root + v32));
  else
    v30 = 0;
LABEL_45:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>((flatbuffers::Verifier *)&v37, v30))goto LABEL_48;
LABEL_46:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v37);
  v33 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v33;

LABEL_47:
  v35 = v11;
LABEL_49:

  return v35;
}

- (NSString)speech_id
{
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureResponse *v6;

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
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureResponse *v6;

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
  const TextToSpeechSpeechFeatureResponse *root;
  const TextToSpeechSpeechFeatureResponse *v3;
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
  const TextToSpeechSpeechFeatureResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureResponse *v6;

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

- (NSArray)features
{
  void *v3;
  const TextToSpeechSpeechFeatureResponse *root;
  const TextToSpeechSpeechFeatureResponse *v5;
  uint64_t v6;
  const TextToSpeechSpeechFeatureResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechSpeechFeatureResponse *v10;
  uint64_t v11;
  QSSTextToSpeechSpeechFeatureOutputFeature *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      v6 = *(unsigned __int16 *)v5[12].var0;
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
            v12 = -[QSSTextToSpeechSpeechFeatureOutputFeature initWithFlatbuffData:root:verify:]([QSSTextToSpeechSpeechFeatureOutputFeature alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("features"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse>)addObjectToBuffer:(void *)a3
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
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t i;
  int v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  int v35;
  uint64_t v36;
  flatbuffers::FlatBufferBuilder *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse> v48;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int String;
  flatbuffers::FlatBufferBuilder *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[QSSTextToSpeechSpeechFeatureResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSTextToSpeechSpeechFeatureResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24E246F88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v52 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  v51 = -[QSSTextToSpeechSpeechFeatureResponse error_code](self, "error_code");
  -[QSSTextToSpeechSpeechFeatureResponse error_str](self, "error_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_24E246F88;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v50 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  -[QSSTextToSpeechSpeechFeatureResponse features](self, "features");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
    if (v18 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
    v21 = &v19[4 * v20];
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[QSSTextToSpeechSpeechFeatureResponse features](self, "features");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  v54 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v23)
  {
    v24 = *(_QWORD *)v56;
    v25 = v19;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v28 = v27;
        if (v25 >= v21)
        {
          v29 = (v25 - v19) >> 2;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v21 - v19) >> 1 > v30)
            v30 = (v21 - v19) >> 1;
          if ((unint64_t)(v21 - v19) >= 0x7FFFFFFFFFFFFFFCLL)
            v31 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          if (v31)
            v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          else
            v32 = 0;
          v33 = (char *)(v31 + 4 * v29);
          *(_DWORD *)v33 = v28;
          v34 = v33 + 4;
          while (v25 != v19)
          {
            v35 = *((_DWORD *)v25 - 1);
            v25 -= 4;
            *((_DWORD *)v33 - 1) = v35;
            v33 -= 4;
          }
          v21 = (char *)(v31 + 4 * v32);
          if (v19)
            operator delete(v19);
          v19 = v33;
          v25 = v34;
          a3 = v54;
        }
        else
        {
          *(_DWORD *)v25 = v27;
          v25 += 4;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v23);
  }
  else
  {
    v25 = v19;
  }

  v36 = v25 - v19;
  v37 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v25 == v19)
    v38 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureOutputFeature>> const&)::t;
  else
    v38 = v19;
  v39 = v36 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v37, v36 >> 2, 4uLL);
  if (v19 == v25)
  {
    LODWORD(v39) = 0;
  }
  else
  {
    v40 = v38 - 4;
    v41 = v39;
    do
    {
      v42 = flatbuffers::FlatBufferBuilder::ReferTo(v54, *(_DWORD *)&v40[4 * v41]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v54, v42);
      --v41;
    }
    while (v41);
  }
  v43 = flatbuffers::FlatBufferBuilder::EndVector(v54, v39);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v54);
  *((_BYTE *)v54 + 70) = 1;
  v44 = *((_DWORD *)v54 + 8);
  v45 = *((_DWORD *)v54 + 12);
  v46 = *((_DWORD *)v54 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v54, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v54, 6, v52);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v54, 8, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v54, 10, v50);
  if (v43)
  {
    v47 = flatbuffers::FlatBufferBuilder::ReferTo(v54, v43);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v54, 12, v47);
  }
  v48.var0 = flatbuffers::FlatBufferBuilder::EndTable(v54, v44 - v45 + v46);
  if (v19)
    operator delete(v19);
  return v48;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureResponse> v2;
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
  v2.var0 = -[QSSTextToSpeechSpeechFeatureResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__QSSTextToSpeechSpeechFeatureResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__52__QSSTextToSpeechSpeechFeatureResponse_flatbuffData__block_invoke(uint64_t a1)
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
