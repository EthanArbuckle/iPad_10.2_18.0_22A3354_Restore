@implementation QSSItnResponse

- (QSSItnResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSItnResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSItnResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSItnResponse)initWithFlatbuffData:(id)a3 root:(const ItnResponse *)a4
{
  return -[QSSItnResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSItnResponse)initWithFlatbuffData:(id)a3 root:(const ItnResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSItnResponse *v10;
  QSSItnResponse *v11;
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
  QSSItnResponse *v38;
  uint64_t v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  char v44;
  objc_super v45;

  v5 = a5;
  v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)QSSItnResponse;
  v10 = -[QSSItnResponse init](&v45, sel_init);
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
    a4 = (const ItnResponse *)v13 + *v13;
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
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::RecognitionPhraseTokens>((flatbuffers::Verifier *)&v40, v33))goto LABEL_54;
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
  const ItnResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ItnResponse *v6;

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
  const ItnResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ItnResponse *v6;

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
  const ItnResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ItnResponse *v6;

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
  const ItnResponse *root;
  const ItnResponse *v3;
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
  const ItnResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ItnResponse *v6;

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

- (NSArray)formatted_words_list
{
  void *v3;
  const ItnResponse *root;
  const ItnResponse *v5;
  uint64_t v6;
  const ItnResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const ItnResponse *v10;
  uint64_t v11;
  QSSRecognitionPhraseTokens *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("formatted_words_list"));
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
            v12 = -[QSSRecognitionPhraseTokens initWithFlatbuffData:root:verify:]([QSSRecognitionPhraseTokens alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("formatted_words_list"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::ItnResponse>)addObjectToBuffer:(void *)a3
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
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int *begin;
  uint64_t v26;
  int *value;
  uint64_t i;
  int v29;
  int v30;
  std::vector<int>::pointer end;
  int *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int *v37;
  int v38;
  int *v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  Offset<siri::speech::schema_fb::ItnResponse> v44;
  unsigned int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int String;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  std::vector<int> v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[QSSItnResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSItnResponse session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v49 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[QSSItnResponse language](self, "language");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v48 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v47 = -[QSSItnResponse return_code](self, "return_code");
  -[QSSItnResponse return_str](self, "return_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24E246F88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v20 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  memset(&v56, 0, sizeof(v56));
  -[QSSItnResponse formatted_words_list](self, "formatted_words_list");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, objc_msgSend(v21, "count"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[QSSItnResponse formatted_words_list](self, "formatted_words_list");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a3;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v46 = v20;
  begin = v56.__begin_;
  if (v24)
  {
    v26 = *(_QWORD *)v53;
    value = v56.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v53 != v26)
          objc_enumerationMutation(v22);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "addObjectToBuffer:", v23);
        v30 = v29;
        end = v56.__end_;
        if (v56.__end_ >= value)
        {
          v33 = v56.__end_ - begin;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
          {
            v56.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v34)
            v34 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v34;
          if (v35)
            v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v35);
          else
            v36 = 0;
          v37 = (int *)(v35 + 4 * v33);
          *v37 = v30;
          v32 = v37 + 1;
          while (end != begin)
          {
            v38 = *--end;
            *--v37 = v38;
          }
          value = (int *)(v35 + 4 * v36);
          v56.__end_ = v32;
          if (begin)
            operator delete(begin);
          begin = v37;
          v23 = a3;
        }
        else
        {
          *v56.__end_ = v29;
          v32 = end + 1;
        }
        v56.__end_ = v32;
      }
      v56.__end_cap_.__value_ = value;
      v56.__begin_ = begin;
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v24);
  }
  else
  {
    v32 = v56.__end_;
  }

  if (v32 == begin)
    v39 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionPhraseTokens>> const&)::t;
  else
    v39 = begin;
  v40 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v39, v32 - begin);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v41 = *((_DWORD *)a3 + 8);
  v42 = *((_DWORD *)a3 + 12);
  v43 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v48);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v47);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v40);
  v44.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v41 - v42 + v43);
  if (begin)
  {
    v56.__end_ = begin;
    operator delete(begin);
  }
  return v44;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ItnResponse> v2;
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
  v2.var0 = -[QSSItnResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__QSSItnResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__30__QSSItnResponse_flatbuffData__block_invoke(uint64_t a1)
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
