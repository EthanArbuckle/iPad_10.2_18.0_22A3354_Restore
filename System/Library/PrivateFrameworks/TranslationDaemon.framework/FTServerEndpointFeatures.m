@implementation FTServerEndpointFeatures

- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3
{
  return -[FTServerEndpointFeatures initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTServerEndpointFeatures initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4
{
  return -[FTServerEndpointFeatures initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTServerEndpointFeatures)initWithFlatbuffData:(id)a3 root:(const ServerEndpointFeatures *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTServerEndpointFeatures *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const ServerEndpointFeatures *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::ServerEndpointFeatures *v19;
  FTServerEndpointFeatures *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTServerEndpointFeatures;
  v10 = -[FTServerEndpointFeatures init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ServerEndpointFeatures *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::ServerEndpointFeatures *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::ServerEndpointFeatures::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (int)processed_audio_duration_ms
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)num_of_words
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (int)trailing_silence_duration
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (double)eos_likelihood
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSArray)pause_counts
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pause_counts"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__FTServerEndpointFeatures_pause_counts__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTServerEndpointFeatures pause_counts_enumerateObjectsUsingBlock:](self, "pause_counts_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pause_counts"));

  }
  return (NSArray *)v3;
}

uint64_t __40__FTServerEndpointFeatures_pause_counts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)pause_counts_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v10;
  uint64_t v11;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pause_counts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xDu || (v11 = *(unsigned __int16 *)v10[12].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)root[4 * a3 + 4 + v11 + *(unsigned int *)root[v11].var0].var0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (unint64_t)pause_counts_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pause_counts"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (v8 = *(unsigned __int16 *)v7[12].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)pause_counts_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  unsigned __int8 v18;

  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pause_counts"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      v9 = *(unsigned __int16 *)v8[12].var0;
      if (v9)
      {
        v18 = 0;
        v10 = *(unsigned int *)root[v9].var0;
        v11 = *(unsigned int *)root[v9 + v10].var0;
        if ((_DWORD)v11)
        {
          v12 = 0;
          v13 = 4 * v11 - 4;
          v14 = (uint64_t)&root[v9 + 4 + v10];
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v14 + 4 * v12));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v15, v12, &v18);
            v16 = v18;

            if (v16)
              break;
            ++v12;
            v17 = v13;
            v13 -= 4;
          }
          while (v17);
        }
      }
    }
  }

}

- (double)silence_posterior
{
  const ServerEndpointFeatures *root;
  const ServerEndpointFeatures *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSString)task_name
{
  const ServerEndpointFeatures *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ServerEndpointFeatures *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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

- (NSString)speech_id
{
  const ServerEndpointFeatures *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ServerEndpointFeatures *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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

- (Offset<siri::speech::schema_fb::ServerEndpointFeatures>)addObjectToBuffer:(void *)a3
{
  int v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  int v14;
  std::vector<int>::pointer end;
  int *v16;
  std::vector<int>::pointer begin;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  int *v23;
  int v24;
  const unsigned __int8 *v25;
  int v26;
  double v27;
  double v28;
  __CFString *v29;
  __CFString *v30;
  const char *v31;
  size_t v32;
  int String;
  __CFString *v34;
  __CFString *v35;
  const char *v36;
  size_t v37;
  int v38;
  int v39;
  int v40;
  Offset<siri::speech::schema_fb::ServerEndpointFeatures> v41;
  int v43;
  int v44;
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  std::vector<int> v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = -[FTServerEndpointFeatures processed_audio_duration_ms](self, "processed_audio_duration_ms");
  v45 = -[FTServerEndpointFeatures num_of_words](self, "num_of_words");
  v43 = -[FTServerEndpointFeatures trailing_silence_duration](self, "trailing_silence_duration");
  -[FTServerEndpointFeatures eos_likelihood](self, "eos_likelihood");
  v7 = v6;
  memset(&v50, 0, sizeof(v50));
  -[FTServerEndpointFeatures pause_counts](self, "pause_counts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v5;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v50, objc_msgSend(v8, "count"));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[FTServerEndpointFeatures pause_counts](self, "pause_counts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v9);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "intValue");
        v14 = v13;
        end = v50.__end_;
        if (v50.__end_ >= v50.__end_cap_.__value_)
        {
          begin = v50.__begin_;
          v18 = v50.__end_ - v50.__begin_;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v20 = (char *)v50.__end_cap_.__value_ - (char *)v50.__begin_;
          if (((char *)v50.__end_cap_.__value_ - (char *)v50.__begin_) >> 1 > v19)
            v19 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v50.__end_cap_, v21);
            begin = v50.__begin_;
            end = v50.__end_;
          }
          else
          {
            v22 = 0;
          }
          v23 = (int *)&v22[4 * v18];
          *v23 = v14;
          v16 = v23 + 1;
          while (end != begin)
          {
            v24 = *--end;
            *--v23 = v24;
          }
          v50.__begin_ = v23;
          v50.__end_ = v16;
          v50.__end_cap_.__value_ = (int *)&v22[4 * v21];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v50.__end_ = v13;
          v16 = end + 1;
        }
        v50.__end_ = v16;
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v10);
  }

  if (v50.__end_ == v50.__begin_)
    v25 = (const unsigned __int8 *)&apple::aiml::flatbuffers2::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  else
    v25 = (const unsigned __int8 *)v50.__begin_;
  v26 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<int>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25, v50.__end_ - v50.__begin_);
  -[FTServerEndpointFeatures silence_posterior](self, "silence_posterior");
  v28 = v27;
  -[FTServerEndpointFeatures task_name](self, "task_name");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v29)
    v29 = &stru_251A15610;
  v31 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v29), "UTF8String");
  v32 = strlen(v31);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31, v32);

  -[FTServerEndpointFeatures speech_id](self, "speech_id");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
    v34 = &stru_251A15610;
  v36 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v34), "UTF8String");
  v37 = strlen(v36);
  LODWORD(v36) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v36, v37);

  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_DWORD *)a3 + 8);
  v39 = *((_DWORD *)a3 + 12);
  v40 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 4, v44, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 6, v45, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v43, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 10, v7, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v26);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 14, v28, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, (int)v36);
  v41.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v38 - (unsigned __int16)v39 + v40);
  if (v50.__begin_)
  {
    v50.__end_ = v50.__begin_;
    operator delete(v50.__begin_);
  }
  return v41;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTServerEndpointFeatures addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __40__FTServerEndpointFeatures_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__40__FTServerEndpointFeatures_flatbuffData__block_invoke(uint64_t a1)
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

@end
