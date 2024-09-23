@implementation FTSpeechTranslationInfo

- (FTSpeechTranslationInfo)initWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTSpeechTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationInfo *)a4
{
  return -[FTSpeechTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTSpeechTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationInfo *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTSpeechTranslationInfo *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SpeechTranslationInfo *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::SpeechTranslationInfo *v19;
  FTSpeechTranslationInfo *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSpeechTranslationInfo;
  v10 = -[FTSpeechTranslationInfo init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SpeechTranslationInfo *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SpeechTranslationInfo *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::SpeechTranslationInfo::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTRecognitionSausage)raw_sausage
{
  FTRecognitionSausage *v3;
  FTRecognitionSausage *v4;
  const SpeechTranslationInfo *root;
  const SpeechTranslationInfo *v6;
  uint64_t v7;
  const SpeechTranslationInfo *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_sausage"));
  v3 = (FTRecognitionSausage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("raw_sausage"));
  }
  return v3;
}

- (NSArray)raw_nbest_choices
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__FTSpeechTranslationInfo_raw_nbest_choices__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSpeechTranslationInfo raw_nbest_choices_enumerateObjectsUsingBlock:](self, "raw_nbest_choices_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("raw_nbest_choices"));

  }
  return (NSArray *)v3;
}

uint64_t __44__FTSpeechTranslationInfo_raw_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)raw_nbest_choices_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRecognitionChoice *v7;
  FTRecognitionChoice *v8;
  const SpeechTranslationInfo *root;
  const SpeechTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRecognitionChoice *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTRecognitionChoice initWithFlatbuffData:root:verify:]([FTRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)raw_nbest_choices_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SpeechTranslationInfo *root;
  const SpeechTranslationInfo *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
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

- (void)raw_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SpeechTranslationInfo *root;
  const SpeechTranslationInfo *v8;
  uint64_t v9;
  const SpeechTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRecognitionChoice *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
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
            v17 = -[FTRecognitionChoice initWithFlatbuffData:root:verify:]([FTRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::SpeechTranslationInfo>)addObjectToBuffer:(void *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  std::vector<int>::pointer end;
  int *v15;
  std::vector<int>::pointer begin;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char *v21;
  int *v22;
  int v23;
  std::vector<int>::pointer v24;
  int v25;
  int v26;
  int v27;
  int v28;
  Offset<siri::speech::schema_fb::SpeechTranslationInfo> v29;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  std::vector<int> v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[FTSpeechTranslationInfo raw_sausage](self, "raw_sausage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  memset(&v36, 0, sizeof(v36));
  -[FTSpeechTranslationInfo raw_nbest_choices](self, "raw_nbest_choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v36, objc_msgSend(v7, "count"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[FTSpeechTranslationInfo raw_nbest_choices](self, "raw_nbest_choices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v13 = v12;
        end = v36.__end_;
        if (v36.__end_ >= v36.__end_cap_.__value_)
        {
          begin = v36.__begin_;
          v17 = v36.__end_ - v36.__begin_;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v19 = (char *)v36.__end_cap_.__value_ - (char *)v36.__begin_;
          if (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 1 > v18)
            v18 = v19 >> 1;
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v18;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v36.__end_cap_, v20);
            begin = v36.__begin_;
            end = v36.__end_;
          }
          else
          {
            v21 = 0;
          }
          v22 = (int *)&v21[4 * v17];
          *v22 = v13;
          v15 = v22 + 1;
          while (end != begin)
          {
            v23 = *--end;
            *--v22 = v23;
          }
          v36.__begin_ = v22;
          v36.__end_ = v15;
          v36.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v36.__end_ = v12;
          v15 = end + 1;
        }
        v36.__end_ = v15;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  if (v36.__end_ == v36.__begin_)
    v24 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v24 = v36.__begin_;
  v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, v36.__end_ - v36.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v26 = *((_DWORD *)a3 + 8);
  v27 = *((_DWORD *)a3 + 12);
  v28 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v31);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v25);
  v29.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v26 - (unsigned __int16)v27 + v28);
  if (v36.__begin_)
  {
    v36.__end_ = v36.__begin_;
    operator delete(v36.__begin_);
  }
  return v29;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTSpeechTranslationInfo addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __39__FTSpeechTranslationInfo_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__39__FTSpeechTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
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
