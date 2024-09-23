@implementation FTTextToSpeechSpeechFeatureRequest

- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechSpeechFeatureRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechSpeechFeatureRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4
{
  return -[FTTextToSpeechSpeechFeatureRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTextToSpeechSpeechFeatureRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTextToSpeechSpeechFeatureRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechSpeechFeatureRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest *v19;
  FTTextToSpeechSpeechFeatureRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechSpeechFeatureRequest;
  v10 = -[FTTextToSpeechSpeechFeatureRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechSpeechFeatureRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const TextToSpeechSpeechFeatureRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureRequest *v6;

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
  const TextToSpeechSpeechFeatureRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureRequest *v6;

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

- (FTTextToSpeechSpeechFeatureModelIdentifier)model_id
{
  FTTextToSpeechSpeechFeatureModelIdentifier *v3;
  FTTextToSpeechSpeechFeatureModelIdentifier *v4;
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v6;
  uint64_t v7;
  const TextToSpeechSpeechFeatureRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("model_id"));
  v3 = (FTTextToSpeechSpeechFeatureModelIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechSpeechFeatureModelIdentifier alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u && (v7 = *(unsigned __int16 *)v6[8].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechSpeechFeatureModelIdentifier initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("model_id"));
  }
  return v3;
}

- (FTTextToSpeechSpeechFeatureInputText)text
{
  FTTextToSpeechSpeechFeatureInputText *v3;
  FTTextToSpeechSpeechFeatureInputText *v4;
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v6;
  uint64_t v7;
  const TextToSpeechSpeechFeatureRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("text"));
  v3 = (FTTextToSpeechSpeechFeatureInputText *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechSpeechFeatureInputText alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechSpeechFeatureInputText initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("text"));
  }
  return v3;
}

- (FTTextToSpeechSpeechFeatureInputWave)wave_data
{
  FTTextToSpeechSpeechFeatureInputWave *v3;
  FTTextToSpeechSpeechFeatureInputWave *v4;
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v6;
  uint64_t v7;
  const TextToSpeechSpeechFeatureRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("wave_data"));
  v3 = (FTTextToSpeechSpeechFeatureInputWave *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTextToSpeechSpeechFeatureInputWave alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTextToSpeechSpeechFeatureInputWave initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("wave_data"));
  }
  return v3;
}

- (NSArray)lexicon
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("lexicon"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__FTTextToSpeechSpeechFeatureRequest_lexicon__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechSpeechFeatureRequest lexicon_enumerateObjectsUsingBlock:](self, "lexicon_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("lexicon"));

  }
  return (NSArray *)v3;
}

uint64_t __45__FTTextToSpeechSpeechFeatureRequest_lexicon__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)lexicon_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTextToSpeechSpeechFeatureRequest_LexiconEntry *v7;
  FTTextToSpeechSpeechFeatureRequest_LexiconEntry *v8;
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("lexicon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTextToSpeechSpeechFeatureRequest_LexiconEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xFu || (v11 = *(unsigned __int16 *)v10[14].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTextToSpeechSpeechFeatureRequest_LexiconEntry initWithFlatbuffData:root:verify:]([FTTextToSpeechSpeechFeatureRequest_LexiconEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)lexicon_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("lexicon"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (v8 = *(unsigned __int16 *)v7[14].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)lexicon_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTextToSpeechSpeechFeatureRequest_LexiconEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v8;
  uint64_t v9;
  const TextToSpeechSpeechFeatureRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTextToSpeechSpeechFeatureRequest_LexiconEntry *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTextToSpeechSpeechFeatureRequest_LexiconEntry *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("lexicon"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      v9 = *(unsigned __int16 *)v8[14].var0;
      if (v9)
      {
        v20 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = (uint64_t)&v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 0;
          v16 = 4 * v12 - 4;
          do
          {
            v17 = -[FTTextToSpeechSpeechFeatureRequest_LexiconEntry initWithFlatbuffData:root:verify:]([FTTextToSpeechSpeechFeatureRequest_LexiconEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
            v4[2](v4, v17, v15, &v20);
            v18 = v20;

            if (v18)
              break;
            ++v15;
            v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }

}

- (BOOL)support_homograph
{
  const TextToSpeechSpeechFeatureRequest *root;
  const TextToSpeechSpeechFeatureRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  int String;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  int v24;
  int v25;
  std::vector<int>::pointer end;
  int *v27;
  std::vector<int>::pointer begin;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  unint64_t v32;
  char *v33;
  int *v34;
  int v35;
  std::vector<int>::pointer v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest> v42;
  int v44;
  int v45;
  int v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  std::vector<int> v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[FTTextToSpeechSpeechFeatureRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTTextToSpeechSpeechFeatureRequest session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_251A15610;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);

  -[FTTextToSpeechSpeechFeatureRequest model_id](self, "model_id");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v15, "addObjectToBuffer:", a3);

  -[FTTextToSpeechSpeechFeatureRequest text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  -[FTTextToSpeechSpeechFeatureRequest wave_data](self, "wave_data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  memset(&v52, 0, sizeof(v52));
  -[FTTextToSpeechSpeechFeatureRequest lexicon](self, "lexicon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v52, objc_msgSend(v19, "count"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[FTTextToSpeechSpeechFeatureRequest lexicon](self, "lexicon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v17;
  v46 = (int)v12;
  v47 = v14;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v20);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v25 = v24;
        end = v52.__end_;
        if (v52.__end_ >= v52.__end_cap_.__value_)
        {
          begin = v52.__begin_;
          v29 = v52.__end_ - v52.__begin_;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v31 = (char *)v52.__end_cap_.__value_ - (char *)v52.__begin_;
          if (((char *)v52.__end_cap_.__value_ - (char *)v52.__begin_) >> 1 > v30)
            v30 = v31 >> 1;
          if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL)
            v32 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v32 = v30;
          if (v32)
          {
            v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v52.__end_cap_, v32);
            begin = v52.__begin_;
            end = v52.__end_;
          }
          else
          {
            v33 = 0;
          }
          v34 = (int *)&v33[4 * v29];
          *v34 = v25;
          v27 = v34 + 1;
          while (end != begin)
          {
            v35 = *--end;
            *--v34 = v35;
          }
          v52.__begin_ = v34;
          v52.__end_ = v27;
          v52.__end_cap_.__value_ = (int *)&v33[4 * v32];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v52.__end_ = v24;
          v27 = end + 1;
        }
        v52.__end_ = v27;
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v21);
  }

  if (v52.__end_ == v52.__begin_)
    v36 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest_::LexiconEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest_::LexiconEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureRequest_::LexiconEntry>> const&)::t;
  else
    v36 = v52.__begin_;
  v37 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v36, v52.__end_ - v52.__begin_);
  v38 = -[FTTextToSpeechSpeechFeatureRequest support_homograph](self, "support_homograph");
  *((_BYTE *)a3 + 70) = 1;
  v39 = *((_DWORD *)a3 + 8);
  v40 = *((_DWORD *)a3 + 12);
  v41 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v47);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v46);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v45);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v44);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v37);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 16, v38, 0);
  v42.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v39 - (unsigned __int16)v40 + v41);
  if (v52.__begin_)
  {
    v52.__end_ = v52.__begin_;
    operator delete(v52.__begin_);
  }
  return v42;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTextToSpeechSpeechFeatureRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __50__FTTextToSpeechSpeechFeatureRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__50__FTTextToSpeechSpeechFeatureRequest_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__63__FTTextToSpeechSpeechFeatureRequest_LexiconEntry_flatbuffData__block_invoke(uint64_t a1)
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

@end
