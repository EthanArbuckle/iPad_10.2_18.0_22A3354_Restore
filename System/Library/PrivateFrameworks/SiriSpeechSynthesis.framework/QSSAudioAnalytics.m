@implementation QSSAudioAnalytics

- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3
{
  return -[QSSAudioAnalytics initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSAudioAnalytics initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4
{
  return -[QSSAudioAnalytics initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSAudioAnalytics)initWithFlatbuffData:(id)a3 root:(const AudioAnalytics *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSAudioAnalytics *v10;
  QSSAudioAnalytics *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::AudioAnalytics *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSAudioAnalytics *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSAudioAnalytics;
  v10 = -[QSSAudioAnalytics init](&v30, sel_init);
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
      a4 = (const AudioAnalytics *)v13 + *v13;
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
      root = (siri::speech::schema_fb::AudioAnalytics *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::AudioAnalytics::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)speech_recognition_features
{
  void *v3;
  const AudioAnalytics *root;
  const AudioAnalytics *v5;
  uint64_t v6;
  const AudioAnalytics *v7;
  uint64_t v8;
  uint64_t v9;
  const AudioAnalytics *v10;
  uint64_t v11;
  QSSAudioAnalytics_SpeechRecognitionFeaturesEntry *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_recognition_features"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      v6 = *(unsigned __int16 *)v5[4].var0;
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
            v12 = -[QSSAudioAnalytics_SpeechRecognitionFeaturesEntry initWithFlatbuffData:root:verify:]([QSSAudioAnalytics_SpeechRecognitionFeaturesEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("speech_recognition_features"));
  }
  return (NSArray *)v3;
}

- (NSArray)acoustic_features
{
  void *v3;
  const AudioAnalytics *root;
  const AudioAnalytics *v5;
  uint64_t v6;
  const AudioAnalytics *v7;
  uint64_t v8;
  uint64_t v9;
  const AudioAnalytics *v10;
  uint64_t v11;
  QSSAudioAnalytics_AcousticFeaturesEntry *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("acoustic_features"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      v6 = *(unsigned __int16 *)v5[6].var0;
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
            v12 = -[QSSAudioAnalytics_AcousticFeaturesEntry initWithFlatbuffData:root:verify:]([QSSAudioAnalytics_AcousticFeaturesEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("acoustic_features"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::AudioAnalytics>)addObjectToBuffer:(void *)a3
{
  void *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t i;
  int v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  int v23;
  uint64_t v24;
  flatbuffers::FlatBufferBuilder *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  int v30;
  void *v31;
  unint64_t v32;
  flatbuffers::FlatBufferBuilder *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t j;
  int v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  uint64_t v50;
  flatbuffers::FlatBufferBuilder *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  int v56;
  unsigned int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  Offset<siri::speech::schema_fb::AudioAnalytics> v63;
  unsigned int v65;
  QSSAudioAnalytics *obj;
  id obja;
  flatbuffers::FlatBufferBuilder *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  -[QSSAudioAnalytics speech_recognition_features](self, "speech_recognition_features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if (v6 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v6);
    v9 = &v7[4 * v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[QSSAudioAnalytics speech_recognition_features](self, "speech_recognition_features");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  obj = self;
  v68 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v11)
  {
    v12 = *(_QWORD *)v74;
    v13 = v7;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v16 = v15;
        if (v13 >= v9)
        {
          v17 = (v13 - v7) >> 2;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v9 - v7) >> 1 > v18)
            v18 = (v9 - v7) >> 1;
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v19);
          else
            v20 = 0;
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          v9 = (char *)(v19 + 4 * v20);
          if (v7)
            operator delete(v7);
          v7 = v21;
          v13 = v22;
          a3 = v68;
        }
        else
        {
          *(_DWORD *)v13 = v15;
          v13 += 4;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v11);
  }
  else
  {
    v13 = v7;
  }

  v24 = v13 - v7;
  v25 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v13 == v7)
    v26 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>> const&)::t;
  else
    v26 = v7;
  v27 = v24 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v25, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v27) = 0;
  }
  else
  {
    v28 = v26 - 4;
    v29 = v27;
    do
    {
      v30 = flatbuffers::FlatBufferBuilder::ReferTo(v68, *(_DWORD *)&v28[4 * v29]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v68, v30);
      --v29;
    }
    while (v29);
  }
  v65 = flatbuffers::FlatBufferBuilder::EndVector(v68, v27);
  -[QSSAudioAnalytics acoustic_features](obj, "acoustic_features");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");
  v33 = v68;
  if (v32)
  {
    if (v32 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v32);
    v36 = &v34[4 * v35];
  }
  else
  {
    v34 = 0;
    v36 = 0;
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[QSSAudioAnalytics acoustic_features](obj, "acoustic_features");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v70;
    v39 = v34;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v70 != v38)
          objc_enumerationMutation(obja);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "addObjectToBuffer:", v33);
        v42 = v41;
        if (v39 >= v36)
        {
          v43 = (v39 - v34) >> 2;
          v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v36 - v34) >> 1 > v44)
            v44 = (v36 - v34) >> 1;
          if ((unint64_t)(v36 - v34) >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v44;
          if (v45)
            v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v45);
          else
            v46 = 0;
          v47 = (char *)(v45 + 4 * v43);
          *(_DWORD *)v47 = v42;
          v48 = v47 + 4;
          while (v39 != v34)
          {
            v49 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *((_DWORD *)v47 - 1) = v49;
            v47 -= 4;
          }
          v36 = (char *)(v45 + 4 * v46);
          if (v34)
            operator delete(v34);
          v34 = v47;
          v39 = v48;
          v33 = v68;
        }
        else
        {
          *(_DWORD *)v39 = v41;
          v39 += 4;
        }
      }
      v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v37);
  }
  else
  {
    v39 = v34;
  }

  v50 = v39 - v34;
  v51 = v33;
  if (v39 == v34)
    v52 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::AudioAnalytics_::AcousticFeaturesEntry>> const&)::t;
  else
    v52 = v34;
  v53 = v50 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v51, v50 >> 2, 4uLL);
  if (v34 == v39)
  {
    LODWORD(v53) = 0;
  }
  else
  {
    v54 = v52 - 4;
    v55 = v53;
    do
    {
      v56 = flatbuffers::FlatBufferBuilder::ReferTo(v68, *(_DWORD *)&v54[4 * v55]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v68, v56);
      --v55;
    }
    while (v55);
  }
  v57 = flatbuffers::FlatBufferBuilder::EndVector(v68, v53);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v68);
  *((_BYTE *)v68 + 70) = 1;
  v58 = *((_DWORD *)v68 + 8);
  v59 = *((_DWORD *)v68 + 12);
  v60 = *((_DWORD *)v68 + 10);
  if (v65)
  {
    v61 = flatbuffers::FlatBufferBuilder::ReferTo(v68, v65);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v68, 4, v61);
  }
  if (v57)
  {
    v62 = flatbuffers::FlatBufferBuilder::ReferTo(v68, v57);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v68, 6, v62);
  }
  v63.var0 = flatbuffers::FlatBufferBuilder::EndTable(v68, v58 - v59 + v60);
  if (v34)
    operator delete(v34);
  if (v7)
    operator delete(v7);
  return v63;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::AudioAnalytics> v2;
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
  v2.var0 = -[QSSAudioAnalytics addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__QSSAudioAnalytics_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__33__QSSAudioAnalytics_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__55__QSSAudioAnalytics_AcousticFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__64__QSSAudioAnalytics_SpeechRecognitionFeaturesEntry_flatbuffData__block_invoke(uint64_t a1)
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
