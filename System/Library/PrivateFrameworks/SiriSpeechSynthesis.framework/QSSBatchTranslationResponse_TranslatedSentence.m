@implementation QSSBatchTranslationResponse_TranslatedSentence

- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4
{
  return -[QSSBatchTranslationResponse_TranslatedSentence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSBatchTranslationResponse_TranslatedSentence)initWithFlatbuffData:(id)a3 root:(const TranslatedSentence *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSBatchTranslationResponse_TranslatedSentence *v10;
  QSSBatchTranslationResponse_TranslatedSentence *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSBatchTranslationResponse_TranslatedSentence *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSBatchTranslationResponse_TranslatedSentence;
  v10 = -[QSSBatchTranslationResponse_TranslatedSentence init](&v30, sel_init);
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
      a4 = (const TranslatedSentence *)v13 + *v13;
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
      root = (siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (QSSSpan)source_span
{
  QSSSpan *v3;
  QSSSpan *v4;
  const TranslatedSentence *root;
  const TranslatedSentence *v6;
  uint64_t v7;
  const TranslatedSentence *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("source_span"));
  v3 = (QSSSpan *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSSpan alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSSpan initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("source_span"));
  }
  return v3;
}

- (NSString)engine_input
{
  const TranslatedSentence *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslatedSentence *v6;

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

- (QSSSpan)target_span
{
  QSSSpan *v3;
  QSSSpan *v4;
  const TranslatedSentence *root;
  const TranslatedSentence *v6;
  uint64_t v7;
  const TranslatedSentence *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("target_span"));
  v3 = (QSSSpan *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSSpan alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (v7 = *(unsigned __int16 *)v6[8].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSSpan initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("target_span"));
  }
  return v3;
}

- (NSArray)n_best_choices
{
  void *v3;
  const TranslatedSentence *root;
  const TranslatedSentence *v5;
  uint64_t v6;
  const TranslatedSentence *v7;
  uint64_t v8;
  uint64_t v9;
  const TranslatedSentence *v10;
  uint64_t v11;
  QSSBatchTranslationResponse_TranslationPhrase *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_choices"));
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
            v12 = -[QSSBatchTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([QSSBatchTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_choices"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence>)addObjectToBuffer:(void *)a3
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  const char *v8;
  size_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t i;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  int v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence> v42;
  unsigned int v44;
  unsigned int String;
  unsigned int v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  -[QSSBatchTranslationResponse_TranslatedSentence source_span](self, "source_span");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[QSSBatchTranslationResponse_TranslatedSentence engine_input](self, "engine_input");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_24E246F88;
  v8 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
  v9 = strlen(v8);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v8, v9);

  -[QSSBatchTranslationResponse_TranslatedSentence target_span](self, "target_span");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  -[QSSBatchTranslationResponse_TranslatedSentence n_best_choices](self, "n_best_choices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    if (v12 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v12);
    v15 = &v13[4 * v14];
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[QSSBatchTranslationResponse_TranslatedSentence n_best_choices](self, "n_best_choices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v49;
    v19 = v13;
    v47 = v16;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v16);
        v21 = a3;
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v23 = v22;
        if (v19 >= v15)
        {
          v24 = (v19 - v13) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v15 - v13) >> 1 > v25)
            v25 = (v15 - v13) >> 1;
          if ((unint64_t)(v15 - v13) >= 0x7FFFFFFFFFFFFFFCLL)
            v26 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v26 = v25;
          if (v26)
            v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v26);
          else
            v27 = 0;
          v28 = (char *)(v26 + 4 * v24);
          *(_DWORD *)v28 = v23;
          v29 = v28 + 4;
          a3 = v21;
          while (v19 != v13)
          {
            v30 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v28 - 1) = v30;
            v28 -= 4;
          }
          v15 = (char *)(v26 + 4 * v27);
          if (v13)
            operator delete(v13);
          v13 = v28;
          v19 = v29;
          v16 = v47;
        }
        else
        {
          *(_DWORD *)v19 = v22;
          v19 += 4;
          a3 = v21;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v17);
  }
  else
  {
    v19 = v13;
  }

  v31 = v19 - v13;
  if (v19 == v13)
    v32 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslationPhrase>> const&)::t;
  else
    v32 = v13;
  v33 = v31 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v31 >> 2, 4uLL);
  if (v13 == v19)
  {
    LODWORD(v33) = 0;
  }
  else
  {
    v34 = v32 - 4;
    v35 = v33;
    do
    {
      v36 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v34[4 * v35]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v36);
      --v35;
    }
    while (v35);
  }
  v37 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v33);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_DWORD *)a3 + 8);
  v39 = *((_DWORD *)a3 + 12);
  v40 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v44);
  if (v37)
  {
    v41 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v37);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v41);
  }
  v42.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v38 - v39 + v40);
  if (v13)
    operator delete(v13);
  return v42;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::BatchTranslationResponse_::TranslatedSentence> v2;
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
  v2.var0 = -[QSSBatchTranslationResponse_TranslatedSentence addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__QSSBatchTranslationResponse_TranslatedSentence_flatbuffData__block_invoke;
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

@end
