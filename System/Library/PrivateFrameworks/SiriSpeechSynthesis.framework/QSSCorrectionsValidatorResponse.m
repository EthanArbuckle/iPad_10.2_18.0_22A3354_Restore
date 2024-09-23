@implementation QSSCorrectionsValidatorResponse

- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSCorrectionsValidatorResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSCorrectionsValidatorResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorResponse *)a4
{
  return -[QSSCorrectionsValidatorResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSCorrectionsValidatorResponse)initWithFlatbuffData:(id)a3 root:(const CorrectionsValidatorResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSCorrectionsValidatorResponse *v10;
  QSSCorrectionsValidatorResponse *v11;
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
  unsigned __int16 *v30;
  unsigned int v31;
  const unsigned __int8 *v32;
  _DWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableDictionary *storage;
  QSSCorrectionsValidatorResponse *v38;
  uint64_t v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  char v44;
  objc_super v45;

  v5 = a5;
  v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)QSSCorrectionsValidatorResponse;
  v10 = -[QSSCorrectionsValidatorResponse init](&v45, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_53;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_54;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const CorrectionsValidatorResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_52;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_54;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v40 = v18;
  v41 = v19;
  v42 = xmmword_21E34D540;
  v43 = 0;
  v44 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_52;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v40, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 4u))
  {
    goto LABEL_54;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 6u))
  {
    goto LABEL_54;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 8u))
  {
    goto LABEL_54;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (v28 = v27[4]) != 0)
    v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  else
    v29 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v29))
    goto LABEL_54;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  v31 = *v30;
  if (v31 >= 0xB && v30[5] && (v41 < 5 || v41 - 4 < (unint64_t)root + v30[5] - v40))
    goto LABEL_54;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xCu))
    goto LABEL_54;
  v32 = v31 >= 0xD && v30[6] ? (const unsigned __int8 *)root + v30[6] + *(unsigned int *)((char *)root + v30[6]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v40, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v40, 0xEu))
  {
    goto LABEL_54;
  }
  v33 = 0;
  v34 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v34) < 0xFu)
    goto LABEL_51;
  if (*(_WORD *)((char *)root - v34 + 14))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v40, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v34 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v34 + 14)), 4uLL, 0))
    {
      v33 = 0;
      v34 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v34) < 0xFu)
        goto LABEL_51;
      goto LABEL_47;
    }
LABEL_54:
    v38 = 0;
    goto LABEL_55;
  }
LABEL_47:
  v35 = *(unsigned __int16 *)((char *)root - v34 + 14);
  if (v35)
    v33 = (_DWORD *)((char *)root + v35 + *(unsigned int *)((char *)root + v35));
  else
    v33 = 0;
LABEL_51:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::CorrectionsAlignment>((flatbuffers::Verifier *)&v40, v33))goto LABEL_54;
LABEL_52:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v40);
  v36 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v36;

LABEL_53:
  v38 = v11;
LABEL_55:

  return v38;
}

- (NSString)speech_id
{
  const CorrectionsValidatorResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorResponse *v6;

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
  const CorrectionsValidatorResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorResponse *v6;

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
  const CorrectionsValidatorResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorResponse *v6;

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

- (int)return_code
{
  const CorrectionsValidatorResponse *root;
  const CorrectionsValidatorResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const CorrectionsValidatorResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CorrectionsValidatorResponse *v6;

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

- (NSArray)corrections
{
  void *v3;
  const CorrectionsValidatorResponse *root;
  const CorrectionsValidatorResponse *v5;
  uint64_t v6;
  const CorrectionsValidatorResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const CorrectionsValidatorResponse *v10;
  uint64_t v11;
  QSSCorrectionsAlignment *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("corrections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xFu)
    {
      v6 = *(unsigned __int16 *)v5[14].var0;
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
            v12 = -[QSSCorrectionsAlignment initWithFlatbuffData:root:verify:]([QSSCorrectionsAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("corrections"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::CorrectionsValidatorResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  __CFString *v9;
  flatbuffers::FlatBufferBuilder *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  __CFString *v14;
  __CFString *v15;
  const char *v16;
  size_t v17;
  __CFString *v18;
  __CFString *v19;
  const char *v20;
  size_t v21;
  void *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t i;
  int v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  int v40;
  uint64_t v41;
  flatbuffers::FlatBufferBuilder *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  Offset<siri::speech::schema_fb::CorrectionsValidatorResponse> v53;
  unsigned int v55;
  int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int String;
  flatbuffers::FlatBufferBuilder *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  -[QSSCorrectionsValidatorResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v60 = (flatbuffers::FlatBufferBuilder *)a3;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSCorrectionsValidatorResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = (flatbuffers::FlatBufferBuilder *)a3;
  v11 = v9;
  if (!v9)
    v9 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v13 = strlen(v12);
  v58 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  -[QSSCorrectionsValidatorResponse language](self, "language");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    v14 = &stru_24E246F88;
  v16 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
  v17 = strlen(v16);
  v57 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v16, v17);

  v56 = -[QSSCorrectionsValidatorResponse return_code](self, "return_code");
  -[QSSCorrectionsValidatorResponse return_str](self, "return_str");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v18 = &stru_24E246F88;
  v20 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
  v21 = strlen(v20);
  v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v20, v21);

  -[QSSCorrectionsValidatorResponse corrections](self, "corrections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  if (v23)
  {
    if (v23 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v23);
    v26 = &v24[4 * v25];
  }
  else
  {
    v24 = 0;
    v26 = 0;
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[QSSCorrectionsValidatorResponse corrections](self, "corrections");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v62;
    v30 = v24;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v62 != v29)
          objc_enumerationMutation(v27);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "addObjectToBuffer:", v10);
        v33 = v32;
        if (v30 >= v26)
        {
          v34 = (v30 - v24) >> 2;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v26 - v24) >> 1 > v35)
            v35 = (v26 - v24) >> 1;
          if ((unint64_t)(v26 - v24) >= 0x7FFFFFFFFFFFFFFCLL)
            v36 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v36 = v35;
          if (v36)
            v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v36);
          else
            v37 = 0;
          v38 = (char *)(v36 + 4 * v34);
          *(_DWORD *)v38 = v33;
          v39 = v38 + 4;
          while (v30 != v24)
          {
            v40 = *((_DWORD *)v30 - 1);
            v30 -= 4;
            *((_DWORD *)v38 - 1) = v40;
            v38 -= 4;
          }
          v26 = (char *)(v36 + 4 * v37);
          if (v24)
            operator delete(v24);
          v24 = v38;
          v30 = v39;
          v10 = v60;
        }
        else
        {
          *(_DWORD *)v30 = v32;
          v30 += 4;
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v28);
  }
  else
  {
    v30 = v24;
  }

  v41 = v30 - v24;
  v42 = v10;
  if (v30 == v24)
    v43 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::CorrectionsAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::CorrectionsAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::CorrectionsAlignment>> const&)::t;
  else
    v43 = v24;
  v44 = v41 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v42, v41 >> 2, 4uLL);
  if (v24 == v30)
  {
    LODWORD(v44) = 0;
  }
  else
  {
    v45 = v43 - 4;
    v46 = v44;
    do
    {
      v47 = flatbuffers::FlatBufferBuilder::ReferTo(v60, *(_DWORD *)&v45[4 * v46]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v60, v47);
      --v46;
    }
    while (v46);
  }
  v48 = flatbuffers::FlatBufferBuilder::EndVector(v60, v44);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v60);
  *((_BYTE *)v60 + 70) = 1;
  v49 = *((_DWORD *)v60 + 8);
  v50 = *((_DWORD *)v60 + 12);
  v51 = *((_DWORD *)v60 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 6, v58);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 8, v57);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v60, 10, v56);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v60, 12, v55);
  if (v48)
  {
    v52 = flatbuffers::FlatBufferBuilder::ReferTo(v60, v48);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v60, 14, v52);
  }
  v53.var0 = flatbuffers::FlatBufferBuilder::EndTable(v60, v49 - v50 + v51);
  if (v24)
    operator delete(v24);
  return v53;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::CorrectionsValidatorResponse> v2;
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
  v2.var0 = -[QSSCorrectionsValidatorResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__QSSCorrectionsValidatorResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__47__QSSCorrectionsValidatorResponse_flatbuffData__block_invoke(uint64_t a1)
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
