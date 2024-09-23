@implementation QSSFinishAudio

- (QSSFinishAudio)initWithFlatbuffData:(id)a3
{
  return -[QSSFinishAudio initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSFinishAudio initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4
{
  return -[QSSFinishAudio initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSFinishAudio *v10;
  QSSFinishAudio *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::FinishAudio *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSFinishAudio *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSFinishAudio;
  v10 = -[QSSFinishAudio init](&v30, sel_init);
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
      a4 = (const FinishAudio *)v13 + *v13;
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
      root = (siri::speech::schema_fb::FinishAudio *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::FinishAudio::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (int)packet_count
{
  const FinishAudio *root;
  const FinishAudio *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (float)total_audio_recorded_seconds
{
  const FinishAudio *root;
  const FinishAudio *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (NSArray)features_at_endpoint
{
  void *v3;
  double v4;
  const FinishAudio *root;
  const FinishAudio *v6;
  uint64_t v7;
  const FinishAudio *v8;
  uint64_t v9;
  uint64_t v10;
  const FinishAudio *v11;
  uint64_t v12;
  void *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features_at_endpoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 9u)
    {
      v7 = *(unsigned __int16 *)v6[8].var0;
      if (v7)
      {
        v8 = &root[v7];
        v9 = *(unsigned int *)v8->var0;
        v11 = &v8[v9 + 4];
        v10 = *(unsigned int *)v8[v9].var0;
        if ((_DWORD)v10)
        {
          v12 = 4 * v10;
          do
          {
            LODWORD(v4) = *(_DWORD *)v11->var0;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13);

            v11 += 4;
            v12 -= 4;
          }
          while (v12);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("features_at_endpoint"));
  }
  return (NSArray *)v3;
}

- (NSArray)server_feature_latency_distribution
{
  void *v3;
  const FinishAudio *root;
  const FinishAudio *v5;
  uint64_t v6;
  const FinishAudio *v7;
  uint64_t v8;
  uint64_t v9;
  const FinishAudio *v10;
  uint64_t v11;
  QSSFinishAudio_ServerFeatureLatencyDistributionEntry *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("server_feature_latency_distribution"));
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
            v12 = -[QSSFinishAudio_ServerFeatureLatencyDistributionEntry initWithFlatbuffData:root:verify:]([QSSFinishAudio_ServerFeatureLatencyDistributionEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("server_feature_latency_distribution"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::FinishAudio>)addObjectToBuffer:(void *)a3
{
  float v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  int v14;
  int v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  const void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t j;
  int v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  int v44;
  uint64_t v45;
  flatbuffers::FlatBufferBuilder *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  int v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  Offset<siri::speech::schema_fb::FinishAudio> v57;
  uint64_t v59;
  QSSFinishAudio *v60;
  flatbuffers::FlatBufferBuilder *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *__p;
  char *v71;
  unint64_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  HIDWORD(v59) = -[QSSFinishAudio packet_count](self, "packet_count");
  -[QSSFinishAudio total_audio_recorded_seconds](self, "total_audio_recorded_seconds");
  v6 = v5;
  __p = 0;
  v71 = 0;
  v72 = 0;
  -[QSSFinishAudio features_at_endpoint](self, "features_at_endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<float>::reserve(&__p, objc_msgSend(v7, "count"));

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[QSSFinishAudio features_at_endpoint](self, "features_at_endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  v60 = self;
  v10 = __p;
  if (v9)
  {
    v11 = *(_QWORD *)v67;
    v12 = v72;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v67 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "floatValue");
        v15 = v14;
        v16 = v71;
        if ((unint64_t)v71 >= v12)
        {
          v18 = (v71 - v10) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            __p = v10;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v12 - (_QWORD)v10) >> 1 > v19)
            v19 = (uint64_t)(v12 - (_QWORD)v10) >> 1;
          if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v20);
          else
            v21 = 0;
          v22 = (_DWORD *)(v20 + 4 * v18);
          *v22 = v15;
          v17 = (char *)(v22 + 1);
          while (v16 != v10)
          {
            v23 = *((_DWORD *)v16 - 1);
            v16 -= 4;
            *--v22 = v23;
          }
          v12 = v20 + 4 * v21;
          v71 = v17;
          if (v10)
            operator delete(v10);
          v10 = v22;
        }
        else
        {
          *(_DWORD *)v71 = v14;
          v17 = v16 + 4;
        }
        v71 = v17;
      }
      v72 = v12;
      __p = v10;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v9);
  }
  else
  {
    v17 = v71;
  }

  if (v17 == v10)
    v24 = &flatbuffers::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  else
    v24 = v10;
  v25 = flatbuffers::FlatBufferBuilder::CreateVector<int>((flatbuffers::FlatBufferBuilder *)a3, v24, (v17 - v10) >> 2);
  -[QSSFinishAudio server_feature_latency_distribution](v60, "server_feature_latency_distribution");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  LODWORD(v59) = v25;
  if (v27)
  {
    if (v27 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v27);
    v30 = &v28[4 * v29];
  }
  else
  {
    v28 = 0;
    v30 = 0;
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[QSSFinishAudio server_feature_latency_distribution](v60, "server_feature_latency_distribution");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  v61 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v32)
  {
    v33 = *(_QWORD *)v63;
    v34 = v28;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v31);
        v36 = objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "addObjectToBuffer:", a3, v59);
        v37 = v36;
        if (v34 >= v30)
        {
          v38 = (v34 - v28) >> 2;
          v39 = v38 + 1;
          if ((unint64_t)(v38 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v30 - v28) >> 1 > v39)
            v39 = (v30 - v28) >> 1;
          if ((unint64_t)(v30 - v28) >= 0x7FFFFFFFFFFFFFFCLL)
            v40 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v40 = v39;
          if (v40)
            v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v40);
          else
            v41 = 0;
          v42 = (char *)(v40 + 4 * v38);
          *(_DWORD *)v42 = v37;
          v43 = v42 + 4;
          while (v34 != v28)
          {
            v44 = *((_DWORD *)v34 - 1);
            v34 -= 4;
            *((_DWORD *)v42 - 1) = v44;
            v42 -= 4;
          }
          v30 = (char *)(v40 + 4 * v41);
          if (v28)
            operator delete(v28);
          v28 = v42;
          v34 = v43;
          a3 = v61;
        }
        else
        {
          *(_DWORD *)v34 = v36;
          v34 += 4;
        }
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v32);
  }
  else
  {
    v34 = v28;
  }

  v45 = v34 - v28;
  v46 = (flatbuffers::FlatBufferBuilder *)a3;
  if (v34 == v28)
    v47 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>> const&)::t;
  else
    v47 = v28;
  v48 = v45 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector(v46, v45 >> 2, 4uLL);
  if (v28 == v34)
  {
    LODWORD(v48) = 0;
  }
  else
  {
    v49 = v47 - 4;
    v50 = v48;
    do
    {
      v51 = flatbuffers::FlatBufferBuilder::ReferTo(v61, *(_DWORD *)&v49[4 * v50]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v61, v51);
      --v50;
    }
    while (v50);
  }
  v52 = flatbuffers::FlatBufferBuilder::EndVector(v61, v48);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v61);
  *((_BYTE *)v61 + 70) = 1;
  v53 = *((_DWORD *)v61 + 8);
  v54 = *((_DWORD *)v61 + 12);
  v55 = *((_DWORD *)v61 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 4, SHIDWORD(v59));
  flatbuffers::FlatBufferBuilder::AddElement<float>(v61, 6, v6);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>(v61, 8, v59);
  if (v52)
  {
    v56 = flatbuffers::FlatBufferBuilder::ReferTo(v61, v52);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 10, v56);
  }
  v57.var0 = flatbuffers::FlatBufferBuilder::EndTable(v61, v53 - v54 + v55);
  if (v28)
    operator delete(v28);
  if (__p)
    operator delete(__p);
  return v57;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::FinishAudio> v2;
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
  v2.var0 = -[QSSFinishAudio addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__QSSFinishAudio_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__30__QSSFinishAudio_flatbuffData__block_invoke(uint64_t a1)
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

flatbuffers::DetachedBuffer *__68__QSSFinishAudio_ServerFeatureLatencyDistributionEntry_flatbuffData__block_invoke(uint64_t a1)
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
