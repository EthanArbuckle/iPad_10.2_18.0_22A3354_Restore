@implementation FTAudioAnalytics

- (FTAudioAnalytics)initWithFlatbuffData:(id)a3
{
  return -[FTAudioAnalytics initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTAudioAnalytics initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4
{
  return -[FTAudioAnalytics initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTAudioAnalytics *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const AudioAnalytics *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::AudioAnalytics *v19;
  FTAudioAnalytics *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAudioAnalytics;
  v10 = -[FTAudioAnalytics init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const AudioAnalytics *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::AudioAnalytics *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::AudioAnalytics::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSArray)speech_recognition_features
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_recognition_features"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__FTAudioAnalytics_speech_recognition_features__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTAudioAnalytics speech_recognition_features_enumerateObjectsUsingBlock:](self, "speech_recognition_features_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("speech_recognition_features"));

  }
  return (NSArray *)v3;
}

uint64_t __47__FTAudioAnalytics_speech_recognition_features__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)speech_recognition_features_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTAudioAnalytics_SpeechRecognitionFeaturesEntry *v7;
  FTAudioAnalytics_SpeechRecognitionFeaturesEntry *v8;
  const AudioAnalytics *root;
  const AudioAnalytics *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_recognition_features"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 5u || (v11 = *(unsigned __int16 *)v10[4].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTAudioAnalytics_SpeechRecognitionFeaturesEntry initWithFlatbuffData:root:verify:]([FTAudioAnalytics_SpeechRecognitionFeaturesEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)speech_recognition_features_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const AudioAnalytics *root;
  const AudioAnalytics *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_recognition_features"));
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
    if (*(unsigned __int16 *)v7->var0 >= 5u && (v8 = *(unsigned __int16 *)v7[4].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)speech_recognition_features_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTAudioAnalytics_SpeechRecognitionFeaturesEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const AudioAnalytics *root;
  const AudioAnalytics *v8;
  uint64_t v9;
  const AudioAnalytics *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTAudioAnalytics_SpeechRecognitionFeaturesEntry *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTAudioAnalytics_SpeechRecognitionFeaturesEntry *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_recognition_features"));
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
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      v9 = *(unsigned __int16 *)v8[4].var0;
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
            v17 = -[FTAudioAnalytics_SpeechRecognitionFeaturesEntry initWithFlatbuffData:root:verify:]([FTAudioAnalytics_SpeechRecognitionFeaturesEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)acoustic_features
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_features"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTAudioAnalytics_acoustic_features__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTAudioAnalytics acoustic_features_enumerateObjectsUsingBlock:](self, "acoustic_features_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("acoustic_features"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTAudioAnalytics_acoustic_features__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)acoustic_features_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTAudioAnalytics_AcousticFeaturesEntry *v7;
  FTAudioAnalytics_AcousticFeaturesEntry *v8;
  const AudioAnalytics *root;
  const AudioAnalytics *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_features"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTAudioAnalytics_AcousticFeaturesEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTAudioAnalytics_AcousticFeaturesEntry initWithFlatbuffData:root:verify:]([FTAudioAnalytics_AcousticFeaturesEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)acoustic_features_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const AudioAnalytics *root;
  const AudioAnalytics *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_features"));
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
    if (*(unsigned __int16 *)v7->var0 >= 7u && (v8 = *(unsigned __int16 *)v7[6].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)acoustic_features_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTAudioAnalytics_AcousticFeaturesEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const AudioAnalytics *root;
  const AudioAnalytics *v8;
  uint64_t v9;
  const AudioAnalytics *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTAudioAnalytics_AcousticFeaturesEntry *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTAudioAnalytics_AcousticFeaturesEntry *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_features"));
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
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      v9 = *(unsigned __int16 *)v8[6].var0;
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
            v17 = -[FTAudioAnalytics_AcousticFeaturesEntry initWithFlatbuffData:root:verify:]([FTAudioAnalytics_AcousticFeaturesEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::AudioAnalytics>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  int v11;
  std::vector<int>::pointer end;
  int *v13;
  std::vector<int>::pointer begin;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  char *v19;
  int *v20;
  int v21;
  std::vector<int>::pointer v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  int v29;
  int v30;
  std::vector<int>::pointer v31;
  int *v32;
  std::vector<int>::pointer v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  char *v38;
  int *v39;
  int v40;
  std::vector<int>::pointer v41;
  int v42;
  int v43;
  int v44;
  int v45;
  Offset<siri::speech::schema_fb::AudioAnalytics> v46;
  FTAudioAnalytics *v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  std::vector<int> v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  std::vector<int> v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  memset(&v59, 0, sizeof(v59));
  -[FTAudioAnalytics speech_recognition_features](self, "speech_recognition_features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v59, objc_msgSend(v5, "count"));

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[FTAudioAnalytics speech_recognition_features](self, "speech_recognition_features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v11 = v10;
        end = v59.__end_;
        if (v59.__end_ >= v59.__end_cap_.__value_)
        {
          begin = v59.__begin_;
          v15 = v59.__end_ - v59.__begin_;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v17 = (char *)v59.__end_cap_.__value_ - (char *)v59.__begin_;
          if (((char *)v59.__end_cap_.__value_ - (char *)v59.__begin_) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v59.__end_cap_, v18);
            begin = v59.__begin_;
            end = v59.__end_;
          }
          else
          {
            v19 = 0;
          }
          v20 = (int *)&v19[4 * v15];
          *v20 = v11;
          v13 = v20 + 1;
          while (end != begin)
          {
            v21 = *--end;
            *--v20 = v21;
          }
          v59.__begin_ = v20;
          v59.__end_ = v13;
          v59.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v59.__end_ = v10;
          v13 = end + 1;
        }
        v59.__end_ = v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v7);
  }

  if (v59.__end_ == v59.__begin_)
    v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>> const&)::t;
  else
    v22 = v59.__begin_;
  v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v59.__end_ - v59.__begin_);
  memset(&v54, 0, sizeof(v54));
  -[FTAudioAnalytics acoustic_features](v48, "acoustic_features");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v54, objc_msgSend(v24, "count"));

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[FTAudioAnalytics acoustic_features](v48, "acoustic_features");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v25);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v30 = v29;
        v31 = v54.__end_;
        if (v54.__end_ >= v54.__end_cap_.__value_)
        {
          v33 = v54.__begin_;
          v34 = v54.__end_ - v54.__begin_;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v36 = (char *)v54.__end_cap_.__value_ - (char *)v54.__begin_;
          if (((char *)v54.__end_cap_.__value_ - (char *)v54.__begin_) >> 1 > v35)
            v35 = v36 >> 1;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
            v37 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v54.__end_cap_, v37);
            v33 = v54.__begin_;
            v31 = v54.__end_;
          }
          else
          {
            v38 = 0;
          }
          v39 = (int *)&v38[4 * v34];
          *v39 = v30;
          v32 = v39 + 1;
          while (v31 != v33)
          {
            v40 = *--v31;
            *--v39 = v40;
          }
          v54.__begin_ = v39;
          v54.__end_ = v32;
          v54.__end_cap_.__value_ = (int *)&v38[4 * v37];
          if (v33)
            operator delete(v33);
        }
        else
        {
          *v54.__end_ = v29;
          v32 = v31 + 1;
        }
        v54.__end_ = v32;
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v26);
  }

  if (v54.__end_ == v54.__begin_)
    v41 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>> const&)::t;
  else
    v41 = v54.__begin_;
  v42 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v41, v54.__end_ - v54.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v43 = *((_DWORD *)a3 + 8);
  v44 = *((_DWORD *)a3 + 12);
  v45 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v42);
  v46.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v43 - (unsigned __int16)v44 + v45);
  if (v54.__begin_)
  {
    v54.__end_ = v54.__begin_;
    operator delete(v54.__begin_);
  }
  if (v59.__begin_)
  {
    v59.__end_ = v59.__begin_;
    operator delete(v59.__begin_);
  }
  return v46;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTAudioAnalytics addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __32__FTAudioAnalytics_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__32__FTAudioAnalytics_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__63__FTAudioAnalytics_SpeechRecognitionFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTAudioAnalytics_AcousticFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
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
