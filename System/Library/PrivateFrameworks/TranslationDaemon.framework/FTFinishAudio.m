@implementation FTFinishAudio

- (FTFinishAudio)initWithFlatbuffData:(id)a3
{
  return -[FTFinishAudio initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTFinishAudio initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4
{
  return -[FTFinishAudio initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTFinishAudio)initWithFlatbuffData:(id)a3 root:(const FinishAudio *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTFinishAudio *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const FinishAudio *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::FinishAudio *v19;
  FTFinishAudio *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTFinishAudio;
  v10 = -[FTFinishAudio init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const FinishAudio *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::FinishAudio *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::FinishAudio::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
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
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features_at_endpoint"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTFinishAudio_features_at_endpoint__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTFinishAudio features_at_endpoint_enumerateObjectsUsingBlock:](self, "features_at_endpoint_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("features_at_endpoint"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTFinishAudio_features_at_endpoint__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)features_at_endpoint_objectAtIndex:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const FinishAudio *root;
  const FinishAudio *v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features_at_endpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v11 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v11->var0 < 9u || (v12 = *(unsigned __int16 *)v11[8].var0) == 0)
    {
      v9 = 0;
      goto LABEL_8;
    }
    LODWORD(v6) = *(_DWORD *)root[4 * a3 + 4 + v12 + *(unsigned int *)root[v12].var0].var0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_8:

  return v9;
}

- (unint64_t)features_at_endpoint_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const FinishAudio *root;
  const FinishAudio *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features_at_endpoint"));
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
    if (*(unsigned __int16 *)v7->var0 >= 9u && (v8 = *(unsigned __int16 *)v7[8].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)features_at_endpoint_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  double v6;
  void *v7;
  const FinishAudio *root;
  const FinishAudio *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("features_at_endpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);
  }
  else
  {
    root = self->_root;
    v9 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v9->var0 >= 9u)
    {
      v10 = *(unsigned __int16 *)v9[8].var0;
      if (v10)
      {
        v19 = 0;
        v11 = *(unsigned int *)root[v10].var0;
        v12 = *(unsigned int *)root[v10 + v11].var0;
        if ((_DWORD)v12)
        {
          v13 = 0;
          v14 = 4 * v12 - 4;
          v15 = (uint64_t)&root[v10 + 4 + v11];
          do
          {
            LODWORD(v6) = *(_DWORD *)(v15 + 4 * v13);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v16, v13, &v19);
            v17 = v19;

            if (v17)
              break;
            ++v13;
            v18 = v14;
            v14 -= 4;
          }
          while (v18);
        }
      }
    }
  }

}

- (NSArray)server_feature_latency_distribution
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("server_feature_latency_distribution"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__FTFinishAudio_server_feature_latency_distribution__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTFinishAudio server_feature_latency_distribution_enumerateObjectsUsingBlock:](self, "server_feature_latency_distribution_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("server_feature_latency_distribution"));

  }
  return (NSArray *)v3;
}

uint64_t __52__FTFinishAudio_server_feature_latency_distribution__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)server_feature_latency_distribution_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTFinishAudio_ServerFeatureLatencyDistributionEntry *v7;
  FTFinishAudio_ServerFeatureLatencyDistributionEntry *v8;
  const FinishAudio *root;
  const FinishAudio *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("server_feature_latency_distribution"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTFinishAudio_ServerFeatureLatencyDistributionEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTFinishAudio_ServerFeatureLatencyDistributionEntry initWithFlatbuffData:root:verify:]([FTFinishAudio_ServerFeatureLatencyDistributionEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)server_feature_latency_distribution_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const FinishAudio *root;
  const FinishAudio *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("server_feature_latency_distribution"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (v8 = *(unsigned __int16 *)v7[10].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)server_feature_latency_distribution_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTFinishAudio_ServerFeatureLatencyDistributionEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const FinishAudio *root;
  const FinishAudio *v8;
  uint64_t v9;
  const FinishAudio *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTFinishAudio_ServerFeatureLatencyDistributionEntry *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTFinishAudio_ServerFeatureLatencyDistributionEntry *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("server_feature_latency_distribution"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      v9 = *(unsigned __int16 *)v8[10].var0;
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
            v17 = -[FTFinishAudio_ServerFeatureLatencyDistributionEntry initWithFlatbuffData:root:verify:]([FTFinishAudio_ServerFeatureLatencyDistributionEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::FinishAudio>)addObjectToBuffer:(void *)a3
{
  float v5;
  float v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  int v23;
  const unsigned __int8 *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  int v31;
  int v32;
  std::vector<int>::pointer end;
  int *v34;
  std::vector<int>::pointer begin;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  char *v40;
  int *v41;
  int v42;
  std::vector<int>::pointer v43;
  int v44;
  int v45;
  int v46;
  int v47;
  Offset<siri::speech::schema_fb::FinishAudio> v48;
  int v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  std::vector<int> v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *__p;
  char *v62;
  char *v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v51 = -[FTFinishAudio packet_count](self, "packet_count");
  -[FTFinishAudio total_audio_recorded_seconds](self, "total_audio_recorded_seconds");
  v6 = v5;
  __p = 0;
  v62 = 0;
  v63 = 0;
  -[FTFinishAudio features_at_endpoint](self, "features_at_endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<float>::reserve(&__p, objc_msgSend(v7, "count"));

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[FTFinishAudio features_at_endpoint](self, "features_at_endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "floatValue");
        v13 = v12;
        v14 = v62;
        if (v62 >= v63)
        {
          v16 = (char *)__p;
          v17 = (v62 - (_BYTE *)__p) >> 2;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v19 = v63 - (_BYTE *)__p;
          if ((v63 - (_BYTE *)__p) >> 1 > v18)
            v18 = v19 >> 1;
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v18;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v63, v20);
            v16 = (char *)__p;
            v14 = v62;
          }
          else
          {
            v21 = 0;
          }
          v22 = &v21[4 * v17];
          *(_DWORD *)v22 = v13;
          v15 = v22 + 4;
          while (v14 != v16)
          {
            v23 = *((_DWORD *)v14 - 1);
            v14 -= 4;
            *((_DWORD *)v22 - 1) = v23;
            v22 -= 4;
          }
          __p = v22;
          v62 = v15;
          v63 = &v21[4 * v20];
          if (v16)
            operator delete(v16);
        }
        else
        {
          *(_DWORD *)v62 = v12;
          v15 = v14 + 4;
        }
        v62 = v15;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v9);
  }

  if (v62 == __p)
    v24 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<float,std::allocator<float>>(std::vector<float> const&)::t;
  else
    v24 = (const unsigned __int8 *)__p;
  v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24, (v62 - (_BYTE *)__p) >> 2);
  memset(&v56, 0, sizeof(v56));
  -[FTFinishAudio server_feature_latency_distribution](self, "server_feature_latency_distribution");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, objc_msgSend(v26, "count"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[FTFinishAudio server_feature_latency_distribution](self, "server_feature_latency_distribution");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v25;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(v27);
        v31 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v32 = v31;
        end = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          begin = v56.__begin_;
          v36 = v56.__end_ - v56.__begin_;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v38 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v37)
            v37 = v38 >> 1;
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v37;
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v39);
            begin = v56.__begin_;
            end = v56.__end_;
          }
          else
          {
            v40 = 0;
          }
          v41 = (int *)&v40[4 * v36];
          *v41 = v32;
          v34 = v41 + 1;
          while (end != begin)
          {
            v42 = *--end;
            *--v41 = v42;
          }
          v56.__begin_ = v41;
          v56.__end_ = v34;
          v56.__end_cap_.__value_ = (int *)&v40[4 * v39];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v56.__end_ = v31;
          v34 = end + 1;
        }
        v56.__end_ = v34;
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v28);
  }

  if (v56.__end_ == v56.__begin_)
    v43 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry>> const&)::t;
  else
    v43 = v56.__begin_;
  v44 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v43, v56.__end_ - v56.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v45 = *((_DWORD *)a3 + 8);
  v46 = *((_DWORD *)a3 + 12);
  v47 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 4, v51, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((char *)a3, 6, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v50);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v44);
  v48.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v45 - (unsigned __int16)v46 + v47);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  if (__p)
  {
    v62 = (char *)__p;
    operator delete(__p);
  }
  return v48;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTFinishAudio addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __29__FTFinishAudio_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__29__FTFinishAudio_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__67__FTFinishAudio_ServerFeatureLatencyDistributionEntry_flatbuffData__block_invoke(uint64_t a1)
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
