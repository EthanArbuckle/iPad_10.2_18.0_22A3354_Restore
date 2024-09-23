@implementation QSSSpeechTranslationMtResponse

- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4
{
  return -[QSSSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSSpeechTranslationMtResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationMtResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSSpeechTranslationMtResponse *v10;
  QSSSpeechTranslationMtResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::SpeechTranslationMtResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSSpeechTranslationMtResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSSpeechTranslationMtResponse;
  v10 = -[QSSSpeechTranslationMtResponse init](&v30, sel_init);
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
      a4 = (const SpeechTranslationMtResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::SpeechTranslationMtResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::SpeechTranslationMtResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)conversation_id
{
  const SpeechTranslationMtResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationMtResponse *v6;

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

- (NSString)request_id
{
  const SpeechTranslationMtResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationMtResponse *v6;

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

- (int)return_code
{
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const SpeechTranslationMtResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SpeechTranslationMtResponse *v6;

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

- (QSSTranslationLocalePair)translation_locale_pair
{
  QSSTranslationLocalePair *v3;
  QSSTranslationLocalePair *v4;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v6;
  uint64_t v7;
  const SpeechTranslationMtResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_locale_pair"));
  v3 = (QSSTranslationLocalePair *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTranslationLocalePair alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTranslationLocalePair initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_locale_pair"));
  }
  return v3;
}

- (NSArray)n_best_translated_phrases
{
  void *v3;
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v5;
  uint64_t v6;
  const SpeechTranslationMtResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const SpeechTranslationMtResponse *v10;
  uint64_t v11;
  QSSSpeechTranslationMtResponse_TranslationPhrase *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
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
            v12 = -[QSSSpeechTranslationMtResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([QSSSpeechTranslationMtResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_translated_phrases"));
  }
  return (NSArray *)v3;
}

- (BOOL)is_final
{
  const SpeechTranslationMtResponse *root;
  const SpeechTranslationMtResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::SpeechTranslationMtResponse>)addObjectToBuffer:(void *)a3
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
  void *v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t i;
  int v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  int v36;
  uint64_t v37;
  flatbuffers::FlatBufferBuilder *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  Offset<siri::speech::schema_fb::SpeechTranslationMtResponse> v50;
  unsigned int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  unsigned int String;
  QSSSpeechTranslationMtResponse *v57;
  flatbuffers::FlatBufferBuilder *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[QSSSpeechTranslationMtResponse conversation_id](self, "conversation_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSSpeechTranslationMtResponse request_id](self, "request_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24E246F88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  v54 = -[QSSSpeechTranslationMtResponse return_code](self, "return_code");
  -[QSSSpeechTranslationMtResponse return_str](self, "return_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_24E246F88;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  -[QSSSpeechTranslationMtResponse translation_locale_pair](self, "translation_locale_pair");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v17, "addObjectToBuffer:", a3);

  -[QSSSpeechTranslationMtResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  if (v19)
  {
    if (v19 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
    v22 = &v20[4 * v21];
  }
  else
  {
    v20 = 0;
    v22 = 0;
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[QSSSpeechTranslationMtResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  v57 = self;
  v58 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v24)
  {
    v25 = *(_QWORD *)v60;
    v26 = v20;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v60 != v25)
          objc_enumerationMutation(v23);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v29 = v28;
        if (v26 >= v22)
        {
          v30 = (v26 - v20) >> 2;
          v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v22 - v20) >> 1 > v31)
            v31 = (v22 - v20) >> 1;
          if ((unint64_t)(v22 - v20) >= 0x7FFFFFFFFFFFFFFCLL)
            v32 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v32 = v31;
          if (v32)
            v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v32);
          else
            v33 = 0;
          v34 = (char *)(v32 + 4 * v30);
          *(_DWORD *)v34 = v29;
          v35 = v34 + 4;
          while (v26 != v20)
          {
            v36 = *((_DWORD *)v26 - 1);
            v26 -= 4;
            *((_DWORD *)v34 - 1) = v36;
            v34 -= 4;
          }
          v22 = (char *)(v32 + 4 * v33);
          if (v20)
            operator delete(v20);
          v20 = v34;
          v26 = v35;
          a3 = v58;
        }
        else
        {
          *(_DWORD *)v26 = v28;
          v26 += 4;
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v24);
  }
  else
  {
    v26 = v20;
  }

  v37 = v26 - v20;
  v38 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v26 == v20)
    v39 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::SpeechTranslationMtResponse_::TranslationPhrase>> const&)::t;
  else
    v39 = v20;
  v40 = v37 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v38, v37 >> 2, 4uLL);
  if (v20 == v26)
  {
    LODWORD(v40) = 0;
  }
  else
  {
    v41 = v39 - 4;
    v42 = v40;
    do
    {
      v43 = flatbuffers::FlatBufferBuilder::ReferTo(v58, *(_DWORD *)&v41[4 * v42]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v58, v43);
      --v42;
    }
    while (v42);
  }
  v44 = flatbuffers::FlatBufferBuilder::EndVector(v58, v40);
  v45 = -[QSSSpeechTranslationMtResponse is_final](v57, "is_final");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v58);
  *((_BYTE *)v58 + 70) = 1;
  v46 = *((_DWORD *)v58 + 8);
  v47 = *((_DWORD *)v58 + 12);
  v48 = *((_DWORD *)v58 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 6, v55);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v58, 8, v54);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 10, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v58, 12, v52);
  if (v44)
  {
    v49 = flatbuffers::FlatBufferBuilder::ReferTo(v58, v44);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v58, 14, v49);
  }
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>(v58, 16, v45);
  v50.var0 = flatbuffers::FlatBufferBuilder::EndTable(v58, v46 - v47 + v48);
  if (v20)
    operator delete(v20);
  return v50;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::SpeechTranslationMtResponse> v2;
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
  v2.var0 = -[QSSSpeechTranslationMtResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__QSSSpeechTranslationMtResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__46__QSSSpeechTranslationMtResponse_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__64__QSSSpeechTranslationMtResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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
