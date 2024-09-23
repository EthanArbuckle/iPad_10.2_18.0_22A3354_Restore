@implementation FTLanguageDetectionResponse

- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3
{
  return -[FTLanguageDetectionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTLanguageDetectionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3 root:(const LanguageDetectionResponse *)a4
{
  return -[FTLanguageDetectionResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTLanguageDetectionResponse)initWithFlatbuffData:(id)a3 root:(const LanguageDetectionResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTLanguageDetectionResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const LanguageDetectionResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::LanguageDetectionResponse *v19;
  FTLanguageDetectionResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTLanguageDetectionResponse;
  v10 = -[FTLanguageDetectionResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const LanguageDetectionResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::LanguageDetectionResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::LanguageDetectionResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const LanguageDetectionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LanguageDetectionResponse *v6;

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
  const LanguageDetectionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LanguageDetectionResponse *v6;

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
  const LanguageDetectionResponse *root;
  const LanguageDetectionResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_string
{
  const LanguageDetectionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LanguageDetectionResponse *v6;

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

- (NSString)detected_locale
{
  const LanguageDetectionResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const LanguageDetectionResponse *v6;

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

- (NSArray)predictions
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("predictions"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__FTLanguageDetectionResponse_predictions__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTLanguageDetectionResponse predictions_enumerateObjectsUsingBlock:](self, "predictions_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("predictions"));

  }
  return (NSArray *)v3;
}

uint64_t __42__FTLanguageDetectionResponse_predictions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)predictions_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTLanguageDetectionPrediction *v7;
  FTLanguageDetectionPrediction *v8;
  const LanguageDetectionResponse *root;
  const LanguageDetectionResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("predictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTLanguageDetectionPrediction *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTLanguageDetectionPrediction initWithFlatbuffData:root:verify:]([FTLanguageDetectionPrediction alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)predictions_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const LanguageDetectionResponse *root;
  const LanguageDetectionResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("predictions"));
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

- (void)predictions_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTLanguageDetectionPrediction *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const LanguageDetectionResponse *root;
  const LanguageDetectionResponse *v8;
  uint64_t v9;
  const LanguageDetectionResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTLanguageDetectionPrediction *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTLanguageDetectionPrediction *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("predictions"));
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
            v17 = -[FTLanguageDetectionPrediction initWithFlatbuffData:root:verify:]([FTLanguageDetectionPrediction alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::LanguageDetectionResponse>)addObjectToBuffer:(void *)a3
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
  int v17;
  __CFString *v18;
  __CFString *v19;
  const char *v20;
  size_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  int v28;
  int v29;
  std::vector<int>::pointer end;
  int *v31;
  std::vector<int>::pointer begin;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  char *v37;
  int *v38;
  int v39;
  std::vector<int>::pointer v40;
  int v41;
  int v42;
  int v43;
  int v44;
  Offset<siri::speech::schema_fb::LanguageDetectionResponse> v45;
  int v47;
  int v48;
  int v49;
  int v50;
  int String;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  std::vector<int> v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[FTLanguageDetectionResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTLanguageDetectionResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v50 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  v49 = -[FTLanguageDetectionResponse return_code](self, "return_code");
  -[FTLanguageDetectionResponse return_string](self, "return_string");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v17 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTLanguageDetectionResponse detected_locale](self, "detected_locale");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v18 = &stru_251A15610;
  v20 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
  v21 = strlen(v20);
  v22 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v20, v21);

  memset(&v56, 0, sizeof(v56));
  -[FTLanguageDetectionResponse predictions](self, "predictions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v56, objc_msgSend(v23, "count"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[FTLanguageDetectionResponse predictions](self, "predictions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v22;
  v48 = v17;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v53 != v26)
          objc_enumerationMutation(v24);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v29 = v28;
        end = v56.__end_;
        if (v56.__end_ >= v56.__end_cap_.__value_)
        {
          begin = v56.__begin_;
          v33 = v56.__end_ - v56.__begin_;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v35 = (char *)v56.__end_cap_.__value_ - (char *)v56.__begin_;
          if (((char *)v56.__end_cap_.__value_ - (char *)v56.__begin_) >> 1 > v34)
            v34 = v35 >> 1;
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL)
            v36 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v36 = v34;
          if (v36)
          {
            v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v56.__end_cap_, v36);
            begin = v56.__begin_;
            end = v56.__end_;
          }
          else
          {
            v37 = 0;
          }
          v38 = (int *)&v37[4 * v33];
          *v38 = v29;
          v31 = v38 + 1;
          while (end != begin)
          {
            v39 = *--end;
            *--v38 = v39;
          }
          v56.__begin_ = v38;
          v56.__end_ = v31;
          v56.__end_cap_.__value_ = (int *)&v37[4 * v36];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v56.__end_ = v28;
          v31 = end + 1;
        }
        v56.__end_ = v31;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v25);
  }

  if (v56.__end_ == v56.__begin_)
    v40 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::LanguageDetectionPrediction>> const&)::t;
  else
    v40 = v56.__begin_;
  v41 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v40, v56.__end_ - v56.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v42 = *((_DWORD *)a3 + 8);
  v43 = *((_DWORD *)a3 + 12);
  v44 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v50);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v49, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v48);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v47);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v41);
  v45.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v42 - (unsigned __int16)v43 + v44);
  if (v56.__begin_)
  {
    v56.__end_ = v56.__begin_;
    operator delete(v56.__begin_);
  }
  return v45;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTLanguageDetectionResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __43__FTLanguageDetectionResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTLanguageDetectionResponse_flatbuffData__block_invoke(uint64_t a1)
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
